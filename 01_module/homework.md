## After installing all the necessary components I have started to do homework tasks.

<<<<<<< HEAD
**Question 1. Understanding docker first run**
=======
### Question 1. Understanding docker first run
>>>>>>> 50ecf7b (week 2 de zoomcamp)
Run docker with the python:3.12.8 image in an interactive mode, use the entrypoint bash.
What's the version of pip in the image?

-- running docker with python 3.12.8 \
docker run -it python:3.12.8 bash \
root@ba52a365c344:/# pip --version \
**pip 24.3.1**

<<<<<<< HEAD
**Question 2. Understanding Docker networking and docker-compose**  \
Given the following docker-compose.yaml, what is the hostname and port that pgadmin should use to connect to the postgres database?  \
**hostname: db  \
port: 5432**  
=======
### Question 2. Understanding Docker networking and docker-compose
Given the following docker-compose.yaml, what is the hostname and port that pgadmin should use to connect to the postgres database?
hostname: db
port: 5432
>>>>>>> 50ecf7b (week 2 de zoomcamp)

Preparing postgres  

For postgres exercises I created docker-compose.yaml file
after running  "docker-compose up --build" connected to pgadmin and added the connection

Postgres related questions:

<<<<<<< HEAD
-- **Question 3. Trip Segmentation Count** \
=======
### Question 3. Trip Segmentation Count
``` SQL
>>>>>>> 50ecf7b (week 2 de zoomcamp)
/* During the period of October 1st 2019 (inclusive) and November 1st 2019 (exclusive), 
	how many trips, respectively, happened:
		Up to 1 mile
		In between 1 (exclusive) and 3 miles (inclusive),
		In between 3 (exclusive) and 7 miles (inclusive),
		In between 7 (exclusive) and 10 miles (inclusive),
		Over 10 miles */
SELECT
	SUM(CASE WHEN trip_distance <= 1 THEN 1 ELSE 0 END) AS less_1_mile,
	SUM(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 ELSE 0 END) AS btw_1_3_miles,
	SUM(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 ELSE 0 END) AS btw_3_7_miles,
	SUM(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 ELSE 0 END) AS btw_7_10_miles,
	SUM(CASE WHEN trip_distance > 10 THEN 1 ELSE 0 END) AS over_10_miles
FROM tripdata
<<<<<<< HEAD
WHERE lpep_dropoff_datetime::DATE BETWEEN '2019-10-01' AND '2019-10-31'; \
**-- output:   104,802; 198,924; 109,603; 27,678; 35,189**

/* **Question 4. Longest trip for each day** \
	Which was the pick up day with the longest trip distance? Use the pick up time for your calculations.
	Tip: For every day, we only care about one single trip with the longest distance. */
=======
WHERE lpep_dropoff_datetime::DATE BETWEEN '2019-10-01' AND '2019-10-31' ;
-- output:   104,802; 198,924; 109,603; 27,678; 35,189
```

### Question 4. Longest trip for each day
###	Which was the pick up day with the longest trip distance? Use the pick up time for your calculations.
###	Tip: For every day, we only care about one single trip with the longest distance.
>>>>>>> 50ecf7b (week 2 de zoomcamp)

``` SQL
SELECT 	lpep_pickup_datetime::DATE ,
		MAX(trip_distance) AS max_distance 
FROM tripdata 
GROUP BY lpep_pickup_datetime::DATE 
ORDER BY max_distance DESC 
<<<<<<< HEAD
LIMIT 1;  \
**-- output 2019-10-31**

/*	**Question 5. Three biggest pickup zones** \
	Which were the top pickup locations with over 13,000 in total_amount (across all trips) for 2019-10-18?
	Consider only lpep_pickup_datetime when filtering by date. */
=======
LIMIT 1; 
-- output 2019-10-31
```

###	Question 5. Three biggest pickup zones
### Which were the top pickup locations with over 13,000 in total_amount (across all trips) for 2019-10-18?
### Consider only lpep_pickup_datetime when filtering by date.

``` SQL
>>>>>>> 50ecf7b (week 2 de zoomcamp)
SELECT 	pu_zone.zone AS pickup_zone,
		SUM(td.total_amount) AS total_amount
FROM tripdata AS td
	INNER JOIN taxizone as pu_zone
		ON pu_zone.location_id = td.pu_location_id 
WHERE lpep_pickup_datetime::DATE = '2019-10-18'
GROUP BY pu_zone.zone
HAVING SUM(td.total_amount) > 13000
ORDER BY total_amount DESC
<<<<<<< HEAD
LIMIT 3; \
**-- output:  "East Harlem North"	18686.68    "East Harlem South"	16797.26    "Morningside Heights" 13029.79**

-- **Question 6. Largest tip** \
/* For the passengers picked up in October 2019 in the zone named "East Harlem North" which was the drop off zone that had the largest tip?
Note: it's tip , not trip.
We need the name of the zone, not the ID. */
=======
LIMIT 3; 
-- output:  "East Harlem North"	18686.68    "East Harlem South"	16797.26    "Morningside Heights" 13029.79
```

### Question 6. Largest tip
### For the passengers picked up in October 2019 in the zone named "East Harlem North" which was the drop off zone that had the largest tip?
### Note: it's tip , not trip. We need the name of the zone, not the ID.
``` SQL
>>>>>>> 50ecf7b (week 2 de zoomcamp)
SELECT 	pickupzone.zone AS pickupzone,
		dropoffzone.zone AS dropoffzone,
		MAX(tip_amount) AS max_tip 
FROM tripdata AS td
	INNER JOIN taxizone as pickupzone
		ON pickupzone.location_id = td.pu_location_id 
	LEFT JOIN taxizone as dropoffzone 
		ON dropoffzone.location_id = td.do_location_id 
WHERE pickupzone.zone = 'East Harlem North'
		AND EXTRACT(MONTH FROM lpep_pickup_datetime) = 10
GROUP BY pickupzone.zone, dropoffzone.zone 
ORDER BY max_tip DESC 
LIMIT 1; 
<<<<<<< HEAD
**-- output JFK Airport 87.3**

**Question 7. Terraform Workflow** \
**terraform init, terraform apply -auto-approve, terraform destroy**
=======
-- output JFK Airport 87.3
```
>>>>>>> 50ecf7b (week 2 de zoomcamp)
