

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_orders`
  
  
  OPTIONS()
  as (
    
WITH tmp_order_line_count AS (

	SELECT
      x3_order_id
		, count(*) AS line_count
	  , count(DISTINCT serial_number) AS serial_count
	FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorderq`
	GROUP BY 1

)

SELECT
/* x3 order info */
    sales_order.x3_order_id
  , CASE
      WHEN sales_order.is_intersite = TRUE OR substr(sales_order.x3_order_id,1,3) = 'SOT'
        THEN 'Transfer'
      WHEN substr(sales_order.x3_order_id,1,3) = 'SOS'
        THEN 'SOURCE'
      ELSE
        'Order'
    END AS order_type
  , sales_order.order_status AS x3_order_status
  , coalesce(sales_order.is_closed, FALSE) AS closes_line
  , CASE WHEN null_order_dates.null_date IS NOT NULL THEN NULL ELSE sales_order.order_date END AS order_date
  , safe_cast(datetime(safe_cast(sales_order.created_at AS timestamp), 'America/New_York') AS datetime) AS order_creation_nyc
  , CASE
      WHEN lookup_email.is_order_channel
      THEN lookup_email.email_address
      WHEN sales_order.channel_code = 'POSCUST'
      THEN substr(
    concat(
    
      coalesce(sales_order.channel_code|| ' - ' , '')
    
      , coalesce(sales_order.sales_site|| ' - ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(sales_order.channel_code|| ' - ' , '')
    
      , coalesce(sales_order.sales_site|| ' - ' , '')
    
  )) - length(' - ')
      , 0
    )
)
      ELSE sales_order.channel_code
    END AS order_channel
  , sales_order.order_total
  , abs(sales_order.order_total_discount) AS order_total_discount

/* mag order info */
  , sales_order.mag_order_id AS ymagord
  , tmp_ymagord.mag_order_id
  , CASE
      WHEN sales_order.mag_order_id IS NULL
        THEN 'None'
      WHEN coalesce(tmp_ymagord.mag_order_id, '') <> sales_order.mag_order_id
        THEN 'Non-Standard'
      ELSE
        'Standard'
    END AS mag_order_id_type
  , sales_order.mag_order_status
  , coalesce(tmp_ymagord.mag_order_id, sales_order.x3_order_id) AS stadium_order_id

/* customer info */
  , sales_order.mag_customer_id AS customer_id
  , sales_order.mag_customer_email AS customer_email
  , sales_order.shipping_country
  , sales_order.shipping_region
  , sales_order.shipping_city
  , sales_order.shipping_postcode
  , nullif(trim(substr(
    concat(
    
      coalesce(nullif(trim(replace(replace(replace(shipping_name_1, 'Magento Customer', ''), 'TMall Customer', ''), 'GOAT Customer', '')), '')|| chr(10) , '')
    
      , coalesce(shipping_name_2|| chr(10) , '')
    
      , coalesce(shipping_address_1|| chr(10) , '')
    
      , coalesce(shipping_address_2|| chr(10) , '')
    
      , coalesce(shipping_address_3|| chr(10) , '')
    
      , coalesce(nullif(trim(substr(
    concat(
    
      coalesce(shipping_city|| ' ' , '')
    
      , coalesce(shipping_region|| ' ' , '')
    
      , coalesce(shipping_postcode|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(shipping_city|| ' ' , '')
    
      , coalesce(shipping_region|| ' ' , '')
    
      , coalesce(shipping_postcode|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)), '')|| chr(10) , '')
    
      , coalesce(shipping_country_name|| chr(10) , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(replace(replace(replace(shipping_name_1, 'Magento Customer', ''), 'TMall Customer', ''), 'GOAT Customer', '')), '')|| chr(10) , '')
    
      , coalesce(shipping_name_2|| chr(10) , '')
    
      , coalesce(shipping_address_1|| chr(10) , '')
    
      , coalesce(shipping_address_2|| chr(10) , '')
    
      , coalesce(shipping_address_3|| chr(10) , '')
    
      , coalesce(nullif(trim(substr(
    concat(
    
      coalesce(shipping_city|| ' ' , '')
    
      , coalesce(shipping_region|| ' ' , '')
    
      , coalesce(shipping_postcode|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(shipping_city|| ' ' , '')
    
      , coalesce(shipping_region|| ' ' , '')
    
      , coalesce(shipping_postcode|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)), '')|| chr(10) , '')
    
      , coalesce(shipping_country_name|| chr(10) , '')
    
  )) - length(chr(10))
      , 0
    )
)), '') AS shipping_address
  , nullif(trim(substr(
    concat(
    
      coalesce(sales_order.carrier|| ' ' , '')
    
      , coalesce(sales_order.delivery_mode|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(sales_order.carrier|| ' ' , '')
    
      , coalesce(sales_order.delivery_mode|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)), '') AS order_shipping_description
  , sales_order.allocation_status
  , sales_order.delivery_status
  , sales_order.invoice_status AS order_invoice_status
  , CASE WHEN null_invoice_dates.null_date IS NOT NULL THEN NULL ELSE sales_order.last_invoice_date END AS last_invoice_date
  , last_invoice.invoice_status AS last_invoice_status
  , sales_order.last_invoice_id
  , sales_order.credit_status
  , sales_order.channel_code IN 
('mercaux','mercaux - SGD','POSCUST','POSCUST - SGD','POSCUST - NYR','MPOSNY','Mercaux (Soho)','Mercaux Omni (Soho)','mercaux - CHI','POSCUST - CHI','POSCUST2','MPOSCHI','Mercaux (Chicago)','Mercaux Omni (Chicago)') AND 


  regexp_contains(sales_order.customer_order_reference, r'(?i)cash')

 AS cash_payment
  , sales_order.total_qty
  , tmp_order_line_count.line_count
  , tmp_order_line_count.serial_count
  , sales_order.creation_user_id
  , current_timestamp rebuild_timestamp
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorder` AS sales_order
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_mag_order_ids` AS tmp_ymagord
  ON sales_order.x3_order_id = tmp_ymagord.x3_order_id
LEFT JOIN tmp_order_line_count
  ON sales_order.x3_order_id = tmp_order_line_count.x3_order_id
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sinvoicev` AS last_invoice
  ON sales_order.last_invoice_id = last_invoice.invoice_id
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`exceptions_x3_null_dates` AS null_order_dates
  ON sales_order.order_date = null_order_dates.null_date
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`exceptions_x3_null_dates` AS null_invoice_dates
  ON sales_order.last_invoice_date = null_invoice_dates.null_date
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`lookup_email_addresses` AS lookup_email
  ON sales_order.mag_customer_email = lookup_email.email_address
  );
    