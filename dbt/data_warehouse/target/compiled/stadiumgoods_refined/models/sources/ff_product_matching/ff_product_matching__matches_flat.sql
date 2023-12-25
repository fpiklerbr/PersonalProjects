


 











 

SELECT   `match_date`,  `site1`,  `site1_market`,  `site1_product_id`,  `site1_color`,  `site2`,  `site2_market`,  `site2_product_id`,  `site2_color`,  `match_score`,  `match_type`,  `verified`
  FROM ( 

SELECT
    *

  , 
    safe_cast(UPPER(_raw_site1) as string)
 AS `site1`
  , 
    safe_cast(UPPER(_raw_site1_colour) as string)
 AS `site1_color`
  , 
    safe_cast(UPPER(_raw_site2) as string)
 AS `site2`
  , 
    safe_cast(UPPER(_raw_site2_colour) as string)
 AS `site2_color` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`match_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`match_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `match_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site1` AS string)), '') AS string) END as string)
 AS `_raw_site1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site1_market` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site1_market` AS string)), '') AS string) END as string)
 AS `site1_market`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site1_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site1_product_id` AS string)), '') AS string) END as string)
 AS `site1_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site1_colour` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site1_colour` AS string)), '') AS string) END as string)
 AS `_raw_site1_colour`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site2` AS string)), '') AS string) END as string)
 AS `_raw_site2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site2_market` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site2_market` AS string)), '') AS string) END as string)
 AS `site2_market`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site2_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site2_product_id` AS string)), '') AS string) END as string)
 AS `site2_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site2_colour` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site2_colour` AS string)), '') AS string) END as string)
 AS `_raw_site2_colour`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`match_score` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`match_score` AS string)), '') AS string) END as float64)
 AS `match_score`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`match_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`match_type` AS string)), '') AS string) END as float64)
 as int64)
 AS `match_type`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`verified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`verified` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`verified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`verified` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `verified`



FROM `pm-matching-production`.`live_product_matching`.`matches_flat` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

