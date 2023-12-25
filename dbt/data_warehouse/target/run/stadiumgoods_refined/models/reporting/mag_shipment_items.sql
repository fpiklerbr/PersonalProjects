

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_shipment_items`
  
  
  OPTIONS()
  as (
    SELECT
    sfo.mag_order_id
  , CASE
      WHEN order_item.product_type = 'simple' THEN order_item.sales_flat_order_item_id
        WHEN child_item.product_type = 'simple' THEN child_item.sales_flat_order_item_id
        WHEN parent_item.product_type = 'simple' THEN parent_item.sales_flat_order_item_id
        WHEN order_item.product_type = 'configurable' THEN order_item.sales_flat_order_item_id
        WHEN child_item.product_type = 'configurable' THEN child_item.sales_flat_order_item_id
        WHEN parent_item.product_type = 'configurable' THEN parent_item.sales_flat_order_item_id
        END AS order_item_id
  , CASE
      WHEN order_item.product_type = 'simple' THEN order_item.sales_flat_order_item_id
      WHEN child_item.product_type = 'simple' THEN child_item.sales_flat_order_item_id
      WHEN parent_item.product_type = 'simple' THEN parent_item.sales_flat_order_item_id
      END AS simple_item_id
  , CASE
      WHEN order_item.product_type = 'configurable' THEN order_item.sales_flat_order_item_id
      WHEN child_item.product_type = 'configurable' THEN child_item.sales_flat_order_item_id
      WHEN parent_item.product_type = 'configurable' THEN parent_item.sales_flat_order_item_id
      END AS configurable_item_id
  , sfs.mag_shipment_id
  , shipment_item.qty AS shipment_item_qty
  , shipment_track.track_number AS tracking_number
, DATETIME(SAFE_CAST(min(sfs.created_at) AS timestamp), 'America/New_York') AS shipment_creation_nyc
, DATETIME(SAFE_CAST(min(shipment_track.created_at) AS timestamp), 'America/New_York') AS tracking_creation_nyc
  , current_timestamp AS rebuild_timestamp
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_shipment` AS sfs
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo
  ON sfo.sales_flat_order_id = sfs.sales_flat_order_id
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_shipment_item` AS shipment_item
  ON shipment_item.sales_flat_shipment_id = sfs.sales_flat_shipment_id
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS order_item
  ON order_item.sales_flat_order_item_id = shipment_item.sales_flat_order_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_shipment_track` AS shipment_track
  ON shipment_track.sales_flat_shipment_id = sfs.sales_flat_shipment_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS parent_item
  ON parent_item.sales_flat_order_item_id = order_item.parent_sales_flat_order_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS child_item
  ON child_item.parent_sales_flat_order_item_id = order_item.sales_flat_order_item_id
GROUP BY 1, 2, 3, 4, 5, 6, 7
  );
    