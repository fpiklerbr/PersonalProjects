

WITH manifest_union AS (

  

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocation_nodes`' as 
    string
) as _dbt_source_relation,
                
                    cast(`dbt_invocation_id` as STRING) as `dbt_invocation_id` ,
                    cast(`production_invocation_rank` as INT64) as `production_invocation_rank` ,
                    cast(`manifest_generated_at` as TIMESTAMP) as `manifest_generated_at` ,
                    cast(`resource_id` as STRING) as `resource_id` ,
                    cast(`metadata` as STRING) as `metadata` ,
                    cast(`resource_type` as STRING) as `resource_type` ,
                    cast(`node_name` as STRING) as `node_name` ,
                    cast(`node_alias` as STRING) as `node_alias` ,
                    cast(`database_object` as STRING) as `database_object` ,
                    cast(`database_catalog` as STRING) as `database_catalog` ,
                    cast(`database_schema` as STRING) as `database_schema` ,
                    cast(`depends_on_macros` as STRING) as `depends_on_macros` ,
                    cast(`depends_on_nodes` as STRING) as `depends_on_nodes` ,
                    cast(`fully_qualified_name` as STRING) as `fully_qualified_name` ,
                    cast(`documented_columns` as STRING) as `documented_columns` ,
                    cast(`raw_sql` as STRING) as `raw_sql` ,
                    cast(`dbt_relation` as STRING) as `dbt_relation` ,
                    cast(`database_table` as STRING) as `database_table` ,
                    cast(`relation_type` as STRING) as `relation_type` ,
                    cast(null as STRING) as `source_name` ,
                    cast(null as STRING) as `source_table` ,
                    cast(null as STRING) as `source_identifier` ,
                    cast(null as STRING) as `loaded_at_field` ,
                    cast(null as INT64) as `freshness_warn_after_count` ,
                    cast(null as STRING) as `freshness_warn_after_period` ,
                    cast(null as INT64) as `freshness_error_after_count` ,
                    cast(null as STRING) as `freshness_error_after_period` ,
                    cast(null as STRING) as `loader` ,
                    cast(null as INTERVAL) as `freshness_warning_threshold` ,
                    cast(null as INTERVAL) as `freshness_error_threshold` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocation_nodes`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocation_sources`' as 
    string
) as _dbt_source_relation,
                
                    cast(`dbt_invocation_id` as STRING) as `dbt_invocation_id` ,
                    cast(`production_invocation_rank` as INT64) as `production_invocation_rank` ,
                    cast(`manifest_generated_at` as TIMESTAMP) as `manifest_generated_at` ,
                    cast(`resource_id` as STRING) as `resource_id` ,
                    cast(`metadata` as STRING) as `metadata` ,
                    cast(`resource_type` as STRING) as `resource_type` ,
                    cast(null as STRING) as `node_name` ,
                    cast(null as STRING) as `node_alias` ,
                    cast(`database_object` as STRING) as `database_object` ,
                    cast(`database_catalog` as STRING) as `database_catalog` ,
                    cast(`database_schema` as STRING) as `database_schema` ,
                    cast(null as STRING) as `depends_on_macros` ,
                    cast(null as STRING) as `depends_on_nodes` ,
                    cast(`fully_qualified_name` as STRING) as `fully_qualified_name` ,
                    cast(`documented_columns` as STRING) as `documented_columns` ,
                    cast(null as STRING) as `raw_sql` ,
                    cast(`dbt_relation` as STRING) as `dbt_relation` ,
                    cast(`database_table` as STRING) as `database_table` ,
                    cast(`relation_type` as STRING) as `relation_type` ,
                    cast(`source_name` as STRING) as `source_name` ,
                    cast(`source_table` as STRING) as `source_table` ,
                    cast(`source_identifier` as STRING) as `source_identifier` ,
                    cast(`loaded_at_field` as STRING) as `loaded_at_field` ,
                    cast(`freshness_warn_after_count` as INT64) as `freshness_warn_after_count` ,
                    cast(`freshness_warn_after_period` as STRING) as `freshness_warn_after_period` ,
                    cast(`freshness_error_after_count` as INT64) as `freshness_error_after_count` ,
                    cast(`freshness_error_after_period` as STRING) as `freshness_error_after_period` ,
                    cast(`loader` as STRING) as `loader` ,
                    cast(`freshness_warning_threshold` as INTERVAL) as `freshness_warning_threshold` ,
                    cast(`freshness_error_threshold` as INTERVAL) as `freshness_error_threshold` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocation_sources`
        )

        

), model_runs_grouped AS (

  SELECT
      resource_id
    , avg(cast(model_run_delay_in_seconds AS float64)) AS avg_model_run_delay_in_seconds
    , avg(cast(model_run_duration_in_seconds AS float64)) AS avg_model_run_duration_in_seconds
    , stddev(cast(model_run_duration_in_seconds AS float64)) AS stddev_model_run_duration_in_seconds
    , max(CASE WHEN model_run_status <> 'skipped'  THEN invocation_started_at END) AS last_run_started_at
    , max(CASE WHEN model_run_status = 'success'   THEN invocation_started_at END) AS last_successful_run_started_at
    , max(CASE WHEN model_run_status = 'error'     THEN invocation_started_at END) AS last_failed_run_started_at
    , max(CASE WHEN model_run_status = 'skipped'   THEN invocation_started_at END) AS last_skipped_run_started_at
    , string_agg(CASE WHEN model_run_status = 'error' AND model_status_run_rank = 1 THEN model_run_message END, ', ') AS last_failed_run_message
    , string_agg(CASE WHEN model_run_rank = 1 THEN model_run_status END, ', ') AS last_run_status
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_model_runs_from_artifacts`
  GROUP BY 1

), relations AS (

  SELECT
      resource_id
    , dbt_relation
    , resource_type
    , relation_type
    , database_object
    , database_catalog
    , database_schema
    , database_table
    , fully_qualified_name
    , documented_columns
    , metadata
    , manifest_generated_at
    , source_name
    , source_table
    , source_identifier
    , loader
    , loaded_at_field
    , freshness_warn_after_count
    , freshness_warn_after_period
    , freshness_warning_threshold
    , freshness_error_after_count
    , freshness_error_after_period
    , freshness_error_threshold
    , coalesce(loader, source_name) AS loader_or_source_name
    , CASE source_name
        WHEN 'dss' THEN cast('DSS' AS string)
        WHEN 'magento' THEN cast('Magento' AS string)
        WHEN 'sales_channel' THEN cast('Sales Channel' AS string)
        WHEN 'seller_portal' THEN cast('Seller Portal' AS string)
        WHEN 'x3' THEN cast('X3' AS string)
      END AS sync_source
    , node_name
    , node_alias
    , depends_on_nodes
    , depends_on_macros
    , raw_sql
  FROM manifest_union
  WHERE resource_type IN ('model', 'seed', 'source')
    AND production_invocation_rank = 1

), final AS (

  SELECT
      relations.*
    , model_runs_grouped.avg_model_run_delay_in_seconds
    , model_runs_grouped.avg_model_run_duration_in_seconds
    , model_runs_grouped.stddev_model_run_duration_in_seconds
    , (model_runs_grouped.avg_model_run_duration_in_seconds + 1.5 * coalesce(model_runs_grouped.stddev_model_run_duration_in_seconds, 0)) AS model_stalled_threshold
    , (model_runs_grouped.avg_model_run_duration_in_seconds + 4 * coalesce(model_runs_grouped.stddev_model_run_duration_in_seconds, 0)) AS model_alert_threshold
    , model_runs_grouped.last_run_started_at
    , safe_cast(datetime(safe_cast(model_runs_grouped.last_run_started_at AS timestamp), 'America/New_York') AS datetime) AS last_run_started_at_us_eastern
    , model_runs_grouped.last_successful_run_started_at
    , safe_cast(datetime(safe_cast(model_runs_grouped.last_successful_run_started_at AS timestamp), 'America/New_York') AS datetime) AS last_successful_run_started_at_us_eastern
    , model_runs_grouped.last_failed_run_started_at
    , safe_cast(datetime(safe_cast(model_runs_grouped.last_failed_run_started_at AS timestamp), 'America/New_York') AS datetime) AS last_failed_run_started_at_us_eastern
    , model_runs_grouped.last_skipped_run_started_at
    , safe_cast(datetime(safe_cast(model_runs_grouped.last_skipped_run_started_at AS timestamp), 'America/New_York') AS datetime) AS last_skipped_run_started_at_us_eastern
    , model_runs_grouped.last_failed_run_message
    , model_runs_grouped.last_run_status
  FROM relations
  LEFT JOIN model_runs_grouped
    ON relations.resource_id = model_runs_grouped.resource_id

)

SELECT * FROM final