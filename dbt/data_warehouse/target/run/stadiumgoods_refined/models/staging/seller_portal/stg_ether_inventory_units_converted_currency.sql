

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units_converted_currency`
  
  
  OPTIONS()
  as (
    WITH last_change AS (

  SELECT
      ether_wms_inventory_unit_id
    , max(
        CASE
          WHEN attribute_name = 'payout_cents' AND new_value IS NOT NULL AND (new_value <> old_value OR old_value IS NULL)
          THEN created_at
        END
      ) AS _3p_payout_changed_at
    , max(
        CASE
          WHEN attribute_name = 'cost_cents' AND new_value IS NOT NULL AND (new_value <> old_value OR old_value IS NULL)
          THEN created_at
        END
      ) AS _1p_cost_changed_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_attribute_changes`
  WHERE ether_wms_inventory_unit_id IS NOT NULL
  GROUP BY 1

), inventory_units_with_dates AS (

  SELECT
      inventory_units.ether_wms_inventory_unit_id
    , price_history_summary.price_last_changed_at AS price_changed_at
    , coalesce(safe_cast(datetime(safe_cast(price_history_summary.price_last_changed_at AS timestamp), 
  r'America/New_York'
) AS date), inventory_units.intake_date
      ) AS price_currency_conversion_date
    , last_change._3p_payout_changed_at
    , coalesce(safe_cast(datetime(safe_cast(last_change._3p_payout_changed_at AS timestamp), 
  r'America/New_York'
) AS date), inventory_units.intake_date
      ) AS _3p_payout_currency_conversion_date
    , last_change._1p_cost_changed_at
    , coalesce(safe_cast(datetime(safe_cast(last_change._1p_cost_changed_at AS timestamp), 
  r'America/New_York'
) AS date), inventory_units.intake_date
      ) AS _1p_cost_currency_conversion_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
  LEFT JOIN last_change
    ON inventory_units.ether_wms_inventory_unit_id = last_change.ether_wms_inventory_unit_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_price_history_summary` AS price_history_summary
    ON inventory_units.ether_wms_inventory_unit_id = price_history_summary.ether_wms_inventory_unit_id

), currency_conversion AS (

SELECT
    inventory_units.`ether_wms_inventory_unit_id`,
  inventory_units.`serial_number`,
  inventory_units.`business_entity`,
  inventory_units.`consignment_status`,
  inventory_units.`paid_out_status`,
  inventory_units.`intake_date`,
  inventory_units.`sold_at`,
  inventory_units.`x3_creation_date`,
  inventory_units.`is_dropshipped`,
  inventory_units.`ether_pim_product_condition_id_1`,
  inventory_units.`ether_pim_product_condition_id_2`,
  inventory_units.`ether_pim_product_condition_id_3`,
  inventory_units.`ether_pim_product_condition_id_4`,
  inventory_units.`ether_pim_product_condition_id_5`,
  inventory_units.`issue_date`,
  inventory_units.`lock_version`,
  inventory_units.`created_at`,
  inventory_units.`updated_at`,
  inventory_units.`locked_for_x3_update_at`,
  inventory_units.`invoice_number`,
  inventory_units.`returned_at`,
  inventory_units.`original_ether_wms_inventory_unit_id`,
  inventory_units.`size`,
  inventory_units.`product_id`,
  inventory_units.`stock_status_label`,
  inventory_units.`stock_status`,
  inventory_units.`source_updated_at`,
  inventory_units.`dss_item_id`,
  inventory_units.`dss_incremental_id`,
  inventory_units.`sales_channel`,
  inventory_units.`label_number`,
  inventory_units.`_synched_from_source_at`,
  inventory_units.`_raw_in_display_case`,
  inventory_units.`_raw_label_generated_at`,
  inventory_units.`commission_rate`,
  inventory_units.`conditions`,
  inventory_units.`inventory_unit_user_id`,
  inventory_units.`consignor_id`,
  inventory_units.`ether_wms_product_variant_id`,
  inventory_units.`simple_sku`,
  inventory_units.`product_number`,
  inventory_units.`size_code`,
  inventory_units.`ether_wms_warehouse_id`,
  inventory_units.`warehouse_code`,
  inventory_units.`ether_wms_warehouse_bin_id`,
  inventory_units.`warehouse_bin`,
  inventory_units.`label_number_valid_from`,
  inventory_units.`label_number_valid_to`,
  inventory_units.`original_serial_number`,
  inventory_units.`relation_to_original_serial_number`,
  inventory_units.`inventory_relationship`,
  inventory_units.`inventory_type`,
  inventory_units.`payment_request_ids`,
  inventory_units.`payment_request_created_at`,
  inventory_units.`last_payment_request_created_at`,
  inventory_units.`payment_request_status`,
  inventory_units.`payment_request_sla_deadline`,
  inventory_units.`payment_request_pay_method`,
  inventory_units.`ether_payment_third_party_identifier`,
  inventory_units.`ether_payment_submitted_to_provider_at`,
  inventory_units.`ether_payment_payout_date`,
  inventory_units.`payout_invoice_number`,
  inventory_units.`payout_request_user_id`,
  inventory_units.`withdrawal_request_ids`,
  inventory_units.`first_withdrawal_request_created_at`,
  inventory_units.`last_withdrawal_request_id`,
  inventory_units.`last_withdrawal_request_created_at`,
  inventory_units.`last_withdrawal_request_submitted_at`,
  inventory_units.`last_withdrawal_request_deleted_at`,
  inventory_units.`last_withdrawal_request_status`,
  inventory_units.`last_withdrawal_request_warehouse`,
  inventory_units.`last_withdrawal_request_note`,
  inventory_units.`last_withdrawal_request_user_id`,
  inventory_units.`label_swap_occurred`,
  inventory_units.`destination_serial_number`,
  inventory_units.`origin_price_base_amount`,
  inventory_units.`origin_warehouse_bin`,
  inventory_units.`origin_warehouse_code`,
  inventory_units.`swapped_at`
  , inventory_units.base_currency
  , inventory_units.price_base_amount
  , inventory_units_with_dates.price_changed_at
  , inventory_units_with_dates.price_currency_conversion_date
  , CASE WHEN inventory_units.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END AS price_currency_conversion_rate
  , round(inventory_units.price_base_amount * CASE WHEN inventory_units.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END, 2) AS price
  , inventory_units._3p_payout_base_amount
  , inventory_units_with_dates._3p_payout_changed_at
  , inventory_units_with_dates._3p_payout_currency_conversion_date
  , CASE WHEN inventory_units.base_currency = 'USD' THEN 1.0 ELSE cast(_3p_payout_conversion.in_usd AS numeric) END AS _3p_payout_currency_conversion_rate
  , round(inventory_units._3p_payout_base_amount * CASE WHEN inventory_units.base_currency = 'USD' THEN 1.0 ELSE cast(_3p_payout_conversion.in_usd AS numeric) END, 2) AS _3p_payout
  , inventory_units._1p_cost_base_amount
  , inventory_units_with_dates._1p_cost_changed_at
  , inventory_units_with_dates._1p_cost_currency_conversion_date
  , CASE WHEN inventory_units.base_currency = 'USD' THEN 1.0 ELSE cast(_1p_cost_conversion.in_usd AS numeric) END AS _1p_cost_currency_conversion_rate
  , round(inventory_units._1p_cost_base_amount * CASE WHEN inventory_units.base_currency = 'USD' THEN 1.0 ELSE cast(_1p_cost_conversion.in_usd AS numeric) END, 2) AS _1p_cost
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
INNER JOIN inventory_units_with_dates
  ON inventory_units.ether_wms_inventory_unit_id = inventory_units_with_dates.ether_wms_inventory_unit_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS price_conversion -- at most one to one
  ON inventory_units.base_currency = price_conversion.currency
  AND inventory_units_with_dates.price_currency_conversion_date = price_conversion.transaction_date
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS _3p_payout_conversion -- at most one to one
  ON inventory_units.base_currency = _3p_payout_conversion.currency
  AND inventory_units_with_dates._3p_payout_currency_conversion_date = _3p_payout_conversion.transaction_date
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS _1p_cost_conversion -- at most one to one
  ON inventory_units.base_currency = _1p_cost_conversion.currency
  AND inventory_units_with_dates._1p_cost_currency_conversion_date = _1p_cost_conversion.transaction_date

), final AS (

  SELECT
      *

    , CASE WHEN inventory_relationship = '1P' THEN _1p_cost_base_amount ELSE _3p_payout_base_amount END AS cost_base_amount

    , CASE WHEN inventory_relationship = '1P' THEN _1p_cost_changed_at ELSE _3p_payout_changed_at END AS cost_changed_at

    , CASE WHEN inventory_relationship = '1P' THEN _1p_cost_currency_conversion_date ELSE _3p_payout_currency_conversion_date END AS cost_currency_conversion_date

    , CASE WHEN inventory_relationship = '1P' THEN _1p_cost_currency_conversion_rate ELSE _3p_payout_currency_conversion_rate END AS cost_currency_conversion_rate

    , CASE WHEN inventory_relationship = '1P' THEN _1p_cost ELSE _3p_payout END AS cost

  FROM currency_conversion

)

SELECT * FROM final
  );
    