# timeseries
I want to learn about timeseries using timescaledb for postgresql
<br />
Timescaledb: https://www.timescale.com/
<br />
<br />
Random data is created using the Python package Faker.
<br />
Save the output to a file:
<br />
`python3 ./gen_data.py > faker_data.csv`
<br />
<br />
-- Do not forget to create timescaledb extension (from Timescalesdb's documentation)
<br />
`create extension timescaledb;`
<br />
<br />
Create the table in psql.
<br />
`create table transaction ( ... );`
<br />
<br />
-- Then we convert it into a hypertable that is partitioned by time (from Timescalesdb's documentation)
<br />
`select create_hypertable('transactions', 'created_at');`
<br />
<br />
