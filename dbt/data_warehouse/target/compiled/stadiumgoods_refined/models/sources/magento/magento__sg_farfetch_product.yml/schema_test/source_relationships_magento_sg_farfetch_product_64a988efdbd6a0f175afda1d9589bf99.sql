
    
    




select count(*) as validation_errors
from (
    select gender_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`
) as child
left join (
    select gender_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_gender`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


