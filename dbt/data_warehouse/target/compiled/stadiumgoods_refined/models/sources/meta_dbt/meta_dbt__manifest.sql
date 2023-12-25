



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manifest` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manifest` AS string)), '') AS string) END as string)
 AS `manifest`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) END as timestamp)
 AS `exported_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
FROM `ff-stadiumgoods-raw-live`.`meta_dbt`.`dbt_manifest_json`

WHERE 1=1
ORDER BY 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) END as timestamp)

LIMIT 1000

                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    
    safe_cast(JSON_EXTRACT_SCALAR(manifest, '$.metadata.generated_at'
  ) as timestamp)
 AS `generated_at`
  , 
    (JSON_EXTRACT_SCALAR(manifest, '$.metadata.invocation_id'
  ))
 AS `dbt_invocation_id`
  , 
    (JSON_EXTRACT_SCALAR(manifest, '$.metadata.dbt_schema_version'
  ))
 AS `dbt_schema_version`
  , 
    (JSON_EXTRACT(manifest, '$.metadata'
  ))
 AS `metadata`
  , 
    (JSON_EXTRACT(manifest, '$.nodes'
  ))
 AS `nodes`
  , 
    (JSON_EXTRACT(manifest, '$.sources'
  ))
 AS `sources`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `manifest` AS `manifest`
  , `exported_at` AS `exported_at`
  , `file_name` AS `file_name`
  , `generated_at` AS `generated_at`
  , `dbt_invocation_id` AS `dbt_invocation_id`
  , `dbt_schema_version` AS `dbt_schema_version`
  , `metadata` AS `metadata`
  , `nodes` AS `nodes`
  , `sources` AS `sources`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final 