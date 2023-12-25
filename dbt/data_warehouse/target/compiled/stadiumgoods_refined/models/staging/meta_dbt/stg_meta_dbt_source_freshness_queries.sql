

  
  SELECT
      'amazon_marketplace.open_listings_data' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`amazon_open_listings_data`' AS database_object
    , 'amazon_marketplace' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'amazon_marketplace.open_listings_data\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`amazon_open_listings_data`\' AS database_object     , \'amazon_marketplace\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_open_listings_data`'
) AS freshness_query

  UNION ALL
  SELECT
      'barrett.pending_orders' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`barrett_pending_orders`' AS database_object
    , 'warehouse_import_barrett_api' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'barrett.pending_orders\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`barrett_pending_orders`\' AS database_object     , \'warehouse_import_barrett_api\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`barrett_pending_orders`'
) AS freshness_query

  UNION ALL
  SELECT
      'flow.transactions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`flow_console_statement_transactions`' AS database_object
    , 'warehouse_import_monthly_finance_files.py' AS loader_or_source_name
    , cast('0-0 30 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 45 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'flow.transactions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`flow_console_statement_transactions`\' AS database_object     , \'warehouse_import_monthly_finance_files.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 30 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 45 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 30 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 45 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 45 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 30 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`flow_console_statement_transactions`'
) AS freshness_query

  UNION ALL
  SELECT
      'adyen.received_payments_report' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`adyen_received_payments_report`' AS database_object
    , 'adyen' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'adyen.received_payments_report\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`adyen_received_payments_report`\' AS database_object     , \'adyen\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`adyen_received_payments_report`'
) AS freshness_query

  UNION ALL
  SELECT
      'sgd.audit' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`sgd_audit_serials`' AS database_object
    , 'sgd' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sgd.audit\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`sgd_audit_serials`\' AS database_object     , \'sgd\' AS loader_or_source_name     , \'audit_timestamp\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`audit_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`audit_timestamp` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`audit_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`audit_timestamp` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`audit_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`audit_timestamp` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`sgd_audit_serials`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.api_orders_by_date' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_by_date`' AS database_object
    , 'warehouse_import_farfetch_orders_by_date.py & warehouse_import_farfetch_orders_by_date_status.py' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.api_orders_by_date\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_by_date`\' AS database_object     , \'warehouse_import_farfetch_orders_by_date.py & warehouse_import_farfetch_orders_by_date_status.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_by_date`'
) AS freshness_query

  UNION ALL
  SELECT
      'chw.receiving' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`chw_receiving`' AS database_object
    , 'warehouse_import_cap_shipping.py' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'chw.receiving\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`chw_receiving`\' AS database_object     , \'warehouse_import_cap_shipping.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`chw_receiving`'
) AS freshness_query

  UNION ALL
  SELECT
      'stripe.payout_reconciliation_reports' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`stripe_payout_reconciliation_reports`' AS database_object
    , 'warehouse_import_stripe_api_reports.py' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'stripe.payout_reconciliation_reports\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`stripe_payout_reconciliation_reports`\' AS database_object     , \'warehouse_import_stripe_api_reports.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`stripe_payout_reconciliation_reports`'
) AS freshness_query

  UNION ALL
  SELECT
      'dhl.customs_invoices' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`dhl_customs_invoices`' AS database_object
    , 'dhl' AS loader_or_source_name
    , cast('0-0 2 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dhl.customs_invoices\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`dhl_customs_invoices`\' AS database_object     , \'dhl\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 2 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`dhl_customs_invoices`'
) AS freshness_query

  UNION ALL
  SELECT
      'amazon_marketplace.order_reports_sp' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports_sp`' AS database_object
    , 'amazon_marketplace' AS loader_or_source_name
    , cast('0-0 0 16:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 24:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'amazon_marketplace.order_reports_sp\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports_sp`\' AS database_object     , \'amazon_marketplace\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 16:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 24:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 24:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 24:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports_sp`'
) AS freshness_query

  UNION ALL
  SELECT
      'fedex.track_info' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`fedex_track_info`' AS database_object
    , 'fedex' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 4:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'fedex.track_info\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`fedex_track_info`\' AS database_object     , \'fedex\' AS loader_or_source_name     , \'request_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`request_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`request_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`request_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`request_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`request_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`request_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`fedex_track_info`'
) AS freshness_query

  UNION ALL
  SELECT
      'barrett.inventory' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`barrett_inventory`' AS database_object
    , 'warehouse_import_barrett_api' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'barrett.inventory\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`barrett_inventory`\' AS database_object     , \'warehouse_import_barrett_api\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`barrett_inventory`'
) AS freshness_query

  UNION ALL
  SELECT
      'amazon_marketplace.settlement_reports_sp' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports_sp`' AS database_object
    , 'amazon_marketplace' AS loader_or_source_name
    , cast('0-0 0 8:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 16:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'amazon_marketplace.settlement_reports_sp\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports_sp`\' AS database_object     , \'amazon_marketplace\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 8:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 16:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 8:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 8:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports_sp`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.api_returns' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_returns`' AS database_object
    , 'farfetch' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.api_returns\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_returns`\' AS database_object     , \'farfetch\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_returns`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.api_orders_rows' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_rows`' AS database_object
    , 'warehouse_import_farfetch_orders_rows.py' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.api_orders_rows\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_rows`\' AS database_object     , \'warehouse_import_farfetch_orders_rows.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_rows`'
) AS freshness_query

  UNION ALL
  SELECT
      'private_client.customers' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`private_client_customers`' AS database_object
    , 'private_client' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'private_client.customers\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`private_client_customers`\' AS database_object     , \'private_client\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`private_client_customers`'
) AS freshness_query

  UNION ALL
  SELECT
      'citcon.settlements' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`citcon_settlements`' AS database_object
    , 'warehouse_import_citcon_settlements.py' AS loader_or_source_name
    , cast('0-0 2 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'citcon.settlements\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`citcon_settlements`\' AS database_object     , \'warehouse_import_citcon_settlements.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 2 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`citcon_settlements`'
) AS freshness_query

  UNION ALL
  SELECT
      'braintree.orders' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`braintree_api_orders`' AS database_object
    , 'braintree' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'braintree.orders\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`braintree_api_orders`\' AS database_object     , \'braintree\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`braintree_api_orders`'
) AS freshness_query

  UNION ALL
  SELECT
      'dhl.standard_invoices' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`dhl_standard_invoices`' AS database_object
    , 'dhl' AS loader_or_source_name
    , cast('0-0 2 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dhl.standard_invoices\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`dhl_standard_invoices`\' AS database_object     , \'dhl\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 2 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`dhl_standard_invoices`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.financial_v2_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_order`' AS database_object
    , 'warehouse_import_farfetch_financials.py' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.financial_v2_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_order`\' AS database_object     , \'warehouse_import_farfetch_financials.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.financial_no_stock_vouchers' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_no_stock_vouchers`' AS database_object
    , 'farfetch' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.financial_no_stock_vouchers\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_no_stock_vouchers`\' AS database_object     , \'farfetch\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_no_stock_vouchers`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.financial_returns' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_returns`' AS database_object
    , 'farfetch' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.financial_returns\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_returns`\' AS database_object     , \'farfetch\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_returns`'
) AS freshness_query

  UNION ALL
  SELECT
      'chw.shipping' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`chw_shipping`' AS database_object
    , 'warehouse_import_cap_shipping.py' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'chw.shipping\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`chw_shipping`\' AS database_object     , \'warehouse_import_cap_shipping.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`chw_shipping`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.api_listings' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_listings`' AS database_object
    , 'farfetch' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.api_listings\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_listings`\' AS database_object     , \'farfetch\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_listings`'
) AS freshness_query

  UNION ALL
  SELECT
      'adyen.settlement_detail_report_batch' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`adyen_settlement_detail_report_batch`' AS database_object
    , 'adyen' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'adyen.settlement_detail_report_batch\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`adyen_settlement_detail_report_batch`\' AS database_object     , \'adyen\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`adyen_settlement_detail_report_batch`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.financial_refunds' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_refunds`' AS database_object
    , 'farfetch' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.financial_refunds\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_refunds`\' AS database_object     , \'farfetch\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_refunds`'
) AS freshness_query

  UNION ALL
  SELECT
      'barrett.receiving' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`barrett_receiving`' AS database_object
    , 'warehouse_import_barrett_api' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'barrett.receiving\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`barrett_receiving`\' AS database_object     , \'warehouse_import_barrett_api\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`barrett_receiving`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.api_orders_headers' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_headers`' AS database_object
    , 'warehouse_import_farfetch_orders_headers.py' AS loader_or_source_name
    , cast('0-0 0 0:20:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 0:40:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.api_orders_headers\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_headers`\' AS database_object     , \'warehouse_import_farfetch_orders_headers.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 0:20:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 0:40:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 0:20:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 0:40:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 0:40:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 0:20:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_headers`'
) AS freshness_query

  UNION ALL
  SELECT
      'mainfreight.edi_210' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`main_freight_edi_210`' AS database_object
    , 'mainfreight' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'mainfreight.edi_210\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`main_freight_edi_210`\' AS database_object     , \'mainfreight\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`main_freight_edi_210`'
) AS freshness_query

  UNION ALL
  SELECT
      'paypal.settlements' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`paypal_settlements`' AS database_object
    , 'paypal' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'paypal.settlements\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`paypal_settlements`\' AS database_object     , \'paypal\' AS loader_or_source_name     , \'file_timestamp\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`paypal_settlements`'
) AS freshness_query

  UNION ALL
  SELECT
      'amazon_marketplace.open_listings_data_sp' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`amazon_open_listings_data_sp`' AS database_object
    , 'amazon_marketplace' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'amazon_marketplace.open_listings_data_sp\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`amazon_open_listings_data_sp`\' AS database_object     , \'amazon_marketplace\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_open_listings_data_sp`'
) AS freshness_query

  UNION ALL
  SELECT
      'amazon_marketplace.settlement_reports' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports`' AS database_object
    , 'amazon_marketplace' AS loader_or_source_name
    , cast('0-0 0 8:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 16:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'amazon_marketplace.settlement_reports\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports`\' AS database_object     , \'amazon_marketplace\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 8:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 16:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 8:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 8:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.financial_v2_service_incentive' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_service_incentive`' AS database_object
    , 'warehouse_import_farfetch_financials.py' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.financial_v2_service_incentive\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_service_incentive`\' AS database_object     , \'warehouse_import_farfetch_financials.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_service_incentive`'
) AS freshness_query

  UNION ALL
  SELECT
      'google_analytics.product_data' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`ga_product_data`' AS database_object
    , 'google_analytics' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'google_analytics.product_data\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`ga_product_data`\' AS database_object     , \'google_analytics\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`ga_product_data`'
) AS freshness_query

  UNION ALL
  SELECT
      'adyen.exchange_rate_report' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`adyen_exchange_rate_report`' AS database_object
    , 'adyen' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'adyen.exchange_rate_report\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`adyen_exchange_rate_report`\' AS database_object     , \'adyen\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(     safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as datetime)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`adyen_exchange_rate_report`'
) AS freshness_query

  UNION ALL
  SELECT
      'chw.inventory' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`chw_inventory`' AS database_object
    , 'warehouse_import_cap_shipping.py' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'chw.inventory\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`chw_inventory`\' AS database_object     , \'warehouse_import_cap_shipping.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`chw_inventory`'
) AS freshness_query

  UNION ALL
  SELECT
      'forex.daily_exchange_rates' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`daily_exchange_rates`' AS database_object
    , 'forex' AS loader_or_source_name
    , cast('0-0 2 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'forex.daily_exchange_rates\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`daily_exchange_rates`\' AS database_object     , \'forex\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 2 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`daily_exchange_rates`'
) AS freshness_query

  UNION ALL
  SELECT
      'ecommerce.marketing_calendar' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`ecommerce_marketing_calendar`' AS database_object
    , 'warehouse_import_marketing_calendar.py' AS loader_or_source_name
    , cast('0-0 2 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ecommerce.marketing_calendar\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`ecommerce_marketing_calendar`\' AS database_object     , \'warehouse_import_marketing_calendar.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 2 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`ecommerce_marketing_calendar`'
) AS freshness_query

  UNION ALL
  SELECT
      'mainfreight.customer_shipment_report' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`main_freight_transport_customer_shipment_report`' AS database_object
    , 'mainfreight' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'mainfreight.customer_shipment_report\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`main_freight_transport_customer_shipment_report`\' AS database_object     , \'mainfreight\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`main_freight_transport_customer_shipment_report`'
) AS freshness_query

  UNION ALL
  SELECT
      'braintree.disputes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`braintree_api_disputes`' AS database_object
    , 'braintree' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'braintree.disputes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`braintree_api_disputes`\' AS database_object     , \'braintree\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`braintree_api_disputes`'
) AS freshness_query

  UNION ALL
  SELECT
      'cap.inventory' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`cap_inventory`' AS database_object
    , 'warehouse_import_cap_shipping.py' AS loader_or_source_name
    , cast('0-0 1 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'cap.inventory\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`cap_inventory`\' AS database_object     , \'warehouse_import_cap_shipping.py\' AS loader_or_source_name     , \'inventory_timestamp\' AS loaded_at_field     , cast(\'0-0 1 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 1 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`inventory_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`inventory_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`inventory_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`inventory_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`inventory_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`inventory_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 1 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_inventory`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.api_parent_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_parent_items`' AS database_object
    , 'farfetch' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.api_parent_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_parent_items`\' AS database_object     , \'farfetch\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_parent_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'google_analytics.transactions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`ga_transactions`' AS database_object
    , 'google_analytics' AS loader_or_source_name
    , cast('0-0 2 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'google_analytics.transactions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`ga_transactions`\' AS database_object     , \'google_analytics\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 2 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`ga_transactions`'
) AS freshness_query

  UNION ALL
  SELECT
      'farfetch.financial_sales' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_sales`' AS database_object
    , 'farfetch' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'farfetch.financial_sales\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_sales`\' AS database_object     , \'farfetch\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_sales`'
) AS freshness_query

  UNION ALL
  SELECT
      'amazon_marketplace.order_reports' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports`' AS database_object
    , 'amazon_marketplace' AS loader_or_source_name
    , cast('0-0 0 16:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 24:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'amazon_marketplace.order_reports\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports`\' AS database_object     , \'amazon_marketplace\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 16:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 24:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 24:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 24:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 16:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports`'
) AS freshness_query

  UNION ALL
  SELECT
      'barrett.shipping' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`barrett_shipping`' AS database_object
    , 'warehouse_import_barrett_api' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'barrett.shipping\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`barrett_shipping`\' AS database_object     , \'warehouse_import_barrett_api\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`barrett_shipping`'
) AS freshness_query

  UNION ALL
  SELECT
      'sneaker_news.products' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`sneaker_news_products`' AS database_object
    , 'warehouse_import_sneaker_news_products_api.py' AS loader_or_source_name
    , cast('0-0 2 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 3 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sneaker_news.products\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`sneaker_news_products`\' AS database_object     , \'warehouse_import_sneaker_news_products_api.py\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 2 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 3 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 3 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 2 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`sneaker_news_products`'
) AS freshness_query

  UNION ALL
  SELECT
      'fedex.sg_finance' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`fedex_sg_finance`' AS database_object
    , 'fedex' AS loader_or_source_name
    , cast('0-0 30 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 45 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'fedex.sg_finance\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`fedex_sg_finance`\' AS database_object     , \'fedex\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 30 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 45 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 30 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 45 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 45 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 30 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`fedex_sg_finance`'
) AS freshness_query

  UNION ALL
  SELECT
      'braintree.transaction_level_fee_reports' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`braintree_transaction_level_fee_reports`' AS database_object
    , 'braintree' AS loader_or_source_name
    , cast('0-0 30 0:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 45 0:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'braintree.transaction_level_fee_reports\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`braintree_transaction_level_fee_reports`\' AS database_object     , \'braintree\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 30 0:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 45 0:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 30 0:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 45 0:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 45 0:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 30 0:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`braintree_transaction_level_fee_reports`'
) AS freshness_query

  UNION ALL
  SELECT
      'paypal.transactions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`paypal_transactions`' AS database_object
    , 'paypal' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'paypal.transactions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`paypal_transactions`\' AS database_object     , \'paypal\' AS loader_or_source_name     , \'file_timestamp\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`paypal_transactions`'
) AS freshness_query

  UNION ALL
  SELECT
      'dor.location_metrics' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`imports`.`dor_api_location_metrics`' AS database_object
    , 'dor' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dor.location_metrics\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`imports`.`dor_api_location_metrics`\' AS database_object     , \'dor\' AS loader_or_source_name     , \'file_time\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`imports`.`dor_api_location_metrics`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.mercaux_order_serial' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_serial`' AS database_object
    , 'warehouse_sync_from_sales_channel_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.mercaux_order_serial\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_serial`\' AS database_object     , \'warehouse_sync_from_sales_channel_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_serial`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.cross_dock_notification' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`cross_dock_notification`' AS database_object
    , 'warehouse_sync_from_sales_channel_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.cross_dock_notification\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`cross_dock_notification`\' AS database_object     , \'warehouse_sync_from_sales_channel_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`cross_dock_notification`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.farfetch_sg_size_scales' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`farfetch_sg_size_scales`' AS database_object
    , 'sales_channel_sync' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.farfetch_sg_size_scales\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`farfetch_sg_size_scales`\' AS database_object     , \'sales_channel_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`farfetch_sg_size_scales`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.mercaux_store_address' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_store_address`' AS database_object
    , 'warehouse_sync_from_sales_channel_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.mercaux_store_address\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_store_address`\' AS database_object     , \'warehouse_sync_from_sales_channel_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_store_address`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.fps_catalog_parity_snapshots' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshots`' AS database_object
    , 'warehouse_sync_from_sales_channel_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.fps_catalog_parity_snapshots\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshots`\' AS database_object     , \'warehouse_sync_from_sales_channel_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshots`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.webhook_log' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`webhook_log`' AS database_object
    , 'warehouse_incremental_sales_channel_webhook_log' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.webhook_log\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`webhook_log`\' AS database_object     , \'warehouse_incremental_sales_channel_webhook_log\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`webhook_log`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.mercaux_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order`' AS database_object
    , 'sales_channel_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.mercaux_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order`\' AS database_object     , \'sales_channel_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.mercaux_customer' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_customer`' AS database_object
    , 'warehouse_sync_from_sales_channel_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.mercaux_customer\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_customer`\' AS database_object     , \'warehouse_sync_from_sales_channel_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_customer`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.imported_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`imported_order`' AS database_object
    , 'warehouse_sync_from_sales_channel_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.imported_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`imported_order`\' AS database_object     , \'warehouse_sync_from_sales_channel_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`imported_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'sales_channel.mercaux_order_address' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_address`' AS database_object
    , 'warehouse_sync_from_sales_channel_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'sales_channel.mercaux_order_address\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_address`\' AS database_object     , \'warehouse_sync_from_sales_channel_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_address`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_jet_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_jet_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_season' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_season`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_season\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_season`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_season`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_product' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_product\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_serial' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_serial\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity_media_gallery' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity_media_gallery\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_quote' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_quote`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_quote\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_quote`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_quote`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_relation' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_relation`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_relation\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_relation`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_relation`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_order_address' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_address`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_order_address\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_address`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_address`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_index_eav' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_index_eav`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_index_eav\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_index_eav`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_index_eav`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_credit_balance' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_balance`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_credit_balance\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_balance`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_balance`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_ebay_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_ebay_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_serial_log' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_log`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_serial_log\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_log`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_log`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_fancy_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_fancy_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_ebay_listing_product' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_ebay_listing_product\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_box' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_box`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_box\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_box`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_box`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_condition' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_condition`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_condition\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_condition`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_condition`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_ebay_listing_product_variation' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product_variation`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_ebay_listing_product_variation\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product_variation`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product_variation`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_serial_price_channel' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_price_channel`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_serial_price_channel\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_price_channel`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_price_channel`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_brand' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_brand`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_brand\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_brand`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_brand`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_country' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_country`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_country\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_country`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_country`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_composition' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_composition\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.admin_user' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`admin_user`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.admin_user\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`admin_user`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`admin_user`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_tmall_order_queue' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_queue`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_tmall_order_queue\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_queue`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_queue`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_x3_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_x3_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_x3_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_x3_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_x3_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_stockpoint' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_stockpoint`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_stockpoint\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_stockpoint`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_stockpoint`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity_media_gallery_value' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery_value`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity_media_gallery_value\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery_value`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery_value`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_category_entity_varchar' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_varchar`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_category_entity_varchar\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_varchar`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_varchar`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_credit_transaction' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_transaction`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_credit_transaction\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_transaction`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_transaction`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_category' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_category`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_category\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_category`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_category`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.amasty_audit_log_details' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log_details`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.amasty_audit_log_details\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log_details`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log_details`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_payment_transaction' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_payment_transaction`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_payment_transaction\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_payment_transaction`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_payment_transaction`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity_varchar' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_varchar`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity_varchar\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_varchar`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_varchar`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity_datetime' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_datetime`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity_datetime\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_datetime`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_datetime`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_fancy_order_queue' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order_queue`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_fancy_order_queue\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order_queue`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order_queue`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_category_entity' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_category_entity\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_dsco_supplier' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_dsco_supplier\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_order_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order_item`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_order_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order_item`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_condition' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_condition`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_condition\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_condition`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_condition`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_shipment_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_item`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_shipment_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_item`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity_decimal' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_decimal`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity_decimal\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_decimal`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_decimal`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_dsco_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_dsco_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_serial_source' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_source`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_serial_source\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_source`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_source`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_tmall_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_tmall_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.salesrule' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.salesrule\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_rma_creditmemo' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma_creditmemo`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_rma_creditmemo\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma_creditmemo`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma_creditmemo`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_dsco_supplier_product' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier_product`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_dsco_supplier_product\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier_product`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier_product`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.salesrule_coupon' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule_coupon`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.salesrule_coupon\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule_coupon`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule_coupon`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_amazon_order_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order_item`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_amazon_order_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order_item`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.amasty_audit_log' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.amasty_audit_log\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_children_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_children_items`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_children_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_children_items`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_children_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.eav_attribute_option_value' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute_option_value`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.eav_attribute_option_value\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute_option_value`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute_option_value`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity_text' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_text`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity_text\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_text`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_text`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_walmart_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_walmart_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_walmart_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_walmart_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_walmart_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_sizerange' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizerange`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_sizerange\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizerange`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizerange`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_category_product' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_product`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_category_product\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_product`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_product`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.eav_attribute' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.eav_attribute\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_invoice' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_invoice`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_invoice\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_invoice`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_invoice`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_jet_order_queue' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order_queue`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_jet_order_queue\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order_queue`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order_queue`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_reason' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_reason`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_reason\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_reason`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_reason`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_order_log' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_log`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_order_log\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_log`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_log`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.customer_entity' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`customer_entity`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.customer_entity\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`customer_entity`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`customer_entity`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_composition_mapping' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition_mapping`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_composition_mapping\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition_mapping`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition_mapping`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_item`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_item`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_ebay_order_external_transaction' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_external_transaction`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_ebay_order_external_transaction\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_external_transaction`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_external_transaction`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_serial_status' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_status`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_serial_status\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_status`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_status`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_serial_warehouse' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_warehouse`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_serial_warehouse\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_warehouse`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_warehouse`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_gender' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_gender`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_gender\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_gender`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_gender`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_product_variant' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product_variant`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_product_variant\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product_variant`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product_variant`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_tenants' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_tenants`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_tenants\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_tenants`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_tenants`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sumoheavy_stocknotifications' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_stocknotifications`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sumoheavy_stocknotifications\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_stocknotifications`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_stocknotifications`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_sizescale' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizescale`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_sizescale\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizescale`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizescale`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_shipment_track' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_track`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_shipment_track\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_track`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_track`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_order_payment' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_payment`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_order_payment\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_payment`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_payment`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_order_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_item`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_order_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_item`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_ebay_order_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_item`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_ebay_order_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_item`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_resolution' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_resolution`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_resolution\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_resolution`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_resolution`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_composition_type' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition_type`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_composition_type\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition_type`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition_type`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.serializedproduct_product_serial_condition' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_condition`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.serializedproduct_product_serial_condition\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_condition`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_condition`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_creditmemo_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo_item`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_creditmemo_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo_item`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_comment' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_comment`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_comment\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_comment`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_comment`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_tmall_product' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_product`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_tmall_product\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_product`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_product`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_merchant' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_merchant`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_merchant\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_merchant`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_merchant`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_order_item' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_item`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_order_item\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_item`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_item`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_product_entity_int' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_int`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_product_entity_int\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_int`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_int`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_category_entity_int' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_int`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_category_entity_int\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_int`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_int`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_creditmemo' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_creditmemo\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_order_address' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_address`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_order_address\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_address`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_address`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_price' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_price`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_price\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_price`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_price`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m2epro_amazon_order' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m2epro_amazon_order\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.catalog_eav_attribute' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_eav_attribute`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.catalog_eav_attribute\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_eav_attribute`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_eav_attribute`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_shipment' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_shipment\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_flat_order_status_history' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_status_history`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_flat_order_status_history\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_status_history`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_status_history`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_rma' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_rma\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_collection' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_collection`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_collection\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_collection`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_collection`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.m_rma_status' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_status`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.m_rma_status\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_status`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_status`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sg_farfetch_sizes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizes`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sg_farfetch_sizes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizes`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizes`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.smv_tmall_order_log' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_log`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.smv_tmall_order_log\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_log`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_log`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sales_order_status' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_order_status`' AS database_object
    , 'magento_sync_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sales_order_status\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sales_order_status`\' AS database_object     , \'magento_sync_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_order_status`'
) AS freshness_query

  UNION ALL
  SELECT
      'magento.sumoheavy_imageimportdetail' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_imageimportdetail`' AS database_object
    , 'magento_sync' AS loader_or_source_name
    , cast('0-0 0 4:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 6:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'magento.sumoheavy_imageimportdetail\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_imageimportdetail`\' AS database_object     , \'magento_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 4:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 6:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 6:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 4:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_imageimportdetail`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.shipments' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipments`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.shipments\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipments`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipments`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.refunds' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`refunds`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.refunds\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`refunds`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`refunds`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.tracked_variant_changes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`tracked_variant_changes`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.tracked_variant_changes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`tracked_variant_changes`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`tracked_variant_changes`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.users' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`users`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.users\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`users`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`users`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.orders' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`orders`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.orders\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`orders`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`orders`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.products' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`products`' AS database_object
    , 'warehouse_sync_from_dss_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.products\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`products`\' AS database_object     , \'warehouse_sync_from_dss_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`products`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.master_variants' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_variants`' AS database_object
    , 'warehouse_sync_from_dss_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.master_variants\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_variants`\' AS database_object     , \'warehouse_sync_from_dss_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_variants`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.order_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`order_items`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.order_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`order_items`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`order_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.third_parties' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`third_parties`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.third_parties\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`third_parties`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`third_parties`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.refund_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`refund_items`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.refund_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`refund_items`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`refund_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.master_products' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_products`' AS database_object
    , 'warehouse_sync_from_dss_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.master_products\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_products`\' AS database_object     , \'warehouse_sync_from_dss_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_products`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.variants' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`variants`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.variants\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`variants`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`variants`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.credit_order_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`credit_order_items`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.credit_order_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`credit_order_items`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`credit_order_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'dss.shipping_labels' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipping_labels`' AS database_object
    , 'dss_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'dss.shipping_labels\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipping_labels`\' AS database_object     , \'dss_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipping_labels`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.tickets' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tickets`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.tickets\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tickets`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tickets`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_transfers' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_transfers\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pricing_variant_auto_approve_ranges' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_variant_auto_approve_ranges`' AS database_object
    , 'seller_portal_ether_pricing_variant_auto_approve_ranges' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pricing_variant_auto_approve_ranges\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_variant_auto_approve_ranges`\' AS database_object     , \'seller_portal_ether_pricing_variant_auto_approve_ranges\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'1900-01-01 00:00:00\',\'nan\',\'None\',\'\',\'NaT\',\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'1900-01-01 00:00:00\',\'nan\',\'None\',\'\',\'NaT\',\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'1900-01-01 00:00:00\',\'nan\',\'None\',\'\',\'NaT\',\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_variant_auto_approve_ranges`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_fms_payout_payments' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_payments`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_fms_payout_payments\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_payments`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_payments`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_inventory_units' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units`' AS database_object
    , 'seller_portal_ether_wms_inventory_units' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_inventory_units\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units`\' AS database_object     , \'seller_portal_ether_wms_inventory_units\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_orders' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_orders\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_purchase_order_notes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_notes`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_purchase_order_notes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_notes`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_notes`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_types' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_types`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_types\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_types`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_types`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_ledger_tenants' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_tenants`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_ledger_tenants\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_tenants`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_tenants`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_fms_payee_pay_method_configurations' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payee_pay_method_configurations`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_fms_payee_pay_method_configurations\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payee_pay_method_configurations`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payee_pay_method_configurations`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.shipments' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`shipments`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.shipments\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`shipments`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`shipments`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.bank_accounts' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`bank_accounts`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.bank_accounts\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`bank_accounts`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`bank_accounts`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_carriers' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_carriers`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_carriers\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_carriers`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_carriers`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_vendors' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendors`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_vendors\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendors`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendors`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.withdrawal_requested_products' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_request_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.withdrawal_requested_products\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_request_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_request_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.source_bundle_allocations' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_allocations`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.source_bundle_allocations\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_allocations`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_allocations`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_consignment_shipment_boxes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_shipment_boxes`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_consignment_shipment_boxes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_shipment_boxes`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_shipment_boxes`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_fms_payout_request_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requested_products`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_fms_payout_request_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requested_products`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requested_products`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.price_updates' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`price_updates`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.price_updates\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`price_updates`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`price_updates`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_fms_inventory_unit_commissions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_inventory_unit_commissions`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_fms_inventory_unit_commissions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_inventory_unit_commissions`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_inventory_unit_commissions`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_variants' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`variants`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_variants\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`variants`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`variants`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_fms_payout_requests' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requests`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_fms_payout_requests\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requests`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requests`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.countries' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`countries`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.countries\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`countries`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`countries`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_transfer_receipts' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_receipts`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_transfer_receipts\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_receipts`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_receipts`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_pick_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_pick_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_pick_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_pick_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_pick_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_sales_channels' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_sales_channels`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_sales_channels\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_sales_channels`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_sales_channels`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_item_categories' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pim_item_categories`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_item_categories\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pim_item_categories`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pim_item_categories`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.products' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`products`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.products\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`products`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`products`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_purchase_order_reviews' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_reviews`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_purchase_order_reviews\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_reviews`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_reviews`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_warehouse_bins' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouse_bins`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_warehouse_bins\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouse_bins`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouse_bins`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_purchase_order_line_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_line_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_purchase_order_line_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_line_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_line_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_ledger_events' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_events`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_ledger_events\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_events`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_events`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_transfer_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_transfer_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_shipment_manifests' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_manifests`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_shipment_manifests\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_manifests`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_manifests`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_vendor_notes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendor_notes`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_vendor_notes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendor_notes`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendor_notes`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_onport_request_logs' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_request_logs`' AS database_object
    , 'seller_portal_sync_onport_tables' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_onport_request_logs\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_request_logs`\' AS database_object     , \'seller_portal_sync_onport_tables\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_request_logs`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_onport_inventory_feed_variants' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_inventory_feed_variants`' AS database_object
    , 'seller_portal_sync_onport_tables' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_onport_inventory_feed_variants\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_inventory_feed_variants`\' AS database_object     , \'seller_portal_sync_onport_tables\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_onport_inventory_feed_variants`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.user_tax_forms' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`user_tax_forms`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.user_tax_forms\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`user_tax_forms`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`user_tax_forms`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_shipments' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipments`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_shipments\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipments`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipments`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.users' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.users\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.profiles' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`profiles`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.profiles\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`profiles`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`profiles`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_brands' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_brands`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_brands\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_brands`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_brands`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_product_variants' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_product_variants`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_product_variants\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_product_variants`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_product_variants`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.billing_addresses' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`billing_addresses`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.billing_addresses\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`billing_addresses`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`billing_addresses`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_fulfillments' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_fulfillments\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_rmas' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rmas`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_rmas\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rmas`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rmas`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_fms_payout_invoices' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_invoices`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_fms_payout_invoices\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_invoices`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_invoices`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_country_of_origins' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_country_region_origins`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_country_of_origins\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_country_region_origins`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_country_region_origins`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_delivery_methods' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_delivery_methods`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_delivery_methods\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_delivery_methods`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_delivery_methods`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_ledger_accounts' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_ledger_accounts\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_intake_notes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_intake_notes`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_intake_notes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_intake_notes`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_intake_notes`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_intake_pickup_appointment_line_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_intake_pickup_appointment_line_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_intake_pickup_appointment_line_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_intake_pickup_appointment_line_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_intake_pickup_appointment_line_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.vw_zserialupds_dss' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`vw_zserialupds_dss`' AS database_object
    , 'warehouse_sync_from_seller_portal_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.vw_zserialupds_dss\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`vw_zserialupds_dss`\' AS database_object     , \'warehouse_sync_from_seller_portal_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`vw_zserialupds_dss`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.product_profiles' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_profiles`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.product_profiles\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_profiles`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_profiles`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_order_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 1:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 2:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_order_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 1:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 1:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.employees' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`employees`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.employees\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`employees`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`employees`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_order_versions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_versions`' AS database_object
    , 'warehouse_incremental_seller_portal_ether_oms_order_versions' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_order_versions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_versions`\' AS database_object     , \'warehouse_incremental_seller_portal_ether_oms_order_versions\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(`_synched_from_source_at` as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(`_synched_from_source_at` as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_versions`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.promotions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`promotions`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.promotions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`promotions`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`promotions`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.source_bundles' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundles`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.source_bundles\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundles`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundles`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_fms_payees' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payees`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_fms_payees\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payees`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payees`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.source_bundle_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.source_bundle_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_genders' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_genders`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_genders\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_genders`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_genders`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.consignment_storage_fee_inventory_unit_snapshots' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_inventory_unit_snapshots`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.consignment_storage_fee_inventory_unit_snapshots\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_inventory_unit_snapshots`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_inventory_unit_snapshots`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_products' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_products`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_products\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_products`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_products`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_categories' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_categories`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_categories\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_categories`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_categories`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.contact_preferences' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`contact_preferences`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.contact_preferences\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`contact_preferences`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`contact_preferences`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_purchase_orders' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_orders`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_purchase_orders\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_orders`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_orders`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_colors' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_colors`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_colors\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_colors`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_colors`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_intake_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_intake_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_warehouses' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouses`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_warehouses\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouses`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouses`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_purchase_order_pdfs' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_pdfs`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_purchase_order_pdfs\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_pdfs`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_pdfs`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_intake_receipts' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`receipts`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_intake_receipts\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`receipts`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`receipts`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_product_conditions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_conditions`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_product_conditions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_conditions`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_conditions`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_ledger_entries' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_entries`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_ledger_entries\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_entries`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_entries`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_inventory_unit_versions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_unit_versions`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_inventory_unit_versions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_unit_versions`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_unit_versions`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_purchase_order_review_records' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_review_records`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_purchase_order_review_records\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_review_records`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_review_records`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_reallocations' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_reallocations`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_reallocations\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_reallocations`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_reallocations`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_shipment_documents' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_documents`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_shipment_documents\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_documents`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_documents`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_wms_allocations' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_wms_allocations\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_products' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_products`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_products\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_products`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_products`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_ledger_amounts' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_amounts`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_ledger_amounts\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_amounts`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_amounts`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.source_bundle_payments' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.source_bundle_payments\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pricing_price_histories' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_price_histories`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pricing_price_histories\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_price_histories`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_price_histories`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_consignment_storage_fees' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fees`' AS database_object
    , 'seller_portal_order_entries_consignment_items_ledger_entries_shipments_variants' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_consignment_storage_fees\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fees`\' AS database_object     , \'seller_portal_order_entries_consignment_items_ledger_entries_shipments_variants\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fees`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.print_labels' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`print_labels`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.print_labels\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`print_labels`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`print_labels`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.regions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`regions`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.regions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`regions`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(      SAFE_CAST(TIMESTAMP(SAFE_CAST(     safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  AS datetime), \'Etc/UTC\') AS timestamp) as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`regions`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_tariff_schedule_codes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tariff_schedule_codes`' AS database_object
    , 'warehouse_sync_from_seller_portal_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_tariff_schedule_codes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tariff_schedule_codes`\' AS database_object     , \'warehouse_sync_from_seller_portal_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tariff_schedule_codes`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.commercial_versions' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_versions`' AS database_object
    , 'warehouse_sync_from_seller_portal_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 12:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 18:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.commercial_versions\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_versions`\' AS database_object     , \'warehouse_sync_from_seller_portal_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 12:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 18:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 18:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 12:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_versions`'
) AS freshness_query

  UNION ALL
  SELECT
      'ether.consignment_storage_fee_consignor_settings' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_consignor_settings`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'ether.consignment_storage_fee_consignor_settings\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_consignor_settings`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_consignor_settings`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_oms_rma_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_oms_rma_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_consignment_ticket_items' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_ticket_items`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_consignment_ticket_items\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_ticket_items`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_ticket_items`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.ether_pim_tax_codes' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tax_codes`' AS database_object
    , 'warehouse_sync_from_seller_portal_table_rebuilds' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.ether_pim_tax_codes\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tax_codes`\' AS database_object     , \'warehouse_sync_from_seller_portal_table_rebuilds\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tax_codes`'
) AS freshness_query

  UNION ALL
  SELECT
      'seller_portal.withdrawal_requests' AS dbt_relation
    , '`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_requests`' AS database_object
    , 'seller_portal_sync' AS loader_or_source_name
    , cast('0-0 0 2:0:0' AS interval) AS freshness_warning_threshold
    , cast('0-0 0 3:0:0' AS interval) AS freshness_error_threshold
    , trim(
  'SELECT       \'seller_portal.withdrawal_requests\' AS dbt_relation     , \'`ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_requests`\' AS database_object     , \'seller_portal_sync\' AS loader_or_source_name     , \'_synched_from_source_at\' AS loaded_at_field     , cast(\'0-0 0 2:0:0\' AS interval) AS freshness_warning_threshold     , cast(\'0-0 0 3:0:0\' AS interval) AS freshness_error_threshold     , current_timestamp AS freshness_checked_at     , (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval)) AS freshness_warning_deadline     , (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval)) AS freshness_error_deadline     , max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) ) AS last_loaded_at     , CASE         WHEN (           max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 3:0:0\' AS interval))         )           THEN cast(\'error\' AS string)         WHEN (             max(     safe_cast(           safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) IN (\'nan\',\'None\',\'\',\'NaT\') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), \'\') AS string) END as timestamp)  as timestamp) )           < (current_timestamp - cast(\'0-0 0 2:0:0\' AS interval))         )            THEN cast(\'warning\' AS string)         ELSE           cast(\'fresh\' AS string)       END AS freshness   FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_requests`'
) AS freshness_query