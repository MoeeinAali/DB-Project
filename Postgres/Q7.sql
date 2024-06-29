SELECT CASE
           WHEN vehicle.type IN ('bus train', 'koope train') THEN 'train'
           ELSE vehicle.type
           END as type,
       count(*)

FROM trip_reservation
         JOIN trip ON trip_reservation.trip_number = trip.trip_id
         JOIN vehicle ON trip.vehicle_name = vehicle.vehicle_name
WHERE trip_reservation.state != 'CANCELLED'
  AND '1403-01-01' <= trip.start_date
  AND trip.start_date <= '1403-01-13'
GROUP BY CASE
             WHEN vehicle.type IN ('bus train', 'koope train') THEN 'train'
             ELSE vehicle.type
             END;
