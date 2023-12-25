

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorderq`
  OPTIONS()
  as 




  











































































































































 

SELECT   `updtick_0`,  `x3_order_id`,  `x3_order_line`,  `sequence_number`,  `cpy_0`,  `sohcat_0`,  `salfcy_0`,  `bpcord_0`,  `bpaadd_0`,  `itmref_0`,  `stofcy_0`,  `useplc_0`,  `cad_0`,  `yea_0`,  `mon_0`,  `dlvday_0`,  `wee_0`,  `orddat_0`,  `demdlvdat_0`,  `demdlvhou_0`,  `demdlvref_0`,  `impnumlig_0`,  `shidat_0`,  `shihou_0`,  `extdlvdat_0`,  `soqsta_0`,  `invoice_flag_code`,  `invoice_flag`,  `demsta_0`,  `demnum_0`,  `stomgtcod_0`,  `lot_0`,  `sta_0`,  `loc_0`,  `alltyp_0`,  `dsplinflg_0`,  `ddtanum_0`,  `ddtanum_1`,  `ddtanum_2`,  `ddtanum_3`,  `ddtanum_4`,  `ddtanum_5`,  `ddtanum_6`,  `ddtanum_7`,  `ddtanum_8`,  `ddtanot_0`,  `ddtanot_1`,  `ddtanot_2`,  `ddtanot_3`,  `ddtanot_4`,  `ddtanot_5`,  `ddtanot_6`,  `ddtanot_7`,  `ddtanot_8`,  `oriqty_0`,  `qty_ordered`,  `shtqty_0`,  `allqty_0`,  `odlqty_0`,  `qty_delivered`,  `invqty_0`,  `tdlqty_0`,  `lprqty_0`,  `oprqty_0`,  `preqty_0`,  `qtystu_0`,  `shtqtystu_0`,  `allqtystu_0`,  `odlqtystu_0`,  `dlvqtystu_0`,  `invqtystu_0`,  `tdlqtystu_0`,  `lprqtystu_0`,  `oprqtystu_0`,  `preqtystu_0`,  `precod_0`,  `drn_0`,  `dlvpio_0`,  `dlvpiocmp_0`,  `bptnum_0`,  `mdl_0`,  `daylti_0`,  `pck_0`,  `pckcap_0`,  `soqtex_0`,  `delivery_id`,  `delivery_line`,  `fmi_0`,  `fminum_0`,  `fmilin_0`,  `fmiseq_0`,  `pohnum_0`,  `poplin_0`,  `poqseq_0`,  `perstrdat_0`,  `perenddat_0`,  `pernbrday_0`,  `geocod_0`,  `insctyflg_0`,  `vts_0`,  `vtc_0`,  `taxgeoflg_0`,  `taxflg_0`,  `taxregflg_0`,  `rattaxlin_0`,  `bastaxlin_0`,  `ocnprnbom_0`,  `ndeprnbom_0`,  `invprnbom_0`,  `cclren_0`,  `ccldat_0`,  `pitflg_0`,  `expnum_0`,  `dsplinwei_0`,  `dsplinvol_0`,  `dspweu_0`,  `dspvou_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `created_at`,  `upddattim_0`,  `auuid_0`,  `serial_number`,  `ycondi1_0`,  `ycondi2_0`,  `ycondi3_0`,  `ycondi4_0`,  `ycondi5_0`,  `ydisre1_0`,  `ydisre2_0`,  `ydisre3_0`,  `yupccod_0`,  `yserialreq_0`,  `yloc_0`,  `mag_order_item_id`,  `rowid`
    , `_raw_zclosedet_0`
    , `_raw_zclousr_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , CASE invoice_flag_code
WHEN 0 THEN cast( 'None' AS string)
WHEN 1 THEN cast( 'No' AS string)
WHEN 2 THEN cast( 'Yes' AS string)
ELSE cast(invoice_flag_code AS string)
END AS `invoice_flag` 
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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `x3_order_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soqseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soqseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sequence_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sohcat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`salfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`salfcy_0` AS string)), '') AS string) END as string)
 AS `salfcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) END as string)
 AS `bpcord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `itmref_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `stofcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`useplc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`useplc_0` AS string)), '') AS string) END as string)
 AS `useplc_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvday_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvday_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dlvday_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wee_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wee_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `wee_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `orddat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demdlvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demdlvdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `demdlvdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demdlvhou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demdlvhou_0` AS string)), '') AS string) END as string)
 AS `demdlvhou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demdlvref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demdlvref_0` AS string)), '') AS string) END as string)
 AS `demdlvref_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`impnumlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`impnumlig_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `impnumlig_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `shidat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shihou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shihou_0` AS string)), '') AS string) END as string)
 AS `shihou_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extdlvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extdlvdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `extdlvdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soqsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soqsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `soqsta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invoice_flag_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `demsta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demnum_0` AS string)), '') AS string) END as string)
 AS `demnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stomgtcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stomgtcod_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `stomgtcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) END as string)
 AS `lot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as string)
 AS `sta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) END as string)
 AS `loc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`alltyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`alltyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `alltyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsplinflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsplinflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dsplinflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_0` AS string)), '') AS string) END as numeric)
 AS `ddtanot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_1` AS string)), '') AS string) END as numeric)
 AS `ddtanot_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_2` AS string)), '') AS string) END as numeric)
 AS `ddtanot_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_3` AS string)), '') AS string) END as numeric)
 AS `ddtanot_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_4` AS string)), '') AS string) END as numeric)
 AS `ddtanot_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_5` AS string)), '') AS string) END as numeric)
 AS `ddtanot_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_6` AS string)), '') AS string) END as numeric)
 AS `ddtanot_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_7` AS string)), '') AS string) END as numeric)
 AS `ddtanot_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_8` AS string)), '') AS string) END as numeric)
 AS `ddtanot_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oriqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oriqty_0` AS string)), '') AS string) END as numeric)
 AS `oriqty_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_ordered`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shtqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shtqty_0` AS string)), '') AS string) END as numeric)
 AS `shtqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allqty_0` AS string)), '') AS string) END as numeric)
 AS `allqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`odlqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`odlqty_0` AS string)), '') AS string) END as numeric)
 AS `odlqty_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvqty_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_delivered`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invqty_0` AS string)), '') AS string) END as numeric)
 AS `invqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tdlqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tdlqty_0` AS string)), '') AS string) END as numeric)
 AS `tdlqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lprqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lprqty_0` AS string)), '') AS string) END as numeric)
 AS `lprqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oprqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oprqty_0` AS string)), '') AS string) END as numeric)
 AS `oprqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`preqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`preqty_0` AS string)), '') AS string) END as numeric)
 AS `preqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shtqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shtqtystu_0` AS string)), '') AS string) END as numeric)
 AS `shtqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allqtystu_0` AS string)), '') AS string) END as numeric)
 AS `allqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`odlqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`odlqtystu_0` AS string)), '') AS string) END as numeric)
 AS `odlqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvqtystu_0` AS string)), '') AS string) END as numeric)
 AS `dlvqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invqtystu_0` AS string)), '') AS string) END as numeric)
 AS `invqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tdlqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tdlqtystu_0` AS string)), '') AS string) END as numeric)
 AS `tdlqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lprqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lprqtystu_0` AS string)), '') AS string) END as numeric)
 AS `lprqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oprqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oprqtystu_0` AS string)), '') AS string) END as numeric)
 AS `oprqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`preqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`preqtystu_0` AS string)), '') AS string) END as numeric)
 AS `preqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`precod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`precod_0` AS string)), '') AS string) END as string)
 AS `precod_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvpiocmp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvpiocmp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dlvpiocmp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) END as string)
 AS `bptnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) END as string)
 AS `mdl_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`daylti_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`daylti_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `daylti_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pck_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pck_0` AS string)), '') AS string) END as string)
 AS `pck_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pckcap_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pckcap_0` AS string)), '') AS string) END as numeric)
 AS `pckcap_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soqtex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soqtex_0` AS string)), '') AS string) END as string)
 AS `soqtex_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) END as string)
 AS `delivery_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fmi_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fmi_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fmi_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fminum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fminum_0` AS string)), '') AS string) END as string)
 AS `fminum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fmilin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fmilin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fmilin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fmiseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fmiseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fmiseq_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`perstrdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`perstrdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `perstrdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`perenddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`perenddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `perenddat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pernbrday_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pernbrday_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pernbrday_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`geocod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`geocod_0` AS string)), '') AS string) END as string)
 AS `geocod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`insctyflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`insctyflg_0` AS string)), '') AS string) END as string)
 AS `insctyflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vts_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vts_0` AS string)), '') AS string) END as string)
 AS `vts_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vtc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vtc_0` AS string)), '') AS string) END as string)
 AS `vtc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxgeoflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxgeoflg_0` AS string)), '') AS string) END as string)
 AS `taxgeoflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `taxflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxregflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxregflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `taxregflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rattaxlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rattaxlin_0` AS string)), '') AS string) END as numeric)
 AS `rattaxlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastaxlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastaxlin_0` AS string)), '') AS string) END as numeric)
 AS `bastaxlin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ocnprnbom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ocnprnbom_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ocnprnbom_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ndeprnbom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ndeprnbom_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ndeprnbom_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invprnbom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invprnbom_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invprnbom_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cclren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cclren_0` AS string)), '') AS string) END as string)
 AS `cclren_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ccldat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ccldat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `ccldat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pitflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pitflg_0` AS string)), '') AS string) END as numeric)
 AS `pitflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsplinwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsplinwei_0` AS string)), '') AS string) END as numeric)
 AS `dsplinwei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsplinvol_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsplinvol_0` AS string)), '') AS string) END as numeric)
 AS `dsplinvol_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) END as string)
 AS `dspweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) END as string)
 AS `dspvou_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yserial_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yserial_0` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycondi1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycondi1_0` AS string)), '') AS string) END as string)
 AS `ycondi1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycondi2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycondi2_0` AS string)), '') AS string) END as string)
 AS `ycondi2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycondi3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycondi3_0` AS string)), '') AS string) END as string)
 AS `ycondi3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycondi4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycondi4_0` AS string)), '') AS string) END as string)
 AS `ycondi4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycondi5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycondi5_0` AS string)), '') AS string) END as string)
 AS `ycondi5_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ydisre1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ydisre1_0` AS string)), '') AS string) END as string)
 AS `ydisre1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ydisre2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ydisre2_0` AS string)), '') AS string) END as string)
 AS `ydisre2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ydisre3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ydisre3_0` AS string)), '') AS string) END as string)
 AS `ydisre3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yupccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yupccod_0` AS string)), '') AS string) END as string)
 AS `yupccod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yserialreq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yserialreq_0` AS string)), '') AS string) END as string)
 AS `yserialreq_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yloc_0` AS string)), '') AS string) END as string)
 AS `yloc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zmaglineid_0` AS string)), '') AS string) IN ('`','0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zmaglineid_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `mag_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `zclosedet_0` AS `_raw_zclosedet_0`

  , `zclousr_0` AS `_raw_zclousr_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`sorderq` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;

