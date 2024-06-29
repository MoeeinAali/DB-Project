SELECT t.vehicle_name
FROM trip As t
         JOIN vehicle ON t.vehicle_name = vehicle.vehicle_name
WHERE start_date = '2024-12-28'
  and vehicle.type = 'airplane'
  and origin_city = 'Tehran'
  and destination_city = 'Mashhad'
  and t.capacity - COALESCE((SELECT COUNT(*)
                             FROM trip
                                      JOIN trip_reservation ON trip_reservation.trip_number = trip.trip_id
                             WHERE trip.trip_id = t.trip_id
                               and trip_reservation.state != 'Cancelled'
                             GROUP BY trip_id), 0) > 5;

