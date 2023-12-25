

  SELECT
    order_item_id
  , string_agg(DISTINCT mag_shipment_id, ', ') AS mag_shipment_ids
  , string_agg(DISTINCT tracking_number, ', ') AS tracking_numbers
  , min(shipment_creation_nyc) AS shipment_creation_nyc
  , min(tracking_creation_nyc) AS tracking_creation_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_shipment_items`
  GROUP BY 1