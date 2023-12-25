

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`barrett__receiving`
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
 AS `_raw_file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiving_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiving_file` AS string)), '') AS string) END as string)
 AS `file_name`
  , `source_file_time` AS `_raw_source_file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`barrett_receiving`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN length(_raw_receive_date) = 7 THEN '0' || _raw_receive_date ELSE _raw_receive_date END as string)
 AS `_sql_receive_date`
FROM layer_0
WHERE 1=1
                     ) , layer_4 AS ( 
                    SELECT
    *
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_sql_receive_date, r'(?i)^[0-9]{1,2}[0-9]{1,2}[0-9]{4}$')


          THEN  parse_timestamp('%m%d%Y', _sql_receive_date)
        END as date)


 AS `receive_date`
FROM layer_1
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
  , `file_time` AS `file_time`
  , `file_name` AS `file_name`
  , `_raw_source_file_time` AS `_raw_source_file_time`
FROM layer_4
WHERE 1=1
                     ) SELECT * FROM final ;

