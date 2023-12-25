

  




























































































































































































 

SELECT   `updtick_0`,  `datconn_0`,  `dectime_0`,  `difimp_0`,  `enaflg_0`,  `fax_0`,  `bprnum_0`,  `nbrcon_0`,  `user_name`,  `passe_0`,  `passdat_0`,  `telep_0`,  `timconn_0`,  `user_id`,  `chef_0`,  `chef_1`,  `chef_2`,  `chef_3`,  `chef_4`,  `chef_5`,  `chef_6`,  `chef_7`,  `chef_8`,  `chef_9`,  `chef_10`,  `chef_11`,  `chef_12`,  `chef_13`,  `chef_14`,  `chef_15`,  `chef_16`,  `chef_17`,  `chef_18`,  `chef_19`,  `codmet_0`,  `prfmen_0`,  `prffct_0`,  `addeml_0`,  `login_0`,  `usrbi_0`,  `nbfnc_0`,  `fnccod_0`,  `fnccod_1`,  `fnccod_2`,  `fnccod_3`,  `fnccod_4`,  `fnccod_5`,  `fnccod_6`,  `fnccod_7`,  `fncpar_0`,  `fncpar_1`,  `fncpar_2`,  `fncpar_3`,  `fncpar_4`,  `fncpar_5`,  `fncpar_6`,  `fncpar_7`,  `creusr_0`,  `credat_0`,  `upddat_0`,  `updusr_0`,  `allacs_0`,  `usrext_0`,  `chgdat_0`,  `pwdbi_0`,  `repnum_0`,  `cretim_0`,  `usrconnect_0`,  `updtim_0`,  `usrconxtd_0`,  `codadrdft_0`,  `codribdft_0`,  `prtdef_0`,  `prtdef_1`,  `prtdef_2`,  `prtdef_3`,  `prtdef_4`,  `prtdef_5`,  `prtdef_6`,  `prtdef_7`,  `prtdef_8`,  `prtdef_9`,  `acsusr_0`,  `newpas_0`,  `bpaadd_0`,  `bidnum_0`,  `rpcrep_0`,  `usrprt_0`,  `tit_0`,  `addnam_0`,  `prfxtd_0`,  `arcprf_0`,  `fnc_0`,  `flgpasprv_0`,  `credattim_0`,  `sta_0`,  `upddattim_0`,  `auuid_0`,  `withoutldap_0`,  `msnstr_0`,  `msnend_0`,  `mna_0`,  `kilrat_0`,  `cur_0`,  `fultim_0`,  `nbday_0`,  `ausday_0`,  `ausday_1`,  `ausday_2`,  `ausday_3`,  `ausday_4`,  `ausday_5`,  `ausday_6`,  `arvhou_0`,  `arvhou_1`,  `arvhou_2`,  `arvhou_3`,  `arvhou_4`,  `arvhou_5`,  `arvhou_6`,  `dpehou_0`,  `dpehou_1`,  `dpehou_2`,  `dpehou_3`,  `dpehou_4`,  `dpehou_5`,  `dpehou_6`,  `escstrdat_0`,  `nbresc_0`,  `hdkrep_0`,  `auzdscdem_0`,  `acccod_0`,  `cce_0`,  `cce_1`,  `cce_2`,  `cce_3`,  `cce_4`,  `cce_5`,  `cce_6`,  `cce_7`,  `cce_8`,  `cce_9`,  `cce_10`,  `cce_11`,  `cce_12`,  `cce_13`,  `cce_14`,  `cce_15`,  `cce_16`,  `cce_17`,  `cce_18`,  `cce_19`,  `die_0`,  `die_1`,  `die_2`,  `die_3`,  `die_4`,  `die_5`,  `die_6`,  `die_7`,  `die_8`,  `die_9`,  `die_10`,  `die_11`,  `die_12`,  `die_13`,  `die_14`,  `die_15`,  `die_16`,  `die_17`,  `die_18`,  `die_19`,  `wrh_0`,  `rowid`
    , `_raw_zinterste_0`
    , `_raw_zcomperaut_0`
    , `_raw_zsprcupd_0`
    , `_raw_zfulfillusr_0`
    , `_raw_zfcyuser_0`
    , `_raw_zfundesall_0`
    , `_raw_zthrperval_0`
    , `_raw_zpthcleaut_0`
    , `_raw_zsrtn_0`
    , `_raw_zcrtn_0`
    , `_raw_zgmaintaut_0`
    , `_raw_zsotpth_0`
    , `_raw_zsotprh_0`
    , `_raw_zsoclsaut_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`datconn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`datconn_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `datconn_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dectime_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dectime_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dectime_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`difimp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`difimp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `difimp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`enaflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enaflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `enaflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fax_0` AS string)), '') AS string) END as string)
 AS `fax_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprnum_0` AS string)), '') AS string) END as string)
 AS `bprnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nbrcon_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nbrcon_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nbrcon_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nomusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nomusr_0` AS string)), '') AS string) END as string)
 AS `user_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`passe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`passe_0` AS string)), '') AS string) END as string)
 AS `passe_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`passdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`passdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `passdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`telep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`telep_0` AS string)), '') AS string) END as string)
 AS `telep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`timconn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`timconn_0` AS string)), '') AS string) END as string)
 AS `timconn_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usr_0` AS string)), '') AS string) END as string)
 AS `user_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_0` AS string)), '') AS string) END as string)
 AS `chef_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_1` AS string)), '') AS string) END as string)
 AS `chef_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_2` AS string)), '') AS string) END as string)
 AS `chef_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_3` AS string)), '') AS string) END as string)
 AS `chef_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_4` AS string)), '') AS string) END as string)
 AS `chef_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_5` AS string)), '') AS string) END as string)
 AS `chef_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_6` AS string)), '') AS string) END as string)
 AS `chef_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_7` AS string)), '') AS string) END as string)
 AS `chef_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_8` AS string)), '') AS string) END as string)
 AS `chef_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_9` AS string)), '') AS string) END as string)
 AS `chef_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_10` AS string)), '') AS string) END as string)
 AS `chef_10`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_11` AS string)), '') AS string) END as string)
 AS `chef_11`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_12` AS string)), '') AS string) END as string)
 AS `chef_12`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_13` AS string)), '') AS string) END as string)
 AS `chef_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_14` AS string)), '') AS string) END as string)
 AS `chef_14`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_15` AS string)), '') AS string) END as string)
 AS `chef_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_16` AS string)), '') AS string) END as string)
 AS `chef_16`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_17` AS string)), '') AS string) END as string)
 AS `chef_17`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_18` AS string)), '') AS string) END as string)
 AS `chef_18`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chef_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chef_19` AS string)), '') AS string) END as string)
 AS `chef_19`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`codmet_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`codmet_0` AS string)), '') AS string) END as string)
 AS `codmet_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prfmen_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prfmen_0` AS string)), '') AS string) END as string)
 AS `prfmen_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prffct_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prffct_0` AS string)), '') AS string) END as string)
 AS `prffct_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`addeml_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`addeml_0` AS string)), '') AS string) END as string)
 AS `addeml_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`login_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`login_0` AS string)), '') AS string) END as string)
 AS `login_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrbi_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrbi_0` AS string)), '') AS string) END as string)
 AS `usrbi_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nbfnc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nbfnc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nbfnc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_0` AS string)), '') AS string) END as string)
 AS `fnccod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_1` AS string)), '') AS string) END as string)
 AS `fnccod_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_2` AS string)), '') AS string) END as string)
 AS `fnccod_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_3` AS string)), '') AS string) END as string)
 AS `fnccod_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_4` AS string)), '') AS string) END as string)
 AS `fnccod_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_5` AS string)), '') AS string) END as string)
 AS `fnccod_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_6` AS string)), '') AS string) END as string)
 AS `fnccod_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnccod_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnccod_7` AS string)), '') AS string) END as string)
 AS `fnccod_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_0` AS string)), '') AS string) END as string)
 AS `fncpar_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_1` AS string)), '') AS string) END as string)
 AS `fncpar_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_2` AS string)), '') AS string) END as string)
 AS `fncpar_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_3` AS string)), '') AS string) END as string)
 AS `fncpar_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_4` AS string)), '') AS string) END as string)
 AS `fncpar_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_5` AS string)), '') AS string) END as string)
 AS `fncpar_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_6` AS string)), '') AS string) END as string)
 AS `fncpar_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fncpar_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fncpar_7` AS string)), '') AS string) END as string)
 AS `fncpar_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allacs_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allacs_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `allacs_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrext_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrext_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `usrext_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chgdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chgdat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chgdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pwdbi_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pwdbi_0` AS string)), '') AS string) END as string)
 AS `pwdbi_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`repnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`repnum_0` AS string)), '') AS string) END as string)
 AS `repnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cretim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cretim_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cretim_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrconnect_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrconnect_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `usrconnect_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtim_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtim_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrconxtd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrconxtd_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `usrconxtd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`codadrdft_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`codadrdft_0` AS string)), '') AS string) END as string)
 AS `codadrdft_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`codribdft_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`codribdft_0` AS string)), '') AS string) END as string)
 AS `codribdft_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_0` AS string)), '') AS string) END as string)
 AS `prtdef_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_1` AS string)), '') AS string) END as string)
 AS `prtdef_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_2` AS string)), '') AS string) END as string)
 AS `prtdef_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_3` AS string)), '') AS string) END as string)
 AS `prtdef_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_4` AS string)), '') AS string) END as string)
 AS `prtdef_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_5` AS string)), '') AS string) END as string)
 AS `prtdef_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_6` AS string)), '') AS string) END as string)
 AS `prtdef_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_7` AS string)), '') AS string) END as string)
 AS `prtdef_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_8` AS string)), '') AS string) END as string)
 AS `prtdef_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prtdef_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prtdef_9` AS string)), '') AS string) END as string)
 AS `prtdef_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acsusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acsusr_0` AS string)), '') AS string) END as string)
 AS `acsusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`newpas_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`newpas_0` AS string)), '') AS string) END as string)
 AS `newpas_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bidnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bidnum_0` AS string)), '') AS string) END as string)
 AS `bidnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rpcrep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rpcrep_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `rpcrep_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrprt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrprt_0` AS string)), '') AS string) END as string)
 AS `usrprt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tit_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tit_0` AS string)), '') AS string) END as string)
 AS `tit_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`addnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`addnam_0` AS string)), '') AS string) END as string)
 AS `addnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prfxtd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prfxtd_0` AS string)), '') AS string) END as string)
 AS `prfxtd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arcprf_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arcprf_0` AS string)), '') AS string) END as string)
 AS `arcprf_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fnc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fnc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fnc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flgpasprv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flgpasprv_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flgpasprv_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credattim_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sta_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`withoutldap_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`withoutldap_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `withoutldap_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`msnstr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`msnstr_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `msnstr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`msnend_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`msnend_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `msnend_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mna_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mna_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `mna_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`kilrat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`kilrat_0` AS string)), '') AS string) END as numeric)
 AS `kilrat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fultim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fultim_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fultim_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nbday_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nbday_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nbday_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ausday_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ausday_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ausday_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ausday_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ausday_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `ausday_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ausday_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ausday_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `ausday_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ausday_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ausday_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `ausday_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ausday_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ausday_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `ausday_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ausday_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ausday_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `ausday_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ausday_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ausday_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `ausday_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvhou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvhou_0` AS string)), '') AS string) END as string)
 AS `arvhou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvhou_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvhou_1` AS string)), '') AS string) END as string)
 AS `arvhou_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvhou_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvhou_2` AS string)), '') AS string) END as string)
 AS `arvhou_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvhou_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvhou_3` AS string)), '') AS string) END as string)
 AS `arvhou_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvhou_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvhou_4` AS string)), '') AS string) END as string)
 AS `arvhou_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvhou_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvhou_5` AS string)), '') AS string) END as string)
 AS `arvhou_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arvhou_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arvhou_6` AS string)), '') AS string) END as string)
 AS `arvhou_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpehou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpehou_0` AS string)), '') AS string) END as string)
 AS `dpehou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpehou_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpehou_1` AS string)), '') AS string) END as string)
 AS `dpehou_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpehou_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpehou_2` AS string)), '') AS string) END as string)
 AS `dpehou_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpehou_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpehou_3` AS string)), '') AS string) END as string)
 AS `dpehou_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpehou_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpehou_4` AS string)), '') AS string) END as string)
 AS `dpehou_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpehou_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpehou_5` AS string)), '') AS string) END as string)
 AS `dpehou_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dpehou_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dpehou_6` AS string)), '') AS string) END as string)
 AS `dpehou_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`escstrdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`escstrdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `escstrdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nbresc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nbresc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nbresc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hdkrep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hdkrep_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `hdkrep_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auzdscdem_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auzdscdem_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `auzdscdem_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acccod_0` AS string)), '') AS string) END as string)
 AS `acccod_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) END as string)
 AS `wrh_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `zinterste_0` AS `_raw_zinterste_0`

  , `zcomperaut_0` AS `_raw_zcomperaut_0`

  , `zsprcupd_0` AS `_raw_zsprcupd_0`

  , `zfulfillusr_0` AS `_raw_zfulfillusr_0`

  , `zfcyuser_0` AS `_raw_zfcyuser_0`

  , `zfundesall_0` AS `_raw_zfundesall_0`

  , `zthrperval_0` AS `_raw_zthrperval_0`

  , `zpthcleaut_0` AS `_raw_zpthcleaut_0`

  , `zsrtn_0` AS `_raw_zsrtn_0`

  , `zcrtn_0` AS `_raw_zcrtn_0`

  , `zgmaintaut_0` AS `_raw_zgmaintaut_0`

  , `zsotpth_0` AS `_raw_zsotpth_0`

  , `zsotprh_0` AS `_raw_zsotprh_0`

  , `zsoclsaut_0` AS `_raw_zsoclsaut_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`autilis` AS source_table

 ) AS un_ordered

