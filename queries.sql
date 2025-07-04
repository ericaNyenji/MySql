-- 1. Show all products with their current stock level
SELECT p.name, s.quantity
FROM products p
JOIN stock s ON p.product_id = s.product_id;

-- 2. Low stock alert (less than 15 units)
SELECT p.name, s.quantity
FROM products p
JOIN stock s ON p.product_id = s.product_id
WHERE s.quantity < 15;

-- 3. List all orders with total amount and supplier name
SELECT o.order_id, o.order_date, s.name AS supplier_name, o.total_amount
FROM orders o
JOIN suppliers s ON o.supplier_id = s.supplier_id;

-- 4. Top 3 most ordered products
SELECT p.name, SUM(oi.quantity) AS total_ordered
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_ordered DESC
LIMIT 3;

-- 5. Total stock value per category
SELECT p.category, SUM(s.quantity * p.price) AS stock_value
FROM products p
JOIN stock s ON p.product_id = s.product_id
GROUP BY p.category;
