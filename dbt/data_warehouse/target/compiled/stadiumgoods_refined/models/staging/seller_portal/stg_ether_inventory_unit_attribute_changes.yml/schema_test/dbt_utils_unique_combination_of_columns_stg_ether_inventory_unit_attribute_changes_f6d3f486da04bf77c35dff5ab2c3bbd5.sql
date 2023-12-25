





with validation_errors as (

    select
        ether_wms_inventory_unit_version_id, attribute_name
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_inventory_unit_attribute_changes`

    group by ether_wms_inventory_unit_version_id, attribute_name
    having count(*) > 1

)

select count(*)
from validation_errors


