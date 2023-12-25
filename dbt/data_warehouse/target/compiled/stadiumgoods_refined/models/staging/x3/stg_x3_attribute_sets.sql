SELECT
  identifier_2 AS attribute_set_code
    , text_translation AS attribute_set
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__atextra`
WHERE text_table = 'ATABDIV'
  AND text_field = 'LNGDES'
  AND text_language = 'ENG'
  AND identifier_1 = '23'