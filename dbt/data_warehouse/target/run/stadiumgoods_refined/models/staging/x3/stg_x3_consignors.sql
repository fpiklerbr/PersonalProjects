

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_consignors`
  OPTIONS()
  as 

	SELECT consignor.supplier_id AS consignor_id
		, consignor.supplier_name AS consignor_name
		, consignor.consignor_type
		, substr(
    concat(
    
      coalesce(consignor_address.line_1|| chr(10) , '')
    
      , coalesce(consignor_address.line_2|| chr(10) , '')
    
      , coalesce(consignor_address.line_3|| chr(10) , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(consignor_address.line_1|| chr(10) , '')
    
      , coalesce(consignor_address.line_2|| chr(10) , '')
    
      , coalesce(consignor_address.line_3|| chr(10) , '')
    
  )) - length(chr(10))
      , 0
    )
) AS consignor_address
		, consignor_address.city AS consignor_city
		, consignor_address.state AS consignor_state
		, consignor_address.postcode AS consignor_postcode
		, consignor_address.country AS consignor_country
		, consignor_address.email AS consignor_email
		, consignor_address.phone AS consignor_phone
        , DATETIME(SAFE_CAST(consignor.created_at AS timestamp), 'America/New_York') AS consignor_creation_nyc
		, consignor.commission_rate
		, coalesce(
		      CASE WHEN consignor.seller_relationship_from_code IN ('1P','3P') THEN seller_relationship_from_code END
	        , '3P') AS seller_relationship
		, coalesce(
		      CASE WHEN consignor.seller_inventory_from_id IN ('Returns Purchase', 'SG Apparel') THEN seller_inventory_from_id END
	        , CASE WHEN consignor.seller_inventory_from_code IN ('Wholesale', 'Consignment') THEN seller_inventory_from_code END
	        , 'Consignment') AS seller_inventory
		, current_timestamp rebuild_timestamp
	    , consignor.is_key_seller
	FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__bpsupplier` AS consignor
    LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__bpaddress` AS consignor_address
        ON consignor.supplier_id = consignor_address.address_id
        AND consignor_address.address_type_code = 1
        AND consignor_address.is_default = 2
	WHERE consignor.supplier_category_code <> 'SIT';

