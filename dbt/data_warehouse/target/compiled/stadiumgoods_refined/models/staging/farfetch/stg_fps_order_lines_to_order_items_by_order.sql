WITH fps_no_configurable_product_id_match AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items_by_configurable`
  WHERE source = 'fps_no_configurable_product_id_match'

), mag_no_configurable_product_id_match AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines_to_order_items_by_configurable`
  WHERE source = 'mag_no_configurable_product_id_match'

)



    


, sales_flat_order_id_match AS (

  SELECT DISTINCT
      fps.fps_order_id
    , fps.sales_flat_order_id
    , fps.farfetch_order_line_id
    , fps.configurable_product_id
    , fps.simple_product_id
    , fps.serial_number
    , mag.order_item_id
  FROM fps_no_configurable_product_id_match AS fps
  INNER JOIN mag_no_configurable_product_id_match AS mag
    ON fps.sales_flat_order_id = mag.sales_flat_order_id
    AND fps.sales_flat_order_id = mag.sales_flat_order_id
    AND fps.sales_flat_order_id_row = mag.sales_flat_order_id_row

), fps_no_sales_flat_order_id_match AS (

  SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , sales_flat_order_id_row
    ,
      row_number() OVER (PARTITION BY sales_flat_order_id ORDER BY farfetch_order_line_id)
     AS _row
  FROM fps_no_configurable_product_id_match AS fps
  WHERE NOT EXISTS (
    SELECT *
    FROM sales_flat_order_id_match
    WHERE farfetch_order_line_id = fps.farfetch_order_line_id
      AND fps_order_id = fps.fps_order_id
  )

), mag_no_sales_flat_order_id_match AS (

  SELECT
      sales_flat_order_id
    , order_item_id
    , serial_number
    , simple_product_id
    , configurable_product_id
    , sales_flat_order_id_row
    ,
        row_number() OVER (PARTITION BY sales_flat_order_id ORDER BY order_item_id)
        AS _row

  FROM mag_no_configurable_product_id_match AS mag
  WHERE NOT EXISTS (
    SELECT *
    FROM sales_flat_order_id_match
    WHERE order_item_id = mag.order_item_id
  )

), unioned AS (

    SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , CAST(NULL AS int64) order_item_id
    , sales_flat_order_id_row
    ,CAST(NULL AS int64) AS _row
    , 'fps_no_sales_flat_order_id_match' AS source
    FROM fps_no_sales_flat_order_id_match
    UNION ALL
    SELECT
      CAST(NULL AS string) AS fps_order_id
    , sales_flat_order_id
    , CAST(NULL AS string) AS farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , order_item_id
    , sales_flat_order_id_row
    ,CAST(NULL AS int64) AS _row
    , 'mag_no_sales_flat_order_id_match' AS source
    FROM mag_no_sales_flat_order_id_match
    UNION ALL
    SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , order_item_id
    , CAST(NULL AS int64) AS sales_flat_order_id_row
    , CAST(NULL AS int64) AS _row
    , 'sales_flat_order_id_match' AS source
    FROM sales_flat_order_id_match

)



SELECT * FROM unioned