

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_daily_activity_stadium_daily_checkouts`
  
  
  OPTIONS()
  as (
    SELECT SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) AS today
, SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(payment_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) AS order_date
-- , CASE WHEN channel_or_gateway = 'Tmall' THEN 'Partner Channels' ELSE 'SG Web' END channel_group
, channel_or_gateway channel_detail
, data_source
, checkout_status checkout_type
, sum(payment_amount) total_value
, count(*) transactions
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS stadium_transactions
WHERE payment_timestamp IS NOT NULL 
GROUP BY 1, 2, 3, 4, 5 --, 6
  );
    