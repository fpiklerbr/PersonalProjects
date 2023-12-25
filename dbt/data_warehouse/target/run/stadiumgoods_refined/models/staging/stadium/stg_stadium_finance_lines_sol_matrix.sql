

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_sol_matrix`
  
  
  OPTIONS()
  as (
    

SELECT *
  , (
        line_share_of_order_total_item_payment
      * coalesce(
            (
              order_total_item_price - order_total_item_discount - order_total_item_store_credit_applied
            ) / nullif(expected_order_payment, 0)
          , 0
        )
    ) AS line_item_price_share_of_order_payment
  , (
        line_share_of_order_total_item_payment
      * coalesce(
            order_total_item_tax / nullif(expected_order_payment, 0)
          , 0
        )
    ) AS line_item_tax_share_of_order_payment
  , (
        line_share_of_order_shipping
      * coalesce(
            (
              order_shipping_price - order_shipping_discount - order_shipping_store_credit_applied
            ) / nullif(expected_order_payment, 0)
          , 0
        )
    ) AS line_shipping_price_share_of_order_payment
  , (
        line_share_of_order_shipping
      * coalesce(
            order_shipping_tax / nullif(expected_order_payment, 0)
          , 0
        )
    ) AS line_shipping_tax_share_of_order_payment
  , (
        line_share_of_payment
      * coalesce(
            order_duties / nullif(expected_order_payment, 0)
          , 0
        )
    ) AS line_duties_share_of_order_payment
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_sol_vertical_share`
  );
    