

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_last_payment_by_channel`
  
  
  OPTIONS()
  as (
    

SELECT
  channel_or_gateway
, DATETIME(SAFE_CAST(max(payment_timestamp) AS timestamp), 'America/New_York') AS last_payment_timestamp_nyc
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions`
GROUP BY 1
  );
    