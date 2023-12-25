
        
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_listing_last_file_by_stockpoint_id` as DBT_INTERNAL_DEST
        using (
           

  SELECT
    fps_stock_point_id
  , max(file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_listings` AS listings
  
  WHERE listings.file_time > (SELECT max(file_time) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_listing_last_file_by_stockpoint_id`)
  
  GROUP BY 1
         ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.fps_stock_point_id = DBT_INTERNAL_DEST.fps_stock_point_id
        

    
    when matched then update set
        `fps_stock_point_id` = DBT_INTERNAL_SOURCE.`fps_stock_point_id`,`file_time` = DBT_INTERNAL_SOURCE.`file_time`
    

    when not matched then insert
        (`fps_stock_point_id`, `file_time`)
    values
        (`fps_stock_point_id`, `file_time`)


  