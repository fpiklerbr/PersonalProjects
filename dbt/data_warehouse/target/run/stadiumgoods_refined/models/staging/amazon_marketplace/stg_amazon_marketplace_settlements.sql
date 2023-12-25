

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlements`
  
  
  OPTIONS()
  as (
    

SELECT
  settlement_reports.*
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlement_files` AS settlement_files
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlement_reports_spapi` AS settlement_reports
  ON settlement_files.settlement_id = settlement_reports.settlement_id
  AND settlement_files.file_name = settlement_reports.file_name
WHERE settlement_files.settlement_file_priority = 1
  );
    