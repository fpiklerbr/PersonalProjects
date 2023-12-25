
   
SELECT 
  serials.serial_number
, consignors.consignor_id
, consignors.consignor_name
, consignors.consignor_email
, serials.price
, serials.intake_warehouse
, serials.yseristatus_issue_date
, serials.intake_date
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_serials` AS serials
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_consignors` AS consignors USING (consignor_id)
WHERE serials.serial_inventory = 'Consignment'