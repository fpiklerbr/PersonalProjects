

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_log_warehouse_change_events`
  
  
  OPTIONS()
  as (
    

WITH journals AS (

  SELECT
    serial_number
  , created_at AS logged_at
  , LAG(warehouse, 1) OVER (
      PARTITION BY serial_number
      ORDER BY created_at, row_id) AS previous_warehouse
  , warehouse
  , row_id
  , creation_user_id
  , document_type_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_stojou` AS journal
  WHERE NULLIF(LTRIM(RTRIM(serial_number)), '') IS NOT NULL

), log AS (

  SELECT
    journals.serial_number
  , journals.logged_at
  , journals.previous_warehouse
  , journals.warehouse
  , journals.creation_user_id
  , coalesce(document_types.document_type, cast(journals.document_type_code AS string)) AS action_type
  , users.user_name AS creation_user_name
  , row_number() OVER (
      PARTITION BY journals.serial_number
      ORDER BY journals.logged_at, journals.row_id) AS serial_row_number
  , journals.row_id
  FROM journals
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__autilis` AS users
    ON journals.creation_user_id = users.user_id
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`lookup_x3_document_types` AS document_types
    ON journals.document_type_code = document_types.document_type_code
  WHERE ( (previous_warehouse IS NULL and warehouse IS NOT NULL)
  OR COALESCE(previous_warehouse, 'dummy warehouse') <> COALESCE(warehouse, 'dummy warehouse') )

)

SELECT * FROM log
  );
    