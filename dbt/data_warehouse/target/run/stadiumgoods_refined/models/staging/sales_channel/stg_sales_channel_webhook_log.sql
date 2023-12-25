
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_sales_channel_webhook_log` as DBT_INTERNAL_DEST
        using (
           



WITH increment_records AS (

  SELECT
    webhook_log_id
  , webhook_log_type
  , webhook_log_created_at
  , channel
  , (JSON_EXTRACT_SCALAR(payload, '$.event_id'
  ))
 AS event_id
  , (JSON_EXTRACT_SCALAR(payload, '$.order.number'
  ))
 AS order_number
  , 
    safe_cast(JSON_EXTRACT_SCALAR(payload, '$.timestamp'
  ) as timestamp)
 AS timestamp_utc
  , (JSON_EXTRACT_SCALAR(payload, '$.organization'
  ))
 AS organization
  , (JSON_EXTRACT_SCALAR(payload, '$.order.id'
  ))
 AS global_id
  , (JSON_EXTRACT(payload, '$.order.prices'
  ))
 AS prices
  , _synched_from_source_at
  FROM  `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__webhook_log` AS webhook_log
  WHERE webhook_log_type = 'order_upserted_v2'
  AND channel = 'flow'


        -- on UPSERT the most recent synced records from base model
    AND webhook_log.webhook_log_id > (SELECT max(webhook_log_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_sales_channel_webhook_log`)



), parsed_jsonb AS (SELECT
    increment_records.*
    , CAST(keys AS string) AS keys
   FROM increment_records, UNNEST(JSON_EXTRACT_ARRAY(CAST(prices AS string))) AS keys

), key_value AS (

  SELECT
    parsed_jsonb.webhook_log_id
  , parsed_jsonb.webhook_log_type
  , parsed_jsonb.channel
  , parsed_jsonb.event_id
  , parsed_jsonb.order_number
  , parsed_jsonb.timestamp_utc
  , parsed_jsonb.organization
  , parsed_jsonb.global_id
  , parsed_jsonb.webhook_log_created_at
  , parsed_jsonb._synched_from_source_at
  , (JSON_EXTRACT_SCALAR(keys, '$.key'
  ))
  as payment_component
  , (JSON_EXTRACT_SCALAR(keys, '$.currency'
  ))
 as currency
  , (JSON_EXTRACT_SCALAR(keys, '$.amount'
  ))
  as amount
  , (JSON_EXTRACT_SCALAR(keys, '$.base.amount'
  ))
 as base_amount
  , (JSON_EXTRACT_SCALAR(keys, '$.base.currency'
  ))
 as base_currency
  FROM  parsed_jsonb

), price_attr AS (

  SELECT DISTINCT
    key_value.webhook_log_id
  , key_value.webhook_log_type
  , key_value.webhook_log_created_at
  , key_value.channel
  , key_value.event_id
  , key_value.order_number
  , key_value.timestamp_utc
  , key_value.global_id
  , key_value.organization
  , key_value._synched_from_source_at
  , CAST(coalesce(CAST(subtotal_tbl.base_amount AS float64),0) AS float64)  as base_subtotal
  , CAST(coalesce(CAST(vat_tbl.base_amount AS float64),0) AS float64 ) as base_vat
  , CAST(coalesce(CAST(duty_tbl.base_amount AS float64),0) AS float64 ) as base_duty
  , CAST(coalesce(CAST(shipping_tbl.base_amount AS float64),0) AS float64 ) as base_shipping
  , CAST(coalesce(CAST(charges_tbl.base_amount AS float64),0) AS float64 ) as base_surcharges
  FROM key_value
  LEFT JOIN (SELECT webhook_log_id, base_amount FROM key_value WHERE payment_component = 'subtotal') AS subtotal_tbl USING(webhook_log_id)
  LEFT JOIN (SELECT webhook_log_id, base_amount FROM key_value WHERE payment_component = 'vat') AS vat_tbl USING (webhook_log_id)
  LEFT JOIN (SELECT webhook_log_id, base_amount FROM key_value WHERE payment_component = 'duty') AS duty_tbl USING (webhook_log_id)
  LEFT JOIN (SELECT webhook_log_id, base_amount FROM key_value WHERE payment_component = 'shipping') AS shipping_tbl USING (webhook_log_id)
  LEFT JOIN (SELECT webhook_log_id, base_amount FROM key_value WHERE payment_component = 'surcharges') AS charges_tbl USING (webhook_log_id)

)


SELECT * FROM price_attr
         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`webhook_log_id`, `webhook_log_type`, `webhook_log_created_at`, `channel`, `event_id`, `order_number`, `timestamp_utc`, `global_id`, `organization`, `_synched_from_source_at`, `base_subtotal`, `base_vat`, `base_duty`, `base_shipping`, `base_surcharges`)
    values
        (`webhook_log_id`, `webhook_log_type`, `webhook_log_created_at`, `channel`, `event_id`, `order_number`, `timestamp_utc`, `global_id`, `organization`, `_synched_from_source_at`, `base_subtotal`, `base_vat`, `base_duty`, `base_shipping`, `base_surcharges`)


  