

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__orders`
  OPTIONS()
  as 


  
































































 

SELECT   `order_number`,  `buyer_member_name`,  `buyer_alipay_account`,  `buyer_payable`,  `buyer_pays_postage`,  `buyer_pays_points`,  `total_amount`,  `rebate_points`,  `buyers_actual_payment`,  `buyers_actual_points_paid`,  `order_status`,  `buyer_message`,  `consignee_name`,  `shipping_address`,  `shipping_method`,  `contact_number`,  `contact_phone`,  `_raw_order_created_at`,  `order_created_at`,  `order_paid_at`,  `product_title`,  `product_type`,  `shipment_number`,  `logistics_company`,  `order_notes`,  `total_product_quantity`,  `store_id`,  `store_name`,  `order_close_reason`,  `seller_service_fee`,  `invoice`,  `is_mobile_phone_order`,  `staged_order_info`,  `privileged_deposit_order_id`,  `contract_photo_is_uploaded`,  `small_ticket_is_uploaded`,  `is_paid`,  `deposit_ranking`,  `modified_sku`,  `modified_shipping_address`,  `exception_information`,  `tmall_card_deduction`,  `jifen_bao_deduction`,  `is_o2o_transaction`,  `id_card_is_uploaded`,  `new_retail_transaction_type`,  `new_retail_shipping_store_name`,  `new_retail_shipping_store_id`,  `new_retail_shopping_store_name`,  `new_retail_shopping_store_id`,  `refund_amount`,  `pre_booking_store`,  `delivery_confirmed_at`,  `personal_red_envelope_is_included`,  `tmall_order_id`,  `tmall_file`,  `payment_slip_number`,  `payment_details`,  `credit_purchase`,  `experience_end_at`,  `delivery_type`,  `main_order_number`,  `file_time`,  `first_n_courtesy`,  `buyer_service_fee`,  `tmall_file_extract`,  `payment_merchant_amount`,  `file_timestamp`
  FROM ( SELECT
    *

  , 
    safe_cast(coalesce(order_created_at_regular, order_created_at_slash) as datetime)
 AS `order_created_at` 


    , 
    safe_cast(CASE
          WHEN


  regexp_contains(tmall_file_extract, r'(?i)^[0-9]{4}[0-9]{1,2}[0-9]{1,2}[0-9]{1,2}[0-9]{2}$')


          THEN  parse_timestamp('%Y%m%d%H%M', tmall_file_extract)
        END as datetime)


 AS `file_timestamp` 

FROM ( 

SELECT
    *

  , 
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_order_created_at, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{2} [0-9]{1,2}:[0-9]{2}$')


          THEN  parse_timestamp('%m/%d/%y %H:%M', _raw_order_created_at)
        END as datetime)


 AS `order_created_at_slash`
  , 
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_order_created_at, r'(?i)^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2} [0-9]{1,2}:[0-9]{2}:[0-9]{2}$')


          THEN  parse_timestamp('%Y-%m-%d %H:%M:%S', _raw_order_created_at)
        END as datetime)


 AS `order_created_at_regular`
  , CAST(regexp_extract(_raw_buyer_service_fee, 
  r'(^.*)元'
) AS float64) AS `buyer_service_fee`
  , CAST(regexp_extract(tmall_file, 
  r'[0-9]{12}'
) AS string) AS `tmall_file_extract`
  , CAST(regexp_extract(_raw_payment_merchant_amount, 
  r'(^.*)元'
) AS float64) AS `payment_merchant_amount` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_number` AS string)), '') AS string) END as string)
 AS `order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_member_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_member_name` AS string)), '') AS string) END as string)
 AS `buyer_member_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_alipay_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_alipay_account` AS string)), '') AS string) END as string)
 AS `buyer_alipay_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_payable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_payable` AS string)), '') AS string) END as float64)
 AS `buyer_payable`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_pays_postage` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_pays_postage` AS string)), '') AS string) END as float64)
 AS `buyer_pays_postage`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_pays_points` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_pays_points` AS string)), '') AS string) END as float64)
 AS `buyer_pays_points`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) END as float64)
 AS `total_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rebate_points` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rebate_points` AS string)), '') AS string) END as float64)
 AS `rebate_points`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyers_actual_payment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyers_actual_payment` AS string)), '') AS string) END as float64)
 AS `buyers_actual_payment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyers_actual_points_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyers_actual_points_paid` AS string)), '') AS string) END as float64)
 AS `buyers_actual_points_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_status` AS string)), '') AS string) END as string)
 AS `order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_message` AS string)), '') AS string) END as string)
 AS `buyer_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignee_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignee_name` AS string)), '') AS string) END as string)
 AS `consignee_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) END as string)
 AS `shipping_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) END as string)
 AS `shipping_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contact_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contact_number` AS string)), '') AS string) END as string)
 AS `contact_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contact_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contact_phone` AS string)), '') AS string) END as string)
 AS `contact_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_created_at` AS string)), '') AS string) END as string)
 AS `_raw_order_created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_paid_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_paid_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `order_paid_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_title` AS string)), '') AS string) END as string)
 AS `product_title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_type` AS string)), '') AS string) END as string)
 AS `product_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) END as string)
 AS `shipment_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`logistics_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`logistics_company` AS string)), '') AS string) END as string)
 AS `logistics_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_notes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_notes` AS string)), '') AS string) END as string)
 AS `order_notes`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_product_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_product_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_product_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_name` AS string)), '') AS string) END as string)
 AS `store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_close_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_close_reason` AS string)), '') AS string) END as string)
 AS `order_close_reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_service_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_service_fee` AS string)), '') AS string) END as float64)
 AS `seller_service_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_service_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_service_fee` AS string)), '') AS string) END as string)
 AS `_raw_buyer_service_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice` AS string)), '') AS string) END as string)
 AS `invoice`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_mobile_phone_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_mobile_phone_order` AS string)), '') AS string) END as string)
 AS `is_mobile_phone_order`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`staged_order_info` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`staged_order_info` AS string)), '') AS string) END as string)
 AS `staged_order_info`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`privileged_deposit_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`privileged_deposit_order_id` AS string)), '') AS string) END as string)
 AS `privileged_deposit_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contract_photo_is_uploaded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contract_photo_is_uploaded` AS string)), '') AS string) END as string)
 AS `contract_photo_is_uploaded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`small_ticket_is_uploaded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`small_ticket_is_uploaded` AS string)), '') AS string) END as string)
 AS `small_ticket_is_uploaded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_paid` AS string)), '') AS string) END as string)
 AS `is_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deposit_ranking` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deposit_ranking` AS string)), '') AS string) END as string)
 AS `deposit_ranking`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`modified_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`modified_sku` AS string)), '') AS string) END as string)
 AS `modified_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`modified_shipping_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`modified_shipping_address` AS string)), '') AS string) END as string)
 AS `modified_shipping_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exception_information` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exception_information` AS string)), '') AS string) END as string)
 AS `exception_information`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_card_deduction` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_card_deduction` AS string)), '') AS string) END as float64)
 AS `tmall_card_deduction`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`jifen_bao_deduction` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`jifen_bao_deduction` AS string)), '') AS string) END as float64)
 AS `jifen_bao_deduction`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_o2o_transaction` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_o2o_transaction` AS string)), '') AS string) END as string)
 AS `is_o2o_transaction`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id_card_is_uploaded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id_card_is_uploaded` AS string)), '') AS string) END as string)
 AS `id_card_is_uploaded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_retail_transaction_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_retail_transaction_type` AS string)), '') AS string) END as string)
 AS `new_retail_transaction_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_retail_shipping_store_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_retail_shipping_store_name` AS string)), '') AS string) END as string)
 AS `new_retail_shipping_store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_retail_shipping_store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_retail_shipping_store_id` AS string)), '') AS string) END as string)
 AS `new_retail_shipping_store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_retail_shopping_store_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_retail_shopping_store_name` AS string)), '') AS string) END as string)
 AS `new_retail_shopping_store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_retail_shopping_store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_retail_shopping_store_id` AS string)), '') AS string) END as string)
 AS `new_retail_shopping_store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_amount` AS string)), '') AS string) END as float64)
 AS `refund_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pre_booking_store` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pre_booking_store` AS string)), '') AS string) END as string)
 AS `pre_booking_store`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_confirmed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_confirmed_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `delivery_confirmed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_merchant_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_merchant_amount` AS string)), '') AS string) END as string)
 AS `_raw_payment_merchant_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`personal_red_envelope_is_included` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`personal_red_envelope_is_included` AS string)), '') AS string) END as string)
 AS `personal_red_envelope_is_included`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) END as string)
 AS `tmall_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_file` AS string)), '') AS string) END as string)
 AS `tmall_file`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_slip_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_slip_number` AS string)), '') AS string) END as string)
 AS `payment_slip_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_details` AS string)), '') AS string) END as string)
 AS `payment_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_purchase` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_purchase` AS string)), '') AS string) END as string)
 AS `credit_purchase`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`experience_end_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`experience_end_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `experience_end_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_type` AS string)), '') AS string) END as string)
 AS `delivery_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`main_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`main_order_number` AS string)), '') AS string) END as string)
 AS `main_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_n_courtesy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_n_courtesy` AS string)), '') AS string) END as string)
 AS `first_n_courtesy`



FROM `ff-stadiumgoods-raw-live`.`imports`.`tmall_orders` AS source_table

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

;

