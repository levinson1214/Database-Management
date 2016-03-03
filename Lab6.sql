--1.Name and city of customers that live in city that produces most products
select c.name, c.city
from customers c, (select city, count(city) AS count
		   from products p
		   group by city
		   order by count DESC
		   limit 2) j
where c.city = j.city;

--2.Names and products whose price is above the average price
SELECT p.name
FROM products p
WHERE p.priceUSD > (SELECT AVG(priceUSD)
		    FROM products p)
ORDER BY p.name DESC;

--3.Customer name, pid, and total for all orders
SELECT c.name, p.pid, o.dollars
FROM customers c, products p, orders o
WHERE c.cid = o.cid AND o.pid = p.pid
ORDER BY o.dollars DESC;

--4.Customer names and total ordered
SELECT c.name, o.qty
FROM customers c, orders o
WHERE c.cid = o.cid
ORDER BY c.name ASC;

--5.Names of customers who bought products from agents in Tokyo. 
--Also product's name and agent's name
SELECT c.name, p.name, a.name
FROM customers c, products p, agents a, orders o
WHERE c.cid = o.cid AND a.aid = o.aid AND p.pid = o.pid AND a.city = 'Tokyo';

--6.
SELECT *
FROM (SELECT o.*, o.qty*p.priceusd*(1-(discount/100)) as truedollars
      FROM orders o
      inner join products p on o.pid = p.pid
      inner join customers c on o.cid = c.cid) as tmptable
Where dollars != truedollars;

--7.The first table you name is the one on the "left," and the second table 
--is the one on the "right." So, if you want all the rows from the first table 
--and any matching rows from the second table, you'll use a LEFT OUTER JOIN.
--For the opposite you use the RIGHT OUTER JOIN.
SELECT *
FROM customers c
LEFT OUTER JOIN orders o
ON c.cid = o.cid;

SELECT *
FROM customers c
RIGHT OUTER JOIN orders o
ON c.cid = o.cid;