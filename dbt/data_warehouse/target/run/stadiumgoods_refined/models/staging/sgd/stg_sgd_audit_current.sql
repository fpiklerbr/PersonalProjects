

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_sgd_audit_current`
  OPTIONS()
  as 

WITH last_audit AS (

  SELECT
    max(audit_timestamp) AS max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sgd__audit`

), final AS (

  SELECT
      serial_number
    , min(sgd_audit.audit_date) AS first_audit_date
    , max(sgd_audit.audit_date) AS last_audit_date
    , count(DISTINCT sgd_audit.audit_date) audit_count
    , CAST(max(CASE WHEN sgd_audit.audit_timestamp = last_audit.max_timestamp THEN 1 ELSE 0 END) AS boolean) AS on_current_audit
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sgd__audit` AS sgd_audit
  CROSS JOIN last_audit
  WHERE serial_number IS NOT NULL
  GROUP BY 1

)

SELECT * FROM final;

