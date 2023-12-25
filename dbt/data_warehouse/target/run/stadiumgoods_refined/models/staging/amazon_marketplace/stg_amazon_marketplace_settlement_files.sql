

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlement_files`
  OPTIONS()
  as WITH settlement_files AS (

  SELECT
      settlement_id
    , file_name
    , min(file_time) AS min_file_time
    , max(file_time) AS max_file_time
    , count(*) AS transaction_count
    , sum(total_amount) AS total_amount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlement_reports_spapi`
  GROUP BY 1, 2

), final AS (

  SELECT
      *
    , row_number() OVER (PARTITION BY settlement_id) AS settlement_file_priority
  FROM settlement_files

)

SELECT * FROM final;

