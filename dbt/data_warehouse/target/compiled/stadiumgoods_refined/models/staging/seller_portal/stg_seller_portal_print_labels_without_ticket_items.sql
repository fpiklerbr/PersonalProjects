SELECT
  *
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__print_labels` AS print_labels
WHERE NOT EXISTS (
  SELECT
    *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ticket_items`
  WHERE print_label_id = print_labels.print_label_id
)