--1 List ordno and dollars for all orders
SELECT ordno, dollars
FROM orders;
--2 List names and cities of agents named Smith
SELECT name, city
FROM agents
WHERE name = 'Smith';
--3 List pid, name, and priceusd of products with quantities greater than 208000
SELECT pid, name, priceusd
FROM products
WHERE quantity > 208000;
--4 List names and cities of customers in Dallas
SELECT name, city
FROM customers
WHERE city = 'Dallas';
--5 List names of Agents not in New York and not in Tokyo
SELECT name
FROM agents
WHERE city != 'New York' and city != 'Tokyo';
--6 List all info on products not in Dallas and not in Duluth with prices greater or equal to $1
SELECT *
FROM products
WHERE city != 'Dallas' and city != 'Duluth' and priceusd >= 1;
--7 List all elements of orders from Jan and Mar
SELECT *
FROM orders
WHERE mon = 'jan' or mon = 'mar';
--8 List all elements of orders from Feb that are less than $500
SELECT *
FROM orders
WHERE mon = 'feb' and dollars < 500;
--9 List all elements of orders from c005 (This customer does not exist orders)
SELECT *
FROM orders
WHERE cid = c005;