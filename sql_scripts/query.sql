EXPLAIN ANALYZE
SELECT u.user_name, u.email, o.order_id, o.amount, o.created_at
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE u.user_name = 'User_500' 
  AND o.created_at >= now() - interval '30 days';