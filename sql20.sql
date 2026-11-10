SELECT
    po.po_id,
    s.supplier_name,
    po.expected_delivery_date,
    po.actual_delivery_date
FROM PurchaseOrders po
JOIN Suppliers s
    ON po.supplier_id = s.supplier_id
WHERE po.actual_delivery_date >
      po.expected_delivery_date;