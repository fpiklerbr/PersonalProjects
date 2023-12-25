



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_ledger_account_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_ledger_tenant_id`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`type` AS string)), '') AS string), 
  'Ether::Ledger::Account::'
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`type` AS string)), '') AS string), 
  'Ether::Ledger::Account::'
, 
  ''
) END as string)
 AS `_raw_account_type`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`contra` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contra` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`contra` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contra` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_contra`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_cents` AS string)), '') AS string) END as numeric)
 AS `_raw_account_balance_in_cents`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_currency` AS string)), '') AS string) END as string)
 AS `account_balance_currency`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'Current Balance' AS string)
WHEN 1 THEN cast( 'Sale Revenue' AS string)
WHEN 2 THEN cast( 'Commissions' AS string)
WHEN 3 THEN cast( 'Payouts Paid Out' AS string)
WHEN 4 THEN cast( 'Payouts Requested' AS string)
WHEN 5 THEN cast( 'Manual Adjustments' AS string)
WHEN 6 THEN cast( 'Payout Fees' AS string)
WHEN 7 THEN cast( 'Returned Sales Revenue' AS string)
WHEN 8 THEN cast( 'Returned Commissions' AS string)
WHEN 9 THEN cast( 'Penalties' AS string)
WHEN 10 THEN cast( 'Aged Inventory Fees' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END AS string)
END AS `account_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(_raw_account_type || CASE WHEN is_contra IS TRUE THEN ' (Contra)' ELSE '' END as string)
 AS `account_type`
  , 
    safe_cast(CASE WHEN (_raw_account_type IN ('Asset', 'Expense')) = (is_contra IS TRUE) THEN 'Credit' ELSE 'Debit' END as string)
 AS `account_balance_type`
  , 
    safe_cast(_raw_account_balance_in_cents / 100 as numeric)
 AS `account_balance_amount`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_ledger_account_id` AS `ether_ledger_account_id`
  , `ether_ledger_tenant_id` AS `ether_ledger_tenant_id`
  , `account_type` AS `account_type`
  , `account_balance_type` AS `account_balance_type`
  , `account_balance_amount` AS `account_balance_amount`
  , `account_balance_currency` AS `account_balance_currency`
  , `lock_version` AS `lock_version`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `account_code` AS `account_code`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 