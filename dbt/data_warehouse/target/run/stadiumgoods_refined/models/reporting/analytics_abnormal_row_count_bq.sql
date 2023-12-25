

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`analytics_abnormal_row_count_bq`
  
  
  OPTIONS()
  as (
    


WITH last_manifest AS (

  SELECT
    manifest
  , JSON_QUERY(manifest, "$.nodes") AS nodes
  -- datetime(time_stamp, 'America/New_York')
  FROM `ff-stadiumgoods-raw-live.meta_dbt.dbt_manifest_json`
  ORDER BY time_stamp DESC
  LIMIT 20

), current_models AS (

  SELECT DISTINCT
    unique_id
  FROM last_manifest, unnest(stadiumgoods_reporting.json_object_keys(nodes)) AS unique_id
  where unique_id in (
      'model.stadiumgoods_refined.stadium_finance_line_transactions'
    , 'model.stadiumgoods_refined.stadium_finance_lines'
    , 'model.stadiumgoods_refined.stadium_order_lines'
    , 'model.stadiumgoods_refined.mag_order_items'
    , 'model.stadiumgoods_refined.stadium_serials'
    , 'model.stadiumgoods_refined.mag_serials'
    , 'model.stadiumgoods_refined.stadium_products'
    , 'model.stadiumgoods_refined.mag_products'
    , 'model.stadiumgoods_refined.stadium_transactions'
  )

), results_extracted AS (

  SELECT
    JSON_EXTRACT_SCALAR(run_results, "$.metadata.invocation_id") AS invocation_id
  , cast(JSON_EXTRACT_SCALAR(run_results, "$.metadata.generated_at") AS timestamp) AS results_generated_at
  , JSON_EXTRACT_ARRAY(run_results, "$.results") AS results
  FROM `ff-stadiumgoods-raw-live.meta_dbt.dbt_run_results_json`
  order by cast(JSON_EXTRACT_SCALAR(run_results, "$.metadata.generated_at") AS timestamp)  desc
  limit 20

), results_details AS (

  SELECT
    invocation_id
  , DATETIME(results_generated_at, 'America/New_York') as results_generated_nyc
  , JSON_EXTRACT_SCALAR(results_unnested, "$.unique_id") AS unique_id
  , JSON_EXTRACT_SCALAR(results_unnested, "$.status") AS status
  , cast(cast(JSON_EXTRACT_SCALAR(results_unnested, "$.execution_time") as numeric)/60 as int64) AS execution_time_min
  , JSON_EXTRACT_SCALAR(results_unnested, "$.execution_time") as execute_time_sec
  , JSON_EXTRACT_SCALAR(results_unnested, "$.message") AS message
  , JSON_EXTRACT_SCALAR(results_unnested, "$.adapter_response.code") AS adapter_response__code
  FROM results_extracted, unnest(results) AS results_unnested

), current_model_results AS (

  SELECT *
  , regexp_extract(message, r'CREATE TABLE \(([0-9]+.*) rows') AS rows_count_string
  , case when regexp_contains(regexp_extract(message, r'CREATE TABLE \(([0-9]+.*) rows'), r'm$')
          then cast(trim(regexp_extract(message, r'CREATE TABLE \(([0-9]+.*) rows'), 'm') as numeric) * 1000000
         when regexp_contains(regexp_extract(message, r'CREATE TABLE \(([0-9]+.*) rows'), r'k$')
          then cast(trim(regexp_extract(message, r'CREATE TABLE \(([0-9]+.*) rows'), 'k') as numeric) * 1000
    end as rows_count_numeric
  FROM results_details
  INNER JOIN current_models
  USING (unique_id)

), comparison as (

  select *
  , lag(rows_count_numeric, 1) over (partition by unique_id
      order by results_generated_nyc asc) as previous_rows_count_numeric
  , (rows_count_numeric - lag(rows_count_numeric, 1) over (partition by unique_id
      order by results_generated_nyc asc))/lag(rows_count_numeric, 1) over (partition by unique_id
      order by results_generated_nyc asc) as increase_ratio
  from current_model_results
  order by results_generated_nyc desc

)

SELECT * FROM comparison
where increase_ratio > 1
  );
    