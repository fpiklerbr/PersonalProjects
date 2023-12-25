WITH simple_skus AS (

  SELECT
    simple_sku
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_products`
  UNION DISTINCT
  SELECT
    simple_sku
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_product_variants`
  UNION DISTINCT
  SELECT
    simple_sku
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_products`

), mag_color AS (

  SELECT
    simple_sku
  , array_agg(color_id) mag_color_ids
  , string_agg(DISTINCT color_name, ', ') AS mag_colors
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_color`
  GROUP BY 1

), mag_material AS (

  SELECT
    simple_sku
  , array_agg(material_id) mag_material_ids
  , string_agg(DISTINCT material_name, ', ') AS mag_materials
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_material`
  GROUP BY 1

), mag_image AS (

  SELECT
    simple_sku
  , COUNT( DISTINCT CASE WHEN image_is_disabled <> 1 THEN image_path END ) AS mag_enabled_image_count
  , string_agg( CASE WHEN image_is_disabled <> 1 THEN image_path END, ', ' ORDER BY image_position) AS mag_enabled_images
  , count( DISTINCT CASE WHEN image_is_disabled = 1 THEN image_path END ) AS mag_disabled_image_count
  , string_agg( CASE WHEN image_is_disabled = 1 THEN image_path END, ', ' ORDER BY image_position) AS mag_disabled_images
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_image`
  GROUP BY 1

), product_attributes AS (

  SELECT
    simple_skus.simple_sku
  , coalesce(
        mag.configurable_sku
      , ether.configurable_sku
      , x3.configurable_sku
    ) AS configurable_sku
  , coalesce(ether.product_number, x3.x3_sku) AS x3_sku
  , mag.configurable_sku AS mag_configurable_sku
  , coalesce(
        ether.configurable_sku
      , x3.configurable_sku
    ) AS x3_configurable_sku
  , mag.simple_product_id
  , mag.configurable_product_id
  , mag.simple_is_enabled
  , mag.configurable_is_enabled
  , mag.simple_x3_product_type
  , mag.configurable_x3_product_type
  , mag.simple_product_creation_nyc
  , mag.configurable_product_creation_nyc
  , mag.fps_parent_product_id
  , mag.mag_fps_parent_product_id_created_at
  , upper(coalesce(
        ether.product_type
      , x3.attribute_set
      , configurable_product_types.product_type
      , simple_product_types.product_type
    )) AS attribute_set
  , substr(
    concat(
    
      coalesce(upper(coalesce(
    mag.configurable_name
  , ether.product_name
  , x3.style
  , mag.simple_name
))|| ' ' , '')
    
      , coalesce(coalesce(
    '"' || upper(coalesce(mag.configurable_nickname, mag.simple_nickname, ether.nickname, x3.nickname)) || '"'
  , upper(coalesce(mag.configurable_colorway, mag.simple_colorway, ether.colorway, x3.colorway))
)|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(upper(coalesce(
    mag.configurable_name
  , ether.product_name
  , x3.style
  , mag.simple_name
))|| ' ' , '')
    
      , coalesce(coalesce(
    '"' || upper(coalesce(mag.configurable_nickname, mag.simple_nickname, ether.nickname, x3.nickname)) || '"'
  , upper(coalesce(mag.configurable_colorway, mag.simple_colorway, ether.colorway, x3.colorway))
)|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
) AS `style`
  , upper(coalesce(
    mag.configurable_name
  , ether.product_name
  , x3.style
  , mag.simple_name
)) AS `name`
  , coalesce(mag.configurable_name, mag.simple_name) AS mag_name
  , coalesce(mag.configurable_description, mag.simple_description) AS mag_description
  , coalesce(mag.configurable_short_description, mag.simple_short_description) AS mag_short_description
  , 'http://www.stadiumgoods.com/' || coalesce(mag.configurable_url_key, mag.configurable_url_path, mag.simple_url_key, mag.simple_url_path) AS mag_url

/* magento configurable product preferred over simple product for these product-level attributes */
  , upper(coalesce(
        mag.configurable_mfg_sku
      , mag.simple_mfg_sku
      , ether.mfg_sku
      , x3.mfg_sku
    )) AS mfg_sku
  , coalesce(
        mag.configurable_mfg_sku
      , mag.simple_mfg_sku
    ) AS mag_mfg_sku
  , coalesce(
        ether.mfg_sku
      , x3.mfg_sku
    ) AS x3_mfg_sku
  , upper(coalesce(
        mag.configurable_brand
      , mag.simple_brand
      , ether.brand
      , x3.brand
    )) AS brand
  , coalesce(
        mag.configurable_brand
      , mag.simple_brand
    ) AS mag_brand
  , coalesce(
        ether.brand
      , x3.brand
    ) AS x3_brand
  , upper(coalesce(
        mag.configurable_gender
      , mag.simple_gender
      , ether.gender
      , x3.gender
    )) AS gender
  , coalesce(
        mag.configurable_gender
      , mag.simple_gender
    ) AS mag_gender
  , coalesce(
        ether.gender
      , x3.gender
    ) AS x3_gender
  , upper(coalesce(
        mag.configurable_colorway
      , mag.simple_colorway
      , ether.colorway
      , x3.colorway
    )) AS colorway
  , coalesce(
        mag.configurable_colorway
      , mag.simple_colorway
    ) AS mag_colorway
  , coalesce(
        ether.colorway
      , x3.colorway
    ) AS x3_colorway
  , upper(coalesce(
        mag.configurable_nickname
      , mag.simple_nickname
      , ether.nickname
      , x3.nickname
    )) AS nickname
  , coalesce(
        mag.configurable_nickname
      , mag.simple_nickname
    ) AS mag_nickname
  , coalesce(
        ether.nickname
      , x3.nickname
    ) AS x3_nickname
  , upper(coalesce(
        mag.configurable_country_of_origin
      , mag.simple_country_of_origin
      , ether.country_of_origin
      , x3.country_of_origin
    )) AS country_of_origin
  , coalesce(
        mag.configurable_country_of_origin
      , mag.simple_country_of_origin
    ) AS mag_country_of_origin
  , coalesce(
        ether.country_of_origin
      , x3.country_of_origin
    ) AS x3_country_of_origin
  , upper(coalesce(
        mag.simple_size
      , mag.configurable_size
      , ether.variant_size
      , x3.size
    )) AS size
  , coalesce(
        mag.simple_size
      , mag.configurable_size
    ) AS mag_size
  , coalesce(
        ether.variant_size
      , x3.size
    ) AS x3_size
  , upper(coalesce(
        mag.simple_upc
      , mag.configurable_upc
      , ether.upc
      , x3.upc
    )) AS upc
  , coalesce(
        mag.simple_upc
      , mag.configurable_upc
    ) AS mag_upc
  , coalesce(
        ether.upc
      , x3.upc
    ) AS x3_upc

/* Ether/X3 attributes */
  , coalesce(ether.product_name, x3.style) AS x3_name
  , coalesce(ether.size_code, x3.size_uom) AS size_uom
  , nullif(
     least(
      coalesce(safe_cast(datetime(safe_cast(ether.product_created_at AS timestamp), 'America/New_York') AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3.product_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS x3_product_creation_nyc
  , coalesce(ether.product_type, x3.attribute_set) AS x3_attribute_set
  , coalesce(ether.item_category, x3.category) AS x3_category
  , coalesce(
        CASE ether.intake_is_enabled WHEN TRUE THEN 'Active' WHEN FALSE THEN 'Intake Disabled' END
      , x3.x3_product_status
    ) AS x3_product_status
  , ether.ff_product_id as ff_product_id

/* mag_category */
  , upper(coalesce(mag_category.subcategory_names, ether.product_category, x3.type)) AS brand_subcategory
  , mag_category.subcategory_names AS mag_subcategories
  , coalesce(ether.product_category, x3.type) AS x3_subcategory

/* mag_color */
  , mag_color.mag_color_ids
  , mag_color.mag_colors

/* mag_material */
  , mag_material.mag_material_ids
  , mag_material.mag_materials

/* mag_image */
  , mag_image.mag_enabled_image_count
  , mag_image.mag_enabled_images
  , mag_image.mag_disabled_image_count
  , mag_image.mag_disabled_images
  FROM simple_skus
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_products` AS mag
    ON simple_skus.simple_sku = mag.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_product_variants` AS ether
    ON simple_skus.simple_sku = ether.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_products` AS x3
    ON simple_skus.simple_sku = x3.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_types` AS configurable_product_types
    ON mag.configurable_x3_product_type = configurable_product_types.product_type_code
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_types` AS simple_product_types
    ON mag.simple_x3_product_type = simple_product_types.product_type_code
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_category` AS mag_category
    ON simple_skus.simple_sku = mag_category.simple_sku
  LEFT JOIN mag_color
    ON simple_skus.simple_sku = mag_color.simple_sku
  LEFT JOIN mag_material
    ON simple_skus.simple_sku = mag_material.simple_sku
  LEFT JOIN mag_image
    ON simple_skus.simple_sku = mag_image.simple_sku

), intermediate_table AS (

  SELECT
      product_attributes.*
    , CASE
        WHEN product_attributes.attribute_set = 'SHOES' THEN 'SHOES'
        WHEN product_attributes.attribute_set = 'APPAREL' THEN 'APPAREL'
        ELSE 'else'
      END as merch_division
    , CASE
      WHEN product_attributes.attribute_set = 'SHOES' THEN
          CASE
        WHEN product_attributes.brand = 'JORDAN'      THEN 'Jordan Shoes'
        WHEN product_attributes.brand = 'NIKE'        THEN 'Nike Shoes'
        WHEN product_attributes.brand = 'ADIDAS'      THEN 'Adidas Shoes'
        WHEN product_attributes.brand = 'NEW BALANCE' THEN 'New Balance Shoes'
        ELSE 'Other Shoes'
          END
      WHEN product_attributes.attribute_set = 'APPAREL' THEN
          CASE
        WHEN product_attributes.brand = 'SUPREME' THEN 'Supreme Apparel'
        WHEN product_attributes.brand IN ('STADIUM GOODS', 'STADIUM') THEN 'SG Apparel'
        ELSE 'Other Apparel'
          END
      ELSE 'Accessories & Other'
      END as merch_department
  FROM product_attributes

), final as ( --DE-4682 dedupe logic over serials present in both mag and sp. Not enought doc to calculate risks of it.

SELECT 
      *
    , ROW_NUMBER() OVER (
        PARTITION BY simple_sku, configurable_sku, size, mfg_sku, 
                     mag_configurable_sku, x3_configurable_sku, fps_parent_product_id
        ORDER BY simple_product_creation_nyc
    ) as row_num,
FROM intermediate_table

)

SELECT * FROM FINAL 
WHERE row_num = 1 AND simple_sku IS NOT NULL