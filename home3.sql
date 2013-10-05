-- Queries Homework 3
-- Nikol Pettine

-- 1
SELECT DISTINCT city
FROM agents
WHERE aid in
 ( SELECT aid
   FROM orders
   WHERE orders.cid = 'c002'
 )
 
-- 2
SELECT DISTINCT city
FROM agents a, orders o
WHERE o.aid = a.aid AND o.cid = 'c002'

-- 3
SELECT pid
FROM products
WHERE pid in
  ( SELECT pid
    FROM orders
    WHERE orders.aid in
      ( SELECT aid
        FROM orders
        WHERE orders.cid in
          (SELECT cid
           FROM customers
           WHERE customers.city = 'Kyoto'
           )
      )
  ) 
  
-- 4
SELECT DISTINCT o1.pid
FROM orders o1, orders o2, customers c
WHERE o2.cid = c.cid AND c.city = 'Kyoto' AND o1.aid = o2.aid
ORDER BY o1.pid

-- 5
SELECT c.name
FROM customers c
WHERE cid NOT in (SELECT DISTINCT cid
                   FROM orders)
                   
-- 6
SELECT c.name
FROM customers c left outer join orders o on o.cid = c.cid
WHERE o.ordno IS NULL 

-- 7
SELECT DISTINCT c.name AS "Customer Name", a.name AS "Agent Name"
FROM customers c, orders o, agents a
WHERE o.cid = c.cid AND o.aid = a.aid AND c.city = a.city

-- 8
SELECT c.name AS "Customer Name", a.name AS "Agent Name", a.city AS "City"
FROM customers c, agents a
WHERE c.city = a.city
Order By "City"

-- 9
SELECT c.name AS "Customer Name", c.city
FROM customers c, products p
WHERE c.city = p.city 
GROUP BY c.name, c.city
HAVING sum(quantity) <= (SELECT min(sum)
                          FROM (SELECT sum(quantity)
                                 FROM  products p
                                 GROUP BY p.city) AS sums)
                                
-- 10
SELECT c.name AS "Customer Name", c.city
FROM customers c, products p
WHERE c.city = p.city 
GROUP BY c.name, c.city
HAVING sum(quantity) >= (SELECT max(sum)
                          FROM (SELECT sum(quantity)
                                 FROM  products p
                                 GROUP BY p.city) AS sums)
                                 
-- 11
SELECT c.name AS "Customer Name", c.city
FROM customers c, products p
WHERE c.city = p.city 
GROUP BY c.name, c.city
HAVING sum(quantity) > (SELECT min(sum)
                         FROM (SELECT sum(quantity)
                                FROM  products p
                                GROUP BY p.city) AS sums)
                                
-- 12
SELECT *
FROM products p
GROUP BY p.pid
HAVING p.priceusd > (SELECT avg(priceUSD) 
                      FROM products)
                      
-- 13
SELECT c.name AS "Customer Name", o.pid, o.dollars
FROM customers c, orders o
WHERE o.cid = c.cid
ORDER BY dollars desc

-- 14  total ordered takenn as sum of qty
SELECT c.name, Coalesce(sum(o.qty), 0)
FROM customers c left outer join orders o on o.cid = c.cid
GROUP BY c.cid
ORDER BY c.name

-- 15
SELECT c.name AS "Customer Name", p.name AS "Product Name", a.name AS "Agent name"
FROM customers c, products p, agents a, orders o
WHERE o.cid = c.cid AND o.pid = p.pid AND o.aid = a.aid AND a.city = 'New York'