
    
    




with all_values as (

    select distinct
        consignor_type as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_inventory_unit_snapshots`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '1p','3p','3pe','dss'
    )
)

select count(*) as validation_errors
from validation_errors


