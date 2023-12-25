


  SELECT
    coalesce(lower(external_pricing.customer_email),lower(sfo.customer_email)) AS customer_email
  , coalesce(email.private_client_customer_id,substr(
    concat(
    
      coalesce(UPPER(substr(sfo.customer_firstname,1,1))|| '' , '')
    
      , coalesce(substr(sfo.customer_firstname,2,char_length(sfo.customer_firstname)-1)|| '' , '')
    
      , coalesce(' '|| '' , '')
    
      , coalesce(UPPER(substr(sfo.customer_lastname,1,1))|| '' , '')
    
      , coalesce(substr(sfo.customer_lastname,2,char_length(sfo.customer_lastname)-1)|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(UPPER(substr(sfo.customer_firstname,1,1))|| '' , '')
    
      , coalesce(substr(sfo.customer_firstname,2,char_length(sfo.customer_firstname)-1)|| '' , '')
    
      , coalesce(' '|| '' , '')
    
      , coalesce(UPPER(substr(sfo.customer_lastname,1,1))|| '' , '')
    
      , coalesce(substr(sfo.customer_lastname,2,char_length(sfo.customer_lastname)-1)|| '' , '')
    
  )) - length('')
      , 0
    )
) )AS customer_name
  , CASE sfo.customer_group_id
  	WHEN 0 THEN 'Not Logged In'
  	WHEN 1 THEN 'General'
  	WHEN 2 THEN 'Tax Exempt'
  	WHEN 3 THEN 'VIP Customer'
  	WHEN 4 THEN 'PopUp'
  	ELSE 'Null'
    END AS customer_group
  , sfo.mag_order_id AS increment_id
  , sfo.status
  , sfo.channel
  , sfo.base_grand_total
, DATETIME(SAFE_CAST(sfo.created_at AS timestamp), 'America/New_York') AS created_at_nyc
  , mit.simple_sku
  , pp.style
  , mit.item_base_price
  , mit.line_item_price + line_item_credit + line_item_discount+ line_item_tax + line_shipping_price + line_shipping_tax + line_shipping_discount + line_shipping_credit line_item_order_value
  , CASE
    WHEN (email.email_address IS NOT NULL OR sfo.customer_group_id = 3) THEN 'VIP Orders'
  	WHEN sfo.base_grand_total > 2000 THEN 'Greater than $2000 Orders'
    END AS view_category
  , email.stylist_name AS stylist
  , fps.fps_order_code
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_external_pricing` AS external_pricing 
  ON external_pricing.mag_order_id = sfo.mag_order_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items` AS mit
  ON mit.mag_order_entity_id = sfo.sales_flat_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_private_client_email_stylist_history` AS email
  ON lower(email.email_address) = coalesce(lower(external_pricing.customer_email),lower(sfo.customer_email))
  AND sfo.created_at >= email.valid_from
  AND sfo.created_at < email.valid_to
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS pp
  ON pp.simple_sku = mit.simple_sku
  left join `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` fps on sfo.mag_order_id = fps.mag_order_id
  WHERE sfo.channel IN ('magento', 'paypal', 'sg_app', 'affirm', 'amazon_payments','flow','direct_customer', 'farfetch_sg_dtc')
  AND (email.email_address IS NOT NULL OR sfo.customer_group_id = 3 OR sfo.base_grand_total > 2000)