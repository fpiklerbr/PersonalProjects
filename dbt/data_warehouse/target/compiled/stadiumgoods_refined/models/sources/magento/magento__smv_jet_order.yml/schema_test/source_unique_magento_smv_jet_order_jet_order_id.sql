
    
    



select count(*) as validation_errors
from (

    select
        jet_order_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order`
    where jet_order_id is not null
    group by jet_order_id
    having count(*) > 1

) validation_errors


