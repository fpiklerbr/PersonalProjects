
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_snapshot_validation`
where sales_channel is null


