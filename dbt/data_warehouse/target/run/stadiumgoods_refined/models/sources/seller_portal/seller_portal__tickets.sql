

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__tickets`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ticket_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'Pending' AS string)
WHEN 1 THEN cast( 'Modified' AS string)
WHEN 2 THEN cast( 'Approved' AS string)
WHEN 3 THEN cast( 'Rejected' AS string)
WHEN 5 THEN cast( 'Shipped' AS string)
WHEN 6 THEN cast( 'Populate' AS string)
WHEN 7 THEN cast( 'Set Details' AS string)
WHEN 8 THEN cast( 'Preview' AS string)
WHEN 9 THEN cast( 'Dropped Off' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `ticket_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`token` AS string)), '') AS string) END as string)
 AS `ticket_number`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`opened` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`opened` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`opened` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`opened` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_opened`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`step` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`step` AS string)), '') AS string) END as float64)
 as int64)
 AS `step`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consigner_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consigner_id` AS string)), '') AS string) END as string)
 AS `consignor_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rejected_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rejected_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `rejected_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dropped_off_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dropped_off_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `dropped_off_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `submitted_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_order_number` AS string)), '') AS string) END as string)
 AS `purchase_order_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`indexed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`indexed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `indexed_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approved_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approved_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `approved_by_employee_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_reminded_to_submit_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_reminded_to_submit_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `user_reminded_to_submit_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approved_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `approved_at`
  , CAST(NULL AS timestamp) AS `expires_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`estimated_delivery_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`estimated_delivery_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `estimated_delivery_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_modified_by_user_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_modified_by_user_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_modified_by_user_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source` AS string)), '') AS string) END as string)
 AS `ticket_source`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_id` AS string)), '') AS string) END as string)
 AS `ticket_source_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`closed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`closed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `closed_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `extra_intake_is_allowed`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tickets`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(ticket_source = 'customer_return' as boolean)
 AS `is_return`
  , 
    safe_cast(CASE WHEN ticket_source = 'source_bundle' THEN ticket_source_id END as string)
 AS `source_bundle_number`
  , 
    safe_cast(CASE WHEN ticket_source = 'purchase_order' THEN ticket_source_id END as int64)
 AS `ether_commercial_purchase_order_id`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ticket_id` AS `ticket_id`
  , `user_id` AS `user_id`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `ticket_status` AS `ticket_status`
  , `ticket_number` AS `ticket_number`
  , `is_opened` AS `is_opened`
  , `step` AS `step`
  , `consignor_id` AS `consignor_id`
  , `rejected_at` AS `rejected_at`
  , `dropped_off_at` AS `dropped_off_at`
  , `submitted_at` AS `submitted_at`
  , `is_return` AS `is_return`
  , `purchase_order_number` AS `purchase_order_number`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `indexed_at` AS `indexed_at`
  , `approved_by_employee_id` AS `approved_by_employee_id`
  , `user_reminded_to_submit_at` AS `user_reminded_to_submit_at`
  , `approved_at` AS `approved_at`
  , `expires_at` AS `expires_at`
  , `estimated_delivery_at` AS `estimated_delivery_at`
  , `last_modified_by_user_at` AS `last_modified_by_user_at`
  , `ticket_source` AS `ticket_source`
  , `ticket_source_id` AS `ticket_source_id`
  , `closed_at` AS `closed_at`
  , `extra_intake_is_allowed` AS `extra_intake_is_allowed`
  , `source_bundle_number` AS `source_bundle_number`
  , `ether_commercial_purchase_order_id` AS `ether_commercial_purchase_order_id`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

