WITH rma_items AS (

  SELECT
      CASE
        WHEN coalesce( parent_order_item.product_type, '') = 'simple'
          THEN parent_order_item.sales_flat_order_item_id
        WHEN coalesce( child_order_item.product_type, '') = 'simple'
          THEN child_order_item.sales_flat_order_item_id
        WHEN coalesce( parent_order_item.product_type, '') = 'configurable'
          THEN parent_order_item.sales_flat_order_item_id
        WHEN coalesce( child_order_item.product_type, '') = 'configurable'
          THEN child_order_item.sales_flat_order_item_id
      END AS order_item_id
    , CASE
        WHEN coalesce( parent_order_item.product_type, '') = 'simple'
          THEN parent_order_item.sales_flat_order_id
        WHEN coalesce( child_order_item.product_type, '') = 'simple'
          THEN child_order_item.sales_flat_order_id
        WHEN coalesce( parent_order_item.product_type, '') = 'configurable'
          THEN parent_order_item.sales_flat_order_id
        WHEN coalesce( child_order_item.product_type, '') = 'configurable'
          THEN child_order_item.sales_flat_order_id
      END AS sales_flat_order_id
    , CASE
        WHEN coalesce(child_order_item.product_type, '') = 'simple' THEN child_order_item.product_id
        WHEN coalesce(parent_order_item.product_type, '') = 'simple' THEN parent_order_item.product_id
      END AS simple_product_id
    , rma.m_rma_id
    , parent_rma_item.m_rma_item_id AS parent_m_rma_item_id
    , parent_rma_item.qty_requested AS parent_qty_requested
    , parent_rma_item.qty_returned AS parent_qty_returned
    , parent_rma_item.date_received AS parent_date_received
    , parent_rma_item.new_serial_number AS parent_new_serial_number
    , parent_rma_item.m_rma_resolution_id AS parent_resolution_id
    , parent_rma_item.m_rma_reason_id AS parent_reason_id
    , parent_rma_item.m_rma_condition_id AS parent_condition_id
    , child_rma_item.m_rma_item_id AS child_m_rma_item_id
    , child_rma_item.qty_requested AS child_qty_requested
    , child_rma_item.qty_returned AS child_qty_returned
    , child_rma_item.date_received AS child_date_received
    , child_rma_item.new_serial_number AS child_new_serial_number
    , child_rma_item.m_rma_resolution_id AS child_resolution_id
    , child_rma_item.m_rma_reason_id AS child_reason_id
    , child_rma_item.m_rma_condition_id AS child_condition_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_item` AS parent_rma_item
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_rma` AS rma
    ON parent_rma_item.m_rma_id = rma.m_rma_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS parent_order_item
    ON parent_rma_item.sales_flat_order_item_id = parent_order_item.sales_flat_order_item_id
    AND parent_order_item.parent_sales_flat_order_item_id IS NULL
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS child_order_item
    ON parent_order_item.sales_flat_order_item_id = child_order_item.parent_sales_flat_order_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_item` AS child_rma_item
    ON parent_rma_item.m_rma_id = child_rma_item.m_rma_id
    AND child_order_item.sales_flat_order_item_id = child_rma_item.sales_flat_order_item_id

), orphan_rma_items AS (

  SELECT
      CASE
        WHEN coalesce( parent_order_item.product_type, '') = 'simple'
          THEN parent_order_item.sales_flat_order_item_id
        WHEN coalesce( child_order_item.product_type, '') = 'simple'
          THEN child_order_item.sales_flat_order_item_id
        WHEN coalesce( parent_order_item.product_type, '') = 'configurable'
          THEN parent_order_item.sales_flat_order_item_id
        WHEN coalesce( child_order_item.product_type, '') = 'configurable'
          THEN child_order_item.sales_flat_order_item_id
      END AS order_item_id
    , CASE
        WHEN coalesce( parent_order_item.product_type, '') = 'simple'
          THEN parent_order_item.sales_flat_order_id
        WHEN coalesce( child_order_item.product_type, '') = 'simple'
          THEN child_order_item.sales_flat_order_id
        WHEN coalesce( parent_order_item.product_type, '') = 'configurable'
          THEN parent_order_item.sales_flat_order_id
        WHEN coalesce( child_order_item.product_type, '') = 'configurable'
          THEN child_order_item.sales_flat_order_id
      END AS sales_flat_order_id
    , CASE
        WHEN coalesce(child_order_item.product_type, '') = 'simple' THEN child_order_item.product_id
        WHEN coalesce(parent_order_item.product_type, '') = 'simple' THEN parent_order_item.product_id
      END AS simple_product_id
    , rma.m_rma_id
    , parent_rma_item.m_rma_item_id AS parent_m_rma_item_id
    , parent_rma_item.qty_requested AS parent_qty_requested
    , parent_rma_item.qty_returned AS parent_qty_returned
    , parent_rma_item.date_received AS parent_date_received
    , parent_rma_item.new_serial_number AS parent_new_serial_number
    , parent_rma_item.m_rma_resolution_id AS parent_resolution_id
    , parent_rma_item.m_rma_reason_id AS parent_reason_id
    , parent_rma_item.m_rma_condition_id AS parent_condition_id
    , child_rma_item.m_rma_item_id AS child_m_rma_item_id
    , child_rma_item.qty_requested AS child_qty_requested
    , child_rma_item.qty_returned AS child_qty_returned
    , child_rma_item.date_received AS child_date_received
    , child_rma_item.new_serial_number AS child_new_serial_number
    , child_rma_item.m_rma_resolution_id AS child_resolution_id
    , child_rma_item.m_rma_reason_id AS child_reason_id
    , child_rma_item.m_rma_condition_id AS child_condition_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_item` AS child_rma_item
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_rma` AS rma
    ON child_rma_item.m_rma_id = rma.m_rma_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS child_order_item
    ON child_rma_item.sales_flat_order_item_id = child_order_item.sales_flat_order_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS parent_order_item
    ON child_order_item.parent_sales_flat_order_item_id = parent_order_item.sales_flat_order_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_item` AS parent_rma_item
    ON child_rma_item.m_rma_id = parent_rma_item.m_rma_id
    AND parent_order_item.sales_flat_order_item_id = parent_rma_item.sales_flat_order_item_id
  WHERE NOT EXISTS (SELECT * FROM rma_items WHERE parent_m_rma_item_id = child_rma_item.m_rma_item_id)
    AND NOT EXISTS (SELECT * FROM rma_items WHERE child_m_rma_item_id = child_rma_item.m_rma_item_id)

), all_rma_items AS (

  SELECT *
  FROM rma_items
  UNION ALL
  SELECT *
  FROM orphan_rma_items

), final AS (

  SELECT
      all_rma_items.*
    , coalesce(
        
  CAST(regexp_extract(parent_resolution.name, 
  r'"(.+)"'
) AS string)

      , parent_resolution.name
      , 'Resolution #' || CAST(all_rma_items.parent_resolution_id AS string )
    ) AS parent_resolution
    , coalesce(
        
  CAST(regexp_extract(child_resolution.name, 
  r'"(.+)"'
) AS string)

      , child_resolution.name
      , 'Resolution #' || CAST(all_rma_items.child_resolution_id AS string )
    ) AS child_resolution
    , coalesce(
        
  CAST(regexp_extract(parent_reason.name, 
  r'"(.+)"'
) AS string)

      , parent_reason.name
      , 'Reason #' || CAST(all_rma_items.parent_reason_id AS string )
    ) AS parent_reason
    , coalesce(
        
  CAST(regexp_extract(child_reason.name, 
  r'"(.+)"'
) AS string)

      , child_reason.name
      , 'Reason #' || CAST(all_rma_items.child_reason_id AS string )
    ) AS child_reason
    , coalesce(
        
  CAST(regexp_extract(parent_condition.name, 
  r'"(.+)"'
) AS string)

      , parent_condition.name
      , 'Condition #' || CAST(all_rma_items.parent_condition_id AS string )
    ) AS parent_condition
    , coalesce(
        
  CAST(regexp_extract(child_condition.name, 
  r'"(.+)"'
) AS string)

      , child_condition.name
      , 'Condition #' || CAST(all_rma_items.child_condition_id AS string )
    ) AS child_condition
  FROM all_rma_items
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_resolution` AS parent_resolution
    ON all_rma_items.parent_resolution_id = parent_resolution.m_rma_resolution_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_resolution` AS child_resolution
    ON all_rma_items.child_resolution_id = child_resolution.m_rma_resolution_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_reason` AS parent_reason
    ON all_rma_items.parent_reason_id = parent_reason.m_rma_reason_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_reason` AS child_reason
    ON all_rma_items.child_reason_id = child_reason.m_rma_reason_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_condition` AS parent_condition
    ON all_rma_items.parent_condition_id = parent_condition.m_rma_condition_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_condition` AS child_condition
    ON all_rma_items.child_condition_id = child_condition.m_rma_condition_id

)

SELECT * FROM final