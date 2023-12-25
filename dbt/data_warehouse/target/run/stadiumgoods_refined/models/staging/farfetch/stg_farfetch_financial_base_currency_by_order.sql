

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_base_currency_by_order`
  
  
  OPTIONS()
  as (
    WITH financial AS (

  SELECT
      financial_v2_order.fps_order_id
    , string_agg(DISTINCT financial_v2_order.fps_stock_point_id, ', ') AS fps_stock_point_id
    , string_agg(DISTINCT financial_v2_order.base_currency, ', ') AS base_currency
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_v2_order` AS financial_v2_order
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_current_order_reports` AS current_reports
    ON financial_v2_order.file_name = current_reports.file_name
  WHERE financial_v2_order.fps_order_id IS NOT NULL
  GROUP BY 1

)

SELECT
    *
FROM financial
  );
    