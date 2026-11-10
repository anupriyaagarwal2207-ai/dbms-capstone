SELECT
    p.product_name,
    w.warehouse_name,
    i.quantity,
    i.reorder_level
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
JOIN Warehouses w
    ON i.warehouse_id = w.warehouse_id
WHERE i.quantity < i.reorder_level;