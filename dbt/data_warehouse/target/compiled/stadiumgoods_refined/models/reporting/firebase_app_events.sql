


WITH base AS (

  SELECT
     event_date
   , event_timestamp
   , event_name
   , ARRAY(
      SELECT
        STRUCT(
            JSON_EXTRACT_SCALAR(split_items, '$.key') AS key
    , CONCAT(
      ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.string_value') ,'')
    , ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.int_value'),'')
    , ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.float_value'),'')
    , ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.double_value'),'')
      ) AS values
        )
      FROM (
        SELECT CONCAT('{', REGEXP_REPLACE(split_items, r'^\[{|}\]$', ''), '}') AS split_items
        FROM UNNEST(split(JSON_EXTRACT(to_json_string(event_params), '$'), '},{')) AS split_items
      )
     ) AS event_params
   , event_previous_timestamp
   , event_value_in_usd
   , event_bundle_sequence_id
   , event_server_timestamp_offset
   , user_id
   , user_pseudo_id
   , ARRAY(
      SELECT
        STRUCT(
         JSON_EXTRACT_SCALAR(split_items, '$.key') AS key
    , CONCAT(
      ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.string_value') ,'')
    , ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.int_value'),'')
    , ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.float_value'),'')
    , ifnull(JSON_EXTRACT_SCALAR(split_items, '$.value.double_value'),'')
      ) AS values
          , TIMESTAMP_MICROS(CAST(
              JSON_EXTRACT_SCALAR(split_items, '$.value.set_timestamp_micros') AS int64
              )
            ) AS set_timestamp
        )
      FROM (
        SELECT CONCAT('{', REGEXP_REPLACE(split_items, r'^\[{|}\]$', ''), '}') AS split_items
        FROM UNNEST(split(JSON_EXTRACT(to_json_string(user_properties), '$'), '},{')) AS split_items
      )
     ) AS user_properties
   , user_first_touch_timestamp
   , stream_id
   , platform, privacy_info.analytics_storage AS privacy_info_analytics_storage, privacy_info.ads_storage AS privacy_info_ads_storage, privacy_info.uses_transient_token AS privacy_info_uses_transient_token, user_ltv.revenue AS user_ltv_revenue, user_ltv.currency AS user_ltv_currency, device.category AS device_category, device.mobile_brand_name AS device_mobile_brand_name, device.mobile_model_name AS device_mobile_model_name, device.mobile_marketing_name AS device_mobile_marketing_name, device.mobile_os_hardware_model AS device_mobile_os_hardware_model, device.operating_system AS device_operating_system, device.operating_system_version AS device_operating_system_version, device.vendor_id AS device_vendor_id, device.advertising_id AS device_advertising_id, device.language AS device_language, device.is_limited_ad_tracking AS device_is_limited_ad_tracking, device.time_zone_offset_seconds AS device_time_zone_offset_seconds, device.browser AS device_browser, device.browser_version AS device_browser_version, geo.continent AS geo_continent, geo.country AS geo_country, geo.region AS geo_region, geo.city AS geo_city, geo.sub_continent AS geo_sub_continent, geo.metro AS geo_metro, app_info.id AS app_info_id, app_info.version AS app_info_version, app_info.install_store AS app_info_install_store, app_info.firebase_app_id AS app_info_firebase_app_id, app_info.install_source AS app_info_install_source, traffic_source.name AS traffic_source_name, traffic_source.medium AS traffic_source_medium, traffic_source.source AS traffic_source_source, ecommerce.total_item_quantity AS total_item_quantity, ecommerce.purchase_revenue_in_usd AS purchase_revenue_in_usd, ecommerce.purchase_revenue AS purchase_revenue, ecommerce.refund_value_in_usd AS refund_value_in_usd, ecommerce.refund_value AS refund_value, ecommerce.shipping_value_in_usd AS shipping_value_in_usd, ecommerce.shipping_value AS shipping_value, ecommerce.tax_value_in_usd AS tax_value_in_usd, ecommerce.tax_value AS tax_value, ecommerce.unique_items AS unique_items, ecommerce.transaction_id AS transaction_id, event_dimensions.hostname AS event_dimensions_hostname
  , device.web_info.browser AS device_web_info_browser
  , device.web_info.browser_version AS device_web_info_browser_version
  , device.web_info.hostname AS device_web_info_hostname
  , items
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`firebase__app_events` AS source

)

SELECT * FROM base
ORDER BY event_timestamp DESC