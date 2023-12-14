select
  c.name,
  c.phone,
  count(1) as total
from
  orders_items oi
  join orders o
  join customers c
  join products p
where
  o.orderid = oi.orderid
  and o.customerid = c.customerid
  and p.sku = oi.sku
  and p.desc like '%noah%'
group by
  c.customerid
order by
  total desc