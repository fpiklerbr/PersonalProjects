

SELECT
    delivery_id
  , delivery_line
  , tracking_number
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__spackd`
WHERE quantity > 0