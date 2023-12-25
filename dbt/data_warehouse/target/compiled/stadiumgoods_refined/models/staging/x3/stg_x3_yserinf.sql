

WITH lookup_conditions AS (

  SELECT
    serial_condition_code
  , serial_condition
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_conditions`

), stacked_yserinf AS (
  
  SELECT
     row_id
   , serial_condition_code_1 AS serial_condition_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_base_yserinf`
   UNION ALL
  SELECT
     row_id
   , serial_condition_code_2 AS serial_condition_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_base_yserinf`
   UNION ALL
  SELECT
     row_id
   , serial_condition_code_3 AS serial_condition_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_base_yserinf`
   UNION ALL
  SELECT
     row_id
   , serial_condition_code_4 AS serial_condition_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_base_yserinf`
   UNION ALL
  SELECT
     row_id
   , serial_condition_code_5 AS serial_condition_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_base_yserinf`

), final AS (

  SELECT
    yserinf.serial_number
  , yserinf.x3_sku
  , yserinf.row_id
  , yserinf.commission_rate
  , yserinf.price
  , yserinf.consignor_id
  , yserinf.note
  , yserinf.original_serial
  , nullif(string_agg(lookup_conditions.serial_condition ,', ' ORDER BY lookup_conditions.serial_condition ASC)
      , '') AS conditions
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_base_yserinf` AS yserinf
  LEFT JOIN stacked_yserinf
    ON yserinf.row_id = stacked_yserinf.row_id
  LEFT JOIN lookup_conditions
    ON lookup_conditions.serial_condition_code = stacked_yserinf.serial_condition_code
  GROUP BY 1,2,3,4,5,6,7,8

)
SELECT * FROM final