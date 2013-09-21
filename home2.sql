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
  
-- 3
SELECT cid, name 
FROM customers
WHERE NOT customers.cid in
  (SELECT cid
   FROM orders
   WHERE orders.aid = 'a03'
  )