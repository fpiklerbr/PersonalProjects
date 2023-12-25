

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__bpcustomer`
  OPTIONS()
  as 

  


















































































































































































































 

SELECT   `updtick_0`,  `bpcnum_0`,  `bpcnam_0`,  `bpcsho_0`,  `bcgcod_0`,  `grp_0`,  `bpctyp_0`,  `bpcinv_0`,  `bpainv_0`,  `bpcpyr_0`,  `bpapyr_0`,  `bpcgru_0`,  `bpcrsk_0`,  `bpaadd_0`,  `bpdadd_0`,  `cntnam_0`,  `bpcsta_0`,  `pptflg_0`,  `bpcbpsnum_0`,  `fctnum_0`,  `cur_0`,  `chgtyp_0`,  `comcat_0`,  `rep_0`,  `rep_1`,  `vacbpr_0`,  `vatexn_0`,  `pte_0`,  `freinv_0`,  `dep_0`,  `invdtaamt_0`,  `invdtaamt_1`,  `invdtaamt_2`,  `invdtaamt_3`,  `invdtaamt_4`,  `invdtaamt_5`,  `invdtaamt_6`,  `invdtaamt_7`,  `invdtaamt_8`,  `invdtaamt_9`,  `invdtaamt_10`,  `invdtaamt_11`,  `invdtaamt_12`,  `invdtaamt_13`,  `invdtaamt_14`,  `invdtaamt_15`,  `invdtaamt_16`,  `invdtaamt_17`,  `invdtaamt_18`,  `invdtaamt_19`,  `invdtaamt_20`,  `invdtaamt_21`,  `invdtaamt_22`,  `invdtaamt_23`,  `invdtaamt_24`,  `invdtaamt_25`,  `invdtaamt_26`,  `invdtaamt_27`,  `invdtaamt_28`,  `invdtaamt_29`,  `invdta_0`,  `invdta_1`,  `invdta_2`,  `invdta_3`,  `invdta_4`,  `invdta_5`,  `invdta_6`,  `invdta_7`,  `invdta_8`,  `invdta_9`,  `invdta_10`,  `invdta_11`,  `invdta_12`,  `invdta_13`,  `invdta_14`,  `invdta_15`,  `invdta_16`,  `invdta_17`,  `invdta_18`,  `invdta_19`,  `invdta_20`,  `invdta_21`,  `invdta_22`,  `invdta_23`,  `invdta_24`,  `invdta_25`,  `invdta_26`,  `invdta_27`,  `invdta_28`,  `invdta_29`,  `tsccod_0`,  `tsccod_1`,  `tsccod_2`,  `tsccod_3`,  `tsccod_4`,  `prityp_0`,  `bpcrem_0`,  `ostctl_0`,  `ostauz_0`,  `ordminamt_0`,  `cdtisr_0`,  `cdtisrdat_0`,  `bpccdtisr_0`,  `fuptyp_0`,  `fupminamt_0`,  `soiper_0`,  `payban_0`,  `acccod_0`,  `die_0`,  `die_1`,  `die_2`,  `die_3`,  `die_4`,  `die_5`,  `die_6`,  `die_7`,  `die_8`,  `die_9`,  `die_10`,  `die_11`,  `die_12`,  `die_13`,  `die_14`,  `die_15`,  `die_16`,  `die_17`,  `die_18`,  `die_19`,  `cce_0`,  `cce_1`,  `cce_2`,  `cce_3`,  `cce_4`,  `cce_5`,  `cce_6`,  `cce_7`,  `cce_8`,  `cce_9`,  `cce_10`,  `cce_11`,  `cce_12`,  `cce_13`,  `cce_14`,  `cce_15`,  `cce_16`,  `cce_17`,  `cce_18`,  `cce_19`,  `mtcflg_0`,  `ordtex_0`,  `invtex_0`,  `lndauz_0`,  `ocnflg_0`,  `invper_0`,  `dudclc_0`,  `ordcle_0`,  `odl_0`,  `dme_0`,  `ime_0`,  `bus_0`,  `orippt_0`,  `pitcdt_0`,  `pitcpt_0`,  `totpit_0`,  `cotchx_0`,  `cotpitrqd_0`,  `cntfirdat_0`,  `ordfirdat_0`,  `quolasdat_0`,  `cntlasdat_0`,  `cntnexdat_0`,  `cntlastyp_0`,  `cntnextyp_0`,  `abccls_0`,  `agtpcp_0`,  `agtsattax_0`,  `sattax_0`,  `flgsattax_0`,  `tpmcod_0`,  `dia_0`,  `bpcsncdat_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `daymon_0`,  `daymon_1`,  `daymon_2`,  `daymon_3`,  `daymon_4`,  `daymon_5`,  `uvycod2_0`,  `cshvatrgm_0`,  `vatstrdat_0`,  `vatenddat_0`,  `yclientcode_0`,  `zextordnumfl_0`,  `zslalti_0`,  `rowid`
    , `_raw_zautprh_0`
    , `_raw_zautordcle_0`
    , `_raw_zserswap_0`
    , `_raw_zautholso_0`
    , `_raw_zautshp_0`
    , `_raw_zblkpay_0`
    , `_raw_zautcfmsdh_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcnum_0` AS string)), '') AS string) END as string)
 AS `bpcnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcnam_0` AS string)), '') AS string) END as string)
 AS `bpcnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcsho_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcsho_0` AS string)), '') AS string) END as string)
 AS `bpcsho_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bcgcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bcgcod_0` AS string)), '') AS string) END as string)
 AS `bcgcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grp_0` AS string)), '') AS string) END as string)
 AS `grp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpctyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpctyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `bpctyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcinv_0` AS string)), '') AS string) END as string)
 AS `bpcinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcrsk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcrsk_0` AS string)), '') AS string) END as string)
 AS `bpcrsk_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpdadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpdadd_0` AS string)), '') AS string) END as string)
 AS `bpdadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntnam_0` AS string)), '') AS string) END as string)
 AS `cntnam_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `bpcsta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pptflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pptflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pptflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcbpsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcbpsnum_0` AS string)), '') AS string) END as string)
 AS `bpcbpsnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fctnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fctnum_0` AS string)), '') AS string) END as string)
 AS `fctnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chgtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comcat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comcat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `comcat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rep_0` AS string)), '') AS string) END as string)
 AS `rep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rep_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rep_1` AS string)), '') AS string) END as string)
 AS `rep_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) END as string)
 AS `vacbpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vatexn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vatexn_0` AS string)), '') AS string) END as string)
 AS `vatexn_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) END as string)
 AS `pte_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`freinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`freinv_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `freinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) END as string)
 AS `dep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_0` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_0`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prityp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prityp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prityp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcrem_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcrem_0` AS string)), '') AS string) END as string)
 AS `bpcrem_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ostctl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ostctl_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ostctl_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ostauz_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ostauz_0` AS string)), '') AS string) END as numeric)
 AS `ostauz_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordminamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordminamt_0` AS string)), '') AS string) END as numeric)
 AS `ordminamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cdtisr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cdtisr_0` AS string)), '') AS string) END as numeric)
 AS `cdtisr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cdtisrdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cdtisrdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `cdtisrdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpccdtisr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpccdtisr_0` AS string)), '') AS string) END as string)
 AS `bpccdtisr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fuptyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fuptyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fuptyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fupminamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fupminamt_0` AS string)), '') AS string) END as numeric)
 AS `fupminamt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soiper_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soiper_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `soiper_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payban_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payban_0` AS string)), '') AS string) END as string)
 AS `payban_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acccod_0` AS string)), '') AS string) END as string)
 AS `acccod_0`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mtcflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mtcflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `mtcflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordtex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordtex_0` AS string)), '') AS string) END as string)
 AS `ordtex_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invtex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invtex_0` AS string)), '') AS string) END as string)
 AS `invtex_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lndauz_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lndauz_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lndauz_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ocnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ocnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ocnflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invper_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invper_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invper_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dudclc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dudclc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dudclc_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bus_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bus_0` AS string)), '') AS string) END as string)
 AS `bus_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orippt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orippt_0` AS string)), '') AS string) END as string)
 AS `orippt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pitcdt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pitcdt_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pitcdt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pitcpt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pitcpt_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pitcpt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totpit_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totpit_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `totpit_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cotchx_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cotchx_0` AS string)), '') AS string) END as string)
 AS `cotchx_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cotpitrqd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cotpitrqd_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cotpitrqd_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntfirdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntfirdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `cntfirdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordfirdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordfirdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `ordfirdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quolasdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quolasdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `quolasdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntlasdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntlasdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `cntlasdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntnexdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntnexdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `cntnexdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntlastyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntlastyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cntlastyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntnextyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntnextyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cntnextyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`abccls_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`abccls_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `abccls_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`agtpcp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`agtpcp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `agtpcp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`agtsattax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`agtsattax_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `agtsattax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sattax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sattax_0` AS string)), '') AS string) END as string)
 AS `sattax_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flgsattax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flgsattax_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flgsattax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tpmcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tpmcod_0` AS string)), '') AS string) END as string)
 AS `tpmcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dia_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dia_0` AS string)), '') AS string) END as string)
 AS `dia_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcsncdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcsncdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `bpcsncdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credattim_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddattim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) END as string)
 AS `auuid_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daymon_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daymon_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `daymon_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daymon_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daymon_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `daymon_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daymon_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daymon_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `daymon_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daymon_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daymon_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `daymon_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daymon_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daymon_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `daymon_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daymon_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daymon_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `daymon_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uvycod2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uvycod2_0` AS string)), '') AS string) END as string)
 AS `uvycod2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cshvatrgm_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cshvatrgm_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cshvatrgm_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vatstrdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vatstrdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `vatstrdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vatenddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vatenddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `vatenddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yclientcode_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yclientcode_0` AS string)), '') AS string) END as string)
 AS `yclientcode_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zextordnumfl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zextordnumfl_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `zextordnumfl_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zslalti_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zslalti_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `zslalti_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `zautprh_0` AS `_raw_zautprh_0`

  , `zautordcle_0` AS `_raw_zautordcle_0`

  , `zserswap_0` AS `_raw_zserswap_0`

  , `zautholso_0` AS `_raw_zautholso_0`

  , `zautshp_0` AS `_raw_zautshp_0`

  , `zblkpay_0` AS `_raw_zblkpay_0`

  , `zautcfmsdh_0` AS `_raw_zautcfmsdh_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`bpcustomer` AS source_table

 ) AS un_ordered

;

