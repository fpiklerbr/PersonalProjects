

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dss_sellers`
  
  
  OPTIONS()
  as (
    SELECT
      dss.third_party_id
    , dss.third_party_role AS `role`
    , dss.third_party_name AS `name`
    , dss.contact_email
    , substr(
    concat(
    
      coalesce(CAST('DSS' AS string )|| '-' , '')
    
      , coalesce(dss.supplier_acronym|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(CAST('DSS' AS string )|| '-' , '')
    
      , coalesce(dss.supplier_acronym|| '-' , '')
    
  )) - length('-')
      , 0
    )
) AS serial_source
    , dss.supplier_acronym
    , coalesce(dss_seed.parent_company, dss.third_party_name) as parent_company
    , dss.portal_id
    , dss.commission_rate
    , dss.metadata
    , dss.is_enabled AS enabled
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__third_parties` as dss
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_dss_parent_company` as dss_seed 
    ON dss_seed.supplier_acronym = dss.supplier_acronym
  );
    