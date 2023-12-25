

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fedex__sg_finance`
  OPTIONS()
  as 


 

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_group` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_group` AS string)), '') AS string) END as string)
 AS `account_group`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billed_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billed_currency_code` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_category` AS string)), '') AS string) END as string)
 AS `charge_category`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_number` AS string)), '') AS string) END as string)
 AS `country_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_order_number` AS string)), '') AS string) END as string)
 AS `customer_order_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customs_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customs_number` AS string)), '') AS string) END as string)
 AS `customs_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customs_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customs_value` AS string)), '') AS string) END as string)
 AS `customs_value`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customs_value_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customs_value_currency_code` AS string)), '') AS string) END as string)
 AS `customs_value_currency_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`department_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`department_number` AS string)), '') AS string) END as string)
 AS `department_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_location_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_location_code` AS string)), '') AS string) END as string)
 AS `destination_location_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dimmed_height_in_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dimmed_height_in_` AS string)), '') AS string) END as string)
 AS `dimmed_height_in_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dimmed_length_in_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dimmed_length_in_` AS string)), '') AS string) END as string)
 AS `dimmed_length_in_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dimmed_width_in_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dimmed_width_in_` AS string)), '') AS string) END as string)
 AS `dimmed_width_in_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`division_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`division_number` AS string)), '') AS string) END as string)
 AS `division_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`domestic_intl` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`domestic_intl` AS string)), '') AS string) END as string)
 AS `domestic_intl`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exchange_rate_to_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exchange_rate_to_usd` AS string)), '') AS string) END as string)
 AS `exchange_rate_to_usd`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`facility_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`facility_number` AS string)), '') AS string) END as string)
 AS `facility_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_entity_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_entity_number` AS string)), '') AS string) END as string)
 AS `global_entity_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`group_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`group_number` AS string)), '') AS string) END as string)
 AS `group_number`
  , 

    
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`invoice_date_mm_dd_yyyy_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_date_mm_dd_yyyy_` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`invoice_date_mm_dd_yyyy_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_date_mm_dd_yyyy_` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `invoice_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_month_yyyymm_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_month_yyyymm_` AS string)), '') AS string) END as string)
 AS `invoice_month_yyyymm_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) END as string)
 AS `invoice_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_tracking_number` AS string)), '') AS string) END as string)
 AS `master_tracking_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`national_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`national_account` AS string)), '') AS string) END as string)
 AS `national_account`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`national_sub_group` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`national_sub_group` AS string)), '') AS string) END as string)
 AS `national_sub_group`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`net_charge_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`net_charge_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `total_cost`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`net_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`net_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `base_total_cost`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`opco` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`opco` AS string)), '') AS string) END as string)
 AS `opco`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_weight_kilos_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_weight_kilos_` AS string)), '') AS string) END as string)
 AS `original_weight_kilos_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_weight_pounds_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_weight_pounds_` AS string)), '') AS string) END as string)
 AS `original_weight_pounds_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin_location_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin_location_code` AS string)), '') AS string) END as string)
 AS `origin_location_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_type` AS string)), '') AS string) END as string)
 AS `package_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payer_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payer_account` AS string)), '') AS string) END as string)
 AS `fedex_account_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_type` AS string)), '') AS string) END as string)
 AS `pay_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pieces_in_shipment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pieces_in_shipment` AS string)), '') AS string) END as string)
 AS `pieces_in_shipment`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pricing_zone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pricing_zone` AS string)), '') AS string) END as string)
 AS `pricing_zone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`proof_of_delivery_recipient` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`proof_of_delivery_recipient` AS string)), '') AS string) END as string)
 AS `proof_of_delivery_recipient`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rate_type_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rate_type_code` AS string)), '') AS string) END as string)
 AS `rate_type_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_address` AS string)), '') AS string) END as string)
 AS `recipient_address`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_city` AS string)), '') AS string) END as string)
 AS `recipient_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_company_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_company_name` AS string)), '') AS string) END as string)
 AS `recipient_company_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_country_territory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_country_territory` AS string)), '') AS string) END as string)
 AS `recipient_country_territory`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) END as string)
 AS `recipient_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_address` AS string)), '') AS string) END as string)
 AS `recipient_original_address`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_city` AS string)), '') AS string) END as string)
 AS `recipient_original_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_country_territory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_country_territory` AS string)), '') AS string) END as string)
 AS `recipient_original_country_territory`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_postal_code` AS string)), '') AS string) END as string)
 AS `recipient_original_postal_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_original_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_original_state_province` AS string)), '') AS string) END as string)
 AS `recipient_original_state_province`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_postal_code` AS string)), '') AS string) END as string)
 AS `recipient_postal_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_state_province` AS string)), '') AS string) END as string)
 AS `recipient_state_province`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_description` AS string)), '') AS string) END as string)
 AS `service_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_type` AS string)), '') AS string) END as string)
 AS `service_type`
  , 

    
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`shipment_date_mm_dd_yyyy_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_date_mm_dd_yyyy_` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`shipment_date_mm_dd_yyyy_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_date_mm_dd_yyyy_` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `ship_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_declared_value_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_declared_value_amount` AS string)), '') AS string) END as string)
 AS `shipment_declared_value_amount`
  , 

    
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`shipment_delivery_date_mm_dd_yyyy_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_delivery_date_mm_dd_yyyy_` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`shipment_delivery_date_mm_dd_yyyy_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_delivery_date_mm_dd_yyyy_` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `shipment_delivery_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_delivery_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_delivery_time` AS string)), '') AS string) END as string)
 AS `shipment_delivery_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_dim_flag_y_or_n_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_dim_flag_y_or_n_` AS string)), '') AS string) END as string)
 AS `shipment_dim_flag_y_or_n_`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_discount_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_discount_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `shipment_discount_amount`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_discount_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_discount_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `base_shipment_discount`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_duty_and_tax_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_duty_and_tax_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `base_shipment_duty_and_tax_charge`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_duty_and_tax_charge_usd` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_duty_and_tax_charge_usd` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `shipment_duty_and_tax_charge`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_freight_charge_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_freight_charge_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `shipment_freight_charge`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_freight_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_freight_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `base_shipment_freight_charge`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_miscellaneous_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_miscellaneous_charge_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `base_shipment_miscellaneous_charge`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`shipment_miscellaneous_charge_usd` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`shipment_miscellaneous_charge_usd` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `shipment_miscellaneous_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_rated_weight_kilos_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_rated_weight_kilos_` AS string)), '') AS string) END as string)
 AS `shipment_rated_weight_kilos_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_rated_weight_pounds_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_rated_weight_pounds_` AS string)), '') AS string) END as string)
 AS `shipment_rated_weight_pounds_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_address` AS string)), '') AS string) END as string)
 AS `shipper_address`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_city` AS string)), '') AS string) END as string)
 AS `shipper_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_company_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_company_name` AS string)), '') AS string) END as string)
 AS `shipper_company_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_country_territory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_country_territory` AS string)), '') AS string) END as string)
 AS `shipper_country_territory`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_name` AS string)), '') AS string) END as string)
 AS `shipper_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_postal_code` AS string)), '') AS string) END as string)
 AS `shipper_postal_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper_state_province` AS string)), '') AS string) END as string)
 AS `shipper_state_province`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sub_group_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sub_group_number` AS string)), '') AS string) END as string)
 AS `sub_group_number`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`surcharge_amount_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`surcharge_amount_billed_currency` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `base_surcharge_amount`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`surcharge_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`surcharge_amount_usd` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `surcharge_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`surcharge_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`surcharge_description` AS string)), '') AS string) END as string)
 AS `surcharge_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , `shipment_delivery_time_12_hours_` AS `_raw_shipment_delivery_time_12_hours_`
FROM `ff-stadiumgoods-raw-live`.`imports`.`fedex_sg_finance`

WHERE 1=1
AND file_name NOT IN ('FedEx_SGFinance_20201209993432.zip')
                 ) , final AS ( 
                    SELECT

    `account_group` AS `account_group`
  , `base_currency` AS `base_currency`
  , `charge_category` AS `charge_category`
  , `country_number` AS `country_number`
  , `customer_order_number` AS `customer_order_number`
  , `customs_number` AS `customs_number`
  , `customs_value` AS `customs_value`
  , `customs_value_currency_code` AS `customs_value_currency_code`
  , `department_number` AS `department_number`
  , `destination_location_code` AS `destination_location_code`
  , `dimmed_height_in_` AS `dimmed_height_in_`
  , `dimmed_length_in_` AS `dimmed_length_in_`
  , `dimmed_width_in_` AS `dimmed_width_in_`
  , `division_number` AS `division_number`
  , `domestic_intl` AS `domestic_intl`
  , `exchange_rate_to_usd` AS `exchange_rate_to_usd`
  , `facility_number` AS `facility_number`
  , `file_name` AS `file_name`
  , `global_entity_number` AS `global_entity_number`
  , `group_number` AS `group_number`
  , `invoice_date` AS `invoice_date`
  , `invoice_month_yyyymm_` AS `invoice_month_yyyymm_`
  , `invoice_id` AS `invoice_id`
  , `master_tracking_number` AS `master_tracking_number`
  , `national_account` AS `national_account`
  , `national_sub_group` AS `national_sub_group`
  , `total_cost` AS `total_cost`
  , `base_total_cost` AS `base_total_cost`
  , `opco` AS `opco`
  , `original_weight_kilos_` AS `original_weight_kilos_`
  , `original_weight_pounds_` AS `original_weight_pounds_`
  , `origin_location_code` AS `origin_location_code`
  , `package_type` AS `package_type`
  , `fedex_account_id` AS `fedex_account_id`
  , `pay_type` AS `pay_type`
  , `pieces_in_shipment` AS `pieces_in_shipment`
  , `po_number` AS `po_number`
  , `pricing_zone` AS `pricing_zone`
  , `proof_of_delivery_recipient` AS `proof_of_delivery_recipient`
  , `rate_type_code` AS `rate_type_code`
  , `recipient_address` AS `recipient_address`
  , `recipient_city` AS `recipient_city`
  , `recipient_company_name` AS `recipient_company_name`
  , `recipient_country_territory` AS `recipient_country_territory`
  , `recipient_name` AS `recipient_name`
  , `recipient_original_address` AS `recipient_original_address`
  , `recipient_original_city` AS `recipient_original_city`
  , `recipient_original_country_territory` AS `recipient_original_country_territory`
  , `recipient_original_postal_code` AS `recipient_original_postal_code`
  , `recipient_original_state_province` AS `recipient_original_state_province`
  , `recipient_postal_code` AS `recipient_postal_code`
  , `recipient_state_province` AS `recipient_state_province`
  , `reference_notes_line_1` AS `reference_notes_line_1`
  , `reference_notes_line_2` AS `reference_notes_line_2`
  , `reference_notes_line_3` AS `reference_notes_line_3`
  , `service_description` AS `service_description`
  , `service_type` AS `service_type`
  , `ship_date` AS `ship_date`
  , `shipment_declared_value_amount` AS `shipment_declared_value_amount`
  , `shipment_delivery_date` AS `shipment_delivery_date`
  , `shipment_delivery_time` AS `shipment_delivery_time`
  , `shipment_dim_flag_y_or_n_` AS `shipment_dim_flag_y_or_n_`
  , `shipment_discount_amount` AS `shipment_discount_amount`
  , `base_shipment_discount` AS `base_shipment_discount`
  , `base_shipment_duty_and_tax_charge` AS `base_shipment_duty_and_tax_charge`
  , `shipment_duty_and_tax_charge` AS `shipment_duty_and_tax_charge`
  , `shipment_freight_charge` AS `shipment_freight_charge`
  , `base_shipment_freight_charge` AS `base_shipment_freight_charge`
  , `base_shipment_miscellaneous_charge` AS `base_shipment_miscellaneous_charge`
  , `shipment_miscellaneous_charge` AS `shipment_miscellaneous_charge`
  , `shipment_rated_weight_kilos_` AS `shipment_rated_weight_kilos_`
  , `shipment_rated_weight_pounds_` AS `shipment_rated_weight_pounds_`
  , `tracking_number` AS `tracking_number`
  , `shipper_address` AS `shipper_address`
  , `shipper_city` AS `shipper_city`
  , `shipper_company_name` AS `shipper_company_name`
  , `shipper_country_territory` AS `shipper_country_territory`
  , `shipper_name` AS `shipper_name`
  , `shipper_postal_code` AS `shipper_postal_code`
  , `shipper_state_province` AS `shipper_state_province`
  , `sub_group_number` AS `sub_group_number`
  , `base_surcharge_amount` AS `base_surcharge_amount`
  , `surcharge_amount` AS `surcharge_amount`
  , `surcharge_description` AS `surcharge_description`
  , `file_time` AS `file_time`
  , `_raw_shipment_delivery_time_12_hours_` AS `_raw_shipment_delivery_time_12_hours_`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

