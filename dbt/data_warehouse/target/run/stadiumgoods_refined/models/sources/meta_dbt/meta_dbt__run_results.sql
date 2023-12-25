
        
    

    

    merge into `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`meta_dbt__run_results` as DBT_INTERNAL_DEST
        using (
           



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`run_results` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`run_results` AS string)), '') AS string) END as string)
 AS `run_results`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) END as timestamp)
 AS `exported_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
FROM `ff-stadiumgoods-raw-live`.`meta_dbt`.`dbt_run_results_json`

WHERE 1=1
AND 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) END as timestamp)
 > (SELECT max(exported_at) FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`meta_dbt__run_results`)
ORDER BY 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_stamp` AS string)), '') AS string) END as timestamp)

LIMIT 1000

                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    
    safe_cast(JSON_EXTRACT_SCALAR(run_results, '$.metadata.generated_at'
  ) as timestamp)
 AS `generated_at`
  , 
    (JSON_EXTRACT_SCALAR(run_results, '$.metadata.invocation_id'
  ))
 AS `dbt_invocation_id`
  , 
    (JSON_EXTRACT_SCALAR(run_results, '$.metadata.dbt_schema_version'
  ))
 AS `dbt_schema_version`
  , 
    (JSON_EXTRACT_SCALAR(run_results, '$.args.which'
  ))
 AS `dbt_command`
  , 
    (JSON_EXTRACT_SCALAR(run_results, '$.args.target'
  ))
 AS `target`
  , 
    (JSON_EXTRACT_SCALAR(run_results, '$.args.vars'
  ))
 AS `vars`
  , 
    (JSON_EXTRACT(run_results, '$.results'
  ))
 AS `results`
  , 
    
    safe_cast(JSON_EXTRACT_SCALAR(run_results, '$.elapsed_time'
  ) as float64)
 AS `elapsed_time`
  , 
    (JSON_EXTRACT(run_results, '$.metadata'
  ))
 AS `metadata`
  , 
    (JSON_EXTRACT(run_results, '$.args'
  ))
 AS `args`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `run_results` AS `run_results`
  , `exported_at` AS `exported_at`
  , `file_name` AS `file_name`
  , `generated_at` AS `generated_at`
  , `dbt_invocation_id` AS `dbt_invocation_id`
  , `dbt_schema_version` AS `dbt_schema_version`
  , `dbt_command` AS `dbt_command`
  , `target` AS `target`
  , `vars` AS `vars`
  , `results` AS `results`
  , `elapsed_time` AS `elapsed_time`
  , `metadata` AS `metadata`
  , `args` AS `args`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final 
         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`run_results`, `exported_at`, `file_name`, `generated_at`, `dbt_invocation_id`, `dbt_schema_version`, `dbt_command`, `target`, `vars`, `results`, `elapsed_time`, `metadata`, `args`)
    values
        (`run_results`, `exported_at`, `file_name`, `generated_at`, `dbt_invocation_id`, `dbt_schema_version`, `dbt_command`, `target`, `vars`, `results`, `elapsed_time`, `metadata`, `args`)


  