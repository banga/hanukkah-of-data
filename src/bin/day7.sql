with x as (
  select
    p.sku,
    trim(substr(p.desc, 1, instr(p.desc, '(') - 1)) as desc,
    o.ordered
  from
    products p
    join orders_items oi
    join orders o
    join customers c
  where
    p.sku = oi.sku
    and p.desc like '%(%)%'
    and oi.orderid = o.orderid
    and o.customerid = c.customerid
    and c.customerid = 4167
)
select
  c.name,
  c.phone,
  trim(substr(p.desc, 1, instr(p.desc, '(') - 1)) as other_desc,
  abs(julianday(o.ordered) - julianday(x.ordered)) as delta
from
  customers c
  join orders o
  join orders_items oi
  join products p
  join x
where
  o.customerid = c.customerid
  and c.customerid != 4167
  and oi.orderid = o.orderid
  and p.sku = oi.sku
  and delta < 0.1
  and other_desc = x.desc
order by
  delta asc

-- Answer: 
-- Carlos Myers	838-335-7157	Noah's Poster	0.00021990714594721794
