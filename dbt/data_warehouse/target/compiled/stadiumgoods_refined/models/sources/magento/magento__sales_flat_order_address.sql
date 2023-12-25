



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_address_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_address_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quote_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quote_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `quote_address_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `region_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fax` AS string)), '') AS string) END as string)
 AS `fax`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region` AS string)), '') AS string) IN ('N/A','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region` AS string)), '') AS string) END as string)
 AS `region`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`postcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`postcode` AS string)), '') AS string) END as string)
 AS `postcode`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lastname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lastname` AS string)), '') AS string) END as string)
 AS `lastname`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`street` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`street` AS string)), '') AS string) END as string)
 AS `street`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('Amazon does not supply the complete billing Buyer information.','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `_raw_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`telephone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`telephone` AS string)), '') AS string) END as string)
 AS `telephone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_id` AS string)), '') AS string) END as string)
 AS `country_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`firstname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`firstname` AS string)), '') AS string) END as string)
 AS `firstname`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_type` AS string)), '') AS string) END as string)
 AS `address_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prefix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prefix` AS string)), '') AS string) END as string)
 AS `prefix`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`middlename` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`middlename` AS string)), '') AS string) END as string)
 AS `middlename`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`suffix` AS string)), '') AS string) END as string)
 AS `suffix`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`company` AS string)), '') AS string) END as string)
 AS `company`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_id` AS string)), '') AS string) END as string)
 AS `vat_id`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`vat_is_valid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_is_valid` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`vat_is_valid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_is_valid` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `vat_is_valid`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_request_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_request_id` AS string)), '') AS string) END as string)
 AS `vat_request_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_request_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_request_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `vat_request_date`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`vat_request_success` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_request_success` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`vat_request_success` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_request_success` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `vat_request_is_success`
  , `_synched_from_source_at` AS `_raw__synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_address`

WHERE 1=1
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    CAST(regexp_replace(_raw_city, r'^City:\s*', '') AS string)

 AS `city`
FROM layer_0
WHERE 1=1
                     ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(nullif(coalesce(city, '') || CASE WHEN city IS NULL OR region IS NULL THEN '' ELSE ', ' END || coalesce(region, ''), '') as string)
 AS `city_and_region`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `sales_flat_order_address_id` AS `sales_flat_order_address_id`
  , `sales_flat_order_id` AS `sales_flat_order_id`
  , `customer_address_id` AS `customer_address_id`
  , `quote_address_id` AS `quote_address_id`
  , `region_id` AS `region_id`
  , `customer_id` AS `customer_id`
  , `fax` AS `fax`
  , `region` AS `region`
  , `postcode` AS `postcode`
  , `lastname` AS `lastname`
  , `street` AS `street`
  , `city` AS `city`
  , `city_and_region` AS `city_and_region`
  , `email` AS `email`
  , `telephone` AS `telephone`
  , `country_id` AS `country_id`
  , `firstname` AS `firstname`
  , `address_type` AS `address_type`
  , `prefix` AS `prefix`
  , `middlename` AS `middlename`
  , `suffix` AS `suffix`
  , `company` AS `company`
  , `vat_id` AS `vat_id`
  , `vat_is_valid` AS `vat_is_valid`
  , `vat_request_id` AS `vat_request_id`
  , `vat_request_date` AS `vat_request_date`
  , `vat_request_is_success` AS `vat_request_is_success`
  , `_raw__synched_from_source_at` AS `_raw__synched_from_source_at`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final 