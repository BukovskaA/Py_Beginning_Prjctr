
--Task_1

select username, id 
from users
inner join (select guest_id, count(guest_id) as reservations_count
from reservations
group by guest_id
order by (reservations_count) desc
limit 1) as filtered
on users.id = filtered.guest_id


--Create queries

-- Create the "user_types" table
CREATE TABLE IF NOT EXISTS user_types (
    id integer NOT NULL,
    title text NOT NULL,
    PRIMARY KEY (id)
);

-- Create the "users" table
CREATE TABLE IF NOT EXISTS users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    user_type integer NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_type) REFERENCES user_types(id)
);

-- Create the "reservations" table
CREATE TABLE IF NOT EXISTS reservations (
    id integer NOT NULL,
    guest_id integer NOT NULL,
    room_id integer NOT NULL,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES users(id)
);

-- Create the "rooms" table
CREATE TABLE IF NOT EXISTS rooms (
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


-- Create the "guest_reviews" table
CREATE TABLE IF NOT EXISTS guest_reviews (
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

-- Create the "payments" table
CREATE TABLE IF NOT EXISTS payments (
    id integer NOT NULL,
    guest_id integer NOT NULL,
    reservation_id integer NOT NULL,
    payment_date date NOT NULL,
    amount money NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) NOT VALID
);

-- Insert data into the "user_types" table
INSERT INTO user_types (id, title) VALUES
	(1, 'Host'),
	(2, 'Guest');


-- Insert data into the "users" table
INSERT INTO users (id, username, email, user_type) VALUES
	(1, 'host123', 'host123@example.com', 1),
	(2, 'guest456', 'guest456@example.com', 2),
	(3, 'guest1234', 'guest1234@example.com', 2),
	(4, 'host124', 'host124@example.com', 1);

-- Insert data into the "reservations" table
INSERT INTO reservations (id, guest_id, room_id, check_in_date, check_out_date) VALUES
    (203, 3, 103, '2023-10-07', '2023-10-10'),
    (202, 3, 102, '2023-10-07', '2023-10-10'),
    (201, 2, 102, '2023-09-15', '2023-09-25');

-- Insert data into the "guest_reviews" table
INSERT INTO guest_reviews (id, guest_id, host_id, reservation_id, rating, comment, date) VALUES
    (503, 3, 4, 203, 2, 'It was cold and dirty!', '2023-10-09'),
    (502, 3, 1, 202, 4, 'Excellent stay!', '2023-10-09'),
    (501, 2, 1, 201, 4, 'Great host!', '2023-09-25');

-- Insert data into the "payments" table
INSERT INTO payments (id, guest_id, reservation_id, payment_date, amount) VALUES
    (403, 3, 202, '2023-09-10', '$400.00'),
    (402, 3, 202, '2023-09-10', '$400.00'),
    (401, 2, 201, '2023-08-25', '$799.00');

--Insert data into "rooms" table
INSERT INTO rooms (id, host_id, room_name, description, amount_of_residents, price, "has_a/c", has_refrigerator, is_out_of_service) VALUES
	(103, 1, 'White Lake Cabin', 'edit', 1, 250, true, true, false),
	(102, 4, 'Chinatown Artist Loft', 'edit', 1, 300, true, true, false),
	(101, 1, 'Black Lake Cabin', 'edit', 1, 250, true, false, true);

