



WITH parsed_references AS (

  SELECT
      *
    , total_cost AS ship_cost
    , CASE
        WHEN 


  regexp_contains(ref_1, r'(?i)/')


        THEN nullif(trim( 

    split(
        ref_1,
        '/'
        )[safe_offset(0)]

 ), '')
      END AS fedex_account_id
    , CASE
        WHEN 


  regexp_contains(ref_1, r'(?i)/')


        THEN nullif(trim(substr(ref_1, length( 

    split(
        ref_1,
        '/'
        )[safe_offset(0)]

 ) + 2, length(ref_1))), '')
        ELSE nullif(trim(ref_1), '')
      END AS reference
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fedex__p2p_rates`
  WHERE tracking_number IS NOT NULL

), extra_charges AS (

  SELECT
      parsed_references.*
    , fedex_accounts.shipping_account
    , CASE
        WHEN 


  regexp_contains(parsed_references.reference, r'(?i)^WD')


          THEN 'Withdrawal'
        WHEN 


  regexp_contains(parsed_references.reference, r'(?i)^RJ')


          THEN 'Rejection'
        WHEN 


  regexp_contains(parsed_references.reference, r'(?i)^(Ticket|TKT)')


          THEN 'Seller Portal Ticket'
        WHEN (
          


  regexp_contains(parsed_references.reference, r'(?i)^RTS')


          OR parsed_references.reference = parsed_references.ref_2
        )
          THEN 'Return to Sender'
        WHEN 


  regexp_contains(parsed_references.reference, r'(?i)^(SHP|PIC|SON|[0-9]{9})')


          THEN 'Order Fulfillment'
        ELSE
          'Unknown'
      END AS operations_category

    , coalesce(

          cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Declared [Vv]alue greater'
) AS string)
 AS float64 )
      , 0
    ) AS ship_cost_declared_value

    , coalesce(

          cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Saturday Pickup'
) AS string)
 AS float64 )
      , 0
    ) AS ship_cost_saturday_pickup

    , coalesce(

          cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) F[A-Za-z] DAS'
) AS string)
 AS float64 )
        , cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Home Del.*DAS'
) AS string)
 AS float64 )
      , 0
    ) AS ship_cost_das

    , coalesce(

          cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Address Correction'
) AS string)
 AS float64 )
      , 0
    ) AS ship_cost_address_correction

    , coalesce(

          cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Additional Handling'
) AS string)
 AS float64 )
      , 0
    ) AS ship_cost_additional_handling

    , coalesce(

          cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Oversize Charge'
) AS string)
 AS float64 )
      , 0
    ) AS ship_cost_oversize_charge

    , coalesce(

          cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Direct Signature Required'
) AS string)
 AS float64 )
        , cast( 
  CAST(regexp_extract(parsed_references.extra_charges_breakdown, 
  r'(\d+\.\d+|\d+) Adult Signature Required'
) AS string)
 AS float64 )
      , 0
    ) AS ship_cost_signature_required

  FROM parsed_references
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_fedex_accounts` AS fedex_accounts
    ON parsed_references.fedex_account_id = fedex_accounts.fedex_account_id

), final AS (

  SELECT
      *
    , cast(round(cast((
          extra_charges.extra_charges

        - ship_cost_declared_value

        - ship_cost_saturday_pickup

        - ship_cost_das

        - ship_cost_address_correction

        - ship_cost_additional_handling

        - ship_cost_oversize_charge

        - ship_cost_signature_required

      ) AS numeric ), 2) AS float64 ) AS ship_cost_other_charges
    , file_name AS invoice_id
    , cast('P2P Invoice' AS string ) AS invoice_type
  FROM extra_charges

)

SELECT * FROM final