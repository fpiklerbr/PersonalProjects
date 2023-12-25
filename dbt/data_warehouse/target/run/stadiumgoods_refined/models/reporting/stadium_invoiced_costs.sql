

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_invoiced_costs`
  
  
  OPTIONS()
  as (
    WITH invoiced AS (



        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_p2p_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(`pick_up_date` as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(`pieces` as STRING) as `pieces` ,
                    cast(`weight` as STRING) as `weight` ,
                    cast(`service` as STRING) as `service` ,
                    cast(`format` as STRING) as `format` ,
                    cast(`ref` as STRING) as `ref` ,
                    cast(`shipping_company` as STRING) as `shipping_company` ,
                    cast(`ref_1` as STRING) as `ref_1` ,
                    cast(`ref_2` as STRING) as `ref_2` ,
                    cast(`ref_3` as STRING) as `ref_3` ,
                    cast(`shipper_location` as STRING) as `shipper_location` ,
                    cast(`shipper_country` as STRING) as `shipper_country` ,
                    cast(`recipient_location` as STRING) as `recipient_location` ,
                    cast(`recipient_country` as STRING) as `recipient_country` ,
                    cast(`zone` as STRING) as `zone` ,
                    cast(`ship_cost_shipping` as FLOAT64) as `ship_cost_shipping` ,
                    cast(`ship_cost_fuel_surcharge` as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(`extra_charges` as FLOAT64) as `extra_charges` ,
                    cast(`extra_charges_breakdown` as STRING) as `extra_charges_breakdown` ,
                    cast(`total_net_price` as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(`vat` as STRING) as `vat` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(`zone_new` as STRING) as `zone_new` ,
                    cast(`declared_value` as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(`fedex_account_id` as STRING) as `fedex_account_id` ,
                    cast(`reference` as STRING) as `reference` ,
                    cast(`shipping_account` as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(`ship_cost_declared_value` as FLOAT64) as `ship_cost_declared_value` ,
                    cast(`ship_cost_saturday_pickup` as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(`ship_cost_das` as FLOAT64) as `ship_cost_das` ,
                    cast(`ship_cost_address_correction` as FLOAT64) as `ship_cost_address_correction` ,
                    cast(`ship_cost_additional_handling` as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(`ship_cost_oversize_charge` as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(`ship_cost_signature_required` as FLOAT64) as `ship_cost_signature_required` ,
                    cast(`ship_cost_other_charges` as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(null as DATE) as `ship_date` ,
                    cast(null as STRING) as `base_currency` ,
                    cast(null as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(null as FLOAT64) as `base_duties_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(null as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_p2p_invoiced_tracking_numbers`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dhl_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(`ship_cost_shipping` as FLOAT64) as `ship_cost_shipping` ,
                    cast(`ship_cost_fuel_surcharge` as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(null as STRING) as `fedex_account_id` ,
                    cast(null as STRING) as `reference` ,
                    cast(null as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(`ship_cost_other_charges` as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`base_currency` as STRING) as `base_currency` ,
                    cast(`base_total_cost` as FLOAT64) as `base_total_cost` ,
                    cast(`base_customs_cost` as FLOAT64) as `base_customs_cost` ,
                    cast(`base_duties_cost` as FLOAT64) as `base_duties_cost` ,
                    cast(`base_ship_cost` as FLOAT64) as `base_ship_cost` ,
                    cast(`base_ship_cost_shipping` as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(`base_ship_cost_fuel_surcharge` as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(`base_ship_cost_other_charges` as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(`customs_cost` as FLOAT64) as `customs_cost` ,
                    cast(`duties_cost` as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dhl_invoiced_tracking_numbers`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_zebra_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(null as FLOAT64) as `ship_cost_shipping` ,
                    cast(null as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(null as STRING) as `fedex_account_id` ,
                    cast(null as STRING) as `reference` ,
                    cast(null as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(null as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(null as STRING) as `base_currency` ,
                    cast(null as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(null as FLOAT64) as `base_duties_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(null as FLOAT64) as `duties_cost` ,
                    cast(`ship_reference` as STRING) as `ship_reference` ,
                    cast(`customer_reference_number` as STRING) as `customer_reference_number` ,
                    cast(`transit_order_number` as STRING) as `transit_order_number` ,
                    cast(`ship_tax` as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_zebra_invoiced_tracking_numbers`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_b2c_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(null as FLOAT64) as `ship_cost_shipping` ,
                    cast(null as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(null as STRING) as `fedex_account_id` ,
                    cast(null as STRING) as `reference` ,
                    cast(null as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(null as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`base_currency` as STRING) as `base_currency` ,
                    cast(`base_total_cost` as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(`base_duties_cost` as FLOAT64) as `base_duties_cost` ,
                    cast(`base_ship_cost` as FLOAT64) as `base_ship_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(`duties_cost` as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_b2c_invoiced_tracking_numbers`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_flow_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(null as FLOAT64) as `ship_cost_shipping` ,
                    cast(null as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(null as STRING) as `fedex_account_id` ,
                    cast(null as STRING) as `reference` ,
                    cast(null as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(null as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(null as DATE) as `ship_date` ,
                    cast(null as STRING) as `base_currency` ,
                    cast(null as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(null as FLOAT64) as `base_duties_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(`duties_cost` as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_flow_invoiced_tracking_numbers`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fedex_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(`ship_cost_shipping` as FLOAT64) as `ship_cost_shipping` ,
                    cast(null as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(`fedex_account_id` as STRING) as `fedex_account_id` ,
                    cast(`reference` as STRING) as `reference` ,
                    cast(`shipping_account` as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(`ship_cost_other_charges` as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`base_currency` as STRING) as `base_currency` ,
                    cast(`base_total_cost` as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(null as FLOAT64) as `base_duties_cost` ,
                    cast(`base_ship_cost` as FLOAT64) as `base_ship_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(null as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fedex_invoiced_tracking_numbers`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_costs`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(null as FLOAT64) as `ship_cost_shipping` ,
                    cast(null as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(null as STRING) as `fedex_account_id` ,
                    cast(null as STRING) as `reference` ,
                    cast(null as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(null as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(null as STRING) as `base_currency` ,
                    cast(null as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(null as FLOAT64) as `base_duties_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(null as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(`cap_client_center` as STRING) as `cap_client_center` ,
                    cast(`cap_location` as STRING) as `cap_location` ,
                    cast(`operations_subcategory` as STRING) as `operations_subcategory` ,
                    cast(`warehouse_cost` as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_costs`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_mainfreight_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(null as FLOAT64) as `ship_cost_shipping` ,
                    cast(null as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(null as STRING) as `fedex_account_id` ,
                    cast(null as STRING) as `reference` ,
                    cast(null as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(null as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(null as DATE) as `ship_date` ,
                    cast(null as STRING) as `base_currency` ,
                    cast(null as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(null as FLOAT64) as `base_duties_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(null as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(null as FLOAT64) as `base_ship_cost_return` ,
                    cast(null as FLOAT64) as `base_ship_cost_other` ,
                    cast(null as FLOAT64) as `ship_cost_return` ,
                    cast(null as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_mainfreight_invoiced_tracking_numbers`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_invoiced_tracking_numbers`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as DATE) as `pick_up_date` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(null as STRING) as `pieces` ,
                    cast(null as STRING) as `weight` ,
                    cast(null as STRING) as `service` ,
                    cast(null as STRING) as `format` ,
                    cast(null as STRING) as `ref` ,
                    cast(null as STRING) as `shipping_company` ,
                    cast(null as STRING) as `ref_1` ,
                    cast(null as STRING) as `ref_2` ,
                    cast(null as STRING) as `ref_3` ,
                    cast(null as STRING) as `shipper_location` ,
                    cast(null as STRING) as `shipper_country` ,
                    cast(null as STRING) as `recipient_location` ,
                    cast(null as STRING) as `recipient_country` ,
                    cast(null as STRING) as `zone` ,
                    cast(`ship_cost_shipping` as FLOAT64) as `ship_cost_shipping` ,
                    cast(null as FLOAT64) as `ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `extra_charges` ,
                    cast(null as STRING) as `extra_charges_breakdown` ,
                    cast(null as STRING) as `total_net_price` ,
                    cast(`total_cost` as FLOAT64) as `total_cost` ,
                    cast(null as STRING) as `vat` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(null as STRING) as `zone_new` ,
                    cast(null as STRING) as `declared_value` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(null as STRING) as `fedex_account_id` ,
                    cast(null as STRING) as `reference` ,
                    cast(null as STRING) as `shipping_account` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(null as FLOAT64) as `ship_cost_declared_value` ,
                    cast(null as FLOAT64) as `ship_cost_saturday_pickup` ,
                    cast(null as FLOAT64) as `ship_cost_das` ,
                    cast(null as FLOAT64) as `ship_cost_address_correction` ,
                    cast(null as FLOAT64) as `ship_cost_additional_handling` ,
                    cast(null as FLOAT64) as `ship_cost_oversize_charge` ,
                    cast(null as FLOAT64) as `ship_cost_signature_required` ,
                    cast(null as FLOAT64) as `ship_cost_other_charges` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`invoice_type` as STRING) as `invoice_type` ,
                    cast(null as DATE) as `ship_date` ,
                    cast(`base_currency` as STRING) as `base_currency` ,
                    cast(`base_total_cost` as FLOAT64) as `base_total_cost` ,
                    cast(null as FLOAT64) as `base_customs_cost` ,
                    cast(null as FLOAT64) as `base_duties_cost` ,
                    cast(`base_ship_cost` as FLOAT64) as `base_ship_cost` ,
                    cast(`base_ship_cost_shipping` as FLOAT64) as `base_ship_cost_shipping` ,
                    cast(null as FLOAT64) as `base_ship_cost_fuel_surcharge` ,
                    cast(null as FLOAT64) as `base_ship_cost_other_charges` ,
                    cast(null as FLOAT64) as `customs_cost` ,
                    cast(null as FLOAT64) as `duties_cost` ,
                    cast(null as STRING) as `ship_reference` ,
                    cast(null as STRING) as `customer_reference_number` ,
                    cast(null as STRING) as `transit_order_number` ,
                    cast(null as FLOAT64) as `ship_tax` ,
                    cast(null as STRING) as `cap_client_center` ,
                    cast(null as STRING) as `cap_location` ,
                    cast(null as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `warehouse_cost` ,
                    cast(`base_ship_cost_return` as FLOAT64) as `base_ship_cost_return` ,
                    cast(`base_ship_cost_other` as FLOAT64) as `base_ship_cost_other` ,
                    cast(`ship_cost_return` as FLOAT64) as `ship_cost_return` ,
                    cast(`ship_cost_other` as FLOAT64) as `ship_cost_other` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_invoiced_tracking_numbers`
        )

        

), final AS (

  SELECT
      *
    , current_timestamp AS rebuild_timestamp
  FROM invoiced

)

SELECT * FROM final
  );
    