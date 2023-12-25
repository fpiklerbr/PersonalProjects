

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_allocated_serials`
  
  
  OPTIONS()
  as (
    WITH order_line_serials AS (

  SELECT
      x3_order_id
    , x3_order_line
    , document_type AS allocation_type
    , serial_number AS allocated_serial
    , row_number() OVER (
        PARTITION BY x3_order_id, x3_order_line
        ORDER BY document_date DESC, 
CASE document_type
  WHEN 'Sales invoice' THEN 1
  WHEN 'Shipment' THEN 2
  WHEN 'Picking Ticket' THEN 3
  WHEN 'Sales order' THEN 4
  ELSE 5
END

      ) AS allocation_priority
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_documents`
  WHERE status_document = 'Allocation'
    AND x3_order_id IS NOT NULL
    AND x3_order_line IS NOT NULL

), final AS (

  SELECT
      x3_order_id
    , x3_order_line
    , string_agg(DISTINCT CASE WHEN allocation_priority = 1 THEN allocation_type END, ', ') AS allocation_type
    , string_agg(DISTINCT CASE WHEN allocation_priority = 1 THEN allocated_serial END, ', ') AS allocated_serial
    , count(*) AS allocated_serial_count
    , string_agg(DISTINCT allocation_type, ', ') AS all_allocation_types
    , string_agg(DISTINCT allocated_serial, ', ') AS all_allocated_serials
  FROM order_line_serials
  GROUP BY 1, 2

)

SELECT * FROM final
  );
    