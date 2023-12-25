WITH mercaux_orders AS (

  SELECT
    mercaux_order.`mercaux_order_id`,
  mercaux_order.`mercaux_order_status`,
  mercaux_order.`order_data`,
  mercaux_order.`reserved_at`,
  mercaux_order.`purchased_at`,
  mercaux_order.`cancelled_at`,
  mercaux_order.`updated_at`,
  mercaux_order.`created_at`,
  mercaux_order.`mercaux_customer_id`,
  mercaux_order.`order_total_amount_in_cents`,
  mercaux_order.`order_total_currency_code`,
  mercaux_order.`employee`,
  mercaux_order.`mercaux_store_id`,
  mercaux_order.`total_tax_amount_in_cents`,
  mercaux_order.`total_tax_currency_code`,
  mercaux_order.`_synched_from_source_at`,
  mercaux_order.`order_total_amount`,
  mercaux_order.`total_tax_amount`,
  mercaux_order.`_raw_shipping_cost_amount`,
  mercaux_order.`_raw_shipping_cost_currency_code`,
  mercaux_order.`_raw_external_order_id`,
  mercaux_order.`_raw_payment_type`,
  mercaux_order.`_raw_cash_tendered_amount`,
  mercaux_order.`_raw_cash_tendered_currency_code`,
  mercaux_order.`_raw_cash_change_amount`,
  mercaux_order.`_raw_cash_change_currency_code`,
  mercaux_order.`_raw_discounted_order_sub_total_amount`,
  mercaux_order.`_raw_discounted_order_sub_total_currency_code`,
  mercaux_order.`_raw_discount_amount_amount`,
  mercaux_order.`_raw_discount_amount_currency_code`,
  mercaux_order.`_raw_shipping_type`,
  mercaux_order.`_raw_device_name`,
  mercaux_order.`_raw_order_shipment_status`,
  mercaux_order.`_raw_can_cancel`,
  mercaux_order.`_raw_can_return`,
  mercaux_order.`_raw_receipt_email`,
  mercaux_order.`_raw_email_receipt`,
  mercaux_order.`_raw_gift_receipt`,
  mercaux_order.`_raw_order_sub_total_amount`,
  mercaux_order.`_raw_order_sub_total_currency_code`
    , coalesce(
          mercaux_store.mercaux_store_name
        , mercaux_order.mercaux_store_name
      ) AS mercaux_store_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_order` AS mercaux_order
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_store_address` AS mercaux_store
    ON mercaux_order.mercaux_store_id = mercaux_store.mercaux_store_id

), imported_orders AS (

  SELECT
      mercaux_order_id
    , transaction_id
    , imported_order_location
    , sales_flat_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__imported_order`
  WHERE channel = 'mercaux'

), order_warehouses AS (

    SELECT
        order_serials.mercaux_order_id
      , sum(CASE
          WHEN coalesce(mercaux_orders.mercaux_store_name, imported_orders.imported_order_location) = 'CHI'
          THEN CASE WHEN coalesce(order_serials.warehouse, '') NOT IN ('CHI', 'CHR', '') THEN 1 ELSE 0 END
          ELSE CASE WHEN coalesce(order_serials.warehouse, '') NOT IN ('SGD', 'NYR', '') THEN 1 ELSE 0 END
        END) > 0 AS is_mercaux_omni
      , string_agg(DISTINCT order_serials.warehouse, ', ') AS order_warehouse
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_order_serial` AS order_serials
    LEFT JOIN mercaux_orders
      ON order_serials.mercaux_order_id = mercaux_orders.mercaux_order_id
    LEFT JOIN imported_orders
      ON order_serials.mercaux_order_id = imported_orders.mercaux_order_id
    GROUP BY 1

), final AS (

  SELECT
      coalesce(
          imported_orders.transaction_id
        , 'Mercaux order #' || cast(mercaux_orders.mercaux_order_id AS string )
      ) AS transaction_id
    , sales_flat_order.mag_order_id
    , CASE
        WHEN sales_flat_order.mag_order_id IS NOT NULL
        THEN CAST('Approved' AS string)
        ELSE CAST('Not Approved' AS string)
      END AS checkout_status
    , CAST('Sales Channel' AS string) AS data_source
    , CAST('Not Settled' AS string) AS transaction_state
    , mercaux_orders.order_total_amount AS payment_amount
    , mercaux_orders.created_at AS payment_processed_at
    , CAST(NULL AS float64) AS payment_fee
    , CASE WHEN mercaux_orders.cancelled_at IS NOT NULL THEN mercaux_orders.order_total_amount END AS refund_amount
    , mercaux_orders.cancelled_at AS refund_processed_at
    , CAST(NULL AS float64) AS refund_fee
    , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS settlement_date
    , mercaux_orders.updated_at AS file_time
    , current_timestamp AS rebuild_timestamp
    , CASE
        WHEN coalesce(mercaux_orders.mercaux_store_name, imported_orders.imported_order_location) = 'CHI'
        THEN cast('CHI' AS string)
        ELSE cast('SGD' AS string)
      END AS order_store
    , order_warehouses.order_warehouse
    , order_warehouses.is_mercaux_omni
    , cast(
        'Mercaux '
          || CASE WHEN order_warehouses.is_mercaux_omni IS TRUE THEN 'Omni ' ELSE '' END
          || CASE WHEN coalesce(mercaux_orders.mercaux_store_name, imported_orders.imported_order_location) = 'CHI' THEN '(Chicago)' ELSE '(Soho)' END
        AS string) AS channel_or_gateway
    , CASE
        WHEN coalesce(mercaux_orders.mercaux_store_name, imported_orders.imported_order_location) = 'CHI'
        THEN cast('Chicago Store' AS string)
        ELSE cast('SG Store' AS string)
      END AS sales_channel
  FROM mercaux_orders
  LEFT JOIN imported_orders
    ON mercaux_orders.mercaux_order_id = imported_orders.mercaux_order_id
  LEFT JOIN order_warehouses
    ON mercaux_orders.mercaux_order_id = order_warehouses.mercaux_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sales_flat_order
    ON imported_orders.sales_flat_order_id = sales_flat_order.sales_flat_order_id

)

SELECT * FROM final