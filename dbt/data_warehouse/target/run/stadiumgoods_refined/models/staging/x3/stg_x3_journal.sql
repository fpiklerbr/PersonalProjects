

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal`
  
  
  OPTIONS()
  as (
    


  SELECT
      journal.serial_number
    , journal.x3_sku
    , CASE WHEN null_dates.null_date IS NULL THEN journal.journal_date END AS journal_date
    , journal.created_at
    , journal.row_id
    , journal.document_type_code
    , coalesce(document_types.document_type, cast(journal.document_type_code AS string)) AS document_type
    , journal.document_id
    , journal.document_line
    , journal.warehouse
    , journal.location
    , journal.x3_size_code
    , journal.creation_user_id
    , users.user_name AS creation_user_name
    , row_number() OVER (
        PARTITION BY journal.serial_number, journal.x3_sku
        ORDER BY journal.journal_date, journal.created_at, journal.row_id
      ) AS serial_row
    , count(*) OVER (
        PARTITION BY journal.serial_number, journal.x3_sku
      ) AS serial_row_count
    , DATETIME(SAFE_CAST(journal.created_at AS timestamp), 'America/New_York') AS creation_nyc
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_stojou` AS journal
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__autilis` AS users
    ON journal.creation_user_id = users.user_id
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`lookup_x3_document_types` AS document_types
    ON journal.document_type_code = document_types.document_type_code
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`exceptions_x3_null_dates` AS null_dates
    ON journal.journal_date = null_dates.null_date
  );
    