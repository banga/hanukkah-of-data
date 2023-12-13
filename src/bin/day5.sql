select
  c.*,
  count(*) as count
from
  customers c
  join orders_items oi
  join orders o
  join products p
where
  p.desc like '%cat%'
  and p.sku = oi.sku
  and oi.orderid = o.orderid
  and c.customerid = o.customerid
  and c.citystatezip like '%staten%'
 group by 1
 order by count desc