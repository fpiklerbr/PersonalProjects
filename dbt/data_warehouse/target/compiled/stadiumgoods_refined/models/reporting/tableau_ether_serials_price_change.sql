SELECT
    price_changes.ether_wms_inventory_unit_version_id
  , price_changes.valid_from AS created_at
  , price_changes.object_type AS item_type
  , price_changes.serial_number
  , price_changes.previous_price_base_amount AS old_price_value
  , price_changes.price_base_amount AS new_price_value
  , coalesce(price_changes.user_id, price_changes.employee_id) AS user_id
  , CASE
      WHEN users.email IS NOT NULL
      THEN NULL
      ELSE employees.employee_name
    END AS employee_name
  , coalesce(users.email, employees.email) as email
  , CASE
      WHEN users.email IS NOT NULL
      THEN cast('Consignor' AS string)
      ELSE cast('SG Employee' AS string)
    END AS who_did_it
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_price_history` AS price_changes
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS users
  ON price_changes.user_id = users.user_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS employees
  ON price_changes.employee_id = employees.employee_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serials
  ON serials.serial_number = price_changes.serial_number
WHERE (previous_price_base_amount IS NOT NULL AND previous_price_base_amount > 0)
  AND (serials.serial_relationship = '3P' AND serials.serial_inventory != 'Dropship')