

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_1p_inventory_report`
  
  
  OPTIONS()
  as (
    
	SELECT DISTINCT
	        serials.serial_inventory inventory_type
        , serials.consignor_id
        , serials.serial_number
        , stadium_products.mfg_sku
        , stadium_products.name AS product_name
        , serials.original_intake_date
        , coalesce(serials.yseristatus_consignment_status, CASE WHEN serials.status_document = 'Withdrawal' THEN 'Withdrawn' ELSE NULL END) yseristatus_consignment_status
        , serials.yseristatus_issue_date
        , serials.serial_cost
        , CAST(serials.price AS float64) AS price
        , stadium_products.size
        , stadium_products.x3_sku
        , stadium_products.size_uom
        , stadium_products.brand
        , nullif(
     greatest(
      coalesce(

    datetime_diff(
        cast(serials.last_available_date as datetime),
        cast(serials.first_available_date as datetime),
        day
    )

+ 1, CAST('-9223372036854775808' AS int64))
      ,coalesce(0, CAST('-9223372036854775808' AS int64))
      
      )
     , CAST('-9223372036854775808' AS int64)
  ) inventory_age
        , serials.purchase_id
        , serials.purchase_line
	    , serials.purchase_reference
	    , min(original_intake_date) over (partition by serials.purchase_reference, stadium_products.mfg_sku) po_intake_date
		, stadium_products.colorway
		, stadium_products.nickname
		, stadium_products.brand_subcategory AS type
        , serials.warehouse AS `Warehouse`
		, coalesce(stadium_products.nickname, stadium_products.colorway) nickname_or_colorway
		, finance_lines.x3_order_id
		, finance_lines.x3_order_line
		, finance_lines.order_date
		, finance_lines.net_sales
	    , finance_lines.sales_channel
		, finance_lines.gtv_total
        , serials.order_creation_nyc
        , serials.status_document
	    , finance_lines.reporting_status
	    , finance_lines.item_value_before_discount
	    , finance_lines.item_price_after_discount
	    , finance_lines.item_discount
	    , finance_lines.item_discount_type
		, 
CASE
  WHEN finance_lines.reporting_status = 'Dispatched' THEN 'Dispatched'
  WHEN (
    serials.status_document = 'Withdrawal'
    OR serials.yseristatus_consignment_status = 'Withdrawn'
  ) THEN 'Withdrawn'
  WHEN (
    serials.yseristatus_consignment_status = 'Returned'
    OR (
      


  regexp_contains(serials.yseristatus_consignment_status, r'(?i).*Sold.*')


      AND finance_lines.reporting_status = 'Returned'
    )
  ) THEN 'Returned to New Serial'
  ELSE 'Available'
END
 AS serial_status
	    , finance_lines.business_unit
	    , finance_lines.channel_or_gateway
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serials
    INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS stadium_products
      USING (simple_sku)
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS finance_lines
      ON serials.stadium_order_id = finance_lines.stadium_order_id
      AND serials.serial_number = finance_lines.serial_number
	WHERE serial_relationship = '1P'
  );
    