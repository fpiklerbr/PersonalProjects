

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__bpaddress`
  OPTIONS()
  as 


  








































 

SELECT   `updtick_0`,  `address_type_code`,  `address_id`,  `bpaadd_0`,  `bpades_0`,  `bpabid_0`,  `is_default`,  `line_1`,  `line_2`,  `line_3`,  `postcode`,  `city`,  `state`,  `country`,  `crynam_0`,  `phone`,  `tel_1`,  `tel_2`,  `tel_3`,  `tel_4`,  `fax_0`,  `mob_0`,  `web_0`,  `web_1`,  `web_2`,  `web_3`,  `web_4`,  `fcyweb_0`,  `extnum_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `xb_resflg_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `adrval_0`,  `rowid`,  `email`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , 
    safe_cast(lower(nullif(trim(web_0), '')) as string)
 AS `email` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpatyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpatyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `address_type_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpanum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpanum_0` AS string)), '') AS string) END as string)
 AS `address_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpades_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpades_0` AS string)), '') AS string) END as string)
 AS `bpades_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpabid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpabid_0` AS string)), '') AS string) END as string)
 AS `bpabid_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaaddflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaaddflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_default`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaaddlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaaddlig_0` AS string)), '') AS string) END as string)
 AS `line_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaaddlig_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaaddlig_1` AS string)), '') AS string) END as string)
 AS `line_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaaddlig_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaaddlig_2` AS string)), '') AS string) END as string)
 AS `line_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) END as string)
 AS `postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) END as string)
 AS `city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sat_0` AS string)), '') AS string) END as string)
 AS `state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) END as string)
 AS `country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crynam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crynam_0` AS string)), '') AS string) END as string)
 AS `crynam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tel_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tel_0` AS string)), '') AS string) END as string)
 AS `phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tel_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tel_1` AS string)), '') AS string) END as string)
 AS `tel_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tel_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tel_2` AS string)), '') AS string) END as string)
 AS `tel_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tel_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tel_3` AS string)), '') AS string) END as string)
 AS `tel_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tel_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tel_4` AS string)), '') AS string) END as string)
 AS `tel_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fax_0` AS string)), '') AS string) END as string)
 AS `fax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mob_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mob_0` AS string)), '') AS string) END as string)
 AS `mob_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`web_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`web_0` AS string)), '') AS string) END as string)
 AS `web_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`web_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`web_1` AS string)), '') AS string) END as string)
 AS `web_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`web_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`web_2` AS string)), '') AS string) END as string)
 AS `web_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`web_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`web_3` AS string)), '') AS string) END as string)
 AS `web_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`web_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`web_4` AS string)), '') AS string) END as string)
 AS `web_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcyweb_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcyweb_0` AS string)), '') AS string) END as string)
 AS `fcyweb_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extnum_0` AS string)), '') AS string) END as string)
 AS `extnum_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_resflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_resflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `xb_resflg_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adrval_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adrval_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `adrval_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`bpaddress` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;

