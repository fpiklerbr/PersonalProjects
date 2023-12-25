

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_inventory_age_1p_inventory_snapshot`
  
  
  OPTIONS()
  as (
    





  
    
    
  

  
    
    
    
    
  

  
  WITH inventory_snapshot_20191101 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2019-11-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2019-11-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20191101` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20191101` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20191201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2019-12-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2019-12-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20191201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20191201` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200102 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-01-02' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-01-02' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200102` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200102` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-02-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-02-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200201` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200302 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-03-02' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-03-02' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200302` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200302` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200401 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-04-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-04-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200401` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200401` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200501 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-05-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-05-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200501` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200501` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200602 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-06-02' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-06-02' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200602` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200602` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200701 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-07-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-07-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200701` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200701` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200801 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-08-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-08-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200801` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200801` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20200901 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-09-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-09-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20200901` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20200901` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20201001 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-10-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-10-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20201001` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20201001` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20201101 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-11-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-11-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20201101` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20201101` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20201201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2020-12-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2020-12-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20201201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20201201` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210101 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-01-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-01-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210101` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210101` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-02-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-02-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210201` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210301 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-03-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-03-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210301` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210301` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210401 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-04-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-04-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210401` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210401` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210501 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-05-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-05-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210501` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210501` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210601 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-06-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-06-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210601` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210601` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210701 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-07-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-07-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210701` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210701` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210727 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-07-27' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-07-27' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210727` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210727` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210802 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-08-02' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-08-02' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210802` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210802` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20210901 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-09-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-09-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20210901` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20210901` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20211004 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-10-04' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-10-04' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20211004` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20211004` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20211101 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-11-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-11-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20211101` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20211101` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20211102 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-11-02' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-11-02' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20211102` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20211102` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20211201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2021-12-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2021-12-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20211201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20211201` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220101 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-01-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-01-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20220101` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220101` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-02-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-02-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20220201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220201` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220301 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-03-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-03-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20220301` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220301` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220401 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-04-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-04-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20220401` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220401` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220501 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.yseristatus_consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-05-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.yseristatus_consignment_status, r'(?i)sold.*')


            OR lower(serials.yseristatus_consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.yseristatus_consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-05-01' AS date) AS snapshot_date
      , serials.serial_warehouse AS serial_warehouse
      , serials.intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`x3_serials_20220501` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220501` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.yseristatus_consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220601 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-06-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-06-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20220601` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220601` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220611 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-06-11' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-06-11' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20220611` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220611` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220701 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-07-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-07-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20220701` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220701` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220801 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-08-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-08-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20220801` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220801` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20220901 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-09-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-09-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20220901` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20220901` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20221003 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-10-03' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-10-03' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20221003` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20221003` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20221101 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-11-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-11-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20221101` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20221101` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20221202 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2022-12-02' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2022-12-02' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20221202` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20221202` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230101 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-01-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-01-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230101` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230101` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-02-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-02-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230201` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230301 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.x3_order_id AS fulfillment_number
      , serials.x3_order_line AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-03-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-03-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230301` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230301` AS finance_lines
      ON serials.x3_order_id = finance_lines.x3_order_id
      AND serials.x3_order_line = finance_lines.x3_order_line
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230401 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-04-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-04-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230401` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230401` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230501 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-05-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-05-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230501` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230501` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230601 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-06-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-06-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230601` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230601` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230701 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-07-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-07-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230701` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230701` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230801 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-08-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-08-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230801` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230801` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20230901 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-09-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-09-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20230901` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230901` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20231001 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-10-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-10-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20231001` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231001` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20231002 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-10-02' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-10-02' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20231002` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231002` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20231106 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-11-06' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-11-06' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20231106` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231106` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )


  
    
    
  

  
    
    
    
    
  

  
  , inventory_snapshot_20231201 AS (

    SELECT
        serials.serial_number
      , serials.serial_cost
      , serials.consignor_id
      , serials.consignment_status AS yseristatus_consignment_status
      , serials.fulfillment_number AS fulfillment_number
      , serials.allocation_line_number AS allocation_line_number
      , finance_lines.reporting_date
      , finance_lines.reporting_status
      , serials.serial_inventory
      , CASE
          WHEN finance_lines.reporting_status = 'Dispatched'
            THEN
              CASE
                WHEN finance_lines.reporting_date <= cast('2023-12-01' AS date)
                THEN 'Dispatched & Received'
                ELSE 'Still in Inventory'
              END
          WHEN (
            


  regexp_contains(serials.consignment_status, r'(?i)sold.*')


            OR lower(serials.consignment_status) = 'returned'
          ) THEN 'Sold'
          WHEN (
            serials.status_document = 'Withdrawal'
            OR lower(serials.consignment_status) = 'withdrawn'
          ) THEN 'Withdrawn'
          ELSE 'Still in Inventory'
        END AS in_inventory
      , cast('2023-12-01' AS date) AS snapshot_date
      , serials.warehouse AS serial_warehouse
      , serials.original_intake_date AS intake_date
      , serials.serial_relationship
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20231201` AS serials
    LEFT JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231201` AS finance_lines
      ON serials.fulfillment_number = finance_lines.fulfillment_number
      AND serials.allocation_line_number = finance_lines.allocation_line_number
      AND serials.serial_number = finance_lines.serial_number
    WHERE serials.consignment_status IS NOT NULL
        AND serials.serial_relationship = '1P'

  )



  
  
  SELECT * FROM inventory_snapshot_20191101

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20191201

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200102

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200201

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200302

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200401

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200501

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200602

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200701

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200801

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20200901

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20201001

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20201101

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20201201

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210101

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210201

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210301

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210401

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210501

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210601

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210701

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210727

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210802

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20210901

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20211004

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20211101

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20211102

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20211201

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220101

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220201

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220301

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220401

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220501

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220601

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220611

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220701

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220801

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20220901

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20221003

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20221101

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20221202

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230101

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230201

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230301

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230401

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230501

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230601

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230701

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230801

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20230901

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20231001

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20231002

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20231106

  
  UNION ALL
  SELECT * FROM inventory_snapshot_20231201

  );
    