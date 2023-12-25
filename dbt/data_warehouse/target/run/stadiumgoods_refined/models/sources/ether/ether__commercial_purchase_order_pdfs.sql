

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_purchase_order_pdfs`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_purchase_order_pdf_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_purchase_order_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `pdf_created_by_employee_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS `created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_pdfs`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_commercial_purchase_order_pdf_id` AS `ether_commercial_purchase_order_pdf_id`
  , `ether_commercial_purchase_order_id` AS `ether_commercial_purchase_order_id`
  , `pdf_created_by_employee_id` AS `pdf_created_by_employee_id`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

