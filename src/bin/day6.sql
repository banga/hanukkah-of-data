select
  c.name,
  c.phone,
  sum(oi.unit_price * qty - p.wholesale_cost * qty) as discount
from
  orders_items oi
  join orders o
  join customers c
  join products p
where
  o.orderid = oi.orderid
  and o.customerid = c.customerid
  and p.sku = oi.sku
  and unit_price < wholesale_cost
group by
  c.customerid
order by
  discount asc