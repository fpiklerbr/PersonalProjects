





 

SELECT
      `_raw_id`
    , `_raw_resource_type`
    , `_raw_request_payload`
    , `_raw_created_at`
    , `_raw_updated_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT

    `id` AS `_raw_id`

  , `resource_type` AS `_raw_resource_type`

  , `request_payload` AS `_raw_request_payload`

  , `created_at` AS `_raw_created_at`

  , `updated_at` AS `_raw_updated_at`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_publication_confirmations` AS source_table

 ) AS un_ordered

