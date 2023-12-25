

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_1p_recon_snapshots`
  OPTIONS()
  as 







  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  






  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  




        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_1p_inventory_recon_events`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(null as DATE) as `snapshot_date` ,
                    cast(null as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_1p_inventory_recon_events`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220105`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220105`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230604`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230604`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220204`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220204`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230803`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230803`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220602`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220602`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221204`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221204`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220504`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220504`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220705`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220705`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211201`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211201`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231201`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231201`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230109`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230109`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210902`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210902`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220701`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220701`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210601`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210601`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230301`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230301`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231113`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231113`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220404`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220404`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220901`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220901`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230701`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230701`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231001`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231001`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230207`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230207`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230801`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230801`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221005`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221005`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220804`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220804`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220906`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220906`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210602`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210602`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231205`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231205`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210702`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210702`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210701`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210701`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220201`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220201`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220801`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220801`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230204`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230204`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231003`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231003`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210802`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210802`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230304`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230304`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221101`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221101`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210505`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(`row_num` as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210505`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220904`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220904`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211101`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211101`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230804`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230804`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230303`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230303`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230404`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230404`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211102`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211102`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221206`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221206`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230101`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230101`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220301`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220301`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220303`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220303`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230104`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230104`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230113`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230113`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231002`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231002`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230905`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230905`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220601`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220601`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221202`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221202`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220101`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220101`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231005`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231005`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210804`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210804`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220401`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220401`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210805`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210805`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230504`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230504`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221103`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221103`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210401`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(null as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(null as INT64) as `snapshot_row` ,
                    cast(`row_num` as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210401`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220106`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220106`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211004`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211004`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231107`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231107`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221003`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221003`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210501`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(`row_num` as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210501`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230606`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230606`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230401`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230401`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230601`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230601`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231114`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231114`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221004`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221004`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231106`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20231106`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211207`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211207`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230501`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230501`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221104`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20221104`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211103`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20211103`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230201`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230201`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210901`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210901`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230704`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230704`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230809`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230809`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210727`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20210727`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230901`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(`serial_base_currency` as STRING) as `serial_base_currency` ,
                    cast(`serial_cost_base_amount` as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20230901`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220501`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220501`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220611`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_relationship` as STRING) as `serial_relationship` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`serial_inventory` as STRING) as `serial_inventory` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`event_class` as STRING) as `event_class` ,
                    cast(`event_type` as STRING) as `event_type` ,
                    cast(`event_class_reference_name` as STRING) as `event_class_reference_name` ,
                    cast(`event_class_reference` as STRING) as `event_class_reference` ,
                    cast(`event_type_reference_name` as STRING) as `event_type_reference_name` ,
                    cast(`event_type_reference` as STRING) as `event_type_reference` ,
                    cast(`qty_finance` as INT64) as `qty_finance` ,
                    cast(`qty_ops` as INT64) as `qty_ops` ,
                    cast(`qty_commercial` as INT64) as `qty_commercial` ,
                    cast(`warehouse` as STRING) as `warehouse` ,
                    cast(`house_account` as STRING) as `house_account` ,
                    cast(`purchase_order` as STRING) as `purchase_order` ,
                    cast(null as STRING) as `serial_base_currency` ,
                    cast(null as FLOAT64) as `serial_cost_base_amount` ,
                    cast(`serial_cost` as FLOAT64) as `serial_cost` ,
                    cast(`inventory_type` as STRING) as `inventory_type` ,
                    cast(`simple_sku` as STRING) as `simple_sku` ,
                    cast(`brand` as STRING) as `brand` ,
                    cast(`brand_subcategory` as STRING) as `brand_subcategory` ,
                    cast(`payout_invoice_date` as DATE) as `payout_invoice_date` ,
                    cast(`payout_invoice_paid_amount` as FLOAT64) as `payout_invoice_paid_amount` ,
                    cast(`payout_invoice_payable_amount` as FLOAT64) as `payout_invoice_payable_amount` ,
                    cast(`payout_invoice_paid_date` as DATE) as `payout_invoice_paid_date` ,
                    cast(`last_known_warehouse` as STRING) as `last_known_warehouse` ,
                    cast(`attribute_set` as STRING) as `attribute_set` ,
                    cast(`snapshot_date` as DATE) as `snapshot_date` ,
                    cast(`snapshot_row` as INT64) as `snapshot_row` ,
                    cast(null as INT64) as `row_num` 

            from `ff-stadiumgoods-raw-live`.`finance_snapshots`.`tableau_1p_inventory_recon_events_20220611`
        )

        ;

