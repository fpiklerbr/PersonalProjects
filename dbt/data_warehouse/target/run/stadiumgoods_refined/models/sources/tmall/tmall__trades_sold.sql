

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__trades_sold`
  OPTIONS()
  as 














































 

SELECT   `adjust_fee`,  `buyer_nick`,  `buyer_obtain_point_fee`,  `is_buyer_rate`,  `cod_fee`,  `cod_status`,  `consign_time`,  `payment_processed_at`,  `_raw_discount_rmb`,  `end_time`,  `updated_at`,  `_raw_total_item_qty`,  `num_iid`,  `_raw_items`,  `items`,  `page_number`,  `payment_received_at`,  `payment_amount_rmb`,  `pic_path`,  `point_fee`,  `shipping_price_rmb`,  `_raw_item_unit_price_rmb`,  `real_point_fee`,  `received_payment_amount_rmb`,  `receiver_address`,  `receiver_city`,  `receiver_district`,  `receiver_mobile`,  `receiver_name`,  `receiver_phone`,  `receiver_state`,  `receiver_zip`,  `request_id`,  `seller_nickname`,  `is_seller_rate`,  `shipping_type`,  `sid`,  `order_status`,  `transaction_id`,  `title`,  `_raw_item_price_paid`,  `type`,  `file_name`,  `file_time`,  `transaction_date`,  `is_refunded`,  `payment_fee`,  `refund_amount_rmb`,  `refund_processed_at`,  `refund_fee`,  `data_source`,  `checkout_status`,  `settlement_date`,  `_raw_total_item_price_rmb`,  `_raw_total_item_discount_rmb`
    , `_raw_no_shipping`
    , `_raw_oaid`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN is_refunded IS TRUE THEN 0 END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN is_refunded IS TRUE THEN payment_amount_rmb END as float64)
 AS `refund_amount_rmb`
  , 
    safe_cast(CASE WHEN is_refunded IS TRUE THEN updated_at END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN is_refunded IS TRUE THEN 0 END as float64)
 AS `refund_fee`
  , 
    safe_cast(greatest(_raw_total_item_price_rmb - _raw_item_price_paid, 0) as float64)
 AS `_raw_total_item_discount_rmb` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN file_time >= '2019-07-18 14:00:00+00' THEN _raw_items END as string)
 AS `items`
  , 
    safe_cast(coalesce(payment_received_at, payment_processed_at) as date)
 AS `transaction_date`
  , 
    safe_cast(coalesce(received_payment_amount_rmb, 0) = 0 AND order_status IN ('TRADE_CLOSED', 'TRADE_FINISHED') as boolean)
 AS `is_refunded`
  , 
    safe_cast('Taobao API' as string)
 AS `data_source`
  , 
    safe_cast(CASE WHEN payment_received_at IS NOT NULL THEN 'Paid' ELSE 'Not Paid' END as string)
 AS `checkout_status`
  , 
    safe_cast(NULL as date)
 AS `settlement_date`
  , 
    safe_cast(_raw_item_unit_price_rmb * _raw_total_item_qty as float64)
 AS `_raw_total_item_price_rmb` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjust_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjust_fee` AS string)), '') AS string) END as float64)
 AS `adjust_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_nick` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_nick` AS string)), '') AS string) END as string)
 AS `buyer_nick`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_obtain_point_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_obtain_point_fee` AS string)), '') AS string) END as float64)
 AS `buyer_obtain_point_fee`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`buyer_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_rate` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`buyer_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_rate` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_buyer_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cod_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cod_fee` AS string)), '') AS string) END as float64)
 AS `cod_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cod_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cod_status` AS string)), '') AS string) END as string)
 AS `cod_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consign_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consign_time` AS string)), '') AS string) END as string)
 AS `consign_time`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `payment_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_fee` AS string)), '') AS string) END as float64)
 AS `_raw_discount_rmb`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`end_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`end_time` AS string)), '') AS string) END as string)
 AS `end_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`modified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`modified` AS string)), '') AS string) END as timestamp)
 AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num` AS string)), '') AS string) END as float64)
 as int64)
 AS `_raw_total_item_qty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`num_iid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`num_iid` AS string)), '') AS string) END as string)
 AS `num_iid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orders` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orders` AS string)), '') AS string) END as string)
 AS `_raw_items`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`page_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`page_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `page_number`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `payment_received_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment` AS string)), '') AS string) END as float64)
 AS `payment_amount_rmb`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pic_path` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pic_path` AS string)), '') AS string) END as string)
 AS `pic_path`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`point_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`point_fee` AS string)), '') AS string) END as float64)
 AS `point_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`post_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`post_fee` AS string)), '') AS string) END as float64)
 AS `shipping_price_rmb`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `_raw_item_unit_price_rmb`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`real_point_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`real_point_fee` AS string)), '') AS string) END as float64)
 AS `real_point_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`received_payment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`received_payment` AS string)), '') AS string) END as float64)
 AS `received_payment_amount_rmb`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_address` AS string)), '') AS string) END as string)
 AS `receiver_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_city` AS string)), '') AS string) END as string)
 AS `receiver_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_district` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_district` AS string)), '') AS string) END as string)
 AS `receiver_district`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_mobile` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_mobile` AS string)), '') AS string) END as string)
 AS `receiver_mobile`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_name` AS string)), '') AS string) END as string)
 AS `receiver_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_phone` AS string)), '') AS string) END as string)
 AS `receiver_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_state` AS string)), '') AS string) END as string)
 AS `receiver_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receiver_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receiver_zip` AS string)), '') AS string) END as string)
 AS `receiver_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`request_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`request_id` AS string)), '') AS string) END as string)
 AS `request_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_nick` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_nick` AS string)), '') AS string) END as string)
 AS `seller_nickname`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`seller_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_rate` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`seller_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_rate` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_seller_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_type` AS string)), '') AS string) END as string)
 AS `shipping_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sid` AS string)), '') AS string) END as string)
 AS `sid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tid` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_fee` AS string)), '') AS string) END as float64)
 AS `_raw_item_price_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`


  , `no_shipping` AS `_raw_no_shipping`

  , `oaid` AS `_raw_oaid`


FROM `ff-stadiumgoods-raw-live`.`imports`.`tmall_trades_sold` AS source_table

 ) AS source_select_statement

 ) AS macro_statement

 ) AS un_ordered

;

