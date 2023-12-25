

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_stojou`
  OPTIONS()
  as SELECT
      serial_number
    , x3_sku
    , journal_date
    , created_at
    , row_id
    , document_type_code
    , document_id
    , document_line
    , warehouse
    , location
    , x3_size_code
    , creation_user_id
    , stock_status
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stojou`
  WHERE serial_number IS NOT NULL
    AND x3_sku IS NOT NULL;

