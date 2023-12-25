

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_toolio`.`products`
  
  
  OPTIONS()
  as (
    WITH product_attrs AS (

  SELECT
    simple_sku
  , mfg_sku AS product_id
  , merch_division AS division
  , merch_department AS department
  , name AS title
  , mag_url AS image_url
  , colorway AS color
  , size
  , gender
  , brand
  , nickname
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`

), serials AS (

  SELECT
    simple_sku
  , CASE
      WHEN consignor_type = 'Dropshipper' THEN mag_status
      ELSE yseristatus_consignment_status
    END AS status
  , CAST(
  COALESCE(
    CASE WHEN serial_info.consignor_type = 'Dropshipper'
      THEN serial_info.mag_update_nyc
      ELSE serial_info.x3_last_modified_nyc
    END
  , serial_info.mag_update_nyc)
AS date) AS update_timestamp
  , serial_relationship
  , AVG(serial_cost) AS unit_cost
  , AVG(price) AS unit_retail
  , MIN(first_available_date) AS first_available_date
  , MAX(last_available_date)  AS last_available_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serial_info
  GROUP BY 1,2,3,4

), first_intakes AS (

  SELECT
    serial_info.simple_sku
  , CAST(
  COALESCE(
    CASE WHEN serial_info.consignor_type = 'Dropshipper'
      THEN serial_info.mag_update_nyc
      ELSE serial_info.x3_last_modified_nyc
    END
  , serial_info.mag_update_nyc)
AS date) AS update_timestamp
  , serial_info.serial_relationship
  , AVG(serial_info.original_price) AS unit_ticket
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serial_info
  INNER JOIN
  (
    SELECT
      simple_sku
    , serial_relationship
    , CAST(
        COALESCE(
        CASE
        WHEN consignor_type = 'Dropshipper' THEN mag_update_nyc
        ELSE x3_last_modified_nyc END
        , mag_update_nyc)
      AS date) AS update_timestamp
    , MIN(original_intake_creation_nyc) AS first_intake_date
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
    GROUP BY 1, 2, 3
  ) AS first_intake
    ON  first_intake.simple_sku = serial_info.simple_sku
    AND first_intake.update_timestamp = CAST(
  COALESCE(
    CASE WHEN serial_info.consignor_type = 'Dropshipper'
      THEN serial_info.mag_update_nyc
      ELSE serial_info.x3_last_modified_nyc
    END
  , serial_info.mag_update_nyc)
AS date)
    AND first_intake.serial_relationship = serial_info.serial_relationship
    AND CAST(first_intake.first_intake_date AS date) = CAST(serial_info.original_intake_creation_nyc AS date)
  GROUP BY 1,2,3

), first_intakes_dss AS (

/* dss dont have intake date */
  SELECT
    serial_info.simple_sku
  , CAST(
  COALESCE(
    CASE WHEN serial_info.consignor_type = 'Dropshipper'
      THEN serial_info.mag_update_nyc
      ELSE serial_info.x3_last_modified_nyc
    END
  , serial_info.mag_update_nyc)
AS date) AS update_timestamp
  , serial_info.serial_relationship
  , AVG(serial_info.original_price) AS unit_ticket
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serial_info
  GROUP BY 1,2,3

), joined AS (

  SELECT DISTINCT
    serials.simple_sku AS variant_id
  , product_attrs.product_id
  , serials.status
  , product_attrs.division
  , product_attrs.department
  , product_attrs.brand
  , product_attrs.gender
  , product_attrs.title
  , product_attrs.image_url
  , product_attrs.color
  , product_attrs.nickname
  , product_attrs.size
  , serials.update_timestamp
  , serials.serial_relationship
  , serials.unit_cost
  , serials.unit_retail
  , coalesce(first_intakes.unit_ticket, first_intakes_dss.unit_ticket) AS unit_ticket
  , serials.first_available_date
  , serials.last_available_date
  FROM serials
  INNER JOIN product_attrs
    ON serials.simple_sku = product_attrs.simple_sku
  LEFT JOIN first_intakes
    ON  first_intakes.simple_sku = serials.simple_sku
    AND first_intakes.update_timestamp = serials.update_timestamp
    AND first_intakes.serial_relationship = serials.serial_relationship
  LEFT JOIN first_intakes_dss
    ON  first_intakes_dss.simple_sku = serials.simple_sku
    AND first_intakes_dss.update_timestamp = serials.update_timestamp
    AND first_intakes_dss.serial_relationship = serials.serial_relationship

)

SELECT * FROM joined
WHERE variant_id IS NOT NULL
AND division IS NOT NULL
  );
    