SELECT
    ether_ledger_account_id
  , account_final_balance
  , sum(account_balance_change) AS total_account_balance_change
FROM {{ ref('ether_ledger_account_entries') }}
GROUP BY 1
HAVING account_final_balance <> sum(account_balance_change)
