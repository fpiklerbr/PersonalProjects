
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_consignors`
where consignor_id is null


