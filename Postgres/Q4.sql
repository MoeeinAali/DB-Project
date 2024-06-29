SELECT phone_call_hotel.phone_call_id
FROM phone_call_hotel
         JOIN hotel_ticket ON hotel_ticket.ticket_id = phone_call_hotel.ticket_id
         JOIN hotel_reservation ON hotel_ticket.hotel_reservation_id = hotel_reservation.reserve_id
         JOIN hotel ON hotel_reservation.hotel_id = hotel.hotel_id
WHERE hotel.name = 'ALMAS'