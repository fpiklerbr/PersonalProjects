

with

unqiue_address as (
	select
	  distinct 
	  bscmoa.line_1 
	, bscmoa.zip_code
	, bscmoa.email
	from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_order_address` bscmoa
	where  bscmoa.address_type = 'billing'

)

select
      sfl.stadium_order_id
    , sfl.order_date
	, sfl.sales_channel
	, sfl.gtv_total
	, sfl.gmv_total
	, sfl.serial_order_match
	, sfl.unique_email
	, sfl.channel_or_gateway
	, bcsm.first_name 
	, bcsm.last_name 
	, ua.line_1 
	, ua.zip_code
	, sp.brand
	, sp.name
	, sp.size
	, sp.nickname
	, sp.colorway 
from `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl 
left join `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_customer` bcsm on  bcsm.email = sfl.unique_email
left join unqiue_address ua on sfl.unique_email = ua.email
left join `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` sp on sp.simple_sku = sfl.simple_sku
where sfl.channel_or_gateway in ('Mercaux (Chicago)', 'Mercaux (Soho)','Mercaux Omni (Chicago)','Mercaux Omni (Soho)')