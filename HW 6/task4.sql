-- 1 

SELECT restbill.cust_name FROM restaurant_management.restbill
WHERE restbill.bill_total > 450 AND restbill.waiter_no IN (
	SELECT reststaff.staff_no FROM restaurant_management.reststaff
	WHERE reststaff.headwaiter = (
		SELECT reststaff.staff_no FROM restaurant_management.reststaff
		WHERE reststaff.first_name = 'Charles' AND reststaff.surname = 'Watson'
		)
	);

-- 2

SELECT reststaff.first_name, reststaff.surname FROM restaurant_management.reststaff
WHERE reststaff.staff_no = (
	SELECT reststaff.headwaiter FROM restaurant_management.reststaff
    	WHERE reststaff.staff_no = (
		SELECT restbill.waiter_no FROM restaurant_management.restbill
        	WHERE restbill.cust_name LIKE 'Nerida %'
        	AND restbill.bill_date = '160111'
        	)
	);

-- 3

SELECT restbill.cust_name FROM restaurant_management.restbill
WHERE restbill.bill_total = (
	SELECT MIN(restbill.bill_total) FROM restaurant_management.restbill
    );

-- 4

SELECT reststaff.first_name, reststaff.surname FROM restaurant_management.reststaff
WHERE reststaff.staff_no NOT IN (
	SELECT restbill.waiter_no FROM restaurant_management.restbill
    );

-- 5

SELECT restbill.cust_name, restroom_management.room_name, reststaff.first_name, reststaff.surname FROM restaurant_management.restbill
INNER JOIN restaurant_management.restroom_management ON restbill.bill_date = restroom_management.room_date 
INNER JOIN restaurant_management.reststaff ON restroom_management.headwaiter = reststaff.staff_no
WHERE restbill.bill_total IN (
	SELECT MAX(restbill.bill_total) FROM restaurant_management.restbill
    	WHERE restbill.bill_date IN (
		SELECT restroom_management.room_date FROM restaurant_management.restroom_management
        	WHERE restroom_management.headwaiter IN (
			SELECT reststaff.staff_no FROM restaurant_management.reststaff
            )
		)
	);

