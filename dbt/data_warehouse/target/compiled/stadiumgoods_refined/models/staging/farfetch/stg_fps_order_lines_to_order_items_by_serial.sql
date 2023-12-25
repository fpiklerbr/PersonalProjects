WITH fps_no_attempted_match AS (

  SELECT
      headers.fps_order_id
    , headers.sales_flat_order_id
    , lines.farfetch_order_line_id
    , lines.configurable_product_id
    , lines.simple_product_id
    , lines.serial_number
    , row_number() OVER (PARTITION BY headers.sales_flat_order_id, lines.serial_number ORDER BY lines.farfetch_order_line_id) AS serial_number_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` AS headers
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_order_lines` AS lines
    ON headers.fps_order_id = lines.fps_order_id

), mag_no_attempted_match AS (

  SELECT
      sales_flat_order_id
    , order_item_id
    , item_serial_number AS serial_number
    , simple_product_id
    , configurable_product_id
    , row_number() OVER (PARTITION BY sales_flat_order_id, item_serial_number ORDER BY order_item_id) AS serial_number_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_items` AS items
  WHERE EXISTS (SELECT * FROM fps_no_attempted_match WHERE sales_flat_order_id = items.sales_flat_order_id)

)



    


, serial_number_match AS (

  SELECT DISTINCT
      fps.fps_order_id
    , fps.sales_flat_order_id
    , fps.farfetch_order_line_id
    , fps.configurable_product_id
    , fps.simple_product_id
    , fps.serial_number
    , mag.order_item_id
  FROM fps_no_attempted_match AS fps
  INNER JOIN mag_no_attempted_match AS mag
    ON fps.sales_flat_order_id = mag.sales_flat_order_id
    AND fps.serial_number = mag.serial_number
    AND fps.serial_number_row = mag.serial_number_row

), fps_no_serial_number_match AS (

  SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , serial_number_row
    ,
      row_number() OVER (PARTITION BY sales_flat_order_id, simple_product_id ORDER BY farfetch_order_line_id)
     AS simple_product_id_row
  FROM fps_no_attempted_match AS fps
  WHERE NOT EXISTS (
    SELECT *
    FROM serial_number_match
    WHERE farfetch_order_line_id = fps.farfetch_order_line_id
      AND fps_order_id = fps.fps_order_id
  )

), mag_no_serial_number_match AS (

  SELECT
      sales_flat_order_id
    , order_item_id
    , serial_number
    , simple_product_id
    , configurable_product_id
    , serial_number_row
    ,
        row_number() OVER (PARTITION BY sales_flat_order_id, simple_product_id ORDER BY order_item_id)
        AS simple_product_id_row

  FROM mag_no_attempted_match AS mag
  WHERE NOT EXISTS (
    SELECT *
    FROM serial_number_match
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
    , serial_number_row
    ,simple_product_id_row
    , 'fps_no_serial_number_match' AS source
    FROM fps_no_serial_number_match
    UNION ALL
    SELECT
      CAST(NULL AS string) AS fps_order_id
    , sales_flat_order_id
    , CAST(NULL AS string) AS farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , order_item_id
    , serial_number_row
    ,simple_product_id_row
    , 'mag_no_serial_number_match' AS source
    FROM mag_no_serial_number_match
    UNION ALL
    SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , order_item_id
    , CAST(NULL AS int64) AS serial_number_row
    , CAST(NULL AS int64) AS simple_product_id_row
    , 'serial_number_match' AS source
    FROM serial_number_match

)



SELECT * FROM unioned