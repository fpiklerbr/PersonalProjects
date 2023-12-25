-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_snapshots_close_dates`


  
  
  
  
  
  
  
  
  




WITH stadium_finance_lines_grouped AS (


  

  
  
  
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('GTV (Total Paid)' AS string) AS measure_name
    , sum(CAST(gtv_paid AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('GTV (Total Store Credit Applied)' AS string) AS measure_name
    , sum(CAST(gtv_credit_redeemed AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('GTV (Total Item Discounts)' AS string) AS measure_name
    , sum(CAST(gtv_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('GTV (Total Shipping Discounts)' AS string) AS measure_name
    , sum(CAST(gtv_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Gross Transaction Value' AS string) AS measure_name
    , sum(CAST(gtv_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Gross Sales minus Promotions' AS string) AS measure_name
    , sum(CAST(gtv_less_promos AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N2040 - Other cancellations (Refunds)' AS string) AS measure_name
    , sum(CAST(cancelled_refunds AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N2040 - Other cancellations (Credits)' AS string) AS measure_name
    , sum(CAST(cancelled_credits AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N2040 - Other cancellations (Item Discounts)' AS string) AS measure_name
    , sum(CAST(cancelled_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N2040 - Other cancellations (Shipping Discounts)' AS string) AS measure_name
    , sum(CAST(cancelled_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N2040 - Other cancellations' AS string) AS measure_name
    , sum(CAST(cancelled_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('TN200 - Actual Transactions Value - Delivered' AS string) AS measure_name
    , sum(CAST(gtv_less_cancelled AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N1020 - Sales Tax (excluding Returns)' AS string) AS measure_name
    , sum(CAST(sales_tax AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N1010 - Returns (Refunds)' AS string) AS measure_name
    , sum(CAST(returned_refunds AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N1010 - Returns (Credits)' AS string) AS measure_name
    , sum(CAST(returned_credits AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N1010 - Returns (Item Discounts)' AS string) AS measure_name
    , sum(CAST(returned_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N1010 - Returns (Shipping Discounts)' AS string) AS measure_name
    , sum(CAST(returned_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('N1010 - Returns' AS string) AS measure_name
    , sum(CAST(returned_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('TN100 - Gross Merchandise Value' AS string) AS measure_name
    , sum(CAST(gmv_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Duties' AS string) AS measure_name
    , sum(CAST(-1 * CAST(duties AS numeric) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Shipping Revenue + Shipping Promo ' AS string) AS measure_name
    , sum(CAST((revenue_shipping) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('TN000 - Net Sales' AS string) AS measure_name
    , sum(CAST(net_sales AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Consignor Payouts Payable' AS string) AS measure_name
    , sum(CAST(consignor_payouts_payable AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Returned Payouts' AS string) AS measure_name
    , sum(CAST(consignor_payouts_returned AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Credit Consignor Payout House Account Inventory' AS string) AS measure_name
    , sum(CAST(consignor_payouts_credit_to_1p_inventory AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Total Consignor Payouts' AS string) AS measure_name
    , sum(CAST(consignor_payouts_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('P11101 - Commissions - Revenue + Promo' AS string) AS measure_name
    , sum(CAST(revenue_commissions AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Shipping Revenue + Shipping Promo' AS string) AS measure_name
    , sum(CAST(revenue_shipping AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Duties Revenue' AS string) AS measure_name
    , sum(CAST((-1 * CAST(duties AS numeric)) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Shipping Promotions - Revenue' AS string) AS measure_name
    , sum(CAST(greatest(cast(promos_total as numeric) + coalesce(cast(promos_1p_less_shipping_discounts as numeric), 0), -1 * (cast(revenue_shipping as numeric) + (-1 * cast(duties as numeric)))) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('1P Revenue + Promo' AS string) AS measure_name
    , sum(CAST(revenue_1p_promos_less_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('1P Promo' AS string) AS measure_name
    , sum(CAST(promos_1p_less_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Total Revenue - Retail' AS string) AS measure_name
    , sum(CAST(revenue_1p AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Shipping Discounts (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Promo Credits (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_post_checkout_credits AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Promo Refunds (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_post_checkout_refunds AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Item Discounts (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Total Price Promo' AS string) AS measure_name
    , sum(CAST(promos_less_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Total Promotions (Price + Shipping)' AS string) AS measure_name
    , sum(CAST(promos_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('TP111 - Revenues' AS string) AS measure_name
    , sum(CAST(revenue_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('COGS House Account DB1/4/5' AS string) AS measure_name
    , sum(CAST(cogs_returns_purchase AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('COGS Wholesale' AS string) AS measure_name
    , sum(CAST(cogs_wholesale AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('P11231 - Cost of Goods Sold - Retail (1P)' AS string) AS measure_name
    , sum(CAST(cogs_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Channel Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_channel AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Gateway Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_gateway AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Riskified Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_fraud_prevention AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Credit Card Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Packaging Costs' AS string) AS measure_name
    , sum(CAST(delivery_costs_packaging AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Shipping Costs' AS string) AS measure_name
    , sum(CAST(delivery_costs_shipping AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Duties Cost' AS string) AS measure_name
    , sum(CAST(duties AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('PLACEHOLDER: Chargebacks' AS string) AS measure_name
    , sum(CAST((0) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('TP112 - Cost of revenue' AS string) AS measure_name
    , sum(CAST(cost_of_revenue AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('Gross Profit' AS string) AS measure_name
    , sum(CAST(gross_profit AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(rebuild_date AS date) AS snapshot_date
    , cast('Current Data' AS string) AS data_source
    , cast('GMV Units' AS string) AS measure_name
    , sum(CAST(gmv_qty AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  

  

  UNION ALL
  
  
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('GTV (Total Paid)' AS string) AS measure_name
    , sum(CAST(gtv_paid AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('GTV (Total Store Credit Applied)' AS string) AS measure_name
    , sum(CAST(gtv_credit_redeemed AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('GTV (Total Item Discounts)' AS string) AS measure_name
    , sum(CAST(gtv_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('GTV (Total Shipping Discounts)' AS string) AS measure_name
    , sum(CAST(gtv_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Gross Transaction Value' AS string) AS measure_name
    , sum(CAST(gtv_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Gross Sales minus Promotions' AS string) AS measure_name
    , sum(CAST(gtv_less_promos AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N2040 - Other cancellations (Refunds)' AS string) AS measure_name
    , sum(CAST(cancelled_refunds AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N2040 - Other cancellations (Credits)' AS string) AS measure_name
    , sum(CAST(cancelled_credits AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N2040 - Other cancellations (Item Discounts)' AS string) AS measure_name
    , sum(CAST(cancelled_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N2040 - Other cancellations (Shipping Discounts)' AS string) AS measure_name
    , sum(CAST(cancelled_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N2040 - Other cancellations' AS string) AS measure_name
    , sum(CAST(cancelled_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('TN200 - Actual Transactions Value - Delivered' AS string) AS measure_name
    , sum(CAST(gtv_less_cancelled AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N1020 - Sales Tax (excluding Returns)' AS string) AS measure_name
    , sum(CAST(sales_tax AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N1010 - Returns (Refunds)' AS string) AS measure_name
    , sum(CAST(returned_refunds AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N1010 - Returns (Credits)' AS string) AS measure_name
    , sum(CAST(returned_credits AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N1010 - Returns (Item Discounts)' AS string) AS measure_name
    , sum(CAST(returned_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N1010 - Returns (Shipping Discounts)' AS string) AS measure_name
    , sum(CAST(returned_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('N1010 - Returns' AS string) AS measure_name
    , sum(CAST(returned_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('TN100 - Gross Merchandise Value' AS string) AS measure_name
    , sum(CAST(gmv_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Duties' AS string) AS measure_name
    , sum(CAST(-1 * CAST(duties AS numeric) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Shipping Revenue + Shipping Promo ' AS string) AS measure_name
    , sum(CAST((revenue_shipping) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('TN000 - Net Sales' AS string) AS measure_name
    , sum(CAST(net_sales AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Consignor Payouts Payable' AS string) AS measure_name
    , sum(CAST(consignor_payouts_payable AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Returned Payouts' AS string) AS measure_name
    , sum(CAST(consignor_payouts_returned AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Credit Consignor Payout House Account Inventory' AS string) AS measure_name
    , sum(CAST(consignor_payouts_credit_to_1p_inventory AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Total Consignor Payouts' AS string) AS measure_name
    , sum(CAST(consignor_payouts_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('P11101 - Commissions - Revenue + Promo' AS string) AS measure_name
    , sum(CAST(revenue_commissions AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Shipping Revenue + Shipping Promo' AS string) AS measure_name
    , sum(CAST(revenue_shipping AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Duties Revenue' AS string) AS measure_name
    , sum(CAST((-1 * CAST(duties AS numeric)) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Shipping Promotions - Revenue' AS string) AS measure_name
    , sum(CAST(greatest(cast(promos_total as numeric) + coalesce(cast(promos_1p_less_shipping_discounts as numeric), 0), -1 * (cast(revenue_shipping as numeric) + (-1 * cast(duties as numeric)))) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('1P Revenue + Promo' AS string) AS measure_name
    , sum(CAST(revenue_1p_promos_less_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('1P Promo' AS string) AS measure_name
    , sum(CAST(promos_1p_less_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Total Revenue - Retail' AS string) AS measure_name
    , sum(CAST(revenue_1p AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Shipping Discounts (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Promo Credits (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_post_checkout_credits AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Promo Refunds (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_post_checkout_refunds AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Item Discounts (excluding Returns)' AS string) AS measure_name
    , sum(CAST(promos_item_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Total Price Promo' AS string) AS measure_name
    , sum(CAST(promos_less_shipping_discounts AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Total Promotions (Price + Shipping)' AS string) AS measure_name
    , sum(CAST(promos_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('TP111 - Revenues' AS string) AS measure_name
    , sum(CAST(revenue_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('COGS House Account DB1/4/5' AS string) AS measure_name
    , sum(CAST(cogs_returns_purchase AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('COGS Wholesale' AS string) AS measure_name
    , sum(CAST(cogs_wholesale AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('P11231 - Cost of Goods Sold - Retail (1P)' AS string) AS measure_name
    , sum(CAST(cogs_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Channel Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_channel AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Gateway Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_gateway AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Riskified Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_fraud_prevention AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Credit Card Fees' AS string) AS measure_name
    , sum(CAST(transaction_fees_total AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Packaging Costs' AS string) AS measure_name
    , sum(CAST(delivery_costs_packaging AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Shipping Costs' AS string) AS measure_name
    , sum(CAST(delivery_costs_shipping AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Duties Cost' AS string) AS measure_name
    , sum(CAST(duties AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('PLACEHOLDER: Chargebacks' AS string) AS measure_name
    , sum(CAST((0) AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('TP112 - Cost of revenue' AS string) AS measure_name
    , sum(CAST(cost_of_revenue AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('Gross Profit' AS string) AS measure_name
    , sum(CAST(gross_profit AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  
  UNION ALL
  SELECT
      cast(
    timestamp_trunc(
        cast(reporting_date as timestamp),
        month
    )

 AS date) AS reporting_month
    , reporting_status
    , business_unit
    , sales_channel
    , inventory_relationship
    , CAST(snapshot_date AS date) AS snapshot_date
    , cast('Last Snapshot' AS string) AS data_source
    , cast('GMV Units' AS string) AS measure_name
    , sum(CAST(gmv_qty AS numeric)) AS measure_value
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_date >= '2022-11-01'
    AND reporting_date <= '2023-11-30'
  GROUP BY 1, 2, 3, 4, 5, 6
  


), rebuild_summary AS (

  SELECT
    max(rebuild_timestamp) AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`

)

SELECT
    *
  , safe_cast(datetime(safe_cast(rebuild_timestamp AS timestamp), 'America/New_York') AS datetime) AS rebuild_timestamp_us_eastern
FROM stadium_finance_lines_grouped
CROSS JOIN rebuild_summary