SELECT COUNT(*) AS CANCELLED_NOT_PAID
FROM (SELECT state
      FROM hotel_reservation
      WHERE state = 'Cancelled not paid'
      UNION ALL
      SELECT state
      from trip_reservation
      WHERE state = 'Cancelled not paid')