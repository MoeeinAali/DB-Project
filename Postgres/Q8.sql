SELECT COUNT(*), destination_city, hotel.type
FROM hotel_reservation
         JOIN hotel ON hotel_reservation.hotel_id = hotel.hotel_id
         JOIN (SELECT COUNT(*) AS count, destination_city
               FROM trip_reservation
                        JOIN trip
                             ON trip_reservation.trip_number = trip.trip_id
               WHERE state = 'Confirmed'
               GROUP BY destination_city
               ORDER BY count
               limit 5) AS a ON a.destination_city = hotel.city
WHERE state LIKE 'Cancelled%'
GROUP BY destination_city,hotel.type

