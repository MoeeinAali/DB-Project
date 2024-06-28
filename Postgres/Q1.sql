SELECT vehicle_name
FROM trip As t
WHERE start_date = '2024-12-28'
  and origin_city = 'Tehran'
  and destination_city = 'Mashhad'
  and (SELECT count(*) FROM trip JOIN trip_reservation ON trip_reservation.trip_number=trip.trip_id WHERE trip.trip_id=t.trip_id GROUP BY trip_id) < t.capacity-5