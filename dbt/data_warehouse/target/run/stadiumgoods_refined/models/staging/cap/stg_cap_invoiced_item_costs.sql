

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_item_costs`
  OPTIONS()
  as SELECT
      cap_order_id
    , label_number AS inventory_unit_label_number
    , invoice_date
    , file_name AS invoice_id
    , cap_client_center
    , cast('Items' AS string ) AS operations_category
 -- TODO: map unit charges to item types
    , substr(
    concat(
    
      coalesce('Pick & Pack'|| ' @ ' , '')
    
      , coalesce(coalesce(pick_charge, unit_charge)|| ' @ ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce('Pick & Pack'|| ' @ ' , '')
    
      , coalesce(coalesce(pick_charge, unit_charge)|| ' @ ' , '')
    
  )) - length(' @ ')
      , 0
    )
) AS operations_subcategory
    , warehouse_cost
    , warehouse_quantity
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_items` AS cap_invoice_items
  WHERE label_number IS NOT NULL
    AND warehouse_cost IS NOT NULL;

