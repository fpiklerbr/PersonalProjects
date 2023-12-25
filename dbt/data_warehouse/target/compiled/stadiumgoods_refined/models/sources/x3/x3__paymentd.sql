


  




































































 

SELECT   `acc_0`,  `acc_1`,  `acc_2`,  `acc_3`,  `acc_4`,  `acc_5`,  `acc_6`,  `acc_7`,  `acc_8`,  `acc_9`,  `accsns_0`,  `acctyp_0`,  `amtbanfrc_0`,  `amtbanfrc1_0`,  `amtbanfrc2_0`,  `amtlin_0`,  `amtlin2_0`,  `auuid_0`,  `bprinv_0`,  `bprlin_0`,  `bprsacinv_0`,  `coa_0`,  `coa_1`,  `coa_2`,  `coa_3`,  `coa_4`,  `coa_5`,  `coa_6`,  `coa_7`,  `coa_8`,  `coa_9`,  `credattim_0`,  `creusr_0`,  `curlin_0`,  `dencod_0`,  `deslin_0`,  `dsp_0`,  `dudlig_0`,  `line_internal_number`,  `eardisflg_0`,  `fcylin_0`,  `ipttyp_0`,  `led_0`,  `led_1`,  `led_2`,  `led_3`,  `led_4`,  `led_5`,  `led_6`,  `led_7`,  `led_8`,  `led_9`,  `payment_line`,  `payment_id`,  `numdep_0`,  `paycurlin_0`,  `payloclin_0`,  `qtylin_0`,  `ritamt_0`,  `ritamt2_0`,  `rowid`,  `saclin_0`,  `_synched_from_source_at`,  `upddattim_0`,  `updtick_0`,  `updusr_0`,  `vatlin_0`,  `line_invoice`,  `vcrtyp_0`,  `line_amount`
  FROM ( 

SELECT
    *

  , 
    safe_cast(round(amtlin_0, 2) as numeric)
 AS `line_amount` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_0` AS string)), '') AS string) END as string)
 AS `acc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_1` AS string)), '') AS string) END as string)
 AS `acc_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_2` AS string)), '') AS string) END as string)
 AS `acc_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_3` AS string)), '') AS string) END as string)
 AS `acc_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_4` AS string)), '') AS string) END as string)
 AS `acc_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_5` AS string)), '') AS string) END as string)
 AS `acc_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_6` AS string)), '') AS string) END as string)
 AS `acc_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_7` AS string)), '') AS string) END as string)
 AS `acc_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_8` AS string)), '') AS string) END as string)
 AS `acc_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_9` AS string)), '') AS string) END as string)
 AS `acc_9`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accsns_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accsns_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `accsns_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acctyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acctyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `acctyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtbanfrc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtbanfrc_0` AS string)), '') AS string) END as numeric)
 AS `amtbanfrc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtbanfrc1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtbanfrc1_0` AS string)), '') AS string) END as numeric)
 AS `amtbanfrc1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtbanfrc2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtbanfrc2_0` AS string)), '') AS string) END as numeric)
 AS `amtbanfrc2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtlin_0` AS string)), '') AS string) END as numeric)
 AS `amtlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtlin2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtlin2_0` AS string)), '') AS string) END as numeric)
 AS `amtlin2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) END as string)
 AS `auuid_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprinv_0` AS string)), '') AS string) END as string)
 AS `bprinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprlin_0` AS string)), '') AS string) END as string)
 AS `bprlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprsacinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprsacinv_0` AS string)), '') AS string) END as string)
 AS `bprsacinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_0` AS string)), '') AS string) END as string)
 AS `coa_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_1` AS string)), '') AS string) END as string)
 AS `coa_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_2` AS string)), '') AS string) END as string)
 AS `coa_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_3` AS string)), '') AS string) END as string)
 AS `coa_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_4` AS string)), '') AS string) END as string)
 AS `coa_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_5` AS string)), '') AS string) END as string)
 AS `coa_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_6` AS string)), '') AS string) END as string)
 AS `coa_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_7` AS string)), '') AS string) END as string)
 AS `coa_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_8` AS string)), '') AS string) END as string)
 AS `coa_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_9` AS string)), '') AS string) END as string)
 AS `coa_9`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credattim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curlin_0` AS string)), '') AS string) END as string)
 AS `curlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dencod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dencod_0` AS string)), '') AS string) END as string)
 AS `dencod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deslin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deslin_0` AS string)), '') AS string) END as string)
 AS `deslin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsp_0` AS string)), '') AS string) END as string)
 AS `dsp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dudlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dudlig_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dudlig_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dudnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dudnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `line_internal_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eardisflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eardisflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eardisflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcylin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcylin_0` AS string)), '') AS string) END as string)
 AS `fcylin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ipttyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ipttyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ipttyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_0` AS string)), '') AS string) END as string)
 AS `led_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_1` AS string)), '') AS string) END as string)
 AS `led_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_2` AS string)), '') AS string) END as string)
 AS `led_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_3` AS string)), '') AS string) END as string)
 AS `led_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_4` AS string)), '') AS string) END as string)
 AS `led_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_5` AS string)), '') AS string) END as string)
 AS `led_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_6` AS string)), '') AS string) END as string)
 AS `led_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_7` AS string)), '') AS string) END as string)
 AS `led_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_8` AS string)), '') AS string) END as string)
 AS `led_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`led_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`led_9` AS string)), '') AS string) END as string)
 AS `led_9`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `payment_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num_0` AS string)), '') AS string) END as string)
 AS `payment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`numdep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`numdep_0` AS string)), '') AS string) END as string)
 AS `numdep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paycurlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paycurlin_0` AS string)), '') AS string) END as numeric)
 AS `paycurlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payloclin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payloclin_0` AS string)), '') AS string) END as numeric)
 AS `payloclin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtylin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtylin_0` AS string)), '') AS string) END as numeric)
 AS `qtylin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritamt_0` AS string)), '') AS string) END as numeric)
 AS `ritamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritamt2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritamt2_0` AS string)), '') AS string) END as numeric)
 AS `ritamt2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`saclin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`saclin_0` AS string)), '') AS string) END as string)
 AS `saclin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddattim_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vatlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vatlin_0` AS string)), '') AS string) END as string)
 AS `vatlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) END as string)
 AS `line_invoice`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrtyp_0` AS string)), '') AS string) END as string)
 AS `vcrtyp_0`



FROM `ff-stadiumgoods-raw-live`.`live`.`paymentd` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

