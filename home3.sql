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