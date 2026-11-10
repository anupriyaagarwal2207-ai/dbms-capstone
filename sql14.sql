SELECT
    p.product_name,
    w.warehouse_name,
    i.quantity AS current_stock,
    i.reorder_level,
    (i.reorder_level - i.quantity) AS quantity_to_order
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
JOIN Warehouses w
    ON i.warehouse_id = w.warehouse_id
WHERE i.quantity < i.reorder_level;