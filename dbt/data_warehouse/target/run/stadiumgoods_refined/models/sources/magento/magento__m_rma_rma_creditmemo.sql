

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_rma_creditmemo`
  OPTIONS()
  as 

  



 

SELECT   `rma_creditmemo_id`,  `rc_rma_id`,  `rc_credit_memo_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rma_creditmemo_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rma_creditmemo_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `rma_creditmemo_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rc_rma_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rc_rma_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `rc_rma_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rc_credit_memo_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rc_credit_memo_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `rc_credit_memo_id`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma_creditmemo` AS source_table

 ) AS un_ordered

;

