

WITH settlements as (
SELECT
    settlement_id,
    settlement_start_date,
    settlement_end_date,
    _raw_deposit_date,
    _raw_amount,
    total_amount,
    base_currency,
    transaction_type,
    transaction_id,
    merchant_order_id,
    adjustment_id,
    shipment_id,
    marketplace_name,
    shipment_fee_type,
    shipment_fee_amount,
    other_amount,
    order_fee_type,
    order_fee_amount,
    CASE WHEN price_type IS NULL THEN item_related_fee_type else price_type end as amount_description,
    CASE 
    WHEN _raw_amount IS NULL 
    THEN 
        CASE 
            WHEN item_related_fee_amount IS NULL 
            THEN other_amount 
            ELSE item_related_fee_amount 
        END 
    ELSE _raw_amount 
    END AS amount,
    fulfillment_id,
    is_fba,
    posted_date,
    PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', posted_date) AS _raw_posted_date_time,
    PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', posted_date) AS transaction_processed_at,
    DATE(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', posted_date)) AS _macro_posted_date,
    order_item_code,
    item_related_fee_type,
    item_related_fee_amount,
    merchant_order_item_id,
    merchant_adjustment_item_id,
    sku,
    quantity_purchased,
    promotion_id,
    file_name,
    file_time,
    CASE WHEN transaction_type = 'Order' THEN PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', posted_date) END as payment_processed_at,
    CASE WHEN transaction_type <> 'Order' THEN PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', posted_date) END as refund_processed_at
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__settlement_reports_sp`
), middle as (
SELECT
    *,
    CASE 
        WHEN amount_description = 'MarketplaceFacilitatorTax-Principal' THEN 'ItemWithheldTax'
        WHEN amount_description = 'Commission' THEN 'ItemFees'
        WHEN amount_description IN ('Tax', 'Principal', 'RestockingFee', 'ReturnShipping', 'Goodwill') THEN 'ItemPrice'
        WHEN amount_description IN ('RefundCommission', 'FBAPerUnitFulfillmentFee', 'FBACustomerReturnPerUnitFee') THEN 'ItemFees'
        WHEN amount_description IN ('Adjustment', 'Shipping label purchase for return', 'Paid Services Fee', 'Storage Fee', 'MiscAdjustment', 'BuyerRecharge') THEN 'other-transaction'
        WHEN amount_description = 'SAFE-T reimbursement' THEN 'Other transactions'
        WHEN amount_description = 'TransactionTotalAmount' THEN 'Cost of Advertising'
        ELSE null
    END AS amount_type,
    DATE(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', SUBSTR(_raw_deposit_date, 1, 19))) AS settlement_date_dash,
    DATE(SAFE.PARSE_TIMESTAMP('%d.%m.%Y %H:%M:%S',SUBSTR(_raw_deposit_date, 1, 19))) AS settlement_date_dot

FROM settlements
), final as (
SELECT 
    *,
    CASE 
    WHEN amount_type IN ('ItemFees', 'ShipmentFees') 
       OR amount_description IN ('RestockingFee', 'SAFE-T reimbursement', 'REVERSAL_REIMBURSEMENT') 
    THEN TRUE 
    ELSE FALSE 
    END AS is_fee,
    CASE 
        WHEN transaction_type = 'Order' AND amount_type = 'ItemWithheldTax' 
        THEN TRUE 
        ELSE FALSE 
    END AS tax_is_withheld,
    COALESCE(settlement_date_dot, settlement_date_dash) AS settlement_date
FROM middle
)
SELECT
  settlement_id
  ,settlement_start_date
  ,settlement_end_date
  ,_raw_deposit_date
  ,settlement_date
  ,total_amount
  ,base_currency
  ,transaction_type
  ,transaction_id
  ,merchant_order_id
  ,adjustment_id
  ,shipment_id
  ,marketplace_name
  ,amount_type
  ,amount_description
  ,_raw_amount
  ,fulfillment_id
  ,is_fba
  ,posted_date
  ,_raw_posted_date_time
  ,transaction_processed_at
  ,order_item_code
  ,merchant_order_item_id
  ,merchant_adjustment_item_id
  ,sku
  ,quantity_purchased
  ,promotion_id
  ,file_name
  ,file_time
  ,is_fee
  ,tax_is_withheld
  ,payment_processed_at
  ,refund_processed_at
  ,CASE 
    WHEN transaction_type = 'Order' AND is_fee IS NOT TRUE 
    THEN amount
    ELSE NULL 
  END AS base_payment_amount
  ,CASE 
  WHEN transaction_type = 'Order' AND is_fee IS TRUE 
  THEN amount
  ELSE NULL 
  END AS base_payment_fee
  ,CASE 
  WHEN transaction_type <> 'Order' AND is_fee IS NOT TRUE 
  THEN amount
  ELSE NULL 
  END AS base_refund_amount
  ,CASE 
  WHEN transaction_type <> 'Order' AND is_fee IS TRUE 
  THEN amount
  ELSE NULL 
  END AS base_refund_fee 
FROM final