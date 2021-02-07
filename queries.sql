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

-- Get opening, closing, low, high, sum per day.
select
  time_bucket('24 hours', created_at) as twentyfour_hrs,
  symbol,
  first(open, created_at) as open,
  max(high) as high,
  min(low) as low,
  last(close, created_at) as closing,
  sum(volume)
from
  crypto_currency
where
  created_at > '2020-01-01' and created_at < '2021-01-01'
group by
  twentyfour_hrs,
  symbol
order by
  symbol desc,
  twentyfour_hrs desc
;
