-- 1

SELECT reststaff.first_name, reststaff.surname, restbill.bill_date, COUNT(restbill.bill_no) AS num_of_bills FROM restaurant_management.restbill
INNER JOIN restaurant_management.reststaff ON restbill.waiter_no = reststaff.staff_no
GROUP BY reststaff.first_name, reststaff.surname, restbill.bill_date
HAVING COUNT(restbill.bill_no) >= 2
ORDER BY reststaff.first_name, reststaff.surname, restbill.bill_date;

-- 2

SELECT restroom_management.room_name, COUNT(restrest_table.table_no) AS table_count FROM restaurant_management.restrest_table
INNER JOIN restaurant_management.restroom_management ON restrest_table.room_name = restroom_management.room_name
WHERE restrest_table.no_of_seats > 6
GROUP BY restroom_management.room_name;

-- 3

SELECT restroom_management.room_name, SUM(restbill.bill_total) AS total FROM restaurant_management.restbill
INNER JOIN restaurant_management.restroom_management ON restbill.bill_date = restroom_management.room_date
GROUP BY restroom_management.room_name;

-- 4

SELECT headwaiter.first_name AS headwaiter_first_name, headwaiter.surname AS headwaiter_surname, SUM(restbill.bill_total) AS total
FROM restaurant_management.reststaff AS waiter
INNER JOIN restaurant_management.reststaff AS headwaiter ON waiter.headwaiter = headwaiter.staff_no
INNER JOIN restaurant_management.restbill ON waiter.staff_no = restbill.waiter_no
GROUP BY headwaiter.first_name, headwaiter.surname
ORDER BY total DESC;

-- 5

SELECT restbill.cust_name, AVG(restbill.bill_total) AS average_spending
FROM restaurant_management.restbill
GROUP BY restbill.cust_name
HAVING AVG(restbill.bill_total) > 400;

-- 6

SELECT reststaff.first_name, reststaff.surname, restbill.bill_date, COUNT(restbill.bill_date) AS num_bills FROM restaurant_management.restbill
INNER JOIN restaurant_management.reststaff ON restbill.waiter_no = reststaff.staff_no
GROUP BY reststaff.first_name, reststaff.surname, restbill.bill_date
HAVING COUNT(restbill.bill_date) >= 3;