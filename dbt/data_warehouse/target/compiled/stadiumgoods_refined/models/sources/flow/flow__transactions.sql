


  




















































 

SELECT   `flow_transaction_id`,  `reference`,  `primary_identifier`,  `parent_id`,  `posted_at`,  `transaction_description`,  `timezone`,  `transaction_id`,  `order_primary_identifier`,  `order_submitted_at`,  `payment_method`,  `local_amount`,  `local_currency`,  `transaction_amount`,  `base_currency`,  `processing_fee`,  `processing_fee_description`,  `rate_lock_fee`,  `rate_lock_fee_description`,  `vat_withholding`,  `duty_withholding`,  `freight_withholding`,  `insurance_withholding`,  `amount`,  `merchant_of_record`,  `trailing_column`,  `file_name`,  `file_time`,  `order_destination_city`,  `order_destination_province`,  `order_destination_postal`,  `order_destination_country`,  `order_destination_city_`,  `order_destination_country_`,  `order_destination_postal_`,  `order_destination_province_`,  `order_number_`,  `order_submitted_at_`,  `description`,  `payment_processed_at`,  `payment_amount`,  `payment_fee`,  `refund_processed_at`,  `refund_amount`,  `refund_fee`,  `settlement_id`,  `order_discriminator`,  `order_detail_selected_deliveries_0_ratecard_owner`,  `order_primary_identifier_`,  `order_detail_vat_`,  `order_detail_selected_deliveries_0_delivered_duty`,  `order_detail_shipping_`,  `order_detail_selected_deliveries_0_center_key_`,  `order_detail_discount_`,  `order_detail_duty_`,  `order_detail_selected_deliveries_0_ship_from_coun`,  `order_detail_estimated_freight_`,  `order_detail_selected_deliveries_0_delivery_optio`,  `order_detail_selected_deliveries_0_service_id_`,  `order_detail_subtotal_`,  `order_detail_total`,  `order_detail_selected_deliveries_0_ship_from_country_`,  `order_detail_selected_deliveries_0_delivery_option_id_`,  `order_detail_selected_deliveries_0_ratecard_owner_`,  `order_detail_selected_deliveries_0_delivered_duty_`,  `order_detail_total_`
  FROM ( 

SELECT
    *

  , CAST(regexp_extract(file_name, 
  r'stgo-[0-9]{4}'
) AS string) AS `settlement_id` 
FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description = 'capture' THEN order_submitted_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'capture' THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'capture' THEN (-1 * processing_fee) END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'refund' THEN coalesce(posted_at, order_submitted_at) END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'refund' THEN (-1 * transaction_amount) END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'refund' THEN (-1 * processing_fee) END as float64)
 AS `refund_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as string)
 AS `flow_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference` AS string)), '') AS string) END as string)
 AS `reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`primary_identifier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`primary_identifier` AS string)), '') AS string) END as string)
 AS `primary_identifier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as string)
 AS `parent_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`posted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`posted_at` AS string)), '') AS string) END as timestamp)
 AS `posted_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`timezone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`timezone` AS string)), '') AS string) END as string)
 AS `timezone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_number` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_primary_identifier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_primary_identifier` AS string)), '') AS string) END as string)
 AS `order_primary_identifier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_submitted_at` AS string)), '') AS string) END as timestamp)
 AS `order_submitted_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) END as string)
 AS `payment_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`local_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`local_amount` AS string)), '') AS string) END as float64)
 AS `local_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`local_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`local_currency` AS string)), '') AS string) END as string)
 AS `local_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_currency` AS string)), '') AS string) END as string)
 AS `base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processing_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processing_fee` AS string)), '') AS string) END as float64)
 AS `processing_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processing_fee_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processing_fee_description` AS string)), '') AS string) END as string)
 AS `processing_fee_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rate_lock_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rate_lock_fee` AS string)), '') AS string) END as float64)
 AS `rate_lock_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rate_lock_fee_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rate_lock_fee_description` AS string)), '') AS string) END as string)
 AS `rate_lock_fee_description`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_withholding` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_withholding` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `vat_withholding`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`duty_withholding` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`duty_withholding` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `duty_withholding`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`freight_withholding` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`freight_withholding` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `freight_withholding`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`insurance_withholding` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`insurance_withholding` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `insurance_withholding`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_of_record` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_of_record` AS string)), '') AS string) END as string)
 AS `merchant_of_record`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trailing_column` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trailing_column` AS string)), '') AS string) END as string)
 AS `trailing_column`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_city` AS string)), '') AS string) END as string)
 AS `order_destination_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_province` AS string)), '') AS string) END as string)
 AS `order_destination_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_postal` AS string)), '') AS string) END as string)
 AS `order_destination_postal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_country` AS string)), '') AS string) END as string)
 AS `order_destination_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_city_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_city_` AS string)), '') AS string) END as string)
 AS `order_destination_city_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_country_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_country_` AS string)), '') AS string) END as string)
 AS `order_destination_country_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_postal_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_postal_` AS string)), '') AS string) END as string)
 AS `order_destination_postal_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_destination_province_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_destination_province_` AS string)), '') AS string) END as string)
 AS `order_destination_province_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_number_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_number_` AS string)), '') AS string) END as string)
 AS `order_number_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_submitted_at_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_submitted_at_` AS string)), '') AS string) END as timestamp)
 AS `order_submitted_at_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(NULL AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(NULL AS string)), '') AS string) END as string)
 AS `order_discriminator`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(NULL AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(NULL AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_ratecard_owner`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_primary_identifier_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_primary_identifier_` AS string)), '') AS string) END as string)
 AS `order_primary_identifier_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_vat_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_vat_` AS string)), '') AS string) END as string)
 AS `order_detail_vat_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(NULL AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(NULL AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_delivered_duty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_shipping_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_shipping_` AS string)), '') AS string) END as string)
 AS `order_detail_shipping_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_selected_deliveries_0_center_key_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_selected_deliveries_0_center_key_` AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_center_key_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_discount_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_discount_` AS string)), '') AS string) END as string)
 AS `order_detail_discount_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_duty_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_duty_` AS string)), '') AS string) END as string)
 AS `order_detail_duty_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(NULL AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(NULL AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_ship_from_coun`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_estimated_freight_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_estimated_freight_` AS string)), '') AS string) END as string)
 AS `order_detail_estimated_freight_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(NULL AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(NULL AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_delivery_optio`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_selected_deliveries_0_service_id_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_selected_deliveries_0_service_id_` AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_service_id_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_subtotal_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_subtotal_` AS string)), '') AS string) END as string)
 AS `order_detail_subtotal_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(NULL AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(NULL AS string)), '') AS string) END as string)
 AS `order_detail_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_selected_deliveries_0_ship_from_country_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_selected_deliveries_0_ship_from_country_` AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_ship_from_country_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_selected_deliveries_0_delivery_option_id_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_selected_deliveries_0_delivery_option_id_` AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_delivery_option_id_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_selected_deliveries_0_ratecard_owner_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_selected_deliveries_0_ratecard_owner_` AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_ratecard_owner_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_selected_deliveries_0_delivered_duty_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_selected_deliveries_0_delivered_duty_` AS string)), '') AS string) END as string)
 AS `order_detail_selected_deliveries_0_delivered_duty_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_detail_total_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_detail_total_` AS string)), '') AS string) END as string)
 AS `order_detail_total_`



FROM `ff-stadiumgoods-raw-live`.`imports`.`flow_console_statement_transactions` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

