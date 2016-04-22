--Lab 4
--1. Get the cities of agents booking an order for a customer whose cid is c002
Select city
From agents
Where aid in (Select aid
	      From orders
	      Where cid = 'c002');

--2. Get ids of products ordered through any agent who took orders from a customer in dallas
--Sort by pid from highest to lowest
Select Distinct pid
From orders
Where aid in (Select aid
	      From orders, customers
	      Where customers.city = 'Dallas'
	      and customers.cid = orders.cid)
	      Order BY pid;

--3. Get the ids and names of customers who did not order through a01
Select customers.cid, customers.name
From customers, orders, agents
Where orders.cid = customers.cid AND orders.aid = agents.aid
and agents.aid != 'a01';

--4. Get the ids of customers who ordered both p01 and p07
Select customers.cid
From customers, orders, products
Where orders.cid = customers.cid AND orders.pid = products.pid
AND products.pid = 'p01' AND products.pid = 'p07';

--5. Ids of products not ordered by customers who placed any order
--through agent a07
Select products.pid
From products, orders, agents, customers
Where products.pid = orders.pid AND agents.aid = orders.aid AND
customers.cid = orders.cid AND orders.aid != 'a07'
Order BY pid;

--6. Name, discounts, and city for all customers placing orders from 
-- agents in london and ny
Select customers.name, customers.city, customers.discount
From customers, orders, agents
Where customers.cid = orders.cid AND agents.aid = orders.aid
AND agents.city = 'London' OR agents.city = 'New York';

--7. All customers that have the same discount as customers in Dallas or London
Select customers.cid
From customers
Where city != 'Dallas' AND city != 'London' AND
discount in (Select discount
	     From customers
	     Where city = 'Dallas' or city = 'London');

--8. Check restrains allow for us to search up specific information in the database.
-- They are good to have in databases because one might want to search up only certain aspects rather than the entire section.
-- A good way to use check restraints to search for orders made in a certain month.
-- A bad way to use them is to search all orders made because you can just check the data that was inputted.