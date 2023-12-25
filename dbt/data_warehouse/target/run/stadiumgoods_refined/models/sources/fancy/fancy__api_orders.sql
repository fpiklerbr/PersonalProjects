

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fancy__api_orders`
  OPTIONS()
  as 

  





































 

SELECT   `channel`,  `customer_brand_name`,  `customer_cover_image`,  `customer_cover_image_height`,  `customer_cover_image_offset_x`,  `customer_cover_image_offset_y`,  `customer_cover_image_url`,  `customer_cover_image_width`,  `customer_following`,  `customer_fullname`,  `customer_has_image`,  `customer_html_url`,  `customer_id`,  `customer_id_str`,  `customer_image_color`,  `customer_image_url`,  `customer_is_private`,  `customer_is_seller`,  `customer_is_super_vip`,  `customer_is_verified`,  `customer_is_vip`,  `customer_logo_url`,  `customer_logo_url_retina`,  `customer_original_image_url`,  `customer_type`,  `customer_username`,  `transaction_processed_at`,  `fancy_order_id`,  `id_str`,  `is_vip`,  `net_total`,  `note`,  `quantity`,  `status`,  `transaction_description`,  `transaction_fee`,  `transaction_amount`,  `file_name`,  `file_time`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `payment_fee`,  `refund_fee`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN refund_amount IS NOT NULL THEN (-1* payment_fee) END as float64)
 AS `refund_fee` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast(CASE transaction_description WHEN 'Payment refunded' THEN 0 ELSE (net_total - transaction_amount) END as float64)
 AS `transaction_fee`
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
    safe_cast(CASE WHEN transaction_description IN ('Order shipped','Payment received','Payment refunded') THEN transaction_amount END as float64)
 AS `payment_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_brand_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_brand_name` AS string)), '') AS string) END as string)
 AS `customer_brand_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_cover_image` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_cover_image` AS string)), '') AS string) END as string)
 AS `customer_cover_image`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_cover_image_height` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_cover_image_height` AS string)), '') AS string) END as string)
 AS `customer_cover_image_height`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_cover_image_offset_x` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_cover_image_offset_x` AS string)), '') AS string) END as string)
 AS `customer_cover_image_offset_x`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_cover_image_offset_y` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_cover_image_offset_y` AS string)), '') AS string) END as string)
 AS `customer_cover_image_offset_y`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_cover_image_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_cover_image_url` AS string)), '') AS string) END as string)
 AS `customer_cover_image_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_cover_image_width` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_cover_image_width` AS string)), '') AS string) END as string)
 AS `customer_cover_image_width`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_following` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_following` AS string)), '') AS string) END as string)
 AS `customer_following`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_fullname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_fullname` AS string)), '') AS string) END as string)
 AS `customer_fullname`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_has_image` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_has_image` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_has_image` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_has_image` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_has_image`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_html_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_html_url` AS string)), '') AS string) END as string)
 AS `customer_html_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id_str` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id_str` AS string)), '') AS string) END as string)
 AS `customer_id_str`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_image_color` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_image_color` AS string)), '') AS string) END as string)
 AS `customer_image_color`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_image_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_image_url` AS string)), '') AS string) END as string)
 AS `customer_image_url`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_private` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_private` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_private` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_private` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_is_private`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_seller` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_seller` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_seller` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_seller` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_is_seller`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_super_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_super_vip` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_super_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_super_vip` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_is_super_vip`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_verified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_verified` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_verified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_verified` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_is_verified`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_vip` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_vip` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_is_vip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_logo_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_logo_url` AS string)), '') AS string) END as string)
 AS `customer_logo_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_logo_url_retina` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_logo_url_retina` AS string)), '') AS string) END as string)
 AS `customer_logo_url_retina`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_original_image_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_original_image_url` AS string)), '') AS string) END as string)
 AS `customer_original_image_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_type` AS string)), '') AS string) END as string)
 AS `customer_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_username` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_username` AS string)), '') AS string) END as string)
 AS `customer_username`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as string)
 AS `fancy_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id_str` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id_str` AS string)), '') AS string) END as string)
 AS `id_str`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) END as string)
 AS `is_vip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_total` AS string)), '') AS string) END as float64)
 AS `net_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`note` AS string)), '') AS string) END as string)
 AS `note`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_str` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_str` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`fancy_api_orders` AS source_table

 ) AS source_select_statement

 ) AS macro_statement

 ) AS un_ordered

;

