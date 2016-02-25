--1.
SELECT DISTINCT agents.city
FROM agents
LEFT JOIN orders
ON orders.cid = 'c002';

--2.
SELECT DISTINCT pid
FROM orders
LEFT JOIN customers
ON customers.city = 'Dallas'
Order BY pid DESC;

--3.
SELECT name
FROM customers
Where cid not in (SELECT cid
		  FROM orders
		  WHERE orders.cid = customers.cid);

--4.
SELECT name
FROM customers
LEFT JOIN orders
ON customers.cid = orders.cid
WHERE orders.cid = null;

--5.
SELECT DISTINCT customers.name, agents.name
FROM customers, agents, orders
WHERE customers.city = agents.city
AND customers.cid = orders.cid
AND agents.aid = orders.aid;

--6.
SELECT c.name, a.name, c.city
FROM customers c, agents a
Where c.city = a.city;

--7.
SELECT name, city
FROM customers
Where city in (SELECT city
	       FROM products
	       GROUP BY city
	       ORDER BY count(pid) ASC
	       LIMIT 1);