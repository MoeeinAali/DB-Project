SELECT SUM(amount)
FROM discount
         JOIN discount_usage_trip ON discount.code = discount_usage_trip.discount_code
WHERE discount.code = 'norouz'
  and discount.type = 'constant'