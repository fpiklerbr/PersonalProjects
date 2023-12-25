

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sg_finance__forecasts`
  OPTIONS()
  as 















 

SELECT   `year`,  `month`,  `channel`,  `gtv`,  `gmv`,  `net_sales`,  `revenue`,  `cost_of_rev_inc_promo_`,  `promo`,  `gross_profit`,  `demand_generation`,  `order_contribution`,  `file_name`,  `file_time`,  `financial_reporting_unit`,  `forecast_month`
  FROM ( 

SELECT
    *

  , CASE channel
WHEN 'Private Client' THEN cast( 'PC' AS string)
WHEN 'SoHo Store' THEN cast( 'Store - SoHo' AS string)
WHEN 'Tmall' THEN cast( 'Tmall' AS string)
WHEN 'Chicago Store' THEN cast( 'Store - Chi' AS string)
WHEN 'Online' THEN cast( 'DTC (ex PC)' AS string)
WHEN 'Farfetch' THEN cast( 'Farfetch' AS string)
WHEN 'A/O Omni' THEN cast( 'Omnichannel (ex FF, Tmall)' AS string)
ELSE cast(channel AS string)
END AS `financial_reporting_unit` 
FROM ( 

SELECT
    *

  , 
    safe_cast(year || '-' || month || '-01' as date)
 AS `forecast_month` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`year` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`year` AS string)), '') AS string) END as string)
 AS `year`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`month` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`month` AS string)), '') AS string) END as string)
 AS `month`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gtv` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gtv` AS string)), '') AS string) END as float64)
 AS `gtv`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gmv` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gmv` AS string)), '') AS string) END as float64)
 AS `gmv`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_sales` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_sales` AS string)), '') AS string) END as float64)
 AS `net_sales`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`revenue` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`revenue` AS string)), '') AS string) END as float64)
 AS `revenue`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_of_rev_inc_promo_` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_of_rev_inc_promo_` AS string)), '') AS string) END as float64)
 AS `cost_of_rev_inc_promo_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo` AS string)), '') AS string) END as float64)
 AS `promo`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gross_profit` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gross_profit` AS string)), '') AS string) END as float64)
 AS `gross_profit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`demand_generation` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`demand_generation` AS string)), '') AS string) END as float64)
 AS `demand_generation`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_contribution` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_contribution` AS string)), '') AS string) END as float64)
 AS `order_contribution`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`finance_forecasts` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;

