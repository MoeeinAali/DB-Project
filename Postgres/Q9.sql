SELECT trip_reservation.user_id
FROM trip_reservation
         JOIN hotel_reservation
              ON trip_reservation.user_id = hotel_reservation.user_id
         JOIN (SELECT max(count), hotel_id
               FROM (SELECT count(*) AS count, hotel_id
                     FROM (SELECT room_id, room.hotel_id
                           FROM room
                                    JOIN (SELECT *
                                          FROM hotel
                                                   JOIN trip ON trip_id = 'W1296' and start_date = '1403-01-06') AS destination_hotels
                                         ON room.hotel_id = destination_hotels.hotel_id
                           EXCEPT
                           (SELECT room_id, hotel_reservation.hotel_id
                            FROM (SELECT *
                                  FROM hotel
                                           JOIN trip ON trip_id = 'W1296' and start_date = '1403-01-06') AS destination_hotels
                                     JOIN hotel_reservation
                                          ON destination_hotels.hotel_id = hotel_reservation.hotel_id)) AS a
                     GROUP BY hotel_id) AS b
               GROUP BY hotel_id) AS x1 ON x1.hotel_id = hotel_reservation.hotel_id
         JOIN trip ON trip_number = trip_reservation.trip_number
WHERE trip_reservation.trip_number = 'W1296'
  AND trip.start_date = '1403-01-06'
  AND hotel_reservation.start_date = '1403-01-06';