SELECT
    SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(last_withdrawal_request_submitted_at AS timestamp), 'America/New_York') AS datetime) AS date) AS request_submission_date
  , consignor_id
  , last_withdrawal_request_warehouse AS withdrawal_request_warehouse
  , last_withdrawal_request_status AS ticket_status
  , serial_number
  , last_withdrawal_request_note AS note
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`sp_serials`
WHERE last_withdrawal_request_id IS NOT NULL