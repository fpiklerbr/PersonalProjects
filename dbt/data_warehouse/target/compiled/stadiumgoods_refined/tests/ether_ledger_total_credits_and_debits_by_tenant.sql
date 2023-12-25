
with dbt__CTE__INTERNAL_test as (
SELECT
    ether_ledger_tenant_id
  , sum(CASE WHEN account_entry_type = 'Credit' THEN account_entry_amount ELSE 0 END) AS total_credits
  , sum(CASE WHEN account_entry_type = 'Debit' THEN account_entry_amount ELSE 0 END) AS total_debits
FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`ether_ledger_account_entries`
GROUP BY 1
HAVING sum(CASE WHEN account_entry_type = 'Credit' THEN account_entry_amount ELSE 0 END) <> sum(CASE WHEN account_entry_type = 'Debit' THEN account_entry_amount ELSE 0 END)
)select count(*) from dbt__CTE__INTERNAL_test