WITH ether_orders AS (

SELECT

      stadium_order_id
    , case when transaction_state = 'Settled' then 1 else 0 end as order_paid_out
    , case when reporting_status = 'Cancelled' then 1 else 0 end as order_cancelled
    , case when reporting_status = 'Dispatched' or reporting_status = 'Returned' then 1 else 0 end as order_fulfillment_status
    , product_sku
    , customer_id
    , variant_size
    , customer_name
    , inventory_seller
    , seller_name
    , order_item_id
    , fulfillment_number
    , order_sku_size_source_line
    , ether_order_number
    , serial_price
    , inventory_relationship
    , inventory_type
    , serial_source
    , serial_cost
    , order_item_line
    , product_brand
    , product_name
    , line_shipping_price_paid
    , receipt_date
    , order_creation_nyc
    , business_unit
    , sales_channel
    , channel_or_gateway
    , tracking_number
    , rebuild_timestamp
    , simple_sku
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` 
WHERE inventory_type = 'Dropship'

), variants as (

SELECT
      distinct simple_sku
    , variant_number
    , mfg_sku
    , product_number
FROM  `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_product_variants` 
group by 1,2,3,4

), fulfillments as (

SELECT
       ether_order_number
     , fulfillment_status
     , fulfilled_at
     , ROW_NUMBER() OVER(partition by ether_order_number ORDER BY updated_at) AS RowNum
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_fulfillments` 

), ether_final as (

SELECT
      ether.stadium_order_id
    , order_paid_out
    , order_cancelled
    , case when fulfillment_number is not null then 'fulfilled' else 'unfulfilled' end as order_fulfillment_status
    , product_sku
    , cast(variants.product_number as int) as variant_id
    , variants.mfg_sku as item_number
    , variant_size
    , customer_id as third_party_id
    , customer_name as third_party_name
    , CASE
         WHEN ether.inventory_seller like 'DC%' THEN sup.seller_id
         ELSE ether.inventory_seller
       END AS seller_id
    , CASE
         WHEN ether.inventory_seller like 'DC%' THEN sup.parent_company
         ELSE ether.seller_name
       END AS parent_company
    , order_item_id
    , CASE 
         WHEN fulfillment_number is not null then 'fulfilled' 
         ELSE 'unfulfilled' 
       END AS order_item_state
    , order_sku_size_source_line
    , fulfillments.fulfilled_at
    , serial_price
    , inventory_relationship as serial_relationship
    , inventory_type as serial_inventory
    , serial_source
    , serial_cost
    , order_item_line
    , product_brand
    , product_name as product_title
    , ether_order_number as third_party_order_number
    , line_shipping_price_paid as line_shipping_amount
    , order_creation_nyc
    , cast(FORMAT_TIMESTAMP('%F %T', fulfillments.fulfilled_at, 'America/New_York') as timestamp) as line_fulfilled_at_nyc
    , business_unit
    , sales_channel
    , channel_or_gateway
    , cast (receipt_date as timestamp) as paid_out_at
    , cast(FORMAT_TIMESTAMP('%F %T', cast(receipt_date as timestamp), 'America/New_York') as timestamp) as paid_out_at_nyc
    , tracking_number
    , rebuild_timestamp
FROM ether_orders ether
left join variants using (simple_sku)
left join `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_supplier_acronym` sup on sup.consignor_id = ether.inventory_seller
left join fulfillments using (ether_order_number)

), dss_orders as (

SELECT 

      stadium_order_id
    , order_paid_out
    , order_cancelled
    , order_fulfillment_status
    , product_sku
    , variant_id
    , item_number
    , variant_size
    , cast(third_party_id as string) as third_party_id
    , third_party_name
    , seller_id
    , parent_company
    , dss_order_item_id
    , order_item_state
    , order_sku_size_source_line
    , line_fulfilled_at
    , serial_price
    , serial_relationship
    , serial_inventory
    , serial_source
    , serial_cost
    , order_item_line
    , product_brand
    , product_title
    , third_party_order_number
    , line_shipping_amount
    , mag_order_creation_nyc
    , cast(line_fulfilled_at_nyc as timestamp) as line_fulfilled_at_nyc
    , business_unit
    , sales_channel
    , channel_or_gateway
    , paid_out_at
    , cast(paid_out_at_nyc as timestamp) as paid_out_at_nyc
    , tracking_number
    , rebuild_timestamp

FROM ff-stadiumgoods-refined-live.stadiumgoods_reporting.dss_order_lines

), unioned as (

SELECT * FROM ether_final
UNION ALL
SELECT * FROM dss_orders  

), final as (

SELECT
    unioned.stadium_order_id
  , unioned.order_paid_out
  , unioned.order_cancelled
  , unioned.order_fulfillment_status
  , unioned.product_sku
  , unioned.variant_id
  , unioned.item_number
  , unioned.variant_size
  , unioned.third_party_id
  , unioned.third_party_name
  , unioned.seller_id
  , unioned.parent_company
  , unioned.order_item_id
  , unioned.order_item_state
  , unioned.order_sku_size_source_line
  , unioned.fulfilled_at
  , unioned.serial_price
  , unioned.serial_relationship
  , unioned.serial_inventory
  , unioned.serial_source
  , unioned.serial_cost
  , unioned.order_item_line
  , unioned.product_brand
  , CASE WHEN brands.product_brand IS NOT NULL THEN brands.brand ELSE products.brand END AS brand
  , unioned.product_title
  , unioned.third_party_order_number
  , unioned.line_shipping_amount
  , unioned.order_creation_nyc
  , unioned.line_fulfilled_at_nyc
  , unioned.business_unit
  , unioned.sales_channel
  , unioned.channel_or_gateway
  , unioned.paid_out_at
  , unioned.paid_out_at_nyc
  , unioned.tracking_number
  , unioned.rebuild_timestamp
FROM unioned 
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_brand_names` brands USING (product_brand)
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` products ON products.mfg_sku = unioned.product_sku

)

SELECT distinct * FROM final