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
