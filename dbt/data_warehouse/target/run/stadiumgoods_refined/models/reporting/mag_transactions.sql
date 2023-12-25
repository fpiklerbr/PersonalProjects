

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_transactions`
  
  
  OPTIONS()
  as (
    

WITH final AS (

  SELECT
      spt.sales_payment_transaction_id AS transaction_id
    , sfo.sales_flat_order_id AS mag_order_entity_id
    , sfo.mag_order_id
    , sfo.channel AS mag_order_channel
    , sfo.status AS mag_order_status
, DATETIME(SAFE_CAST(spt.created_at AS timestamp), 'America/New_York') AS order_timestamp_nyc
    , sfo.base_grand_total AS order_grand_total
    , sfo.base_total_refunded AS order_total_refunded
    , sfop.method AS payment_method
    , sfop.base_amount_paid AS payment_amount_paid
    , sfop.base_amount_refunded AS payment_amount_refunded
    , spt.parent_transaction_id AS parent_txn_id
    , spt.transaction_id AS txn_id
    , spt.transaction_type AS txn_type
, DATETIME(SAFE_CAST(spt.created_at AS timestamp), 'America/New_York') AS txn_timestamp_nyc
    , spt.is_closed AS txn_is_closed
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_payment_transaction` AS spt
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_payment` AS sfop
    ON sfop.sales_flat_order_id = spt.sales_flat_order_id
    AND sfop.sales_flat_order_payment_id = spt.sales_flat_order_payment_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo
    ON sfo.sales_flat_order_id = sfop.sales_flat_order_id

)

SELECT * FROM final
  );
    