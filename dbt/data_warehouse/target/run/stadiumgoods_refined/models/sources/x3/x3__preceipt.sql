

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__preceipt`
  OPTIONS()
  as 

  

















































































































































































 

SELECT   `updtick_0`,  `receipt_id`,  `cpy_0`,  `prhfcy_0`,  `purtyp_0`,  `supplier_reference`,  `ndedat_0`,  `rcpdat_0`,  `supplier_id`,  `bpaadd_0`,  `bpoadd_0`,  `bponam_0`,  `bponam_1`,  `bpoaddlig_0`,  `bpoaddlig_1`,  `bpoaddlig_2`,  `bpoposcod_0`,  `bpocty_0`,  `bposat_0`,  `bpocry_0`,  `bpocrynam_0`,  `bpsinv_0`,  `bpainv_0`,  `bprpay_0`,  `bpapay_0`,  `bptnum_0`,  `ffwnum_0`,  `ffwadd_0`,  `tsscod_0`,  `tsscod_1`,  `tsscod_2`,  `tsscod_3`,  `tsscod_4`,  `cur_0`,  `chgtyp_0`,  `chgcoe_0`,  `vacbpr_0`,  `vactyp_0`,  `dep_0`,  `mdl_0`,  `eecnat_0`,  `eecsch_0`,  `eectrn_0`,  `eecict_0`,  `ictcty_0`,  `eecloc_0`,  `eecnum_0`,  `eecnumdeb_0`,  `gpgcod_0`,  `weu_0`,  `vou_0`,  `totgrowei_0`,  `totnetwei_0`,  `totvol_0`,  `linnbr_0`,  `invlinnbr_0`,  `invlinctr_0`,  `pstlinnbr_0`,  `prnflg_0`,  `invflg_0`,  `pstflg_0`,  `pstdat_0`,  `betfcy_0`,  `betcpy_0`,  `tex1_0`,  `tex2_0`,  `trscod_0`,  `entcod_0`,  `cai_0`,  `datvlycai_0`,  `typvcr_0`,  `clsvcr_0`,  `scuvcr_0`,  `seqvcr_0`,  `die_0`,  `die_1`,  `die_2`,  `die_3`,  `die_4`,  `die_5`,  `die_6`,  `die_7`,  `die_8`,  `die_9`,  `die_10`,  `die_11`,  `die_12`,  `die_13`,  `die_14`,  `die_15`,  `die_16`,  `die_17`,  `die_18`,  `die_19`,  `cce_0`,  `cce_1`,  `cce_2`,  `cce_3`,  `cce_4`,  `cce_5`,  `cce_6`,  `cce_7`,  `cce_8`,  `cce_9`,  `cce_10`,  `cce_11`,  `cce_12`,  `cce_13`,  `cce_14`,  `cce_15`,  `cce_16`,  `cce_17`,  `cce_18`,  `cce_19`,  `dspweu_0`,  `dspvou_0`,  `totlinamt_0`,  `totlinqty_0`,  `totlinweu_0`,  `totlinvou_0`,  `totamtnot_0`,  `totamtnotl_0`,  `tottaxamt_0`,  `totamtati_0`,  `totamtatil_0`,  `invdtalin1_0`,  `invdtalin1_1`,  `invdtalin1_2`,  `invdtalin1_3`,  `invdtalin1_4`,  `invdtalin1_5`,  `invdtalin1_6`,  `invdtalin1_7`,  `invdtalin1_8`,  `invdtavat1_0`,  `invdtavat1_1`,  `invdtavat1_2`,  `invdtavat1_3`,  `invdtavat1_4`,  `invdtavat1_5`,  `invdtavat1_6`,  `invdtavat1_7`,  `invdtavat1_8`,  `invdtalin2_0`,  `invdtalin2_1`,  `invdtalin2_2`,  `invdtalin2_3`,  `invdtalin2_4`,  `invdtalin2_5`,  `invdtalin2_6`,  `invdtalin2_7`,  `invdtalin2_8`,  `invdtavat2_0`,  `invdtavat2_1`,  `invdtavat2_2`,  `invdtavat2_3`,  `invdtavat2_4`,  `invdtavat2_5`,  `invdtavat2_6`,  `invdtavat2_7`,  `invdtavat2_8`,  `wrhe_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `licplate_0`,  `trllicplate_0`,  `dpedat_0`,  `arvdat_0`,  `etd_0`,  `eta_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pthnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pthnum_0` AS string)), '') AS string) END as string)
 AS `receipt_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) END as string)
 AS `prhfcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `purtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnde_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnde_0` AS string)), '') AS string) END as string)
 AS `supplier_reference`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ndedat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ndedat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `ndedat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `rcpdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) END as string)
 AS `supplier_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpoadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpoadd_0` AS string)), '') AS string) END as string)
 AS `bpoadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bponam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bponam_0` AS string)), '') AS string) END as string)
 AS `bponam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bponam_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bponam_1` AS string)), '') AS string) END as string)
 AS `bponam_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpoaddlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpoaddlig_0` AS string)), '') AS string) END as string)
 AS `bpoaddlig_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpoaddlig_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpoaddlig_1` AS string)), '') AS string) END as string)
 AS `bpoaddlig_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpoaddlig_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpoaddlig_2` AS string)), '') AS string) END as string)
 AS `bpoaddlig_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpoposcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpoposcod_0` AS string)), '') AS string) END as string)
 AS `bpoposcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpocty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpocty_0` AS string)), '') AS string) END as string)
 AS `bpocty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bposat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bposat_0` AS string)), '') AS string) END as string)
 AS `bposat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpocry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpocry_0` AS string)), '') AS string) END as string)
 AS `bpocry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpocrynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpocrynam_0` AS string)), '') AS string) END as string)
 AS `bpocrynam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) END as string)
 AS `bpsinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) END as string)
 AS `bprpay_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) END as string)
 AS `bpapay_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) END as string)
 AS `bptnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ffwnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ffwnum_0` AS string)), '') AS string) END as string)
 AS `ffwnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ffwadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ffwadd_0` AS string)), '') AS string) END as string)
 AS `ffwadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_0` AS string)), '') AS string) END as string)
 AS `tsscod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_1` AS string)), '') AS string) END as string)
 AS `tsscod_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_2` AS string)), '') AS string) END as string)
 AS `tsscod_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_3` AS string)), '') AS string) END as string)
 AS `tsscod_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_4` AS string)), '') AS string) END as string)
 AS `tsscod_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chgtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chgcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chgcoe_0` AS string)), '') AS string) END as numeric)
 AS `chgcoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) END as string)
 AS `vacbpr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vactyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vactyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vactyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) END as string)
 AS `dep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) END as string)
 AS `mdl_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecnat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecnat_0` AS string)), '') AS string) END as string)
 AS `eecnat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecsch_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecsch_0` AS string)), '') AS string) END as string)
 AS `eecsch_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eectrn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eectrn_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eectrn_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecict_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecict_0` AS string)), '') AS string) END as string)
 AS `eecict_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ictcty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ictcty_0` AS string)), '') AS string) END as string)
 AS `ictcty_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecloc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eecloc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecnum_0` AS string)), '') AS string) END as string)
 AS `eecnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecnumdeb_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecnumdeb_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eecnumdeb_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gpgcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gpgcod_0` AS string)), '') AS string) END as string)
 AS `gpgcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) END as string)
 AS `weu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vou_0` AS string)), '') AS string) END as string)
 AS `vou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totgrowei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totgrowei_0` AS string)), '') AS string) END as numeric)
 AS `totgrowei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totnetwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totnetwei_0` AS string)), '') AS string) END as numeric)
 AS `totnetwei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totvol_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totvol_0` AS string)), '') AS string) END as numeric)
 AS `totvol_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invlinnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invlinnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invlinnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invlinctr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invlinctr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invlinctr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pstlinnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pstlinnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pstlinnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prnflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pstflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pstflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pstflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pstdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pstdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `pstdat_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tex1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tex1_0` AS string)), '') AS string) END as string)
 AS `tex1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tex2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tex2_0` AS string)), '') AS string) END as string)
 AS `tex2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trscod_0` AS string)), '') AS string) END as string)
 AS `trscod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entcod_0` AS string)), '') AS string) END as string)
 AS `entcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cai_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cai_0` AS string)), '') AS string) END as string)
 AS `cai_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`datvlycai_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`datvlycai_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `datvlycai_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`typvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`typvcr_0` AS string)), '') AS string) END as string)
 AS `typvcr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clsvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clsvcr_0` AS string)), '') AS string) END as string)
 AS `clsvcr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scuvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scuvcr_0` AS string)), '') AS string) END as string)
 AS `scuvcr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seqvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seqvcr_0` AS string)), '') AS string) END as string)
 AS `seqvcr_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) END as string)
 AS `dspweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) END as string)
 AS `dspvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totlinamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totlinamt_0` AS string)), '') AS string) END as numeric)
 AS `totlinamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totlinqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totlinqty_0` AS string)), '') AS string) END as numeric)
 AS `totlinqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totlinweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totlinweu_0` AS string)), '') AS string) END as numeric)
 AS `totlinweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totlinvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totlinvou_0` AS string)), '') AS string) END as numeric)
 AS `totlinvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totamtnot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totamtnot_0` AS string)), '') AS string) END as numeric)
 AS `totamtnot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totamtnotl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totamtnotl_0` AS string)), '') AS string) END as numeric)
 AS `totamtnotl_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tottaxamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tottaxamt_0` AS string)), '') AS string) END as numeric)
 AS `tottaxamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totamtati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totamtati_0` AS string)), '') AS string) END as numeric)
 AS `totamtati_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`totamtatil_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`totamtatil_0` AS string)), '') AS string) END as numeric)
 AS `totamtatil_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin1_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin1_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin1_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_0` AS string)), '') AS string) END as string)
 AS `invdtavat1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_1` AS string)), '') AS string) END as string)
 AS `invdtavat1_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_2` AS string)), '') AS string) END as string)
 AS `invdtavat1_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_3` AS string)), '') AS string) END as string)
 AS `invdtavat1_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_4` AS string)), '') AS string) END as string)
 AS `invdtavat1_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_5` AS string)), '') AS string) END as string)
 AS `invdtavat1_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_6` AS string)), '') AS string) END as string)
 AS `invdtavat1_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_7` AS string)), '') AS string) END as string)
 AS `invdtavat1_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat1_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat1_8` AS string)), '') AS string) END as string)
 AS `invdtavat1_8`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtalin2_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtalin2_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdtalin2_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_0` AS string)), '') AS string) END as string)
 AS `invdtavat2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_1` AS string)), '') AS string) END as string)
 AS `invdtavat2_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_2` AS string)), '') AS string) END as string)
 AS `invdtavat2_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_3` AS string)), '') AS string) END as string)
 AS `invdtavat2_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_4` AS string)), '') AS string) END as string)
 AS `invdtavat2_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_5` AS string)), '') AS string) END as string)
 AS `invdtavat2_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_6` AS string)), '') AS string) END as string)
 AS `invdtavat2_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_7` AS string)), '') AS string) END as string)
 AS `invdtavat2_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtavat2_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtavat2_8` AS string)), '') AS string) END as string)
 AS `invdtavat2_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrhe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrhe_0` AS string)), '') AS string) END as string)
 AS `wrhe_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`licplate_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`licplate_0` AS string)), '') AS string) END as string)
 AS `licplate_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trllicplate_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trllicplate_0` AS string)), '') AS string) END as string)
 AS `trllicplate_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpedat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpedat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `dpedat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `arvdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`etd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`etd_0` AS string)), '') AS string) END as string)
 AS `etd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eta_0` AS string)), '') AS string) END as string)
 AS `eta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`preceipt` AS source_table

 ) AS un_ordered

;

