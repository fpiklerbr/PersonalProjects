SELECT
    ether_ledger_event_id
  , sum(CASE WHEN account_entry_type = 'Credit' THEN account_entry_amount ELSE 0 END) AS total_credits
  , sum(CASE WHEN account_entry_type = 'Debit' THEN account_entry_amount ELSE 0 END) AS total_debits
FROM {{ ref('ether_ledger_account_entries') }}
GROUP BY 1
HAVING sum(CASE WHEN account_entry_type = 'Credit' THEN account_entry_amount ELSE 0 END) <> sum(CASE WHEN account_entry_type = 'Debit' THEN account_entry_amount ELSE 0 END)
