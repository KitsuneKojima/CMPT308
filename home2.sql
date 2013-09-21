-- Queries homework 2
-- Nikol Pettine

-- 1
SELECT DISTINCT city
FROM agents
WHERE aid in
 ( SELECT aid
   FROM orders
   WHERE orders.cid = 'c002'
 )