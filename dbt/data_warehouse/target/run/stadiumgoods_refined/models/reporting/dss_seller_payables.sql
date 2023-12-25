

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dss_seller_payables`
  
  
  OPTIONS()
  as (
    

SELECT
    CAST(NULL AS string) AS serial_number
  , CAST(NULL AS string) AS x3_sku
  , serial_source AS consignor_id
  , CAST(NULL AS string) AS yseristatus_paid_out_status
  , CAST(NULL AS string) AS yseristatus_consignment_status
  , SAFE_CAST(SAFE_CAST(line_fulfilled_at_nyc AS datetime) AS date) AS yseristatus_issue_date
  , serial_cost AS payout_amount
  , CASE WHEN order_paid_out = 1 THEN SAFE_CAST(SAFE_CAST(line_fulfilled_at_nyc AS datetime) AS date) END AS payout_invoice_date
  , CAST(NULL AS string) AS payout_invoice_id
  , CAST(NULL AS int64) AS payout_invoice_line
  , CASE WHEN order_paid_out = 1 THEN SAFE_CAST(SAFE_CAST(line_fulfilled_at_nyc AS datetime) AS date) END AS payment_date
  , CASE WHEN order_paid_out = 1 THEN serial_cost ELSE 0 END AS payout_paid
  , CASE WHEN order_paid_out = 1 THEN 0 ELSE serial_cost END AS payout_pending
  , current_timestamp AS rebuild_timestamp
  , serial_price AS sales_price
  , serial_price - serial_cost AS commission
  , CAST('DSS' AS string) AS serial_source
  , third_party_name AS consignor_name
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dss_order_lines`
WHERE line_fulfilled_at IS NOT NULL
  );
    