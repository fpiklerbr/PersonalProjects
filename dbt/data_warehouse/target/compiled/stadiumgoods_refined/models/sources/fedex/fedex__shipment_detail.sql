


  









































































 

SELECT   `fedex_account_id`,  `invoice_month_yyyymm_`,  `opco`,  `service_type`,  `pay_type`,  `ship_date`,  `shipment_delivery_date`,  `tracking_number`,  `shipper_name`,  `shipper_company_name`,  `shipper_address`,  `shipper_city`,  `shipper_state`,  `shipper_country_territory`,  `shipper_postal_code`,  `shipment_freight_charge`,  `shipment_miscellaneous_charge`,  `shipment_duty_and_tax_charge`,  `shipment_discount_amount`,  `total_cost`,  `pieces_in_shipment`,  `shipment_rated_weight_pounds_`,  `original_weight_pounds_`,  `proof_of_delivery_recipient`,  `recipient_name`,  `recipient_company_name`,  `recipient_address`,  `recipient_city`,  `recipient_state`,  `recipient_country_territory`,  `recipient_postal_code`,  `reference_notes_line_1`,  `reference_notes_line_2`,  `reference_notes_line_3`,  `department_number`,  `po_number`,  `pricing_zone`,  `invoice_date_mm_dd_yyyy_`,  `invoice_date_mm_dd_yyyy`,  `invoice_date_yyyy_mm_dd_000000`,  `invoice_date`,  `invoice_id`,  `master_tracking_number`,  `domestic_intl`,  `package_type`,  `shipment_delivery_time`,  `file_name`,  `sheet_name`,  `file_time`,  `shipment_rated_weight`,  `original_weight`,  `shipment_dim_flag_y_or_n_`,  `dimmed_height`,  `dimmed_width`,  `dimmed_length`,  `recipient_original_address`,  `recipient_original_city`,  `recipient_original_state`,  `recipient_original_postal_code`,  `recipient_original_country_territory`,  `shipment_declared_value_amount_usd`,  `customs_value`,  `customs_value_currency_code`,  `shipper_state_province`,  `recipient_state_province`,  `base_currency`,  `base_total_cost`,  `base_shipment_discount`,  `base_shipment_duty_and_tax_charge`,  `base_shipment_miscellaneous_charge`,  `base_shipment_freight_charge`,  `recipient_original_state_province`,  `shipment_declared_value_amount`,  `exchange_rate_to_usd`,  `weight_type_code`,  `customer_order_number`,  `service_description`
  FROM ( SELECT
    *

  , 
    safe_cast(coalesce(invoice_date_mm_dd_yyyy,invoice_date_yyyy_mm_dd_000000) as date)
 AS `invoice_date` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast(CASE
          WHEN


  regexp_contains(invoice_date_mm_dd_yyyy_, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', invoice_date_mm_dd_yyyy_)
        END as date)


 AS `invoice_date_mm_dd_yyyy`
  , 
    safe_cast(CASE
          WHEN


  regexp_contains(invoice_date_mm_dd_yyyy_, r'(?i)^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2} [0-9]{1,2}:[0-9]{2}:[0-9]{2}$')


          THEN  parse_timestamp('%Y-%m-%d %H:%M:%S', invoice_date_mm_dd_yyyy_)
        END as date)


 AS `invoice_date_yyyy_mm_dd_000000` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payer_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payer_account` AS string)), '') AS string) END as string)
 AS `fedex_account_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_month_yyyymm_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_month_yyyymm_` AS string)), '') AS string) END as string)
 AS `invoice_month_yyyymm_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`opco` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`opco` AS string)), '') AS string) END as string)
 AS `opco`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_type` AS string)), '') AS string) END as string)
 AS `service_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_type` AS string)), '') AS string) END as string)
 AS `pay_type`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `ship_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_delivery_date` AS string)), '') AS string) END as string)
 AS `shipment_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_tracking_number_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_tracking_number_` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_name` AS string)), '') AS string) END as string)
 AS `shipper_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_company_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_company_name` AS string)), '') AS string) END as string)
 AS `shipper_company_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_address` AS string)), '') AS string) END as string)
 AS `shipper_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_city` AS string)), '') AS string) END as string)
 AS `shipper_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_state` AS string)), '') AS string) END as string)
 AS `shipper_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_country_territory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_country_territory` AS string)), '') AS string) END as string)
 AS `shipper_country_territory`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_postal_code` AS string)), '') AS string) END as string)
 AS `shipper_postal_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_freight_charge_amount_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_freight_charge_amount_usd` AS string)), '') AS string) END as float64)
 AS `shipment_freight_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_miscellaneous_charge_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_miscellaneous_charge_usd` AS string)), '') AS string) END as float64)
 AS `shipment_miscellaneous_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_duty_and_tax_charge_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_duty_and_tax_charge_usd` AS string)), '') AS string) END as float64)
 AS `shipment_duty_and_tax_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_discount_amount_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_discount_amount_usd` AS string)), '') AS string) END as float64)
 AS `shipment_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_charge_amount_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_charge_amount_usd` AS string)), '') AS string) END as float64)
 AS `total_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pieces_in_shipment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pieces_in_shipment` AS string)), '') AS string) END as string)
 AS `pieces_in_shipment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_rated_weight_pounds_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_rated_weight_pounds_` AS string)), '') AS string) END as string)
 AS `shipment_rated_weight_pounds_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_weight_pounds_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_weight_pounds_` AS string)), '') AS string) END as string)
 AS `original_weight_pounds_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`proof_of_delivery_recipient` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`proof_of_delivery_recipient` AS string)), '') AS string) END as string)
 AS `proof_of_delivery_recipient`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) END as string)
 AS `recipient_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_company_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_company_name` AS string)), '') AS string) END as string)
 AS `recipient_company_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_address` AS string)), '') AS string) END as string)
 AS `recipient_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_city` AS string)), '') AS string) END as string)
 AS `recipient_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_state` AS string)), '') AS string) END as string)
 AS `recipient_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_country_territory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_country_territory` AS string)), '') AS string) END as string)
 AS `recipient_country_territory`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_postal_code` AS string)), '') AS string) END as string)
 AS `recipient_postal_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference_notes_line_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference_notes_line_1` AS string)), '') AS string) END as string)
 AS `reference_notes_line_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference_notes_line_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference_notes_line_2` AS string)), '') AS string) END as string)
 AS `reference_notes_line_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference_notes_line_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference_notes_line_3` AS string)), '') AS string) END as string)
 AS `reference_notes_line_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`department_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`department_number` AS string)), '') AS string) END as string)
 AS `department_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pricing_zone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pricing_zone` AS string)), '') AS string) END as string)
 AS `pricing_zone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_date_mm_dd_yyyy_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_date_mm_dd_yyyy_` AS string)), '') AS string) END as string)
 AS `invoice_date_mm_dd_yyyy_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_tracking_number` AS string)), '') AS string) END as string)
 AS `master_tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`domestic_intl` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`domestic_intl` AS string)), '') AS string) END as string)
 AS `domestic_intl`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_type` AS string)), '') AS string) END as string)
 AS `package_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_delivery_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_delivery_time` AS string)), '') AS string) END as string)
 AS `shipment_delivery_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_rated_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_rated_weight` AS string)), '') AS string) END as string)
 AS `shipment_rated_weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_weight` AS string)), '') AS string) END as string)
 AS `original_weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_dim_flag_y_or_n_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_dim_flag_y_or_n_` AS string)), '') AS string) END as string)
 AS `shipment_dim_flag_y_or_n_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dimmed_height` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dimmed_height` AS string)), '') AS string) END as string)
 AS `dimmed_height`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dimmed_width` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dimmed_width` AS string)), '') AS string) END as string)
 AS `dimmed_width`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dimmed_length` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dimmed_length` AS string)), '') AS string) END as string)
 AS `dimmed_length`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_address` AS string)), '') AS string) END as string)
 AS `recipient_original_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_city` AS string)), '') AS string) END as string)
 AS `recipient_original_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_state` AS string)), '') AS string) END as string)
 AS `recipient_original_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_postal_code` AS string)), '') AS string) END as string)
 AS `recipient_original_postal_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_country_territory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_country_territory` AS string)), '') AS string) END as string)
 AS `recipient_original_country_territory`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_declared_value_amount_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_declared_value_amount_usd` AS string)), '') AS string) END as string)
 AS `shipment_declared_value_amount_usd`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customs_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customs_value` AS string)), '') AS string) END as string)
 AS `customs_value`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customs_value_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customs_value_currency_code` AS string)), '') AS string) END as string)
 AS `customs_value_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_state_province` AS string)), '') AS string) END as string)
 AS `shipper_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_state_province` AS string)), '') AS string) END as string)
 AS `recipient_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billed_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billed_currency_code` AS string)), '') AS string) END as string)
 AS `base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_charge_billed_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_charge_billed_currency` AS string)), '') AS string) END as float64)
 AS `base_total_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_discount_billed_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_discount_billed_currency` AS string)), '') AS string) END as float64)
 AS `base_shipment_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_duty_and_tax_charge_billed_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_duty_and_tax_charge_billed_currency` AS string)), '') AS string) END as float64)
 AS `base_shipment_duty_and_tax_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_miscellaneous_charge_billed_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_miscellaneous_charge_billed_currency` AS string)), '') AS string) END as float64)
 AS `base_shipment_miscellaneous_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_freight_charge_billed_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_freight_charge_billed_currency` AS string)), '') AS string) END as float64)
 AS `base_shipment_freight_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_state_province` AS string)), '') AS string) END as string)
 AS `recipient_original_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_declared_value_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_declared_value_amount` AS string)), '') AS string) END as string)
 AS `shipment_declared_value_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exchange_rate_to_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exchange_rate_to_usd` AS string)), '') AS string) END as string)
 AS `exchange_rate_to_usd`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_type_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_type_code` AS string)), '') AS string) END as string)
 AS `weight_type_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_order_number` AS string)), '') AS string) END as string)
 AS `customer_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_description` AS string)), '') AS string) END as string)
 AS `service_description`



FROM `ff-stadiumgoods-raw-live`.`imports`.`fedex_shipment_detail` AS source_table

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

