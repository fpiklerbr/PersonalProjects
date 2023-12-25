

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_current_order_reports`
  
  
  OPTIONS()
  as (
    WITH final_reports AS (

  SELECT DISTINCT
      file_name
    , file_time
    , report_country
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_v2_order`
  WHERE report_status = 'final'

)

SELECT
  file_name
FROM final_reports
UNION DISTINCT
SELECT
  file_name
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_v2_order` AS preliminary
WHERE report_status = 'preliminary'
  AND NOT EXISTS (
    SELECT *
    FROM final_reports
    WHERE final_reports.report_country = preliminary.report_country
      AND final_reports.file_time >= preliminary.file_time
  )
  );
    