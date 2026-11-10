SELECT
    product_id,
    warehouse_id,
    SUM(quantity) AS pending_quantity
FROM PurchaseOrders
WHERE order_status IN ('Pending', 'Shipped')
GROUP BY product_id, warehouse_id;