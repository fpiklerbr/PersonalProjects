SELECT
      serial_number
    , x3_sku
    , row_id
    , commission_rate
    , price
    , consignor_id
    , note
    , serial_condition_code_1
    , serial_condition_code_2
    , serial_condition_code_3
    , serial_condition_code_4
    , serial_condition_code_5
    , original_serial
    , max(row_id) OVER (PARTITION BY serial_number, x3_sku) AS serial_sku_max_row_id
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yserinf`
  WHERE serial_number IS NOT NULL
    AND x3_sku IS NOT NULL
    AND (note IS NULL OR upper(note) NOT LIKE 'AUTO GENERATED FROM SOH%')