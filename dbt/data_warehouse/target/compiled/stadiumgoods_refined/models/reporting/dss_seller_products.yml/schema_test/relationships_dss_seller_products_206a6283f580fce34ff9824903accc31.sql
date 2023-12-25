
    
    




select count(*) as validation_errors
from (
    select third_party_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`dss_seller_products`
) as child
left join (
    select third_party_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`dss_sellers`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


