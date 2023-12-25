WITH mag_transactions AS (

  SELECT
      mag_transactions.transaction_id
    , mag_orders.mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_payment_transaction` AS mag_transactions
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS mag_orders
    ON mag_transactions.sales_flat_order_id = mag_orders.sales_flat_order_id
  WHERE mag_orders.channel IN ('ebay', 'ebay_auctions', 'paypal')
    AND mag_orders.mag_order_id != '101080999' -- duplicate in source data

), m2epro_ebay_transactions AS (

  SELECT
      m2epro_ebay_transactions.ebay_transaction_id AS transaction_id
    , mag_orders.mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_ebay_order_external_transaction` AS m2epro_ebay_transactions
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_order` AS m2epro_orders
    ON m2epro_ebay_transactions.m2epro_order_id = m2epro_orders.m2epro_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS mag_orders
    ON m2epro_orders.sales_flat_order_id = mag_orders.sales_flat_order_id
  WHERE NOT EXISTS (SELECT * FROM mag_transactions WHERE mag_transactions.transaction_id = m2epro_ebay_transactions.ebay_transaction_id)
    AND m2epro_ebay_transactions.ebay_transaction_id IS NOT NULL
    AND m2epro_ebay_transactions.ebay_transaction_id != '8BB58914MR674650N' -- duplicate in source data

), combined AS (

  SELECT *
  FROM mag_transactions
  UNION ALL
  SELECT *
  FROM m2epro_ebay_transactions

), paypal_settlements AS (

  SELECT
      settlements.transaction_id
    , coalesce(child.mag_order_id, parent.mag_order_id) AS mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`paypal__settlements` AS settlements
  LEFT JOIN combined AS parent
    ON parent.transaction_id = settlements.pay_pal_reference_id
  LEFT JOIN combined AS child
    ON child.transaction_id = settlements.transaction_id

), paypal_transactions AS (

  SELECT
      transactions.transaction_id
    , coalesce(child.mag_order_id, parent.mag_order_id) AS mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`paypal__transactions` AS transactions
  LEFT JOIN combined AS parent
    ON parent.transaction_id = transactions.pay_pal_reference_id
  LEFT JOIN combined AS child
    ON child.transaction_id = transactions.transaction_id
  WHERE NOT EXISTS (SELECT * FROM paypal_settlements WHERE paypal_settlements.transaction_id = transactions.transaction_id)

), final AS (

    SELECT *
    FROM paypal_transactions
    UNION DISTINCT
    SELECT *
    FROM paypal_settlements

)

SELECT * FROM final