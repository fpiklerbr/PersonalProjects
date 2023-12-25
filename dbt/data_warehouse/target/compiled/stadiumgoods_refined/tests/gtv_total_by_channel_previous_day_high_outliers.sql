
with dbt__CTE__INTERNAL_test as (
SELECT *
FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`alert_gtv_by_channel_previous_day_outliers`
WHERE gtv_total_outlier = 'Hight'
)select count(*) from dbt__CTE__INTERNAL_test