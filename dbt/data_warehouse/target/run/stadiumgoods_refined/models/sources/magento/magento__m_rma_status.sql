

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_status`
  OPTIONS()
  as 

  










 

SELECT   `m_rma_status_id`,  `name`,  `sort_order`,  `is_rma_resolved`,  `customer_message`,  `admin_message`,  `history_message`,  `is_active`,  `code`
    , `_raw_customer_email_template`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_status_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sort_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sort_order` AS string)), '') AS string) END as float64)
 as int64)
 AS `sort_order`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_rma_resolved` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_rma_resolved` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_rma_resolved` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_rma_resolved` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_rma_resolved`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_message` AS string)), '') AS string) END as string)
 AS `customer_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`admin_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`admin_message` AS string)), '') AS string) END as string)
 AS `admin_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`history_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`history_message` AS string)), '') AS string) END as string)
 AS `history_message`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_active`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `code`


  , `customer_email_template` AS `_raw_customer_email_template`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_status` AS source_table

 ) AS un_ordered

;

