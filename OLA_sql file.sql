CREATE DATABASE UBER_DB;

USE OLA_DB;

# 1. Retrive all successfull booking:
CREATE VIEW Successful_Booking AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Booking_Status = 'Success';

select * from Successful_Booking;

#2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_fro_each_vehicle AS
    SELECT 
        Vehicle_Type, AVG(Ride_Distance) AS avg_distance
    FROM
        bookings
    GROUP BY Vehicle_Type
    LIMIT 0 , 1000;

SELECT * FROM ride_distance_fro_each_vehicle;


# 3. Get the total bumber of canveled rides by customers:
CREATE VIEW canceled_rides_by_customers AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        Booking_status = 'Canceled by Customer';

select * from canceled_rides_by_customers;

# 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
    SELECT 
        Customer_ID, COUNT(Booking_ID) AS total_rides
    FROM
        bookings
    GROUP BY Customer_ID
    ORDER BY total_rides DESC
    LIMIT 5; 

SELECT * FROM Top_5_Customers;

# 5. Get the number of rides canceled by drivers due to personaland car-related issuess: issues
CREATE VIEW Rides_Canceld_by_Drivers_P_C_Issues AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_Canceld_by_Drivers_P_C_Issues;

# 6. Find the maximum and minimum driver ratings for prime seden booking:
CREATE VIEW Maximum_and_Minimum_Driver_Ratings AS
    SELECT 
        MAX(Driver_Ratings) AS max_rating,
        MIN(Driver_Ratings) AS min_rating
    FROM
        bookings
    WHERE
        Vehicle_Type = 'Prime Sedan';

SELECT * FROM Maximum_and_Minimum_Driver_Ratings;

# 7. Retrive all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Payment_Method = 'UPI';


SELECT * FROM UPI_Payment;

# 8. Find the average Customer rating per vehicle type:
CREATE VIEW AVG_Cust_Rating AS
    SELECT 
        Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
    FROM
        bookings
    GROUP BY Vehicle_Type;

SELECT * FROM AVG_Cust_Rating ;

# 9. calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value AS
    SELECT 
        SUM(Booking_Value) AS total_successful_ride_value
    FROM
        bookings
    WHERE
        Booking_Status = 'Success';

SELECT * FROM total_successful_ride_value ;



# 10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        bookings
    WHERE
        Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_Rides_Reason;















