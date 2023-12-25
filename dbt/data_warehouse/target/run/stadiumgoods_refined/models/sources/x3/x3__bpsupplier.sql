

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__bpsupplier`
  OPTIONS()
  as 



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) END as string)
 AS `supplier_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnam_0` AS string)), '') AS string) END as string)
 AS `supplier_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpssho_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpssho_0` AS string)), '') AS string) END as string)
 AS `bpssho_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpstyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpstyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `bpstyp_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bsgcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bsgcod_0` AS string)), '') AS string) END as string)
 AS `supplier_category_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprpay_0` AS string)), '') AS string) END as string)
 AS `bprpay_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpapay_0` AS string)), '') AS string) END as string)
 AS `bpapay_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsinv_0` AS string)), '') AS string) END as string)
 AS `bpsinv_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpainv_0` AS string)), '') AS string) END as string)
 AS `bpainv_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsgru_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsgru_0` AS string)), '') AS string) END as string)
 AS `bpsgru_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsrsk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsrsk_0` AS string)), '') AS string) END as string)
 AS `bpsrsk_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcnumbps_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcnumbps_0` AS string)), '') AS string) END as string)
 AS `bpcnumbps_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) END as string)
 AS `bptnum_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cntnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cntnam_0` AS string)), '') AS string) END as string)
 AS `cntnam_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) END as string)
 AS `loc_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`abccls_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`abccls_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `abccls_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uvycod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uvycod_0` AS string)), '') AS string) END as string)
 AS `uvycod_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cur_0` AS string)), '') AS string) END as string)
 AS `cur_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chgtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chgtyp_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pte_0` AS string)), '') AS string) END as string)
 AS `pte_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dep_0` AS string)), '') AS string) END as string)
 AS `dep_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vacbpr_0` AS string)), '') AS string) END as string)
 AS `vacbpr_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mdl_0` AS string)), '') AS string) END as string)
 AS `mdl_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecict_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecict_0` AS string)), '') AS string) END as string)
 AS `eecict_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecloc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `eecloc_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_0` AS string)), '') AS string) END as string)
 AS `tsscod_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_1` AS string)), '') AS string) END as string)
 AS `tsscod_1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_2` AS string)), '') AS string) END as string)
 AS `tsscod_2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_3` AS string)), '') AS string) END as string)
 AS `tsscod_3`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsscod_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsscod_4` AS string)), '') AS string) END as string)
 AS `tsscod_4`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_0` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_1` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_2` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_3` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_3`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_4` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_4`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_5` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_5`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_6` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_6`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_7` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_7`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_8` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_8`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_9` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_9`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_10` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_10`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_11` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_11`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_12` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_12`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_13` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_13`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_14` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_14`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_15` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_15`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_16` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_16`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_17` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_17`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_18` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_18`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_19` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_19`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_20` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_20`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_21` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_21`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_22` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_22`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_23` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_23`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_24` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_24`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_25` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_25`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_26` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_26`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_27` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_27`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_28` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_28`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdtaamt_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdtaamt_29` AS string)), '') AS string) END as numeric)
 AS `invdtaamt_29`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_1`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_2`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_3`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_4`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_5`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_6`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_7`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_8`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_9` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_9`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_10` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_10`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_11` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_11`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_12` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_12`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_13` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_13`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_14` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_14`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_15` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_15`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_16` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_16`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_17` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_17`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_18` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_18`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_19` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_19`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_20` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_20`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_21` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_21`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_22` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_22`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_23` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_23`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_24` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_24`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_25` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_25`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_26` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_26`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_27` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_27`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_28` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_28`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invdta_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invdta_29` AS string)), '') AS string) END as float64)
 as int64)
 AS `invdta_29`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_1`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_2`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_3`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_4`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_5`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_6`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_7`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_8`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_9` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_9`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_10` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_10`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_11` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_11`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_12` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_12`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_13` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_13`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_14` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_14`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_15` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_15`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_16` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_16`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_17` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_17`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_18` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_18`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_19` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_19`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_20` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_20`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_21` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_21`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_22` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_22`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_23` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_23`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_24` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_24`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_25` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_25`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_26` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_26`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_27` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_27`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_28` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_28`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtcod_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtcod_29` AS string)), '') AS string) END as float64)
 as int64)
 AS `amtcod_29`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`plistc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`plistc_0` AS string)), '') AS string) END as string)
 AS `plistc_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payban_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payban_0` AS string)), '') AS string) END as string)
 AS `payban_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acccod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acccod_0` AS string)), '') AS string) END as string)
 AS `acccod_0`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sevlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sevlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sevlin_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordtex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordtex_0` AS string)), '') AS string) END as string)
 AS `ordtex_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtntex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtntex_0` AS string)), '') AS string) END as string)
 AS `rtntex_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ltimrkcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ltimrkcoe_0` AS string)), '') AS string) END as numeric)
 AS `ltimrkcoe_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`primrkcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`primrkcoe_0` AS string)), '') AS string) END as numeric)
 AS `primrkcoe_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qlymrkcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qlymrkcoe_0` AS string)), '') AS string) END as numeric)
 AS `qlymrkcoe_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtymrkcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtymrkcoe_0` AS string)), '') AS string) END as numeric)
 AS `qtymrkcoe_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rskmrkcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rskmrkcoe_0` AS string)), '') AS string) END as numeric)
 AS `rskmrkcoe_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ltimrk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ltimrk_0` AS string)), '') AS string) END as numeric)
 AS `ltimrk_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`primrk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`primrk_0` AS string)), '') AS string) END as numeric)
 AS `primrk_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qlymrk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qlymrk_0` AS string)), '') AS string) END as numeric)
 AS `qlymrk_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtymrk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtymrk_0` AS string)), '') AS string) END as numeric)
 AS `qtymrk_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rskmrk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rskmrk_0` AS string)), '') AS string) END as numeric)
 AS `rskmrk_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`genmrk_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`genmrk_0` AS string)), '') AS string) END as numeric)
 AS `genmrk_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ordminamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ordminamt_0` AS string)), '') AS string) END as numeric)
 AS `ordminamt_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ostctl_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ostctl_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ostctl_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ostauzamt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ostauzamt_0` AS string)), '') AS string) END as numeric)
 AS `ostauzamt_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecincrat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecincrat_0` AS string)), '') AS string) END as numeric)
 AS `eecincrat_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsrem_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsrem_0` AS string)), '') AS string) END as string)
 AS `bpsrem_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dudclc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dudclc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dudclc_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`curclc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`curclc_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `curclc_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fupflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fupflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `fupflg_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ocnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ocnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ocnflg_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dadflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dadflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dadflg_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prvnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prvnum_0` AS string)), '') AS string) END as string)
 AS `prvnum_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`douflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`douflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `douflg_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`enaflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enaflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `enaflg_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paylokflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paylokflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `paylokflg_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`norprnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`norprnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `norprnflg_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nreprnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nreprnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nreprnflg_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nrtprnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nrtprnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `nrtprnflg_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritcod_0` AS string)), '') AS string) END as string)
 AS `ritcod_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ritnbr_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritrat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritrat_0` AS string)), '') AS string) END as numeric)
 AS `ritrat_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritparnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritparnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ritparnbr_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritparnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritparnam_0` AS string)), '') AS string) END as string)
 AS `ritparnam_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ritparcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ritparcoe_0` AS string)), '') AS string) END as numeric)
 AS `ritparcoe_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cai_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cai_0` AS string)), '') AS string) END as string)
 AS `cai_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`datvlycai_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`datvlycai_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `datvlycai_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`agtpcp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`agtpcp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `agtpcp_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`agtsattax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`agtsattax_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `agtsattax_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sattax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sattax_0` AS string)), '') AS string) END as string)
 AS `sattax_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flgsattax_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flgsattax_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flgsattax_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcnum_0` AS string)), '') AS string) END as string)
 AS `bpcnum_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tpmcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tpmcod_0` AS string)), '') AS string) END as string)
 AS `tpmcod_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dia_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dia_0` AS string)), '') AS string) END as string)
 AS `dia_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`iptexs_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`iptexs_0` AS string)), '') AS string) END as string)
 AS `iptexs_0`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frm1099_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frm1099_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `frm1099_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box1099_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box1099_0` AS string)), '') AS string) END as string)
 AS `box1099_0`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
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

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flg281_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flg281_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `flg281_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purprityp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purprityp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `purprityp_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cshvat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cshvat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cshvat_0`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cshdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cshdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `cshdat_0`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ystadfee_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ystadfee_0` AS string)), '') AS string) END as float64)
 AS `commission_rate`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`
  , `zpaymet_0` AS `_raw_zpaymet_0`
  , `zsrhdattim_0` AS `_raw_zsrhdattim_0`
  , `_synched_from_source_at` AS `_raw__synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`live`.`bpsupplier`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(supplier_id IN ('DC00005117','DC00007445','DB00000007','DB00000006','DB00000003','DCX','DC00052397','DC00015395','DC00053871') as boolean)
 AS `is_key_seller`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    CASE supplier_id
WHEN 'DB00000001' THEN cast( 'Returns Purchase' AS string)
WHEN 'DB00000004' THEN cast( 'Returns Purchase' AS string)
WHEN 'DB00000005' THEN cast( 'SG Apparel' AS string)
WHEN 'DB00000002' THEN cast( 'SG Apparel' AS string)
WHEN 'DB00000003' THEN cast( 'SG Apparel' AS string)
ELSE cast(supplier_id AS string)
END AS `seller_inventory_from_id`
  , 
    CASE supplier_category_code
WHEN 'DBD' THEN cast( 'Wholesale' AS string)
WHEN 'DCN' THEN cast( 'Consignment' AS string)
ELSE cast(supplier_category_code AS string)
END AS `seller_inventory_from_code`
  , 
    CASE supplier_category_code
WHEN 'DBD' THEN cast( 'House Account' AS string)
WHEN 'DCN' THEN cast( 'Consignor' AS string)
ELSE cast(supplier_category_code AS string)
END AS `consignor_type`
  , 
    CASE supplier_category_code
WHEN 'DBD' THEN cast( '1P' AS string)
WHEN 'DCN' THEN cast( '3P' AS string)
ELSE cast(supplier_category_code AS string)
END AS `seller_relationship_from_code`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `updtick_0` AS `updtick_0`
  , `supplier_id` AS `supplier_id`
  , `is_key_seller` AS `is_key_seller`
  , `supplier_name` AS `supplier_name`
  , `bpssho_0` AS `bpssho_0`
  , `bpstyp_0` AS `bpstyp_0`
  , `supplier_category_code` AS `supplier_category_code`
  , `seller_inventory_from_id` AS `seller_inventory_from_id`
  , `seller_inventory_from_code` AS `seller_inventory_from_code`
  , `consignor_type` AS `consignor_type`
  , `seller_relationship_from_code` AS `seller_relationship_from_code`
  , `bprpay_0` AS `bprpay_0`
  , `bpapay_0` AS `bpapay_0`
  , `bpsinv_0` AS `bpsinv_0`
  , `bpainv_0` AS `bpainv_0`
  , `bpsgru_0` AS `bpsgru_0`
  , `bpsrsk_0` AS `bpsrsk_0`
  , `bpcnumbps_0` AS `bpcnumbps_0`
  , `bptnum_0` AS `bptnum_0`
  , `cntnam_0` AS `cntnam_0`
  , `loc_0` AS `loc_0`
  , `abccls_0` AS `abccls_0`
  , `uvycod_0` AS `uvycod_0`
  , `cur_0` AS `cur_0`
  , `chgtyp_0` AS `chgtyp_0`
  , `pte_0` AS `pte_0`
  , `dep_0` AS `dep_0`
  , `vacbpr_0` AS `vacbpr_0`
  , `mdl_0` AS `mdl_0`
  , `eecict_0` AS `eecict_0`
  , `eecloc_0` AS `eecloc_0`
  , `tsscod_0` AS `tsscod_0`
  , `tsscod_1` AS `tsscod_1`
  , `tsscod_2` AS `tsscod_2`
  , `tsscod_3` AS `tsscod_3`
  , `tsscod_4` AS `tsscod_4`
  , `invdtaamt_0` AS `invdtaamt_0`
  , `invdtaamt_1` AS `invdtaamt_1`
  , `invdtaamt_2` AS `invdtaamt_2`
  , `invdtaamt_3` AS `invdtaamt_3`
  , `invdtaamt_4` AS `invdtaamt_4`
  , `invdtaamt_5` AS `invdtaamt_5`
  , `invdtaamt_6` AS `invdtaamt_6`
  , `invdtaamt_7` AS `invdtaamt_7`
  , `invdtaamt_8` AS `invdtaamt_8`
  , `invdtaamt_9` AS `invdtaamt_9`
  , `invdtaamt_10` AS `invdtaamt_10`
  , `invdtaamt_11` AS `invdtaamt_11`
  , `invdtaamt_12` AS `invdtaamt_12`
  , `invdtaamt_13` AS `invdtaamt_13`
  , `invdtaamt_14` AS `invdtaamt_14`
  , `invdtaamt_15` AS `invdtaamt_15`
  , `invdtaamt_16` AS `invdtaamt_16`
  , `invdtaamt_17` AS `invdtaamt_17`
  , `invdtaamt_18` AS `invdtaamt_18`
  , `invdtaamt_19` AS `invdtaamt_19`
  , `invdtaamt_20` AS `invdtaamt_20`
  , `invdtaamt_21` AS `invdtaamt_21`
  , `invdtaamt_22` AS `invdtaamt_22`
  , `invdtaamt_23` AS `invdtaamt_23`
  , `invdtaamt_24` AS `invdtaamt_24`
  , `invdtaamt_25` AS `invdtaamt_25`
  , `invdtaamt_26` AS `invdtaamt_26`
  , `invdtaamt_27` AS `invdtaamt_27`
  , `invdtaamt_28` AS `invdtaamt_28`
  , `invdtaamt_29` AS `invdtaamt_29`
  , `invdta_0` AS `invdta_0`
  , `invdta_1` AS `invdta_1`
  , `invdta_2` AS `invdta_2`
  , `invdta_3` AS `invdta_3`
  , `invdta_4` AS `invdta_4`
  , `invdta_5` AS `invdta_5`
  , `invdta_6` AS `invdta_6`
  , `invdta_7` AS `invdta_7`
  , `invdta_8` AS `invdta_8`
  , `invdta_9` AS `invdta_9`
  , `invdta_10` AS `invdta_10`
  , `invdta_11` AS `invdta_11`
  , `invdta_12` AS `invdta_12`
  , `invdta_13` AS `invdta_13`
  , `invdta_14` AS `invdta_14`
  , `invdta_15` AS `invdta_15`
  , `invdta_16` AS `invdta_16`
  , `invdta_17` AS `invdta_17`
  , `invdta_18` AS `invdta_18`
  , `invdta_19` AS `invdta_19`
  , `invdta_20` AS `invdta_20`
  , `invdta_21` AS `invdta_21`
  , `invdta_22` AS `invdta_22`
  , `invdta_23` AS `invdta_23`
  , `invdta_24` AS `invdta_24`
  , `invdta_25` AS `invdta_25`
  , `invdta_26` AS `invdta_26`
  , `invdta_27` AS `invdta_27`
  , `invdta_28` AS `invdta_28`
  , `invdta_29` AS `invdta_29`
  , `amtcod_0` AS `amtcod_0`
  , `amtcod_1` AS `amtcod_1`
  , `amtcod_2` AS `amtcod_2`
  , `amtcod_3` AS `amtcod_3`
  , `amtcod_4` AS `amtcod_4`
  , `amtcod_5` AS `amtcod_5`
  , `amtcod_6` AS `amtcod_6`
  , `amtcod_7` AS `amtcod_7`
  , `amtcod_8` AS `amtcod_8`
  , `amtcod_9` AS `amtcod_9`
  , `amtcod_10` AS `amtcod_10`
  , `amtcod_11` AS `amtcod_11`
  , `amtcod_12` AS `amtcod_12`
  , `amtcod_13` AS `amtcod_13`
  , `amtcod_14` AS `amtcod_14`
  , `amtcod_15` AS `amtcod_15`
  , `amtcod_16` AS `amtcod_16`
  , `amtcod_17` AS `amtcod_17`
  , `amtcod_18` AS `amtcod_18`
  , `amtcod_19` AS `amtcod_19`
  , `amtcod_20` AS `amtcod_20`
  , `amtcod_21` AS `amtcod_21`
  , `amtcod_22` AS `amtcod_22`
  , `amtcod_23` AS `amtcod_23`
  , `amtcod_24` AS `amtcod_24`
  , `amtcod_25` AS `amtcod_25`
  , `amtcod_26` AS `amtcod_26`
  , `amtcod_27` AS `amtcod_27`
  , `amtcod_28` AS `amtcod_28`
  , `amtcod_29` AS `amtcod_29`
  , `plistc_0` AS `plistc_0`
  , `payban_0` AS `payban_0`
  , `acccod_0` AS `acccod_0`
  , `die_0` AS `die_0`
  , `die_1` AS `die_1`
  , `die_2` AS `die_2`
  , `die_3` AS `die_3`
  , `die_4` AS `die_4`
  , `die_5` AS `die_5`
  , `die_6` AS `die_6`
  , `die_7` AS `die_7`
  , `die_8` AS `die_8`
  , `die_9` AS `die_9`
  , `die_10` AS `die_10`
  , `die_11` AS `die_11`
  , `die_12` AS `die_12`
  , `die_13` AS `die_13`
  , `die_14` AS `die_14`
  , `die_15` AS `die_15`
  , `die_16` AS `die_16`
  , `die_17` AS `die_17`
  , `die_18` AS `die_18`
  , `die_19` AS `die_19`
  , `cce_0` AS `cce_0`
  , `cce_1` AS `cce_1`
  , `cce_2` AS `cce_2`
  , `cce_3` AS `cce_3`
  , `cce_4` AS `cce_4`
  , `cce_5` AS `cce_5`
  , `cce_6` AS `cce_6`
  , `cce_7` AS `cce_7`
  , `cce_8` AS `cce_8`
  , `cce_9` AS `cce_9`
  , `cce_10` AS `cce_10`
  , `cce_11` AS `cce_11`
  , `cce_12` AS `cce_12`
  , `cce_13` AS `cce_13`
  , `cce_14` AS `cce_14`
  , `cce_15` AS `cce_15`
  , `cce_16` AS `cce_16`
  , `cce_17` AS `cce_17`
  , `cce_18` AS `cce_18`
  , `cce_19` AS `cce_19`
  , `bpaadd_0` AS `bpaadd_0`
  , `sevlin_0` AS `sevlin_0`
  , `ordtex_0` AS `ordtex_0`
  , `rtntex_0` AS `rtntex_0`
  , `ltimrkcoe_0` AS `ltimrkcoe_0`
  , `primrkcoe_0` AS `primrkcoe_0`
  , `qlymrkcoe_0` AS `qlymrkcoe_0`
  , `qtymrkcoe_0` AS `qtymrkcoe_0`
  , `rskmrkcoe_0` AS `rskmrkcoe_0`
  , `ltimrk_0` AS `ltimrk_0`
  , `primrk_0` AS `primrk_0`
  , `qlymrk_0` AS `qlymrk_0`
  , `qtymrk_0` AS `qtymrk_0`
  , `rskmrk_0` AS `rskmrk_0`
  , `genmrk_0` AS `genmrk_0`
  , `ordminamt_0` AS `ordminamt_0`
  , `ostctl_0` AS `ostctl_0`
  , `ostauzamt_0` AS `ostauzamt_0`
  , `eecincrat_0` AS `eecincrat_0`
  , `bpsrem_0` AS `bpsrem_0`
  , `dudclc_0` AS `dudclc_0`
  , `curclc_0` AS `curclc_0`
  , `fupflg_0` AS `fupflg_0`
  , `ocnflg_0` AS `ocnflg_0`
  , `dadflg_0` AS `dadflg_0`
  , `prvnum_0` AS `prvnum_0`
  , `douflg_0` AS `douflg_0`
  , `enaflg_0` AS `enaflg_0`
  , `paylokflg_0` AS `paylokflg_0`
  , `norprnflg_0` AS `norprnflg_0`
  , `nreprnflg_0` AS `nreprnflg_0`
  , `nrtprnflg_0` AS `nrtprnflg_0`
  , `ritcod_0` AS `ritcod_0`
  , `ritnbr_0` AS `ritnbr_0`
  , `ritrat_0` AS `ritrat_0`
  , `ritparnbr_0` AS `ritparnbr_0`
  , `ritparnam_0` AS `ritparnam_0`
  , `ritparcoe_0` AS `ritparcoe_0`
  , `cai_0` AS `cai_0`
  , `datvlycai_0` AS `datvlycai_0`
  , `agtpcp_0` AS `agtpcp_0`
  , `agtsattax_0` AS `agtsattax_0`
  , `sattax_0` AS `sattax_0`
  , `flgsattax_0` AS `flgsattax_0`
  , `bpcnum_0` AS `bpcnum_0`
  , `tpmcod_0` AS `tpmcod_0`
  , `dia_0` AS `dia_0`
  , `iptexs_0` AS `iptexs_0`
  , `expnum_0` AS `expnum_0`
  , `creusr_0` AS `creusr_0`
  , `credat_0` AS `credat_0`
  , `updusr_0` AS `updusr_0`
  , `upddat_0` AS `upddat_0`
  , `mattol_0` AS `mattol_0`
  , `frm1099_0` AS `frm1099_0`
  , `box1099_0` AS `box1099_0`
  , `created_at` AS `created_at`
  , `upddattim_0` AS `upddattim_0`
  , `auuid_0` AS `auuid_0`
  , `flg281_0` AS `flg281_0`
  , `purprityp_0` AS `purprityp_0`
  , `cshvat_0` AS `cshvat_0`
  , `cshdat_0` AS `cshdat_0`
  , `commission_rate` AS `commission_rate`
  , `rowid` AS `rowid`
  , `_raw_zpaymet_0` AS `_raw_zpaymet_0`
  , `_raw_zsrhdattim_0` AS `_raw_zsrhdattim_0`
  , `_raw__synched_from_source_at` AS `_raw__synched_from_source_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

