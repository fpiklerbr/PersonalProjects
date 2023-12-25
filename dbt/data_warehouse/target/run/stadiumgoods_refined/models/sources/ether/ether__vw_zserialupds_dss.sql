

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__vw_zserialupds_dss`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_0` AS string)), '') AS string) END as string)
 AS `product_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_0` AS string)), '') AS string) END as string)
 AS `serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_0` AS string)), '') AS string) END as string)
 AS `label_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku_0` AS string)), '') AS string) END as string)
 AS `simple_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manusku_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manusku_0` AS string)), '') AS string) END as string)
 AS `manusku_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magsize_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magsize_0` AS string)), '') AS string) END as string)
 AS `magsize_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_0` AS string)), '') AS string) END as string)
 AS `warehouse_code`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`available_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`available_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `magento__serializedproduct_product_serial_status_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`x3order_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`x3order_0` AS string)), '') AS string) END as string)
 AS `x3order_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mageorder_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mageorder_0` AS string)), '') AS string) END as string)
 AS `mageorder_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_0` AS string)), '') AS string) END as numeric)
 AS `price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_0` AS string)), '') AS string) END as string)
 AS `currency_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comment_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comment_0` AS string)), '') AS string) END as string)
 AS `comment`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`supply_channel_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`supply_channel_0` AS string)), '') AS string) END as string)
 AS `supply_channel_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod1_0` AS string)), '') AS string) END as string)
 AS `concod1_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod2_0` AS string)), '') AS string) END as string)
 AS `concod2_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod3_0` AS string)), '') AS string) END as string)
 AS `concod3_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod4_0` AS string)), '') AS string) END as string)
 AS `concod4_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod5_0` AS string)), '') AS string) END as string)
 AS `concod5_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex1_0` AS string)), '') AS string) END as string)
 AS `contex1_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex2_0` AS string)), '') AS string) END as string)
 AS `contex2_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex3_0` AS string)), '') AS string) END as string)
 AS `contex3_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex4_0` AS string)), '') AS string) END as string)
 AS `contex4_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex5_0` AS string)), '') AS string) END as string)
 AS `contex5_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`location_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`location_0` AS string)), '') AS string) END as string)
 AS `location_0`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lmod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lmod_0` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_modified_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`vw_zserialupds_dss`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `product_0` AS `product_0`
  , `serial_number` AS `serial_number`
  , `label_0` AS `label_0`
  , `simple_sku` AS `simple_sku`
  , `manusku_0` AS `manusku_0`
  , `magsize_0` AS `magsize_0`
  , `warehouse_code` AS `warehouse_code`
  , `magento__serializedproduct_product_serial_status_id` AS `magento__serializedproduct_product_serial_status_id`
  , `x3order_0` AS `x3order_0`
  , `mageorder_0` AS `mageorder_0`
  , `price_base_amount` AS `price_base_amount`
  , `currency_0` AS `currency_0`
  , `comment` AS `comment`
  , `supply_channel_0` AS `supply_channel_0`
  , `concod1_0` AS `concod1_0`
  , `concod2_0` AS `concod2_0`
  , `concod3_0` AS `concod3_0`
  , `concod4_0` AS `concod4_0`
  , `concod5_0` AS `concod5_0`
  , `contex1_0` AS `contex1_0`
  , `contex2_0` AS `contex2_0`
  , `contex3_0` AS `contex3_0`
  , `contex4_0` AS `contex4_0`
  , `contex5_0` AS `contex5_0`
  , `location_0` AS `location_0`
  , `last_modified_at` AS `last_modified_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

