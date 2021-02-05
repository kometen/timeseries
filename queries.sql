select
  time_bucket('12 hours', created_at) as twelve_hrs,
  postal_code,
  count(*)
from
  transactions
group by
  twelve_hrs,
  postal_code
order by
  count desc
;
