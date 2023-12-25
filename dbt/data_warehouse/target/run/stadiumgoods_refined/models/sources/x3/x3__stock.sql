

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stock`
  OPTIONS()
  as 

  













































 

SELECT   `updtick_0`,  `warehouse`,  `chronological_stock`,  `owner_0`,  `x3_sku`,  `lot_0`,  `slo_0`,  `bpslot_0`,  `palnum_0`,  `ctrnum_0`,  `stock_status`,  `location`,  `loctyp_0`,  `loccat_0`,  `wrh_0`,  `serial_number`,  `rcpdat_0`,  `pcu_0`,  `pcustucoe_0`,  `qtypcu_0`,  `qtystu_0`,  `qtystuact_0`,  `pcuori_0`,  `qtypcuori_0`,  `qtystuori_0`,  `qlyctldem_0`,  `cumallqty_0`,  `cumallqta_0`,  `cumwipqty_0`,  `cumwipqta_0`,  `edtflg_0`,  `lasrcpdat_0`,  `lasissdat_0`,  `lascundat_0`,  `cunlokflg_0`,  `cunlisnum_0`,  `expnum_0`,  `credat_0`,  `creusr_0`,  `upddat_0`,  `updusr_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `warehouse`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stocou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stocou_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chronological_stock`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`owner_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`owner_0` AS string)), '') AS string) END as string)
 AS `owner_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) END as string)
 AS `lot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) END as string)
 AS `slo_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpslot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpslot_0` AS string)), '') AS string) END as string)
 AS `bpslot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`palnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`palnum_0` AS string)), '') AS string) END as string)
 AS `palnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ctrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ctrnum_0` AS string)), '') AS string) END as string)
 AS `ctrnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as string)
 AS `stock_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) END as string)
 AS `location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loctyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loctyp_0` AS string)), '') AS string) END as string)
 AS `loctyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loccat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loccat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `loccat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) END as string)
 AS `wrh_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `rcpdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) END as string)
 AS `pcu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcustucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcustucoe_0` AS string)), '') AS string) END as numeric)
 AS `pcustucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtypcu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtypcu_0` AS string)), '') AS string) END as numeric)
 AS `qtypcu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystuact_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystuact_0` AS string)), '') AS string) END as numeric)
 AS `qtystuact_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcuori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcuori_0` AS string)), '') AS string) END as string)
 AS `pcuori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtypcuori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtypcuori_0` AS string)), '') AS string) END as numeric)
 AS `qtypcuori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystuori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystuori_0` AS string)), '') AS string) END as numeric)
 AS `qtystuori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qlyctldem_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qlyctldem_0` AS string)), '') AS string) END as string)
 AS `qlyctldem_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cumallqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cumallqty_0` AS string)), '') AS string) END as numeric)
 AS `cumallqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cumallqta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cumallqta_0` AS string)), '') AS string) END as numeric)
 AS `cumallqta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cumwipqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cumwipqty_0` AS string)), '') AS string) END as numeric)
 AS `cumwipqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cumwipqta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cumwipqta_0` AS string)), '') AS string) END as numeric)
 AS `cumwipqta_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`edtflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`edtflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `edtflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasrcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasrcpdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lasrcpdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lasissdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lasissdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lasissdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lascundat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lascundat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lascundat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cunlokflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cunlokflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cunlokflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cunlisnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cunlisnum_0` AS string)), '') AS string) END as string)
 AS `cunlisnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`stock` AS source_table

 ) AS un_ordered

;

