WITH customer_stylist_history AS (

  SELECT
      private_client_customer_id
    , customer_type
    , stylist_name
    , stylist_type
    , SAFE_CAST(TIMESTAMP(SAFE_CAST(activation_date AS datetime), 
  r'America/New_York'
) AS timestamp) AS valid_from
    , 
  

timestamp_add(cast( 
  

timestamp_add(cast( SAFE_CAST(TIMESTAMP(SAFE_CAST(deactivation_date AS datetime), 
  r'America/New_York'
) AS timestamp) as timestamp),
        interval 1 day)


 as timestamp),
        interval -1 second)


 AS deactivated_at
    , SPLIT(substr(
    concat(
    
      coalesce(email|| ',' , '')
    
      , coalesce(email_2|| ',' , '')
    
      , coalesce(email_3|| ',' , '')
    
      , coalesce(email_4|| ',' , '')
    
      , coalesce(email_5|| ',' , '')
    
      , coalesce(email_6|| ',' , '')
    
      , coalesce(email_7|| ',' , '')
    
      , coalesce(email_8|| ',' , '')
    
      , coalesce(email_9|| ',' , '')
    
      , coalesce(email_10|| ',' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(email|| ',' , '')
    
      , coalesce(email_2|| ',' , '')
    
      , coalesce(email_3|| ',' , '')
    
      , coalesce(email_4|| ',' , '')
    
      , coalesce(email_5|| ',' , '')
    
      , coalesce(email_6|| ',' , '')
    
      , coalesce(email_7|| ',' , '')
    
      , coalesce(email_8|| ',' , '')
    
      , coalesce(email_9|| ',' , '')
    
      , coalesce(email_10|| ',' , '')
    
  )) - length(',')
      , 0
    )
),
  ','
) AS customer_emails
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`private_client__customers`

), customers AS (

  SELECT
      private_client_customer_id
    , string_agg(DISTINCT customer_type, ', ') AS customer_type
  FROM customer_stylist_history
  GROUP BY 1

), customer_stylist_email_history AS (

  SELECT
      private_client_customer_id
    , stylist_name
    , stylist_type
    , email_address
    , valid_from
    , deactivated_at
  FROM customer_stylist_history
  , unnest(customer_emails) AS email_address

), email_stylist_history AS (

  SELECT
      customer_stylist_email_history.email_address
    , customer_stylist_email_history.stylist_name
    , customer_stylist_email_history.stylist_type
    , customer_stylist_email_history.valid_from
    , customer_stylist_email_history.deactivated_at
    , string_agg(DISTINCT customer_stylist_email_history.private_client_customer_id, '; ') AS private_client_customer_id
    , string_agg(DISTINCT customers.customer_type, '; ') AS customer_type
  FROM customer_stylist_email_history
  INNER JOIN customers
    ON customer_stylist_email_history.private_client_customer_id = customers.private_client_customer_id
  GROUP BY 1, 2, 3, 4, 5

), final AS (

  SELECT
      email_address
    , stylist_name
    , stylist_type
    , valid_from
    , coalesce(
          nullif(
     least(
      coalesce(deactivated_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(
  

timestamp_add(cast( lead(valid_from) OVER (PARTITION BY email_address ORDER BY valid_from) as timestamp),
        interval -1 second)


, CAST('9999-12-31 23:59:59' AS timestamp))
      
      )
     , CAST('9999-12-31 23:59:59' AS timestamp)
  )
        , cast('2038-01-19 03:14:08' AS timestamp)
      ) AS valid_to
    , private_client_customer_id
    , customer_type
  FROM email_stylist_history

)

SELECT * FROM final