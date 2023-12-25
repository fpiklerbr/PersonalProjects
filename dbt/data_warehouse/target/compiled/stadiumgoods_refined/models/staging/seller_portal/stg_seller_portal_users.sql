WITH profiles_by_user AS (

  SELECT
      profiles.user_id
    , string_agg(DISTINCT profiles.full_name, ', ') AS full_name
    , (
        string_agg(DISTINCT initcap(profiles.city), ', ')
        || ', '
        || coalesce(
            string_agg(DISTINCT CASE WHEN shipping_regions.geography_type = 'Domestic' THEN shipping_regions.geography END, ', ')
          , string_agg(DISTINCT shipping_countries.geography, ', ')
          , string_agg(DISTINCT initcap(profiles.country), ', ')
        )
      ) AS city
    , coalesce(
          string_agg(DISTINCT CASE WHEN shipping_regions.geography_type = 'Domestic' THEN shipping_regions.geography END, ', ')
        , string_agg(DISTINCT initcap(profiles.state), ', ')
      ) AS region
    , coalesce(
          string_agg(shipping_countries.geography, ', ')
        , string_agg(DISTINCT initcap(profiles.country), ', ')
      ) AS country
    , coalesce(
          string_agg(DISTINCT shipping_regions.geography_type, ', ')
        , string_agg(DISTINCT shipping_countries.geography_type, ', ')
      ) AS geography_type
    , coalesce(
          string_agg(DISTINCT shipping_regions.geography, ', ')
        , string_agg(DISTINCT shipping_countries.geography, ', ')
      ) AS geography
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__profiles` AS profiles
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_shipping_countries` AS shipping_countries
    ON profiles.country = shipping_countries.shipping_country
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_shipping_regions` AS shipping_regions
    ON profiles.country = shipping_regions.shipping_country
    AND profiles.state = shipping_regions.shipping_region
  GROUP BY 1

)

SELECT
    users.*
  , profiles_by_user.full_name
  , profiles_by_user.city
  , profiles_by_user.region
  , profiles_by_user.country
  , profiles_by_user.geography_type
  , profiles_by_user.geography
  , user_tax_forms.user_tax_form_status
  , user_tax_forms.created_at AS user_tax_form_created_at
  , user_tax_forms.updated_at AS user_tax_form_updated_at
  , safe_cast(datetime(safe_cast(user_tax_forms.created_at AS timestamp), 
  r'America/New_York'
) AS date) AS user_tax_form_request_date
  , CASE
      WHEN user_tax_forms.user_tax_form_status = 'Approved'
      THEN safe_cast(datetime(safe_cast(user_tax_forms.updated_at AS timestamp), 
  r'America/New_York'
) AS date)
    END AS user_tax_form_approval_date
  , count(*) OVER (PARTITION BY users.consignor_id) AS consignor_total_user_count
  , count(users.deleted_at) OVER (PARTITION BY users.consignor_id) AS consignor_deleted_user_count
  , consignment_storage_fee_consignor_settings.is_exempt_from_storage_fee
  , consignment_storage_fee_consignor_settings.has_flat_rate_storage_fee
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__users` AS users
LEFT JOIN profiles_by_user
  ON users.user_id = profiles_by_user.user_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__user_tax_forms` AS user_tax_forms
  ON users.user_id = user_tax_forms.user_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__consignment_storage_fee_consignor_settings` AS consignment_storage_fee_consignor_settings
  ON users.user_id = consignment_storage_fee_consignor_settings.user_id