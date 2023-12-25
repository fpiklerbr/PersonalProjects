

WITH new_invoices_all_files AS (

  SELECT DISTINCT
      tracking_number
    , invoice_id
    , file_time
    , file_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fedex__sg_finance` AS sg_finance

), new_invoices_all_files_with_window AS (

  SELECT
      tracking_number
    , invoice_id
    , file_time
    , file_name
    , row_number() OVER (PARTITION BY tracking_number, invoice_id ORDER BY file_time DESC, file_name DESC) AS tracking_invoice_file_row
  FROM new_invoices_all_files

), new_invoices_last_file AS (

  SELECT
      tracking_number
    , invoice_id
    , file_name
  FROM new_invoices_all_files_with_window
  WHERE tracking_invoice_file_row = 1

), new_invoices_grouped AS (

  SELECT
      sg_finance.tracking_number
    , sg_finance.fedex_account_id
    , sg_finance.invoice_id
    , sg_finance.invoice_date
    , sg_finance.ship_date
    , sg_finance.reference_notes_line_1
    , sg_finance.base_currency
    , sum(sg_finance.base_total_cost) AS base_total_cost
    , sum(sg_finance.base_shipment_freight_charge) AS base_shipment_freight_charge
    , sum(sg_finance.total_cost) AS total_cost
    , sum(sg_finance.shipment_freight_charge) AS shipment_freight_charge
  FROM new_invoices_last_file
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fedex__sg_finance` AS sg_finance
    ON new_invoices_last_file.tracking_number = sg_finance.tracking_number
    AND new_invoices_last_file.invoice_id = sg_finance.invoice_id
    AND new_invoices_last_file.file_name = sg_finance.file_name
  GROUP BY 1, 2, 3, 4, 5, 6, 7

), old_invoices_flat AS (

  SELECT
      tracking_number
    , fedex_account_id
    , invoice_id
    , invoice_date
    , ship_date
    , reference_notes_line_1
    , base_currency
    , base_total_cost
    , base_shipment_freight_charge
    , total_cost
    , shipment_freight_charge
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fedex__shipment_detail` AS fedex_shipment_detail
  WHERE NOT EXISTS (
    SELECT *
    FROM new_invoices_grouped
    WHERE tracking_number = fedex_shipment_detail.tracking_number
      AND invoice_id = fedex_shipment_detail.invoice_id
  )

), shipment_detail AS (

  SELECT *
  FROM new_invoices_grouped
  UNION ALL
  SELECT *
  FROM old_invoices_flat

), final AS (

  SELECT
      shipment_detail.tracking_number
    , shipment_detail.ship_date
    , cast('FedEx Invoice' AS string ) AS invoice_type
    , shipment_detail.invoice_id
    , shipment_detail.invoice_date
    , CASE
        WHEN 


  regexp_contains(shipment_detail.reference_notes_line_1, r'(?i)^WD')


          THEN 'Withdrawal'
        WHEN 


  regexp_contains(shipment_detail.reference_notes_line_1, r'(?i)^RJ')


          THEN 'Rejection'
        WHEN 


  regexp_contains(shipment_detail.reference_notes_line_1, r'(?i)^(Ticket|TKT)')


          THEN 'Seller Portal Ticket'
        WHEN 


  regexp_contains(shipment_detail.reference_notes_line_1, r'(?i)^RTS')


          THEN 'Return to Sender'
        WHEN 


  regexp_contains(shipment_detail.reference_notes_line_1, r'(?i)^(SHP|PIC|SON|[0-9]{9})')


          THEN 'Order Fulfillment'
        ELSE 'Unknown'
      END AS operations_category
    , shipment_detail.base_currency
    , shipment_detail.base_total_cost
    , shipment_detail.base_total_cost AS base_ship_cost
    , shipment_detail.total_cost
    , shipment_detail.total_cost AS ship_cost
    , shipment_detail.fedex_account_id
    , fedex_accounts.shipping_account
    , shipment_detail.reference_notes_line_1 AS reference
    , shipment_detail.shipment_freight_charge AS ship_cost_shipping
    , cast(
        round(
            cast((shipment_detail.total_cost - shipment_detail.shipment_freight_charge) AS numeric )
          , 2
        ) AS float64
      ) AS ship_cost_other_charges
  FROM shipment_detail
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_fedex_accounts` AS fedex_accounts
    ON shipment_detail.fedex_account_id = fedex_accounts.fedex_account_id
)

SELECT * FROM final