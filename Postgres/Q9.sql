SELECT max(count),hotel_id FROM (
SELECT count(*) AS count, hotel_id
FROM (SELECT room_id, hotel_id
      FROM room
               JOIN (SELECT *
                     FROM hotel
                              JOIN trip ON trip_id = 'W1296' and start_date = '1403-01-06') AS destination_hotels
                    ON room.hotel_id = destination_hotels.hotel_id
      except
      (SELECT room_id, hotel_id
       FROM (SELECT *
             FROM hotel
                      JOIN trip ON trip_id = 'W1296' and start_date = '1403-01-06') AS destination_hotels
                JOIN hotel_reservation ON destination_hotels.hotel_id = hotel_reservation.hotel_id)) AS a
GROUP BY hotel_id) AS b
GROUP BY hotel_id

SELECT user_id FROM hotel_reservation JOIN trip ON