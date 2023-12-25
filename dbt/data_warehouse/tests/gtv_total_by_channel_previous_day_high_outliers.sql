SELECT *
FROM {{ ref('alert_gtv_by_channel_previous_day_outliers') }}
WHERE gtv_total_outlier = 'Hight'
