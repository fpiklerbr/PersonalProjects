

SELECT
    return_detail.delivery_id
  , return_detail.delivery_line
  , return_detail.return_id
  , return_detail.return_line
  , DATETIME(SAFE_CAST(return_detail.created_at AS timestamp), 'America/New_York') AS return_creation_nyc
  , journal_returns.returned_serial
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sreturnd` AS return_detail
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_returns` AS journal_returns
  ON return_detail.return_id = journal_returns.return_id
  AND return_detail.return_line = journal_returns.return_line