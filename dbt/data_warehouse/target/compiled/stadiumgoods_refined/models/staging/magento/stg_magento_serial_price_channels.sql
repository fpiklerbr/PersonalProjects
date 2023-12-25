WITH channel_names AS (

  SELECT
      order_channel
    , channel_name
    , `serializedproduct_product_serial_price_channel_id`,
  `slug`,
  `conditional_status`,
  `created_at`,
  `upcharge_flat`,
  `upcharge_percentage`,
  `min_qty_to_push_threshold`,
  `qty_cap_type`,
  `qty_cap`,
  `allotted_reservation_time_in_minutes`,
  `channel_type`,
  `_synched_from_source_at`
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_price_chl`
  UNION ALL
  SELECT
      order_channel
    , cast('Farfetch / FPS' AS string) AS channel_name
    , `serializedproduct_product_serial_price_channel_id`,
  `slug`,
  `conditional_status`,
  `created_at`,
  `upcharge_flat`,
  `upcharge_percentage`,
  `min_qty_to_push_threshold`,
  `qty_cap_type`,
  `qty_cap`,
  `allotted_reservation_time_in_minutes`,
  `channel_type`,
  `_synched_from_source_at`
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_price_chl`
  WHERE order_channel = 'farfetch'
  UNION ALL
  SELECT
      order_channel
    , cast('Farfetch / FPS' AS string) AS channel_name
    , `serializedproduct_product_serial_price_channel_id`,
  `slug`,
  `conditional_status`,
  `created_at`,
  `upcharge_flat`,
  `upcharge_percentage`,
  `min_qty_to_push_threshold`,
  `qty_cap_type`,
  `qty_cap`,
  `allotted_reservation_time_in_minutes`,
  `channel_type`,
  `_synched_from_source_at`
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_price_chl`
  WHERE order_channel = 'farfetch_sg_dtc'

), final AS (

  SELECT
      channel_names.*
    , lookup_channels.channel_or_gateway
  FROM channel_names
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_channels` AS lookup_channels
    ON channel_names.order_channel = lookup_channels.order_channel

)

SELECT * FROM final