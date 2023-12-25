

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_lines`
  
  
  OPTIONS()
  as (
    WITH final AS (

  SELECT
      fps_lines.*
    , magento_items.order_item_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines` AS fps_lines
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items` AS magento_items
    ON fps_lines.fps_order_id = magento_items.fps_order_id
    AND fps_lines.farfetch_order_line_id = magento_items.farfetch_order_line_id

)

SELECT * FROM final
  );
    