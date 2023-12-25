
    
    



select count(*) as validation_errors
from (

    select
        rule_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule`
    where rule_id is not null
    group by rule_id
    having count(*) > 1

) validation_errors


