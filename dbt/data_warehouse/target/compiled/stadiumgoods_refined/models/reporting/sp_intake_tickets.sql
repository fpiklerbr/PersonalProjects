

SELECT
    tickets.consignor_id
  , tickets.ticket_number
  , shipments.created_at AS shipment_created_at
  , shipments.amount
  , sum(product_profiles.quantity) AS quantity
  , sum(product_profiles.quantity) * 3 AS weight
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__tickets` AS tickets
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__product_profiles` AS product_profiles
  ON tickets.ticket_id = product_profiles.ticket_id
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__shipments` AS shipments
  ON tickets.ticket_id = shipments.ticket_id
GROUP BY 1, 2, 3, 4