

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_last_pick_by_order_line`
  
  
  OPTIONS()
  as (
    

SELECT x3_order_id
  , x3_order_line
  , max(row_id) AS last_pick_row_id
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stopred`
GROUP BY 1, 2
  );
    