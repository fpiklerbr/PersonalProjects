

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_serial_price_status_changes`
  OPTIONS()
  as 

with production_price_changes as
(
    SELECT count(*) as price_counts
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history`
),
production_status_changes as 
(
    SELECT count(*) as status_id_counts
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_status_history`
)
SELECT *
FROM production_price_changes
    JOIN production_status_changes on (1=1);

