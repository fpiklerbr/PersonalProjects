
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__open_listings_data` as DBT_INTERNAL_DEST
        using (
           
































 

SELECT   `sku`,  `asin`,  `price`,  `quantity`,  `file_name`,  `file_time`,  `region`
    , `_raw_business_price`
    , `_raw_quantity_price_type`
    , `_raw_quantity_lower_bound_1`
    , `_raw_quantity_price_1`
    , `_raw_quantity_lower_bound_2`
    , `_raw_quantity_price_2`
    , `_raw_quantity_lower_bound_3`
    , `_raw_quantity_price_3`
    , `_raw_quantity_lower_bound_4`
    , `_raw_quantity_price_4`
    , `_raw_quantity_lower_bound_5`
    , `_raw_quantity_price_5`
    , `_raw_progressive_price_type`
    , `_raw_progressive_lower_bound_1`
    , `_raw_progressive_price_1`
    , `_raw_progressive_lower_bound_2`
    , `_raw_progressive_price_2`
    , `_raw_progressive_lower_bound_3`
    , `_raw_progressive_price_3`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`asin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`asin` AS string)), '') AS string) END as string)
 AS `asin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region` AS string)), '') AS string) END as string)
 AS `region`


  , `business_price` AS `_raw_business_price`

  , `quantity_price_type` AS `_raw_quantity_price_type`

  , `quantity_lower_bound_1` AS `_raw_quantity_lower_bound_1`

  , `quantity_price_1` AS `_raw_quantity_price_1`

  , `quantity_lower_bound_2` AS `_raw_quantity_lower_bound_2`

  , `quantity_price_2` AS `_raw_quantity_price_2`

  , `quantity_lower_bound_3` AS `_raw_quantity_lower_bound_3`

  , `quantity_price_3` AS `_raw_quantity_price_3`

  , `quantity_lower_bound_4` AS `_raw_quantity_lower_bound_4`

  , `quantity_price_4` AS `_raw_quantity_price_4`

  , `quantity_lower_bound_5` AS `_raw_quantity_lower_bound_5`

  , `quantity_price_5` AS `_raw_quantity_price_5`

  , `progressive_price_type` AS `_raw_progressive_price_type`

  , `progressive_lower_bound_1` AS `_raw_progressive_lower_bound_1`

  , `progressive_price_1` AS `_raw_progressive_price_1`

  , `progressive_lower_bound_2` AS `_raw_progressive_lower_bound_2`

  , `progressive_price_2` AS `_raw_progressive_price_2`

  , `progressive_lower_bound_3` AS `_raw_progressive_lower_bound_3`

  , `progressive_price_3` AS `_raw_progressive_price_3`


FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_open_listings_data` AS source_table

WHERE 
    safe_cast(file_time as timestamp)
 > (SELECT max(file_time) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__open_listings_data` )


 ) AS un_ordered


         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`sku`, `asin`, `price`, `quantity`, `file_name`, `file_time`, `region`)
    values
        (`sku`, `asin`, `price`, `quantity`, `file_name`, `file_time`, `region`)


  