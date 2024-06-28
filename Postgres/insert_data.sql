-- user_account
INSERT INTO user_account (type, name, password, age, phone_number, email)
VALUES ('HotelAdmin', 'Alice Smith', 'password123', 30, '123-456-7890', 'alice.smith@example.com'),
       ('customer', 'Bob Johnson', 'securepassword', 25, '987-654-3210', 'bob.johnson@example.com'),
       ('customer', 'Carol White', 'mypassword', 28, '555-123-4567', 'carol.white@example.com'),
       ('trAdmin', 'David Brown', 'passw0rd', 35, '555-987-6543', 'david.brown@example.com'),
       ('customer', 'Eve Davis', 'password!', 22, '555-555-5555', 'eve.davis@example.com'),
       ('customer', 'Frank Harris', 'qwerty123', 29, '555-678-9012', 'frank.harris@example.com'),
       ('customer', 'Grace Lee', 'letmein', 33, '555-345-6789', 'grace.lee@example.com'),
       ('supporting', 'Henry Kim', '12345password', 40, '555-765-4321', 'henry.kim@example.com'),
       ('customer', 'Ivy Clark', 'admin1234', 26, '555-234-5678', 'ivy.clark@example.com'),
       ('customer', 'Jack Wilson', 'changeme', 31, '555-876-5432', 'jack.wilson@example.com'),
       ('marketing', 'Moeein Aali', '1162', 22, '555-876-3726', 'moeein@example.com');


-- customer_club
INSERT INTO customer_club (customer_id, scale)
VALUES (2, 1),
       (3, 2),
       (5, 2),
       (6, 3),
       (7, 4),
       (9, 5),
       (10, 4);


-- SMS
INSERT INTO SMS (sender_id, receiver_id, date, type, content, time)
VALUES (1, 2, '2024-01-01', 'text', 'Happy New Year!', '10:00:00'),
       (3, 4, '2024-02-14', 'text', 'Happy Valentine Day!', '09:30:00'),
       (5, 6, '2024-03-08', 'text', 'Happy International Women Day!', '08:45:00'),
       (7, 8, '2024-04-01', 'text', 'April Fools Day!', '12:00:00'),
       (9, 10, '2024-05-01', 'text', 'Happy May Day!', '11:15:00'),
       (2, 3, '2024-06-01', 'text', 'Happy Children Day!', '13:20:00'),
       (4, 5, '2024-07-04', 'text', 'Happy Independence Day!', '14:30:00'),
       (6, 7, '2024-08-15', 'text', 'Happy Independence Day!', '10:50:00'),
       (8, 9, '2024-09-05', 'text', 'Happy Teachers Day!', '09:10:00'),
       (10, 1, '2024-10-31', 'text', 'Happy Halloween!', '18:00:00');


-- phone_call_trip
INSERT INTO phone_call_trip (caller_id, callee_id, duration, date, time)
VALUES (8, 2, '00:05:30', '2024-06-01', '08:30:00'),
       (8, 3, '00:12:00', '2024-06-02', '09:15:00'),
       (8, 5, '00:07:45', '2024-06-03', '10:45:00'),
       (8, 6, '00:03:30', '2024-06-04', '11:00:00'),
       (8, 7, '00:15:00', '2024-06-05', '12:30:00'),
       (8, 7, '00:10:00', '2024-06-06', '13:45:00'),
       (8, 7, '00:04:15', '2024-06-07', '14:20:00'),
       (8, 2, '00:08:30', '2024-06-08', '15:10:00'),
       (8, 3, '00:06:00', '2024-06-09', '16:30:00'),
       (8, 5, '00:09:00', '2024-06-10', '17:45:00');

-- phone_call_hotel
INSERT INTO phone_call_hotel (caller_id, callee_id, duration, date, time)
VALUES (1, 2, '00:05:23', '2024-06-20', '14:23:45'),
       (1, 3, '00:02:45', '2024-06-21', '09:15:32'),
       (1, 3, '00:07:12', '2024-06-22', '11:47:56'),
       (1, 9, '00:03:34', '2024-06-23', '13:05:12'),
       (1, 10, '00:04:18', '2024-06-24', '15:22:19');

-- wallet
INSERT INTO wallet (user_id, credit)
VALUES (1, 100.50),
       (2, 200.00),
       (3, 150.75),
       (4, 300.00),
       (5, 250.25),
       (6, 175.00),
       (7, 125.50),
       (8, 400.00),
       (9, 350.75),
       (10, 500.00);


-- discount
INSERT INTO discount (code, user_id, city, expiration_date, max_number_of_usages, service_type, amount, type, min_cost,
                      number_of_usage)
VALUES ('DISC001', 1, 'Tehran', '2024-12-31', 10, 'Hotel', 50000, 'Numeric', 200000, 0),
       ('DISC002', 4, 'Mashhad', '2024-11-30', 5, 'Train', 15, 'Percentage', 150000, 1),
       ('DISC003', 4, 'Isfahan', '2024-10-31', 8, 'Plane', 100000, 'Numeric', 300000, 2),
       ('DISC004', 1, 'Shiraz', '2024-09-30', 12, 'Bus', 20, 'Percentage', 100000, 3),
       ('DISC005', 8, 'Tabriz', '2024-08-31', 7, 'Hotel', 75000, 'Numeric', 250000, 1),
       ('DISC006', 8, 'Qom', '2024-07-31', 6, 'Train', 10, 'Percentage', 120000, 2),
       ('DISC007', 8, 'Kerman', '2024-06-30', 9, 'Plane', 50000, 'Numeric', 180000, 3),
       ('DISC008', 8, 'Rasht', '2024-05-31', 11, 'Bus', 25, 'Percentage', 90000, 0),
       ('DISC009', 11, 'Yazd', '2024-04-30', 4, 'Hotel', 60000, 'Numeric', 220000, 1),
       ('DISC010', 11, 'Kermanshah', '2024-03-31', 3, 'Train', 5, 'Percentage', 100000, 2);

-- bank_account
INSERT INTO bank_account(account_number, bank_name, CVV2)
VALUES (890, 'Bank of America', 123),
       (801, 'Chase Bank', 234),
       (812, 'Wells Fargo', 345),
       (823, 'Citi Bank', 456),
       (834, 'HSBC', 567),
       (845, 'Goldman Sachs', 678),
       (856, 'Morgan Stanley', 789),
       (867, 'PNC Bank', 890),
       (878, 'Capital One', 901),
       (876, 'U.S. Bank', 112),
       (877, 'U.S. Bank', 113);


-- bank_user
INSERT INTO bank_user (account_number, user_id, is_main)
VALUES (890, 1, true),
       (801, 2, true),
       (812, 3, true),
       (823, 4, true),
       (834, 5, true),
       (845, 6, true),
       (856, 7, true),
       (867, 8, true),
       (878, 9, true),
       (876, 10, true),
       (877, 10, false);


-- hotel
INSERT INTO hotel (type, name, address, cancel_rule, score, phone_number)
VALUES (1, 'Grand Hotel', '123 Main St, Cityville', 'Free cancellation within 24 hours', 4.5, '123-456-7890'),
       (2, 'Ocean View Resort', '456 Beach Rd, Ocean City', 'No cancellation', 4.8, '987-654-3210'),
       (3, 'Mountain Lodge', '789 Hill St, Mountain Town', 'Free cancellation up to 48 hours before check-in', 4.2,
        '555-123-4567'),
       (4, 'City Center Hotel', '101 Center St, Metropolis', 'No cancellation', 3.9, '555-987-6543'),
       (5, 'Luxury Suites', '202 Luxury Blvd, Uptown', 'Free cancellation within 24 hours', 4.7, '555-555-5555'),
       (3, 'Budget Inn', '303 Economy St, Suburbia', 'Free cancellation within 72 hours', 3.5, '555-678-9012'),
       (2, 'Airport Hotel', '404 Flight Rd, Airport City', 'No cancellation', 3.8, '555-345-6789'),
       (5, 'Countryside B&B', '505 Country Ln, Countryside', 'Free cancellation within 48 hours', 4.6, '555-765-4321'),
       (5, 'Historic Hotel', '606 History Rd, Oldtown', 'Free cancellation within 24 hours', 4.3, '555-234-5678'),
       (1, 'Modern Hotel', '707 Future St, Newtown', 'No cancellation', 4.1, '555-876-5432');

-- hotel_admin
INSERT INTO hotel_admin (hotel_id, admin_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 1),
       (7, 1),
       (8, 1),
       (9, 1),
       (10, 1);

-- hotel_amenity
INSERT INTO hotel_amenity (hotel_id, amenity_name)
VALUES (1, 'Free Wi-Fi'),
       (1, 'Swimming Pool'),
       (1, 'Gym'),
       (2, 'Free Wi-Fi'),
       (2, 'Restaurant'),
       (3, 'Free Wi-Fi'),
       (3, 'Parking'),
       (4, 'Free Wi-Fi'),
       (4, 'Swimming Pool'),
       (4, 'Gym'),
       (5, 'Free Wi-Fi'),
       (5, 'Parking'),
       (6, 'Free Wi-Fi'),
       (6, 'Restaurant'),
       (7, 'Free Wi-Fi'),
       (7, 'Swimming Pool'),
       (8, 'Free Wi-Fi'),
       (8, 'Gym'),
       (9, 'Free Wi-Fi'),
       (9, 'Parking'),
       (10, 'Free Wi-Fi'),
       (10, 'Restaurant'),
       (10, 'Swimming Pool');


-- room
INSERT INTO room (hotel_id, state, capacity, size, beds_number, price)
VALUES (1, FALSE, 2, 30, 1, 100.00),
       (1, TRUE, 4, 45, 2, 150.00),
       (2, FALSE, 2, 28, 1, 90.00),
       (2, TRUE, 3, 35, 2, 120.00),
       (3, FALSE, 1, 20, 1, 80.00),
       (3, TRUE, 2, 25, 1, 110.00),
       (4, FALSE, 4, 50, 2, 200.00),
       (4, TRUE, 2, 30, 1, 140.00),
       (5, FALSE, 3, 40, 2, 160.00),
       (5, TRUE, 1, 20, 1, 75.00),
       (6, FALSE, 2, 28, 1, 95.00),
       (6, TRUE, 3, 35, 2, 130.00),
       (7, FALSE, 1, 18, 1, 85.00),
       (7, TRUE, 2, 25, 1, 105.00),
       (8, FALSE, 4, 45, 2, 170.00),
       (8, TRUE, 2, 30, 1, 115.00),
       (9, FALSE, 3, 38, 2, 155.00),
       (9, TRUE, 1, 22, 1, 70.00),
       (10, FALSE, 2, 32, 1, 110.00),
       (10, TRUE, 4, 48, 2, 180.00);


-- room_amenity
INSERT INTO room_amenity (room_id, amenity_name)
VALUES (1, 'WiFi'),
       (1, 'TV'),
       (1, 'Air Conditioning'),
       (2, 'WiFi'),
       (2, 'Mini Bar'),
       (3, 'WiFi'),
       (3, 'Desk Lamp'),
       (3, 'Coffee Maker'),
       (4, 'TV'),
       (4, 'Mini Bar'),
       (5, 'WiFi'),
       (5, 'Air Conditioning'),
       (6, 'Mini Bar'),
       (6, 'Desk Lamp'),
       (7, 'TV'),
       (7, 'Air Conditioning'),
       (7, 'Coffee Maker'),
       (8, 'WiFi'),
       (8, 'Mini Bar'),
       (9, 'Air Conditioning'),
       (9, 'Desk Lamp'),
       (10, 'TV'),
       (10, 'Coffee Maker'),
       (11, 'WiFi'),
       (11, 'Air Conditioning'),
       (11, 'Desk Lamp'),
       (12, 'TV'),
       (12, 'Mini Bar'),
       (12, 'Coffee Maker'),
       (13, 'WiFi'),
       (13, 'Mini Bar'),
       (13, 'Air Conditioning'),
       (14, 'TV'),
       (14, 'Desk Lamp'),
       (14, 'Coffee Maker'),
       (15, 'WiFi'),
       (15, 'Mini Bar'),
       (16, 'TV'),
       (16, 'Air Conditioning'),
       (17, 'Desk Lamp'),
       (17, 'Coffee Maker'),
       (18, 'WiFi'),
       (18, 'Mini Bar'),
       (18, 'Air Conditioning'),
       (19, 'TV'),
       (19, 'Desk Lamp'),
       (20, 'WiFi'),
       (20, 'Mini Bar');


-- room_equipment
INSERT INTO room_equipment (room_id, equipment_name)
VALUES (1, 'Desk'),
       (1, 'Chair'),
       (1, 'Lamp'),
       (2, 'Desk'),
       (2, 'Chair'),
       (2, 'Lamp'),
       (3, 'Desk'),
       (3, 'Chair'),
       (4, 'Desk'),
       (4, 'Chair'),
       (4, 'Lamp'),
       (5, 'Desk'),
       (5, 'Chair'),
       (5, 'Lamp'),
       (6, 'Desk'),
       (6, 'Chair'),
       (6, 'Lamp'),
       (7, 'Desk'),
       (7, 'Chair'),
       (7, 'Lamp'),
       (8, 'Desk'),
       (8, 'Chair'),
       (8, 'Lamp'),
       (9, 'Desk'),
       (9, 'Chair'),
       (9, 'Lamp'),
       (10, 'Desk'),
       (10, 'Chair'),
       (10, 'Lamp');


-- company
INSERT INTO company (name, score, origin_country)
VALUES ('ABC Inc.', 4.5, 'USA'),
       ('XYZ Ltd.', 3.8, 'UK'),
       ('123 Enterprises', 2.5, 'Canada'),
       ('Tech Solutions Co.', 4.0, 'USA'),
       ('Global Innovations', 3.2, 'Germany');

-- tr_admin
INSERT INTO tr_admin (company_id, admin_id)
VALUES (1, 4);

-- comment
INSERT INTO comment (hotel_id, writer_id, date, content)
VALUES (1, 2, '2024-06-15', 'Great experience at this hotel. Highly recommend!'),
       (2, 3, '2024-06-16', 'Nice place to stay with friendly staff.'),
       (3, 5, '2024-06-17', 'Clean rooms and good location.'),
       (1, 6, '2024-06-18', 'Could improve on breakfast options.'),
       (2, 6, '2024-06-19', 'Comfortable beds but noisy environment.');

-- terminal
INSERT INTO terminal (name, location, type)
VALUES ('Terminal 1', 'location 1', 'air'),
       ('Terminal 2', 'location 2', 'air'),
       ('Terminal 3', 'location 3', 'koope train'),
       ('Terminal 4', 'location 4', 'bus train'),
       ('Terminal 5', 'location 5', 'bus');

-- vehicle
INSERT INTO vehicle (vehicle_name, type, max_capacity)
VALUES ('Bus1', 'bus', 50),
       ('Bus2', 'bus', 45),
       ('koopetrain1', 'koope train', 300),
       ('koopetrain2', 'koope train', 350),
       ('bustrain1', 'bus train', 400),
       ('airplane1', 'airplane', 100),
       ('airplane2', 'airplane', 120);


-- trip
INSERT INTO trip (trip_id, origin_terminal_id, destination_terminal_id, vehicle_name, origin_city, price, capacity,
                  destination_city, end_date, start_date, cancel_rule, max_weight, seat_type)
VALUES ('1', 1, 2, 'Bus1', 'City A', 50.00, 40, 'City B', '2024-07-15', '2024-07-10', 'No cancellation fee', NULL,
        'Economy'),
       ('2', 2, 3, 'Bus2', 'City C', 80.00, 45, 'City D', '2024-07-20', '2024-07-18', 'Cancellation fee applies',
        NULL, 'Luxury'),
       ('3', 3, 1, 'koopetrain1', 'City E', 120.00, 300, 'City F', '2024-07-25', '2024-07-22',
        'Flexible cancellation policy', 500.00, NULL),
       ('4', 1, 3, 'koopetrain2', 'City B', 55.00, 350, 'City A', '2024-07-12', '2024-07-08',
        'No cancellation fee', NULL, 'Economy'),
       ('5', 2, 1, 'bustrain1', 'City D', 70.00, 400, 'City C', '2024-07-18', '2024-07-16',
        'Cancellation fee applies', NULL, 'Cargo'),
       ('6', 3, 2, 'airplane1', 'City G', 150.00, 100, 'City H', '2024-07-30', '2024-07-28', 'Non-refundable',
        2000.00, 'Business'),
       ('7', 1, 2, 'airplane2', 'City I', 180.00, 120, 'City J', '2024-08-05', '2024-08-02', 'Non-refundable',
        2500.00, 'First Class');


-- location_country
INSERT INTO location_country (location, country)
VALUES ('location 1', 'USA'),
       ('location 2', 'USA'),
       ('location 3', 'UK'),
       ('location 4', 'France'),
       ('location 5', 'Germany');

-- wallet_account_tr
INSERT INTO wallet_account_tr (bank_account_number, user_id, date, amount, type, state)
VALUES (890, 1, '2024-06-01', 100.00, 'Deposit', 'Completed'),
       (801, 2, '2024-06-02', 200.00, 'Withdrawal', 'Pending'),
       (812, 3, '2024-06-03', 150.00, 'Deposit', 'Completed'),
       (823, 4, '2024-06-04', 50.00, 'Deposit', 'Failed'),
       (834, 5, '2024-06-05', 300.00, 'Deposit', 'Completed'),
       (845, 6, '2024-06-06', 400.00, 'Withdrawal', 'Completed'),
       (856, 7, '2024-06-07', 250.00, 'Deposit', 'Pending'),
       (867, 8, '2024-06-08', 350.00, 'Deposit', 'Completed'),
       (878, 9, '2024-06-09', 100.00, 'Withdrawal', 'Completed'),
       (876, 10, '2024-06-10', 200.00, 'Transfer', 'Failed');


-- wallet_tr
INSERT INTO wallet_tr (giver_id, receiver_id, reservation_id, original_price, discount_amount, date, amount, type,
                       state)
VALUES (1, 2, 101, 100.00, 10.00, '2024-06-01', 90.00, 'Payment', 'Completed'),
       (2, 3, 102, 200.00, 20.00, '2024-06-02', 180.00, 'Refund', 'Pending'),
       (3, 4, 103, 150.00, 15.00, '2024-06-03', 135.00, 'Transfer', 'Completed'),
       (4, 5, 104, 50.00, 5.00, '2024-06-04', 45.00, 'Payment', 'Failed'),
       (5, 6, 105, 300.00, 30.00, '2024-06-05', 270.00, 'Payment', 'Completed'),
       (6, 7, 106, 400.00, 40.00, '2024-06-06', 360.00, 'Refund', 'Completed'),
       (7, 8, 107, 250.00, 25.00, '2024-06-07', 225.00, 'Transfer', 'Pending'),
       (8, 9, 108, 350.00, 35.00, '2024-06-08', 315.00, 'Payment', 'Completed'),
       (9, 10, 109, 100.00, 10.00, '2024-06-09', 90.00, 'Refund', 'Completed'),
       (10, 1, 110, 200.00, 20.00, '2024-06-10', 180.00, 'Transfer', 'Failed');


-- trip_reservation
INSERT INTO trip_reservation (transaction_id, trip_number, user_id, reserve_date, is_vip, state, seat_number)
VALUES (1, '2', 1, '2024-07-01', FALSE, 'Confirmed', 10),
       (2, '2', 2, '2024-07-02', TRUE, 'Pending', 5),
       (3, '3', 3, '2024-07-03', FALSE, 'Confirmed', 15),
       (4, '5', 4, '2024-07-04', FALSE, 'Cancelled', NULL),
       (5, '5', 5, '2024-07-05', TRUE, 'Confirmed', 20),
       (6, '6', 6, '2024-07-06', FALSE, 'Pending', 8),
       (7, '7', 7, '2024-07-07', TRUE, 'Confirmed', 12);


-- hotel_reservation
INSERT INTO hotel_reservation (transaction_id, hotel_id, user_id, reserve_date, duration, state, start_date)
VALUES (1, 1, 2, '2024-07-01', '3 days', 'Confirmed', '2024-07-05'),
       (2, 2, 2, '2024-07-02', '2 days', 'Pending', '2024-07-10'),
       (3, 3, 3, '2024-07-03', '5 days', 'Confirmed', '2024-07-15'),
       (4, 4, 5, '2024-07-04', '1 day', 'Cancelled', '2024-07-08'),
       (5, 5, 5, '2024-07-05', '4 days', 'Confirmed', '2024-07-12'),
       (6, 6, 6, '2024-07-06', '2 days', 'Pending', '2024-07-20'),
       (7, 7, 7, '2024-07-07', '3 days', 'Confirmed', '2024-07-18');


-- discount_usage_trip
INSERT INTO discount_usage_trip (discount_code, reservation_id)
VALUES ('DISC002', 2),
       ('DISC003', 3),
       ('DISC004', 4),
       ('DISC006', 6),
       ('DISC007', 7);


-- discount_usage_hotel
INSERT INTO discount_usage_hotel (discount_code, reservation_id)
VALUES ('DISC001', 1),
       ('DISC008', 2),
       ('DISC001', 3);

-- trip_survey
INSERT INTO trip_survey (trip_number, user_id, comment, score)
VALUES ('1', 2, 'Great trip!', 5),
       ('2', 3, 'It was okay.', 3),
       ('3', 5, 'Not satisfied with the service.', 2),
       ('4', 6, 'Excellent experience!', 5),
       ('5', 10, 'Good but could be better.', 4),
       ('6', 7, 'Had some issues with the booking.', 3),
       ('7', 9, 'The trip was cancelled.', 1);


-- into hotel_survey
INSERT INTO hotel_survey (hotel_id, user_id, comment, score)
VALUES (1, 2, 'Wonderful stay with excellent service.', 5),
       (2, 3, 'Rooms were clean but the service was average.', 3),
       (3, 5, 'Not worth the price.', 2),
       (4, 6, 'Amazing experience, will visit again!', 5),
       (5, 7, 'Good location but noisy.', 4),
       (6, 9, 'The staff was rude.', 1),
       (7, 10, 'Great value for money.', 4);

-- trip_ticket
INSERT INTO trip_ticket (trip_reservation_id, user_id, examiner_id, message, type)
VALUES (1, 2, 8, 'Ticket issued for seat upgrade.', 'Upgrade'),
       (2, 10, 8, 'Ticket issued for meal preference.', 'Meal'),
       (3, 3, 8, 'Ticket issued for luggage issue.', 'Luggage'),
       (4, 5, 8, 'Ticket issued for seat preference.', 'Seat'),
       (5, 6, 8, 'Ticket issued for late arrival.', 'Arrival'),
       (6, 7, 8, 'Ticket issued for special assistance.', 'Assistance'),
       (7, 9, 8, 'Ticket issued for travel insurance.', 'Insurance');

-- hotel_ticket
INSERT INTO hotel_ticket (hotel_reservation_id, user_id, examiner_id, message, type)
VALUES (1, 2, 8, 'Ticket issued for room upgrade.', 'Upgrade'),
       (2, 3, 8, 'Ticket issued for late check-out.', 'Check-out'),
       (3, 5, 8, 'Ticket issued for additional services.', 'Service'),
       (4, 6, 8, 'Ticket issued for room service complaint.', 'Complaint'),
       (5, 7, 8, 'Ticket issued for maintenance issue.', 'Maintenance'),
       (6, 9, 8, 'Ticket issued for reservation modification.', 'Modification'),
       (7, 10, 8, 'Ticket issued for early check-in.', 'Check-in');


-- ticket_type_priority
INSERT INTO ticket_type_priority (type, priority)
VALUES ('Upgrade', 1),
       ('Check-out', 2),
       ('Service', 3),
       ('Complaint', 4),
       ('Maintenance', 5),
       ('Modification', 6),
       ('Check-in', 7);
