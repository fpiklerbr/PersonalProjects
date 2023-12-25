

 






























 

SELECT   `third_party_id`,  `shop_id`,  `third_party_name`,  `slug`,  `_raw_supplier_acronym`,  `third_party_role`,  `contact_email`,  `shippo_carrier_id`,  `shippo_label_type`,  `product_type_import_strategy`,  `metadata`,  `auto_publish`,  `import_only_published_products`,  `pending_sync`,  `can_publish_quantity`,  `can_send_summary_emails`,  `is_enabled`,  `account_status`,  `created_at`,  `updated_at`,  `memo`,  `fedex_account_number`,  `increase_price_allowed`,  `auto_penalty`,  `_synched_from_source_at`,  `_sql_commission_rate`,  `exponent`,  `whole_number`,  `supplier_acronym`,  `portal_id`,  `commission_rate`
    , `_raw_published_serials_count`
    , `_raw_unpublished_serials_count`
    , `_raw_split_inventory_by_warehouse`
    , `_raw_consignor_id`
    , `_raw_sold_price_to_shopify`
  FROM ( SELECT
    *

  , 
    safe_cast(coalesce(_raw_supplier_acronym, nullif( _sql_supplier_acronym , '')) as string)
 AS `supplier_acronym`
  , 
    safe_cast(nullif(_sql_portal_id, '') as int64)
 AS `portal_id`
  , 
    safe_cast(coalesce(_sql_commission_rate, whole_number * power(10, exponent)) / 100 as float64)
 AS `commission_rate` 

 

FROM ( 

SELECT
    *

  , CAST(regexp_extract(metadata, 
  r'commission_rate: \"(.*?)\"'
) AS float64) AS `_sql_commission_rate`
  , CAST(regexp_extract(metadata, 
  r'portal_id: \"(.*?)\"'
) AS string) AS `_sql_portal_id`
  , CAST(regexp_extract(metadata, 
  r'commission_rate: !ruby/object:BigDecimal 18:.*?e([0-9]+)'
) AS int64) AS `exponent`
  , CAST(regexp_extract(metadata, 
  r'commission_rate: !ruby/object:BigDecimal 18:(.*?)e[0-9]+'
) AS float64) AS `whole_number`
  , CAST(regexp_extract(metadata, 
  r'supplier_acronym: ([a-zA-Z]+)'
) AS string) AS `_sql_supplier_acronym` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shop_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shop_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shop_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `third_party_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`slug` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`slug` AS string)), '') AS string) END as string)
 AS `slug`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`supplier_acronym` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`supplier_acronym` AS string)), '') AS string) END as string)
 AS `_raw_supplier_acronym`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`role` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`role` AS string)), '') AS string) END as string)
 AS `third_party_role`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contact_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contact_email` AS string)), '') AS string) END as string)
 AS `contact_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shippo_carrier_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shippo_carrier_id` AS string)), '') AS string) END as string)
 AS `shippo_carrier_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shippo_label_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shippo_label_type` AS string)), '') AS string) END as string)
 AS `shippo_label_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_type_import_strategy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_type_import_strategy` AS string)), '') AS string) END as string)
 AS `product_type_import_strategy`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`metadata` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`metadata` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `metadata`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auto_publish` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auto_publish` AS string)), '') AS string) END as float64)
 as int64)
 AS `auto_publish`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`import_only_published_products` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`import_only_published_products` AS string)), '') AS string) END as float64)
 as int64)
 AS `import_only_published_products`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pending_sync` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pending_sync` AS string)), '') AS string) END as float64)
 as int64)
 AS `pending_sync`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`can_publish_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`can_publish_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `can_publish_quantity`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`can_send_summary_emails` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`can_send_summary_emails` AS string)), '') AS string) END as float64)
 as int64)
 AS `can_send_summary_emails`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enabled` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enabled` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_enabled`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `account_status`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`memo` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`memo` AS string)), '') AS string) END as string)
 AS `memo`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fedex_account_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fedex_account_number` AS string)), '') AS string) END as string)
 AS `fedex_account_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increase_price_allowed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increase_price_allowed` AS string)), '') AS string) END as float64)
 as int64)
 AS `increase_price_allowed`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auto_penalty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auto_penalty` AS string)), '') AS string) END as float64)
 as int64)
 AS `auto_penalty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `published_serials_count` AS `_raw_published_serials_count`

  , `unpublished_serials_count` AS `_raw_unpublished_serials_count`

  , `split_inventory_by_warehouse` AS `_raw_split_inventory_by_warehouse`

  , `consignor_id` AS `_raw_consignor_id`

  , `sold_price_to_shopify` AS `_raw_sold_price_to_shopify`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`third_parties` AS source_table

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

