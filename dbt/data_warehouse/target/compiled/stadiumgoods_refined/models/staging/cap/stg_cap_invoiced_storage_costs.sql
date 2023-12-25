WITH storage_totals AS (

  SELECT
      CAST(CAST(file_time AS timestamp) AS date) AS invoice_date
    , file_name AS invoice_id
    , cap_client_center
    , cast(CASE
        WHEN 


  regexp_contains(created, r'(?i)^Warehouse Services: Additional [0-9]+ Pallets')

 = TRUE
        THEN 'Warehouse Services: Additional Pallets'
        WHEN month_end = 'Total Shoes on Hand >30 Days'
        THEN 'Shoes'
        WHEN month_end = 'Total Pallets and Equivalents on Hand >30 Days'
        THEN 'Pallets and Equivalents'
      END AS string ) AS operations_subcategory
    , cast(on_hand_30_days AS float64 ) AS quantity
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_storage` AS cap_invoice_storage
  WHERE  (
      


  regexp_contains(created, r'(?i)^Warehouse Services: Additional [0-9]+ Pallets')


      OR month_end IN (
        'Total Pallets and Equivalents on Hand >30 Days', 'Total Shoes on Hand >30 Days'
      )
    )

)

SELECT
    storage_totals.*
  , storage_totals.quantity * (
      CASE
        WHEN storage_totals.operations_subcategory = 'Warehouse Services: Additional Pallets'
          THEN 25
        WHEN storage_totals.operations_subcategory = 'Pallets and Equivalents'
          THEN 12
        WHEN storage_totals.operations_subcategory = 'Shoes'
          THEN CASE WHEN client_centers.cap_location = 'New Jersey' THEN 0.1 ELSE 0.13 END
      END
    ) AS warehouse_cost
  , cast('Storage' AS string ) AS operations_category
FROM storage_totals
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_cap_client_centers` AS client_centers
  ON storage_totals.cap_client_center = client_centers.cap_client_center