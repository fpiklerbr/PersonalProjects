




    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date` AS string)), '') AS string) END as string)
 AS `date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference` AS string)), '') AS string) END as string)
 AS `reference`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`client` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`client` AS string)), '') AS string) END as string)
 AS `client`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`memo` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`memo` AS string)), '') AS string) END as string)
 AS `memo`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_rate` AS string)), '') AS string) END as string)
 AS `billing_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as string)
 AS `amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance` AS string)), '') AS string) END as string)
 AS `balance`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comments` AS string)), '') AS string) END as string)
 AS `comments`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_9` AS string)), '') AS string) END as string)
 AS `unnamed_9`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_10` AS string)), '') AS string) END as string)
 AS `unnamed_10`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_11` AS string)), '') AS string) END as string)
 AS `unnamed_11`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_12` AS string)), '') AS string) END as string)
 AS `unnamed_12`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_vas`

WHERE 1=1
AND file_name NOT IN ('ZD Transaction History - 10_31_20 FOR ZD (1).xlsx', 'ZF Transaction History - 2.29.20 FOR ZF (2).xlsx', 'ZI Transaction History - 2.29.20 FOR ZI (2).xlsx', 'ZJ Transaction History - 2.29.20 FOR ZJ (2).xlsx', 'ZN Transaction History - 2.29.20 FOR ZN (2).xlsx')
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(left(file_name, 2) as string)
 AS `cap_client_center`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `type` AS `type`
  , `date` AS `date`
  , `reference` AS `reference`
  , `client` AS `client`
  , `memo` AS `memo`
  , `billing_rate` AS `billing_rate`
  , `amount` AS `amount`
  , `balance` AS `balance`
  , `comments` AS `comments`
  , `unnamed_9` AS `unnamed_9`
  , `unnamed_10` AS `unnamed_10`
  , `unnamed_11` AS `unnamed_11`
  , `unnamed_12` AS `unnamed_12`
  , `file_name` AS `file_name`
  , `sheet_name` AS `sheet_name`
  , `file_time` AS `file_time`
  , `cap_client_center` AS `cap_client_center`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 