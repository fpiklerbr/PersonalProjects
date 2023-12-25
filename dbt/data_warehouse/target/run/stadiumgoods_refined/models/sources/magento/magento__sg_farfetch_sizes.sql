

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_sizes`
  OPTIONS()
  as 

  

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_size_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_size_scale_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_17` AS string)), '') AS string) END as string)
 AS `pos_17`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_18` AS string)), '') AS string) END as string)
 AS `pos_18`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_19` AS string)), '') AS string) END as string)
 AS `pos_19`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_20` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_20` AS string)), '') AS string) END as string)
 AS `pos_20`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_21` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_21` AS string)), '') AS string) END as string)
 AS `pos_21`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_22` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_22` AS string)), '') AS string) END as string)
 AS `pos_22`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_23` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_23` AS string)), '') AS string) END as string)
 AS `pos_23`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_24` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_24` AS string)), '') AS string) END as string)
 AS `pos_24`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_25` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_25` AS string)), '') AS string) END as string)
 AS `pos_25`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_26` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_26` AS string)), '') AS string) END as string)
 AS `pos_26`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_27` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_27` AS string)), '') AS string) END as string)
 AS `pos_27`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_28` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_28` AS string)), '') AS string) END as string)
 AS `pos_28`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_29` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_29` AS string)), '') AS string) END as string)
 AS `pos_29`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_30` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_30` AS string)), '') AS string) END as string)
 AS `pos_30`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_31` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_31` AS string)), '') AS string) END as string)
 AS `pos_31`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_32` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_32` AS string)), '') AS string) END as string)
 AS `pos_32`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_33` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_33` AS string)), '') AS string) END as string)
 AS `pos_33`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_34` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_34` AS string)), '') AS string) END as string)
 AS `pos_34`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_35` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_35` AS string)), '') AS string) END as string)
 AS `pos_35`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_36` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_36` AS string)), '') AS string) END as string)
 AS `pos_36`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_37` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_37` AS string)), '') AS string) END as string)
 AS `pos_37`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_38` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_38` AS string)), '') AS string) END as string)
 AS `pos_38`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_39` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_39` AS string)), '') AS string) END as string)
 AS `pos_39`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_40` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_40` AS string)), '') AS string) END as string)
 AS `pos_40`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_41` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_41` AS string)), '') AS string) END as string)
 AS `pos_41`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_42` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_42` AS string)), '') AS string) END as string)
 AS `pos_42`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_43` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_43` AS string)), '') AS string) END as string)
 AS `pos_43`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_44` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_44` AS string)), '') AS string) END as string)
 AS `pos_44`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_45` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_45` AS string)), '') AS string) END as string)
 AS `pos_45`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_46` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_46` AS string)), '') AS string) END as string)
 AS `pos_46`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_47` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_47` AS string)), '') AS string) END as string)
 AS `pos_47`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_48` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_48` AS string)), '') AS string) END as string)
 AS `pos_48`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_49` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_49` AS string)), '') AS string) END as string)
 AS `pos_49`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_50` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_50` AS string)), '') AS string) END as string)
 AS `pos_50`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_51` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_51` AS string)), '') AS string) END as string)
 AS `pos_51`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pos_52` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pos_52` AS string)), '') AS string) END as string)
 AS `pos_52`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `created_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `updated_at`
  , `_synched_from_source_at` AS `_raw__synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizes`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_size_id` AS `sg_farfetch_size_id`
  , `fps_size_scale_id` AS `fps_size_scale_id`
  , `pos_17` AS `pos_17`
  , `pos_18` AS `pos_18`
  , `pos_19` AS `pos_19`
  , `pos_20` AS `pos_20`
  , `pos_21` AS `pos_21`
  , `pos_22` AS `pos_22`
  , `pos_23` AS `pos_23`
  , `pos_24` AS `pos_24`
  , `pos_25` AS `pos_25`
  , `pos_26` AS `pos_26`
  , `pos_27` AS `pos_27`
  , `pos_28` AS `pos_28`
  , `pos_29` AS `pos_29`
  , `pos_30` AS `pos_30`
  , `pos_31` AS `pos_31`
  , `pos_32` AS `pos_32`
  , `pos_33` AS `pos_33`
  , `pos_34` AS `pos_34`
  , `pos_35` AS `pos_35`
  , `pos_36` AS `pos_36`
  , `pos_37` AS `pos_37`
  , `pos_38` AS `pos_38`
  , `pos_39` AS `pos_39`
  , `pos_40` AS `pos_40`
  , `pos_41` AS `pos_41`
  , `pos_42` AS `pos_42`
  , `pos_43` AS `pos_43`
  , `pos_44` AS `pos_44`
  , `pos_45` AS `pos_45`
  , `pos_46` AS `pos_46`
  , `pos_47` AS `pos_47`
  , `pos_48` AS `pos_48`
  , `pos_49` AS `pos_49`
  , `pos_50` AS `pos_50`
  , `pos_51` AS `pos_51`
  , `pos_52` AS `pos_52`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_raw__synched_from_source_at` AS `_raw__synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

