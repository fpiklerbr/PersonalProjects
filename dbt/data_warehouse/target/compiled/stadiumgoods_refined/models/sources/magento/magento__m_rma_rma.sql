

  

































 

SELECT   `m_rma_id`,  `mag_rma_id`,  `guest_id`,  `firstname`,  `lastname`,  `company`,  `telephone`,  `email`,  `street`,  `city`,  `region`,  `region_id`,  `country_id`,  `postcode`,  `offline_address`,  `customer_id`,  `order_id`,  `m_rma_status_id`,  `store_id`,  `tracking_code`,  `is_resolved`,  `is_archived`,  `created_at`,  `updated_at`,  `ticket_id`,  `admin_user_id`,  `last_reply_name`,  `last_reply_at`,  `is_gift`,  `exchange_order_id`,  `credit_memo_id`,  `is_admin_read`,  `return_address_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rma_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rma_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) END as string)
 AS `mag_rma_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`guest_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`guest_id` AS string)), '') AS string) END as string)
 AS `guest_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`firstname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`firstname` AS string)), '') AS string) END as string)
 AS `firstname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lastname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lastname` AS string)), '') AS string) END as string)
 AS `lastname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`company` AS string)), '') AS string) END as string)
 AS `company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`telephone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`telephone` AS string)), '') AS string) END as string)
 AS `telephone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`street` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`street` AS string)), '') AS string) END as string)
 AS `street`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region` AS string)), '') AS string) END as string)
 AS `region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region_id` AS string)), '') AS string) END as string)
 AS `region_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_id` AS string)), '') AS string) END as string)
 AS `country_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`postcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`postcode` AS string)), '') AS string) END as string)
 AS `postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`offline_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`offline_address` AS string)), '') AS string) END as string)
 AS `offline_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_status_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_code` AS string)), '') AS string) END as string)
 AS `tracking_code`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_resolved` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_resolved` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_resolved` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_resolved` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_resolved`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_archived` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_archived` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_archived` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_archived` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_archived`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) END as string)
 AS `ticket_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `admin_user_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_reply_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_reply_name` AS string)), '') AS string) END as string)
 AS `last_reply_name`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_reply_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_reply_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_reply_at`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_gift`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exchange_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exchange_order_id` AS string)), '') AS string) END as string)
 AS `exchange_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_memo_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_memo_id` AS string)), '') AS string) END as string)
 AS `credit_memo_id`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_admin_read` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_admin_read` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_admin_read` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_admin_read` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_admin_read`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_address_id` AS string)), '') AS string) END as string)
 AS `return_address_id`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma` AS source_table

 ) AS un_ordered

