select *,
    strftime('%Y', birthdate) as year,
    strftime('%m-%d', birthdate) as month_day
from customers
where -- years of the rabbit that include the month of Cancer
    year IN (
        '1903',
        '1915',
        '1927',
        '1939',
        '1951',
        '1963',
        '1975',
        '1987',
        '1999',
        '2011'
    )
    AND month_day >= '06-22'
    AND month_day <= '07-22'
    AND citystatezip LIKE '% 11435'
order by rowid
limit 101