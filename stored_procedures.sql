--restock_product – Automatically increase product stock
DELIMITER $$

CREATE PROCEDURE restock_product (IN prod_id INT, IN add_qty INT)
BEGIN
    UPDATE stock
    SET quantity = quantity + add_qty,
        last_updated = CURRENT_TIMESTAMP
    WHERE product_id = prod_id;
END$$

DELIMITER ;
--Usage: CALL restock_product(1, 5);


--get_low_stock_products – Show products below a given threshold
DELIMITER $$

CREATE PROCEDURE get_low_stock_products (IN threshold INT)
BEGIN
    SELECT 
        p.name,
        s.quantity
    FROM products p
    JOIN stock s ON p.product_id = s.product_id
    WHERE s.quantity < threshold;
END$$

DELIMITER ;
--Usage: CALL get_low_stock_products(15);

--create_order – Insert a new order with auto total
-- Assumes only one product per call for simplicity; expand as needed

DELIMITER $$

CREATE PROCEDURE create_order (IN sup_id INT, IN prod_id INT, IN qty INT, IN unit_price DECIMAL(10,2))
BEGIN
    DECLARE new_order_id INT;

    -- Insert order header
    INSERT INTO orders (supplier_id, order_date, total_amount)
    VALUES (sup_id, CURDATE(), qty * unit_price);

    -- Get last inserted order_id
    SET new_order_id = LAST_INSERT_ID();

    -- Insert order item
    INSERT INTO order_items (order_id, product_id, quantity, unit_price)
    VALUES (new_order_id, prod_id, qty, unit_price);
END$$

DELIMITER ;

