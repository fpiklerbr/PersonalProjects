

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_purchase_orders`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_purchase_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `purchase_order_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_reference_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_reference_number` AS string)), '') AS string) END as string)
 AS `external_reference_number`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_type` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'new_release' AS string)
WHEN 1 THEN cast( 'restock' AS string)
WHEN 2 THEN cast( 'non_sg_apparel' AS string)
WHEN 3 THEN cast( 'direct_brand' AS string)
WHEN 4 THEN cast( 'sg_brand_core' AS string)
WHEN 5 THEN cast( 'sg_brand_fashion' AS string)
WHEN 6 THEN cast( 'seeding' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`po_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_type` AS string)), '') AS string) END AS string)
END AS `po_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_code` AS string)), '') AS string) END as string)
 AS `destination_code`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`estimated_arrival_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`estimated_arrival_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `estimated_arrival_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `purchase_order_status`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_item_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_item_cost` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_item_cost`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commercial_approved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commercial_approved_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `commercial_approved_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sox_approved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sox_approved_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sox_approved_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commercial_review_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commercial_review_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `commercial_review_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sox_review_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sox_review_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sox_review_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vendor_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vendor_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_vendor_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `line_items_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`margin_percentage` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`margin_percentage` AS string)), '') AS string) END as numeric)
 AS `margin_percentage`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_id` AS string)), '') AS string) END as string)
 AS `consignor_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_ticket_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_ticket_token` AS string)), '') AS string) END as float64)
 as int64)
 AS `intake_ticket_token`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extra_intake_allowed` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `extra_intake_allowed`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `created_by_employee_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`closed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`closed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `closed_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`closed_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`closed_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `closed_by_employee_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_ticket_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_ticket_created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `intake_ticket_created_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_ticket_created_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_ticket_created_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `intake_ticket_created_by_employee_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_completed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_completed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `intake_completed_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_completed_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_completed_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `intake_completed_by_employee_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `buyer_employee_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`friendly_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`friendly_name` AS string)), '') AS string) END as string)
 AS `friendly_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `estimated_intake_date` AS `_raw_estimated_intake_date`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_orders`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_commercial_purchase_order_id` AS `ether_commercial_purchase_order_id`
  , `purchase_order_number` AS `purchase_order_number`
  , `external_reference_number` AS `external_reference_number`
  , `po_type` AS `po_type`
  , `destination_code` AS `destination_code`
  , `estimated_arrival_date` AS `estimated_arrival_date`
  , `purchase_order_status` AS `purchase_order_status`
  , `total_item_cost` AS `total_item_cost`
  , `commercial_approved_at` AS `commercial_approved_at`
  , `sox_approved_at` AS `sox_approved_at`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `commercial_review_id` AS `commercial_review_id`
  , `sox_review_id` AS `sox_review_id`
  , `ether_commercial_vendor_id` AS `ether_commercial_vendor_id`
  , `lock_version` AS `lock_version`
  , `line_items_count` AS `line_items_count`
  , `margin_percentage` AS `margin_percentage`
  , `consignor_id` AS `consignor_id`
  , `intake_ticket_token` AS `intake_ticket_token`
  , `extra_intake_allowed` AS `extra_intake_allowed`
  , `base_currency` AS `base_currency`
  , `created_by_employee_id` AS `created_by_employee_id`
  , `closed_at` AS `closed_at`
  , `closed_by_employee_id` AS `closed_by_employee_id`
  , `intake_ticket_created_at` AS `intake_ticket_created_at`
  , `intake_ticket_created_by_employee_id` AS `intake_ticket_created_by_employee_id`
  , `intake_completed_at` AS `intake_completed_at`
  , `intake_completed_by_employee_id` AS `intake_completed_by_employee_id`
  , `buyer_employee_id` AS `buyer_employee_id`
  , `friendly_name` AS `friendly_name`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_estimated_intake_date` AS `_raw_estimated_intake_date`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

