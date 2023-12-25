WITH approvals AS (

  SELECT
    reviews.ether_commercial_purchase_order_id
  , reviews.ether_commercial_purchase_order_review_id
  , STRING_AGG(distinct CAST(review_details.employee_id AS string), ',') AS employee_ids
  , MIN(review_details.approved_at) AS approved_at
  , STRING_AGG(distinct employees.employee_name, ',') AS employee_names
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_purchase_order_reviews` reviews
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_purchase_order_review_records` review_details
    ON  reviews.ether_commercial_purchase_order_review_id = review_details.ether_commercial_purchase_order_review_id
    AND reviews.state = 'Approved'
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` employees
    ON  employees.employee_id = review_details.employee_id
    AND review_details.state = 'Approved'
  GROUP BY 1,2

), final AS (

  SELECT
/* purchase_order attrs */
    po.ether_commercial_purchase_order_id
  , po.purchase_order_number
  , po.po_type
  , po.external_reference_number
  , po.purchase_order_status
  , CAST(po.created_at AS date) AS po_creation_date
  , po.estimated_arrival_date
  , po.destination_code AS delivery_warehouse
  , po.extra_intake_allowed
  , po.total_item_cost
  , po.margin_percentage
  , po.line_items_count AS item_in_po

/* reviews info */
  , COALESCE(po.commercial_approved_at, approve_reviews.approved_at) AS commercial_approved_at
  , approve_reviews.employee_ids AS commercial_approved_by_employee_id
  , approve_reviews.employee_names AS commercial_approved_by_employee_name
  , COALESCE(po.sox_approved_at, sox_reviews.approved_at) AS sox_approved_at
  , sox_reviews.employee_ids AS sox_approved_by_employee_id
  , sox_reviews.employee_names AS sox_approved_by_employee_name

/* vendors info  */
  , po.consignor_id
  , vendors.ether_commercial_vendor_id
  , vendors.vendor_number

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_purchase_orders` AS po
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_vendors` AS vendors
    USING (ether_commercial_vendor_id)
  LEFT JOIN approvals AS approve_reviews
    ON  po.commercial_review_id = approve_reviews.ether_commercial_purchase_order_review_id
    AND po.ether_commercial_purchase_order_id = approve_reviews.ether_commercial_purchase_order_id
  LEFT JOIN approvals AS sox_reviews
    ON  po.sox_review_id = sox_reviews.ether_commercial_purchase_order_review_id
    AND po.ether_commercial_purchase_order_id = sox_reviews.ether_commercial_purchase_order_id

)

SELECT * FROM final