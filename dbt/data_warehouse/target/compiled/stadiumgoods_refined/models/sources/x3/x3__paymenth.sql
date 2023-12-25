


  




































































































































 

SELECT   `acc_0`,  `accounting_date`,  `accnumtre_0`,  `accnumtre_1`,  `accnumtre_10`,  `accnumtre_2`,  `accnumtre_3`,  `accnumtre_4`,  `accnumtre_5`,  `accnumtre_6`,  `accnumtre_7`,  `accnumtre_8`,  `accnumtre_9`,  `acs_0`,  `amtban_0`,  `amtcur_0`,  `amtnytbil_0`,  `auuid_0`,  `ban_0`,  `bandat_0`,  `banpaytpy_0`,  `bdfecocod_0`,  `bdfmvtcod_0`,  `bdfpaycod_0`,  `bic_code`,  `bank_id`,  `bidcry_0`,  `bildat_0`,  `bilvcr_0`,  `bpaaddlig_0`,  `bpaaddlig_1`,  `bpaaddlig_2`,  `bpainv_0`,  `consignor_name`,  `consignor_id`,  `bprref_0`,  `bprsac_0`,  `bprtyp_0`,  `cashvatnum_0`,  `chqban_0`,  `check_number`,  `chqtyp_0`,  `coa_0`,  `comdat_0`,  `cpy_0`,  `crdauz_0`,  `crdexydat_0`,  `crdnum_0`,  `crdtyp_0`,  `credat_0`,  `credattim_0`,  `creusr_0`,  `cry_0`,  `crynam_0`,  `cshvatrgm_0`,  `cty_0`,  `cur_0`,  `des_0`,  `duddat_0`,  `query_number`,  `epanatpay_0`,  `eparenpay_0`,  `expnum_0`,  `fcy_0`,  `fiy_0`,  `flgend_0`,  `frmdat_0`,  `frmfcy_0`,  `frmflg_0`,  `frmlin_0`,  `frmnum_0`,  `frmref_0`,  `frmtyp_0`,  `frmusr_0`,  `midbiccod_0`,  `midcry_0`,  `midpab1_0`,  `midpab2_0`,  `midpab3_0`,  `midpab4_0`,  `payment_id`,  `numord_0`,  `oridat_0`,  `pab1_0`,  `pab2_0`,  `pab3_0`,  `pab4_0`,  `pabamtprt_0`,  `pabflg_0`,  `pabren_0`,  `payment_method`,  `paylot_0`,  `paylotlig_0`,  `paynumend_0`,  `payment_type`,  `per_0`,  `poscod_0`,  `pst_0`,  `purtyp_0`,  `ref_0`,  `rennotpay_0`,  `rowid`,  `sat_0`,  `senbpr_0`,  `sencrn_0`,  `senori_0`,  `sns_0`,  `sta_0`,  `staflg_0`,  `staflg_1`,  `staflg_10`,  `staflg_2`,  `staflg_3`,  `staflg_4`,  `staflg_5`,  `staflg_6`,  `staflg_7`,  `staflg_8`,  `staflg_9`,  `sup1_0`,  `sup2_0`,  `sup3_0`,  `_synched_from_source_at`,  `tfbdat_0`,  `bank_file`,  `umrnum_0`,  `umrseq_0`,  `upddat_0`,  `upddattim_0`,  `updtick_0`,  `updusr_0`,  `valdat_0`,  `vatsta_0`,  `bank_amount`
  FROM ( 

SELECT
    *

  , 
    safe_cast(round(banpaytpy_0, 2) as numeric)
 AS `bank_amount` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acc_0` AS string)), '') AS string) END as string)
 AS `acc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `accounting_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_10` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_10`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_8`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnumtre_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnumtre_9` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnumtre_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acs_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acs_0` AS string)), '') AS string) END as string)
 AS `acs_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtban_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtban_0` AS string)), '') AS string) END as numeric)
 AS `amtban_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcur_0` AS string)), '') AS string) END as numeric)
 AS `amtcur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtnytbil_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtnytbil_0` AS string)), '') AS string) END as numeric)
 AS `amtnytbil_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) END as string)
 AS `auuid_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ban_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ban_0` AS string)), '') AS string) END as string)
 AS `ban_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bandat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bandat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `bandat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`banpaytpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`banpaytpy_0` AS string)), '') AS string) END as numeric)
 AS `banpaytpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bdfecocod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bdfecocod_0` AS string)), '') AS string) END as string)
 AS `bdfecocod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bdfmvtcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bdfmvtcod_0` AS string)), '') AS string) END as string)
 AS `bdfmvtcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bdfpaycod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bdfpaycod_0` AS string)), '') AS string) END as string)
 AS `bdfpaycod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`biccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`biccod_0` AS string)), '') AS string) END as string)
 AS `bic_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bid_0` AS string)), '') AS string) END as string)
 AS `bank_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bidcry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bidcry_0` AS string)), '') AS string) END as string)
 AS `bidcry_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bildat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bildat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `bildat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bilvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bilvcr_0` AS string)), '') AS string) END as string)
 AS `bilvcr_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpanam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpanam_0` AS string)), '') AS string) END as string)
 AS `consignor_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) END as string)
 AS `consignor_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprref_0` AS string)), '') AS string) END as string)
 AS `bprref_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprsac_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprsac_0` AS string)), '') AS string) END as string)
 AS `bprsac_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `bprtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cashvatnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cashvatnum_0` AS string)), '') AS string) END as string)
 AS `cashvatnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chqban_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chqban_0` AS string)), '') AS string) END as string)
 AS `chqban_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chqnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chqnum_0` AS string)), '') AS string) END as string)
 AS `check_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chqtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chqtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chqtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coa_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coa_0` AS string)), '') AS string) END as string)
 AS `coa_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `comdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crdauz_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crdauz_0` AS string)), '') AS string) END as string)
 AS `crdauz_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crdexydat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crdexydat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `crdexydat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crdnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crdnum_0` AS string)), '') AS string) END as string)
 AS `crdnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crdtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crdtyp_0` AS string)), '') AS string) END as string)
 AS `crdtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credattim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) END as string)
 AS `cry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crynam_0` AS string)), '') AS string) END as string)
 AS `crynam_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cshvatrgm_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cshvatrgm_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cshvatrgm_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) END as string)
 AS `cty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`des_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`des_0` AS string)), '') AS string) END as string)
 AS `des_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`duddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`duddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `duddat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`edtnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`edtnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `query_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`epanatpay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`epanatpay_0` AS string)), '') AS string) END as string)
 AS `epanatpay_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eparenpay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eparenpay_0` AS string)), '') AS string) END as string)
 AS `eparenpay_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) END as string)
 AS `fcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fiy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fiy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fiy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flgend_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flgend_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flgend_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `frmdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmfcy_0` AS string)), '') AS string) END as string)
 AS `frmfcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `frmflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `frmlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmnum_0` AS string)), '') AS string) END as string)
 AS `frmnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmref_0` AS string)), '') AS string) END as string)
 AS `frmref_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `frmtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frmusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frmusr_0` AS string)), '') AS string) END as string)
 AS `frmusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midbiccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midbiccod_0` AS string)), '') AS string) END as string)
 AS `midbiccod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midcry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midcry_0` AS string)), '') AS string) END as string)
 AS `midcry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midpab1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midpab1_0` AS string)), '') AS string) END as string)
 AS `midpab1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midpab2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midpab2_0` AS string)), '') AS string) END as string)
 AS `midpab2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midpab3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midpab3_0` AS string)), '') AS string) END as string)
 AS `midpab3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midpab4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midpab4_0` AS string)), '') AS string) END as string)
 AS `midpab4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num_0` AS string)), '') AS string) END as string)
 AS `payment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`numord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`numord_0` AS string)), '') AS string) END as string)
 AS `numord_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oridat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oridat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `oridat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pab1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pab1_0` AS string)), '') AS string) END as string)
 AS `pab1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pab2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pab2_0` AS string)), '') AS string) END as string)
 AS `pab2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pab3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pab3_0` AS string)), '') AS string) END as string)
 AS `pab3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pab4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pab4_0` AS string)), '') AS string) END as string)
 AS `pab4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pabamtprt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pabamtprt_0` AS string)), '') AS string) END as numeric)
 AS `pabamtprt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pabflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pabflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pabflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pabren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pabren_0` AS string)), '') AS string) END as string)
 AS `pabren_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pam_0` AS string)), '') AS string) END as string)
 AS `payment_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paylot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paylot_0` AS string)), '') AS string) END as string)
 AS `paylot_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paylotlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paylotlig_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `paylotlig_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paynumend_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paynumend_0` AS string)), '') AS string) END as string)
 AS `paynumend_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paytyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paytyp_0` AS string)), '') AS string) END as string)
 AS `payment_type`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`per_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`per_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `per_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) END as string)
 AS `poscod_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pst_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pst_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pst_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `purtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ref_0` AS string)), '') AS string) END as string)
 AS `ref_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rennotpay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rennotpay_0` AS string)), '') AS string) END as string)
 AS `rennotpay_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sat_0` AS string)), '') AS string) END as string)
 AS `sat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senbpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senbpr_0` AS string)), '') AS string) END as string)
 AS `senbpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sencrn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sencrn_0` AS string)), '') AS string) END as string)
 AS `sencrn_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senori_0` AS string)), '') AS string) END as string)
 AS `senori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sns_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sns_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sns_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_10` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_10`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_8`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staflg_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staflg_9` AS string)), '') AS string) END as float64)
 as int64)
 AS `staflg_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sup1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sup1_0` AS string)), '') AS string) END as string)
 AS `sup1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sup2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sup2_0` AS string)), '') AS string) END as string)
 AS `sup2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sup3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sup3_0` AS string)), '') AS string) END as string)
 AS `sup3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tfbdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tfbdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `tfbdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tfbfil_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tfbfil_0` AS string)), '') AS string) END as string)
 AS `bank_file`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`umrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`umrnum_0` AS string)), '') AS string) END as string)
 AS `umrnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`umrseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`umrseq_0` AS string)), '') AS string) END as string)
 AS `umrseq_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddat_0`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`valdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`valdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `valdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vatsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vatsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vatsta_0`



FROM `ff-stadiumgoods-raw-live`.`live`.`paymenth` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

