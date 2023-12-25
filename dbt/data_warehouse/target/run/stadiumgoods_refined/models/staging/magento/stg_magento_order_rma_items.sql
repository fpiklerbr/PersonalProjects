

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_rma_items`
  OPTIONS()
  as 
 /* break down order_item_id to match several rma lines */

WITH rma_items AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_rma_items`
  WHERE (rma_status <> 'Rejected' AND coalesce(item_qty_requested, 0) > 0)
/*
    OR 


  regexp_contains(order_channel, r'(?i).*farfetch.*')


*/
), rma_tracking AS (

  SELECT DISTINCT
      order_item_id
    , rma_tracking_number
  FROM rma_items, unnest(rma_tracking_numbers) AS rma_tracking_number

), final AS (

  SELECT
      rma_items.order_item_id
    , string_agg(DISTINCT rma_items.mag_rma_id, ', ') AS mag_rma_ids
    , min(rma_items.rma_creation_nyc) AS first_rma_creation_nyc
    , max(rma_items.rma_update_nyc) AS last_rma_update_nyc
    , CASE
        WHEN count(DISTINCT rma_items.mag_rma_id) > 1
        THEN string_agg(DISTINCT substr(
    concat(
    
      coalesce(rma_items.mag_rma_id|| ': ' , '')
    
      , coalesce(rma_items.rma_status|| ': ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(rma_items.mag_rma_id|| ': ' , '')
    
      , coalesce(rma_items.rma_status|| ': ' , '')
    
  )) - length(': ')
      , 0
    )
) , ', ')
        ELSE string_agg(DISTINCT rma_items.rma_status, ', ')
      END AS rma_statuses
    , min(rma_items.item_date_received) AS rma_first_date_received
    , string_agg(DISTINCT rma_tracking.rma_tracking_number, ', ') AS rma_tracking_numbers
    , string_agg(DISTINCT rma_items.item_new_serial_number, ', ') AS house_serial_numbers
    , min(rma_items.rma_package_approved_nyc) AS rma_package_approved_nyc
    , min(rma_items.rma_closed_nyc) AS rma_closed_nyc
    , string_agg(DISTINCT rma_items.last_reply_name, ', ') AS rma_last_reply_name
    , min(rma_items.last_reply_nyc) AS rma_last_reply_nyc
    , max(rma_items.item_qty_requested) AS item_qty_requested
  FROM rma_items
  LEFT JOIN rma_tracking
    ON rma_tracking.order_item_id = rma_items.order_item_id
  GROUP BY 1

)

SELECT * FROM final;

