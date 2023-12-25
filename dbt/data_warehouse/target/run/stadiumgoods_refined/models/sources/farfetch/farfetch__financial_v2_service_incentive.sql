

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_v2_service_incentive`
  
  
  OPTIONS()
  as (
    



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`atv_actual_transaction_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`atv_actual_transaction_value` AS string)), '') AS string) END as string)
 AS `atv_actual_transaction_value`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`calculated_on` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`calculated_on` AS string)), '') AS string) END as string)
 AS `calculated_on`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`correction` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`correction` AS string)), '') AS string) END as string)
 AS `correction`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ei_extra_incentive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ei_extra_incentive` AS string)), '') AS string) END as string)
 AS `ei_extra_incentive`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eligibility` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eligibility` AS string)), '') AS string) END as string)
 AS `eligibility`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`extra_incentive_atv_ei_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`extra_incentive_atv_ei_` AS string)), '') AS string) END as string)
 AS `extra_incentive_atv_ei_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nps_nps_packaging_rate_average` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nps_nps_packaging_rate_average` AS string)), '') AS string) END as string)
 AS `nps_nps_packaging_rate_average`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ns_no_stock` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ns_no_stock` AS string)), '') AS string) END as string)
 AS `ns_no_stock`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`packaging_cost_amount_waived_pc_pcw_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`packaging_cost_amount_waived_pc_pcw_` AS string)), '') AS string) END as string)
 AS `packaging_cost_amount_waived_pc_pcw_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pa_packaging_accuracy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pa_packaging_accuracy` AS string)), '') AS string) END as string)
 AS `pa_packaging_accuracy`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pc_packaging_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pc_packaging_cost` AS string)), '') AS string) END as string)
 AS `pc_packaging_cost`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcw_packaging_cost_waived` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcw_packaging_cost_waived` AS string)), '') AS string) END as string)
 AS `pcw_packaging_cost_waived`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qo_quantity_of_orders_eligible_to_service_incentive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qo_quantity_of_orders_eligible_to_service_incentive` AS string)), '') AS string) END as string)
 AS `qo_quantity_of_orders_eligible_to_service_incentive`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`report_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`report_country` AS string)), '') AS string) END as string)
 AS `report_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`report_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`report_status` AS string)), '') AS string) END as string)
 AS `report_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_returns` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_returns` AS string)), '') AS string) END as string)
 AS `_returns`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_incentive_period` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_incentive_period` AS string)), '') AS string) END as string)
 AS `service_incentive_period`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`si_incentive_so_s_ns_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`si_incentive_so_s_ns_` AS string)), '') AS string) END as string)
 AS `si_incentive_so_s_ns_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`so_s2_orders_with_net_sos_1_day` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`so_s2_orders_with_net_sos_1_day` AS string)), '') AS string) END as string)
 AS `so_s2_orders_with_net_sos_1_day`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`so_s_orders_with_net_so_s_2_days` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`so_s_orders_with_net_so_s_2_days` AS string)), '') AS string) END as string)
 AS `so_s_orders_with_net_so_s_2_days`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_extra_incentive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_extra_incentive` AS string)), '') AS string) END as string)
 AS `total_extra_incentive`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_extra_incentive_pc_pcw_atv_ei_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_extra_incentive_pc_pcw_atv_ei_` AS string)), '') AS string) END as string)
 AS `total_extra_incentive_pc_pcw_atv_ei_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_main_incentive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_main_incentive` AS string)), '') AS string) END as string)
 AS `total_main_incentive`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_packaging_incentive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_packaging_incentive` AS string)), '') AS string) END as string)
 AS `total_packaging_incentive`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_packaging_incentive_atv_pa_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_packaging_incentive_atv_pa_` AS string)), '') AS string) END as string)
 AS `total_packaging_incentive_atv_pa_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_service_incentive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_service_incentive` AS string)), '') AS string) END as string)
 AS `total_service_incentive`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_service_incentive_atv_si_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_service_incentive_atv_si_` AS string)), '') AS string) END as string)
 AS `total_service_incentive_atv_si_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_wrong_item` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_wrong_item` AS string)), '') AS string) END as string)
 AS `_wrong_item`
  , `entity_` AS `_raw_entity_`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_service_incentive`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast('11218' as string)
 AS `fps_stock_point_id`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `atv_actual_transaction_value` AS `atv_actual_transaction_value`
  , `calculated_on` AS `calculated_on`
  , `correction` AS `correction`
  , `ei_extra_incentive` AS `ei_extra_incentive`
  , `eligibility` AS `eligibility`
  , `extra_incentive_atv_ei_` AS `extra_incentive_atv_ei_`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
  , `nps_nps_packaging_rate_average` AS `nps_nps_packaging_rate_average`
  , `ns_no_stock` AS `ns_no_stock`
  , `packaging_cost_amount_waived_pc_pcw_` AS `packaging_cost_amount_waived_pc_pcw_`
  , `pa_packaging_accuracy` AS `pa_packaging_accuracy`
  , `pc_packaging_cost` AS `pc_packaging_cost`
  , `pcw_packaging_cost_waived` AS `pcw_packaging_cost_waived`
  , `qo_quantity_of_orders_eligible_to_service_incentive` AS `qo_quantity_of_orders_eligible_to_service_incentive`
  , `report_country` AS `report_country`
  , `report_status` AS `report_status`
  , `_returns` AS `_returns`
  , `service_incentive_period` AS `service_incentive_period`
  , `si_incentive_so_s_ns_` AS `si_incentive_so_s_ns_`
  , `so_s2_orders_with_net_sos_1_day` AS `so_s2_orders_with_net_sos_1_day`
  , `so_s_orders_with_net_so_s_2_days` AS `so_s_orders_with_net_so_s_2_days`
  , `total_extra_incentive` AS `total_extra_incentive`
  , `total_extra_incentive_pc_pcw_atv_ei_` AS `total_extra_incentive_pc_pcw_atv_ei_`
  , `total_main_incentive` AS `total_main_incentive`
  , `total_packaging_incentive` AS `total_packaging_incentive`
  , `total_packaging_incentive_atv_pa_` AS `total_packaging_incentive_atv_pa_`
  , `total_service_incentive` AS `total_service_incentive`
  , `total_service_incentive_atv_si_` AS `total_service_incentive_atv_si_`
  , `_wrong_item` AS `_wrong_item`
  , `fps_stock_point_id` AS `fps_stock_point_id`
  , `_raw_entity_` AS `_raw_entity_`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 
  );
    