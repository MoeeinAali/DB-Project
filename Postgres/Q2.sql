SELECT hotels_with_empty_rooms.hotel_id
FROM (SELECT room_id, hotel_id
      FROM room
      WHERE room.beds_number = 2
      except
      (SELECT room.room_id, room.hotel_id
       FROM hotel_reservation
                JOIN room ON room.room_id = hotel_reservation.room_id
       WHERE room.beds_number = 2))
         AS hotels_with_empty_rooms
         JOIN
     (SELECT hotel.hotel_id
      FROM hotel
               JOIN (SELECT hotel_id, count(*)
                     FROM hotel_amenity
                     WHERE amenity_name = 'Swimming Pool'
                        OR amenity_name = 'Gym'
                     GROUP BY hotel_id
                     HAVING count(*) = 2) AS selected_hotels
                    ON selected_hotels.hotel_id = hotel.hotel_id
      WHERE hotel.score > 4) AS selected_hotels ON selected_hotels.hotel_id = hotels_with_empty_rooms.hotel_id