

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorder`
  OPTIONS()
  as 


  






































































































































































































































































































































































 

SELECT   `updtick_0`,  `x3_order_id`,  `cpy_0`,  `sohtyp_0`,  `sohcat_0`,  `sales_site`,  `channel_code`,  `bpcinv_0`,  `bpcpyr_0`,  `bpapyr_0`,  `bpcgru_0`,  `bpaadd_0`,  `customer_order_reference`,  `pjt_0`,  `order_date`,  `vlydatcon_0`,  `shidat_0`,  `demdlvdat_0`,  `lndrtndat_0`,  `daylti_0`,  `bpcnam_0`,  `bpcnam_1`,  `bpaord_0`,  `bpcaddlig_0`,  `bpcaddlig_1`,  `bpcaddlig_2`,  `bpcposcod_0`,  `bpccty_0`,  `bpcsat_0`,  `bpccry_0`,  `bpccrynam_0`,  `cntnam_0`,  `bpinam_0`,  `bpinam_1`,  `bpainv_0`,  `bpiaddlig_0`,  `bpiaddlig_1`,  `bpiaddlig_2`,  `bpiposcod_0`,  `bpicty_0`,  `bpisat_0`,  `bpicry_0`,  `bpicrynam_0`,  `bpieecnum_0`,  `cninam_0`,  `shipping_name_1`,  `shipping_name_2`,  `shipping_address_1`,  `shipping_address_2`,  `shipping_address_3`,  `shipping_postcode`,  `shipping_city`,  `shipping_region`,  `shipping_country`,  `shipping_country_name`,  `cndnam_0`,  `rep_0`,  `rep_1`,  `cur_0`,  `chgtyp_0`,  `chgrat_0`,  `die_0`,  `die_1`,  `die_2`,  `die_3`,  `die_4`,  `die_5`,  `die_6`,  `die_7`,  `die_8`,  `die_9`,  `die_10`,  `die_11`,  `die_12`,  `die_13`,  `die_14`,  `die_15`,  `die_16`,  `die_17`,  `die_18`,  `die_19`,  `cce_0`,  `cce_1`,  `cce_2`,  `cce_3`,  `cce_4`,  `cce_5`,  `cce_6`,  `cce_7`,  `cce_8`,  `cce_9`,  `cce_10`,  `cce_11`,  `cce_12`,  `cce_13`,  `cce_14`,  `cce_15`,  `cce_16`,  `cce_17`,  `cce_18`,  `cce_19`,  `lan_0`,  `vacbpr_0`,  `sstentcod_0`,  `pte_0`,  `tsccod_0`,  `tsccod_1`,  `tsccod_2`,  `tsccod_3`,  `tsccod_4`,  `dep_0`,  `carrier`,  `delivery_mode`,  `stofcy_0`,  `drn_0`,  `dlvpio_0`,  `ordcle_0`,  `odl_0`,  `dme_0`,  `ime_0`,  `ocnflg_0`,  `ocnprn_0`,  `copnbr_0`,  `sohtex1_0`,  `sohtex2_0`,  `sqhnum_0`,  `betfcy_0`,  `is_intersite`,  `betcpy_0`,  `orifcy_0`,  `prfnum_0`,  `lasdlvnum_0`,  `lasdlvdat_0`,  `last_invoice_id`,  `last_invoice_date`,  `order_total_discount`,  `invdtaamt_1`,  `invdtaamt_2`,  `invdtaamt_3`,  `invdtaamt_4`,  `invdtaamt_5`,  `invdtaamt_6`,  `invdtaamt_7`,  `invdtaamt_8`,  `invdtaamt_9`,  `invdtaamt_10`,  `invdtaamt_11`,  `invdtaamt_12`,  `invdtaamt_13`,  `invdtaamt_14`,  `invdtaamt_15`,  `invdtaamt_16`,  `invdtaamt_17`,  `invdtaamt_18`,  `invdtaamt_19`,  `invdtaamt_20`,  `invdtaamt_21`,  `invdtaamt_22`,  `invdtaamt_23`,  `invdtaamt_24`,  `invdtaamt_25`,  `invdtaamt_26`,  `invdtaamt_27`,  `invdtaamt_28`,  `invdtaamt_29`,  `invdtatyp_0`,  `invdtatyp_1`,  `invdtatyp_2`,  `invdtatyp_3`,  `invdtatyp_4`,  `invdtatyp_5`,  `invdtatyp_6`,  `invdtatyp_7`,  `invdtatyp_8`,  `invdtatyp_9`,  `invdtatyp_10`,  `invdtatyp_11`,  `invdtatyp_12`,  `invdtatyp_13`,  `invdtatyp_14`,  `invdtatyp_15`,  `invdtatyp_16`,  `invdtatyp_17`,  `invdtatyp_18`,  `invdtatyp_19`,  `invdtatyp_20`,  `invdtatyp_21`,  `invdtatyp_22`,  `invdtatyp_23`,  `invdtatyp_24`,  `invdtatyp_25`,  `invdtatyp_26`,  `invdtatyp_27`,  `invdtatyp_28`,  `invdtatyp_29`,  `invdtadsp_0`,  `invdtadsp_1`,  `invdtadsp_2`,  `invdtadsp_3`,  `invdtadsp_4`,  `invdtadsp_5`,  `invdtadsp_6`,  `invdtadsp_7`,  `invdtadsp_8`,  `invdtadsp_9`,  `invdtadsp_10`,  `invdtadsp_11`,  `invdtadsp_12`,  `invdtadsp_13`,  `invdtadsp_14`,  `invdtadsp_15`,  `invdtadsp_16`,  `invdtadsp_17`,  `invdtadsp_18`,  `invdtadsp_19`,  `invdtadsp_20`,  `invdtadsp_21`,  `invdtadsp_22`,  `invdtadsp_23`,  `invdtadsp_24`,  `invdtadsp_25`,  `invdtadsp_26`,  `invdtadsp_27`,  `invdtadsp_28`,  `invdtadsp_29`,  `invdta_0`,  `invdta_1`,  `invdta_2`,  `invdta_3`,  `invdta_4`,  `invdta_5`,  `invdta_6`,  `invdta_7`,  `invdta_8`,  `invdta_9`,  `invdta_10`,  `invdta_11`,  `invdta_12`,  `invdta_13`,  `invdta_14`,  `invdta_15`,  `invdta_16`,  `invdta_17`,  `invdta_18`,  `invdta_19`,  `invdta_20`,  `invdta_21`,  `invdta_22`,  `invdta_23`,  `invdta_24`,  `invdta_25`,  `invdta_26`,  `invdta_27`,  `invdta_28`,  `invdta_29`,  `prityp_0`,  `ordnot_0`,  `ordati_0`,  `ordnotl_0`,  `ordatil_0`,  `ordinvnot_0`,  `order_total`,  `ordinvnotl_0`,  `ordinvatil_0`,  `dlrnot_0`,  `dlrati_0`,  `pfmtot_0`,  `discrgtyp_0`,  `discrgtyp_1`,  `discrgtyp_2`,  `discrgtyp_3`,  `discrgtyp_4`,  `discrgtyp_5`,  `discrgtyp_6`,  `discrgtyp_7`,  `discrgtyp_8`,  `invdtalin_0`,  `invdtalin_1`,  `invdtalin_2`,  `invdtalin_3`,  `invdtalin_4`,  `invdtalin_5`,  `invdtalin_6`,  `invdtalin_7`,  `invdtalin_8`,  `alltyp_0`,  `unl_0`,  `linnbr_0`,  `clelinnbr_0`,  `alllinnbr_0`,  `dlvlinnbr_0`,  `invlinnbr_0`,  `order_status_code`,  `order_status`,  `is_closed`,  `allocation_status_code`,  `allocation_status`,  `delivery_status_code`,  `delivery_status`,  `invoice_status_code`,  `invoice_status`,  `credit_status_code`,  `credit_status`,  `appflg_0`,  `revnum_0`,  `shiadecod_0`,  `eecict_0`,  `eecloc_0`,  `ictcty_0`,  `ffwnum_0`,  `ffwadd_0`,  `geocod_0`,  `insctyflg_0`,  `vtt_0`,  `amttax_0`,  `bastax_0`,  `cclren_0`,  `ccldat_0`,  `srenum_0`,  `cmgnum_0`,  `opgnum_0`,  `opgtyp_0`,  `plistc_0`,  `expnum_0`,  `sinum_0`,  `total_qty`,  `dsptotwei_0`,  `dsptotvol_0`,  `dspweu_0`,  `dspvou_0`,  `sdhtyp_0`,  `creation_user_id`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `hldsta_0`,  `hldcod_0`,  `hldusr_0`,  `hlddat_0`,  `hldtim_0`,  `hldcodp_0`,  `hldusrp_0`,  `hlddatp_0`,  `hldtimp_0`,  `cdtstap_0`,  `adrval_0`,  `created_at`,  `upddattim_0`,  `auuid_0`,  `xb_tpbcry_0`,  `ymageml_0`,  `mag_customer_email`,  `xb_resflg_0`,  `mag_customer_id`,  `xb_bacct_0`,  `mag_order_id`,  `xb_tpbnam_0`,  `xb_tpbadd_0`,  `xb_tpbcty_0`,  `xb_tpbsat_0`,  `xb_tpbzip_0`,  `mag_order_status`,  `zextordnum_0`,  `zbpdtel_0`,  `rowid`
    , `_raw_zclousr_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , CASE betfcy_0
WHEN 1 THEN cast( 'False' AS boolean)
WHEN 2 THEN cast( 'True' AS boolean)
ELSE cast(betfcy_0 AS boolean)
END AS `is_intersite`
  , CASE order_status_code
WHEN 0 THEN cast( 'None' AS string)
WHEN 1 THEN cast( 'Open' AS string)
WHEN 2 THEN cast( 'Closed' AS string)
ELSE cast(order_status_code AS string)
END AS `order_status`
  , CASE order_status_code
WHEN 0 THEN cast( 'False' AS boolean)
WHEN 1 THEN cast( 'False' AS boolean)
WHEN 2 THEN cast( 'True' AS boolean)
ELSE cast(order_status_code AS boolean)
END AS `is_closed`
  , CASE allocation_status_code
WHEN 0 THEN cast( 'None' AS string)
WHEN 1 THEN cast( 'Not Allocated' AS string)
WHEN 2 THEN cast( 'Partially Allocated' AS string)
WHEN 3 THEN cast( 'Allocated' AS string)
ELSE cast(allocation_status_code AS string)
END AS `allocation_status`
  , CASE delivery_status_code
WHEN 0 THEN cast( 'None' AS string)
WHEN 1 THEN cast( 'Not Delivered' AS string)
WHEN 2 THEN cast( 'Partially Delivered' AS string)
WHEN 3 THEN cast( 'Delivered' AS string)
ELSE cast(delivery_status_code AS string)
END AS `delivery_status`
  , CASE invoice_status_code
WHEN 0 THEN cast( 'None' AS string)
WHEN 1 THEN cast( 'Not Invoiced' AS string)
WHEN 2 THEN cast( 'Partially Invoiced' AS string)
WHEN 3 THEN cast( 'Invoiced' AS string)
ELSE cast(invoice_status_code AS string)
END AS `invoice_status`
  , CASE credit_status_code
WHEN 0 THEN cast( 'None' AS string)
WHEN 1 THEN cast( 'OK' AS string)
WHEN 2 THEN cast( 'On Hold' AS string)
WHEN 3 THEN cast( 'Limit Exceeded' AS string)
WHEN 4 THEN cast( 'Prepayment Not Deposited' AS string)
ELSE cast(credit_status_code AS string)
END AS `credit_status` 
FROM ( 

SELECT
    *

  , 
    safe_cast(nullif(trim(lower(ymageml_0)), '') as string)
 AS `mag_customer_email` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) END as string)
 AS `x3_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohtyp_0` AS string)), '') AS string) END as string)
 AS `sohtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sohcat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`salfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`salfcy_0` AS string)), '') AS string) END as string)
 AS `sales_site`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) END as string)
 AS `channel_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcinv_0` AS string)), '') AS string) END as string)
 AS `bpcinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcpyr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcpyr_0` AS string)), '') AS string) END as string)
 AS `bpcpyr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpapyr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpapyr_0` AS string)), '') AS string) END as string)
 AS `bpapyr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcgru_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcgru_0` AS string)), '') AS string) END as string)
 AS `bpcgru_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cusordref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cusordref_0` AS string)), '') AS string) END as string)
 AS `customer_order_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) END as string)
 AS `pjt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `order_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vlydatcon_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vlydatcon_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `vlydatcon_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `shidat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demdlvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demdlvdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `demdlvdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lndrtndat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lndrtndat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lndrtndat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daylti_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daylti_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `daylti_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcnam_0` AS string)), '') AS string) END as string)
 AS `bpcnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcnam_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcnam_1` AS string)), '') AS string) END as string)
 AS `bpcnam_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaord_0` AS string)), '') AS string) END as string)
 AS `bpaord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcaddlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcaddlig_0` AS string)), '') AS string) END as string)
 AS `bpcaddlig_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcaddlig_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcaddlig_1` AS string)), '') AS string) END as string)
 AS `bpcaddlig_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcaddlig_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcaddlig_2` AS string)), '') AS string) END as string)
 AS `bpcaddlig_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcposcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcposcod_0` AS string)), '') AS string) END as string)
 AS `bpcposcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpccty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpccty_0` AS string)), '') AS string) END as string)
 AS `bpccty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcsat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcsat_0` AS string)), '') AS string) END as string)
 AS `bpcsat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpccry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpccry_0` AS string)), '') AS string) END as string)
 AS `bpccry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpccrynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpccrynam_0` AS string)), '') AS string) END as string)
 AS `bpccrynam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntnam_0` AS string)), '') AS string) END as string)
 AS `cntnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpinam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpinam_0` AS string)), '') AS string) END as string)
 AS `bpinam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpinam_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpinam_1` AS string)), '') AS string) END as string)
 AS `bpinam_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpiaddlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpiaddlig_0` AS string)), '') AS string) END as string)
 AS `bpiaddlig_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpiaddlig_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpiaddlig_1` AS string)), '') AS string) END as string)
 AS `bpiaddlig_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpiaddlig_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpiaddlig_2` AS string)), '') AS string) END as string)
 AS `bpiaddlig_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpiposcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpiposcod_0` AS string)), '') AS string) END as string)
 AS `bpiposcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpicty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpicty_0` AS string)), '') AS string) END as string)
 AS `bpicty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpisat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpisat_0` AS string)), '') AS string) END as string)
 AS `bpisat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpicry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpicry_0` AS string)), '') AS string) END as string)
 AS `bpicry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpicrynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpicrynam_0` AS string)), '') AS string) END as string)
 AS `bpicrynam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpieecnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpieecnum_0` AS string)), '') AS string) END as string)
 AS `bpieecnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cninam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cninam_0` AS string)), '') AS string) END as string)
 AS `cninam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdnam_0` AS string)), '') AS string) END as string)
 AS `shipping_name_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdnam_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdnam_1` AS string)), '') AS string) END as string)
 AS `shipping_name_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdaddlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdaddlig_0` AS string)), '') AS string) END as string)
 AS `shipping_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdaddlig_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdaddlig_1` AS string)), '') AS string) END as string)
 AS `shipping_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdaddlig_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdaddlig_2` AS string)), '') AS string) END as string)
 AS `shipping_address_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdposcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdposcod_0` AS string)), '') AS string) END as string)
 AS `shipping_postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdcty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdcty_0` AS string)), '') AS string) END as string)
 AS `shipping_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdsat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdsat_0` AS string)), '') AS string) END as string)
 AS `shipping_region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdcry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdcry_0` AS string)), '') AS string) END as string)
 AS `shipping_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdcrynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdcrynam_0` AS string)), '') AS string) END as string)
 AS `shipping_country_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cndnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cndnam_0` AS string)), '') AS string) END as string)
 AS `cndnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rep_0` AS string)), '') AS string) END as string)
 AS `rep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rep_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rep_1` AS string)), '') AS string) END as string)
 AS `rep_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chgtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chgrat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chgrat_0` AS string)), '') AS string) END as numeric)
 AS `chgrat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_0` AS string)), '') AS string) END as string)
 AS `die_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_1` AS string)), '') AS string) END as string)
 AS `die_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_2` AS string)), '') AS string) END as string)
 AS `die_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_3` AS string)), '') AS string) END as string)
 AS `die_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_4` AS string)), '') AS string) END as string)
 AS `die_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_5` AS string)), '') AS string) END as string)
 AS `die_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_6` AS string)), '') AS string) END as string)
 AS `die_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_7` AS string)), '') AS string) END as string)
 AS `die_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_8` AS string)), '') AS string) END as string)
 AS `die_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_9` AS string)), '') AS string) END as string)
 AS `die_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_10` AS string)), '') AS string) END as string)
 AS `die_10`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_11` AS string)), '') AS string) END as string)
 AS `die_11`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_12` AS string)), '') AS string) END as string)
 AS `die_12`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_13` AS string)), '') AS string) END as string)
 AS `die_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_14` AS string)), '') AS string) END as string)
 AS `die_14`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_15` AS string)), '') AS string) END as string)
 AS `die_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_16` AS string)), '') AS string) END as string)
 AS `die_16`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_17` AS string)), '') AS string) END as string)
 AS `die_17`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_18` AS string)), '') AS string) END as string)
 AS `die_18`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_19` AS string)), '') AS string) END as string)
 AS `die_19`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_0` AS string)), '') AS string) END as string)
 AS `cce_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_1` AS string)), '') AS string) END as string)
 AS `cce_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_2` AS string)), '') AS string) END as string)
 AS `cce_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_3` AS string)), '') AS string) END as string)
 AS `cce_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_4` AS string)), '') AS string) END as string)
 AS `cce_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_5` AS string)), '') AS string) END as string)
 AS `cce_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_6` AS string)), '') AS string) END as string)
 AS `cce_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_7` AS string)), '') AS string) END as string)
 AS `cce_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_8` AS string)), '') AS string) END as string)
 AS `cce_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_9` AS string)), '') AS string) END as string)
 AS `cce_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_10` AS string)), '') AS string) END as string)
 AS `cce_10`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_11` AS string)), '') AS string) END as string)
 AS `cce_11`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_12` AS string)), '') AS string) END as string)
 AS `cce_12`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_13` AS string)), '') AS string) END as string)
 AS `cce_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_14` AS string)), '') AS string) END as string)
 AS `cce_14`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_15` AS string)), '') AS string) END as string)
 AS `cce_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_16` AS string)), '') AS string) END as string)
 AS `cce_16`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_17` AS string)), '') AS string) END as string)
 AS `cce_17`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_18` AS string)), '') AS string) END as string)
 AS `cce_18`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_19` AS string)), '') AS string) END as string)
 AS `cce_19`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lan_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lan_0` AS string)), '') AS string) END as string)
 AS `lan_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) END as string)
 AS `vacbpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sstentcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sstentcod_0` AS string)), '') AS string) END as string)
 AS `sstentcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) END as string)
 AS `pte_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsccod_0` AS string)), '') AS string) END as string)
 AS `tsccod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsccod_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsccod_1` AS string)), '') AS string) END as string)
 AS `tsccod_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsccod_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsccod_2` AS string)), '') AS string) END as string)
 AS `tsccod_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsccod_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsccod_3` AS string)), '') AS string) END as string)
 AS `tsccod_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsccod_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsccod_4` AS string)), '') AS string) END as string)
 AS `tsccod_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) END as string)
 AS `dep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) END as string)
 AS `carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) END as string)
 AS `delivery_mode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `stofcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`drn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`drn_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `drn_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvpio_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvpio_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dlvpio_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordcle_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordcle_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ordcle_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`odl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`odl_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `odl_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dme_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dme_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dme_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ime_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ime_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ime_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ocnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ocnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ocnflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ocnprn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ocnprn_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ocnprn_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`copnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`copnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `copnbr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohtex1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohtex1_0` AS string)), '') AS string) END as string)
 AS `sohtex1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohtex2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohtex2_0` AS string)), '') AS string) END as string)
 AS `sohtex2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sqhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sqhnum_0` AS string)), '') AS string) END as string)
 AS `sqhnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`betfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`betfcy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `betfcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`betcpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`betcpy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `betcpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orifcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orifcy_0` AS string)), '') AS string) END as string)
 AS `orifcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prfnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prfnum_0` AS string)), '') AS string) END as string)
 AS `prfnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasdlvnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasdlvnum_0` AS string)), '') AS string) END as string)
 AS `lasdlvnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasdlvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasdlvdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lasdlvdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasinvnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasinvnum_0` AS string)), '') AS string) END as string)
 AS `last_invoice_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasinvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasinvdat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `last_invoice_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_0` AS string)), '') AS string) END as float64)
 AS `order_total_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_1` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_2` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_3` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_4` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_5` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_6` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_7` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_8` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_9` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_10` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_10`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_11` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_11`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_12` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_12`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_13` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_14` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_14`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_15` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_16` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_16`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_17` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_17`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_18` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_18`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_19` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_19`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_20` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_20`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_21` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_21`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_22` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_22`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_23` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_23`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_24` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_24`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_25` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_25`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_26` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_26`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_27` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_27`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_28` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_28`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_29` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_29`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_8`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_9` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_9`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_10` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_10`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_11` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_11`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_12` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_12`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_13` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_13`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_14` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_14`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_15` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_15`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_16` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_16`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_17` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_17`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_18` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_18`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_19` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_19`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_20` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_20`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_21` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_21`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_22` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_22`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_23` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_23`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_24` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_24`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_25` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_25`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_26` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_26`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_27` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_27`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_28` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_28`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtatyp_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtatyp_29` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtatyp_29`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_0` AS string)), '') AS string) END as string)
 AS `invdtadsp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_1` AS string)), '') AS string) END as string)
 AS `invdtadsp_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_2` AS string)), '') AS string) END as string)
 AS `invdtadsp_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_3` AS string)), '') AS string) END as string)
 AS `invdtadsp_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_4` AS string)), '') AS string) END as string)
 AS `invdtadsp_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_5` AS string)), '') AS string) END as string)
 AS `invdtadsp_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_6` AS string)), '') AS string) END as string)
 AS `invdtadsp_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_7` AS string)), '') AS string) END as string)
 AS `invdtadsp_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_8` AS string)), '') AS string) END as string)
 AS `invdtadsp_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_9` AS string)), '') AS string) END as string)
 AS `invdtadsp_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_10` AS string)), '') AS string) END as string)
 AS `invdtadsp_10`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_11` AS string)), '') AS string) END as string)
 AS `invdtadsp_11`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_12` AS string)), '') AS string) END as string)
 AS `invdtadsp_12`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_13` AS string)), '') AS string) END as string)
 AS `invdtadsp_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_14` AS string)), '') AS string) END as string)
 AS `invdtadsp_14`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_15` AS string)), '') AS string) END as string)
 AS `invdtadsp_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_16` AS string)), '') AS string) END as string)
 AS `invdtadsp_16`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_17` AS string)), '') AS string) END as string)
 AS `invdtadsp_17`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_18` AS string)), '') AS string) END as string)
 AS `invdtadsp_18`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_19` AS string)), '') AS string) END as string)
 AS `invdtadsp_19`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_20` AS string)), '') AS string) END as string)
 AS `invdtadsp_20`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_21` AS string)), '') AS string) END as string)
 AS `invdtadsp_21`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_22` AS string)), '') AS string) END as string)
 AS `invdtadsp_22`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_23` AS string)), '') AS string) END as string)
 AS `invdtadsp_23`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_24` AS string)), '') AS string) END as string)
 AS `invdtadsp_24`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_25` AS string)), '') AS string) END as string)
 AS `invdtadsp_25`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_26` AS string)), '') AS string) END as string)
 AS `invdtadsp_26`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_27` AS string)), '') AS string) END as string)
 AS `invdtadsp_27`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_28` AS string)), '') AS string) END as string)
 AS `invdtadsp_28`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtadsp_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtadsp_29` AS string)), '') AS string) END as string)
 AS `invdtadsp_29`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_8`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_9` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_9`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_10` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_10`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_11` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_11`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_12` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_12`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_13` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_13`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_14` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_14`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_15` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_15`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_16` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_16`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_17` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_17`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_18` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_18`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_19` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_19`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_20` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_20`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_21` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_21`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_22` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_22`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_23` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_23`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_24` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_24`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_25` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_25`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_26` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_26`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_27` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_27`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_28` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_28`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_29` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_29`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prityp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prityp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prityp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordnot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordnot_0` AS string)), '') AS string) END as numeric)
 AS `ordnot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordati_0` AS string)), '') AS string) END as numeric)
 AS `ordati_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordnotl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordnotl_0` AS string)), '') AS string) END as numeric)
 AS `ordnotl_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordatil_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordatil_0` AS string)), '') AS string) END as numeric)
 AS `ordatil_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordinvnot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordinvnot_0` AS string)), '') AS string) END as numeric)
 AS `ordinvnot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordinvati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordinvati_0` AS string)), '') AS string) END as float64)
 AS `order_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordinvnotl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordinvnotl_0` AS string)), '') AS string) END as numeric)
 AS `ordinvnotl_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordinvatil_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordinvatil_0` AS string)), '') AS string) END as numeric)
 AS `ordinvatil_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlrnot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlrnot_0` AS string)), '') AS string) END as numeric)
 AS `dlrnot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlrati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlrati_0` AS string)), '') AS string) END as numeric)
 AS `dlrati_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pfmtot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pfmtot_0` AS string)), '') AS string) END as numeric)
 AS `pfmtot_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgtyp_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgtyp_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgtyp_8`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin_8`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`alltyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`alltyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `alltyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unl_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `unl_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clelinnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clelinnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `clelinnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`alllinnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`alllinnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `alllinnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvlinnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvlinnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dlvlinnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invlinnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invlinnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invlinnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `allocation_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invoice_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cdtsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cdtsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `credit_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`appflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`appflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `appflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`revnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`revnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `revnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shiadecod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shiadecod_0` AS string)), '') AS string) END as string)
 AS `shiadecod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecict_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecict_0` AS string)), '') AS string) END as string)
 AS `eecict_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecloc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eecloc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ictcty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ictcty_0` AS string)), '') AS string) END as string)
 AS `ictcty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ffwnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ffwnum_0` AS string)), '') AS string) END as string)
 AS `ffwnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ffwadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ffwadd_0` AS string)), '') AS string) END as string)
 AS `ffwadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`geocod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`geocod_0` AS string)), '') AS string) END as string)
 AS `geocod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`insctyflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`insctyflg_0` AS string)), '') AS string) END as string)
 AS `insctyflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vtt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vtt_0` AS string)), '') AS string) END as string)
 AS `vtt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_0` AS string)), '') AS string) END as numeric)
 AS `amttax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_0` AS string)), '') AS string) END as numeric)
 AS `bastax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cclren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cclren_0` AS string)), '') AS string) END as string)
 AS `cclren_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ccldat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ccldat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `ccldat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srenum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srenum_0` AS string)), '') AS string) END as string)
 AS `srenum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cmgnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cmgnum_0` AS string)), '') AS string) END as string)
 AS `cmgnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`opgnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`opgnum_0` AS string)), '') AS string) END as string)
 AS `opgnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`opgtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`opgtyp_0` AS string)), '') AS string) END as string)
 AS `opgtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`plistc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`plistc_0` AS string)), '') AS string) END as string)
 AS `plistc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sinum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sinum_0` AS string)), '') AS string) END as string)
 AS `sinum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsptotqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsptotqty_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_qty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsptotwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsptotwei_0` AS string)), '') AS string) END as numeric)
 AS `dsptotwei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsptotvol_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsptotvol_0` AS string)), '') AS string) END as numeric)
 AS `dsptotvol_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) END as string)
 AS `dspweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) END as string)
 AS `dspvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhtyp_0` AS string)), '') AS string) END as string)
 AS `sdhtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creation_user_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hldsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hldsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `hldsta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hldcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hldcod_0` AS string)), '') AS string) END as string)
 AS `hldcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hldusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hldusr_0` AS string)), '') AS string) END as string)
 AS `hldusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hlddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hlddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `hlddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hldtim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hldtim_0` AS string)), '') AS string) END as string)
 AS `hldtim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hldcodp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hldcodp_0` AS string)), '') AS string) END as string)
 AS `hldcodp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hldusrp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hldusrp_0` AS string)), '') AS string) END as string)
 AS `hldusrp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hlddatp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hlddatp_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `hlddatp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hldtimp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hldtimp_0` AS string)), '') AS string) END as string)
 AS `hldtimp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cdtstap_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cdtstap_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cdtstap_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adrval_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adrval_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `adrval_0`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddattim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) END as string)
 AS `auuid_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_tpbcry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_tpbcry_0` AS string)), '') AS string) END as string)
 AS `xb_tpbcry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ymageml_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ymageml_0` AS string)), '') AS string) END as string)
 AS `ymageml_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_resflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_resflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `xb_resflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ymagbpc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ymagbpc_0` AS string)), '') AS string) END as string)
 AS `mag_customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_bacct_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_bacct_0` AS string)), '') AS string) END as string)
 AS `xb_bacct_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ymagord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ymagord_0` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_tpbnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_tpbnam_0` AS string)), '') AS string) END as string)
 AS `xb_tpbnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_tpbadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_tpbadd_0` AS string)), '') AS string) END as string)
 AS `xb_tpbadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_tpbcty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_tpbcty_0` AS string)), '') AS string) END as string)
 AS `xb_tpbcty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_tpbsat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_tpbsat_0` AS string)), '') AS string) END as string)
 AS `xb_tpbsat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_tpbzip_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_tpbzip_0` AS string)), '') AS string) END as string)
 AS `xb_tpbzip_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ymgordstat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ymgordstat_0` AS string)), '') AS string) END as string)
 AS `mag_order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zextordnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zextordnum_0` AS string)), '') AS string) END as string)
 AS `zextordnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zbpdtel_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zbpdtel_0` AS string)), '') AS string) END as string)
 AS `zbpdtel_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `zclousr_0` AS `_raw_zclousr_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`sorder` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;

