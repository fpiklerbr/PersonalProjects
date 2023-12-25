

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__preceiptd`
  OPTIONS()
  as 

  

































































































































































 

SELECT   `updtick_0`,  `receipt_id`,  `receipt_line`,  `cpy_0`,  `prhfcy_0`,  `rcpdat_0`,  `pohfcy_0`,  `pohnum_0`,  `poplin_0`,  `poqseq_0`,  `pohtyp_0`,  `supplier_id`,  `bpsinv_0`,  `bpainv_0`,  `pjt_0`,  `itmref_0`,  `itmdes1_0`,  `itmdes_0`,  `cost`,  `priren_0`,  `discrgval1_0`,  `discrgval2_0`,  `discrgval3_0`,  `discrgval4_0`,  `discrgval5_0`,  `discrgval6_0`,  `discrgval7_0`,  `discrgval8_0`,  `discrgval9_0`,  `discrgren1_0`,  `discrgren2_0`,  `discrgren3_0`,  `discrgren4_0`,  `discrgren5_0`,  `discrgren6_0`,  `discrgren7_0`,  `discrgren8_0`,  `discrgren9_0`,  `netpri_0`,  `netpripuu_0`,  `linamt_0`,  `linamtcpr_0`,  `lincstpur_0`,  `linatiamt_0`,  `discrgamt1_0`,  `discrgamt2_0`,  `discrgamt3_0`,  `discrgamt4_0`,  `discrgamt5_0`,  `discrgamt6_0`,  `discrgamt7_0`,  `discrgamt8_0`,  `discrgamt9_0`,  `clcamt1_0`,  `clcamt2_0`,  `clcamt3_0`,  `clcamt4_0`,  `clcamt5_0`,  `clcamt6_0`,  `clcamt7_0`,  `disbaslin1_0`,  `bastaxlin1_0`,  `amttaxlin1_0`,  `amttaxlin2_0`,  `amttaxlin3_0`,  `amttaxrcp_0`,  `amttaxiss_0`,  `amttaxoth1_0`,  `amttaxoth2_0`,  `dedtaxlin1_0`,  `dedtaxlin2_0`,  `dedtaxlin3_0`,  `dedtaxrcp_0`,  `dedtaxiss_0`,  `dedtaxoth1_0`,  `dedtaxoth2_0`,  `cprpri_0`,  `cpr_0`,  `cprclc_0`,  `cstpur_0`,  `cprcoe_0`,  `cpramt_0`,  `stcnum_0`,  `netcur_0`,  `cprcur_0`,  `fcscstpur_0`,  `fcscpr_0`,  `fcscprcpt_0`,  `qtyuom_0`,  `qtypuu_0`,  `qtystu_0`,  `qtyweu_0`,  `linweu_0`,  `qtyvou_0`,  `linvou_0`,  `uom_0`,  `puu_0`,  `stu_0`,  `uompuucoe_0`,  `uomstucoe_0`,  `rrrqtypuu_0`,  `rrrqtystu_0`,  `rtnqtypuu_0`,  `rtnqtystu_0`,  `invqtypuu_0`,  `invqtystu_0`,  `linprnflg_0`,  `lininvflg_0`,  `lineecflg_0`,  `linpstflg_0`,  `linpstdat_0`,  `quaflg_0`,  `quartnflg_0`,  `linpurtyp_0`,  `eecincrat_0`,  `oricry_0`,  `bpocry_0`,  `satiss_0`,  `tsicod_0`,  `tsicod_1`,  `tsicod_2`,  `tsicod_3`,  `tsicod_4`,  `trsfam_0`,  `vat_0`,  `vat_1`,  `vat_2`,  `taxrcp_0`,  `taxiss_0`,  `taxoth1_0`,  `taxoth2_0`,  `lintex_0`,  `sdhnum_0`,  `sddlin_0`,  `linstofcy_0`,  `itmrefori_0`,  `vcrtypori_0`,  `vcrnumori_0`,  `vcrlinori_0`,  `vcrseqori_0`,  `stomgtcod_0`,  `verflg_0`,  `lintyp_0`,  `lincat_0`,  `likqtycoe_0`,  `wrh_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `mattol_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `scocstcpt_0`,  `yupccod_0`,  `yprice1_0`,  `zcprpri_0`,  `zoriserial_0`,  `rowid`
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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ptdlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ptdlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `receipt_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) END as string)
 AS `prhfcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `rcpdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohfcy_0` AS string)), '') AS string) END as string)
 AS `pohfcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohnum_0` AS string)), '') AS string) END as string)
 AS `pohnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poplin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poplin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `poplin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poqseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poqseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `poqseq_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pohtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) END as string)
 AS `supplier_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) END as string)
 AS `bpsinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) END as string)
 AS `pjt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `itmref_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) END as string)
 AS `itmdes1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes_0` AS string)), '') AS string) END as string)
 AS `itmdes_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) END as float64)
 AS `cost`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `priren_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval1_0` AS string)), '') AS string) END as numeric)
 AS `discrgval1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval2_0` AS string)), '') AS string) END as numeric)
 AS `discrgval2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval3_0` AS string)), '') AS string) END as numeric)
 AS `discrgval3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval4_0` AS string)), '') AS string) END as numeric)
 AS `discrgval4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval5_0` AS string)), '') AS string) END as numeric)
 AS `discrgval5_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval6_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval6_0` AS string)), '') AS string) END as numeric)
 AS `discrgval6_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval7_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval7_0` AS string)), '') AS string) END as numeric)
 AS `discrgval7_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval8_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval8_0` AS string)), '') AS string) END as numeric)
 AS `discrgval8_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval9_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval9_0` AS string)), '') AS string) END as numeric)
 AS `discrgval9_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren1_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren1_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren2_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren3_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren3_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren4_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren4_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren5_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren5_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren6_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren6_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren6_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren7_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren7_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren7_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren8_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren8_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren8_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren9_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren9_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren9_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) END as numeric)
 AS `netpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpripuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpripuu_0` AS string)), '') AS string) END as numeric)
 AS `netpripuu_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) END as numeric)
 AS `cprpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpr_0` AS string)), '') AS string) END as numeric)
 AS `cpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprclc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprclc_0` AS string)), '') AS string) END as numeric)
 AS `cprclc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cstpur_0` AS string)), '') AS string) END as numeric)
 AS `cstpur_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netcur_0` AS string)), '') AS string) END as string)
 AS `netcur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprcur_0` AS string)), '') AS string) END as string)
 AS `cprcur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscstpur_0` AS string)), '') AS string) END as numeric)
 AS `fcscstpur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscpr_0` AS string)), '') AS string) END as numeric)
 AS `fcscpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscprcpt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscprcpt_0` AS string)), '') AS string) END as numeric)
 AS `fcscprcpt_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uom_0` AS string)), '') AS string) END as string)
 AS `uom_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`puu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`puu_0` AS string)), '') AS string) END as string)
 AS `puu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) END as string)
 AS `stu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uompuucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uompuucoe_0` AS string)), '') AS string) END as numeric)
 AS `uompuucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uomstucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uomstucoe_0` AS string)), '') AS string) END as numeric)
 AS `uomstucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rrrqtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rrrqtypuu_0` AS string)), '') AS string) END as numeric)
 AS `rrrqtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rrrqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rrrqtystu_0` AS string)), '') AS string) END as numeric)
 AS `rrrqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtnqtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtnqtypuu_0` AS string)), '') AS string) END as numeric)
 AS `rtnqtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtnqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtnqtystu_0` AS string)), '') AS string) END as numeric)
 AS `rtnqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invqtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invqtypuu_0` AS string)), '') AS string) END as numeric)
 AS `invqtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invqtystu_0` AS string)), '') AS string) END as numeric)
 AS `invqtystu_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linprnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linprnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linprnflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lininvflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lininvflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lininvflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lineecflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lineecflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lineecflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linpstflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linpstflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linpstflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linpstdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linpstdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `linpstdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quaflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quaflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `quaflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quartnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quartnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `quartnflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linpurtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linpurtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linpurtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecincrat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecincrat_0` AS string)), '') AS string) END as numeric)
 AS `eecincrat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oricry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oricry_0` AS string)), '') AS string) END as string)
 AS `oricry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpocry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpocry_0` AS string)), '') AS string) END as string)
 AS `bpocry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`satiss_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`satiss_0` AS string)), '') AS string) END as string)
 AS `satiss_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_0` AS string)), '') AS string) END as string)
 AS `tsicod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_1` AS string)), '') AS string) END as string)
 AS `tsicod_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_2` AS string)), '') AS string) END as string)
 AS `tsicod_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_3` AS string)), '') AS string) END as string)
 AS `tsicod_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_4` AS string)), '') AS string) END as string)
 AS `tsicod_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trsfam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trsfam_0` AS string)), '') AS string) END as string)
 AS `trsfam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_0` AS string)), '') AS string) END as string)
 AS `vat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_1` AS string)), '') AS string) END as string)
 AS `vat_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_2` AS string)), '') AS string) END as string)
 AS `vat_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxrcp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxrcp_0` AS string)), '') AS string) END as string)
 AS `taxrcp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxiss_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxiss_0` AS string)), '') AS string) END as string)
 AS `taxiss_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxoth1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxoth1_0` AS string)), '') AS string) END as string)
 AS `taxoth1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxoth2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxoth2_0` AS string)), '') AS string) END as string)
 AS `taxoth2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lintex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lintex_0` AS string)), '') AS string) END as string)
 AS `lintex_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) END as string)
 AS `sdhnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sddlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linstofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linstofcy_0` AS string)), '') AS string) END as string)
 AS `linstofcy_0`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stomgtcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stomgtcod_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `stomgtcod_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`verflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`verflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `verflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lintyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lincat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lincat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lincat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`likqtycoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`likqtycoe_0` AS string)), '') AS string) END as numeric)
 AS `likqtycoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) END as string)
 AS `wrh_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mattol_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mattol_0` AS string)), '') AS string) END as string)
 AS `mattol_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scocstcpt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scocstcpt_0` AS string)), '') AS string) END as numeric)
 AS `scocstcpt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yupccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yupccod_0` AS string)), '') AS string) END as string)
 AS `yupccod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yprice1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yprice1_0` AS string)), '') AS string) END as numeric)
 AS `yprice1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zcprpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zcprpri_0` AS string)), '') AS string) END as numeric)
 AS `zcprpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zoriserial_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zoriserial_0` AS string)), '') AS string) END as string)
 AS `zoriserial_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`preceiptd` AS source_table

 ) AS un_ordered

;

