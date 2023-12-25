

SELECT
    coalesce(serials.serial_number, sfl.serial_number) AS serial_number
  , serials.x3_sku
  , coalesce(serials.consignor_id, sfl.consignor_id) AS consignor_id
  , serials.yseristatus_paid_out_status
  , serials.yseristatus_consignment_status
  , coalesce(
        serials.yseristatus_issue_date
      , CASE WHEN sfl.inventory_source LIKE 'DSS%' THEN sfl.dispatch_date END
    ) AS yseristatus_issue_date
  , coalesce(
        serials.base_currency
      , CASE WHEN sfl.inventory_source LIKE 'DSS%' THEN sfl.inventory_base_currency END
    ) AS payout_base_currency
  , coalesce(
        serials.serial_cost_base_amount
      , CASE WHEN sfl.inventory_source LIKE 'DSS%' THEN sfl.inventory_cost_base_amount END
    ) AS payout_base_amount
  , coalesce(
        serials.serial_cost
      , CASE WHEN sfl.inventory_source LIKE 'DSS%' THEN sfl.inventory_cost END
    ) AS payout_amount
  , coalesce(
        serials.payout_invoice_date
      , CASE
          WHEN sfl.inventory_source LIKE 'DSS%'
          THEN CASE WHEN sfl.dropship_order_paid_out = 1 THEN sfl.dispatch_date END
        END
    ) AS payout_invoice_date
  , serials.payout_invoice_id
  , serials.payout_invoice_line
  , coalesce(
        serials.payout_invoice_paid_date
      , CASE
          WHEN sfl.inventory_source LIKE 'DSS%'
          THEN CASE WHEN sfl.dropship_order_paid_out = 1 THEN sfl.dispatch_date END
        END
    ) AS payment_date
  , coalesce(
        serials.payout_invoice_paid_amount
      , CASE
          WHEN sfl.inventory_source LIKE 'DSS%'
          THEN CASE WHEN sfl.dropship_order_paid_out = 1 THEN sfl.inventory_cost ELSE 0 END
        END
    ) AS payout_paid
  , coalesce(
        serials.payout_invoice_payable_amount - coalesce(serials.payout_invoice_paid_amount, 0)
      , CASE
          WHEN sfl.inventory_source LIKE 'DSS%'
          THEN CASE WHEN sfl.dropship_order_paid_out = 1 THEN 0 ELSE sfl.inventory_cost END
        END
    ) AS payout_pending
  , coalesce(serials.price, sfl.serial_price) AS sales_price
  , coalesce((serials.price - serials.serial_cost), (sfl.serial_price - sfl.inventory_cost)) AS commission
  , coalesce(serials.serial_source, sfl.inventory_source) AS serial_source
  , coalesce(serials.seller_name, sfl.seller_name) AS consignor_name
  , serials.payout_invoice_payment_id AS payment_id
  , serials.payout_invoice_payment_accounting_date AS payment_accounting_date
  , coalesce(sfl.x3_order_id, serials.x3_order_id) AS x3_order_id
  , coalesce(sfl.x3_order_line, serials.x3_order_line) AS x3_order_line
  , coalesce(sfl.stadium_order_id, serials.stadium_order_id) AS stadium_order_id
  , sfl.reporting_status
  , sfl.reporting_date
  , coalesce(sfl.inventory_base_currency, consignors.base_currency, 'USD') AS inventory_base_currency
  , sfl.consignor_payouts_payable_base_amount
  , sfl.consignor_payouts_payable
  , sfl.consignor_payouts_returned_base_amount
  , sfl.consignor_payouts_returned
  , sfl.consignor_payouts_credit_to_1p_inventory_base_amount
  , sfl.consignor_payouts_credit_to_1p_inventory
  , sfl.consignor_payouts_total_base_amount
  , sfl.consignor_payouts_total
  , current_timestamp AS rebuild_timestamp
FROM
(
  SELECT
    *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS stadium_serials
  WHERE is_3p_payable IS TRUE
) AS serials
FULL JOIN
(
  SELECT
      *
    , CASE
        WHEN stadium_finance_lines.inventory_source LIKE 'DSS%'
          THEN stadium_finance_lines.inventory_source
        WHEN stadium_finance_lines.inventory_source in ('X3', 'Ether')
          THEN stadium_finance_lines.inventory_seller
      END AS consignor_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS stadium_finance_lines
  WHERE stadium_finance_lines.serial_order_match = TRUE
    AND (stadium_finance_lines.inventory_source IN ('Ether', 'X3') OR stadium_finance_lines.inventory_source LIKE 'DSS%')
    AND stadium_finance_lines.reporting_status <> 'Deferred'
    AND stadium_finance_lines.inventory_relationship = '3P'
    AND stadium_finance_lines.consignor_payouts_payable <> 0
) sfl
  ON serials.serial_number = sfl.serial_number
  AND serials.stadium_order_id = sfl.stadium_order_id
LEFT JOIN (
  SELECT
      consignor_id
    , string_agg(DISTINCT base_currency, ', ') AS base_currency
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` 
  GROUP BY 1
) AS consignors
  ON coalesce(serials.consignor_id, sfl.consignor_id) = consignors.consignor_id