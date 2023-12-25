





WITH account_entries AS (

  SELECT
      amounts.`ether_ledger_amount_id`,
  amounts.`account_entry_amount`,
  amounts.`account_entry_currency`,
  amounts.`account_entry_type`
    , entries.`ether_ledger_entry_id`,
  entries.`entry_description`,
  entries.`entry_processed_at`,
  entries.`entry_date`
    , events.`ether_ledger_event_id`,
  events.`event_type`,
  events.`signature`,
  events.`source_id`,
  events.`source_type`,
  events.`ether_fms_accrual_id`,
  events.`ether_fms_manual_adjustment_id`,
  events.`payment_request_id`,
  events.`event_payload`,
  events.`event_processed_at`,
  events.`event_date`,
  events.`event_state`
    , accounts.`ether_ledger_account_id`,
  accounts.`account_type`,
  accounts.`account_balance_type`,
  accounts.`account_balance_currency`,
  accounts.`lock_version`,
  accounts.`account_code`,
  accounts.`ether_ledger_tenant_id`,
  accounts.`owner_type`,
  accounts.`owner_id`,
  accounts.`user_id`,
  accounts.`tenant_name`,
  accounts.`_raw_currency`,
  accounts.`consignor_id`,
  accounts.`consignor_email`,
  accounts.`inventory_relationship`,
  accounts.`account_created_at`,
  accounts.`account_updated_at`,
  accounts.`account__synched_from_source_at`,
  accounts.`tenant_created_at`,
  accounts.`tenant_updated_at`,
  accounts.`tenant__synched_from_source_at`
    , accounts.account_balance_amount AS account_final_balance
    , CASE
        WHEN accounts.account_balance_type = amounts.account_entry_type
        THEN 1
        ELSE -1
      END * amounts.account_entry_amount AS account_balance_change


    , amounts.created_at AS amount_created_at

    , amounts.updated_at AS amount_updated_at

    , amounts._synched_from_source_at AS amount__synched_from_source_at



    , events.created_at AS event_created_at

    , events.updated_at AS event_updated_at

    , events._synched_from_source_at AS event__synched_from_source_at



    , entries.created_at AS entry_created_at

    , entries.updated_at AS entry_updated_at

    , entries._synched_from_source_at AS entry__synched_from_source_at


  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_ledger_amounts` AS amounts -- ether_ledger_amount_id is PK for result set
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_ledger_entries` AS entries
    ON amounts.ether_ledger_entry_id = entries.ether_ledger_entry_id -- many amounts to one entry
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_ledger_events` AS events
    ON entries.ether_ledger_event_id = events.ether_ledger_event_id -- many entries to one event
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_ledger_tenant_accounts` AS accounts
    ON amounts.ether_ledger_account_id = accounts.ether_ledger_account_id -- many amounts to one account (many entries to many accounts)

), final AS (

  SELECT
      *
    , row_number() OVER (
        PARTITION BY ether_ledger_account_id
        ORDER BY entry_processed_at, event_processed_at
      ) AS account_entry_row
    , sum(account_balance_change) OVER (
        PARTITION BY ether_ledger_account_id
        ORDER BY entry_processed_at, event_processed_at ROWS UNBOUNDED PRECEDING
      ) AS account_running_balance
    , max(
        safe_cast(datetime(safe_cast(entry_processed_at AS timestamp), 'America/New_York') AS datetime)
      ) OVER (
      ) AS ledger_last_entry_processed_at_us_eastern
    , CASE account_code
        WHEN 'Sale Revenue' THEN 0
        WHEN 'Commissions' THEN 1
        WHEN 'Returned Sales Revenue' THEN 2
        WHEN 'Returned Commissions' THEN 3
        WHEN 'Manual Adjustments' THEN 4
        WHEN 'Payouts Requested' THEN 5
        WHEN 'Payout Fees' THEN 6
        WHEN 'Payouts Paid Out' THEN 7
        WHEN 'Aged Inventory Fees' THEN 8
        WHEN 'Penalties' THEN 9
        WHEN 'Current Balance' THEN 10
      END AS account_code_sort
    , current_timestamp AS rebuild_timestamp
  FROM account_entries

)

SELECT * FROM final