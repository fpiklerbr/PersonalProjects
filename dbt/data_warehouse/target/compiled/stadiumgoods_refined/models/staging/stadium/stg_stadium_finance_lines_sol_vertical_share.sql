/*
  TODO for DE-3487: update docs
*/





SELECT *
  , (
        order_total_item_price
      + order_total_item_tax
      - order_total_item_discount
      - order_total_item_store_credit_applied
      + order_shipping_price
      + order_shipping_tax
      - order_shipping_discount
      - order_shipping_store_credit_applied
      + order_duties
    ) AS expected_order_payment
, (
        order_total_item_price
      + order_total_item_tax
      + order_shipping_price
      + order_shipping_tax
      + order_duties
  ) AS expected_order_gtv
FROM (

  SELECT stadium_order_lines.*
    , last_transaction_by_channel_or_gateway.last_payment_timestamp_nyc

    
    , coalesce(
          (stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax + stadium_order_lines.line_shipping_price + stadium_order_lines.line_shipping_tax) / stadium_line_sum_of_order_gtv
        , CAST(1 AS numeric) / stadium_order_lines.total_order_lines
      ) AS line_share_of_order_gtv
    
    , coalesce(
          (stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax - stadium_order_lines.line_item_discount - stadium_order_lines.line_item_store_credit_applied + stadium_order_lines.line_shipping_price + stadium_order_lines.line_shipping_tax - stadium_order_lines.line_shipping_discount - stadium_order_lines.line_shipping_store_credit_applied) / stadium_line_sum_of_payment
        , CAST(1 AS numeric) / stadium_order_lines.total_order_lines
      ) AS line_share_of_payment
    
    , coalesce(
          (stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax - stadium_order_lines.line_item_discount + stadium_order_lines.line_shipping_price + stadium_order_lines.line_shipping_tax - stadium_order_lines.line_shipping_discount) / stadium_line_sum_of_payment_and_credit_redeemed
        , CAST(1 AS numeric) / stadium_order_lines.total_order_lines
      ) AS line_share_of_payment_and_credit_redeemed
    
    , coalesce(
          (stadium_order_lines.line_item_price) / stadium_line_sum_of_order_total_item_price
        , CAST(1 AS numeric) / stadium_order_lines.total_order_lines
      ) AS line_share_of_order_total_item_price
    
    , coalesce(
          (stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax - stadium_order_lines.line_item_discount - stadium_order_lines.line_item_store_credit_applied) / stadium_line_sum_of_order_total_item_payment
        , CAST(1 AS numeric) / stadium_order_lines.total_order_lines
      ) AS line_share_of_order_total_item_payment
    

    , CAST(1 AS numeric) / stadium_order_lines.total_order_lines AS line_share_of_order_shipping -- for shipping price, tax & discount

    
      
      
        , coalesce(
              stadium_order_lines.external_order_total_item_price
            , sol_window.stadium_total_item_price
          ) AS order_total_item_price
      
        , coalesce(
              stadium_order_lines.external_order_total_item_tax
            , sol_window.stadium_total_item_tax
          ) AS order_total_item_tax
      
        , coalesce(
              stadium_order_lines.external_order_total_item_discount
            , sol_window.stadium_total_item_discount
          ) AS order_total_item_discount
      
      , sol_window.order_total_item_store_credit_applied
    
      
      
        , coalesce(
              stadium_order_lines.external_order_shipping_price
            , sol_window.stadium_shipping_price
          ) AS order_shipping_price
      
        , coalesce(
              stadium_order_lines.external_order_shipping_tax
            , sol_window.stadium_shipping_tax
          ) AS order_shipping_tax
      
        , coalesce(
              stadium_order_lines.external_order_shipping_discount
            , sol_window.stadium_shipping_discount
          ) AS order_shipping_discount
      
      , sol_window.order_shipping_store_credit_applied
    

    , coalesce(stadium_order_lines.external_order_duties, 0) AS order_duties

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS stadium_order_lines
  LEFT JOIN (
    SELECT DISTINCT mag_order_id FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_transactions`
  ) AS farfetch_fps_orders
    ON stadium_order_lines.mag_order_id = farfetch_fps_orders.mag_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_sol_window` AS sol_window
    USING (stadium_order_id)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_last_payment_by_channel` AS last_transaction_by_channel_or_gateway
    ON stadium_order_lines.channel_or_gateway = last_transaction_by_channel_or_gateway.channel_or_gateway
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_order_payments` AS order_payments
    ON stadium_order_lines.mag_order_id = order_payments.mag_order_id
  WHERE stadium_order_lines.business_unit IN ('DTC', 'Omnichannel', 'Store')
  AND farfetch_fps_orders.mag_order_id IS NULL
  AND
  (
    stadium_order_lines.issued_serial IS NOT NULL
    OR stadium_order_lines.mag_order_store_credit_applied > 0
    OR (stadium_order_lines.checkout_type = 'Active' AND stadium_order_lines.order_creation_nyc > last_transaction_by_channel_or_gateway.last_payment_timestamp_nyc)
    OR order_payments.mag_order_id IS NOT NULL
  )
  AND
  (
    stadium_order_lines.is_for_a_customer = TRUE
    OR (stadium_order_lines.serial_order_match = TRUE AND stadium_order_lines.dispatch_date IS NOT NULL)
  )
  AND order_payments.is_excluded_from_financial_reporting IS NOT TRUE
  AND stadium_order_lines.stadium_order_id <> 'SOICHI015454'

) sol_vertical_share