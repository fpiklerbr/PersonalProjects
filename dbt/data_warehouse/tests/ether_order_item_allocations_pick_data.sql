SELECT 
  *
FROM 
  {{ ref('stg_x3_order_lines_picks') }} x3 
LEFT JOIN 
  {{ ref('stg_ether_order_item_allocations') }} ether
ON 
  x3.x3_order_id = ether.x3_order_id 
  AND x3.x3_order_line = ether.x3_order_line
WHERE
  x3.x3_order_id NOT LIKE 'SOT%'
  AND (x3.pick_id != ether.picking_number OR ether.picking_number IS NULL)
 