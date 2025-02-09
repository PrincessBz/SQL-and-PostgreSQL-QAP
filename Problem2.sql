// CREATE TABLES:

CREATE TABLE products (
    products_id SERIAL PRIMARY KEY,
    product_name TEXT,
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT 
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);

CREATE TABLE order_items (
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(products_id),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
    );

// INSERTING DATA
// for products, customers and orders.

INSERT INTO products (product_name, price, stock_quantity) VALUES
('Notebook', 5.99, 50),
('Pen', 1.99, 100),
('Eraser', 0.99, 75),
('Marker', 2.49, 80),
('Stapler', 7.99, 40);

INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Smith', 'bob.smith@example.com'),
('Charlie', 'Brown', 'charlie.brown@example.com'),
('Diana', 'Prince', 'diana.prince@example.com');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-02-01'),
(2, '2024-02-02'),
(3, '2024-02-03'),
(4, '2024-02-04'),
(1, '2024-02-05');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 3, 5),
(2, 4, 1),
(3, 5, 2),
(3, 1, 1),
(4, 2, 4),
(4, 3, 2),
(5, 4, 3),
(5, 5, 1);

 
// Tasks
SQL QUERY :

-Retrieve the names and stock quantities of all products.

SELECT product_name, stock_quantity FROM products;


-Retrieve the product names and quantities for one of the orders placed.

SELECT product_name, quantity FROM order_items
JOIN products ON order_items.product_id = products.products_id
WHERE order_items.order_id = 2
;


-Retrieve all orders placed by a specific customer (including the ID’s of what was ordered and the quantities).

SELECT orders.order_id, product_id, quantity FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
WHERE orders.customer_id = 4;

// UPDATE DATA

UPDATE products
SET stock_quantity = stock_quantity - order_items.quantity 
FROM order_items
WHERE products_id = order_items.product_id AND order_items.order_id = 2;

// DELETE DATA

DELETE FROM order_items WHERE order_id = (SELECT order_id FROM orders WHERE customer_id = 
(SELECT customer_id FROM  customers WHERE first_name = 'Diana' AND last_name = 'Prince'));

DELETE FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE first_name = 'Diana' AND last_name = 'Prince');

