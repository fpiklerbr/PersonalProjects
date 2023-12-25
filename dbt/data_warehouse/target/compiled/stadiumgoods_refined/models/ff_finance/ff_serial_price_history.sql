



SELECT
  `serial_number`,
  `price_change_source`,
  `serial_price_row`,
  `logged_at`,
  `log_entry_id`,
  `log_entry_type`,
  `previous_price_base_amount`,
  `price_base_amount`,
  `valid_from`,
  `valid_to`,
  `base_currency`,
  `currency_conversion_date`,
  `currency_conversion_rate`,
  `previous_price`,
  `price`,
  `is_price_change`
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history`