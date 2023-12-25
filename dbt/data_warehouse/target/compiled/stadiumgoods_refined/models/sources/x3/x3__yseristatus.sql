

  















































 

SELECT   `warehouse_0`,  `consignment_status`,  `alloctyp_0`,  `paid_out_status`,  `consignor_id`,  `consignor_name`,  `conscity_0`,  `x3_sku`,  `itmdes1_0`,  `mfgitmnum_0`,  `itmdes3_0`,  `ynickname_0`,  `sales_price`,  `commrate_0`,  `commission_amount`,  `payout_amount`,  `serial_number`,  `size_0`,  `issue_date`,  `intake_date`,  `rcptnum_0`,  `rcptlin_0`,  `intkreceiver_0`,  `payout_invoice_id`,  `payout_invoice_line`,  `stockstatus_0`,  `binloc_0`,  `shipmentid_0`,  `shipline_0`,  `invoiceid_0`,  `invcline_0`,  `pichnum_0`,  `picdlin_0`,  `x3_order_id`,  `orddat_0`,  `ymagord_0`,  `ymagbpc_0`,  `ymageml_0`,  `shipstatus_0`,  `credat_0`,  `cost`,  `payout_date`
    , `_raw_zoriserial_0`
    , `_raw_pnhnum_0`
    , `_raw_rtndat_0`
    , `_raw_paidtype_0`
    , `_raw_accdate_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_0` AS string)), '') AS string) END as string)
 AS `warehouse_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consstatus_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consstatus_0` AS string)), '') AS string) END as string)
 AS `consignment_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`alloctyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`alloctyp_0` AS string)), '') AS string) END as string)
 AS `alloctyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paidoutstat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paidoutstat_0` AS string)), '') AS string) END as string)
 AS `paid_out_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignorid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignorid_0` AS string)), '') AS string) END as string)
 AS `consignor_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consname_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consname_0` AS string)), '') AS string) END as string)
 AS `consignor_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`conscity_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`conscity_0` AS string)), '') AS string) END as string)
 AS `conscity_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) END as string)
 AS `itmdes1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mfgitmnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mfgitmnum_0` AS string)), '') AS string) END as string)
 AS `mfgitmnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes3_0` AS string)), '') AS string) END as string)
 AS `itmdes3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ynickname_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ynickname_0` AS string)), '') AS string) END as string)
 AS `ynickname_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oriprice_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oriprice_0` AS string)), '') AS string) END as float64)
 AS `sales_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commrate_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commrate_0` AS string)), '') AS string) END as numeric)
 AS `commrate_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commamt_0` AS string)), '') AS string) END as float64)
 AS `commission_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payoutamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payoutamt_0` AS string)), '') AS string) END as float64)
 AS `payout_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_0` AS string)), '') AS string) END as string)
 AS `size_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issuedate_0` AS string)), '') AS string) IN ('1753-01-01','1753-01-01 00:00:00','1900-01-01','1900-01-01 00:00:00','2999-12-31','2999-12-31 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issuedate_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `issue_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcptdate_0` AS string)), '') AS string) IN ('1753-01-01','1753-01-01 00:00:00','1900-01-01','1900-01-01 00:00:00','2999-12-31','2999-12-31 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcptdate_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `intake_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcptnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcptnum_0` AS string)), '') AS string) END as string)
 AS `rcptnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcptlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcptlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `rcptlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intkreceiver_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intkreceiver_0` AS string)), '') AS string) END as string)
 AS `intkreceiver_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consinv_0` AS string)), '') AS string) END as string)
 AS `payout_invoice_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consinvline_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consinvline_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `payout_invoice_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stockstatus_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stockstatus_0` AS string)), '') AS string) END as string)
 AS `stockstatus_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`binloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`binloc_0` AS string)), '') AS string) END as string)
 AS `binloc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipmentid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipmentid_0` AS string)), '') AS string) END as string)
 AS `shipmentid_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipline_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipline_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipline_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoiceid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoiceid_0` AS string)), '') AS string) END as string)
 AS `invoiceid_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invcline_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invcline_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invcline_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pichnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pichnum_0` AS string)), '') AS string) END as string)
 AS `pichnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`picdlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`picdlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `picdlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) END as string)
 AS `x3_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `orddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ymagord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ymagord_0` AS string)), '') AS string) END as string)
 AS `ymagord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ymagbpc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ymagbpc_0` AS string)), '') AS string) END as string)
 AS `ymagbpc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ymageml_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ymageml_0` AS string)), '') AS string) END as string)
 AS `ymageml_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipstatus_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipstatus_0` AS string)), '') AS string) END as string)
 AS `shipstatus_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmcst_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmcst_0` AS string)), '') AS string) END as float64)
 AS `cost`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paiddate_0` AS string)), '') AS string) IN ('1753-01-01','1753-01-01 00:00:00','1900-01-01','1900-01-01 00:00:00','2999-12-31','2999-12-31 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paiddate_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `payout_date`


  , `zoriserial_0` AS `_raw_zoriserial_0`

  , `pnhnum_0` AS `_raw_pnhnum_0`

  , `rtndat_0` AS `_raw_rtndat_0`

  , `paidtype_0` AS `_raw_paidtype_0`

  , `accdate_0` AS `_raw_accdate_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`yseristatus` AS source_table

 ) AS un_ordered

