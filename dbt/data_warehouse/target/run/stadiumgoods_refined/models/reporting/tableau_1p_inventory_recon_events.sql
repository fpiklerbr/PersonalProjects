

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_1p_inventory_recon_events`
  
  
  OPTIONS()
  as (
    WITH serials AS (
SELECT
	serial_number
	, warehouse
	, consignor_id
	, purchase_reference
    , base_currency AS serial_base_currency
    , serial_cost_base_amount
	, serial_cost
	, serial_inventory
	, simple_sku
	, brand
    , product_attribute_set
	, brand_subcategory
	, payout_invoice_date
	, payout_invoice_paid_amount
	, payout_invoice_payable_amount
	, payout_invoice_paid_date
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
WHERE
	serial_relationship = '1P'
), warehouse_history AS (
SELECT 
	* 
FROM 
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_warehouse_history`
)

SELECT
	events.*
	, wh.warehouse 
	, ss.consignor_id as house_account
	, ss.purchase_reference as purchase_order
    , ss.serial_base_currency
    , ss.serial_cost_base_amount
	, ss.serial_cost
	, ss.serial_inventory as inventory_type
	, ss.simple_sku
	, ss.brand
	, ss.brand_subcategory
	, ss.payout_invoice_date
	, ss.payout_invoice_paid_amount
	, ss.payout_invoice_payable_amount
	, ss.payout_invoice_paid_date
	, ss.warehouse as last_known_warehouse
	, ss.product_attribute_set AS attribute_set
	
FROM
	( -- Only 1P events
		SELECT
			*
		FROM
			`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`inventory_events`
		WHERE
			serial_relationship = '1P' 
	) events
LEFT JOIN serials ss ON
	events.serial_number = ss.serial_number
LEFT JOIN warehouse_history wh ON
	events.serial_number = wh.serial_number
	AND CAST(
  

timestamp_add(cast( 

        datetime_add(
            cast( events.transaction_date as datetime),
        interval 1 day
        )

 as timestamp),
        interval -1 second)


 AS timestamp) >= wh.valid_from
	AND CAST(
  

timestamp_add(cast( 

        datetime_add(
            cast( events.transaction_date as datetime),
        interval 1 day
        )

 as timestamp),
        interval -1 second)


 AS timestamp) <= wh.valid_to
  );
    