select distinct c.name,
    c.phone,
    o.orderid,
    o.ordered
from customers c
    JOIN orders_items oi,
    orders o
WHERE c.customerid = o.customerid
    AND o.orderid = oi.orderid
    AND o.ordered < "2018-01-01 00:00:00"
    AND oi.sku = "HOM2761"
    AND c.name LIKE "J% P%"