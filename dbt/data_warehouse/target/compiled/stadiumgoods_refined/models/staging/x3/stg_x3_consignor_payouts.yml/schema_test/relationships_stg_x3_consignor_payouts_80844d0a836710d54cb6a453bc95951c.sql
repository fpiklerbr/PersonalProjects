
    
    




select count(*) as validation_errors
from (
    select serial_number as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_consignor_payouts`
) as child
left join (
    select serial_number as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_serials`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


