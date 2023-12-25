

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_payables_snapshot`
  
  
  OPTIONS()
  as (
    





  

  

  






  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  




        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_3p_payables_20231114`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`x3_sku` as STRING) as `x3_sku` ,
                    cast(`consignor_id` as STRING) as `consignor_id` ,
                    cast(`yseristatus_paid_out_status` as STRING) as `yseristatus_paid_out_status` ,
                    cast(`yseristatus_consignment_status` as STRING) as `yseristatus_consignment_status` ,
                    cast(`yseristatus_issue_date` as DATE) as `yseristatus_issue_date` ,
                    cast(`payout_base_currency` as STRING) as `payout_base_currency` ,
                    cast(`payout_base_amount` as FLOAT64) as `payout_base_amount` ,
                    cast(`payout_amount` as FLOAT64) as `payout_amount` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_id` as STRING) as `payout_invoice_id` ,
                    cast(`payout_invoice_line` as INT64) as `payout_invoice_line` ,
                    cast(`payment_date` as DATE) as `payment_date` ,
                    cast(`payout_paid` as FLOAT64) as `payout_paid` ,
                    cast(`payout_pending` as FLOAT64) as `payout_pending` ,
                    cast(`sales_price` as FLOAT64) as `sales_price` ,
                    cast(`commission` as FLOAT64) as `commission` ,
                    cast(`serial_source` as STRING) as `serial_source` ,
                    cast(`consignor_name` as STRING) as `consignor_name` ,
                    cast(`payment_id` as STRING) as `payment_id` ,
                    cast(`payment_accounting_date` as DATE) as `payment_accounting_date` ,
                    cast(`x3_order_id` as STRING) as `x3_order_id` ,
                    cast(`x3_order_line` as INT64) as `x3_order_line` ,
                    cast(`stadium_order_id` as STRING) as `stadium_order_id` ,
                    cast(`reporting_status` as STRING) as `reporting_status` ,
                    cast(`reporting_date` as DATE) as `reporting_date` ,
                    cast(`inventory_base_currency` as STRING) as `inventory_base_currency` ,
                    cast(`consignor_payouts_payable_base_amount` as NUMERIC) as `consignor_payouts_payable_base_amount` ,
                    cast(`consignor_payouts_payable` as NUMERIC) as `consignor_payouts_payable` ,
                    cast(`consignor_payouts_returned_base_amount` as NUMERIC) as `consignor_payouts_returned_base_amount` ,
                    cast(`consignor_payouts_returned` as NUMERIC) as `consignor_payouts_returned` ,
                    cast(`consignor_payouts_credit_to_1p_inventory_base_amount` as NUMERIC) as `consignor_payouts_credit_to_1p_inventory_base_amount` ,
                    cast(`consignor_payouts_credit_to_1p_inventory` as NUMERIC) as `consignor_payouts_credit_to_1p_inventory` ,
                    cast(`consignor_payouts_total_base_amount` as NUMERIC) as `consignor_payouts_total_base_amount` ,
                    cast(`consignor_payouts_total` as NUMERIC) as `consignor_payouts_total` ,
                    cast(`rebuild_timestamp` as TIMESTAMP) as `rebuild_timestamp` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_3p_payables_20231114`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_3p_payables_20230113`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`x3_sku` as STRING) as `x3_sku` ,
                    cast(`consignor_id` as STRING) as `consignor_id` ,
                    cast(`yseristatus_paid_out_status` as STRING) as `yseristatus_paid_out_status` ,
                    cast(`yseristatus_consignment_status` as STRING) as `yseristatus_consignment_status` ,
                    cast(`yseristatus_issue_date` as DATE) as `yseristatus_issue_date` ,
                    cast(`payout_base_currency` as STRING) as `payout_base_currency` ,
                    cast(`payout_base_amount` as FLOAT64) as `payout_base_amount` ,
                    cast(`payout_amount` as FLOAT64) as `payout_amount` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_id` as STRING) as `payout_invoice_id` ,
                    cast(`payout_invoice_line` as INT64) as `payout_invoice_line` ,
                    cast(`payment_date` as DATE) as `payment_date` ,
                    cast(`payout_paid` as FLOAT64) as `payout_paid` ,
                    cast(`payout_pending` as FLOAT64) as `payout_pending` ,
                    cast(`sales_price` as FLOAT64) as `sales_price` ,
                    cast(`commission` as FLOAT64) as `commission` ,
                    cast(`serial_source` as STRING) as `serial_source` ,
                    cast(`consignor_name` as STRING) as `consignor_name` ,
                    cast(`payment_id` as STRING) as `payment_id` ,
                    cast(`payment_accounting_date` as DATE) as `payment_accounting_date` ,
                    cast(`x3_order_id` as STRING) as `x3_order_id` ,
                    cast(`x3_order_line` as INT64) as `x3_order_line` ,
                    cast(`stadium_order_id` as STRING) as `stadium_order_id` ,
                    cast(`reporting_status` as STRING) as `reporting_status` ,
                    cast(`reporting_date` as DATE) as `reporting_date` ,
                    cast(`inventory_base_currency` as STRING) as `inventory_base_currency` ,
                    cast(`consignor_payouts_payable_base_amount` as NUMERIC) as `consignor_payouts_payable_base_amount` ,
                    cast(`consignor_payouts_payable` as NUMERIC) as `consignor_payouts_payable` ,
                    cast(`consignor_payouts_returned_base_amount` as NUMERIC) as `consignor_payouts_returned_base_amount` ,
                    cast(`consignor_payouts_returned` as NUMERIC) as `consignor_payouts_returned` ,
                    cast(`consignor_payouts_credit_to_1p_inventory_base_amount` as NUMERIC) as `consignor_payouts_credit_to_1p_inventory_base_amount` ,
                    cast(`consignor_payouts_credit_to_1p_inventory` as NUMERIC) as `consignor_payouts_credit_to_1p_inventory` ,
                    cast(`consignor_payouts_total_base_amount` as NUMERIC) as `consignor_payouts_total_base_amount` ,
                    cast(`consignor_payouts_total` as NUMERIC) as `consignor_payouts_total` ,
                    cast(`rebuild_timestamp` as TIMESTAMP) as `rebuild_timestamp` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_3p_payables_20230113`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_3p_payables_20231205`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`x3_sku` as STRING) as `x3_sku` ,
                    cast(`consignor_id` as STRING) as `consignor_id` ,
                    cast(`yseristatus_paid_out_status` as STRING) as `yseristatus_paid_out_status` ,
                    cast(`yseristatus_consignment_status` as STRING) as `yseristatus_consignment_status` ,
                    cast(`yseristatus_issue_date` as DATE) as `yseristatus_issue_date` ,
                    cast(`payout_base_currency` as STRING) as `payout_base_currency` ,
                    cast(`payout_base_amount` as FLOAT64) as `payout_base_amount` ,
                    cast(`payout_amount` as FLOAT64) as `payout_amount` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_id` as STRING) as `payout_invoice_id` ,
                    cast(`payout_invoice_line` as INT64) as `payout_invoice_line` ,
                    cast(`payment_date` as DATE) as `payment_date` ,
                    cast(`payout_paid` as FLOAT64) as `payout_paid` ,
                    cast(`payout_pending` as FLOAT64) as `payout_pending` ,
                    cast(`sales_price` as FLOAT64) as `sales_price` ,
                    cast(`commission` as FLOAT64) as `commission` ,
                    cast(`serial_source` as STRING) as `serial_source` ,
                    cast(`consignor_name` as STRING) as `consignor_name` ,
                    cast(`payment_id` as STRING) as `payment_id` ,
                    cast(`payment_accounting_date` as DATE) as `payment_accounting_date` ,
                    cast(`x3_order_id` as STRING) as `x3_order_id` ,
                    cast(`x3_order_line` as INT64) as `x3_order_line` ,
                    cast(`stadium_order_id` as STRING) as `stadium_order_id` ,
                    cast(`reporting_status` as STRING) as `reporting_status` ,
                    cast(`reporting_date` as DATE) as `reporting_date` ,
                    cast(`inventory_base_currency` as STRING) as `inventory_base_currency` ,
                    cast(`consignor_payouts_payable_base_amount` as NUMERIC) as `consignor_payouts_payable_base_amount` ,
                    cast(`consignor_payouts_payable` as NUMERIC) as `consignor_payouts_payable` ,
                    cast(`consignor_payouts_returned_base_amount` as NUMERIC) as `consignor_payouts_returned_base_amount` ,
                    cast(`consignor_payouts_returned` as NUMERIC) as `consignor_payouts_returned` ,
                    cast(`consignor_payouts_credit_to_1p_inventory_base_amount` as NUMERIC) as `consignor_payouts_credit_to_1p_inventory_base_amount` ,
                    cast(`consignor_payouts_credit_to_1p_inventory` as NUMERIC) as `consignor_payouts_credit_to_1p_inventory` ,
                    cast(`consignor_payouts_total_base_amount` as NUMERIC) as `consignor_payouts_total_base_amount` ,
                    cast(`consignor_payouts_total` as NUMERIC) as `consignor_payouts_total` ,
                    cast(`rebuild_timestamp` as TIMESTAMP) as `rebuild_timestamp` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_3p_payables_20231205`
        )

        
  );
    