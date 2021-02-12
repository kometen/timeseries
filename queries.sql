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


with data as (
select
  extract(year from created_at) as year,
  extract(month from time_bucket('1 day', created_at)) as month,
  crypto_currency,
  first(open, created_at) as open,
  max(high) as high,
  min(low) as low,
  last(close, created_at) as closing,
  sum(volume) as volume
from
  transactions
where
  created_at > '2018-01-01' and created_at < '2019-01-01'
group by
  year,
  month,
  crypto_currency
order by
  crypto_currency,
  month
)

select
  *,
  sum(volume) over (partition by crypto_currency order by crypto_currency, month rows between unbounded preceding and current row) as ytd
from data;


-- Get opening, closing, low, high, sum per day.
select
  time_bucket('1 day', created_at) as one_day,
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
  one_day,
  symbol
order by
  symbol,
  one_day
;

-- Sum ytd (year to date) by symbol

select
  time_bucket('10 minutes', created_at) as ten_minutes,
  symbol,
  first(open, created_at) as open,
  max(high) as high,
  min(low) as low,
  last(close, created_at) as closing,
  sum(volume)
from
  crypto_currency
where
  created_at > '2019-11-01' and created_at < '2019-12-01'
group by
  ten_minutes,
  symbol
order by
  symbol desc,
  ten_minutes desc
;

with data as (
select
  '2018' as year,
  extract(month from time_bucket('1 day', created_at)) as month,
  symbol,
  first(open, created_at) as open,
  max(high) as high,
  min(low) as low,
  last(close, created_at) as closing,
  sum(volume) as volume
from
  crypto_currency
where
  created_at > '2018-01-01' and created_at < '2019-01-01'
group by
  month,
  symbol
order by
  symbol,
  month
)

select
  *,
  sum(volume) over (partition by symbol order by symbol, month rows between unbounded preceding and current row) as ytd
from data;
