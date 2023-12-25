



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_sku` AS string)), '') AS string) END as string)
 AS `product_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_name` AS string)), '') AS string) END as string)
 AS `product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_brand` AS string)), '') AS string) END as string)
 AS `product_brand`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `currency_code`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_detail_views` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_detail_views` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_detail_views`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_adds_to_cart` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_adds_to_cart` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_adds_to_cart`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_checkouts` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_checkouts` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_checkouts`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buy_to_detail_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buy_to_detail_rate` AS string)), '') AS string) END as numeric)
 AS `buy_to_detail_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unique_purchases` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unique_purchases` AS string)), '') AS string) END as string)
 AS `unique_purchases`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_revenue` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_revenue` AS string)), '') AS string) END as numeric)
 AS `item_revenue`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `source_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`ga_product_data`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `product_sku` AS `product_sku`
  , `product_name` AS `product_name`
  , `product_brand` AS `product_brand`
  , `currency_code` AS `currency_code`
  , `product_detail_views` AS `product_detail_views`
  , `product_adds_to_cart` AS `product_adds_to_cart`
  , `product_checkouts` AS `product_checkouts`
  , `buy_to_detail_rate` AS `buy_to_detail_rate`
  , `unique_purchases` AS `unique_purchases`
  , `item_revenue` AS `item_revenue`
  , `source_date` AS `source_date`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 