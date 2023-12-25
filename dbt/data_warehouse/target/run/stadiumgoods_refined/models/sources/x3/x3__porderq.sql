

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__porderq`
  OPTIONS()
  as 

  




















































































































































 

SELECT   `updtick_0`,  `purchase_id`,  `purchase_line`,  `poqseq_0`,  `poqlnk_0`,  `cpy_0`,  `pohfcy_0`,  `pohtyp_0`,  `orddat_0`,  `bpsnum_0`,  `bpsinv_0`,  `bpainv_0`,  `linrevnum_0`,  `itmref_0`,  `itmrefbps_0`,  `puu_0`,  `stu_0`,  `uom_0`,  `uomflg_0`,  `uompuucoe_0`,  `likqtycoe_0`,  `qtyuom_0`,  `qtypuu_0`,  `qtystu_0`,  `qtyweu_0`,  `linweu_0`,  `qtyvou_0`,  `linvou_0`,  `retqtypuu_0`,  `retqtystu_0`,  `rcpqtypuu_0`,  `rcpqtystu_0`,  `invqtypuu_0`,  `invqtystu_0`,  `retrcpdat_0`,  `extrcpdat_0`,  `linstofcy_0`,  `prhfcy_0`,  `fcyadd_0`,  `ofs_0`,  `useplc_0`,  `scoadd_0`,  `wiptyp_0`,  `wipsta_0`,  `wipnum_0`,  `linpurtyp_0`,  `lasrcpdat_0`,  `lasinvdat_0`,  `invrcpnbr_0`,  `linrcpnbr_0`,  `lininvnbr_0`,  `lintex_0`,  `rcpcleflg_0`,  `lincleflg_0`,  `lininvflg_0`,  `linprnflg_0`,  `cmmtax_0`,  `cmmnum_0`,  `cmmflg_0`,  `fbuflg_0`,  `ori_0`,  `linocndat_0`,  `linocnnum_0`,  `linocnflg_0`,  `netcur_0`,  `cprcoe_0`,  `cpramt_0`,  `stcnum_0`,  `cstpur_0`,  `cpr_0`,  `cprcur_0`,  `cprpri_0`,  `fcscstpur_0`,  `fcscpr_0`,  `linamt_0`,  `linamtcpr_0`,  `lincstpur_0`,  `reacstpur_0`,  `linati_0`,  `linatiamt_0`,  `discrgamt1_0`,  `discrgamt2_0`,  `discrgamt3_0`,  `discrgamt4_0`,  `discrgamt5_0`,  `discrgamt6_0`,  `discrgamt7_0`,  `discrgamt8_0`,  `discrgamt9_0`,  `clcamt1_0`,  `clcamt2_0`,  `clcamt3_0`,  `clcamt4_0`,  `clcamt5_0`,  `clcamt6_0`,  `clcamt7_0`,  `disbaslin1_0`,  `bastaxlin1_0`,  `amttaxlin1_0`,  `amttaxlin2_0`,  `amttaxlin3_0`,  `amttaxrcp_0`,  `amttaxiss_0`,  `amttaxoth1_0`,  `amttaxoth2_0`,  `dedtaxlin1_0`,  `dedtaxlin2_0`,  `dedtaxlin3_0`,  `dedtaxrcp_0`,  `dedtaxiss_0`,  `dedtaxoth1_0`,  `dedtaxoth2_0`,  `pqhnum_0`,  `ppdlin_0`,  `sohnum_0`,  `soplin_0`,  `soqseq_0`,  `sdhnum_0`,  `sddlin_0`,  `cad_0`,  `yea_0`,  `mon_0`,  `wee_0`,  `linsta_0`,  `lintyp_0`,  `demrcpdat_0`,  `demrcphou_0`,  `demenddat_0`,  `demendhou_0`,  `itmrefori_0`,  `vcrtypori_0`,  `vcrnumori_0`,  `vcrlinori_0`,  `vcrseqori_0`,  `receipt_id`,  `receipt_line`,  `ocnlin_0`,  `ocnseq_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `zuomdes_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohnum_0` AS string)), '') AS string) END as string)
 AS `purchase_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poplin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poplin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `purchase_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poqseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poqseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `poqseq_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poqlnk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poqlnk_0` AS string)), '') AS string) END as string)
 AS `poqlnk_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohfcy_0` AS string)), '') AS string) END as string)
 AS `pohfcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pohtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `orddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) END as string)
 AS `bpsnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) END as string)
 AS `bpsinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linrevnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linrevnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linrevnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `itmref_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmrefbps_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmrefbps_0` AS string)), '') AS string) END as string)
 AS `itmrefbps_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`puu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`puu_0` AS string)), '') AS string) END as string)
 AS `puu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) END as string)
 AS `stu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uom_0` AS string)), '') AS string) END as string)
 AS `uom_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uomflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uomflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `uomflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uompuucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uompuucoe_0` AS string)), '') AS string) END as numeric)
 AS `uompuucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`likqtycoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`likqtycoe_0` AS string)), '') AS string) END as numeric)
 AS `likqtycoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtyuom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtyuom_0` AS string)), '') AS string) END as numeric)
 AS `qtyuom_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtypuu_0` AS string)), '') AS string) END as numeric)
 AS `qtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtyweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtyweu_0` AS string)), '') AS string) END as numeric)
 AS `qtyweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linweu_0` AS string)), '') AS string) END as string)
 AS `linweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtyvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtyvou_0` AS string)), '') AS string) END as numeric)
 AS `qtyvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linvou_0` AS string)), '') AS string) END as string)
 AS `linvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retqtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retqtypuu_0` AS string)), '') AS string) END as numeric)
 AS `retqtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retqtystu_0` AS string)), '') AS string) END as numeric)
 AS `retqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpqtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpqtypuu_0` AS string)), '') AS string) END as numeric)
 AS `rcpqtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpqtystu_0` AS string)), '') AS string) END as numeric)
 AS `rcpqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invqtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invqtypuu_0` AS string)), '') AS string) END as numeric)
 AS `invqtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invqtystu_0` AS string)), '') AS string) END as numeric)
 AS `invqtystu_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retrcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retrcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `retrcpdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extrcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extrcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `extrcpdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linstofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linstofcy_0` AS string)), '') AS string) END as string)
 AS `linstofcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) END as string)
 AS `prhfcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcyadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcyadd_0` AS string)), '') AS string) END as string)
 AS `fcyadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ofs_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ofs_0` AS string)), '') AS string) END as numeric)
 AS `ofs_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`useplc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`useplc_0` AS string)), '') AS string) END as string)
 AS `useplc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scoadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scoadd_0` AS string)), '') AS string) END as string)
 AS `scoadd_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wiptyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wiptyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `wiptyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wipsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wipsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `wipsta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wipnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wipnum_0` AS string)), '') AS string) END as string)
 AS `wipnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linpurtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linpurtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linpurtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasrcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasrcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lasrcpdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasinvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasinvdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lasinvdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invrcpnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invrcpnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invrcpnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linrcpnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linrcpnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linrcpnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lininvnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lininvnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lininvnbr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lintex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lintex_0` AS string)), '') AS string) END as string)
 AS `lintex_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpcleflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpcleflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `rcpcleflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lincleflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lincleflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lincleflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lininvflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lininvflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lininvflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linprnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linprnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linprnflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cmmtax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cmmtax_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cmmtax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cmmnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cmmnum_0` AS string)), '') AS string) END as string)
 AS `cmmnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cmmflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cmmflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cmmflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fbuflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fbuflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fbuflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linocndat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linocndat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `linocndat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linocnnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linocnnum_0` AS string)), '') AS string) END as string)
 AS `linocnnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linocnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linocnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linocnflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netcur_0` AS string)), '') AS string) END as string)
 AS `netcur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprcoe_0` AS string)), '') AS string) END as numeric)
 AS `cprcoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpramt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpramt_0` AS string)), '') AS string) END as numeric)
 AS `cpramt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stcnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stcnum_0` AS string)), '') AS string) END as string)
 AS `stcnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cstpur_0` AS string)), '') AS string) END as numeric)
 AS `cstpur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpr_0` AS string)), '') AS string) END as numeric)
 AS `cpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprcur_0` AS string)), '') AS string) END as string)
 AS `cprcur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) END as numeric)
 AS `cprpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscstpur_0` AS string)), '') AS string) END as numeric)
 AS `fcscstpur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscpr_0` AS string)), '') AS string) END as numeric)
 AS `fcscpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linamt_0` AS string)), '') AS string) END as numeric)
 AS `linamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linamtcpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linamtcpr_0` AS string)), '') AS string) END as numeric)
 AS `linamtcpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lincstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lincstpur_0` AS string)), '') AS string) END as numeric)
 AS `lincstpur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reacstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reacstpur_0` AS string)), '') AS string) END as numeric)
 AS `reacstpur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linati_0` AS string)), '') AS string) END as numeric)
 AS `linati_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linatiamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linatiamt_0` AS string)), '') AS string) END as numeric)
 AS `linatiamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt1_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt2_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt3_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt4_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt5_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt5_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt6_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt6_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt6_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt7_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt7_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt7_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt8_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt8_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt8_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgamt9_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgamt9_0` AS string)), '') AS string) END as numeric)
 AS `discrgamt9_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt1_0` AS string)), '') AS string) END as numeric)
 AS `clcamt1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt2_0` AS string)), '') AS string) END as numeric)
 AS `clcamt2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt3_0` AS string)), '') AS string) END as numeric)
 AS `clcamt3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt4_0` AS string)), '') AS string) END as numeric)
 AS `clcamt4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt5_0` AS string)), '') AS string) END as numeric)
 AS `clcamt5_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt6_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt6_0` AS string)), '') AS string) END as numeric)
 AS `clcamt6_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt7_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt7_0` AS string)), '') AS string) END as numeric)
 AS `clcamt7_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`disbaslin1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`disbaslin1_0` AS string)), '') AS string) END as numeric)
 AS `disbaslin1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastaxlin1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastaxlin1_0` AS string)), '') AS string) END as numeric)
 AS `bastaxlin1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxlin1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxlin1_0` AS string)), '') AS string) END as numeric)
 AS `amttaxlin1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxlin2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxlin2_0` AS string)), '') AS string) END as numeric)
 AS `amttaxlin2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxlin3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxlin3_0` AS string)), '') AS string) END as numeric)
 AS `amttaxlin3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxrcp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxrcp_0` AS string)), '') AS string) END as numeric)
 AS `amttaxrcp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxiss_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxiss_0` AS string)), '') AS string) END as numeric)
 AS `amttaxiss_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxoth1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxoth1_0` AS string)), '') AS string) END as numeric)
 AS `amttaxoth1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amttaxoth2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amttaxoth2_0` AS string)), '') AS string) END as numeric)
 AS `amttaxoth2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dedtaxlin1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dedtaxlin1_0` AS string)), '') AS string) END as numeric)
 AS `dedtaxlin1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dedtaxlin2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dedtaxlin2_0` AS string)), '') AS string) END as numeric)
 AS `dedtaxlin2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dedtaxlin3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dedtaxlin3_0` AS string)), '') AS string) END as numeric)
 AS `dedtaxlin3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dedtaxrcp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dedtaxrcp_0` AS string)), '') AS string) END as numeric)
 AS `dedtaxrcp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dedtaxiss_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dedtaxiss_0` AS string)), '') AS string) END as numeric)
 AS `dedtaxiss_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dedtaxoth1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dedtaxoth1_0` AS string)), '') AS string) END as numeric)
 AS `dedtaxoth1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dedtaxoth2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dedtaxoth2_0` AS string)), '') AS string) END as numeric)
 AS `dedtaxoth2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pqhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pqhnum_0` AS string)), '') AS string) END as string)
 AS `pqhnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ppdlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ppdlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ppdlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) END as string)
 AS `sohnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `soplin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soqseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soqseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `soqseq_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) END as string)
 AS `sdhnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sddlin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cad_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cad_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cad_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yea_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yea_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `yea_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mon_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mon_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `mon_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wee_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wee_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `wee_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linsta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lintyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demrcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demrcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `demrcpdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demrcphou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demrcphou_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `demrcphou_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demenddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demenddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `demenddat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demendhou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demendhou_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `demendhou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmrefori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmrefori_0` AS string)), '') AS string) END as string)
 AS `itmrefori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrtypori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrtypori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrtypori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrnumori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrnumori_0` AS string)), '') AS string) END as string)
 AS `vcrnumori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrlinori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrlinori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrlinori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrseqori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrseqori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrseqori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pthnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pthnum_0` AS string)), '') AS string) END as string)
 AS `receipt_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ptdlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ptdlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `receipt_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ocnlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ocnlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ocnlin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ocnseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ocnseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ocnseq_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zuomdes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zuomdes_0` AS string)), '') AS string) END as string)
 AS `zuomdes_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`porderq` AS source_table

 ) AS un_ordered

;

