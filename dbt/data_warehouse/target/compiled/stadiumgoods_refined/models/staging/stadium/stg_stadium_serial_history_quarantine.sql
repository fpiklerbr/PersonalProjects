WITH quarantine_history AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_stock_status_history`
  WHERE logged_at IS NOT NULL
    AND (
      stock_status = 'Q'
      OR previous_stock_status = 'Q'
    )
    AND (
      stock_status <> previous_stock_status
      OR (stock_status IS NULL) <> (previous_stock_status IS NULL)
    )

), quarantined_serials AS (

  SELECT
      serial_number
    , max(logged_at) AS quarantined_at
  FROM quarantine_history
  WHERE stock_status = 'Q'
  GROUP BY 1

), serials_removed_from_quarantine AS (

  SELECT
      serial_number
    , max(logged_at) AS removed_from_quarantine_at
  FROM quarantine_history
  WHERE previous_stock_status = 'Q'
  GROUP BY 1

), final AS (

  SELECT
      quarantined_serials.serial_number
    , quarantined_serials.quarantined_at
    , CASE
        WHEN serials_removed_from_quarantine.removed_from_quarantine_at > quarantined_serials.quarantined_at
        THEN serials_removed_from_quarantine.removed_from_quarantine_at
      END AS removed_from_quarantine_at
  FROM quarantined_serials
  LEFT JOIN serials_removed_from_quarantine
    ON quarantined_serials.serial_number = serials_removed_from_quarantine.serial_number

)

SELECT * FROM final