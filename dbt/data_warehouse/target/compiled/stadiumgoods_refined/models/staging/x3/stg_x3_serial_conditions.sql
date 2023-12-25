SELECT
  CAST(identifier_2 AS int64) AS serial_condition_code
    , text_translation AS serial_condition
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__atextra`
WHERE text_table = 'ATABDIV'
  AND text_field = 'LNGDES'
  AND text_language = 'ENG'
  AND identifier_1 = '6020'