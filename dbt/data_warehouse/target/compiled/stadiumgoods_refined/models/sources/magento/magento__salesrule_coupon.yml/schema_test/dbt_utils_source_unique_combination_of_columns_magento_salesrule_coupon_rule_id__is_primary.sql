





with validation_errors as (

    select
        rule_id, is_primary
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule_coupon`

    group by rule_id, is_primary
    having count(*) > 1

)

select count(*)
from validation_errors


