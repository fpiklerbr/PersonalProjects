

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_storage`
  OPTIONS()
  as 




    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lpn` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lpn` AS string)), '') AS string) END as string)
 AS `lpn`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hostsku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hostsku` AS string)), '') AS string) END as string)
 AS `hostsku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`skudescription` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`skudescription` AS string)), '') AS string) END as string)
 AS `skudescription`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qchold` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qchold` AS string)), '') AS string) END as string)
 AS `qchold`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as string)
 AS `quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`displaylocation` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`displaylocation` AS string)), '') AS string) END as string)
 AS `displaylocation`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rotype` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rotype` AS string)), '') AS string) END as string)
 AS `rotype`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiptorder` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiptorder` AS string)), '') AS string) END as string)
 AS `receiptorder`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created` AS string)), '') AS string) END as string)
 AS `created`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`received` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`received` AS string)), '') AS string) END as string)
 AS `received`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partial` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partial` AS string)), '') AS string) END as string)
 AS `partial`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`month_end` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`month_end` AS string)), '') AS string) END as string)
 AS `month_end`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`on_hand_30_days` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`on_hand_30_days` AS string)), '') AS string) END as string)
 AS `on_hand_30_days`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_14` AS string)), '') AS string) END as string)
 AS `unnamed_14`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_15` AS string)), '') AS string) END as string)
 AS `unnamed_15`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mult_lpn` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mult_lpn` AS string)), '') AS string) END as string)
 AS `mult_lpn`
  , `host_sku` AS `_raw_host_sku`
  , `sku_description` AS `_raw_sku_description`
  , `qc_hold` AS `_raw_qc_hold`
  , `ro_type` AS `_raw_ro_type`
  , `receipt_order` AS `_raw_receipt_order`
  , `location_sq_ft_` AS `_raw_location_sq_ft_`
  , `no_of_days` AS `_raw_no_of_days`
  , `free_storage_period_days_` AS `_raw_free_storage_period_days_`
  , `_0_365_days_square_feet_utilized_` AS `_raw__0_365_days_square_feet_utilized_`
  , `_366_730_days_square_feet_utilized_` AS `_raw__366_730_days_square_feet_utilized_`
  , `_730_days_square_feet_utilized_` AS `_raw__730_days_square_feet_utilized_`
  , `unnamed_19` AS `_raw_unnamed_19`
FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_storage`

WHERE 1=1
AND file_name NOT IN ('ZD Transaction History - 10_31_20 FOR ZD (1).xlsx')
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(left(file_name, 2) as string)
 AS `cap_client_center`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `lpn` AS `lpn`
  , `hostsku` AS `hostsku`
  , `skudescription` AS `skudescription`
  , `status` AS `status`
  , `qchold` AS `qchold`
  , `quantity` AS `quantity`
  , `displaylocation` AS `displaylocation`
  , `rotype` AS `rotype`
  , `receiptorder` AS `receiptorder`
  , `created` AS `created`
  , `received` AS `received`
  , `partial` AS `partial`
  , `month_end` AS `month_end`
  , `on_hand_30_days` AS `on_hand_30_days`
  , `unnamed_14` AS `unnamed_14`
  , `unnamed_15` AS `unnamed_15`
  , `file_name` AS `file_name`
  , `sheet_name` AS `sheet_name`
  , `file_time` AS `file_time`
  , `mult_lpn` AS `mult_lpn`
  , `cap_client_center` AS `cap_client_center`
  , `_raw_host_sku` AS `_raw_host_sku`
  , `_raw_sku_description` AS `_raw_sku_description`
  , `_raw_qc_hold` AS `_raw_qc_hold`
  , `_raw_ro_type` AS `_raw_ro_type`
  , `_raw_receipt_order` AS `_raw_receipt_order`
  , `_raw_location_sq_ft_` AS `_raw_location_sq_ft_`
  , `_raw_no_of_days` AS `_raw_no_of_days`
  , `_raw_free_storage_period_days_` AS `_raw_free_storage_period_days_`
  , `_raw__0_365_days_square_feet_utilized_` AS `_raw__0_365_days_square_feet_utilized_`
  , `_raw__366_730_days_square_feet_utilized_` AS `_raw__366_730_days_square_feet_utilized_`
  , `_raw__730_days_square_feet_utilized_` AS `_raw__730_days_square_feet_utilized_`
  , `_raw_unnamed_19` AS `_raw_unnamed_19`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

