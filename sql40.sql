SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity
FROM PurchaseOrders
GROUP BY order_status;