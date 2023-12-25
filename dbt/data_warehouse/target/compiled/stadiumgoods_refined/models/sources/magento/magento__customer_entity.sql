

  












 

SELECT   `customer_id`,  `entity_type_id`,  `attribute_set_id`,  `website_id`,  to_hex(md5(cast(`email` as 
    string
))) AS `email`,  `group_id`,  `increment_id`,  `store_id`,  `created_at`,  `updated_at`,  `is_active`,  `disable_auto_group_change`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) END as string)
 AS `entity_type_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_set_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_set_id` AS string)), '') AS string) END as string)
 AS `attribute_set_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`website_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`website_id` AS string)), '') AS string) END as string)
 AS `website_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`group_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`group_id` AS string)), '') AS string) END as string)
 AS `group_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) END as string)
 AS `increment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `store_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_active`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`disable_auto_group_change` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`disable_auto_group_change` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`disable_auto_group_change` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`disable_auto_group_change` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `disable_auto_group_change`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`customer_entity` AS source_table

 ) AS un_ordered

