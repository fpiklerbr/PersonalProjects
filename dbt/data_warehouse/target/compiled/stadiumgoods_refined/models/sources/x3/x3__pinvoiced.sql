

  






























































































































































 

SELECT   `updtick_0`,  `invtyp_0`,  `invoice_id`,  `invoice_line`,  `pivtyp_0`,  `pihtyp_0`,  `cpy_0`,  `fcy_0`,  `invoice_date`,  `business_partner_id`,  `fcylin_0`,  `typori_0`,  `document_id`,  `document_line`,  `seqori_0`,  `itmref_0`,  `itmdes1_0`,  `itmdes_0`,  `uom_0`,  `puu_0`,  `stu_0`,  `uompuucoe_0`,  `qtyuom_0`,  `qtypuu_0`,  `oriqtypuu_0`,  `qtystu_0`,  `qtyweu_0`,  `oriqtyweu_0`,  `linweu_0`,  `qtyvou_0`,  `oriqtyvou_0`,  `linvou_0`,  `gross_price`,  `priren_0`,  `discrgval1_0`,  `discrgval2_0`,  `discrgval3_0`,  `discrgval4_0`,  `discrgval5_0`,  `discrgval6_0`,  `discrgval7_0`,  `discrgval8_0`,  `discrgval9_0`,  `discrgren1_0`,  `discrgren2_0`,  `discrgren3_0`,  `discrgren4_0`,  `discrgren5_0`,  `discrgren6_0`,  `discrgren7_0`,  `discrgren8_0`,  `discrgren9_0`,  `net_price`,  `orinetpri_0`,  `linpurtyp_0`,  `discrgamt1_0`,  `discrgamt2_0`,  `discrgamt3_0`,  `discrgamt4_0`,  `discrgamt5_0`,  `discrgamt6_0`,  `discrgamt7_0`,  `discrgamt8_0`,  `discrgamt9_0`,  `netcur_0`,  `pohnum_0`,  `poplin_0`,  `poqseq_0`,  `pthnum_0`,  `ptdlin_0`,  `pnhnum_0`,  `pndlin_0`,  `invnum_0`,  `invlin_0`,  `sidlin_0`,  `supplier_id`,  `rcpdat_0`,  `pjt_0`,  `tsicod_0`,  `tsicod_1`,  `tsicod_2`,  `tsicod_3`,  `tsicod_4`,  `satiss_0`,  `satrcp_0`,  `vat_0`,  `vat_1`,  `vat_2`,  `taxrcp_0`,  `taxiss_0`,  `taxoth1_0`,  `taxoth2_0`,  `amtnotlin_0`,  `amtatilin_0`,  `qtybudlin_0`,  `qtyglu_0`,  `glu_0`,  `clcamt1_0`,  `clcamt2_0`,  `clcamt3_0`,  `clcamt4_0`,  `clcamt5_0`,  `clcamt6_0`,  `clcamt7_0`,  `disbaslin1_0`,  `bastaxlin1_0`,  `amttaxlin1_0`,  `amttaxlin2_0`,  `amttaxlin3_0`,  `amttaxrcp_0`,  `amttaxiss_0`,  `amttaxoth1_0`,  `amttaxoth2_0`,  `dedtaxlin1_0`,  `dedtaxlin2_0`,  `dedtaxlin3_0`,  `dedtaxrcp_0`,  `dedtaxiss_0`,  `dedtaxoth1_0`,  `dedtaxoth2_0`,  `cprcoe_0`,  `cpramt_0`,  `cpr_0`,  `cstpur_0`,  `linamtcpr_0`,  `lincstpur_0`,  `stcnum_0`,  `cprcur_0`,  `fcscpr_0`,  `fcscstpur_0`,  `prtflg_0`,  `lintex_0`,  `lineecflg_0`,  `eecflophy_0`,  `strdat_0`,  `enddat_0`,  `pernbr_0`,  `pertyp_0`,  `fasref_0`,  `lintyp_0`,  `likqtycoe_0`,  `cmmnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `mattol_0`,  `twmsta_0`,  `flg1099_0`,  `amtnotlincal_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `dcleecnum_0`,  `cstmajlin_0`,  `fcscod_0`,  `stcrflg_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num_0` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pidlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pidlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invoice_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pivtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pivtyp_0` AS string)), '') AS string) END as string)
 AS `pivtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pihtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pihtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pihtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) END as string)
 AS `fcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `invoice_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) END as string)
 AS `business_partner_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcylin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcylin_0` AS string)), '') AS string) END as string)
 AS `fcylin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`typori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`typori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `typori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`numori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`numori_0` AS string)), '') AS string) END as string)
 AS `document_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `document_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seqori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seqori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `seqori_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtyuom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtyuom_0` AS string)), '') AS string) END as numeric)
 AS `qtyuom_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtypuu_0` AS string)), '') AS string) END as numeric)
 AS `qtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oriqtypuu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oriqtypuu_0` AS string)), '') AS string) END as numeric)
 AS `oriqtypuu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtyweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtyweu_0` AS string)), '') AS string) END as numeric)
 AS `qtyweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oriqtyweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oriqtyweu_0` AS string)), '') AS string) END as numeric)
 AS `oriqtyweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linweu_0` AS string)), '') AS string) END as string)
 AS `linweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtyvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtyvou_0` AS string)), '') AS string) END as numeric)
 AS `qtyvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oriqtyvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oriqtyvou_0` AS string)), '') AS string) END as numeric)
 AS `oriqtyvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linvou_0` AS string)), '') AS string) END as string)
 AS `linvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) END as float64)
 AS `gross_price`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) END as float64)
 AS `net_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orinetpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orinetpri_0` AS string)), '') AS string) END as numeric)
 AS `orinetpri_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linpurtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linpurtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linpurtyp_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netcur_0` AS string)), '') AS string) END as string)
 AS `netcur_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pthnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pthnum_0` AS string)), '') AS string) END as string)
 AS `pthnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ptdlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ptdlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ptdlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pnhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pnhnum_0` AS string)), '') AS string) END as string)
 AS `pnhnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pndlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pndlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pndlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invnum_0` AS string)), '') AS string) END as string)
 AS `invnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invlin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sidlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sidlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sidlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) END as string)
 AS `supplier_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `rcpdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) END as string)
 AS `pjt_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`satiss_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`satiss_0` AS string)), '') AS string) END as string)
 AS `satiss_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`satrcp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`satrcp_0` AS string)), '') AS string) END as string)
 AS `satrcp_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtnotlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtnotlin_0` AS string)), '') AS string) END as numeric)
 AS `amtnotlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtatilin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtatilin_0` AS string)), '') AS string) END as numeric)
 AS `amtatilin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtybudlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtybudlin_0` AS string)), '') AS string) END as numeric)
 AS `qtybudlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtyglu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtyglu_0` AS string)), '') AS string) END as numeric)
 AS `qtyglu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`glu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`glu_0` AS string)), '') AS string) END as string)
 AS `glu_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprcoe_0` AS string)), '') AS string) END as numeric)
 AS `cprcoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpramt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpramt_0` AS string)), '') AS string) END as numeric)
 AS `cpramt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpr_0` AS string)), '') AS string) END as numeric)
 AS `cpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cstpur_0` AS string)), '') AS string) END as numeric)
 AS `cstpur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linamtcpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linamtcpr_0` AS string)), '') AS string) END as numeric)
 AS `linamtcpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lincstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lincstpur_0` AS string)), '') AS string) END as numeric)
 AS `lincstpur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stcnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stcnum_0` AS string)), '') AS string) END as string)
 AS `stcnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprcur_0` AS string)), '') AS string) END as string)
 AS `cprcur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscpr_0` AS string)), '') AS string) END as numeric)
 AS `fcscpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscstpur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscstpur_0` AS string)), '') AS string) END as numeric)
 AS `fcscstpur_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prtflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lintex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lintex_0` AS string)), '') AS string) END as string)
 AS `lintex_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lineecflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lineecflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lineecflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecflophy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecflophy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eecflophy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`strdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`strdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `strdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`enddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `enddat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pernbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pernbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pernbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pertyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pertyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pertyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fasref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fasref_0` AS string)), '') AS string) END as string)
 AS `fasref_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lintyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`likqtycoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`likqtycoe_0` AS string)), '') AS string) END as numeric)
 AS `likqtycoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cmmnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cmmnum_0` AS string)), '') AS string) END as string)
 AS `cmmnum_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`twmsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`twmsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `twmsta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flg1099_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flg1099_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flg1099_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtnotlincal_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtnotlincal_0` AS string)), '') AS string) END as numeric)
 AS `amtnotlincal_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dcleecnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dcleecnum_0` AS string)), '') AS string) END as string)
 AS `dcleecnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cstmajlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cstmajlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cstmajlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcscod_0` AS string)), '') AS string) END as string)
 AS `fcscod_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stcrflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stcrflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `stcrflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`pinvoiced` AS source_table

 ) AS un_ordered

