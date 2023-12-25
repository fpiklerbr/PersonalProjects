

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_product_types`
  OPTIONS()
  as SELECT
  identifier_2 AS product_type_code
    , text_translation AS product_type
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__atextra`
WHERE text_table = 'ATABDIV'
  AND text_field = 'LNGDES'
  AND text_language = 'ENG'
  AND identifier_1 = '22';

