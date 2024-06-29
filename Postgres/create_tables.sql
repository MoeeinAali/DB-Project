CREATE TABLE user_account
(
    account_id   SERIAL PRIMARY KEY,
    type         TEXT,
    name         TEXT,
    password     TEXT,
    age          INT,
    phone_number TEXT,
    email        TEXT
);

CREATE TABLE customer_club
(
    customer_id INT not null PRIMARY KEY,
    scale       INT,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE SMS
(
    SMS_id      SERIAL not null PRIMARY KEY,
    sender_id   INT    not null,
    receiver_id INT    not null,
    date        DATE,
    type        TEXT,
    content     TEXT,
    time        TIME,
    CONSTRAINT fk_sender
        FOREIGN KEY (sender_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_receiver
        FOREIGN KEY (receiver_id)
            REFERENCES user_account (account_id)
);


CREATE TABLE wallet
(
    user_id INT not null PRIMARY KEY,
    credit  DECIMAL,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE discount
(
    code                 VARCHAR(255) not null PRIMARY KEY,
    user_id              INT          not null,
    city                 TEXT,
    expiration_date      DATE,
    max_number_of_usages INT,
    service_type         TEXT,
    amount               DECIMAL,
    type                 TEXT,
    min_cost             DECIMAL,
    number_of_usage      INT,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE bank_account
(
    account_number INT not null PRIMARY KEY,
    bank_name      TEXT,
    CVV2           INT
);

CREATE TABLE bank_user
(
    account_number INT not null PRIMARY KEY,
    user_id        INT,
    is_main        boolean default false,
    CONSTRAINT fk_account_number
        FOREIGN KEY (account_number)
            REFERENCES bank_account (account_number),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE hotel
(
    hotel_id     SERIAL PRIMARY KEY,
    type         INT             not null,
    name         TEXT            not null,
    address      TEXT            not null,
    city TEXT not null,
    cancel_rule  TEXT            not null,
    score        float default 0 not null,
    phone_number TEXT            not null
);

CREATE TABLE hotel_admin
(
    hotel_id INT not null,
    admin_id INT not null,
    PRIMARY KEY (hotel_id, admin_id),
    CONSTRAINT fk_hotel
        FOREIGN KEY (hotel_id)
            REFERENCES hotel (hotel_id),
    CONSTRAINT fk_admin
        FOREIGN KEY (admin_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE hotel_amenity
(
    hotel_id     INT          not null,
    amenity_name varchar(255) not null,
    PRIMARY KEY (hotel_id, amenity_name),
    CONSTRAINT fk_hotel
        FOREIGN KEY (hotel_id)
            REFERENCES hotel (hotel_id)
);

CREATE TABLE room
(
    room_id     SERIAL PRIMARY KEY,
    hotel_id    INT NOT NULL,
    state       boolean default False,
    capacity    INT not null,
    size        INT not null,
    beds_number INT not null,
    price       DECIMAL,
    CONSTRAINT fk_hotel
        FOREIGN KEY (hotel_id)
            REFERENCES hotel (hotel_id)
);

CREATE TABLE room_amenity
(
    room_id      INT          not null,
    amenity_name varchar(255) not null,
    PRIMARY KEY (room_id, amenity_name),
    CONSTRAINT fk_room
        FOREIGN KEY (room_id)
            REFERENCES room (room_id)
);

CREATE TABLE room_equipment
(
    room_id        INT          not null,
    equipment_name varchar(255) not null,
    PRIMARY KEY (room_id, equipment_name),
    CONSTRAINT fk_room
        FOREIGN KEY (room_id)
            REFERENCES room (room_id)
);

CREATE TABLE company
(
    company_id     SERIAL          not null PRIMARY KEY,
    name           TEXT            not null,
    score          float default 0 not null,
    origin_country TEXT            not null
);

CREATE TABLE tr_admin
(
    company_id INT not null,
    admin_id   INT not null,
    PRIMARY KEY (admin_id),
    CONSTRAINT fk_hotel
        FOREIGN KEY (company_id)
            REFERENCES company (company_id),
    CONSTRAINT fk_admin
        FOREIGN KEY (admin_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE comment
(
    comment_id SERIAL not null PRIMARY KEY,
    hotel_id   INT    not null,
    writer_id  INT    not null,
    date       DATE,
    content    TEXT,
    CONSTRAINT fk_hotel
        FOREIGN KEY (hotel_id)
            REFERENCES hotel (hotel_id),
    CONSTRAINT fk_writer
        FOREIGN KEY (writer_id)
            REFERENCES user_account (account_id)
);


CREATE TABLE terminal
(
    terminal_id SERIAL not null PRIMARY KEY,
    name        TEXT,
    location    TEXT,
    type        TEXT
);

CREATE TABLE vehicle
(
    vehicle_name TEXT not null PRIMARY KEY,
    max_capacity INT,
    type         VARCHAR(255)
);

CREATE TABLE trip
(
    trip_id                 VARCHAR(255) not null PRIMARY KEY,
    origin_terminal_id      INT          not null,
    destination_terminal_id INT          not null,
    vehicle_name            TEXT         not null,
    origin_city             TEXT         not null,
    price                   DECIMAL,
    capacity                INT,
    destination_city        TEXT,
    end_date                DATE,
    start_date              DATE,
    cancel_rule             TEXT,
    max_weight              DECIMAL,
    seat_type               TEXT,
    CONSTRAINT fk_vehicle
        FOREIGN KEY (vehicle_name)
            REFERENCES vehicle (vehicle_name),
    CONSTRAINT fk_origin_terminal
        FOREIGN KEY (origin_terminal_id)
            REFERENCES terminal (terminal_id),
    CONSTRAINT fk_destination_terminal
        FOREIGN KEY (destination_terminal_id)
            REFERENCES terminal (terminal_id)
);

CREATE TABLE location_country
(
    location TEXT not null PRIMARY KEY,
    country  TEXT not null
);

CREATE TABLE wallet_account_tr
(
    transaction_id      SERIAL not null PRIMARY KEY,
    bank_account_number INT,
    user_id             INT,
    date                DATE,
    amount              DECIMAL,
    type                TEXT,
    state               TEXT,
    CONSTRAINT fk_account_number
        FOREIGN KEY (bank_account_number)
            REFERENCES bank_account (account_number),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE wallet_tr
(
    transaction_id  SERIAL not null PRIMARY KEY,
    giver_id        INT,
    receiver_id     INT,
    original_price  DECIMAL,
    discount_amount DECIMAL,
    date            DATE,
    amount          DECIMAL,
    type            TEXT,
    state           TEXT,
    CONSTRAINT fk_giver
        FOREIGN KEY (giver_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_receiver
        FOREIGN KEY (receiver_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE trip_reservation
(
    reserve_id     SERIAL not null PRIMARY KEY,
    transaction_id INT,
    trip_number    VARCHAR(255),
    user_id        INT,
    reserve_date   DATE,
    is_vip         boolean default false,
    state          TEXT,
    seat_number    INT,
    CONSTRAINT fk_trip
        FOREIGN KEY (trip_number)
            REFERENCES trip (trip_id),
    CONSTRAINT fk_admin
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_transaction
        FOREIGN KEY (transaction_id)
            REFERENCES wallet_tr (transaction_id)
);

CREATE TABLE hotel_reservation
(
    reserve_id     SERIAL not null PRIMARY KEY,
    transaction_id INT,
    hotel_id       INT,
    room_id INT,
    user_id        INT,
    reserve_date   DATE,
    duration       INTERVAL,
    state          TEXT,
    start_date     DATE,
    CONSTRAINT fk_hotel
        FOREIGN KEY (hotel_id)
            REFERENCES hotel (hotel_id),
    CONSTRAINT fk_room
        FOREIGN KEY (room_id)
            REFERENCES room (room_id),
    CONSTRAINT fk_admin
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_transaction
        FOREIGN KEY (transaction_id)
            REFERENCES wallet_tr (transaction_id)
);

CREATE TABLE discount_usage_trip
(
    discount_code  VARCHAR(255) not null,
    reservation_id INT          not null,
    PRIMARY KEY (discount_code, reservation_id),
    CONSTRAINT fk_discount
        FOREIGN KEY (discount_code)
            REFERENCES discount (code),
    CONSTRAINT fk_reservation
        FOREIGN KEY (reservation_id)
            REFERENCES trip_reservation (reserve_id)
);

CREATE TABLE discount_usage_hotel
(
    discount_code  VARCHAR(255) not null,
    reservation_id INT          not null,
    PRIMARY KEY (discount_code, reservation_id),
    CONSTRAINT fk_discount
        FOREIGN KEY (discount_code)
            REFERENCES discount (code),
    CONSTRAINT fk_reservation
        FOREIGN KEY (reservation_id)
            REFERENCES hotel_reservation (reserve_id)
);

CREATE TABLE trip_survey
(
    survey_id   SERIAL not null PRIMARY KEY,
    trip_number VARCHAR(255),
    user_id     INT,
    comment     TEXT,
    score       INT,
    CONSTRAINT fk_trip
        FOREIGN KEY (trip_number)
            REFERENCES trip (trip_id),
    CONSTRAINT fk_admin
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE hotel_survey
(
    survey_id SERIAL not null PRIMARY KEY,
    hotel_id  INT,
    user_id   INT,
    comment   TEXT,
    score     INT,
    CONSTRAINT fk_hotel
        FOREIGN KEY (hotel_id)
            REFERENCES hotel (hotel_id),
    CONSTRAINT fk_admin
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE trip_ticket
(
    ticket_id           SERIAL not null PRIMARY KEY,
    trip_reservation_id INT,
    user_id             INT,
    examiner_id         INT,
    message             TEXT,
    type                TEXT,
    CONSTRAINT fk_trip
        FOREIGN KEY (trip_reservation_id)
            REFERENCES trip_reservation (reserve_id),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_examiner
        FOREIGN KEY (examiner_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE hotel_ticket
(
    ticket_id            SERIAL not null PRIMARY KEY,
    hotel_reservation_id INT,
    user_id              INT,
    examiner_id          INT,
    message              TEXT,
    type                 TEXT,
    CONSTRAINT fk_hotel
        FOREIGN KEY (hotel_reservation_id)
            REFERENCES hotel_reservation (reserve_id),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_examiner
        FOREIGN KEY (examiner_id)
            REFERENCES user_account (account_id)
);

CREATE TABLE phone_call_hotel
(
    phone_call_id SERIAL not null PRIMARY KEY,
    caller_id     INT    not null,
    callee_id     INT    not null,
    ticket_id     int    not null,
    duration      INTERVAL,
    date          DATE,
    time          TIME,
    CONSTRAINT fk_caller
        FOREIGN KEY (caller_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_callee
        FOREIGN KEY (callee_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_ticket
        FOREIGN KEY (ticket_id)
            REFERENCES hotel_ticket (ticket_id)
);

CREATE TABLE phone_call_trip
(
    phone_call_id SERIAL not null PRIMARY KEY,
    caller_id     INT    not null,
    callee_id     INT    not null,
    ticket_id     int    not null,
    duration      INTERVAL,
    date          DATE,
    time          TIME,
    CONSTRAINT fk_caller
        FOREIGN KEY (caller_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_callee
        FOREIGN KEY (callee_id)
            REFERENCES user_account (account_id),
    CONSTRAINT fk_ticket
        FOREIGN KEY (ticket_id)
            REFERENCES trip_ticket (ticket_id)
);


CREATE TABLE ticket_type_priority
(
    type     TEXT not null primary key,
    priority INT
);