-- 1 

SELECT SUM(bill_total) AS income FROM restaurant_management.restbill;

-- 2 

SELECT SUM(bill_total) AS feb_income FROM restaurant_management.restbill
WHERE bill_date LIKE '1602%';

-- 3

SELECT AVG(bill_total) AS average_table_2 FROM restaurant_management.restbill
WHERE table_no = 2;

-- 4

SELECT MIN(no_of_seats) AS Min,
       Max(no_of_seats) AS Max,
       AVG(no_of_seats) AS Avg FROM restaurant_management.restrest_table
WHERE room_name = 'Blue';

-- 5

SELECT DISTINCT COUNT(table_no) FROM restaurant_management.restbill
WHERE waiter_no IN (4,2);