

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history_logged_changes`
  OPTIONS()
  as WITH logged_changes AS (

  SELECT
      amasty_audit_log.amasty_audit_log_id
    , amasty_audit_log_details.amasty_audit_log_detail_id
    , CASE
        WHEN amasty_audit_log.category = 'orderhq/smvtmalladmin_config'
        THEN cast('Tmall' AS string)
        ELSE amasty_audit_log.info
      END AS channel_name
    , CASE
        WHEN amasty_audit_log.category = 'orderhq/smvtmalladmin_config'
          THEN cast('TBD' AS string) -- no data in log, so unclear whether this is flat or percentage
        WHEN amasty_audit_log_details.attribute_name = 'percentage_upcharge'
          THEN cast('percentage' AS string)
        WHEN amasty_audit_log_details.attribute_name = 'flat_upcharge'
          THEN cast('flat' AS string)
      END AS upcharge_type
    , amasty_audit_log.log_time AS changed_at

    , CASE
        WHEN amasty_audit_log.category = 'orderhq/smvtmalladmin_config'
          THEN 
    safe_cast(JSON_EXTRACT_SCALAR(cast(amasty_audit_log_details.old_value AS string), '$.product.foreign_origin_price'
  ) as numeric)

        WHEN amasty_audit_log_details.attribute_name = 'percentage_upcharge'
          THEN cast(amasty_audit_log_details.old_value AS numeric) / 100
        ELSE
          cast(amasty_audit_log_details.old_value AS numeric)
      END AS old_value, CASE
        WHEN amasty_audit_log.category = 'orderhq/smvtmalladmin_config'
          THEN 
    safe_cast(JSON_EXTRACT_SCALAR(cast(amasty_audit_log_details.new_value AS string), '$.product.foreign_origin_price'
  ) as numeric)

        WHEN amasty_audit_log_details.attribute_name = 'percentage_upcharge'
          THEN cast(amasty_audit_log_details.new_value AS numeric) / 100
        ELSE
          cast(amasty_audit_log_details.new_value AS numeric)
      END AS new_value

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__amasty_audit_log` AS amasty_audit_log
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__amasty_audit_log_details` AS amasty_audit_log_details
    ON amasty_audit_log.amasty_audit_log_id = amasty_audit_log_details.amasty_audit_log_id
  WHERE (
    amasty_audit_log.category = 'orderhq/serializedproductadmin_product_serial_priceChannel'
    AND amasty_audit_log_details.attribute_name IN ('flat_upcharge', 'percentage_upcharge')
  )
    OR (
      amasty_audit_log.category = 'orderhq/smvtmalladmin_config'
      AND amasty_audit_log_details.attribute_name = 'config'
    )

), logged_changes_with_window AS (

  SELECT
      logged_changes.amasty_audit_log_id
    , logged_changes.amasty_audit_log_detail_id
    , serial_price_channels.channel_or_gateway
    , logged_changes.upcharge_type
    , row_number() OVER (
        PARTITION BY serial_price_channels.channel_or_gateway, logged_changes.upcharge_type
        ORDER BY logged_changes.changed_at
      ) AS log_sequence
    , logged_changes.changed_at
    , logged_changes.old_value
    , logged_changes.new_value
    , lead(logged_changes.changed_at) OVER (
        PARTITION BY serial_price_channels.channel_or_gateway, logged_changes.upcharge_type
        ORDER BY logged_changes.changed_at
      ) AS next_changed_at
  FROM logged_changes
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_serial_price_channels` AS serial_price_channels
    ON logged_changes.channel_name = serial_price_channels.channel_name

), final AS (

  SELECT
      amasty_audit_log_id
    , amasty_audit_log_detail_id
    , channel_or_gateway
    , upcharge_type
    , 0 AS log_sequence
    , old_value AS upcharge_value
    , NULL AS valid_from
    , 
  

timestamp_add(cast( changed_at as timestamp),
        interval -1 second)


 AS valid_to
  FROM logged_changes_with_window
  WHERE log_sequence = 1
    AND old_value IS NOT NULL
  UNION ALL
  SELECT
      amasty_audit_log_id
    , amasty_audit_log_detail_id
    , channel_or_gateway
    , upcharge_type
    , log_sequence
    , new_value AS upcharge_value
    , CASE
        WHEN log_sequence = 1 AND old_value IS NULL
        THEN NULL
        ELSE changed_at
      END AS valid_from
    ,
  

timestamp_add(cast( next_changed_at as timestamp),
        interval -1 second)


 AS valid_to
  FROM logged_changes_with_window

)

SELECT * FROM final;

