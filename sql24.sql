CREATE INDEX idx_stockout_report
ON Inventory
(warehouse_id, product_id, quantity, reorder_level);