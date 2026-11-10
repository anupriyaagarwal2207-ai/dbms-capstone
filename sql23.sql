CREATE INDEX idx_purchase_supplier_status_date
ON PurchaseOrders
(supplier_id, order_status, expected_delivery_date);