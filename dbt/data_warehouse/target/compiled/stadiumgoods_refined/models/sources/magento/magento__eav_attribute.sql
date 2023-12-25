

  

















 

SELECT   `attribute_id`,  `entity_type_id`,  `attribute_code`,  `attribute_model`,  `backend_model`,  `backend_type`,  `backend_table`,  `frontend_model`,  `frontend_input`,  `frontend_label`,  `frontend_class`,  `source_model`,  `is_required`,  `is_user_defined`,  `default_value`,  `is_unique`,  `note`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `attribute_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_type_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_code` AS string)), '') AS string) END as string)
 AS `attribute_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_model` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_model` AS string)), '') AS string) END as string)
 AS `attribute_model`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`backend_model` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`backend_model` AS string)), '') AS string) END as string)
 AS `backend_model`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`backend_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`backend_type` AS string)), '') AS string) END as string)
 AS `backend_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`backend_table` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`backend_table` AS string)), '') AS string) END as string)
 AS `backend_table`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frontend_model` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frontend_model` AS string)), '') AS string) END as string)
 AS `frontend_model`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frontend_input` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frontend_input` AS string)), '') AS string) END as string)
 AS `frontend_input`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frontend_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frontend_label` AS string)), '') AS string) END as string)
 AS `frontend_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frontend_class` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frontend_class` AS string)), '') AS string) END as string)
 AS `frontend_class`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_model` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_model` AS string)), '') AS string) END as string)
 AS `source_model`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_required` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_required` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_required` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_required` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_required`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_user_defined` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_user_defined` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_user_defined`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`default_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`default_value` AS string)), '') AS string) END as string)
 AS `default_value`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_unique` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_unique` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_unique` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_unique` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_unique`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`note` AS string)), '') AS string) END as string)
 AS `note`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute` AS source_table

 ) AS un_ordered

