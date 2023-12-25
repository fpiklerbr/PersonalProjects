

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_journal_after_dispatch`
  
  
  OPTIONS()
  as (
    WITH order_serials AS (

  SELECT
      x3_order_id
    , x3_order_line
    , serial_number
    , max(dispatch_date) AS dispatch_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_tmp_sol_seeds`
  WHERE serial_number IS NOT NULL
    AND x3_order_id IS NOT NULL
    AND x3_order_line IS NOT NULL
    AND dispatch_date IS NOT NULL
  GROUP BY 1, 2, 3

), next_journal_rows AS (

  SELECT
      order_serials.*
    , min(journal.serial_row) AS next_journal_row_after_dispatch_date
  FROM order_serials
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_journal` AS journal
    ON order_serials.serial_number = journal.serial_number
  WHERE journal.journal_date > order_serials.dispatch_date
  GROUP BY 1, 2, 3, 4

)

SELECT
    next_journal_rows.*
  , journal.journal_date AS next_journal_date_after_dispatch_date
  , journal.document_type
  , journal.document_id
  , journal.document_line
FROM next_journal_rows
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_journal` AS journal
  ON next_journal_rows.serial_number = journal.serial_number
  AND next_journal_rows.next_journal_row_after_dispatch_date = journal.serial_row
  AND next_journal_rows.dispatch_date < journal.journal_date
  );
    