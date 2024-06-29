CREATE INDEX idx_hotel_name ON hotel (name);

CREATE INDEX idx_user_name ON user_account (name);

CREATE INDEX idx_hotel_type ON hotel (type);

CREATE INDEX idx_company_score ON company (score);

-- more indexes

CREATE INDEX idx_trip_start_date_vehicle_name ON trip (start_date, vehicle_name);

CREATE INDEX idx_vehicle_type_vehicle_name ON vehicle (type, vehicle_name);

CREATE INDEX idx_room_beds_number_room_id ON room (beds_number, room_id);

CREATE INDEX idx_hotel_amenity_name_hotel_id ON hotel_amenity (amenity_name, hotel_id);

CREATE INDEX idx_discount_code_type ON discount (code, type);

CREATE INDEX idx_discount_usage_trip_discount_code ON discount_usage_trip (discount_code);

CREATE INDEX idx_discount_usage_hotel_discount_code ON discount_usage_hotel (discount_code);

CREATE INDEX idx_trip_reservation_state_trip_number ON trip_reservation (state, trip_number);

CREATE INDEX idx_hotel_city_hotel_id ON hotel (city, hotel_id);

CREATE INDEX idx_trip_reservation_user_id_trip_number ON trip_reservation (user_id, trip_number);

CREATE INDEX idx_hotel_reservation_hotel_id_start_date ON hotel_reservation (hotel_id, start_date);
