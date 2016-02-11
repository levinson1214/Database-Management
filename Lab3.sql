SELECT ordno, dollars
FROM orders;
SELECT name, city
FROM agents
WHERE name = 'Smith';
SELECT pid, name, priceusd
FROM products
WHERE quantity > 208000;
SELECT name, city
FROM customers
WHERE city = 'Dallas';
SELECT name
FROM agents
WHERE city != 'New York' and city != 'Tokyo';
SELECT *
FROM products
WHERE city != 'Dallas' and city != 'Duluth' and priceusd >= 1;
SELECT *
FROM orders
WHERE mon = 'jan' or mon = 'mar';
SELECT *
FROM orders
WHERE mon = 'feb' and dollars < 500;
SELECT *
FROM orders
WHERE cid = c005;