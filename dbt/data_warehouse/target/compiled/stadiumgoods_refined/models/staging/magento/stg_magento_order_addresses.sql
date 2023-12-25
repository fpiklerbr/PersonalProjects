WITH shipping_addresses AS (

  SELECT *
    , substr(
    concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
) AS full_name
    , substr(
    concat(
    
      coalesce(substr(
    concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(street), '')|| chr(10) , '')
    
      , coalesce(substr(
    concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(country_id), '')|| chr(10) , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(substr(
    concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(street), '')|| chr(10) , '')
    
      , coalesce(substr(
    concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(country_id), '')|| chr(10) , '')
    
  )) - length(chr(10))
      , 0
    )
) AS full_address
    , upper(nullif(trim(country_id), '')) AS clean_country, upper(nullif(
  CAST(regexp_replace('telephone', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_telephone, upper(nullif(
  CAST(regexp_replace('postcode', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_postcode, upper(nullif(
  CAST(regexp_replace('lastname', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_lastname, upper(nullif(
  CAST(regexp_replace('firstname', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_firstname, upper(nullif(
  CAST(regexp_replace('email', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_email
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_address`
  WHERE address_type = 'shipping'

), billing_addresses AS (

  SELECT *
    , substr(
    concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
) AS full_name
    , substr(
    concat(
    
      coalesce(substr(
    concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(street), '')|| chr(10) , '')
    
      , coalesce(substr(
    concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(country_id), '')|| chr(10) , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(substr(
    concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(suffix), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(street), '')|| chr(10) , '')
    
      , coalesce(substr(
    concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(city), '')|| ' ' , '')
    
      , coalesce(nullif(trim(region), '')|| ' ' , '')
    
      , coalesce(nullif(trim(postcode), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(nullif(trim(country_id), '')|| chr(10) , '')
    
  )) - length(chr(10))
      , 0
    )
) AS full_address
    , upper(nullif(trim(country_id), '')) AS clean_country, upper(nullif(
  CAST(regexp_replace('telephone', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_telephone, upper(nullif(
  CAST(regexp_replace('postcode', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_postcode, upper(nullif(
  CAST(regexp_replace('lastname', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_lastname, upper(nullif(
  CAST(regexp_replace('firstname', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_firstname, upper(nullif(
  CAST(regexp_replace('email', r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_email
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_address`
  WHERE address_type = 'billing'

)

SELECT
    coalesce(shipping_addresses.sales_flat_order_id, billing_addresses.sales_flat_order_id) AS sales_flat_order_id
  , shipping_addresses.sales_flat_order_address_id AS shipping_address_entity_id
  , shipping_addresses.sales_flat_order_id AS shipping_address_parent_id
  , shipping_addresses.customer_address_id AS shipping_address_customer_address_id
  , shipping_addresses.region_id AS shipping_address_region_id
  , shipping_addresses.customer_id AS shipping_address_customer_id
  , shipping_addresses.fax AS shipping_address_fax
  , shipping_addresses.region AS shipping_address_region
  , shipping_addresses.postcode AS shipping_address_postcode
  , shipping_addresses.lastname AS shipping_address_lastname
  , shipping_addresses.street AS shipping_address_street
  , shipping_addresses.city AS shipping_address_city
  , shipping_addresses.email AS shipping_address_email
  , shipping_addresses.telephone AS shipping_address_telephone
  , shipping_addresses.country_id AS shipping_address_country_id
  , shipping_addresses.firstname AS shipping_address_firstname
  , shipping_addresses.prefix AS shipping_address_prefix
  , shipping_addresses.middlename AS shipping_address_middlename
  , shipping_addresses.suffix AS shipping_address_suffix
  , shipping_addresses.company AS shipping_address_company
  , billing_addresses.customer_id AS billing_customer_id
  , billing_addresses.country_id AS billing_country_id
  , billing_addresses.city_and_region AS billing_city
  , coalesce(billing_addresses.clean_country, shipping_addresses.clean_country) AS clean_country, coalesce(billing_addresses.clean_telephone, shipping_addresses.clean_telephone) AS clean_telephone, coalesce(billing_addresses.clean_postcode, shipping_addresses.clean_postcode) AS clean_postcode, coalesce(billing_addresses.clean_lastname, shipping_addresses.clean_lastname) AS clean_lastname, coalesce(billing_addresses.clean_firstname, shipping_addresses.clean_firstname) AS clean_firstname, coalesce(billing_addresses.clean_email, shipping_addresses.clean_email) AS clean_email, shipping_addresses.full_name AS shipping_name
  , shipping_addresses.full_address AS shipping_address
FROM shipping_addresses
FULL JOIN billing_addresses
  ON shipping_addresses.sales_flat_order_id = billing_addresses.sales_flat_order_id