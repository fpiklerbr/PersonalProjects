



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`encrypted_password` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`encrypted_password` AS string)), '') AS string) END as string)
 AS `encrypted_password`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reset_password_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reset_password_token` AS string)), '') AS string) END as string)
 AS `reset_password_token`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reset_password_sent_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reset_password_sent_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `reset_password_sent_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`remember_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`remember_created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `remember_created_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sign_in_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sign_in_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `sign_in_count`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`current_sign_in_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`current_sign_in_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `current_sign_in_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_sign_in_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_sign_in_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `last_sign_in_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`current_sign_in_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`current_sign_in_ip` AS string)), '') AS string) END as string)
 AS `current_sign_in_ip`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_sign_in_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_sign_in_ip` AS string)), '') AS string) END as string)
 AS `last_sign_in_ip`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`confirmation_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`confirmation_token` AS string)), '') AS string) END as string)
 AS `confirmation_token`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`confirmed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`confirmed_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `confirmed_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`confirmation_sent_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`confirmation_sent_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `confirmation_sent_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`provider` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`provider` AS string)), '') AS string) END as string)
 AS `provider`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consigner_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consigner_id` AS string)), '') AS string) END as string)
 AS `consignor_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`agreement_accepted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`agreement_accepted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `agreement_accepted_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_token` AS string)), '') AS string) END as string)
 AS `invitation_token`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `invitation_created_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_sent_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_sent_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `invitation_sent_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_accepted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_accepted_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `invitation_accepted_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_limit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_limit` AS string)), '') AS string) END as float64)
 as int64)
 AS `invitation_limit`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invited_by_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invited_by_type` AS string)), '') AS string) END as string)
 AS `invited_by_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invited_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invited_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `invited_by_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitations_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitations_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `invitations_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked` AS string)), '') AS string) END as string)
 AS `locked`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`role` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`role` AS string)), '') AS string) END as float64)
 as int64)
 AS `role`
  , CAST(NULL AS string) AS `new_agreement_accepted`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`failed_attempts` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`failed_attempts` AS string)), '') AS string) END as float64)
 as int64)
 AS `failed_attempts`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unlock_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unlock_token` AS string)), '') AS string) END as string)
 AS `unlock_token`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `locked_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increase_price_allowed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increase_price_allowed` AS string)), '') AS string) END as float64)
 as int64)
 AS `increase_price_allowed`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`in_dispute` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`in_dispute` AS string)), '') AS string) END as float64)
 as int64)
 AS `in_dispute`
  , CAST(NULL AS string) AS `accepts_returns`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`wholesale` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wholesale` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`wholesale` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wholesale` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_1p`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`indexed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`indexed_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `indexed_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`enterprise` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enterprise` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`enterprise` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enterprise` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_enterprise`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`supplier_acronym` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`supplier_acronym` AS string)), '') AS string) END as string)
 AS `supplier_acronym`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`sync_to_x3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sync_to_x3` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`sync_to_x3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sync_to_x3` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_synched_to_x3`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_rate` AS string)), '') AS string) END as numeric)
 AS `commission_rate`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `deleted_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_reminded_to_consign_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_reminded_to_consign_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `last_reminded_to_consign_at`
  , CAST(NULL AS string) AS `auto_create_payment_request`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stripe_customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stripe_customer_id` AS string)), '') AS string) END as string)
 AS `stripe_customer_id`
  , CAST(NULL AS string) AS `enrolled_in_new_payouts`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`dss` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dss` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`dss` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dss` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_dss`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_form_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_form_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `tax_form_status`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`locked_to_dashboard` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_to_dashboard` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`locked_to_dashboard` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_to_dashboard` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_locked_to_dashboard`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_message` AS string)), '') AS string) END as string)
 AS `lock_message`
  , CAST(NULL AS datetime) AS `accepts_returns_enabled_at`
  , CAST(NULL AS datetime) AS `accepts_returns_disabled_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pricing_info_email_sent_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pricing_info_email_sent_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `pricing_info_email_sent_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_notifications_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_notifications_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `new_notifications_count`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`referred_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`referred_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `referred_by_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`onport_dropship_provider_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`onport_dropship_provider_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `onport_dropship_provider_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_type` AS string)), '') AS string) END as float64)
 as int64)
 AS `account_type`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tier` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'Standard' AS string)
WHEN 1 THEN cast( 'Enterprise Tier 1' AS string)
WHEN 2 THEN cast( 'Enterprise Tier 2' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`tier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tier` AS string)), '') AS string) END AS string)
END AS `seller_tier`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`employee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`employee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_employee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `attempted_deletion_request_at` AS `_raw_attempted_deletion_request_at`
  , `locked_for_fraud` AS `_raw_locked_for_fraud`
  , `intake_pickup_enabled_at` AS `_raw_intake_pickup_enabled_at`
  , `password_changed_at` AS `_raw_password_changed_at`
  , `print_label_type` AS `_raw_print_label_type`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN is_1p IS TRUE THEN '1P' ELSE '3P' END as string)
 AS `inventory_relationship`
  , 
    safe_cast(CASE
WHEN consignor_id IN ('DB00000001','DB00000004') THEN 'Returns Purchase'
WHEN consignor_id IN ('DB00000002','DB00000003','DB00000005') THEN 'SG Apparel'
WHEN is_1p IS TRUE THEN 'Wholesale'
ELSE 'Consignment'
END as string)
 AS `inventory_type`
  , 
    safe_cast(CASE WHEN base_currency = 'EUR' THEN 'STADIUM GOODS EU' ELSE 'STADIUM GOODS USA' END as string)
 AS `business_entity`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `user_id` AS `user_id`
  , to_hex(md5(cast(`email` as 
    string
))) AS `email`
  , `reset_password_sent_at` AS `reset_password_sent_at`
  , `remember_created_at` AS `remember_created_at`
  , `sign_in_count` AS `sign_in_count`
  , `current_sign_in_at` AS `current_sign_in_at`
  , `last_sign_in_at` AS `last_sign_in_at`
  , `current_sign_in_ip` AS `current_sign_in_ip`
  , `last_sign_in_ip` AS `last_sign_in_ip`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `confirmation_token` AS `confirmation_token`
  , `confirmed_at` AS `confirmed_at`
  , `confirmation_sent_at` AS `confirmation_sent_at`
  , `provider` AS `provider`
  , `type` AS `type`
  , `consignor_id` AS `consignor_id`
  , `agreement_accepted_at` AS `agreement_accepted_at`
  , `invitation_token` AS `invitation_token`
  , `invitation_created_at` AS `invitation_created_at`
  , `invitation_sent_at` AS `invitation_sent_at`
  , `invitation_accepted_at` AS `invitation_accepted_at`
  , `invitation_limit` AS `invitation_limit`
  , `invited_by_type` AS `invited_by_type`
  , `invited_by_id` AS `invited_by_id`
  , `invitations_count` AS `invitations_count`
  , `locked` AS `locked`
  , `role` AS `role`
  , `new_agreement_accepted` AS `new_agreement_accepted`
  , `failed_attempts` AS `failed_attempts`
  , `unlock_token` AS `unlock_token`
  , `locked_at` AS `locked_at`
  , `increase_price_allowed` AS `increase_price_allowed`
  , `in_dispute` AS `in_dispute`
  , `accepts_returns` AS `accepts_returns`
  , `is_1p` AS `is_1p`
  , `inventory_relationship` AS `inventory_relationship`
  , `inventory_type` AS `inventory_type`
  , `indexed_at` AS `indexed_at`
  , `is_enterprise` AS `is_enterprise`
  , `supplier_acronym` AS `supplier_acronym`
  , `is_synched_to_x3` AS `is_synched_to_x3`
  , `commission_rate` AS `commission_rate`
  , `lock_version` AS `lock_version`
  , `deleted_at` AS `deleted_at`
  , `last_reminded_to_consign_at` AS `last_reminded_to_consign_at`
  , `auto_create_payment_request` AS `auto_create_payment_request`
  , `stripe_customer_id` AS `stripe_customer_id`
  , `enrolled_in_new_payouts` AS `enrolled_in_new_payouts`
  , `is_dss` AS `is_dss`
  , `tax_form_status` AS `tax_form_status`
  , `is_locked_to_dashboard` AS `is_locked_to_dashboard`
  , `lock_message` AS `lock_message`
  , `accepts_returns_enabled_at` AS `accepts_returns_enabled_at`
  , `accepts_returns_disabled_at` AS `accepts_returns_disabled_at`
  , `pricing_info_email_sent_at` AS `pricing_info_email_sent_at`
  , `new_notifications_count` AS `new_notifications_count`
  , `referred_by_id` AS `referred_by_id`
  , `onport_dropship_provider_id` AS `onport_dropship_provider_id`
  , `account_type` AS `account_type`
  , `seller_tier` AS `seller_tier`
  , `base_currency` AS `base_currency`
  , `is_employee` AS `is_employee`
  , `business_entity` AS `business_entity`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_attempted_deletion_request_at` AS `_raw_attempted_deletion_request_at`
  , `_raw_locked_for_fraud` AS `_raw_locked_for_fraud`
  , `_raw_intake_pickup_enabled_at` AS `_raw_intake_pickup_enabled_at`
  , `_raw_password_changed_at` AS `_raw_password_changed_at`
  , `_raw_print_label_type` AS `_raw_print_label_type`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 