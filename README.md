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
Copy the csv-file to the table.
<br />
`\copy transactions from '/Users/claus/devel/python/faker_data.csv' csv delimiter ';'`
<br />
<br />
Another example is using crypto currency data freely downloadable from https://www.cryptodatadownload.com/
<br />
The first line in the CSV is information and must be deleted.
<br />
UNIX-time and date is redundant but I just kept it. UNIX-time is sometimes in milliseconds. This can be
<br />
fixed in vim with `%s/\(\d\{10}\)\(000\)/\1/`.
<br />
