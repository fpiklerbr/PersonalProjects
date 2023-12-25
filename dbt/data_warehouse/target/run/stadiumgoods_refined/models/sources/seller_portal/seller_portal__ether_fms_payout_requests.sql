

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payout_requests`
  OPTIONS()
  as 



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_fms_payout_request_id`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_method` AS string)), '') AS string) END as string)
 AS `pay_method`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consigner_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consigner_id` AS string)), '') AS string) END as string)
 AS `consignor_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'paid_out' AS string)
WHEN 2 THEN cast( 'scheduled' AS string)
WHEN 3 THEN cast( 'in_progress' AS string)
WHEN 5 THEN cast( 'void' AS string)
WHEN 6 THEN cast( 'pending_retry' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `payout_request_status`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bank_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bank_account_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `bank_account_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_requested_products_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_requested_products_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `item_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_payout_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_payout_currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_currency` AS string)), '') AS string) END as string)
 AS `fee_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_payout_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_payout_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `gross_payout_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `fee_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paid_out_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_out_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `paid_out_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sla_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sla_deadline` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sla_deadline`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`new_payout_flow` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_payout_flow` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`new_payout_flow` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_payout_flow` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_new_payout_flow`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`max_payment_attempts` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`max_payment_attempts` AS string)), '') AS string) END as float64)
 as int64)
 AS `max_payment_attempts`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requests`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(gross_payout_base_amount - fee_base_amount as numeric)
 AS `net_payout_base_amount`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    safe_cast(datetime(safe_cast(created_at AS timestamp), 'America/New_York') AS date) AS `payout_request_date`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_fms_payout_request_id` AS `ether_fms_payout_request_id`
  , `created_at` AS `created_at`
  , `payout_request_date` AS `payout_request_date`
  , `updated_at` AS `updated_at`
  , `user_id` AS `user_id`
  , `pay_method` AS `pay_method`
  , `consignor_id` AS `consignor_id`
  , `payout_request_status` AS `payout_request_status`
  , `bank_account_id` AS `bank_account_id`
  , `item_count` AS `item_count`
  , `base_currency` AS `base_currency`
  , `gross_payout_base_amount` AS `gross_payout_base_amount`
  , `fee_base_amount` AS `fee_base_amount`
  , `net_payout_base_amount` AS `net_payout_base_amount`
  , `paid_out_at` AS `paid_out_at`
  , `sla_deadline` AS `sla_deadline`
  , `is_new_payout_flow` AS `is_new_payout_flow`
  , `lock_version` AS `lock_version`
  , `max_payment_attempts` AS `max_payment_attempts`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

