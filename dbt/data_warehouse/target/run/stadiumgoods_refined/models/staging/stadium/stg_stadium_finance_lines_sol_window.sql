

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_sol_window`
  
  
  OPTIONS()
  as (
    



SELECT
  stadium_order_lines.stadium_order_id
  
    , nullif(sum(stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax + stadium_order_lines.line_shipping_price + stadium_order_lines.line_shipping_tax), 0) AS stadium_line_sum_of_order_gtv
  
    , nullif(sum(stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax - stadium_order_lines.line_item_discount - stadium_order_lines.line_item_store_credit_applied + stadium_order_lines.line_shipping_price + stadium_order_lines.line_shipping_tax - stadium_order_lines.line_shipping_discount - stadium_order_lines.line_shipping_store_credit_applied), 0) AS stadium_line_sum_of_payment
  
    , nullif(sum(stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax - stadium_order_lines.line_item_discount + stadium_order_lines.line_shipping_price + stadium_order_lines.line_shipping_tax - stadium_order_lines.line_shipping_discount), 0) AS stadium_line_sum_of_payment_and_credit_redeemed
  
    , nullif(sum(stadium_order_lines.line_item_price), 0) AS stadium_line_sum_of_order_total_item_price
  
    , nullif(sum(stadium_order_lines.line_item_price + stadium_order_lines.line_item_tax - stadium_order_lines.line_item_discount - stadium_order_lines.line_item_store_credit_applied), 0) AS stadium_line_sum_of_order_total_item_payment
  
  
    
    
      , sum(stadium_order_lines.line_item_price) AS stadium_total_item_price
    
      , sum(stadium_order_lines.line_item_tax) AS stadium_total_item_tax
    
      , sum(stadium_order_lines.line_item_discount) AS stadium_total_item_discount
    
    , sum(stadium_order_lines.line_item_store_credit_applied) AS order_total_item_store_credit_applied
  
    
    
      , sum(stadium_order_lines.line_shipping_price) AS stadium_shipping_price
    
      , sum(stadium_order_lines.line_shipping_tax) AS stadium_shipping_tax
    
      , sum(stadium_order_lines.line_shipping_discount) AS stadium_shipping_discount
    
    , sum(stadium_order_lines.line_shipping_store_credit_applied) AS order_shipping_store_credit_applied
  
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS stadium_order_lines
GROUP BY 1
  );
    