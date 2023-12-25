

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_ether_account_balances`
  
  
  OPTIONS()
  as (
    


WITH consignor_current_balance_accounts AS (

  SELECT
      consignor_email
    , consignor_id
    , account_balance_amount AS balance_amount
    , tenant_name
    , user_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_ledger_tenant_accounts`
  WHERE account_code = 'Current Balance'
    AND user_id IS NOT NULL
    AND inventory_relationship = '3P'

), hyperwallet_status AS (

  SELECT
    payouts.configuration
  , payouts.user_token
  , payouts.configuration_status
  , payouts.pay_method
  , payouts.created_at
  , payees.user_id
  , payees.payee_token
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payee_pay_method_configurations` AS payouts
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payees` AS payees
  ON payees.ether_fms_payee_id = payouts.ether_fms_payee_id

), joined AS (

  SELECT
    consignor_current_balance_accounts.consignor_email
  , consignor_current_balance_accounts.consignor_id
  , consignor_current_balance_accounts.balance_amount
  , hyperwallet_status.configuration
  , hyperwallet_status.user_token
  , hyperwallet_status.configuration_status AS hyperwallet_status
  , hyperwallet_status.pay_method
  , hyperwallet_status.created_at
  FROM consignor_current_balance_accounts
  LEFT JOIN hyperwallet_status
  ON  consignor_current_balance_accounts.consignor_id = hyperwallet_status.payee_token
  AND consignor_current_balance_accounts.user_id = hyperwallet_status.user_id
  WHERE hyperwallet_status.pay_method = 'Hyperwallet'

), final AS (

  SELECT *
  , count(*) OVER (PARTITION BY consignor_id) AS status_count
  , row_number() OVER (PARTITION BY consignor_id ORDER BY created_at ASC) AS status_row
  , last_value(hyperwallet_status) OVER (
      PARTITION BY consignor_id
      ORDER BY created_at ASC
      RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS hyperwallet_most_recent_status
  FROM joined

)

SELECT * FROM final
  );
    