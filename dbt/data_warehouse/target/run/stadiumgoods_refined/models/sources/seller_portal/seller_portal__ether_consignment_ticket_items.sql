

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_consignment_ticket_items`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_consignment_ticket_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_profile_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_profile_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_profile_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_portal_consignment_shipment_box_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_portal_consignment_shipment_box_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_consignment_shipment_box_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`token` AS string)), '') AS string) END as string)
 AS `ticket_item_number`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expired_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expired_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `expired_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_status` AS string)), '') AS string) END as string)
 AS `intake_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_rejection_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_rejection_reason` AS string)), '') AS string) END as string)
 AS `intake_rejection_reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expiration_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expiration_reason` AS string)), '') AS string) END as string)
 AS `expiration_reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_ticket_items`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_consignment_ticket_item_id` AS `ether_consignment_ticket_item_id`
  , `product_profile_id` AS `product_profile_id`
  , `ether_consignment_shipment_box_id` AS `ether_consignment_shipment_box_id`
  , `ticket_item_number` AS `ticket_item_number`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `expired_at` AS `expired_at`
  , `intake_status` AS `intake_status`
  , `intake_rejection_reason` AS `intake_rejection_reason`
  , `expiration_reason` AS `expiration_reason`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

