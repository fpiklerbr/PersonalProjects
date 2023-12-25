SELECT
    CAST(CAST(file_time AS timestamp) AS date) AS invoice_date
  , file_name AS invoice_id
  , cap_client_center
  , cast('VAS' AS string ) AS operations_category
  , trim( 
  CAST(regexp_replace(memo, r'(?i)^subtotal: ', '') AS string)


 ) AS operations_subcategory
  , cast(amount AS float64 ) AS warehouse_cost
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_vas` AS cap_invoice_vas
WHERE  


  regexp_contains(memo, r'(?i)^subtotal: ')

