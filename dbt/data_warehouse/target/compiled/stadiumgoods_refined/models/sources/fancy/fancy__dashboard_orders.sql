
































 

SELECT   `fancy_order_id`,  `seller`,  `transaction_processed_at`,  `transaction_description`,  `sale_items`,  `note`,  `is_gift`,  `gift_message`,  `item_total`,  `shipping_cost`,  `sales_tax`,  `coupon_amount`,  `transaction_amount`,  `transaction_fee`,  `shipping_label`,  `preorder_status`,  `preorder_remainder`,  `channel`,  `recipient_name`,  `address_1`,  `address_2`,  `city`,  `state`,  `zip`,  `country`,  `contact_phone`,  `username`,  `email`,  `order_history`,  `file_name`,  `file_time`,  `settlement_regex_part`,  `settlement_date`,  `settlement_id`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `payment_fee`,  `refund_fee`
  FROM ( SELECT
    *

  , 
    safe_cast(left(settlement_regex_part, 10) as date)
 AS `settlement_date`
  , 
    safe_cast(left(settlement_regex_part, 10) as string)
 AS `settlement_id` 

 

FROM ( 

SELECT
    *

  , CAST(regexp_extract(order_history, 
  r'\{Payment released ([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}-[0-9]{4})\}'
) AS string) AS `settlement_regex_part` 
FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description IN ('Order shipped','Payment received','Payment refunded') THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Payment refunded')  THEN transaction_amount END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Order shipped','Payment received','Payment refunded') THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Order shipped','Payment received','Payment refunded') THEN (-1 * transaction_fee) END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Payment refunded')  THEN transaction_fee END as float64)
 AS `refund_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `fancy_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller` AS string)), '') AS string) END as string)
 AS `seller`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date` AS string)), '') AS string) END as timestamp)
 AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_status` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sale_items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sale_items` AS string)), '') AS string) END as string)
 AS `sale_items`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`note` AS string)), '') AS string) END as string)
 AS `note`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_gift` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_gift`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) END as string)
 AS `gift_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_total` AS string)), '') AS string) END as float64)
 AS `item_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_cost` AS string)), '') AS string) END as float64)
 AS `shipping_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_tax` AS string)), '') AS string) END as float64)
 AS `sales_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_amount` AS string)), '') AS string) END as float64)
 AS `coupon_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_total` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fancy_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fancy_fee` AS string)), '') AS string) END as float64)
 AS `transaction_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_label` AS string)), '') AS string) END as string)
 AS `shipping_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`preorder_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`preorder_status` AS string)), '') AS string) END as string)
 AS `preorder_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`preorder_remainder` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`preorder_remainder` AS string)), '') AS string) END as string)
 AS `preorder_remainder`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) END as string)
 AS `recipient_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_1` AS string)), '') AS string) END as string)
 AS `address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_2` AS string)), '') AS string) END as string)
 AS `address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zip` AS string)), '') AS string) END as string)
 AS `zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country` AS string)), '') AS string) END as string)
 AS `country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contact_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contact_phone` AS string)), '') AS string) END as string)
 AS `contact_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`username` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`username` AS string)), '') AS string) END as string)
 AS `username`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_history` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_history` AS string)), '') AS string) END as string)
 AS `order_history`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`fancy_dashboard_orders` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

