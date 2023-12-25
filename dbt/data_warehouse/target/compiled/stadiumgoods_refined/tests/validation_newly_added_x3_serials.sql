
with dbt__CTE__INTERNAL_test as (




WITH final AS (

  SELECT
      serial_number
    , intake_date
    , last_journal_date
    , document_date
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_serials` AS live
  WHERE NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20231002` AS snapshot
    WHERE serial_number = live.serial_number
  )
    AND (
      original_intake_date < '2019-11-01'
      OR document_date < '2019-11-01'
      OR last_journal_date < '2019-11-01'

    )

)

SELECT * FROM final
)select count(*) from dbt__CTE__INTERNAL_test