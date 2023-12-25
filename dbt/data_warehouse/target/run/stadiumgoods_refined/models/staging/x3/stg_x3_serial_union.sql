

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_union`
  OPTIONS()
  as 

WITH stock_serials AS (

  SELECT DISTINCT
      serial_number
    , x3_sku
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stoser`
  WHERE serial_number IS NOT NULL
    AND x3_sku IS NOT NULL

), journal_serials AS (

  SELECT DISTINCT
      serial_number
    , x3_sku
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal` AS journal
  WHERE NOT EXISTS (
    SELECT *
    FROM stock_serials
    WHERE serial_number = journal.serial_number
      AND x3_sku = journal.x3_sku
  )

), yserinf_serials AS (

  SELECT DISTINCT
      serial_number
    , x3_sku
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_yserinf` AS yserinf
  WHERE NOT EXISTS (
    SELECT *
    FROM stock_serials
    WHERE serial_number = yserinf.serial_number
      AND x3_sku = yserinf.x3_sku
  )
    AND NOT EXISTS (
      SELECT *
      FROM journal_serials
      WHERE serial_number = yserinf.serial_number
        AND x3_sku = yserinf.x3_sku
    )

), final AS (

  SELECT *
  FROM stock_serials
  UNION ALL
  SELECT *
  FROM journal_serials
  UNION ALL
  SELECT *
  FROM yserinf_serials

)

SELECT * FROM final
WHERE (serial_number = '1906914506' AND x3_sku = '025330') IS NOT TRUE;

