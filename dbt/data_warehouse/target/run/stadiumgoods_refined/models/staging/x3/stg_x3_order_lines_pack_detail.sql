

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_pack_detail`
  
  
  OPTIONS()
  as (
    

SELECT
    delivery_id
  , delivery_line
  , tracking_number
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__spackd`
WHERE quantity > 0
  );
    