

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`adyen__settlement_detail_report_batch`
  OPTIONS()
  as 

  
































 

SELECT   `company_account`,  `merchant_account`,  `psp_reference`,  `merchant_reference`,  `payment_method`,  `creation_date`,  `time_zone`,  `type`,  `modification_reference`,  `gross_currency`,  `gross_debit_gc_`,  `gross_credit_gc_`,  `exchange_rate`,  `net_currency`,  `net_debit_nc_`,  `net_credit_nc_`,  `commission_nc_`,  `markup_nc_`,  `scheme_fees_nc_`,  `interchange_nc_`,  `payment_method_variant`,  `modification_merchant_reference`,  `batch_number`,  `reserved4`,  `reserved5`,  `reserved6`,  `reserved7`,  `reserved8`,  `reserved9`,  `reserved10`,  `file_suffix`,  `file_name`,  `file_time`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`company_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`company_account` AS string)), '') AS string) END as string)
 AS `company_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_account` AS string)), '') AS string) END as string)
 AS `merchant_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`psp_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`psp_reference` AS string)), '') AS string) END as string)
 AS `psp_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_reference` AS string)), '') AS string) END as string)
 AS `merchant_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) END as string)
 AS `payment_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creation_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creation_date` AS string)), '') AS string) END as string)
 AS `creation_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_zone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_zone` AS string)), '') AS string) END as string)
 AS `time_zone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`modification_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`modification_reference` AS string)), '') AS string) END as string)
 AS `modification_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gross_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gross_currency` AS string)), '') AS string) END as string)
 AS `gross_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gross_debit_gc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gross_debit_gc_` AS string)), '') AS string) END as string)
 AS `gross_debit_gc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gross_credit_gc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gross_credit_gc_` AS string)), '') AS string) END as string)
 AS `gross_credit_gc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) END as string)
 AS `exchange_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_currency` AS string)), '') AS string) END as string)
 AS `net_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_debit_nc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_debit_nc_` AS string)), '') AS string) END as string)
 AS `net_debit_nc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_credit_nc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_credit_nc_` AS string)), '') AS string) END as string)
 AS `net_credit_nc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_nc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_nc_` AS string)), '') AS string) END as string)
 AS `commission_nc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`markup_nc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`markup_nc_` AS string)), '') AS string) END as string)
 AS `markup_nc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scheme_fees_nc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scheme_fees_nc_` AS string)), '') AS string) END as string)
 AS `scheme_fees_nc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`interchange_nc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`interchange_nc_` AS string)), '') AS string) END as string)
 AS `interchange_nc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_method_variant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_method_variant` AS string)), '') AS string) END as string)
 AS `payment_method_variant`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`modification_merchant_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`modification_merchant_reference` AS string)), '') AS string) END as string)
 AS `modification_merchant_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`batch_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`batch_number` AS string)), '') AS string) END as string)
 AS `batch_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved4` AS string)), '') AS string) END as string)
 AS `reserved4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved5` AS string)), '') AS string) END as string)
 AS `reserved5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved6` AS string)), '') AS string) END as string)
 AS `reserved6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved7` AS string)), '') AS string) END as string)
 AS `reserved7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved8` AS string)), '') AS string) END as string)
 AS `reserved8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved9` AS string)), '') AS string) END as string)
 AS `reserved9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved10` AS string)), '') AS string) END as string)
 AS `reserved10`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_suffix` AS string)), '') AS string) END as float64)
 as int64)
 AS `file_suffix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`adyen_settlement_detail_report_batch` AS source_table

 ) AS un_ordered

;

