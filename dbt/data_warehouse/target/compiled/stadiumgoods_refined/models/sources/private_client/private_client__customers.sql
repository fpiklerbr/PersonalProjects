




    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stylist` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stylist` AS string)), '') AS string) END as string)
 AS `stylist_name`
  , 

    
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`activation_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`activation_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`activation_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`activation_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `activation_date`
  , 

    
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`deactivaton_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deactivaton_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`deactivaton_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deactivaton_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `deactivation_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `customer_name`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email` AS string)), '') AS string)) END as string)
 AS `email`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_2` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_2` AS string)), '') AS string)) END as string)
 AS `email_2`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_3` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_3` AS string)), '') AS string)) END as string)
 AS `email_3`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_4` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_4` AS string)), '') AS string)) END as string)
 AS `email_4`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_5` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_5` AS string)), '') AS string)) END as string)
 AS `email_5`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_6` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_6` AS string)), '') AS string)) END as string)
 AS `email_6`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_7` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_7` AS string)), '') AS string)) END as string)
 AS `email_7`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_8` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_8` AS string)), '') AS string)) END as string)
 AS `email_8`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_9` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_9` AS string)), '') AS string)) END as string)
 AS `email_9`
  , 

    
    safe_cast(CASE WHEN lower( cast(nullif(trim(cast(`email_10` AS string)), '') AS string)) IN ('nan','None','','NaT') THEN NULL ELSE lower( cast(nullif(trim(cast(`email_10` AS string)), '') AS string)) END as string)
 AS `email_10`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `customer_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , `m` AS `_raw_m`
  , `d` AS `_raw_d`
FROM `ff-stadiumgoods-raw-live`.`imports`.`private_client_customers`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE
WHEN stylist_name in ('VIP CHI','VIP SoHo')
THEN 'Retail'
ELSE 'Private Client'
END as string)
 AS `stylist_type`
  , 
    safe_cast('PC' || dense_rank() OVER (ORDER BY lower(customer_name)) as string)
 AS `private_client_customer_id`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `stylist_name` AS `stylist_name`
  , `stylist_type` AS `stylist_type`
  , `activation_date` AS `activation_date`
  , `deactivation_date` AS `deactivation_date`
  , `customer_name` AS `customer_name`
  , `private_client_customer_id` AS `private_client_customer_id`
  , `email` AS `email`
  , `email_2` AS `email_2`
  , `email_3` AS `email_3`
  , `email_4` AS `email_4`
  , `email_5` AS `email_5`
  , `email_6` AS `email_6`
  , `email_7` AS `email_7`
  , `email_8` AS `email_8`
  , `email_9` AS `email_9`
  , `email_10` AS `email_10`
  , `file_name` AS `file_name`
  , `customer_type` AS `customer_type`
  , `file_time` AS `file_time`
  , `_raw_m` AS `_raw_m`
  , `_raw_d` AS `_raw_d`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 