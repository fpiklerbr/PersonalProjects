
with dbt__CTE__INTERNAL_test as (
SELECT
    ether_ledger_account_id
  , account_final_balance
  , sum(account_balance_change) AS total_account_balance_change
FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`ether_ledger_account_entries`
GROUP BY 1
HAVING account_final_balance <> sum(account_balance_change)
)select count(*) from dbt__CTE__INTERNAL_test