SELECT
    sol.*

/* shipping attributes breakdown by crossdock_reference/ tracking_number_from_fulfillment */
  , sol.total_ship_cost_from_fulfillment / fulfill_tracking_window.count_fulfill_tracking AS ship_cost_from_fulfillment
  , sol.total_p2p_ship_cost / fulfill_tracking_window.count_fulfill_tracking AS p2p_ship_cost
  , sol.total_dhl_ship_cost / fulfill_tracking_window.count_fulfill_tracking AS dhl_ship_cost
  , sol.total_cap_invoiced_ship_cost / fulfill_tracking_window.count_fulfill_tracking AS cap_invoiced_ship_cost
  , sol.total_fedex_ship_cost / fulfill_tracking_window.count_fulfill_tracking AS fedex_ship_cost
  , sol.total_dhl_customs_cost / fulfill_tracking_window.count_fulfill_tracking AS dhl_customs_cost
  , sol.total_dhl_duties_cost / fulfill_tracking_window.count_fulfill_tracking AS dhl_duties_cost
  , sol.total_fps_ship_cost / fulfill_tracking_window.count_fulfill_tracking AS fps_ship_cost
  , sol.total_ship_cost_from_crossdock / crossdock_reference_window.count_crossdock_reference AS ship_cost_from_crossdock
  , sol.total_zebra_ship_cost / crossdock_reference_window.count_crossdock_reference AS zebra_ship_cost
  , sol.total_tmall_b2c_ship_cost / crossdock_reference_window.count_crossdock_reference AS tmall_b2c_ship_cost
  , sol.total_flow_ship_cost / crossdock_reference_window.count_crossdock_reference AS flow_ship_cost
  , sol.total_tmall_b2c_duties_cost / crossdock_reference_window.count_crossdock_reference AS tmall_b2c_duties_cost
  , sol.total_flow_duties_cost / crossdock_reference_window.count_crossdock_reference AS flow_duties_cost

  , (sol.total_cap_confirmation_ship_cost / count_fulfill_tracking) AS cap_confirmed_ship_cost
  , CASE WHEN sol.sales_channel = 'Farfetch' THEN (sol.external_order_duties / count_mag_order) END AS delivery_duty_paid
  , CASE WHEN sol.sales_channel = 'Tmall' THEN sol.external_order_shipping_price - sol.external_order_shipping_discount END AS tmall_order_shipping
  , coalesce(sol.total_ship_cost_from_fulfillment / count_fulfill_tracking, 0)
      + coalesce(sol.total_ship_cost_from_crossdock / count_crossdock_reference, 0) AS ship_cost
  , (
  CASE
    WHEN sol.dispatch_date IS NULL THEN cast(NULL AS date)
    WHEN sol.receipt_date_is_dispatch_date THEN cast( 

        datetime_add(
            cast( sol.dispatch_date as datetime),
        interval 0 day
        )

 AS date)
    WHEN sol.dispatch_date < '2021-01-01' THEN
      CASE
        WHEN sol.geography_type = 'Domestic'
        THEN cast( 

        datetime_add(
            cast( sol.dispatch_date as datetime),
        interval 2 day
        )

 AS date)
        ELSE cast( 

        datetime_add(
            cast( sol.dispatch_date as datetime),
        interval 4 day
        )

 AS date)
      END
    ELSE
      CASE
        WHEN sol.geography_type = 'Domestic'
        THEN cast( 

        datetime_add(
            cast( sol.dispatch_timestamp_nyc as datetime),
        interval 72 hour
        )

 AS date)
        ELSE cast( 

        datetime_add(
            cast( sol.dispatch_timestamp_nyc as datetime),
        interval 84 hour
        )

 AS date)
      END
    END
) AS receipt_date
  , substr(
    concat(
    
      coalesce(sol.shipping_city|| ', ' , '')
    
      , coalesce(sol.geography|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(sol.shipping_city|| ', ' , '')
    
      , coalesce(sol.geography|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
) AS customer_city
  , CASE
      WHEN sol.tracking_number IS NOT NULL THEN cast(1 AS float64 ) / tracking_window.count_tracking
      WHEN sol.business_unit = 'Store' THEN cast(1 AS float64 ) / stadium_order_id_window.count_stadium_order
      ELSE 0
    END AS packaging_cost

/* price attributes */
  , CASE
  	WHEN coalesce(sol.line_item_discount_raw, 0) > 0
  	THEN coalesce(nullif(sol.line_item_price_raw, 0), nullif(sol.line_item_original_price, 0), nullif(sol.order_serial_price, 0))
  	ELSE nullif(
     greatest(
      coalesce(nullif(
     greatest(
      coalesce(sol.order_serial_price, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(sol.line_item_original_price, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(coalesce(nullif(sol.line_item_price_raw, 0), nullif(sol.line_item_original_price, 0), sol.order_serial_price, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  )
     END AS line_item_price
  , CASE
  	WHEN coalesce(sol.line_item_discount_raw, 0) > 0
  	THEN sol.line_item_discount_raw
  	ELSE nullif(
     greatest(
      coalesce(nullif(
     greatest(
      coalesce(sol.order_serial_price, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(sol.line_item_original_price, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  )- coalesce(nullif(sol.line_item_price_raw, 0), nullif(sol.line_item_original_price, 0), sol.order_serial_price, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  )
    END AS line_item_discount
  , sol.line_item_original_price AS original_price
  , sol.line_item_price_raw AS price
  , sol.line_item_discount_raw + sol.line_shipping_discount AS discount
  , sol.line_shipping_price AS shipping
  , (sol.line_item_tax + sol.line_shipping_tax) AS tax
  , (sol.line_item_store_credit_applied + sol.line_shipping_store_credit_applied) AS store_credit
  , CAST((sol.mag_order_refunded / count_mag_order) AS float64)  AS payment_refunded
  , CAST(coalesce((0 / count_mag_order), 0) AS float64) AS store_credit_refunded
  , CAST((sol.mag_order_store_credit / count_mag_order) AS float64) AS store_credit_created
  , sol.linkshare_total_commission * coalesce(
  	 coalesce(nullif(sol.line_item_price_raw, 0), nullif(sol.line_item_original_price, 0), nullif(sol.order_serial_price, 0)) / nullif(sum(coalesce(nullif(sol.line_item_price_raw, 0), nullif(sol.line_item_original_price, 0), nullif(sol.order_serial_price, 0))) OVER (PARTITION BY sol.stadium_order_id), 0)
  	 , CAST(1 AS float64) / count_stadium_order
  	) AS linkshare_commission

/* order attributes */
  , CASE WHEN sol.is_for_a_customer OR sol.dispatch_date IS NOT NULL THEN 1 ELSE 0 END AS gmv
  , CASE WHEN sol.is_for_a_customer AND sol.dispatch_date IS NULL AND NOT sol.is_closed THEN 1 ELSE 0 END AS `open`
  , CASE WHEN sol.dispatch_date IS NOT NULL OR (sol.is_for_a_customer AND sol.dispatch_date IS NULL AND NOT sol.is_closed) THEN 1 ELSE 0 END AS sales
  , CASE WHEN sol.is_return IS TRUE THEN 1 ELSE 0 END AS `returns`
  , sol.channel_or_gateway AS channel_detail
  , sol.business_unit AS channel_group
  , sol.sales_channel AS channel
  , sol.inventory_seller AS consignor_id
  , sol.inventory_type AS consignor_type
  , sol.yseristatus_issue_date AS issue_date
  , CASE WHEN sol.inventory_relationship = '1P' THEN 0 ELSE sol.inventory_cost END AS payout_amount
  , CASE WHEN sol.inventory_relationship = '1P' THEN sol.inventory_cost ELSE 0 END AS purchase_price
  , sol.inventory_relationship AS owned_vs_marketplace
  , sol.inventory_source AS serial_source

/* order_line count */
  , stadium_order_id_window.count_stadium_order AS total_order_lines
  , stadium_order_id_window.count_creditmemo AS order_lines_with_creditmemo
  , stadium_order_id_window.count_refund AS order_lines_with_refund_expected
  , row_number() OVER (PARTITION BY sol.stadium_order_id, sol.product_sku, sol.variant_size, sol.inventory_source ORDER BY sol.order_item_id, sol.x3_order_id, sol.x3_order_line) AS order_sku_size_source_line
  , row_number() OVER (PARTITION BY sol.stadium_order_id, sol.simple_sku ORDER BY sol.order_item_id, sol.x3_order_id, sol.x3_order_line) AS order_simple_sku_line
  , CASE WHEN sol.order_item_id IS NOT NULL THEN row_number() OVER (PARTITION BY sol.order_item_id ORDER BY sol.x3_order_id, sol.x3_order_line) END AS order_item_line
  , CASE WHEN sol.x3_order_line IS NOT NULL THEN row_number() OVER (PARTITION BY sol.x3_order_id, sol.x3_order_line) END AS line_row
  , CASE WHEN sol.x3_order_line IS NOT NULL THEN x3_order_window.count_x3_order END AS line_row_count
  , current_timestamp rebuild_timestamp

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_returns_logic` AS sol
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_fulfill_tracking_window` AS fulfill_tracking_window USING (tracking_number_from_fulfillment)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_crossdock_reference_window` AS crossdock_reference_window USING (crossdock_reference)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_tracking_window` AS tracking_window USING (tracking_number)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_stadium_order_id_window` AS stadium_order_id_window USING (stadium_order_id)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_mag_order_id_window` AS mag_order_id_window USING (mag_order_id)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_x3_order_window` AS x3_order_window USING (x3_order_id, x3_order_line)