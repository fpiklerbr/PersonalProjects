

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_line_by_document_line`
  
  
  OPTIONS()
  as (
    

-- hierarchy: 1 layer
WITH parent_invoice_lines AS (

  SELECT
    5 AS document_type_code
  , invoice_id AS document_id
  , invoice_line AS document_line
  , x3_order_id
  , x3_order_line
  , original_invoice_id
  , original_invoice_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sinvoiced`
  WHERE x3_order_id is not NULL

), child_invoice_lines AS (

  SELECT
    5 AS document_type_code
  , x3.invoice_id AS document_id
  , x3.invoice_line AS document_line
  , parent_invoice_lines.x3_order_id
  , parent_invoice_lines.x3_order_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sinvoiced` AS x3
  INNER JOIN parent_invoice_lines
  ON x3.original_invoice_id = parent_invoice_lines.document_id
  AND x3.original_invoice_line = parent_invoice_lines.document_line
  where x3.original_invoice_id is not NULL

), order_documents AS (

  SELECT
      2 AS document_type_code
    , x3_order_id AS document_id
    , x3_order_line AS document_line
    , x3_order_id
    , x3_order_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorderq`

), pick_documents AS (

  SELECT
      3 AS document_type_code
    , pick_id AS document_id
    , pick_line AS document_line
    , x3_order_id
    , x3_order_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stopred`

), delivery_documents AS (

  SELECT
      4 AS document_type_code
    , delivery_id AS document_id
    , delivery_line AS document_line
    , x3_order_id
    , x3_order_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sdeliveryd`

), return_documents AS (

  SELECT
      13 AS document_type_code
    , sreturnd.return_id AS document_id
    , sreturnd.return_line AS document_line
    , delivery_documents.x3_order_id
    , delivery_documents.x3_order_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sreturnd` AS sreturnd
  LEFT JOIN delivery_documents
    ON sreturnd.delivery_id = delivery_documents.document_id
    AND sreturnd.delivery_line = delivery_documents.document_line

), invoice_documents AS (

  SELECT
    document_type_code
  , document_id
  , document_line
  , x3_order_id
  , x3_order_line
  FROM parent_invoice_lines
  UNION ALL
  SELECT
    document_type_code
  , document_id
  , document_line
  , x3_order_id
  , x3_order_line
  FROM child_invoice_lines

), final AS (

  SELECT *
  FROM order_documents
  UNION ALL
  SELECT *
  FROM pick_documents
  UNION ALL
  SELECT *
  FROM delivery_documents
  UNION ALL
  SELECT *
  FROM invoice_documents
  UNION ALL
  SELECT *
  FROM return_documents

)

SELECT * FROM final
  );
    