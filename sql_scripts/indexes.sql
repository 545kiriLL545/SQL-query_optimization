-- Индекс на имя пользователя
CREATE INDEX idx_users_name ON users(user_name);

-- Индекс на дату заказа
CREATE INDEX idx_orders_created_at ON orders(created_at);

-- Индекс для внешнего ключа
CREATE INDEX idx_orders_user_id ON orders(user_id);