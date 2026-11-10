SELECT
    warehouse_id,
    product_id,
    quantity,
    reorder_level
FROM Inventory
WHERE warehouse_id = 1
AND quantity < reorder_level;