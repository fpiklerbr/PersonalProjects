

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`chw__receiving`
  OPTIONS()
  as 



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_po_number` AS string)), '') AS string) END as string)
 AS `capacity_po_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receive_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receive_date` AS string)), '') AS string) END as string)
 AS `_raw_receive_date`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `line_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `label_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity_ordered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity_ordered` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity_ordered`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`chw_receiving`

WHERE 1=1
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    CASE _raw_receive_date
WHEN '20210603' THEN cast( '06032021' AS string)
WHEN '20210406' THEN cast( '04062021' AS string)
ELSE cast(_raw_receive_date AS string)
END AS `_macro_receive_date_exceptions`
FROM layer_0
WHERE 1=1
                     ) , layer_4 AS ( 
                    SELECT
    *
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_macro_receive_date_exceptions, r'(?i)^[0-9]{1,2}[0-9]{1,2}[0-9]{4}$')


          THEN  parse_timestamp('%m%d%Y', _macro_receive_date_exceptions)
        END as date)


 AS `receive_date`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `po_number` AS `po_number`
  , `capacity_po_number` AS `capacity_po_number`
  , `receive_date` AS `receive_date`
  , `line_number` AS `line_number`
  , `label_number` AS `label_number`
  , `quantity` AS `quantity`
  , `quantity_ordered` AS `quantity_ordered`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
FROM layer_4
WHERE 1=1
                     ) SELECT * FROM final ;

