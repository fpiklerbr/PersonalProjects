

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ecommerce__marketing_calendar`
  OPTIONS()
  as 





 

SELECT   `date_id`,  `marketing_promo_description`,  `marketing_promo_type`,  `file_name`,  `file_time`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN is_silent_sale THEN 'Silent Sale' WHEN marketing_promo_description IS NOT NULL THEN 'Public Sale' END || CASE WHEN is_free_shipping THEN ' with Free Shipping' ELSE '' END as string)
 AS `marketing_promo_type` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast((lower(marketing_promo_description) LIKE '%free%ship%') IS TRUE as boolean)
 AS `is_free_shipping`
  , 
    safe_cast((lower(marketing_promo_description) LIKE '%silent%') IS TRUE as boolean)
 AS `is_silent_sale` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promotion_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promotion_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `date_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promotion` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promotion` AS string)), '') AS string) END as string)
 AS `marketing_promo_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`ecommerce_marketing_calendar` AS source_table

 ) AS source_select_statement

 ) AS macro_statement

 ) AS un_ordered

;

