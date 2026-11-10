SELECT
    s.supplier_name,
    SUM(po.quantity) AS total_orders
FROM Suppliers s
JOIN PurchaseOrders po
    ON s.supplier_id = po.supplier_id
GROUP BY s.supplier_name
ORDER BY total_orders DESC;