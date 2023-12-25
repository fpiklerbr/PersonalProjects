
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tableau_1p_inventory_recon_events`
where event_class is null


