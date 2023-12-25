

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sreturnd`
  OPTIONS()
  as 

  

















































 

SELECT   `updtick_0`,  `return_id`,  `return_line`,  `cpy_0`,  `itmref_0`,  `itmdes1_0`,  `itmdes_0`,  `delivery_id`,  `delivery_line`,  `dlvqty_0`,  `extqty_0`,  `extqtystu_0`,  `qty_0`,  `qtystu_0`,  `sau_0`,  `stu_0`,  `saustucoe_0`,  `netpri_0`,  `netprinot_0`,  `netpriati_0`,  `cur_0`,  `rtnren_0`,  `rtndat_0`,  `rtnstoupd_0`,  `rtninvupd_0`,  `rtncnoflg_0`,  `ordupd_0`,  `sihnum_0`,  `sidlin_0`,  `scsnum_0`,  `scslin_0`,  `scsdat_0`,  `stofcy_0`,  `srdtex_0`,  `priord_0`,  `pnhnum_0`,  `pndlin_0`,  `wrh_0`,  `expnum_0`,  `impnumlig_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `created_at`,  `updated_at`,  `auuid_0`,  `srhcat_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srhnum_0` AS string)), '') AS string) END as string)
 AS `return_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srdlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srdlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `return_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) END as string)
 AS `delivery_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvqty_0` AS string)), '') AS string) END as numeric)
 AS `dlvqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extqty_0` AS string)), '') AS string) END as numeric)
 AS `extqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extqtystu_0` AS string)), '') AS string) END as numeric)
 AS `extqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) END as numeric)
 AS `qty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) END as string)
 AS `sau_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) END as string)
 AS `stu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`saustucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`saustucoe_0` AS string)), '') AS string) END as numeric)
 AS `saustucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) END as numeric)
 AS `netpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netprinot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netprinot_0` AS string)), '') AS string) END as numeric)
 AS `netprinot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpriati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpriati_0` AS string)), '') AS string) END as numeric)
 AS `netpriati_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtnren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtnren_0` AS string)), '') AS string) END as string)
 AS `rtnren_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtndat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtndat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `rtndat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtnstoupd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtnstoupd_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `rtnstoupd_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtninvupd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtninvupd_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `rtninvupd_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtncnoflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtncnoflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `rtncnoflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordupd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordupd_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ordupd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sihnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sihnum_0` AS string)), '') AS string) END as string)
 AS `sihnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sidlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sidlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sidlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scsnum_0` AS string)), '') AS string) END as string)
 AS `scsnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scslin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scslin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `scslin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scsdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scsdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `scsdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `stofcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srdtex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srdtex_0` AS string)), '') AS string) END as string)
 AS `srdtex_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`priord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`priord_0` AS string)), '') AS string) END as numeric)
 AS `priord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pnhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pnhnum_0` AS string)), '') AS string) END as string)
 AS `pnhnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pndlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pndlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pndlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) END as string)
 AS `wrh_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`impnumlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`impnumlig_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `impnumlig_0`

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

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) END as string)
 AS `auuid_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srhcat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srhcat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `srhcat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`sreturnd` AS source_table

 ) AS un_ordered

;

