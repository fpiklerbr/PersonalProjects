

WITH rma_comment_serials AS (

  SELECT
      rma_comments.m_rma_id
    , CASE WHEN products.product_type = 'simple' THEN products.product_id END AS simple_product_id
    , string_agg(DISTINCT rma_comments.text, ', ') AS comment_serial
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_comment` AS rma_comments
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial` AS serials
    ON rma_comments.text = serials.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity` AS products
    ON serials.simple_sku = products.sku
  WHERE 


  regexp_contains(rma_comments.text, r'^[0-9]{10,11}$')


  GROUP BY 1, 2

), rma_items AS (

  SELECT DISTINCT
    items.`order_item_id`,
  items.`sales_flat_order_id`,
  items.`simple_product_id`,
  items.`m_rma_id`,
  items.`parent_qty_requested`,
  items.`parent_qty_returned`,
  items.`parent_date_received`,
  items.`parent_new_serial_number`,
  items.`parent_resolution_id`,
  items.`parent_reason_id`,
  items.`parent_condition_id`,
  items.`child_qty_requested`,
  items.`child_qty_returned`,
  items.`child_date_received`,
  items.`child_new_serial_number`,
  items.`child_resolution_id`,
  items.`child_reason_id`,
  items.`child_condition_id`,
  items.`parent_resolution`,
  items.`child_resolution`,
  items.`parent_reason`,
  items.`child_reason`,
  items.`parent_condition`,
  items.`child_condition`
  , rmas.`mag_rma_id`,
  rmas.`guest_id`,
  rmas.`firstname`,
  rmas.`lastname`,
  rmas.`company`,
  rmas.`telephone`,
  rmas.`street`,
  rmas.`city`,
  rmas.`region`,
  rmas.`region_id`,
  rmas.`country_id`,
  rmas.`postcode`,
  rmas.`offline_address`,
  rmas.`customer_id`,
  rmas.`order_id`,
  rmas.`m_rma_status_id`,
  rmas.`store_id`,
  rmas.`tracking_code`,
  rmas.`is_resolved`,
  rmas.`is_archived`,
  rmas.`created_at`,
  rmas.`updated_at`,
  rmas.`ticket_id`,
  rmas.`admin_user_id`,
  rmas.`last_reply_at`,
  rmas.`is_gift`,
  rmas.`exchange_order_id`,
  rmas.`credit_memo_id`,
  rmas.`is_admin_read`,
  rmas.`return_address_id`,
  rmas.`_raw__synched_from_source_at`,
  rmas.`last_reply_name`,
  rmas.`rma_email`,
  rmas.`rma_name`,
  rmas.`rma_creation_nyc`,
  rmas.`rma_update_nyc`,
  rmas.`last_reply_nyc`,
  rmas.`rma_status`,
  rmas.`rma_user`,
  rmas.`rma_pending_approval_nyc`,
  rmas.`rma_approved_nyc`,
  rmas.`rma_rejected_nyc`,
  rmas.`rma_closed_nyc`,
  rmas.`rma_rts_nyc`,
  rmas.`rma_package_approved_nyc`,
  rmas.`rma_package_denied_nyc`,
  rmas.`min_tracking_number_date`
  , ARRAY_TO_STRING(rmas.rma_tracking_numbers, ',') AS rma_tracking_numbers_string
  , orders.channel AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_rma_items` AS items
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_rmas` AS rmas
    ON items.m_rma_id = rmas.m_rma_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS orders
    ON items.sales_flat_order_id = orders.sales_flat_order_id

), final AS (

  SELECT
      rma_items.order_item_id
    , rma_items.mag_rma_id
    , rma_items.m_rma_id
    , rma_items.sales_flat_order_id
    , rma_items.order_channel
    , rma_items.rma_creation_nyc
    , rma_items.rma_name
    , rma_items.rma_email
    , rma_items.rma_user
    , rma_items.rma_status
    , rma_items.rma_update_nyc
    , rma_items.rma_pending_approval_nyc
    , rma_items.rma_approved_nyc
    , rma_items.rma_rejected_nyc
    , rma_items.rma_closed_nyc
    , rma_items.rma_rts_nyc
    , rma_items.rma_package_approved_nyc
    , rma_items.rma_package_denied_nyc
    , rma_items.last_reply_name
    , rma_items.last_reply_nyc
    , CASE WHEN rma_items.rma_tracking_numbers_string IS NULL THEN NULL
      ELSE SPLIT(rma_items.rma_tracking_numbers_string,
  ','
)
      END AS rma_tracking_numbers
    , rma_items.min_tracking_number_date
    , nullif(
     greatest(
      coalesce(rma_items.child_qty_returned, CAST('-9223372036854775808' AS int64))
      ,coalesce(rma_items.parent_qty_returned, CAST('-9223372036854775808' AS int64))
      
      )
     , CAST('-9223372036854775808' AS int64)
  ) AS item_qty_returned
    , nullif(
     greatest(
      coalesce(rma_items.child_qty_requested, CAST('-9223372036854775808' AS int64))
      ,coalesce(rma_items.parent_qty_requested, CAST('-9223372036854775808' AS int64))
      
      )
     , CAST('-9223372036854775808' AS int64)
  ) AS item_qty_requested
    , nullif(
     least(
      coalesce(rma_items.child_date_received, CAST('9999-12-31' AS date))
      ,coalesce(rma_items.parent_date_received, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS item_date_received
    , substr(
    concat(
    
      coalesce(rma_items.child_reason|| ', ' , '')
    
      , coalesce(rma_items.parent_reason|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(rma_items.child_reason|| ', ' , '')
    
      , coalesce(rma_items.parent_reason|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
) AS item_reason
    , substr(
    concat(
    
      coalesce(rma_items.child_condition|| ', ' , '')
    
      , coalesce(rma_items.parent_condition|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(rma_items.child_condition|| ', ' , '')
    
      , coalesce(rma_items.parent_condition|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
) AS item_condition
    , substr(
    concat(
    
      coalesce(rma_items.child_resolution|| ', ' , '')
    
      , coalesce(rma_items.parent_resolution|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(rma_items.child_resolution|| ', ' , '')
    
      , coalesce(rma_items.parent_resolution|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
) AS item_resolution
    , coalesce(
          rma_items.child_new_serial_number
        , rma_items.parent_new_serial_number
        , comment_serials_simple_product.comment_serial
        , comment_serials_no_simple_product.comment_serial
      ) AS item_new_serial_number
    , current_timestamp AS rebuild_timestamp
  FROM rma_items
  LEFT JOIN rma_comment_serials AS comment_serials_simple_product
    ON rma_items.m_rma_id = comment_serials_simple_product.m_rma_id
    AND rma_items.simple_product_id = comment_serials_simple_product.simple_product_id
  LEFT JOIN rma_comment_serials AS comment_serials_no_simple_product
    ON rma_items.m_rma_id = comment_serials_no_simple_product.m_rma_id
    AND comment_serials_no_simple_product.simple_product_id IS NULL

)

SELECT * FROM final