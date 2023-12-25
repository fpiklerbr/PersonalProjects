


















































































































































































 

SELECT   `line_type`,  `billing_source`,  `original_invoice_number`,  `invoice_id`,  `station_code`,  `invoice_identifier`,  `invoice_type`,  `invoice_date`,  `payment_terms`,  `due_date`,  `parent_account`,  `billing_account`,  `billing_account_name`,  `billing_account_name_additional_`,  `billing_address_1`,  `billing_address_2`,  `billing_address_3`,  `billing_postcode`,  `billing_city`,  `billing_state_province`,  `billing_country_code`,  `billing_contact`,  `vat_number`,  `tracking_number`,  `ship_date`,  `country_specific_label`,  `country_specific_value`,  `shipment_reference_1`,  `shipment_reference_2`,  `shipment_reference_3`,  `product_code`,  `product_name`,  `pieces`,  `origin`,  `orig_name`,  `orig_country_code`,  `orig_country_name`,  `senders_name`,  `senders_address_1`,  `senders_address_2`,  `senders_address_3`,  `senders_postcode`,  `senders_city`,  `senders_state_province`,  `senders_country`,  `senders_contact`,  `destination`,  `dest_name`,  `dest_country_code`,  `dest_country_name`,  `receivers_name`,  `receivers_address_1`,  `receivers_address_2`,  `receivers_address_3`,  `receivers_postcode`,  `receivers_city`,  `receivers_state_province`,  `receivers_country`,  `receivers_contact`,  `proof_of_delivery_name`,  `description_of_contents`,  `event_description`,  `dimensions`,  `cust_scale_weight_a_`,  `dhl_scale_weight_b_`,  `cust_vol_weight_v_`,  `dhl_vol_weight_w_`,  `weight_flag`,  `weight_kg_`,  `currency`,  `total_amount_excl_vat_`,  `total_cost`,  `tax_code`,  `total_tax`,  `tax_adjustment`,  `invoice_fee`,  `weight_charge`,  `weight_tax_vat`,  `other_charges_1`,  `other_charges_1_amount`,  `other_charges_2`,  `other_charges_2_amount`,  `discount_1`,  `discount_1_amount`,  `discount_2`,  `discount_2_amount`,  `discount_3`,  `discount_3_amount`,  `total_extra_charges_xc_`,  `total_extra_charges_tax`,  `xc1_code`,  `xc1_name`,  `xc1_charge`,  `xc1_tax_code`,  `xc1_tax`,  `xc1_discount`,  `xc1_total`,  `xc2_code`,  `xc2_name`,  `xc2_charge`,  `xc2_tax_code`,  `xc2_tax`,  `xc2_discount`,  `xc2_total`,  `xc3_code`,  `xc3_name`,  `xc3_charge`,  `xc3_tax_code`,  `xc3_tax`,  `xc3_discount`,  `xc3_total`,  `xc4_code`,  `xc4_name`,  `xc4_charge`,  `xc4_tax_code`,  `xc4_tax`,  `xc4_discount`,  `xc4_total`,  `xc5_code`,  `xc5_name`,  `xc5_charge`,  `xc5_tax_code`,  `xc5_tax`,  `xc5_discount`,  `xc5_total`,  `xc6_code`,  `xc6_name`,  `xc6_charge`,  `xc6_tax_code`,  `xc6_tax`,  `xc6_discount`,  `xc6_total`,  `xc7_code`,  `xc7_name`,  `xc7_charge`,  `xc7_tax_code`,  `xc7_tax`,  `xc7_discount`,  `xc7_total`,  `xc8_code`,  `xc8_name`,  `xc8_charge`,  `xc8_tax_code`,  `xc8_tax`,  `xc8_discount`,  `xc8_total`,  `xc9_code`,  `xc9_name`,  `xc9_charge`,  `xc9_tax_code`,  `xc9_tax`,  `xc9_discount`,  `xc9_total`,  `xc10_code`,  `xc10_name`,  `xc10_charge`,  `xc10_tax_code`,  `xc10_tax`,  `xc10_discount`,  `xc10_total`,  `xc11_code`,  `xc11_name`,  `xc11_charge`,  `xc11_tax_code`,  `xc11_tax`,  `xc11_discount`,  `xc11_total`,  `import_date`,  `statistical_value_xc7`,  `statistical_value_xc8`,  `statistical_value_xc9`,  `percentage_xc7`,  `percentage_xc8`,  `percentage_xc9`,  `declaration_vat_number`,  `file_name`,  `file_time`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_type` AS string)), '') AS string) END as string)
 AS `line_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_source` AS string)), '') AS string) END as string)
 AS `billing_source`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_invoice_number` AS string)), '') AS string) END as string)
 AS `original_invoice_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`station_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`station_code` AS string)), '') AS string) END as string)
 AS `station_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_identifier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_identifier` AS string)), '') AS string) END as string)
 AS `invoice_identifier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_type` AS string)), '') AS string) END as string)
 AS `invoice_type`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) END, r'(?i)^[0-9]{4}[0-9]{1,2}[0-9]{1,2}$')


          THEN  parse_timestamp('%Y%m%d', CASE WHEN cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `invoice_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_terms` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_terms` AS string)), '') AS string) END as string)
 AS `payment_terms`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`due_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`due_date` AS string)), '') AS string) END as string)
 AS `due_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_account` AS string)), '') AS string) END as string)
 AS `parent_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_account` AS string)), '') AS string) END as string)
 AS `billing_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_account_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_account_name` AS string)), '') AS string) END as string)
 AS `billing_account_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_account_name_additional_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_account_name_additional_` AS string)), '') AS string) END as string)
 AS `billing_account_name_additional_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_1` AS string)), '') AS string) END as string)
 AS `billing_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_2` AS string)), '') AS string) END as string)
 AS `billing_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_3` AS string)), '') AS string) END as string)
 AS `billing_address_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_postcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_postcode` AS string)), '') AS string) END as string)
 AS `billing_postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_city` AS string)), '') AS string) END as string)
 AS `billing_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_state_province` AS string)), '') AS string) END as string)
 AS `billing_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_country_code` AS string)), '') AS string) END as string)
 AS `billing_country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_contact` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_contact` AS string)), '') AS string) END as string)
 AS `billing_contact`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_number` AS string)), '') AS string) END as string)
 AS `vat_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) END, r'(?i)^[0-9]{4}[0-9]{1,2}[0-9]{1,2}$')


          THEN  parse_timestamp('%Y%m%d', CASE WHEN cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `ship_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_specific_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_specific_label` AS string)), '') AS string) END as string)
 AS `country_specific_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_specific_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_specific_value` AS string)), '') AS string) END as string)
 AS `country_specific_value`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_reference_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_reference_1` AS string)), '') AS string) END as string)
 AS `shipment_reference_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_reference_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_reference_2` AS string)), '') AS string) END as string)
 AS `shipment_reference_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_reference_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_reference_3` AS string)), '') AS string) END as string)
 AS `shipment_reference_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product` AS string)), '') AS string) END as string)
 AS `product_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_name` AS string)), '') AS string) END as string)
 AS `product_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pieces` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pieces` AS string)), '') AS string) END as string)
 AS `pieces`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin` AS string)), '') AS string) END as string)
 AS `origin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orig_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orig_name` AS string)), '') AS string) END as string)
 AS `orig_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orig_country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orig_country_code` AS string)), '') AS string) END as string)
 AS `orig_country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orig_country_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orig_country_name` AS string)), '') AS string) END as string)
 AS `orig_country_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_name` AS string)), '') AS string) END as string)
 AS `senders_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_address_1` AS string)), '') AS string) END as string)
 AS `senders_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_address_2` AS string)), '') AS string) END as string)
 AS `senders_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_address_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_address_3` AS string)), '') AS string) END as string)
 AS `senders_address_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_postcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_postcode` AS string)), '') AS string) END as string)
 AS `senders_postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_city` AS string)), '') AS string) END as string)
 AS `senders_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_state_province` AS string)), '') AS string) END as string)
 AS `senders_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_country` AS string)), '') AS string) END as string)
 AS `senders_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`senders_contact` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`senders_contact` AS string)), '') AS string) END as string)
 AS `senders_contact`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination` AS string)), '') AS string) END as string)
 AS `destination`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dest_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dest_name` AS string)), '') AS string) END as string)
 AS `dest_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dest_country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dest_country_code` AS string)), '') AS string) END as string)
 AS `dest_country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dest_country_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dest_country_name` AS string)), '') AS string) END as string)
 AS `dest_country_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_name` AS string)), '') AS string) END as string)
 AS `receivers_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_address_1` AS string)), '') AS string) END as string)
 AS `receivers_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_address_2` AS string)), '') AS string) END as string)
 AS `receivers_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_address_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_address_3` AS string)), '') AS string) END as string)
 AS `receivers_address_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_postcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_postcode` AS string)), '') AS string) END as string)
 AS `receivers_postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_city` AS string)), '') AS string) END as string)
 AS `receivers_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_state_province` AS string)), '') AS string) END as string)
 AS `receivers_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_country` AS string)), '') AS string) END as string)
 AS `receivers_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receivers_contact` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receivers_contact` AS string)), '') AS string) END as string)
 AS `receivers_contact`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`proof_of_delivery_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`proof_of_delivery_name` AS string)), '') AS string) END as string)
 AS `proof_of_delivery_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description_of_contents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description_of_contents` AS string)), '') AS string) END as string)
 AS `description_of_contents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_description` AS string)), '') AS string) END as string)
 AS `event_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dimensions` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dimensions` AS string)), '') AS string) END as string)
 AS `dimensions`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cust_scale_weight_a_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cust_scale_weight_a_` AS string)), '') AS string) END as string)
 AS `cust_scale_weight_a_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dhl_scale_weight_b_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dhl_scale_weight_b_` AS string)), '') AS string) END as string)
 AS `dhl_scale_weight_b_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cust_vol_weight_v_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cust_vol_weight_v_` AS string)), '') AS string) END as string)
 AS `cust_vol_weight_v_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dhl_vol_weight_w_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dhl_vol_weight_w_` AS string)), '') AS string) END as string)
 AS `dhl_vol_weight_w_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_flag` AS string)), '') AS string) END as string)
 AS `weight_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_kg_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_kg_` AS string)), '') AS string) END as string)
 AS `weight_kg_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_amount_excl_vat_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_amount_excl_vat_` AS string)), '') AS string) END as string)
 AS `total_amount_excl_vat_`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_amount_incl_vat_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_amount_incl_vat_` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `total_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_code` AS string)), '') AS string) END as string)
 AS `tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_tax` AS string)), '') AS string) END as string)
 AS `total_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_adjustment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_adjustment` AS string)), '') AS string) END as string)
 AS `tax_adjustment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_fee` AS string)), '') AS string) END as string)
 AS `invoice_fee`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_charge` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `weight_charge`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_tax_vat_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_tax_vat_` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `weight_tax_vat`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_charges_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_charges_1` AS string)), '') AS string) END as string)
 AS `other_charges_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_charges_1_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_charges_1_amount` AS string)), '') AS string) END as string)
 AS `other_charges_1_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_charges_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_charges_2` AS string)), '') AS string) END as string)
 AS `other_charges_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_charges_2_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_charges_2_amount` AS string)), '') AS string) END as string)
 AS `other_charges_2_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_1` AS string)), '') AS string) END as string)
 AS `discount_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_1_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_1_amount` AS string)), '') AS string) END as string)
 AS `discount_1_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_2` AS string)), '') AS string) END as string)
 AS `discount_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_2_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_2_amount` AS string)), '') AS string) END as string)
 AS `discount_2_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_3` AS string)), '') AS string) END as string)
 AS `discount_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_3_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_3_amount` AS string)), '') AS string) END as string)
 AS `discount_3_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_extra_charges_xc_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_extra_charges_xc_` AS string)), '') AS string) END as string)
 AS `total_extra_charges_xc_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_extra_charges_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_extra_charges_tax` AS string)), '') AS string) END as string)
 AS `total_extra_charges_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc1_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc1_code` AS string)), '') AS string) END as string)
 AS `xc1_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc1_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc1_name` AS string)), '') AS string) END as string)
 AS `xc1_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc1_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc1_charge` AS string)), '') AS string) END as string)
 AS `xc1_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc1_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc1_tax_code` AS string)), '') AS string) END as string)
 AS `xc1_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc1_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc1_tax` AS string)), '') AS string) END as string)
 AS `xc1_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc1_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc1_discount` AS string)), '') AS string) END as string)
 AS `xc1_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc1_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc1_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc1_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc2_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc2_code` AS string)), '') AS string) END as string)
 AS `xc2_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc2_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc2_name` AS string)), '') AS string) END as string)
 AS `xc2_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc2_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc2_charge` AS string)), '') AS string) END as string)
 AS `xc2_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc2_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc2_tax_code` AS string)), '') AS string) END as string)
 AS `xc2_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc2_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc2_tax` AS string)), '') AS string) END as string)
 AS `xc2_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc2_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc2_discount` AS string)), '') AS string) END as string)
 AS `xc2_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc2_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc2_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc2_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc3_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc3_code` AS string)), '') AS string) END as string)
 AS `xc3_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc3_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc3_name` AS string)), '') AS string) END as string)
 AS `xc3_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc3_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc3_charge` AS string)), '') AS string) END as string)
 AS `xc3_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc3_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc3_tax_code` AS string)), '') AS string) END as string)
 AS `xc3_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc3_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc3_tax` AS string)), '') AS string) END as string)
 AS `xc3_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc3_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc3_discount` AS string)), '') AS string) END as string)
 AS `xc3_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc3_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc3_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc3_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc4_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc4_code` AS string)), '') AS string) END as string)
 AS `xc4_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc4_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc4_name` AS string)), '') AS string) END as string)
 AS `xc4_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc4_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc4_charge` AS string)), '') AS string) END as string)
 AS `xc4_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc4_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc4_tax_code` AS string)), '') AS string) END as string)
 AS `xc4_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc4_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc4_tax` AS string)), '') AS string) END as string)
 AS `xc4_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc4_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc4_discount` AS string)), '') AS string) END as string)
 AS `xc4_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc4_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc4_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc4_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc5_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc5_code` AS string)), '') AS string) END as string)
 AS `xc5_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc5_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc5_name` AS string)), '') AS string) END as string)
 AS `xc5_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc5_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc5_charge` AS string)), '') AS string) END as string)
 AS `xc5_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc5_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc5_tax_code` AS string)), '') AS string) END as string)
 AS `xc5_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc5_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc5_tax` AS string)), '') AS string) END as string)
 AS `xc5_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc5_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc5_discount` AS string)), '') AS string) END as string)
 AS `xc5_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc5_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc5_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc5_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc6_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc6_code` AS string)), '') AS string) END as string)
 AS `xc6_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc6_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc6_name` AS string)), '') AS string) END as string)
 AS `xc6_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc6_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc6_charge` AS string)), '') AS string) END as string)
 AS `xc6_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc6_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc6_tax_code` AS string)), '') AS string) END as string)
 AS `xc6_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc6_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc6_tax` AS string)), '') AS string) END as string)
 AS `xc6_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc6_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc6_discount` AS string)), '') AS string) END as string)
 AS `xc6_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc6_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc6_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc6_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc7_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc7_code` AS string)), '') AS string) END as string)
 AS `xc7_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc7_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc7_name` AS string)), '') AS string) END as string)
 AS `xc7_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc7_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc7_charge` AS string)), '') AS string) END as string)
 AS `xc7_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc7_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc7_tax_code` AS string)), '') AS string) END as string)
 AS `xc7_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc7_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc7_tax` AS string)), '') AS string) END as string)
 AS `xc7_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc7_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc7_discount` AS string)), '') AS string) END as string)
 AS `xc7_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc7_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc7_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc7_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc8_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc8_code` AS string)), '') AS string) END as string)
 AS `xc8_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc8_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc8_name` AS string)), '') AS string) END as string)
 AS `xc8_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc8_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc8_charge` AS string)), '') AS string) END as string)
 AS `xc8_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc8_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc8_tax_code` AS string)), '') AS string) END as string)
 AS `xc8_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc8_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc8_tax` AS string)), '') AS string) END as string)
 AS `xc8_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc8_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc8_discount` AS string)), '') AS string) END as string)
 AS `xc8_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc8_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc8_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc8_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc9_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc9_code` AS string)), '') AS string) END as string)
 AS `xc9_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc9_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc9_name` AS string)), '') AS string) END as string)
 AS `xc9_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc9_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc9_charge` AS string)), '') AS string) END as string)
 AS `xc9_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc9_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc9_tax_code` AS string)), '') AS string) END as string)
 AS `xc9_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc9_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc9_tax` AS string)), '') AS string) END as string)
 AS `xc9_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc9_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc9_discount` AS string)), '') AS string) END as string)
 AS `xc9_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc9_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc9_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc9_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc10_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc10_code` AS string)), '') AS string) END as string)
 AS `xc10_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc10_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc10_name` AS string)), '') AS string) END as string)
 AS `xc10_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc10_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc10_charge` AS string)), '') AS string) END as string)
 AS `xc10_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc10_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc10_tax_code` AS string)), '') AS string) END as string)
 AS `xc10_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc10_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc10_tax` AS string)), '') AS string) END as string)
 AS `xc10_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc10_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc10_discount` AS string)), '') AS string) END as string)
 AS `xc10_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc10_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc10_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc10_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc11_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc11_code` AS string)), '') AS string) END as string)
 AS `xc11_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc11_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc11_name` AS string)), '') AS string) END as string)
 AS `xc11_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc11_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc11_charge` AS string)), '') AS string) END as string)
 AS `xc11_charge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc11_tax_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc11_tax_code` AS string)), '') AS string) END as string)
 AS `xc11_tax_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc11_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc11_tax` AS string)), '') AS string) END as string)
 AS `xc11_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc11_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc11_discount` AS string)), '') AS string) END as string)
 AS `xc11_discount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xc11_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xc11_total` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `xc11_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`import_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`import_date` AS string)), '') AS string) END as string)
 AS `import_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`statistical_value_xc7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`statistical_value_xc7` AS string)), '') AS string) END as string)
 AS `statistical_value_xc7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`statistical_value_xc8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`statistical_value_xc8` AS string)), '') AS string) END as string)
 AS `statistical_value_xc8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`statistical_value_xc9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`statistical_value_xc9` AS string)), '') AS string) END as string)
 AS `statistical_value_xc9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`percentage_xc7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`percentage_xc7` AS string)), '') AS string) END as string)
 AS `percentage_xc7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`percentage_xc8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`percentage_xc8` AS string)), '') AS string) END as string)
 AS `percentage_xc8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`percentage_xc9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`percentage_xc9` AS string)), '') AS string) END as string)
 AS `percentage_xc9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`declaration_vat_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`declaration_vat_number` AS string)), '') AS string) END as string)
 AS `declaration_vat_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`dhl_customs_invoices` AS source_table

 ) AS un_ordered

