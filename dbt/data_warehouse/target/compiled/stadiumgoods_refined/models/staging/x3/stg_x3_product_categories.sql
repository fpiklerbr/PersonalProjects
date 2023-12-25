SELECT
  identifier_1 AS product_category_code
    , text_translation AS product_category
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__atextra`
WHERE text_table = 'ITMCATEG'
  AND text_field = 'TCLAXX'
  AND text_language = 'ENG'