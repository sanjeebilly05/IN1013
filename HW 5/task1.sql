-- 1
SELECT bill_date, bill_total FROM  restaurant_management.restbill
WHERE cust_name = 'Bob Crow';

-- 2

SELECT DISTINCT cust_name FROM restaurant_management.restbill
WHERE cust_name LIKE '% SMITH%'
ORDER BY cust_name DESC;

-- 3

SELECT DISTINCT cust_name FROM restaurant_management.restbill
WHERE cust_name LIKE '% C%';

-- 4

SELECT first_name, surname FROM restaurant_management.reststaff
WHERE headwaiter IS NULL;

-- 5

SELECT * FROM restaurant_management.restbill
WHERE bill_date LIKE '1602%';

-- 6

SELECT bill_date FROM restaurant_management.restbill
WHERE bill_date LIKE '15%'
ORDER BY bill_date;
