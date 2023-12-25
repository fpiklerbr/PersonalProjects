



with serial_log as 
(
    SELECT coalesce(nullif(ltrim(rtrim(serial.serial_number)), ''), nullif(ltrim(rtrim(log.serial_number)), '')) serial_number
         , serial.created_at serial_creation_utc
         , log.serial_log_id
         , log.created_at log_timestamp_utc
         , nullif(ltrim(rtrim(log.serial_orig_data)), '') serial_orig_data
         , nullif(ltrim(rtrim(log.serial_data)), '') serial_data
         , log.message
         , log.user_type
         , log._synched_from_source_at
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_log` log
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial` serial 
        ON serial.serializedproduct_product_serial_id = log.serial_id

    

    WHERE log._synched_from_source_at > (select max(_synched_from_source_at) from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_events`)

    
    
),
parsed_messages as
(
    SELECT serial_log_id
         , serial_number
         , serial_creation_utc
         , log_timestamp_utc
         , case
             when message like '%updated%' then 'updated'
             when message like '%deleted%' then 'deleted'
             when message like '%created%' then 'created'
             else NULL 
         end as log_event
         , user_type
         , _synched_from_source_at
    FROM serial_log 
)
select serial_log_id 
     , serial_number
     , serial_creation_utc
     , log_timestamp_utc
     , case 
         when log_event is not null then log_event 
         else 
            case when user_type = 'devops' then 'updated' else NULL end
       end as log_event 
     , _synched_from_source_at
from parsed_messages