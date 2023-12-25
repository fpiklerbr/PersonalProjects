

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_receipts`
  OPTIONS()
  as 

  SELECT
      serial_number
    , x3_sku
    , journal_date
    , created_at
    , row_id
    , document_type_code
    , document_type
    , document_id
    , document_line
    , warehouse
    , location
    , x3_size_code
    , creation_user_id
    , creation_user_name
    , serial_row
    , serial_row_count
    , creation_nyc
    , max(serial_row) OVER (PARTITION BY serial_number, x3_sku) AS max_serial_row
    , row_number() OVER (
        PARTITION BY x3_sku
        ORDER BY journal_date, created_at, row_id
      ) AS x3_sku_row
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal`
  WHERE document_type = 'Receipt';

