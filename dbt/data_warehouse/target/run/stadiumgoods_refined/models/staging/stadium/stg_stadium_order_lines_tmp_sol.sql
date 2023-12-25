

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_tmp_sol`
  
  
  OPTIONS()
  as (
    



  SELECT
    item_line_info.*
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN 'USD' END --TODO for DE-3393: get the base currency of the Magento/DSS order
      , serial_info.base_currency
      , 'USD'
    ) AS inventory_base_currency
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN cast(NULL AS date) END
      , serial_info.cost_currency_conversion_date
    ) AS inventory_cost_currency_conversion_date
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN cast(1.0 AS numeric) END
      , serial_info.cost_currency_conversion_rate
      , cast(1.0 AS numeric)
    ) AS inventory_cost_currency_conversion_rate
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN item_line_info.dropship_inventory_cost END --TODO for DE-3393: get the base amount upstream
      , serial_info.serial_cost_base_amount
      , 0
    ) AS inventory_cost_base_amount
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN item_line_info.dropship_inventory_cost END
      , serial_info.serial_cost
      , 0
    ) AS inventory_cost
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN item_line_info.dropship_inventory_source END
      , serial_info.serial_source
      , 'Unknown'
    ) AS inventory_source
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN item_line_info.dropship_inventory_relationship END
      , serial_info.serial_relationship
      , '3P'
    ) AS inventory_relationship
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN item_line_info.dropship_inventory_type END
      , serial_info.serial_inventory
      , 'Consignment'
    ) AS inventory_type
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN item_line_info.dropship_inventory_seller END
      , serial_info.seller_id
      , 'Unknown'
    ) AS inventory_seller
  , coalesce(
        CASE WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship' THEN item_line_info.dropshipper_name END
      , serial_info.seller_name
      , 'Unknown'
    ) AS seller_name
  , serial_info.seller_country
  , serial_info.seller_city
  , serial_info.base_currency AS serial_base_currency
  , COALESCE(price_history.price_base_amount, serial_info.price_base_amount) AS serial_price_base_amount
  , COALESCE(price_history.price, serial_info.price) AS serial_price

/* serial_info attributes */
  , serial_info.commission_rate
  , serial_info.serial_cost_base_amount
  , serial_info.serial_cost
  , serial_info.simple_sku AS serial_simple_sku
  , serial_info.yseristatus_paid_out_status AS paid_out_status
  , serial_info.yseristatus_issue_date
  , serial_info.purchase_id
  , serial_info.purchase_reference
  , serial_info.purchase_price AS serial_purchase_price
  , serial_info.payout_invoice_id
  , CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN serial_info.mag_order_id
      ELSE serial_info.x3_order_id
    END AS serial_order_id
  , 
coalesce(
    CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN item_line_info.mag_order_id = serial_info.mag_order_id
      ELSE item_line_info.x3_order_id = serial_info.x3_order_id
    END
  , FALSE
)
 AS serial_order_match
  , order_serial.base_currency AS order_serial_base_currency
  , COALESCE(order_serial_history.price_base_amount, order_serial.price_base_amount) AS order_serial_price_base_amount
  , COALESCE(order_serial_history.price, order_serial.price) AS order_serial_price
  , order_serial_history.previous_price_base_amount AS order_serial_previous_price_base_amount
  , order_serial_history.previous_price AS order_serial_previous_price
  , CASE WHEN order_serial_history.is_price_change IS TRUE THEN order_serial_history.valid_from
      ELSE NULL
      END AS order_serial_price_changed_at
  , order_serial_promotions.promotion_id AS seller_portal_promotion_id
  , order_serial_promotions.promotion_type AS seller_portal_promotion_type
  , order_serial_promotions.promotion_started_at AS seller_portal_promotion_started_at
  , (
  	  item_line_info.line_item_price_raw * (1 + channel_upcharge_percentage) + channel_upcharge_flat
  	  + item_line_info.line_shipping_price
  	  + (item_line_info.line_item_tax + item_line_info.line_shipping_tax)
  	  - (item_line_info.line_item_discount_raw + item_line_info.line_shipping_discount)
  	  - (item_line_info.line_item_store_credit_applied + item_line_info.line_shipping_store_credit_applied)
    ) AS revenue

/* shipping_from_crossdock attributes */
  , shipping_from_crossdock.zebra_tracking_number AS tracking_number_from_crossdock
  , shipping_from_crossdock.ship_cost AS total_ship_cost_from_crossdock
  , shipping_from_crossdock.ship_cost_type AS ship_cost_from_crossdock_type
  , shipping_from_crossdock.ship_cost_source AS ship_cost_from_crossdock_source
  , shipping_from_crossdock.zebra_ship_cost AS total_zebra_ship_cost
  , shipping_from_crossdock.tmall_b2c_ship_cost AS total_tmall_b2c_ship_cost
  , shipping_from_crossdock.flow_ship_cost AS total_flow_ship_cost
  , shipping_from_crossdock.tmall_b2c_duties_cost AS total_tmall_b2c_duties_cost
  , shipping_from_crossdock.flow_duties_cost AS total_flow_duties_cost

/* shipping_from_fulfillment attributes */
  , shipping_from_fulfillment.ship_cost AS total_ship_cost_from_fulfillment
  , shipping_from_fulfillment.ship_cost_type AS ship_cost_from_fulfillment_type
  , shipping_from_fulfillment.ship_cost_source AS ship_cost_from_fulfillment_source
  , shipping_from_fulfillment.p2p_cost AS total_p2p_ship_cost
  , shipping_from_fulfillment.dhl_ship_cost AS total_dhl_ship_cost
  , shipping_from_fulfillment.fps_ship_cost AS total_fps_ship_cost
  , shipping_from_fulfillment.cap_invoice_cost AS total_cap_invoiced_ship_cost
  , shipping_from_fulfillment.fedex_cost AS total_fedex_ship_cost
  , shipping_from_fulfillment.cap_confirmation_cost AS total_cap_confirmation_ship_cost
  , shipping_from_fulfillment.dhl_customs_invoice_id
  , shipping_from_fulfillment.dhl_customs_cost AS total_dhl_customs_cost
  , shipping_from_fulfillment.dhl_duties_invoice_id
  , shipping_from_fulfillment.dhl_duties_cost AS total_dhl_duties_cost
  , nullif(substr(
    concat(
    
      coalesce(shipping_from_fulfillment.ship_cost_source|| ', ' , '')
    
      , coalesce(shipping_from_crossdock.ship_cost_source|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(shipping_from_fulfillment.ship_cost_source|| ', ' , '')
    
      , coalesce(shipping_from_crossdock.ship_cost_source|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
), '') AS ship_cost_source
  , nullif(substr(
    concat(
    
      coalesce(shipping_from_fulfillment.ship_cost_type|| ', ' , '')
    
      , coalesce(shipping_from_crossdock.ship_cost_type|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(shipping_from_fulfillment.ship_cost_type|| ', ' , '')
    
      , coalesce(shipping_from_crossdock.ship_cost_type|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
), '') AS ship_cost_type
  , CASE
      WHEN private_client_history.email_address IS NOT NULL
      THEN cast('Private Client' AS string)
    END AS private_customer_status
  , private_client_history.stylist_name AS private_customer_stylist
  , private_client_history.customer_type AS private_customer_type
  , private_client_history.stylist_type AS private_customer_source
  , coalesce(
        private_client_history.private_client_customer_id
      , private_clients.private_client_customer_id
    ) AS private_client_customer_id
  , CASE
      WHEN 
coalesce(
    CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN item_line_info.mag_order_id = serial_info.mag_order_id
      ELSE item_line_info.x3_order_id = serial_info.x3_order_id
    END
  , FALSE
)
 = TRUE
      THEN new_serials.new_serial_from_return
    END AS new_serial_from_return
  , CASE
      WHEN 
coalesce(
    CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN item_line_info.mag_order_id = serial_info.mag_order_id
      ELSE item_line_info.x3_order_id = serial_info.x3_order_id
    END
  , FALSE
)
 = TRUE
      THEN new_serials.new_serial_inventory_relationship
    END AS new_serial_inventory_relationship
  , CASE
      WHEN 
coalesce(
    CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN item_line_info.mag_order_id = serial_info.mag_order_id
      ELSE item_line_info.x3_order_id = serial_info.x3_order_id
    END
  , FALSE
)
 = TRUE
      THEN new_serials.return_intake_id
    END AS return_intake_id
  , CASE
      WHEN 
coalesce(
    CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN item_line_info.mag_order_id = serial_info.mag_order_id
      ELSE item_line_info.x3_order_id = serial_info.x3_order_id
    END
  , FALSE
)
 = TRUE
      THEN new_serials.return_intake_creation_nyc
    END AS return_intake_creation_nyc
  , CASE
      WHEN 
coalesce(
    CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN item_line_info.mag_order_id = serial_info.mag_order_id
      ELSE item_line_info.x3_order_id = serial_info.x3_order_id
    END
  , FALSE
)
 = FALSE
      THEN journal_after_dispatch.next_journal_date_after_dispatch_date
    END AS issued_serial_next_journal_date_after_dispatch_date
  , CASE
      WHEN 
coalesce(
    CASE
      WHEN 
coalesce(serial_info.serial_inventory, item_line_info.dropship_inventory_type, 'Consignment') = 'Dropship'
      THEN item_line_info.mag_order_id = serial_info.mag_order_id
      ELSE item_line_info.x3_order_id = serial_info.x3_order_id
    END
  , FALSE
)
 = FALSE
      THEN journal_after_dispatch.document_id
    END AS issued_serial_next_journal_document_id_after_dispatch_date
  , CASE
      WHEN item_line_info.dispatch_date IS NOT NULL
      THEN cast(
        cast(item_line_info.dispatch_date AS string )
          || ' '
          || cast(cast(coalesce(item_line_info.shipping_timestamp_nyc, item_line_info.order_creation_nyc) AS time) AS string )
        AS datetime
      )
    END AS dispatch_timestamp_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_tmp_sol_seeds` AS item_line_info
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS order_serial
  ON order_serial.serial_number = item_line_info.order_serial
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history` AS order_serial_history
  ON order_serial_history.serial_number = item_line_info.order_serial
  AND order_serial_history.valid_from <= item_line_info.order_timestamp
  AND item_line_info.order_timestamp < order_serial_history.valid_to
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_promotion_serials` AS order_serial_promotions
  ON item_line_info.order_serial = order_serial_promotions.serial_number
  AND item_line_info.order_timestamp >= order_serial_promotions.promotion_started_at
  AND item_line_info.order_timestamp < coalesce(order_serial_promotions.promotion_ended_at, current_timestamp)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serial_info
  ON serial_info.serial_number = item_line_info.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history` AS price_history
  ON price_history.serial_number = item_line_info.serial_number
  AND price_history.valid_from <= item_line_info.order_timestamp
  AND item_line_info.order_timestamp < price_history.valid_to
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_crossdock_ship_costs` AS shipping_from_crossdock
  ON shipping_from_crossdock.crossdock_reference = item_line_info.crossdock_reference
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_fulfillment_ship_costs` AS shipping_from_fulfillment
  ON shipping_from_fulfillment.tracking_number = item_line_info.tracking_number_from_fulfillment
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_private_client_email_stylist_history` AS private_client_history
    ON lower(item_line_info.customer_email) = private_client_history.email_address
    AND private_client_history.valid_from <= item_line_info.order_timestamp
    AND item_line_info.order_timestamp < private_client_history.valid_to
  LEFT JOIN (
    SELECT
        email_address
      , string_agg(DISTINCT private_client_customer_id, '; ') AS private_client_customer_id
      , min(valid_from) AS first_valid_from
      , max(valid_to) AS last_valid_to
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_private_client_email_stylist_history`
    GROUP BY 1
  ) AS private_clients
    ON lower(item_line_info.customer_email) = private_clients.email_address
  LEFT JOIN (
    SELECT
        original_serial
      , string_agg(DISTINCT serial_number, ', ') AS new_serial_from_return
      , string_agg(DISTINCT serial_relationship, ', ') AS new_serial_inventory_relationship
      , string_agg(DISTINCT original_intake_id, ', ') AS return_intake_id
      , min(original_intake_creation_nyc) AS return_intake_creation_nyc
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
    WHERE original_serial IS NOT NULL
    GROUP BY 1
  ) AS new_serials
  ON item_line_info.issued_serial = new_serials.original_serial
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_journal_after_dispatch` AS journal_after_dispatch
    ON item_line_info.x3_order_id = journal_after_dispatch.x3_order_id
    AND item_line_info.x3_order_line = journal_after_dispatch.x3_order_line
    AND item_line_info.serial_number = journal_after_dispatch.serial_number
  );
    