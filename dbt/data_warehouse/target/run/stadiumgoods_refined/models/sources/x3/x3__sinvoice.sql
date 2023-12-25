

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sinvoice`
  OPTIONS()
  as 

  












































































































































































































































 

SELECT   `updtick_0`,  `sivtyp_0`,  `invoice_type_code`,  `invoice_id`,  `orimod_0`,  `bpr_0`,  `bprsac_0`,  `cpy_0`,  `fcy_0`,  `gte_0`,  `jou_0`,  `accdat_0`,  `accnum_0`,  `bprdat_0`,  `bprvcr_0`,  `cur_0`,  `curtyp_0`,  `led_0`,  `led_1`,  `led_2`,  `led_3`,  `led_4`,  `led_5`,  `led_6`,  `led_7`,  `led_8`,  `led_9`,  `curled_0`,  `curled_1`,  `curled_2`,  `curled_3`,  `curled_4`,  `curled_5`,  `curled_6`,  `curled_7`,  `curled_8`,  `curled_9`,  `ratmlt_0`,  `ratmlt_1`,  `ratmlt_2`,  `ratmlt_3`,  `ratmlt_4`,  `ratmlt_5`,  `ratmlt_6`,  `ratmlt_7`,  `ratmlt_8`,  `ratmlt_9`,  `ratdiv_0`,  `ratdiv_1`,  `ratdiv_2`,  `ratdiv_3`,  `ratdiv_4`,  `ratdiv_5`,  `ratdiv_6`,  `ratdiv_7`,  `ratdiv_8`,  `ratdiv_9`,  `ratdat_0`,  `bprpay_0`,  `bpapay_0`,  `bpynam_0`,  `bpynam_1`,  `bpyaddlig_0`,  `bpyaddlig_1`,  `bpyaddlig_2`,  `bpyposcod_0`,  `bpycty_0`,  `bpysat_0`,  `bpycry_0`,  `bpycrynam_0`,  `bprfct_0`,  `fctvcr_0`,  `fctvcrflg_0`,  `qtcaccnum_0`,  `strduddat_0`,  `pte_0`,  `dep_0`,  `vac_0`,  `sstentcod_0`,  `dirinvflg_0`,  `eecnumdeb_0`,  `sta_0`,  `des_0`,  `des_1`,  `des_2`,  `des_3`,  `des_4`,  `invnum_0`,  `sns_0`,  `amount_including_tax`,  `amount_excluding_tax`,  `amtnotl_0`,  `amtatil_0`,  `vatdat_0`,  `nbrtax_0`,  `tax_0`,  `tax_1`,  `tax_2`,  `tax_3`,  `tax_4`,  `tax_5`,  `tax_6`,  `tax_7`,  `tax_8`,  `tax_9`,  `bastax_0`,  `bastax_1`,  `bastax_2`,  `bastax_3`,  `bastax_4`,  `bastax_5`,  `bastax_6`,  `bastax_7`,  `bastax_8`,  `bastax_9`,  `tax_amount`,  `amttax_1`,  `amttax_2`,  `amttax_3`,  `amttax_4`,  `amttax_5`,  `amttax_6`,  `amttax_7`,  `amttax_8`,  `amttax_9`,  `theamttax_0`,  `exeamttax_0`,  `exeamttax_1`,  `exeamttax_2`,  `exeamttax_3`,  `exeamttax_4`,  `exeamttax_5`,  `exeamttax_6`,  `exeamttax_7`,  `exeamttax_8`,  `exeamttax_9`,  `die_0`,  `die_1`,  `die_2`,  `die_3`,  `die_4`,  `die_5`,  `die_6`,  `die_7`,  `die_8`,  `die_9`,  `die_10`,  `die_11`,  `die_12`,  `die_13`,  `die_14`,  `die_15`,  `die_16`,  `die_17`,  `die_18`,  `die_19`,  `cce_0`,  `cce_1`,  `cce_2`,  `cce_3`,  `cce_4`,  `cce_5`,  `cce_6`,  `cce_7`,  `cce_8`,  `cce_9`,  `cce_10`,  `cce_11`,  `cce_12`,  `cce_13`,  `cce_14`,  `cce_15`,  `cce_16`,  `cce_17`,  `cce_18`,  `cce_19`,  `bpainv_0`,  `bprnam_0`,  `bprnam_1`,  `bpaaddlig_0`,  `bpaaddlig_1`,  `bpaaddlig_2`,  `poscod_0`,  `cty_0`,  `sat_0`,  `cry_0`,  `crynam_0`,  `bilvcr_0`,  `trsfam_0`,  `fiy_0`,  `per_0`,  `strdatsvc_0`,  `enddatsvc_0`,  `lasdatsvc_0`,  `amttaxusa_0`,  `amttaxusa_1`,  `amttaxusa_2`,  `amttaxusa_3`,  `amttaxusa_4`,  `amttaxusa_5`,  `amttaxusa_6`,  `amttaxusa_7`,  `amttaxusa_8`,  `amttaxusa_9`,  `cai_0`,  `datvlycai_0`,  `wrhe_0`,  `expnum_0`,  `sinum_0`,  `starpt_0`,  `isextdoc_0`,  `credat_0`,  `creusr_0`,  `upddat_0`,  `updusr_0`,  `basdep_0`,  `created_at`,  `updated_at`,  `auuid_0`,  `belvcs_0`,  `adrval_0`,  `salprityp_0`,  `dcleecnum_0`,  `porexpdcl_0`,  `umrnum_0`,  `rcrnum_0`,  `rcrdat_0`,  `nbrcpy_0`,  `cshvat_0`,  `fld40ren_0`,  `fld41ren_0`,  `oridocnum_0`,  `perdeb_0`,  `perfin_0`,  `yconspayaf_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sivtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sivtyp_0` AS string)), '') AS string) END as string)
 AS `sivtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invoice_type_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num_0` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orimod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orimod_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `orimod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) END as string)
 AS `bpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprsac_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprsac_0` AS string)), '') AS string) END as string)
 AS `bprsac_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) END as string)
 AS `fcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gte_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gte_0` AS string)), '') AS string) END as string)
 AS `gte_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`jou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`jou_0` AS string)), '') AS string) END as string)
 AS `jou_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `accdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `bprdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprvcr_0` AS string)), '') AS string) END as string)
 AS `bprvcr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `curtyp_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_0` AS string)), '') AS string) END as string)
 AS `curled_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_1` AS string)), '') AS string) END as string)
 AS `curled_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_2` AS string)), '') AS string) END as string)
 AS `curled_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_3` AS string)), '') AS string) END as string)
 AS `curled_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_4` AS string)), '') AS string) END as string)
 AS `curled_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_5` AS string)), '') AS string) END as string)
 AS `curled_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_6` AS string)), '') AS string) END as string)
 AS `curled_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_7` AS string)), '') AS string) END as string)
 AS `curled_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_8` AS string)), '') AS string) END as string)
 AS `curled_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curled_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curled_9` AS string)), '') AS string) END as string)
 AS `curled_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_0` AS string)), '') AS string) END as numeric)
 AS `ratmlt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_1` AS string)), '') AS string) END as numeric)
 AS `ratmlt_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_2` AS string)), '') AS string) END as numeric)
 AS `ratmlt_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_3` AS string)), '') AS string) END as numeric)
 AS `ratmlt_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_4` AS string)), '') AS string) END as numeric)
 AS `ratmlt_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_5` AS string)), '') AS string) END as numeric)
 AS `ratmlt_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_6` AS string)), '') AS string) END as numeric)
 AS `ratmlt_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_7` AS string)), '') AS string) END as numeric)
 AS `ratmlt_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_8` AS string)), '') AS string) END as numeric)
 AS `ratmlt_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratmlt_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratmlt_9` AS string)), '') AS string) END as numeric)
 AS `ratmlt_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_0` AS string)), '') AS string) END as numeric)
 AS `ratdiv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_1` AS string)), '') AS string) END as numeric)
 AS `ratdiv_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_2` AS string)), '') AS string) END as numeric)
 AS `ratdiv_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_3` AS string)), '') AS string) END as numeric)
 AS `ratdiv_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_4` AS string)), '') AS string) END as numeric)
 AS `ratdiv_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_5` AS string)), '') AS string) END as numeric)
 AS `ratdiv_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_6` AS string)), '') AS string) END as numeric)
 AS `ratdiv_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_7` AS string)), '') AS string) END as numeric)
 AS `ratdiv_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_8` AS string)), '') AS string) END as numeric)
 AS `ratdiv_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdiv_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdiv_9` AS string)), '') AS string) END as numeric)
 AS `ratdiv_9`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ratdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ratdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `ratdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) END as string)
 AS `bprpay_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) END as string)
 AS `bpapay_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpynam_0` AS string)), '') AS string) END as string)
 AS `bpynam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpynam_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpynam_1` AS string)), '') AS string) END as string)
 AS `bpynam_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpyaddlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpyaddlig_0` AS string)), '') AS string) END as string)
 AS `bpyaddlig_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpyaddlig_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpyaddlig_1` AS string)), '') AS string) END as string)
 AS `bpyaddlig_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpyaddlig_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpyaddlig_2` AS string)), '') AS string) END as string)
 AS `bpyaddlig_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpyposcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpyposcod_0` AS string)), '') AS string) END as string)
 AS `bpyposcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpycty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpycty_0` AS string)), '') AS string) END as string)
 AS `bpycty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpysat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpysat_0` AS string)), '') AS string) END as string)
 AS `bpysat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpycry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpycry_0` AS string)), '') AS string) END as string)
 AS `bpycry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpycrynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpycrynam_0` AS string)), '') AS string) END as string)
 AS `bpycrynam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprfct_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprfct_0` AS string)), '') AS string) END as string)
 AS `bprfct_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fctvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fctvcr_0` AS string)), '') AS string) END as string)
 AS `fctvcr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fctvcrflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fctvcrflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fctvcrflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtcaccnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtcaccnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `qtcaccnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`strduddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`strduddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `strduddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) END as string)
 AS `pte_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) END as string)
 AS `dep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vac_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vac_0` AS string)), '') AS string) END as string)
 AS `vac_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sstentcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sstentcod_0` AS string)), '') AS string) END as string)
 AS `sstentcod_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dirinvflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dirinvflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dirinvflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecnumdeb_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecnumdeb_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eecnumdeb_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`des_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`des_0` AS string)), '') AS string) END as string)
 AS `des_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`des_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`des_1` AS string)), '') AS string) END as string)
 AS `des_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`des_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`des_2` AS string)), '') AS string) END as string)
 AS `des_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`des_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`des_3` AS string)), '') AS string) END as string)
 AS `des_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`des_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`des_4` AS string)), '') AS string) END as string)
 AS `des_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invnum_0` AS string)), '') AS string) END as string)
 AS `invnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sns_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sns_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sns_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtati_0` AS string)), '') AS string) END as float64)
 AS `amount_including_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtnot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtnot_0` AS string)), '') AS string) END as float64)
 AS `amount_excluding_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtnotl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtnotl_0` AS string)), '') AS string) END as numeric)
 AS `amtnotl_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtatil_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtatil_0` AS string)), '') AS string) END as numeric)
 AS `amtatil_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vatdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vatdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `vatdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nbrtax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nbrtax_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nbrtax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_0` AS string)), '') AS string) END as string)
 AS `tax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_1` AS string)), '') AS string) END as string)
 AS `tax_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_2` AS string)), '') AS string) END as string)
 AS `tax_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_3` AS string)), '') AS string) END as string)
 AS `tax_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_4` AS string)), '') AS string) END as string)
 AS `tax_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_5` AS string)), '') AS string) END as string)
 AS `tax_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_6` AS string)), '') AS string) END as string)
 AS `tax_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_7` AS string)), '') AS string) END as string)
 AS `tax_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_8` AS string)), '') AS string) END as string)
 AS `tax_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_9` AS string)), '') AS string) END as string)
 AS `tax_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_0` AS string)), '') AS string) END as numeric)
 AS `bastax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_1` AS string)), '') AS string) END as numeric)
 AS `bastax_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_2` AS string)), '') AS string) END as numeric)
 AS `bastax_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_3` AS string)), '') AS string) END as numeric)
 AS `bastax_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_4` AS string)), '') AS string) END as numeric)
 AS `bastax_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_5` AS string)), '') AS string) END as numeric)
 AS `bastax_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_6` AS string)), '') AS string) END as numeric)
 AS `bastax_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_7` AS string)), '') AS string) END as numeric)
 AS `bastax_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_8` AS string)), '') AS string) END as numeric)
 AS `bastax_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastax_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastax_9` AS string)), '') AS string) END as numeric)
 AS `bastax_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_0` AS string)), '') AS string) END as float64)
 AS `tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_1` AS string)), '') AS string) END as numeric)
 AS `amttax_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_2` AS string)), '') AS string) END as numeric)
 AS `amttax_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_3` AS string)), '') AS string) END as numeric)
 AS `amttax_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_4` AS string)), '') AS string) END as numeric)
 AS `amttax_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_5` AS string)), '') AS string) END as numeric)
 AS `amttax_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_6` AS string)), '') AS string) END as numeric)
 AS `amttax_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_7` AS string)), '') AS string) END as numeric)
 AS `amttax_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_8` AS string)), '') AS string) END as numeric)
 AS `amttax_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttax_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttax_9` AS string)), '') AS string) END as numeric)
 AS `amttax_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`theamttax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`theamttax_0` AS string)), '') AS string) END as numeric)
 AS `theamttax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_0` AS string)), '') AS string) END as numeric)
 AS `exeamttax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_1` AS string)), '') AS string) END as numeric)
 AS `exeamttax_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_2` AS string)), '') AS string) END as numeric)
 AS `exeamttax_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_3` AS string)), '') AS string) END as numeric)
 AS `exeamttax_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_4` AS string)), '') AS string) END as numeric)
 AS `exeamttax_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_5` AS string)), '') AS string) END as numeric)
 AS `exeamttax_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_6` AS string)), '') AS string) END as numeric)
 AS `exeamttax_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_7` AS string)), '') AS string) END as numeric)
 AS `exeamttax_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_8` AS string)), '') AS string) END as numeric)
 AS `exeamttax_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exeamttax_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exeamttax_9` AS string)), '') AS string) END as numeric)
 AS `exeamttax_9`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprnam_0` AS string)), '') AS string) END as string)
 AS `bprnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprnam_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprnam_1` AS string)), '') AS string) END as string)
 AS `bprnam_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaaddlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaaddlig_0` AS string)), '') AS string) END as string)
 AS `bpaaddlig_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaaddlig_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaaddlig_1` AS string)), '') AS string) END as string)
 AS `bpaaddlig_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaaddlig_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaaddlig_2` AS string)), '') AS string) END as string)
 AS `bpaaddlig_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) END as string)
 AS `poscod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) END as string)
 AS `cty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sat_0` AS string)), '') AS string) END as string)
 AS `sat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) END as string)
 AS `cry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crynam_0` AS string)), '') AS string) END as string)
 AS `crynam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bilvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bilvcr_0` AS string)), '') AS string) END as string)
 AS `bilvcr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trsfam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trsfam_0` AS string)), '') AS string) END as string)
 AS `trsfam_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fiy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fiy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fiy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`per_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`per_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `per_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`strdatsvc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`strdatsvc_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `strdatsvc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`enddatsvc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enddatsvc_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `enddatsvc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasdatsvc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasdatsvc_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lasdatsvc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_0` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_1` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_2` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_3` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_4` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_5` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_6` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_7` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_8` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxusa_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxusa_9` AS string)), '') AS string) END as numeric)
 AS `amttaxusa_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cai_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cai_0` AS string)), '') AS string) END as string)
 AS `cai_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`datvlycai_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`datvlycai_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `datvlycai_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrhe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrhe_0` AS string)), '') AS string) END as string)
 AS `wrhe_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`starpt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`starpt_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `starpt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`isextdoc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`isextdoc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `isextdoc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`basdep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`basdep_0` AS string)), '') AS string) END as numeric)
 AS `basdep_0`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) END as string)
 AS `auuid_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`belvcs_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`belvcs_0` AS string)), '') AS string) END as string)
 AS `belvcs_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adrval_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adrval_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `adrval_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`salprityp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`salprityp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `salprityp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dcleecnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dcleecnum_0` AS string)), '') AS string) END as string)
 AS `dcleecnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`porexpdcl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`porexpdcl_0` AS string)), '') AS string) END as string)
 AS `porexpdcl_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`umrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`umrnum_0` AS string)), '') AS string) END as string)
 AS `umrnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcrnum_0` AS string)), '') AS string) END as string)
 AS `rcrnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcrdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcrdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `rcrdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nbrcpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nbrcpy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nbrcpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cshvat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cshvat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cshvat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fld40ren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fld40ren_0` AS string)), '') AS string) END as string)
 AS `fld40ren_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fld41ren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fld41ren_0` AS string)), '') AS string) END as string)
 AS `fld41ren_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oridocnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oridocnum_0` AS string)), '') AS string) END as string)
 AS `oridocnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`perdeb_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`perdeb_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `perdeb_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`perfin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`perfin_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `perfin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yconspayaf_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yconspayaf_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `yconspayaf_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`sinvoice` AS source_table

 ) AS un_ordered

;

