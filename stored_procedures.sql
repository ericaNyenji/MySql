DELIMITER $$

CREATE PROCEDURE restock_product (IN prod_id INT, IN add_qty INT)
BEGIN
    UPDATE stock
    SET quantity = quantity + add_qty,
        last_updated = CURRENT_TIMESTAMP
    WHERE product_id = prod_id;
END$$

DELIMITER ;
