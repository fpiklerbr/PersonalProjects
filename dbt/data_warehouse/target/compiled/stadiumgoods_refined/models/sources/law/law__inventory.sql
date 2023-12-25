



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `label_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`alt_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`alt_sku` AS string)), '') AS string) END as string)
 AS `alt_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`on_hand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`on_hand` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_on_hand`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commited` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commited` AS string)), '') AS string) END as string)
 AS `commited`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`available` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`available` AS string)), '') AS string) END as string)
 AS `available`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as string)
 AS `price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category` AS string)), '') AS string) END as string)
 AS `category`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`law_inventory`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `label_number` AS `label_number`
  , `alt_sku` AS `alt_sku`
  , `description` AS `description`
  , `qty_on_hand` AS `qty_on_hand`
  , `commited` AS `commited`
  , `available` AS `available`
  , `price` AS `price`
  , `category` AS `category`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 