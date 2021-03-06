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
  
-- 4
SELECT cid, name
FROM customers
WHERE customers.cid in
  (SELECT DISTINCT cid
   FROM orders
   WHERE orders.pid = 'p01' 
   
   INTERSECT
   
   SELECT DISTINCT cid
   FROM orders
   WHERE orders.pid = 'p07'
  )
  
-- 5
SELECT pid
FROM products
WHERE products.pid in
  (SELECT pid
   FROM orders
   WHERE orders.cid in
     (SELECT cid
      FROM orders
      WHERE orders.aid = 'a03'
     )
  )
  
-- 6
SELECT name, dicount
FROM customers
WHERE customers.cid in 
  (SELECT DISTINCT cid
   FROM orders
   WHERE orders.aid in
     (SELECT aid
      FROM agents
      WHERE agents.city = 'Dallas' OR agents.city = 'Duluth'
     )
  )
  
-- 7
SELECT *
FROM customers
WHERE customers.discount in
  (SELECT discount
   FROM customers
   WHERE customers.city = 'Dallas' OR customers.city = 'Kyoto'
  )
  
EXCEPT
   
SELECT *
FROM customers
WHERE customers.city = 'Dallas' OR customers.city = 'Kyoto'
