SELECT
  `_dbt_source_relation`,
  `serial_relationship`,
  `serial_number`,
  `serial_inventory`,
  `transaction_date`,
  `event_type`,
  `event_class_reference_name`,
  `event_class_reference`,
  `event_type_reference_name`,
  `event_type_reference`,
  `qty_finance`,
  `qty_ops`,
  `qty_commercial`,
  `warehouse`,
  `house_account`,
  `purchase_order`,
  `serial_base_currency`,
  `serial_cost_base_amount`,
  `serial_cost`,
  `inventory_type`,
  `simple_sku`,
  `brand`,
  `brand_subcategory`,
  `payout_invoice_date`,
  `payout_invoice_paid_amount`,
  `payout_invoice_payable_amount`,
  `payout_invoice_paid_date`,
  `last_known_warehouse`,
  `attribute_set`,
  `snapshot_row`,
  `row_num`
  , CASE WHEN event_class = 'Manually Deleted' THEN 'Misc'
      ELSE event_class
      END AS event_class   --Corrects naming change made after first snapshot.
  , coalesce(
        snapshot_date
      , safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 
  r'America/New_York'
) AS date)
    ) AS snapshot_date
  , CASE
      WHEN snapshot_date IS NOT NULL
      THEN cast('snapshot' AS string)
      ELSE cast('live' AS string)
    END AS snapshot_source
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_1p_recon_snapshots`