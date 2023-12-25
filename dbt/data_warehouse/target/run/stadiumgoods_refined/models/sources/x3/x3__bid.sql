

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__bid`
  OPTIONS()
  as 

  































 

SELECT   `updtick_0`,  `bpatyp_0`,  `bpanum_0`,  `bpaadd_0`,  to_hex(md5(cast(`bidnum_0` as 
    string
))) AS `bidnum_0`,  `bidnumflg_0`,  `bnf_0`,  `pab1_0`,  `pab2_0`,  `pab3_0`,  `pab4_0`,  to_hex(md5(cast(`biccod_0` as 
    string
))) AS `biccod_0`,  `iban_0`,  `cry_0`,  `cur_0`,  `midpab1_0`,  `midpab2_0`,  `midpab3_0`,  `midpab4_0`,  `midbiccod_0`,  `midcry_0`,  `accnonrei_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `rowid`
    , `_raw__synched_from_source_at`
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
 AS `bpatyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpanum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpanum_0` AS string)), '') AS string) END as string)
 AS `bpanum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bidnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bidnum_0` AS string)), '') AS string) END as string)
 AS `bidnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bidnumflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bidnumflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `bidnumflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bnf_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bnf_0` AS string)), '') AS string) END as string)
 AS `bnf_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`biccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`biccod_0` AS string)), '') AS string) END as string)
 AS `biccod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`iban_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`iban_0` AS string)), '') AS string) END as string)
 AS `iban_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) END as string)
 AS `cry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midbiccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midbiccod_0` AS string)), '') AS string) END as string)
 AS `midbiccod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`midcry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`midcry_0` AS string)), '') AS string) END as string)
 AS `midcry_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnonrei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnonrei_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnonrei_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`bid` AS source_table

 ) AS un_ordered

;

