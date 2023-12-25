
    
    




select count(*) as validation_errors
from (
    select consignor_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_serials`
) as child
left join (
    select consignor_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_consignors`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


