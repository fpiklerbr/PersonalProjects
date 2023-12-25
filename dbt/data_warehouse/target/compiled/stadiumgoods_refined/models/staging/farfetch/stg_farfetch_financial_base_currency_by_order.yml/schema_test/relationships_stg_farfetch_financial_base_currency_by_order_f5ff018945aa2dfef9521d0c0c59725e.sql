
    
    




select count(*) as validation_errors
from (
    select fps_stock_point_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_farfetch_financial_base_currency_by_order`
) as child
left join (
    select fps_stock_point_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`fps_stock_points`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


