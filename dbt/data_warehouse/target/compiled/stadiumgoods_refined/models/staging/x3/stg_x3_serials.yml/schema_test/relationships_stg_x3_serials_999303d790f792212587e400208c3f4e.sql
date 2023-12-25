
    
    




select count(*) as validation_errors
from (
    select simple_sku as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_serials`
) as child
left join (
    select simple_sku as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_products`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


