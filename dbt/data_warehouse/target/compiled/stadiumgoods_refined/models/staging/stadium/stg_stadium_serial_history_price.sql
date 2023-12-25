

  SELECT
    serial_number
  , MIN( CASE WHEN valid_from = cast('1970-01-01 00:00:00' AS timestamp) THEN price END ) AS first_price
  , sum(CASE WHEN is_price_change IS TRUE THEN 1 ELSE 0 END) AS price_changes
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history`
  GROUP BY 1