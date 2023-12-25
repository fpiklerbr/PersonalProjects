
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`analytics_abnormal_row_count_bq`
where unique_id is null


