

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_product_ranks`
  
  
  OPTIONS()
  as (
    

  SELECT fol.stadium_order_id
	, fol.order_date
	, fol.business_unit
	, fol.sales_channel
	, fol.unique_email
	, fol.geography_type
	, fol.geography
	, fol.simple_sku
	, products.brand
	, products.x3_attribute_set AS `type`
	, products.gender
	, products.brand_subcategory AS category
	, products.mfg_sku
	, products.name AS `style`
	, products.nickname
	, products.colorway
	, products.size
	, fol.gmv_qty
	, fol.gmv_total
	, fol.gtv_total
	, fol.line_item_price_paid + fol.line_item_price_credited + fol.line_item_discount AS price
	, CASE WHEN serials.intake_date IS NULL
	    THEN NULL
	    ELSE nullif(
     greatest(
      coalesce(

    datetime_diff(
        cast(CAST(fol.order_date AS date) as datetime),
        cast(serials.intake_date as datetime),
        day
    )

, CAST('-9223372036854775808' AS int64))
      ,coalesce(0, CAST('-9223372036854775808' AS int64))
      
      )
     , CAST('-9223372036854775808' AS int64)
  )
        END AS days_to_sale
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS fol
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  ON products.simple_sku = fol.simple_sku
  LEFT JOIN
  (
      SELECT serial_number
      , min(first_available_date) intake_date
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS stadium_serials
      GROUP BY 1
  ) serials ON serials.serial_number = fol.serial_number
  );
    