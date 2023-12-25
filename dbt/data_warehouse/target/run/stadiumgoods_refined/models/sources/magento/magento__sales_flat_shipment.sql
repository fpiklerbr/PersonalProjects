

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_shipment`
  OPTIONS()
  as 

  

















 

SELECT   `sales_flat_shipment_id`,  `store_id`,  `total_weight`,  `total_qty`,  `email_is_sent`,  `sales_flat_order_id`,  `customer_id`,  `shipping_address_id`,  `billing_address_id`,  `shipment_status`,  `mag_shipment_id`,  `created_at`,  `updated_at`,  `packages`,  `shipping_label`,  `dsco_order_id`,  `dsco_po_number`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_shipment_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_weight` AS string)), '') AS string) END as float64)
 AS `total_weight`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_qty`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `email_is_sent`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipping_address_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `billing_address_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) END as string)
 AS `shipment_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) END as string)
 AS `mag_shipment_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`packages` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`packages` AS string)), '') AS string) END as string)
 AS `packages`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_label` AS string)), '') AS string) END as string)
 AS `shipping_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) END as string)
 AS `dsco_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) END as string)
 AS `dsco_po_number`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment` AS source_table

 ) AS un_ordered

;

