-- View: Product Stock Summary
CREATE VIEW product_stock_summary AS
SELECT 
    p.product_id,
    p.name AS product_name,
    p.category,
    s.quantity AS current_stock,
    p.price,
    (s.quantity * p.price) AS stock_value
FROM products p
JOIN stock s ON p.product_id = s.product_id;

-- View: Recent Orders with Supplier Info
CREATE VIEW recent_orders_summary AS
SELECT 
    o.order_id,
    o.order_date,
    s.name AS supplier_name,
    o.total_amount
FROM orders o
JOIN suppliers s ON o.supplier_id = s.supplier_id
ORDER BY o.order_date DESC;
