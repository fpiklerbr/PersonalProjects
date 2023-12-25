








 

SELECT
      `_raw_id`
    , `_raw_publication_confirmation_id`
    , `_raw_status`
    , `_raw_external_id`
    , `_raw_resource_type`
    , `_raw_response_payload`
    , `_raw_created_at`
    , `_raw_updated_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT

    `id` AS `_raw_id`

  , `publication_confirmation_id` AS `_raw_publication_confirmation_id`

  , `status` AS `_raw_status`

  , `external_id` AS `_raw_external_id`

  , `resource_type` AS `_raw_resource_type`

  , `response_payload` AS `_raw_response_payload`

  , `created_at` AS `_raw_created_at`

  , `updated_at` AS `_raw_updated_at`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_publication_confirmation_items` AS source_table

 ) AS un_ordered

