

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_ledger_amounts`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_ledger_amount_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entry_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entry_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_ledger_entry_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_ledger_account_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_cents` AS string)), '') AS string) END as numeric)
 AS `_raw_account_entry_amount_in_cents`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_currency` AS string)), '') AS string) END as string)
 AS `account_entry_currency`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `_raw_is_credit`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_amounts`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(_raw_account_entry_amount_in_cents / 100 as numeric)
 AS `account_entry_amount`
  , 
    safe_cast(CASE WHEN _raw_is_credit IS TRUE THEN 'Credit' ELSE 'Debit' END as string)
 AS `account_entry_type`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_ledger_amount_id` AS `ether_ledger_amount_id`
  , `ether_ledger_entry_id` AS `ether_ledger_entry_id`
  , `ether_ledger_account_id` AS `ether_ledger_account_id`
  , `account_entry_amount` AS `account_entry_amount`
  , `account_entry_currency` AS `account_entry_currency`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `account_entry_type` AS `account_entry_type`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

