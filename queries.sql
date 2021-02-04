select
  time_bucket('12 hours', created_at) as twelve_hrs,
  country,
  count(*),
  max(price) as max_price
from
  transactions
group by
  twelve_hrs,
  country
order by
  count desc
;
