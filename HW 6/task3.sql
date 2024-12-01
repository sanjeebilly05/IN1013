-- 1

SELECT reststaff.first_name, reststaff.surname FROM reststaff
INNER JOIN restbill ON reststaff.staff_no = restbill.waiter_no
WHERE restbill.cust_name = 'Tanya Singh';

-- 2

SELECT reststaff.first_name, restroom_management.room_date FROM restaurant_management.reststaff
INNER JOIN restroom_management ON reststaff.staff_no = restroom_management.headwaiter
WHERE restroom_management.room_name = 'GREEN' AND restroom_management.room_date LIKE '%1602%';

-- 3

SELECT reststaff.first_name, reststaff.surname FROM restaurant_management.reststaff
INNER JOIN restbill ON reststaff.staff_no = restbill.waiter_no
WHERE reststaff.headwaiter = 5;

-- 4

SELECT reststaff.first_name, reststaff.surname, restbill.cust_name, restbill.bill_total FROM restaurant_management.reststaff
RIGHT JOIN restbill ON reststaff.staff_no = restbill.waiter_no
ORDER BY restbill.bill_total DESC;

-- 5

SELECT reststaff.first_name, reststaff.surname FROM restaurant_management.reststaff
INNER JOIN restbill ON reststaff.staff_no = restbill.waiter_no
WHERE bill_no IN (14, 17);

-- 6

SELECT reststaff.first_name, reststaff.surname FROM restaurant_management.reststaff
INNER JOIN restbill ON  reststaff.staff_no = restbill.waiter_no
INNER JOIN restrest_table ON restbill.table_no = restrest_table.table_no
INNER JOIN restroom_management ON restrest_table.room_name = restroom_management.room_name
WHERE restroom_management.room_name = 'Blue' AND restroom_management.room_date = 160312;