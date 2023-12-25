WITH rmas AS (

  SELECT
      rmas.`m_rma_id`,
  rmas.`mag_rma_id`,
  rmas.`guest_id`,
  rmas.`firstname`,
  rmas.`lastname`,
  rmas.`company`,
  rmas.`telephone`,
  rmas.`street`,
  rmas.`city`,
  rmas.`region`,
  rmas.`region_id`,
  rmas.`country_id`,
  rmas.`postcode`,
  rmas.`offline_address`,
  rmas.`customer_id`,
  rmas.`order_id`,
  rmas.`m_rma_status_id`,
  rmas.`store_id`,
  rmas.`tracking_code`,
  rmas.`is_resolved`,
  rmas.`is_archived`,
  rmas.`created_at`,
  rmas.`updated_at`,
  rmas.`ticket_id`,
  rmas.`admin_user_id`,
  rmas.`last_reply_at`,
  rmas.`is_gift`,
  rmas.`exchange_order_id`,
  rmas.`credit_memo_id`,
  rmas.`is_admin_read`,
  rmas.`return_address_id`,
  rmas.`_raw__synched_from_source_at`
    , nullif(trim(upper(rmas.last_reply_name)), '') AS last_reply_name
    , rmas.email AS rma_email
    , trim( substr(
    concat(
    
      coalesce(rmas.firstname|| ' ' , '')
    
      , coalesce(rmas.lastname|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(rmas.firstname|| ' ' , '')
    
      , coalesce(rmas.lastname|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
) ) AS rma_name
    , safe_cast(datetime(safe_cast(rmas.created_at AS timestamp), 'America/New_York') AS datetime) AS rma_creation_nyc
    , safe_cast(datetime(safe_cast(rmas.updated_at AS timestamp), 'America/New_York') AS datetime) AS rma_update_nyc
    , safe_cast(datetime(safe_cast(rmas.last_reply_at AS timestamp), 'America/New_York') AS datetime) AS last_reply_nyc
    , coalesce(
          
  CAST(regexp_extract(statuses.name, 
  r'"(.+)"'
) AS string)

        , statuses.name
        , 'Status #' || cast(rmas.m_rma_status_id AS string )
      ) AS rma_status
    , coalesce(
          nullif(trim( substr(
    concat(
    
      coalesce(users.firstname|| ' ' , '')
    
      , coalesce(users.lastname|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(users.firstname|| ' ' , '')
    
      , coalesce(users.lastname|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
) ), '')
        , 'User #' || cast(rmas.admin_user_id AS string )
      ) AS rma_user
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_rma` AS rmas
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_status` AS statuses
    ON rmas.m_rma_status_id = statuses.m_rma_status_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__admin_user` AS users
    ON rmas.admin_user_id = users.admin_user_id

), tracking_numbers AS (

  SELECT
      m_rma_id
    , array_agg(DISTINCT trim(track_number)) AS rma_tracking_numbers
    , min(label_date) AS min_tracking_number_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_fedex_label`
  GROUP BY 1

), status_changes AS (

  SELECT
      m_rma_id
    , min( safe_cast(datetime(safe_cast(CASE
      WHEN 


  regexp_contains(text, r'(?i)^Return request has been received. You will be notified when your request is reviewed.*')

 OR m_rma_status_id IN (1)
      THEN created_at
    END AS timestamp), 'America/New_York') AS datetime) ) AS rma_pending_approval_nyc
    , min( safe_cast(datetime(safe_cast(CASE
      WHEN 


  regexp_contains(text, r'(?i)^Your Return request has been approved.*')

 OR m_rma_status_id IN (2)
      THEN created_at
    END AS timestamp), 'America/New_York') AS datetime) ) AS rma_approved_nyc
    , min( safe_cast(datetime(safe_cast(CASE
      WHEN 


  regexp_contains(text, r'(?i)^Return request has been rejected.*')

 OR m_rma_status_id IN (3)
      THEN created_at
    END AS timestamp), 'America/New_York') AS datetime) ) AS rma_rejected_nyc
    , min( safe_cast(datetime(safe_cast(CASE
      WHEN 


  regexp_contains(text, r'(?i)^Return request has been closed.*')

 OR m_rma_status_id IN (4)
      THEN created_at
    END AS timestamp), 'America/New_York') AS datetime) ) AS rma_closed_nyc
    , min( safe_cast(datetime(safe_cast(CASE
      WHEN 


  regexp_contains(text, r'(?i)RTS')

 OR m_rma_status_id IN (6)
      THEN created_at
    END AS timestamp), 'America/New_York') AS datetime) ) AS rma_rts_nyc
    , min( safe_cast(datetime(safe_cast(CASE
      WHEN 


  regexp_contains(text, r'(?i).*Package Approved.*')

 OR m_rma_status_id IN (7, 12)
      THEN created_at
    END AS timestamp), 'America/New_York') AS datetime) ) AS rma_package_approved_nyc
    , min( safe_cast(datetime(safe_cast(CASE
      WHEN 


  regexp_contains(text, r'(?i).*Package Denied.*')

 OR m_rma_status_id IN (8)
      THEN created_at
    END AS timestamp), 'America/New_York') AS datetime) ) AS rma_package_denied_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_comment`
  GROUP BY 1

), final AS (

  SELECT
      rmas.*
    , coalesce(
          status_changes.rma_pending_approval_nyc
        , CASE WHEN 1 = 2 THEN rmas.rma_update_nyc END
      ) AS rma_pending_approval_nyc
    , coalesce(
          status_changes.rma_approved_nyc
        , CASE WHEN 1 = 2 THEN rmas.rma_update_nyc END
      ) AS rma_approved_nyc
    , coalesce(
          status_changes.rma_rejected_nyc
        , CASE WHEN 1 = 2 THEN rmas.rma_update_nyc END
      ) AS rma_rejected_nyc
    , coalesce(
          status_changes.rma_closed_nyc
        , CASE WHEN 


  regexp_contains(rmas.rma_status, r'(?i).*closed.*')

 THEN rmas.rma_update_nyc END
      ) AS rma_closed_nyc
    , coalesce(
          status_changes.rma_rts_nyc
        , CASE WHEN 1 = 2 THEN rmas.rma_update_nyc END
      ) AS rma_rts_nyc
    , coalesce(
          status_changes.rma_package_approved_nyc
        , CASE WHEN 


  regexp_contains(rmas.rma_status, r'(?i).*package approved.*')

 THEN rmas.rma_update_nyc END
      ) AS rma_package_approved_nyc
    , coalesce(
          status_changes.rma_package_denied_nyc
        , CASE WHEN 1 = 2 THEN rmas.rma_update_nyc END
      ) AS rma_package_denied_nyc
    , tracking_numbers.rma_tracking_numbers
    , tracking_numbers.min_tracking_number_date
  FROM rmas
  LEFT JOIN status_changes
    ON rmas.m_rma_id = status_changes.m_rma_id
  LEFT JOIN tracking_numbers
    ON rmas.m_rma_id = tracking_numbers.m_rma_id

)

SELECT * FROM final