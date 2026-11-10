-- Check all indexes
SHOW INDEX FROM Inventory;

SHOW INDEX FROM PurchaseOrders;

-- Check inventory query execution plan
EXPLAIN
SELECT *
FROM Inventory
WHERE warehouse_id = 1
AND product_id = 2;

-- Check purchase order query execution plan
EXPLAIN
SELECT *
FROM PurchaseOrders
WHERE supplier_id = 1
AND order_status = 'Pending'
AND expected_delivery_date >= '2026-11-01';

-- Check covering index execution plan
EXPLAIN
SELECT
    warehouse_id,
    product_id,
    quantity,
    reorder_level
FROM Inventory
WHERE warehouse_id = 1
AND quantity < reorder_level;