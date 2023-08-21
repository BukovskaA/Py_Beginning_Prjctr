

CREATE TABLE guest_reviews (
    id integer NOT NULL,
    guest_id integer NOT NULL,
    host_id integer NOT NULL,
    reservation_id integer NOT NULL,
    rating integer NOT NULL,
    comment text NOT NULL,
    date date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (host_id) REFERENCES users(id) NOT VALID,
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) NOT VALID
);




CREATE TABLE payments (
    id integer NOT NULL,
    guest_id integer NOT NULL,
    reservation_id integer NOT NULL,
    payment_date date NOT NULL,
    amount money NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) NOT VALID
);


CREATE TABLE reservations (
    id integer NOT NULL,
    guest_id integer NOT NULL,
    room_id integer NOT NULL,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES users(id)
);


CREATE TABLE rooms (
    id integer NOT NULL,
    host_id integer NOT NULL,
    room_name text NOT NULL,
    description text NOT NULL,
    amount_of_residents integer NOT NULL,
    price integer NOT NULL,
    "has_a/c" boolean NOT NULL,
    has_refrigerator boolean NOT NULL,
    is_out_of_service boolean NOT NULL.
    PRIMARY KEY (id),
    FOREIGN KEY (host_id) REFERENCES users(id) NOT VALID
);

CREATE TABLE user_types (
    id integer NOT NULL,
    title text NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    user_type integer NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_type) REFERENCES user_types(id)
);