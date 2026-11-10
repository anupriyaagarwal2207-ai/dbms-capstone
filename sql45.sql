UPDATE PurchaseOrders
SET order_status = 'Delivered',
    actual_delivery_date = CURRENT_DATE()
WHERE po_id = 1;