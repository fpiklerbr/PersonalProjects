

WITH final AS (


  
  SELECT
      CASE
        WHEN 


  not regexp_contains(tracking_number, r'(?i)admin')


        THEN tracking_number
      END AS tracking_number
    -- ship_date: 2018-01-22 00:00:00
    , CAST(CAST(ship_date AS datetime) AS date) AS ship_date
    -- file_time: 2018-01-31 05:00:00+00:00
    , CAST(safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , file_name AS invoice_id
    , cap_client_center
    , CASE
        WHEN 


  regexp_contains(tracking_number, r'(?i)admin')


        THEN substr(
    concat(
    
      coalesce('Shipping'|| ' - ' , '')
    
      , coalesce(tracking_number|| ' - ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce('Shipping'|| ' - ' , '')
    
      , coalesce(tracking_number|| ' - ' , '')
    
  )) - length(' - ')
      , 0
    )
)
        ELSE cast('Order Fulfillment' AS string )
      END AS operations_category
    , cast('Small Parcel' AS string ) AS operations_subcategory
    , CASE
        WHEN 


  not regexp_contains(tracking_number, r'(?i)admin')


        THEN cast( ship_cost AS float64 )
      END AS ship_cost
    , CASE
        WHEN 


  regexp_contains(tracking_number, r'(?i)admin')


        THEN cast( ship_cost AS float64 )
      END AS warehouse_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_shipping_small_parcel` AS cap_invoice_shipping
  WHERE  tracking_number IS NOT NULL
    AND 


  not regexp_contains(tracking_number, r'(?i)^subtotal')


    AND 


  not regexp_contains(tracking_number, r'(?i)^total')



  UNION ALL
  SELECT
      CASE
        WHEN 


  not regexp_contains(tracking_number, r'(?i)admin')


        THEN tracking_number
      END AS tracking_number
    -- ship_date: 2018-01-22 00:00:00
    , CAST(CAST(sales_date AS datetime) AS date) AS ship_date
    -- file_time: 2018-01-31 05:00:00+00:00
    , CAST(safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , file_name AS invoice_id
    , cap_client_center
    , CASE
        WHEN 


  regexp_contains(tracking_number, r'(?i)admin')


        THEN substr(
    concat(
    
      coalesce('Shipping'|| ' - ' , '')
    
      , coalesce(tracking_number|| ' - ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce('Shipping'|| ' - ' , '')
    
      , coalesce(tracking_number|| ' - ' , '')
    
  )) - length(' - ')
      , 0
    )
)
        ELSE cast('Order Fulfillment' AS string )
      END AS operations_category
    , cast('LTL Other' AS string ) AS operations_subcategory
    , CASE
        WHEN 


  not regexp_contains(tracking_number, r'(?i)admin')


        THEN cast( ship_cost AS float64 )
      END AS ship_cost
    , CASE
        WHEN 


  regexp_contains(tracking_number, r'(?i)admin')


        THEN cast( ship_cost AS float64 )
      END AS warehouse_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_shipping_ltl_other` AS cap_invoice_shipping
  WHERE  tracking_number IS NOT NULL
    AND 


  not regexp_contains(tracking_number, r'(?i)^subtotal')


    AND 


  not regexp_contains(tracking_number, r'(?i)^total')



  UNION ALL
  SELECT
      CASE
        WHEN 


  not regexp_contains(tracking_number, r'(?i)admin')


        THEN tracking_number
      END AS tracking_number
    -- ship_date: 2018-01-22 00:00:00
    , CAST(CAST(ship_date AS datetime) AS date) AS ship_date
    -- file_time: 2018-01-31 05:00:00+00:00
    , CAST(safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , file_name AS invoice_id
    , cap_client_center
    , CASE
        WHEN 


  regexp_contains(tracking_number, r'(?i)admin')


        THEN substr(
    concat(
    
      coalesce('Shipping'|| ' - ' , '')
    
      , coalesce(tracking_number|| ' - ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce('Shipping'|| ' - ' , '')
    
      , coalesce(tracking_number|| ' - ' , '')
    
  )) - length(' - ')
      , 0
    )
)
        ELSE cast('Order Fulfillment' AS string )
      END AS operations_category
    , cast('Adjustments' AS string ) AS operations_subcategory
    , CASE
        WHEN 


  not regexp_contains(tracking_number, r'(?i)admin')


        THEN cast( shipping_adjustment AS float64 )
      END AS ship_cost
    , CASE
        WHEN 


  regexp_contains(tracking_number, r'(?i)admin')


        THEN cast( shipping_adjustment AS float64 )
      END AS warehouse_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_shipping_adjustments` AS cap_invoice_shipping
  WHERE  tracking_number IS NOT NULL
    AND 


  not regexp_contains(tracking_number, r'(?i)^subtotal')


    AND 


  not regexp_contains(tracking_number, r'(?i)^total')




)

SELECT * FROM final