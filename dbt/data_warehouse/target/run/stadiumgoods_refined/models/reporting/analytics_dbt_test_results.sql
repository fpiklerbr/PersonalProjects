

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`analytics_dbt_test_results`
  
  
  OPTIONS()
  as (
    with all_tests as (

/*-magento__sales_flat_order-*/
select
  'magento__sg_farfetch_order' as tbl_name
, 'unique_farfetch_order_id' as test_name
, count(*) as error_count
from (SELECT
    farfetch_order_id
    FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`
    GROUP BY 1
    HAVING count(*) > 1
) validation_errors
UNION ALL
select
  'magento__sg_farfetch_order' as tbl_name
, 'unique_combination_order_id_point_code' as test_name
, count(*) as error_count
from (    select
        order_id, point_code
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`
    group by order_id, point_code
    having count(*) > 1
) validation_errors_1
UNION ALL
select
  'magento__sg_farfetch_order' as tbl_name
, 'not_null_entity_id' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`
where entity_id is null
UNION ALL
select
  'magento__sg_farfetch_order' as tbl_name
, 'unique_entity_id' as test_name
, count(*) as error_count
from (
    select
        entity_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`
    where entity_id is not null
    group by entity_id
    having count(*) > 1
) validation_errors_2

/*-magento__sales_flat_order-*/
UNION ALL
select
  'magento__sales_flat_order' as tbl_name
, 'unique_combination_channel_ext_order_id' as test_name
, count(*) as error_count
from (
    select
        channel, ext_order_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`
    group by 1,2
    having count(*) > 1
) validation_errors_3
UNION ALL
select
  'magento__sales_flat_order' as tbl_name
, 'not_null_entity_id' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`
where entity_id is null
UNION ALL
select
  'magento__sales_flat_order' as tbl_name
, 'unique_entity_id' as test_name
, count(*) as error_count
from (
    select
        entity_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`
    where entity_id is not null
    group by entity_id
    having count(*) > 1
) validation_errors_4
UNION ALL
select
  'magento__sales_flat_order' as tbl_name
, 'unique_increment_id' as test_name
, count(*) as error_count
from (
    select
        increment_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`
    where increment_id is not null
    group by increment_id
    having count(*) > 1
) validation_errors_5

/*-magento__sales_flat_order_item -*/
UNION ALL
select
  'magento__sales_flat_order_item' as tbl_name
, 'not_null_item_id' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_item`
where item_id is null
UNION ALL
select
  'magento__sales_flat_order_item' as tbl_name
, 'unique_item_id' as test_name
, count(*) as error_count
from (
    select
        item_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_item`
    where item_id is not null
    group by item_id
    having count(*) > 1
) validation_errors_6

/*- seller_portal__ether_oms_orders -*/
UNION ALL
select
'seller_portal__ether_oms_orders' as mdl_name
, 'accepted_values_delivery_status' as test_name
, count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders` source_mdl
inner join (
         select distinct delivery_status as value_field
         from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
         where delivery_status not in ('1', '2', '3')
) validation_errors ON value_field = source_mdl.delivery_status
UNION ALL
select
'seller_portal__ether_oms_orders' as mdl_name
, 'accepted_values_allocation_status' as test_name
, count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders` source_mdl
inner join (
         select distinct allocation_status as value_field
         from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
         where allocation_status not in ('1', '2', '3')
) validation_errors ON value_field = source_mdl.allocation_status
UNION ALL
select
'seller_portal__ether_oms_orders' as mdl_name
, 'accepted_values_status' as test_name
, count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders` source_mdl
inner join (
         select distinct status as value_field
         from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
         where status not in ('1', '2', '3')
) validation_errors ON value_field = source_mdl.status
UNION ALL
select
  'seller_portal__ether_oms_orders' as tbl_name
, 'not_null_number' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
where number is null
UNION ALL
select
  'seller_portal__ether_oms_orders' as tbl_name
, 'unique_number' as test_name
, count(*) as error_count
from (
    select
        number
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
    where number is not null
    group by 1
    having count(*) > 1
) validation_errors_6
UNION ALL
select
  'seller_portal__ether_oms_orders' as tbl_name
, 'relationship_ether_oms_sales_channels_sales_channel_id' as test_name
, count(*) as error_count
from (
    select sales_channel_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_sales_channels`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null
UNION ALL
select
  'seller_portal__ether_oms_orders' as tbl_name
, 'relationship_ether_oms_delivery_methods_delivery_method_id' as test_name
, count(*) as error_count
from (
    select delivery_method_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_delivery_methods`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null

/*-seller_portal__ether_oms_order_items-*/
UNION ALL
select
  'seller_portal__ether_oms_order_items' as tbl_name
, 'relationship_ether_oms_orders_order_id' as test_name
, count(*) as error_count
from (
    select order_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null
UNION ALL
select
  'seller_portal__ether_oms_order_items' as tbl_name
, 'not_null_order_number' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
where order_number is null
UNION ALL
select
  'seller_portal__ether_oms_order_items' as tbl_name
, 'not_null_line_number' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
where line_number is null
UNION ALL
select
  'seller_portal__ether_oms_order_items' as tbl_name
, 'not_null_id' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
where id is null
UNION ALL
select
  'seller_portal__ether_oms_order_items' as tbl_name
, 'unique_id' as test_name
, count(*) as error_count
from (
    select
        id
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
    where id is not null
    group by id
    having count(*) > 1
) validation_errors_2
UNION ALL
select
  'seller_portal__ether_oms_order_items' as tbl_name
, 'unique_combination_order_number_line_number' as test_name
, count(*) as error_count
from (
    select
        order_number, line_number
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
    group by 1,2
    having count(*) > 1
) validation_errors_3
UNION ALL
select
'seller_portal__ether_oms_order_items' as mdl_name
, 'accepted_values_status' as test_name
, count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items` source_mdl
inner join (
         select distinct status as value_field
         from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
         where status not in ('0','1', '2', '3', '4')
) validation_errors ON value_field = source_mdl.status

/*-seller_portal__ether_wms_inventory_units-*/
UNION ALL
select
  'seller_portal__ether_wms_inventory_units' as tbl_name
, 'not_null_serial_number' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units`
where serial_number is null
UNION ALL
select
  'seller_portal__ether_wms_inventory_units' as tbl_name
, 'unique_serial_number' as test_name
, count(*) as error_count
from (
    select
        serial_number
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units`
    where serial_number is not null
    group by 1
    having count(*) > 1
) validation_errors_2
UNION ALL
select
  'seller_portal__ether_wms_inventory_units' as tbl_name
, 'not_null_price_currency' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units`
where price_currency is null

/*-seller_portal__ether_wms_transfers-*/
UNION ALL
select
  'seller_portal__ether_wms_transfers' as tbl_name
, 'unique_id' as test_name
, count(*) as error_count
from (
    select
        id
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`
    where id is not null
    group by 1
    having count(*) > 1
) validation_errors
UNION ALL
select
  'seller_portal__ether_wms_transfers' as tbl_name
, 'not_null_id' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`
where id is null
UNION ALL
select
  'seller_portal__ether_wms_transfers' as tbl_name
, 'unique_uuid' as test_name
, count(*) as error_count
from (
    select
        uuid
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`
    where uuid is not null
    group by 1
    having count(*) > 1
) validation_errors
UNION ALL
select
  'seller_portal__ether_wms_transfers' as tbl_name
, 'not_null_uuid' as test_name
, count(*) as error_count
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`
where uuid is null

/*- seller_portal__ether_pim_product_variants -*/
UNION ALL
select
  'seller_portal__ether_pim_product_variants' as tbl_name
, 'unique_combination_sgp_size_code' as test_name
, count(*) as error_count
from (
    select
        sgp, size_code
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`variants`
    group by 1,2
    having count(*) > 1
) validation_errors
UNION ALL
select
  'seller_portal__ether_pim_product_variants' as tbl_name
, 'relationship_ether_pim_products_sgp' as test_name
, count(*) as error_count
from (
    select sgp as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`variants`
) as child
left join (
    select sgp as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_products`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


/*- seller_portal__ether_wms_product_variants -*/
UNION ALL
select
  'seller_portal__ether_wms_product_variants' as tbl_name
, 'unique_combination_sgp_size_code' as test_name
, count(*) as error_count
from (
    select
        sgp, size_code
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_product_variants`
    group by 1,2
    having count(*) > 1
) validation_errors
UNION ALL
select
  'seller_portal__ether_wms_product_variants' as tbl_name
, 'relationship_ether_wms_products_sgp' as test_name
, count(*) as error_count
from (
    select sgp as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_product_variants`
) as child
left join (
    select sgp as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_products`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null

/*- stadium_products -*/
UNION ALL
select
  'stadium_products' as tbl_name
, 'unique_combination_simple_sku_size_uom' as test_name
, count(*) as error_count
from (
    select
        simple_sku, size_uom
    from `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`
    group by 1,2
    having count(*) > 1
) validation_errors

/*- farfetch__api_orders_by_date-*/
UNION ALL
select
  'farfetch__api_orders_by_date' as tbl_name
, 'unique_combination_siteid_order_line_id' as test_name
, count(*) as error_count
from (
    select
        siteid, order_line_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_by_date`
    group by 1,2
    having count(*) > 1
) validation_errors

/*- farfetch__api_orders_headers-*/
UNION ALL
select
  'farfetch__api_orders_headers' as tbl_name
, 'unique_combination_point_id_order_id' as test_name
, count(*) as error_count
from (
    select
        point_id, order_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_headers`
    group by 1,2
    having count(*) > 1
) validation_errors

/*- farfetch__api_orders_rows-*/
UNION ALL
select
  'farfetch__api_orders_rows' as tbl_name
, 'unique_combination_store_id_order_line_id' as test_name
, count(*) as error_count
from (
    select
        store_id, order_line_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_rows`
    group by 1,2
    having count(*) > 1
) validation_errors

/*- farfetch__api_returns-*/
UNION ALL
select
  'farfetch__api_returns' as tbl_name
, 'unique_combination_point_id_order_line_id_return_order_id' as test_name
, count(*) as error_count
from (
    select
        point_id, order_line_id, return_order_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_returns`
    group by 1,2,3
    having count(*) > 1
) validation_errors

)
SELECT * FROM all_tests
order by tbl_name, test_name ASC
  );
    