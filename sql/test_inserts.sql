
INSERT INTO public.user_types (id, title) VALUES
	(1, 'Host'),
	(2, 'Guest');



INSERT INTO public.users (id, username, email, user_type) VALUES
	(1, 'host123', 'host123@example.com', 1),
	(2, 'guest456', 'guest456@example.com', 2),
	(3, 'guest1234', 'guest1234@example.com', 2),
	(4, 'host124', 'host124@example.com', 1);


INSERT INTO public.reservations (id, guest_id, room_id, check_in_date, check_out_date) VALUES
	(203, 3, 103, '2023-10-07', '2023-10-10'),
	(202, 3, 102, '2023-10-07', '2023-10-10'),
	(201, 2, 102, '2023-09-15', '2023-09-25');



INSERT INTO public.guest_reviews (id, guest_id, host_id, reservation_id, rating, comment, date) VALUES
	(503, 3, 4, 203, 2, 'It was cold and dirty!', '2023-10-09'),
	(502, 3, 1, 202, 4, 'Excellent stay!', '2023-10-09'),
	(501, 2, 1, 201, 4, 'Great host!', '2023-09-25');



INSERT INTO public.payments (id, guest_id, reservation_id, payment_date, amount) VALUES
	(403, 3, 202, '2023-09-10', '$400.00'),
	(402, 3, 202, '2023-09-10', '$400.00'),
	(401, 2, 201, '2023-08-25', '$799.00');


INSERT INTO public.rooms (id, host_id, room_name, description, amount_of_residents, price, "has_a/c", has_refrigerator, is_out_of_service) VALUES
	(103, 1, 'White Lake Cabin', 'edit', 1, 250, true, true, false),
	(102, 4, 'Chinatown Artist Loft', 'edit', 1, 300, true, true, false),
	(101, 1, 'Black Lake Cabin', 'edit', 1, 250, true, false, true);

