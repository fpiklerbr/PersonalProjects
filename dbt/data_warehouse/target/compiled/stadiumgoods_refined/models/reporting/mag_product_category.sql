WITH final AS (

  SELECT
      simple_sku
    , array_agg(DISTINCT category_id) AS all_category_ids
    , string_agg(DISTINCT category_name, ', ') AS all_category_names
    , array_agg(DISTINCT CASE WHEN category_type = 'Brand' THEN category_id END
        IGNORE NULLS) AS brand_category_ids
    , string_agg(DISTINCT CASE WHEN category_type = 'Brand' THEN upper(category_name) END, ', ') AS brand_category_names
    , array_agg(DISTINCT CASE WHEN category_type = 'Subcategory' THEN category_id END
        IGNORE NULLS) AS subcategory_ids
    , string_agg(DISTINCT CASE WHEN category_type = 'Subcategory' THEN category_name END, ', ') AS subcategory_names
    , array_agg(DISTINCT CASE WHEN category_type = 'Other' THEN category_id END
        IGNORE NULLS) AS other_category_ids
    , string_agg(DISTINCT CASE WHEN category_type = 'Other' THEN category_name END, ', ') AS other_category_names
    , current_timestamp rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_categories`
  GROUP BY 1

)

SELECT * FROM final