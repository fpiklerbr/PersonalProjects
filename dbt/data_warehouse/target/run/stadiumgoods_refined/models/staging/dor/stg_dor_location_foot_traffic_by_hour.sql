

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dor_location_foot_traffic_by_hour`
  OPTIONS()
  as SELECT
    
    timestamp_trunc(
        cast(reporting_period_started_at as timestamp),
        hour
    )

 AS reporting_hour
  , location_name
  , CAST(safe_cast(datetime(safe_cast(reporting_period_started_at AS timestamp), 'America/New_York') AS datetime) AS date) AS location_date
  , EXTRACT(TIME from safe_cast(datetime(safe_cast(
    timestamp_trunc(
        cast(reporting_period_started_at as timestamp),
        hour
    )

 AS timestamp), 'America/New_York') AS datetime)) AS location_hour
  , sum(foot_traffic_count) AS foot_traffic_count
  , CASE
      WHEN COUNT( CASE WHEN foot_traffic_completeness = 'complete' THEN 1 END ) = 4
      THEN 'complete'
      ELSE 'incomplete'
    END AS foot_traffic_completeness
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dor__location_metrics`
GROUP BY 1, 2, 3, 4;

