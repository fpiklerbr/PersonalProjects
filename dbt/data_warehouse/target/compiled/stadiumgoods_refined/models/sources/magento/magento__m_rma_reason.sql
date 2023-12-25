

  







 

SELECT   `m_rma_reason_id`,  `name`,  `sort_order`,  `is_active`,  `only_for_admin`
    , `_raw_auto_approved_reason`
    , `_raw_is_shipping_cost_refundable`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_reason_id`

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
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_active`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`only_for_admin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`only_for_admin` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`only_for_admin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`only_for_admin` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `only_for_admin`


  , `auto_approved_reason` AS `_raw_auto_approved_reason`

  , `is_shipping_cost_refundable` AS `_raw_is_shipping_cost_refundable`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_reason` AS source_table

 ) AS un_ordered

