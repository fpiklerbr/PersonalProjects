

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items`
  
  
  OPTIONS()
  as (
    

WITH final AS (



  SELECT
      fps_order_id
    , farfetch_order_line_id
    , order_item_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items_by_serial`
  WHERE source = 'serial_number_match'

UNION ALL
  SELECT
      fps_order_id
    , farfetch_order_line_id
    , order_item_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items_by_simple`
  WHERE source = 'simple_product_id_match'

UNION ALL
  SELECT
      fps_order_id
    , farfetch_order_line_id
    , order_item_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items_by_configurable`
  WHERE source = 'configurable_product_id_match'

UNION ALL
  SELECT
      fps_order_id
    , farfetch_order_line_id
    , order_item_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items_by_order`
  WHERE source = 'sales_flat_order_id_match'


)

SELECT * FROM final
  );
    