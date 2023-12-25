
    
    




with all_values as (

    select distinct
        storage_status as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_inventory_unit_snapshots`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'in_stock','in_stock_allocated','in_transit','requested_withdrawal','review','sold_pos','sold_web','withdrawn','in_stock_allocated_transfer','quarantine','consignor_return','rejected','returned','draft'
    )
)

select count(*) as validation_errors
from validation_errors


