
    
    




select count(*) as validation_errors
from (
    select sg_size_scale_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`sales_channel`.`farfetch_sg_size_scales`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


