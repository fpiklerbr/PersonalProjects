

  























































 

SELECT   `updtick_0`,  `invoice_type_code`,  `invoice_id`,  `lig_0`,  `dudlig_0`,  `accnum_0`,  `cpy_0`,  `fcy_0`,  `cur_0`,  `sac_0`,  `business_partner_id`,  `bprtyp_0`,  `bprpay_0`,  `bpapay_0`,  `duddat_0`,  `pam_0`,  `pamtyp_0`,  `dep_0`,  `sns_0`,  `total_amount`,  `amtloc_0`,  `paid_amount`,  `payloc_0`,  `tmpcur_0`,  `tmploc_0`,  `flgfup_0`,  `levfup_0`,  `datfup_0`,  `dptcod_0`,  `flgpaz_0`,  `soi_0`,  `soinum_0`,  `dudsta_0`,  `dinamt_0`,  `ibdamt_0`,  `vat_0`,  `fiy_0`,  `per_0`,  `expsendat_0`,  `sendat_0`,  `senins_0`,  `bprfct_0`,  `fctvcr_0`,  `flgcle_0`,  `payment_date`,  `typdud_0`,  `numdud_0`,  `credat_0`,  `creusr_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `updusr_0`,  `umrnum_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`typ_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`typ_0` AS string)), '') AS string) END as string)
 AS `invoice_type_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num_0` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lig_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lig_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dudlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dudlig_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dudlig_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `accnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcy_0` AS string)), '') AS string) END as string)
 AS `fcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sac_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sac_0` AS string)), '') AS string) END as string)
 AS `sac_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpr_0` AS string)), '') AS string) END as string)
 AS `business_partner_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `bprtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) END as string)
 AS `bprpay_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) END as string)
 AS `bpapay_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`duddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`duddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `duddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pam_0` AS string)), '') AS string) END as string)
 AS `pam_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pamtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pamtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pamtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) END as string)
 AS `dep_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sns_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sns_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sns_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcur_0` AS string)), '') AS string) END as float64)
 AS `total_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtloc_0` AS string)), '') AS string) END as numeric)
 AS `amtloc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paycur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paycur_0` AS string)), '') AS string) END as float64)
 AS `paid_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payloc_0` AS string)), '') AS string) END as numeric)
 AS `payloc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmpcur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmpcur_0` AS string)), '') AS string) END as numeric)
 AS `tmpcur_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmploc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmploc_0` AS string)), '') AS string) END as numeric)
 AS `tmploc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flgfup_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flgfup_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flgfup_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`levfup_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`levfup_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `levfup_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`datfup_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`datfup_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `datfup_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dptcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dptcod_0` AS string)), '') AS string) END as string)
 AS `dptcod_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flgpaz_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flgpaz_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flgpaz_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soi_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soi_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `soi_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soinum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soinum_0` AS string)), '') AS string) END as string)
 AS `soinum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dudsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dudsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dudsta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dinamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dinamt_0` AS string)), '') AS string) END as numeric)
 AS `dinamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ibdamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ibdamt_0` AS string)), '') AS string) END as numeric)
 AS `ibdamt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_0` AS string)), '') AS string) END as string)
 AS `vat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fiy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fiy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fiy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`per_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`per_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `per_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expsendat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expsendat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `expsendat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sendat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sendat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `sendat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senins_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senins_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `senins_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprfct_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprfct_0` AS string)), '') AS string) END as string)
 AS `bprfct_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fctvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fctvcr_0` AS string)), '') AS string) END as string)
 AS `fctvcr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flgcle_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flgcle_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flgcle_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paydat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paydat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `payment_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`typdud_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`typdud_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `typdud_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`numdud_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`numdud_0` AS string)), '') AS string) END as string)
 AS `numdud_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`umrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`umrnum_0` AS string)), '') AS string) END as string)
 AS `umrnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`gaccdudate` AS source_table

 ) AS un_ordered

