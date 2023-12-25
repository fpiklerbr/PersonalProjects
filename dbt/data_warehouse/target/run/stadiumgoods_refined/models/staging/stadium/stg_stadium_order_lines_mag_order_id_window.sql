

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_mag_order_id_window`
  
  
  OPTIONS()
  as (
    

  SELECT
    sol.mag_order_id
  , count(*) AS count_mag_order
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_returns_logic` AS sol
  GROUP BY 1
  );
    