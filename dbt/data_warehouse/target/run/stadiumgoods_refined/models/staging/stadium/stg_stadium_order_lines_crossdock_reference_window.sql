

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_crossdock_reference_window`
  
  
  OPTIONS()
  as (
    


  SELECT
    sol.crossdock_reference
  , count(*) AS count_crossdock_reference
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_returns_logic` AS sol
  GROUP BY 1
  );
    