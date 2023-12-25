

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_tariff_schedule_codes`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_tariff_schedule_code_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `tariff_category_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `tariff_category`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tariff_schedule_codes`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_pim_tariff_schedule_code_id` AS `ether_pim_tariff_schedule_code_id`
  , `tariff_category_code` AS `tariff_category_code`
  , `tariff_category` AS `tariff_category`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

