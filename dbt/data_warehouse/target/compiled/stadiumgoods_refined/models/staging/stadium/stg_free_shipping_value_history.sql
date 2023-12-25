WITH history_union AS (

  SELECT
      channel_or_gateway
    , shipping_is_express
    , shipping_is_international
    , free_shipping_value_source
    , free_shipping_value
    , coalesce(valid_from, cast('1970-01-01 00:00:00' AS timestamp)) AS valid_from
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_free_shipping_value_history`
  WHERE free_shipping_value_source = 'lookup_free_shipping_value_history'
  UNION ALL
  SELECT
      free_shipping_value_history.channel_or_gateway
    , free_shipping_value_history.shipping_is_express
    , free_shipping_value_history.shipping_is_international
    , free_shipping_value_history.free_shipping_value_source
    , upcharge_history.upcharge_value AS free_shipping_value
    , upcharge_history.valid_from
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_free_shipping_value_history` AS free_shipping_value_history
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history` AS upcharge_history
    USING (channel_or_gateway)
  WHERE free_shipping_value_history.free_shipping_value_source = 'match flat upcharge'
    AND upcharge_history.upcharge_type = 'flat'

)

SELECT
    *
  , coalesce(
  

timestamp_add(cast( lead(valid_from) OVER (
  PARTITION BY channel_or_gateway, shipping_is_express, shipping_is_international
  ORDER BY valid_from
) as timestamp),
        interval -1 second)


, cast('2038-01-19 03:14:08' AS timestamp)) AS valid_to
FROM history_union