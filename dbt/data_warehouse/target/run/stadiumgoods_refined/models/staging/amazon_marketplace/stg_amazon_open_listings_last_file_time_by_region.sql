
        
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_open_listings_last_file_time_by_region` as DBT_INTERNAL_DEST
        using (
           

SELECT
    region
  , max(file_time) AS file_time
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__open_listings_data_sp`

WHERE file_time >= (SELECT max(file_time) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_open_listings_last_file_time_by_region`)

GROUP BY 1
         ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.region = DBT_INTERNAL_DEST.region
        

    
    when matched then update set
        `region` = DBT_INTERNAL_SOURCE.`region`,`file_time` = DBT_INTERNAL_SOURCE.`file_time`
    

    when not matched then insert
        (`region`, `file_time`)
    values
        (`region`, `file_time`)


  