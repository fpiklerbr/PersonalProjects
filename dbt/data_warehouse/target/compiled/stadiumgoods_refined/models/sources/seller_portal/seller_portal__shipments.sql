

  













 

SELECT   `shipment_id`,  `ticket_id`,  `from_address_id`,  `free_labels_count`,  `rate_id`,  `amount`,  `card_token`,  `created_at`,  `updated_at`,  `ether_wms_warehouse_id`,  `insurance_is_enabled`,  `shippo_amount`,  `quote_metadata`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipment_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ticket_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`from_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`from_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `from_address_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`free_labels_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`free_labels_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `free_labels_count`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rate_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rate_id` AS string)), '') AS string) END as string)
 AS `rate_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_token` AS string)), '') AS string) END as string)
 AS `card_token`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`insurance_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`insurance_enabled` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`insurance_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`insurance_enabled` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `insurance_is_enabled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shippo_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shippo_amount` AS string)), '') AS string) END as float64)
 AS `shippo_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quote_metadata` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quote_metadata` AS string)), '') AS string) END as string)
 AS `quote_metadata`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`shipments` AS source_table

 ) AS un_ordered

