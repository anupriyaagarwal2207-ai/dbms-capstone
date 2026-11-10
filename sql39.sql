SELECT
    po.po_id,
    s.supplier_name,
    p.product_name,
    po.quantity,
    po.order_status,
    po.expected_delivery_date
FROM PurchaseOrders po
JOIN Suppliers s
    ON po.supplier_id = s.supplier_id
JOIN Products p
    ON po.product_id = p.product_id
WHERE po.order_status IN ('Pending', 'Shipped');