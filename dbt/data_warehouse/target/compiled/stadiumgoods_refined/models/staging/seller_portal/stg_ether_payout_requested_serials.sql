SELECT
    request_items.serial_number
  , string_agg(DISTINCT CAST(request_items.ether_fms_payout_request_id AS string), ', ') AS payment_request_ids
  , min(requests.payout_requested_at) AS payment_request_created_at
  , min(requests.sla_deadline) AS payment_request_sla_deadline
  , max(request_items.ether_fms_payout_request_id) AS last_ether_fms_payout_request_id
  , string_agg(DISTINCT invoices.invoice_number, ', ') AS payout_invoice_number
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payout_request_items` AS request_items
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`ether_payout_requests` AS requests
  ON request_items.ether_fms_payout_request_id = requests.ether_fms_payout_request_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payout_invoices` AS invoices
  ON request_items.ether_fms_payout_invoice_id = invoices.ether_fms_payout_invoice_id
GROUP BY 1