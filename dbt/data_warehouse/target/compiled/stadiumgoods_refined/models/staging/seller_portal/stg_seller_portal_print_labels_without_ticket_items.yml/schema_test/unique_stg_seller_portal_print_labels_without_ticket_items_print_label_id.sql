
    
    



select count(*) as validation_errors
from (

    select
        print_label_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_seller_portal_print_labels_without_ticket_items`
    where print_label_id is not null
    group by print_label_id
    having count(*) > 1

) validation_errors


