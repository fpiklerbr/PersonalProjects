




WITH fee_union AS (

  SELECT
    
      tmall_order_id
    , crossdock_reference
    , transaction_type
    , fee_amount
    , fee_amount_rmb
    , is_shipping
    , is_duties
    , file_name
    , file_time

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_fee` AS tmall_settlement
  UNION ALL
  SELECT
    
      tmall_order_id
    , crossdock_reference
    , transaction_type
    , fee_amount
    , fee_amount_rmb
    , is_shipping
    , is_duties
    , file_name
    , file_time

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_settlement_fee` AS palace_settlement
	WHERE NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_fee` WHERE tmall_order_id = palace_settlement.tmall_order_id)
  UNION ALL
  SELECT
    
      tmall_order_id
    , crossdock_reference
    , transaction_type
    , fee_amount
    , fee_amount_rmb
    , is_shipping
    , is_duties
    , file_name
    , file_time

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_trade_fee` AS tmall_trade
	WHERE NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_fee` WHERE tmall_order_id = tmall_trade.tmall_order_id)
    AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_settlement_fee` WHERE tmall_order_id = tmall_trade.tmall_order_id)
  UNION ALL
  SELECT
    
      tmall_order_id
    , crossdock_reference
    , transaction_type
    , fee_amount
    , fee_amount_rmb
    , is_shipping
    , is_duties
    , file_name
    , file_time

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_trade_fee` AS palace_trade
	WHERE NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_fee` WHERE tmall_order_id = palace_trade.tmall_order_id)
    AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_settlement_fee` WHERE tmall_order_id = palace_trade.tmall_order_id)
	  AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_trade_fee` WHERE tmall_order_id = palace_trade.tmall_order_id)

), fees_grouped AS (

  SELECT
      tmall_order_id
    , file_name
    , file_time


    , sum(
        CASE WHEN transaction_type = 'payment' THEN fee_amount END
      ) AS payment_total_fee
    , sum(
        CASE WHEN transaction_type = 'payment' AND is_shipping IS TRUE THEN fee_amount END
      ) AS payment_shipping_fee
    , sum(
        CASE WHEN transaction_type = 'payment' AND is_duties IS TRUE THEN fee_amount END
      ) AS payment_duties_fee
    , sum(
        CASE WHEN transaction_type = 'payment' AND is_shipping IS NOT TRUE AND is_duties IS NOT TRUE THEN fee_amount END
      ) AS payment_other_fee

    , sum(
        CASE WHEN transaction_type = 'refund' THEN fee_amount END
      ) AS refund_total_fee
    , sum(
        CASE WHEN transaction_type = 'refund' AND is_shipping IS TRUE THEN fee_amount END
      ) AS refund_shipping_fee
    , sum(
        CASE WHEN transaction_type = 'refund' AND is_duties IS TRUE THEN fee_amount END
      ) AS refund_duties_fee
    , sum(
        CASE WHEN transaction_type = 'refund' AND is_shipping IS NOT TRUE AND is_duties IS NOT TRUE THEN fee_amount END
      ) AS refund_other_fee



    , sum(
        CASE WHEN transaction_type = 'payment' THEN fee_amount_rmb END
      ) AS payment_total_fee_rmb
    , sum(
        CASE WHEN transaction_type = 'payment' AND is_shipping IS TRUE THEN fee_amount_rmb END
      ) AS payment_shipping_fee_rmb
    , sum(
        CASE WHEN transaction_type = 'payment' AND is_duties IS TRUE THEN fee_amount_rmb END
      ) AS payment_duties_fee_rmb
    , sum(
        CASE WHEN transaction_type = 'payment' AND is_shipping IS NOT TRUE AND is_duties IS NOT TRUE THEN fee_amount_rmb END
      ) AS payment_other_fee_rmb

    , sum(
        CASE WHEN transaction_type = 'refund' THEN fee_amount_rmb END
      ) AS refund_total_fee_rmb
    , sum(
        CASE WHEN transaction_type = 'refund' AND is_shipping IS TRUE THEN fee_amount_rmb END
      ) AS refund_shipping_fee_rmb
    , sum(
        CASE WHEN transaction_type = 'refund' AND is_duties IS TRUE THEN fee_amount_rmb END
      ) AS refund_duties_fee_rmb
    , sum(
        CASE WHEN transaction_type = 'refund' AND is_shipping IS NOT TRUE AND is_duties IS NOT TRUE THEN fee_amount_rmb END
      ) AS refund_other_fee_rmb


  FROM fee_union
  GROUP BY 1, 2, 3

), crossdock_references AS (

  SELECT
      tmall_order_id
    , string_agg(DISTINCT crossdock_reference, ', ') AS crossdock_reference
  FROM fee_union
  WHERE crossdock_reference IS NOT NULL
  GROUP BY 1

), final AS (

  SELECT
      fees_grouped.*
    , crossdock_references.crossdock_reference
  FROM fees_grouped
  LEFT JOIN crossdock_references
    ON fees_grouped.tmall_order_id = crossdock_references.tmall_order_id

)

SELECT * FROM final