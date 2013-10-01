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