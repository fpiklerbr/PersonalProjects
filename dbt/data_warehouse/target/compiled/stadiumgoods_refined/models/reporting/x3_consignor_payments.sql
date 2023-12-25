

WITH base_currency_by_consignor AS (

  SELECT
      consignor_id
    , string_agg(DISTINCT base_currency, ', ') AS base_currency
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_seller_portal_users`
  WHERE consignor_id IS NOT NULL
  GROUP BY 1

)

  SELECT
      paymenth.accounting_date
    , paymenth.consignor_id
    , base_currency_by_consignor.base_currency AS consignor_base_currency
    , paymenth.consignor_name
    , paymenth.payment_id
    , paymenth.bank_amount
    , paymenth.payment_type
    , paymenth.payment_method
    , paymenth.check_number
    , paymenth.bank_file
    , paymenth.query_number
    , paymenth.bic_code
    , paymenth.bank_id
    , paymentd.payment_line
    , paymentd.line_amount
    , paymentd.line_invoice
    , paymentd.line_internal_number
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__paymenth` AS paymenth
  INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__paymentd` AS paymentd
    ON paymenth.payment_id = paymentd.payment_id
  LEFT JOIN base_currency_by_consignor
    ON paymenth.consignor_id = base_currency_by_consignor.consignor_id
  WHERE paymenth.bprsac_0 = 'CONA'
    OR paymenth.consignor_id = 'DC00000001'