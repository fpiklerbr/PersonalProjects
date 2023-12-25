

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_returns`
  OPTIONS()
  as 

  SELECT
      document_id AS return_id
    , document_line AS return_line
    , string_agg(DISTINCT serial_number, ', ') AS returned_serial
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal`
  WHERE document_type = 'Customer return'
  GROUP BY 1, 2;

