select username, id 
from users
inner join (select guest_id, count(guest_id) as reservations_count
from reservations
group by guest_id
order by (reservations_count) desc
limit 1) as filtered
on users.id = filtered.guest_id