-- Таблица пользователей
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Таблица заказов
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT,
    amount NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL
);
-- Генерация 10 000 пользователей
INSERT INTO users (user_name, email)
SELECT 
    'User_' || i, 
    'user_' || i || '@example.com'
FROM generate_series(1, 10000) AS i;

-- Генерация 1 000 000 заказов (случайные пользователи, суммы и даты за последний год)
INSERT INTO orders (user_id, amount, created_at)
SELECT 
    (random() * 10000 + 1)::int, -- случайный user_id
    (random() * 10000 + 1)::numeric(10,2), -- случайная сумма 1 до 10 000.99
    now() - (random() * interval '365 days') -- случайная дата за год
FROM generate_series(1, 1000000);