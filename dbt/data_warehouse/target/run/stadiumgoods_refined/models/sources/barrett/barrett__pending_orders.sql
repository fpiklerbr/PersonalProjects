

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`barrett__pending_orders`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orderid_shipid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orderid_shipid` AS string)), '') AS string) END as string)
 AS `orderid_shipid`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference` AS string)), '') AS string) END as string)
 AS `pick_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po` AS string)), '') AS string) END as string)
 AS `external_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to` AS string)), '') AS string) END as string)
 AS `shipping_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_entered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_entered` AS string)), '') AS string) END as string)
 AS `label_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`descr` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`descr` AS string)), '') AS string) END as string)
 AS `descr`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_order` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_order`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entrydate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entrydate` AS string)), '') AS string) END as timestamp)
 AS datetime), 'America/New_York') AS timestamp) AS `created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier` AS string)), '') AS string) END as string)
 AS `carrier_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `pick_item_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`days_in_house` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`days_in_house` AS string)), '') AS string) END as float64)
 AS `days_in_house`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`facility` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`facility` AS string)), '') AS string) END as string)
 AS `facility`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pending_orders_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pending_orders_file` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`barrett_file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`barrett_file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `_etl_file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `scheduled_ship_date` AS `_raw_scheduled_ship_date`
  , `source_file_time` AS `_raw_source_file_time`
  , `comments` AS `_raw_comments`
  , `wave` AS `_raw_wave`
FROM `ff-stadiumgoods-raw-live`.`imports`.`barrett_pending_orders`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `orderid_shipid` AS `orderid_shipid`
  , `pick_id` AS `pick_id`
  , `external_order_id` AS `external_order_id`
  , to_hex(md5(cast(`shipping_name` as 
    string
))) AS `shipping_name`
  , `label_number` AS `label_number`
  , `descr` AS `descr`
  , `qty_order` AS `qty_order`
  , `created_at` AS `created_at`
  , `channel` AS `channel`
  , `carrier_code` AS `carrier_code`
  , `pick_item_status` AS `pick_item_status`
  , `days_in_house` AS `days_in_house`
  , `facility` AS `facility`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
  , `_etl_file_name` AS `_etl_file_name`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_scheduled_ship_date` AS `_raw_scheduled_ship_date`
  , `_raw_source_file_time` AS `_raw_source_file_time`
  , `_raw_comments` AS `_raw_comments`
  , `_raw_wave` AS `_raw_wave`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

