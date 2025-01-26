CREATE TABLE IF NOT EXISTS taxizone (
    location_id INT,
    borough TEXT,
    zone TEXT,
    service_zone TEXT
);

CREATE TABLE IF NOT EXISTS tripdata (
    vendor_id INT,
    lpep_pickup_datetime TIMESTAMP,
    lpep_dropoff_datetime TIMESTAMP,
    store_and_fwd_flag CHAR(1),
    ratecode_id INT,
    pu_location_id INT,
    do_location_id INT,
    passenger_count INT,
    trip_distance NUMERIC,
    fare_amount NUMERIC,
    extra NUMERIC,
    mta_tax NUMERIC,
    tip_amount NUMERIC,
    tolls_amount NUMERIC,
    ehail_fee NUMERIC,
    improvement_surcharge NUMERIC,
    total_amount NUMERIC,
    payment_type INT,
    trip_type INT,
    congestion_surcharge NUMERIC
);

COPY taxizone ("location_id", "borough", "zone", "service_zone")
FROM '/docker-entrypoint-initdb.d/taxi_zone_lookup.csv'
DELIMITER ','
CSV HEADER;

COPY tripdata ("vendor_id", "lpep_pickup_datetime", "lpep_dropoff_datetime", "store_and_fwd_flag", "ratecode_id", "pu_location_id", "do_location_id", 
                "passenger_count", "trip_distance", "fare_amount", "extra", "mta_tax", "tip_amount", "tolls_amount", "ehail_fee", "improvement_surcharge", 
                "total_amount", "payment_type", "trip_type", "congestion_surcharge")
FROM '/docker-entrypoint-initdb.d/green_tripdata_2019-10.csv'
DELIMITER ','
CSV HEADER;