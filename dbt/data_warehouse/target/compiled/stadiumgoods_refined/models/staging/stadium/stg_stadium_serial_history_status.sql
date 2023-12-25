

  SELECT
    serial_number
  , CAST(COALESCE(max(end_timestamp), current_timestamp) AS date) AS mag_last_available_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_status_history`
  WHERE status_id = 2
  GROUP BY 1