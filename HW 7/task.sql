-- 1

DROP VIEW IF EXISTS samsBills;

CREATE VIEW samsBills AS
SELECT reststaff.first_name, reststaff.surname, restbill.bill_date, restbill.cust_name, restbill.bill_total
FROM reststaff
INNER JOIN restbill ON reststaff.staff_no = restbill.waiter_no
WHERE reststaff.first_name = 'Sam' AND reststaff.surname = 'Pitt';

SELECT * FROM samsBills;

-- 2

SELECT * FROM samsBills
WHERE samsBills.bill_total > 400;

-- 3

DROP VIEW IF EXISTS roomTotals;

CREATE VIEW roomTotals AS
SELECT restrest_table.room_name, SUM(restbill.bill_total) AS total_sum
FROM restrest_table
INNER JOIN restbill ON restrest_table.table_no = restbill.table_no
GROUP BY restrest_table.room_name;

SELECT * FROM roomTotals;

-- 4

DROP VIEW IF EXISTS teamTotals;

CREATE VIEW teamTotals AS
SELECT CONCAT(reststaff.first_name, ' ', reststaff.surname) AS headwaiter_name, SUM(restbill.bill_total) AS total_sum
FROM reststaff
INNER JOIN restbill ON reststaff.staff_no = restbill.waiter_no
GROUP BY headwaiter_name;

SELECT * FROM teamTotals;


