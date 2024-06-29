SELECT coalesce(SUM(discount_amount),0) AS total_amount FROM
(SELECT amount AS discount_amount
FROM discount
         JOIN discount_usage_trip ON discount.code = discount_usage_trip.discount_code
WHERE discount.code = 'norouz'
  and discount.type = 'Numeric'
UNION ALL
SELECT amount AS discount_amount
FROM discount
         JOIN discount_usage_hotel ON discount.code = discount_usage_hotel.discount_code
WHERE discount.code = 'norouz'
  and discount.type = 'Numeric'
UNION ALL
SELECT amount * price AS discount_amount
FROM discount
         JOIN discount_usage_trip ON discount.code = discount_usage_trip.discount_code
         JOIN trip_reservation ON trip_reservation.reserve_id = discount_usage_trip.reservation_id
         JOIN trip ON trip_reservation.trip_number = trip.trip_id
WHERE discount.code = 'norouz'
  and discount.type = 'Percentage'
UNION ALL
SELECT amount * price AS discount_amount
FROM discount
         JOIN discount_usage_hotel ON discount.code = discount_usage_hotel.discount_code
         JOIN trip_reservation ON trip_reservation.reserve_id = discount_usage_hotel.reservation_id
         JOIN trip ON trip_reservation.trip_number = trip.trip_id
WHERE discount.code = 'norouz'
  and discount.type = 'Percentage') AS total_amount