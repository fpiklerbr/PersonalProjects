
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_zebra_shipped_serials`
where zebra_tracking_number is null


