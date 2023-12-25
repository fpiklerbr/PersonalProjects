

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_prep_list`
  
  
  OPTIONS()
  as (
    

SELECT
    x3_order_id
  , x3_order_line
  , prep_list_id
  , prep_list_line
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stoprelis`
  );
    