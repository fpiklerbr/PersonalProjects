

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yconsignor`
  OPTIONS()
  as 

  











 

SELECT   `bpsnum_0`,  `bpsnam_0`,  `adrl1_0`,  `adrl2_0`,  `ardl3_0`,  `poscod_0`,  `cty_0`,  `cry_0`,  `eml_0`,  `tel_0`,  `stkcount_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnum_0` AS string)), '') AS string) END as string)
 AS `bpsnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpsnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpsnam_0` AS string)), '') AS string) END as string)
 AS `bpsnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adrl1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adrl1_0` AS string)), '') AS string) END as string)
 AS `adrl1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adrl2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adrl2_0` AS string)), '') AS string) END as string)
 AS `adrl2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ardl3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ardl3_0` AS string)), '') AS string) END as string)
 AS `ardl3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poscod_0` AS string)), '') AS string) END as string)
 AS `poscod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cty_0` AS string)), '') AS string) END as string)
 AS `cty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cry_0` AS string)), '') AS string) END as string)
 AS `cry_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eml_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eml_0` AS string)), '') AS string) END as string)
 AS `eml_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tel_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tel_0` AS string)), '') AS string) END as string)
 AS `tel_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stkcount_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stkcount_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `stkcount_0`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`yconsignor` AS source_table

 ) AS un_ordered

;

