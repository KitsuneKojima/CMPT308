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
 
-- 2
SELECT DISTINCT pid
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