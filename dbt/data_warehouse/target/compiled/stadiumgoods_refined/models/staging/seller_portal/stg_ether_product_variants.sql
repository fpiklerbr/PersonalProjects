WITH pim_or_wms AS (

  SELECT
      product_number
    , size_code
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_variants`
  UNION DISTINCT
  SELECT
      product_number
    , size_code
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_product_variants`

)

SELECT
    substr(
    concat(
    
      coalesce(pim_or_wms.product_number|| '+' , '')
    
      , coalesce(pim_or_wms.size_code|| '+' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(pim_or_wms.product_number|| '+' , '')
    
      , coalesce(pim_or_wms.size_code|| '+' , '')
    
  )) - length('+')
      , 0
    )
) AS variant_number
  , pim_or_wms.product_number
  , pim_or_wms.size_code

  , coalesce(pim.variant_size, wms.variant_size) AS variant_size
  , coalesce(pim.simple_sku, wms.simple_sku) AS simple_sku
  , coalesce(pim.upc, wms.upc) AS upc
  , (products.intake_is_enabled AND pim.intake_is_enabled AND wms.intake_is_enabled) IS TRUE AS intake_is_enabled

  , products.ether_pim_product_id
  , products.intake_is_enabled AS product_intake_is_enabled
  , products.created_at AS product_created_at
  , products.updated_at AS product_updated_at
  , products.last_modified_in_x3_at AS product_last_modified_in_x3_at
  , products.lock_version AS product_lock_version
  , products._synched_from_source_at AS product_synched_from_source_at
  , products.`product_name`,
  products.`nickname`,
  products.`mfg_sku`,
  products.`configurable_sku`,
  products.`eu_manufacturer_sku`,
  products.`release_date`,
  products.`product_status`,
  products.`colorway`,
  products.`indexed_at`,
  products.`retail_price`,
  products.`retail_price_currency`,
  products.`ff_product_id`,
  products.`locked_for_x3_update_at`,
  products.`images_count`,
  products.`is_hazardous`,
  products.`manufacturer_sku_token`,
  products.`sales_channels`,
  products.`first_intaken_by_employee_id`,
  products.`first_intaken_at`,
  products.`_raw_eu_manufacturer_sku_token`,
  products.`_raw_first_intaken_at_warehouse_code`,
  products.`_raw_threat_score`,
  products.`_raw_threat_score_comments`,
  products.`_raw_onport_enabled`,
  products.`_raw_created_by_id`,
  products.`_raw_rfid_enabled`,
  products.`_raw_size_scale_id`,
  products.`ether_pim_product_type_id`,
  products.`product_type_code`,
  products.`product_type`,
  products.`ether_pim_product_brand_id`,
  products.`brand_code`,
  products.`brand`,
  products.`ether_pim_product_category_id`,
  products.`product_category_code`,
  products.`product_category`,
  products.`ether_pim_product_gender_id`,
  products.`gender_code`,
  products.`gender`,
  products.`item_category_code`,
  products.`item_category`,
  products.`primary_ether_pim_product_color_id`,
  products.`primary_color_code`,
  products.`primary_color`,
  products.`secondary_ether_pim_product_color_id`,
  products.`secondary_color_code`,
  products.`secondary_color`,
  products.`ether_pim_product_country_of_origin_id`,
  products.`country_of_origin_code`,
  products.`country_of_origin`,
  products.`ether_pim_tariff_schedule_code_id`,
  products.`tariff_category_code`,
  products.`tariff_category`,
  products.`ether_pim_tax_code_id`,
  products.`tax_category_code`,
  products.`tax_category`

  , pim.ether_pim_product_variant_id
  , pim.variant_size AS pim_variant_size
  , pim.simple_sku AS pim_simple_sku
  , pim.upc AS pim_upc
  , pim.intake_is_enabled AS pim_variant_intake_is_enabled
  , pim.created_at AS pim_variant_created_at
  , pim.updated_at AS pim_variant_updated_at
  , pim.last_modified_in_x3_at AS pim_variant_last_modified_in_x3_at
  , pim.lock_version AS pim_variant_lock_version
  , pim._synched_from_source_at AS pim_variant_synched_from_source_at
  , pim.`farfetch_size`

  , wms.ether_wms_product_variant_id
  , wms.variant_size AS wms_variant_size
  , wms.simple_sku AS wms_simple_sku
  , wms.upc AS wms_upc
  , wms.intake_is_enabled AS wms_variant_intake_is_enabled
  , wms.created_at AS wms_variant_created_at
  , wms.updated_at AS wms_variant_updated_at
  , wms._synched_from_source_at AS wms_variant_synched_from_source_at
  , wms.`min_price`,
  wms.`max_price`

FROM pim_or_wms
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_variants` AS pim
  ON pim_or_wms.product_number = pim.product_number
  AND pim_or_wms.size_code = pim.size_code
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_product_variants` AS wms
  ON pim_or_wms.product_number = wms.product_number
  AND pim_or_wms.size_code = wms.size_code
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_products` AS products
  ON pim_or_wms.product_number = products.product_number