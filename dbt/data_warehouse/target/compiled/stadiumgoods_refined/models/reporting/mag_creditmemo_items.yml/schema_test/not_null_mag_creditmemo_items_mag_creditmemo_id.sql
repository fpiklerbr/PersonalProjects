
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_creditmemo_items`
where mag_creditmemo_id is null


