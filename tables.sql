create table transactions (
    created_at timestamp,
    browser text,
    postal_code integer,
    cardprovider text,
    cryptocurrency text,
    latitude numeric(10,7),
    longitude numeric(10,7),
    place_name text,
    country_code text,
    time_zone text,
    uuid uuid
);

create table crypto_currency (
    unix_timestamp integer not null,
    created_at timestamp not null,
    symbol text not null,
    open numeric(10,3) not null,
    high numeric(10,3) not null,
    low numeric(10,3) not null,
    close numeric(10,3) not null,
    volume numeric(20,10) not null
);
