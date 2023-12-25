

WITH purchase_quantity AS (

  SELECT
      receipt_id
    , receipt_line
    , purchase_id
    , purchase_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__porderq`

), purchase_price AS (

  SELECT
      purchase_id
    , purchase_line
    , net_price
    , gross_price
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__porderp`

), purchase AS (

  SELECT
      purchase_id
    , purchase_reference
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__porder`

), final AS (

  SELECT DISTINCT
    journal.serial_number
  , journal.x3_sku
  , purchase_quantity.purchase_id
  , purchase_quantity.purchase_line
  , nullif(
     greatest(
      coalesce(purchase_price.net_price, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(purchase_price.gross_price, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS price
  , purchase.purchase_reference
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_receipts` AS journal
  INNER JOIN purchase_quantity
    ON journal.document_id = purchase_quantity.receipt_id
    AND journal.document_line = purchase_quantity.receipt_line
  INNER JOIN purchase_price
    ON purchase_quantity.purchase_id = purchase_price.purchase_id
    AND purchase_quantity.purchase_line = purchase_price.purchase_line
  INNER JOIN purchase
    ON purchase_quantity.purchase_id = purchase.purchase_id

)

SELECT * FROM final