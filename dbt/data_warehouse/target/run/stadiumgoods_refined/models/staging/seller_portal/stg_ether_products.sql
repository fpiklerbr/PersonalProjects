

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_products`
  
  
  OPTIONS()
  as (
    SELECT
    products.`ether_pim_product_id`,
  products.`product_name`,
  products.`nickname`,
  products.`product_number`,
  products.`mfg_sku`,
  products.`configurable_sku`,
  products.`eu_manufacturer_sku`,
  products.`release_date`,
  products.`product_status`,
  products.`colorway`,
  products.`created_at`,
  products.`updated_at`,
  products.`last_modified_in_x3_at`,
  products.`indexed_at`,
  products.`intake_is_enabled`,
  products.`retail_price`,
  products.`retail_price_currency`,
  products.`ff_product_id`,
  products.`locked_for_x3_update_at`,
  products.`lock_version`,
  products.`images_count`,
  products.`is_hazardous`,
  products.`manufacturer_sku_token`,
  products.`sales_channels`,
  products.`first_intaken_by_employee_id`,
  products.`first_intaken_at`,
  products.`_synched_from_source_at`,
  products.`_raw_eu_manufacturer_sku_token`,
  products.`_raw_first_intaken_at_warehouse_code`,
  products.`_raw_threat_score`,
  products.`_raw_threat_score_comments`,
  products.`_raw_onport_enabled`,
  products.`_raw_created_by_id`,
  products.`_raw_rfid_enabled`,
  products.`_raw_size_scale_id`
  , products.ether_pim_product_type_id
  , product_types.product_type_code
  , product_types.product_type
  , products.ether_pim_product_brand_id
  , brands.brand_code
  , brands.brand
  , products.ether_pim_product_category_id
  , product_categories.product_category_code
  , product_categories.product_category
  , products.ether_pim_product_gender_id
  , genders.gender_code
  , genders.gender
  , products.item_category_code
  , item_categories.item_category
  , products.primary_ether_pim_product_color_id
  , primary_colors.color_code AS primary_color_code
  , primary_colors.color AS primary_color
  , products.secondary_ether_pim_product_color_id
  , secondary_colors.color_code AS secondary_color_code
  , secondary_colors.color AS secondary_color
  , products.ether_pim_product_country_of_origin_id
  , countries_of_origin.country_of_origin_code
  , countries_of_origin.country_of_origin
  , products.ether_pim_tariff_schedule_code_id
  , tariff_categories.tariff_category_code
  , tariff_categories.tariff_category
  , products.ether_pim_tax_code_id
  , tax_categories.tax_category_code
  , tax_categories.tax_category
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_products` AS products
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_types` AS product_types
  ON products.ether_pim_product_type_id = product_types.ether_pim_product_type_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_categories` AS product_categories
  ON products.ether_pim_product_category_id = product_categories.ether_pim_product_category_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_genders` AS genders
  ON products.ether_pim_product_gender_id = genders.ether_pim_product_gender_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_brands` AS brands
  ON products.ether_pim_product_brand_id = brands.ether_pim_product_brand_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_colors` AS primary_colors
  ON products.primary_ether_pim_product_color_id = primary_colors.ether_pim_product_color_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_colors` AS secondary_colors
  ON products.secondary_ether_pim_product_color_id = secondary_colors.ether_pim_product_color_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_item_categories` AS item_categories
  ON products.item_category_code = item_categories.item_category_code
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_country_of_origins` AS countries_of_origin
  ON products.ether_pim_product_country_of_origin_id = countries_of_origin.ether_pim_product_country_of_origin_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_tariff_schedule_codes` AS tariff_categories
  ON products.ether_pim_tariff_schedule_code_id = tariff_categories.ether_pim_tariff_schedule_code_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_tax_codes` AS tax_categories
  ON products.ether_pim_tax_code_id = tax_categories.ether_pim_tax_code_id
  );
    