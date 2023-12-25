


 

























 

SELECT   `pick_up_date`,  `tracking_number`,  `pieces`,  `weight`,  `service`,  `format`,  `ref`,  `shipping_company`,  `ref_1`,  `ref_2`,  `ref_3`,  `shipper_location`,  `shipper_country`,  `recipient_location`,  `recipient_country`,  `zone`,  `ship_cost_shipping`,  `ship_cost_fuel_surcharge`,  `extra_charges`,  `extra_charges_breakdown`,  `total_net_price`,  `total_cost`,  `vat`,  `file_name`,  `file_time`,  `invoice_date`,  `zone_new`,  `declared_value`
  FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS date) AS `invoice_date` 
FROM ( 

SELECT
    *

  , 
    safe_cast(trim(replace(replace(total_net_price,'$', ''), ',', '')) as float64)
 AS `total_cost` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`pick_up_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pick_up_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%d/%m/%Y', CASE WHEN cast(nullif(trim(cast(`pick_up_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pick_up_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `pick_up_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_nbr` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_nbr` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pieces` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pieces` AS string)), '') AS string) END as string)
 AS `pieces`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight` AS string)), '') AS string) END as string)
 AS `weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service` AS string)), '') AS string) END as string)
 AS `service`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`format` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`format` AS string)), '') AS string) END as string)
 AS `format`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ref` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ref` AS string)), '') AS string) END as string)
 AS `ref`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_company` AS string)), '') AS string) END as string)
 AS `shipping_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ref_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ref_1` AS string)), '') AS string) END as string)
 AS `ref_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ref_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ref_2` AS string)), '') AS string) END as string)
 AS `ref_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ref_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ref_3` AS string)), '') AS string) END as string)
 AS `ref_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_location` AS string)), '') AS string) END as string)
 AS `shipper_location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_country` AS string)), '') AS string) END as string)
 AS `shipper_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_location` AS string)), '') AS string) END as string)
 AS `recipient_location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_country` AS string)), '') AS string) END as string)
 AS `recipient_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zone` AS string)), '') AS string) END as string)
 AS `zone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `ship_cost_shipping`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fuel_surcharge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fuel_surcharge` AS string)), '') AS string) END as float64)
 AS `ship_cost_fuel_surcharge`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extra_charges` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extra_charges` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `extra_charges`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extra_charges_breakdown` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extra_charges_breakdown` AS string)), '') AS string) END as string)
 AS `extra_charges_breakdown`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_net_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_net_price` AS string)), '') AS string) END as string)
 AS `total_net_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat` AS string)), '') AS string) END as string)
 AS `vat`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zone_new` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zone_new` AS string)), '') AS string) END as string)
 AS `zone_new`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`declared_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`declared_value` AS string)), '') AS string) END as string)
 AS `declared_value`



FROM `ff-stadiumgoods-raw-live`.`imports`.`fedex_p2p_rates` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

