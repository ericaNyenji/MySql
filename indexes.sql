-- Improve lookup speed on frequently searched fields
CREATE INDEX idx_product_category ON products(category);
CREATE INDEX idx_stock_product_id ON stock(product_id);
CREATE INDEX idx_orders_supplier_id ON orders(supplier_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
