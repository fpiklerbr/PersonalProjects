

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_shipments_without_ticket_items`
  
  
  OPTIONS()
  as (
    SELECT
  *
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_shipments` AS shipments
WHERE NOT EXISTS (
  SELECT
    *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ticket_items`
  WHERE shipment_id = shipments.shipment_id
)
  );
    