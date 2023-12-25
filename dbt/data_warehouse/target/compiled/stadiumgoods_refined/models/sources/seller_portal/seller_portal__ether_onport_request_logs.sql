









 

SELECT
      `_raw_id`
    , `_raw_path`
    , `_raw_truncated_path`
    , `_raw_payload`
    , `_raw_ip_address`
    , `_raw_uuid`
    , `_raw_created_at`
    , `_raw_updated_at`
    , `_raw_response_code`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT

    `id` AS `_raw_id`

  , `path` AS `_raw_path`

  , `truncated_path` AS `_raw_truncated_path`

  , `payload` AS `_raw_payload`

  , `ip_address` AS `_raw_ip_address`

  , `uuid` AS `_raw_uuid`

  , `created_at` AS `_raw_created_at`

  , `updated_at` AS `_raw_updated_at`

  , `response_code` AS `_raw_response_code`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_request_logs` AS source_table

 ) AS un_ordered

