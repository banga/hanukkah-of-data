select
  c.name,
  c.phone,
  strftime('%H', ordered) as hour,
  count(*) as count
from
  orders_items oi
  join products p
  join orders o
  join customers c
where
  oi.orderid = o.orderid
  and c.customerid = o.customerid
  and p.sku = oi.sku
  and p.sku LIKE 'BKY%'
  and oi.orderid in (
    -- first bakery orders per day
    select
      oi.orderid
    from
      orders_items oi
      join orders o
    where
      oi.orderid = o.orderid
      and sku like 'BKY%'
    group by
      strftime('%Y-%m-%d', o.ordered)
    having
      min(o.rowid)
    order by
      1
  )
  and hour <= '05'
group by
  1,
  2,
  3
order by
  4 desc