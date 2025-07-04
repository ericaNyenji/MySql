-- Suppliers
INSERT INTO suppliers (name, contact_email, phone) VALUES
('East Africa Supplies', 'sales@easupplies.co.ke', '+254700123456'),
('TechGlobal Ltd', 'support@techglobal.com', '+254712345678');

-- Products
INSERT INTO products (name, category, price, supplier_id) VALUES
('Laptop - Dell XPS 13', 'Electronics', 120000, 1),
('Wireless Mouse', 'Accessories', 2500, 2),
('Keyboard - Mechanical', 'Accessories', 5000, 1);

-- Stock
INSERT INTO stock (product_id, quantity) VALUES
(1, 10),
(2, 50),
(3, 20);

-- Orders
INSERT INTO orders (supplier_id, order_date, total_amount) VALUES
(1, '2025-06-01', 125000),
(2, '2025-06-03', 7500);

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 120000),
(1, 3, 1, 5000),
(2, 2, 3, 2500);
