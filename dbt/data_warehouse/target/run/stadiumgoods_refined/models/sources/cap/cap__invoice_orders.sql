

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_orders`
  OPTIONS()
  as 




    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as string)
 AS `warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) END as string)
 AS `sales_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`business_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`business_name` AS string)), '') AS string) END as string)
 AS `business_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) END as string)
 AS `customer_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_total` AS string)), '') AS string) END as string)
 AS `product_total`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num_of_boxes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num_of_boxes` AS string)), '') AS string) END as string)
 AS `num_of_boxes`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) END as string)
 AS `external_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_order_type` AS string)), '') AS string) END as string)
 AS `billing_order_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`assembly_order_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`assembly_order_count` AS string)), '') AS string) END as string)
 AS `assembly_order_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_source` AS string)), '') AS string) END as string)
 AS `order_source`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as string)
 AS `order_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_rate` AS string)), '') AS string) END as string)
 AS `order_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_fee` AS string)), '') AS string) END as string)
 AS `order_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`international_order_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`international_order_fee` AS string)), '') AS string) END as string)
 AS `international_order_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cod_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cod_fee` AS string)), '') AS string) END as string)
 AS `cod_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`international_hazmat_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`international_hazmat_fee` AS string)), '') AS string) END as string)
 AS `international_hazmat_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_of_destination` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_of_destination` AS string)), '') AS string) END as string)
 AS `country_of_destination`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_from` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_from` AS string)), '') AS string) END as string)
 AS `shipped_from`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) END as string)
 AS `warehouse`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comments` AS string)), '') AS string) END as string)
 AS `comments`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cartons_created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cartons_created` AS string)), '') AS string) END as string)
 AS `cartons_created`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_type` AS string)), '') AS string) END as string)
 AS `order_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`already_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`already_invoiced` AS string)), '') AS string) END as string)
 AS `already_invoiced`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_24` AS string)), '') AS string) END as string)
 AS `unnamed_24`
FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_orders`

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

    `order_id` AS `order_id`
  , `warehouse_id` AS `warehouse_id`
  , `sales_date` AS `sales_date`
  , `business_name` AS `business_name`
  , `customer_name` AS `customer_name`
  , `product_total` AS `product_total`
  , `num_of_boxes` AS `num_of_boxes`
  , `external_order_id` AS `external_order_id`
  , `po_number` AS `po_number`
  , `billing_order_type` AS `billing_order_type`
  , `assembly_order_count` AS `assembly_order_count`
  , `order_source` AS `order_source`
  , `order_date` AS `order_date`
  , `order_rate` AS `order_rate`
  , `order_fee` AS `order_fee`
  , `international_order_fee` AS `international_order_fee`
  , `cod_fee` AS `cod_fee`
  , `international_hazmat_fee` AS `international_hazmat_fee`
  , `country_of_destination` AS `country_of_destination`
  , `shipped_from` AS `shipped_from`
  , `warehouse` AS `warehouse`
  , `comments` AS `comments`
  , `cartons_created` AS `cartons_created`
  , `order_type` AS `order_type`
  , `already_invoiced` AS `already_invoiced`
  , `file_name` AS `file_name`
  , `sheet_name` AS `sheet_name`
  , `file_time` AS `file_time`
  , `unnamed_24` AS `unnamed_24`
  , `cap_client_center` AS `cap_client_center`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

