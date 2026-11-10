SELECT
    p.product_name,
    w.warehouse_name,
    i.quantity AS current_stock,
    COALESCE(SUM(
        CASE
            WHEN po.order_status IN ('Pending', 'Shipped')
            THEN po.quantity
            ELSE 0
        END
    ), 0) AS incoming_stock,
    i.reorder_level
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
JOIN Warehouses w
    ON i.warehouse_id = w.warehouse_id
LEFT JOIN PurchaseOrders po
    ON i.product_id = po.product_id
    AND i.warehouse_id = po.warehouse_id
GROUP BY
    i.inventory_id,
    p.product_name,
    w.warehouse_name,
    i.quantity,
    i.reorder_level
HAVING current_stock + incoming_stock < i.reorder_level;