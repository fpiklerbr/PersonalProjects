

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serials`
  
  
  OPTIONS()
  as (
    



	SELECT DISTINCT coalesce(x3_serial_info.serial_number, x3_serial_documents.serial_number) AS serial_number
		, coalesce(x3_serial_info.x3_sku, x3_serial_documents.x3_sku) AS x3_sku
		, x3_serial_info.yserinf_rowid
		, x3_serial_info.size_uom
		, x3_serial_info.simple_sku
		, x3_serial_info.commission_rate
		, x3_serial_info.price
		, x3_serial_info.consignor_id
        , consignor.consignor_name
        , consignor.consignor_country
		, x3_serial_info.note
		, x3_serial_info.conditions
		, x3_serial_info.intake_date
		, x3_serial_info.intake_creation_nyc
		, x3_serial_info.intake_id
		, x3_serial_info.intake_line
		, x3_serial_info.intake_type
		, x3_serial_info.intake_warehouse
		, x3_serial_info.intake_location
		, x3_serial_info.intake_seller_portal_ticket
		, x3_serial_info.intake_created_by_user_id
		, x3_serial_info.intake_created_by_user_name
		, x3_serial_info.intake_eod_date
		, x3_serial_info.intake_eod_creation_nyc
		, x3_serial_info.intake_eod_id
		, x3_serial_info.intake_eod_line
		, x3_serial_info.intake_eod_type
		, x3_serial_info.intake_eod_warehouse
		, x3_serial_info.intake_eod_location
		, x3_serial_info.intake_eod_created_by_user_id
		, x3_serial_info.intake_eod_created_by_user_name
		, x3_serial_info.last_receipt_date
		, x3_serial_info.last_receipt_creation_nyc
		, x3_serial_info.last_receipt_id
		, x3_serial_info.last_receipt_line
		, x3_serial_info.last_receipt_type
		, x3_serial_info.last_receipt_warehouse
		, x3_serial_info.last_receipt_location
		, x3_serial_info.last_receipt_created_by_user_id
		, x3_serial_info.last_receipt_created_by_user_name
		, x3_serial_info.last_journal_date
		, x3_serial_info.last_journal_creation_nyc
		, x3_serial_info.last_journal_id
		, x3_serial_info.last_journal_line
		, x3_serial_info.last_journal_type
		, x3_serial_info.last_journal_warehouse
		, x3_serial_info.last_journal_location
		, x3_serial_info.last_journal_created_by_user_id
		, x3_serial_info.last_journal_created_by_user_name
		, x3_serial_info.yseristatus_intake_date
		, x3_serial_info.yseristatus_issue_date
		, x3_serial_info.yseristatus_consignment_status
		, x3_serial_info.yseristatus_order_id
		, x3_serial_info.yseristatus_paid_out_status
		, x3_serial_info.yseristatus_payout_date
	    , x3_serial_info.payout_invoice_id
        , x3_serial_info.payout_invoice_line
        , x3_serial_info.yseristatus_cost
		, coalesce(x3_serial_info.purchase_id, CASE WHEN x3_serial_info.intake_cost IS NOT NULL THEN x3_serial_info.intake_id END) AS purchase_id
		, coalesce(x3_serial_info.purchase_line, CASE WHEN x3_serial_info.intake_cost IS NOT NULL THEN x3_serial_info.intake_line END) AS purchase_line
		, coalesce(x3_serial_info.purchase_price, x3_serial_info.intake_cost, x3_serial_info.yseristatus_cost) AS purchase_price
        , x3_serial_info.purchase_reference
	    , x3_serial_info.original_serial
		, x3_serial_documents.status_document
		, x3_serial_documents.document_date
		, x3_serial_documents.document_id
		, x3_serial_documents.document_line
		, x3_serial_documents.document_type
		, x3_serial_documents.x3_order_id AS document_order_id
		, x3_serial_documents.serial_warehouse
		, x3_serial_documents.serial_location
		, coalesce(
		      x3_serial_info.yseristatus_order_id
		    , CASE WHEN x3_serial_documents.document_type <> 'Customer return' THEN x3_serial_documents.x3_order_id END
		  ) AS x3_order_id
		, CASE
            WHEN x3_serial_documents.document_type <> 'Customer return'
            THEN x3_serial_documents.x3_order_line
          END AS x3_order_line
		, CAST('X3' AS string) AS serial_source
		, CAST(coalesce(consignor.seller_relationship, '3P') AS string) AS serial_relationship
		, 
CASE
  WHEN x3_serial_info.consignor_id = 'DB00000005' AND x3_serial_info.intake_date < '2022-05-12'
  THEN cast('Returns Purchase' AS string)
  ELSE coalesce(consignor.seller_inventory, cast('Consignment' AS string))
END
 AS serial_inventory
		, CAST(coalesce(
		    serial_cost.serial_cost
			, CASE
			    WHEN CAST(coalesce(consignor.seller_relationship, '3P') AS string) = '1P'
			        THEN coalesce(
			            x3_serial_info.purchase_price
			            , x3_serial_info.intake_cost
			            , x3_serial_info.yseristatus_cost
			        )
			  END
			, (1 -
			    CASE
			       WHEN 
CASE
  WHEN x3_serial_info.consignor_id = 'DB00000005' AND x3_serial_info.intake_date < '2022-05-12'
  THEN cast('Returns Purchase' AS string)
  ELSE coalesce(consignor.seller_inventory, cast('Consignment' AS string))
END
 = 'Returns Purchase'
			           THEN CAST(coalesce(nullif(x3_serial_info.commission_rate, 0), 0.17442198506570215993) AS float64)
			       ELSE
			           x3_serial_info.commission_rate
			    END
			  ) * x3_serial_info.price
		) AS float64) AS serial_cost
        , last_modified_nyc
        , available
        , x3_serial_info.stock_status
		, current_timestamp AS rebuild_timestamp
	FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_info` AS x3_serial_info
		FULL JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_documents` AS x3_serial_documents USING (serial_number, x3_sku)
		LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_consignors` AS consignor ON consignor.consignor_id = x3_serial_info.consignor_id
        LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`lookup_x3_serial_cost_by_serial_number` AS serial_cost ON serial_cost.serial_number = coalesce(x3_serial_info.serial_number, x3_serial_documents.serial_number)
  );
    