

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`mainfreight__customer_shipment_report`
  OPTIONS()
  as 

  































































 

SELECT   `accessorials`,  `actual_delivery_date`,  `actual_pickup_date`,  `consignee_address`,  `consignee_city`,  `consignee_code`,  `consignee_country`,  `consignee_name`,  `consignee_post_code`,  `consignee_state`,  `consignor_address`,  `consignor_city`,  `consignor_code`,  `consignor_country`,  `consignor_name`,  `consignor_post_code`,  `consignor_state_`,  `control_branch`,  `customer_code`,  `customer_name`,  `customs_cleared_date`,  `delivery_number`,  `destination`,  `destination_zone`,  `distance`,  `fees`,  `file_name`,  `file_time`,  `final_chargeable_weight_lbs_`,  `final_volume_ft3_`,  `final_weight_lbs_`,  `invoice_date`,  `invoice_id`,  `first_origin_atd`,  `freight`,  `fuel`,  `goods_description`,  `tracking_number`,  `inner_pieces`,  `inner_piece_type`,  `mileage`,  `motor_class`,  `nmfc_`,  `origin`,  `original_chargeable_weight_lbs_`,  `original_volume_ft3_`,  `original_weight_lbs_`,  `origin_zone`,  `other_charges`,  `other_ref_s`,  `outer_pieces`,  `outer_piece_type`,  `out_for_delivery`,  `payment_terms`,  `pickup_ready_to`,  `release_pickup_number`,  `required_delivery_by`,  `sales_representative`,  `service_level`,  `shipment_create_date`,  `signed_for_delivery`,  `total_cost`,  `transport_mode`,  `unnamed_61`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accessorials` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accessorials` AS string)), '') AS string) END as string)
 AS `accessorials`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`actual_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`actual_delivery_date` AS string)), '') AS string) END as string)
 AS `actual_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`actual_pickup_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`actual_pickup_date` AS string)), '') AS string) END as string)
 AS `actual_pickup_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_address` AS string)), '') AS string) END as string)
 AS `consignee_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_city` AS string)), '') AS string) END as string)
 AS `consignee_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_code` AS string)), '') AS string) END as string)
 AS `consignee_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_country` AS string)), '') AS string) END as string)
 AS `consignee_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_name` AS string)), '') AS string) END as string)
 AS `consignee_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_post_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_post_code` AS string)), '') AS string) END as string)
 AS `consignee_post_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_state` AS string)), '') AS string) END as string)
 AS `consignee_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_address` AS string)), '') AS string) END as string)
 AS `consignor_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_city` AS string)), '') AS string) END as string)
 AS `consignor_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_code` AS string)), '') AS string) END as string)
 AS `consignor_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_country` AS string)), '') AS string) END as string)
 AS `consignor_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_name` AS string)), '') AS string) END as string)
 AS `consignor_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_post_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_post_code` AS string)), '') AS string) END as string)
 AS `consignor_post_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_state_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_state_` AS string)), '') AS string) END as string)
 AS `consignor_state_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`control_branch` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`control_branch` AS string)), '') AS string) END as string)
 AS `control_branch`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_code` AS string)), '') AS string) END as string)
 AS `customer_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) END as string)
 AS `customer_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customs_cleared_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customs_cleared_date` AS string)), '') AS string) END as float64)
 AS `customs_cleared_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_number` AS string)), '') AS string) END as string)
 AS `delivery_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination` AS string)), '') AS string) END as string)
 AS `destination`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_zone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_zone` AS string)), '') AS string) END as string)
 AS `destination_zone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`distance` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`distance` AS string)), '') AS string) END as string)
 AS `distance`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fees` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fees` AS string)), '') AS string) END as string)
 AS `fees`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`final_chargeable_weight_lbs_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`final_chargeable_weight_lbs_` AS string)), '') AS string) END as string)
 AS `final_chargeable_weight_lbs_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`final_volume_ft3_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`final_volume_ft3_` AS string)), '') AS string) END as string)
 AS `final_volume_ft3_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`final_weight_lbs_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`final_weight_lbs_` AS string)), '') AS string) END as string)
 AS `final_weight_lbs_`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_invoice_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_invoice_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `invoice_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_invoice_number` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_origin_atd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_origin_atd` AS string)), '') AS string) END as float64)
 AS `first_origin_atd`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`freight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`freight` AS string)), '') AS string) END as string)
 AS `freight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fuel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fuel` AS string)), '') AS string) END as string)
 AS `fuel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`goods_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`goods_description` AS string)), '') AS string) END as string)
 AS `goods_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`house_bill_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`house_bill_` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inner_pieces` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inner_pieces` AS string)), '') AS string) END as string)
 AS `inner_pieces`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inner_piece_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inner_piece_type` AS string)), '') AS string) END as string)
 AS `inner_piece_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mileage` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mileage` AS string)), '') AS string) END as string)
 AS `mileage`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`motor_class` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`motor_class` AS string)), '') AS string) END as string)
 AS `motor_class`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nmfc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nmfc_` AS string)), '') AS string) END as float64)
 AS `nmfc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin` AS string)), '') AS string) END as string)
 AS `origin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_chargeable_weight_lbs_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_chargeable_weight_lbs_` AS string)), '') AS string) END as string)
 AS `original_chargeable_weight_lbs_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_volume_ft3_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_volume_ft3_` AS string)), '') AS string) END as string)
 AS `original_volume_ft3_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_weight_lbs_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_weight_lbs_` AS string)), '') AS string) END as string)
 AS `original_weight_lbs_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin_zone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin_zone` AS string)), '') AS string) END as string)
 AS `origin_zone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_charges` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_charges` AS string)), '') AS string) END as string)
 AS `other_charges`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_ref_s` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_ref_s` AS string)), '') AS string) END as string)
 AS `other_ref_s`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`outer_pieces` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`outer_pieces` AS string)), '') AS string) END as string)
 AS `outer_pieces`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`outer_piece_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`outer_piece_type` AS string)), '') AS string) END as string)
 AS `outer_piece_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`out_for_delivery` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`out_for_delivery` AS string)), '') AS string) END as string)
 AS `out_for_delivery`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_terms` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_terms` AS string)), '') AS string) END as string)
 AS `payment_terms`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pickup_ready_to` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pickup_ready_to` AS string)), '') AS string) END as string)
 AS `pickup_ready_to`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`release_pickup_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`release_pickup_number` AS string)), '') AS string) END as string)
 AS `release_pickup_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`required_delivery_by` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`required_delivery_by` AS string)), '') AS string) END as string)
 AS `required_delivery_by`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_representative` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_representative` AS string)), '') AS string) END as string)
 AS `sales_representative`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_level` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_level` AS string)), '') AS string) END as string)
 AS `service_level`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_create_date` AS string)), '') AS string) END as string)
 AS `shipment_create_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`signed_for_delivery` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`signed_for_delivery` AS string)), '') AS string) END as string)
 AS `signed_for_delivery`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_invoiced` AS string)), '') AS string) END as float64)
 AS `total_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transport_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transport_mode` AS string)), '') AS string) END as string)
 AS `transport_mode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_61` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_61` AS string)), '') AS string) END as float64)
 AS `unnamed_61`



FROM `ff-stadiumgoods-raw-live`.`imports`.`main_freight_transport_customer_shipment_report` AS source_table

 ) AS un_ordered

;

