



SELECT
    accounts.`ether_ledger_account_id`,
  accounts.`account_type`,
  accounts.`account_balance_type`,
  accounts.`account_balance_amount`,
  accounts.`account_balance_currency`,
  accounts.`lock_version`,
  accounts.`account_code`
  , tenants.`ether_ledger_tenant_id`,
  tenants.`owner_type`,
  tenants.`owner_id`,
  tenants.`user_id`,
  tenants.`tenant_name`,
  tenants.`_raw_currency`
  , users.consignor_id
  , users.email AS consignor_email
  , users.inventory_relationship


  , accounts.created_at AS account_created_at

  , accounts.updated_at AS account_updated_at

  , accounts._synched_from_source_at AS account__synched_from_source_at



  , tenants.created_at AS tenant_created_at

  , tenants.updated_at AS tenant_updated_at

  , tenants._synched_from_source_at AS tenant__synched_from_source_at


FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_ledger_accounts` AS accounts
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_ledger_tenants` AS tenants
  ON accounts.ether_ledger_tenant_id = tenants.ether_ledger_tenant_id -- many accounts to one tenant
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__users` AS users
  ON tenants.user_id = users.user_id -- at most one user to one tenant