
    
    




with all_values as (

    select distinct
        item_type as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_unit_versions`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'Ether::Wms::InventoryUnit','Ether::Wms::Allocation','Ether::Wms::PickItem'
    )
)

select count(*) as validation_errors
from validation_errors


