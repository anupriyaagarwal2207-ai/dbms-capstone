-- Suppliers
INSERT INTO Suppliers
(supplier_name, contact_email, phone, city, rating)
VALUES
('ABC Suppliers', 'abc@gmail.com', '9876543210', 'Delhi', 4.5),
('XYZ Traders', 'xyz@gmail.com', '9876543211', 'Gurugram', 4.2),
('Global Supplies', 'global@gmail.com', '9876543212', 'Noida', 4.8);

-- Manufacturers
INSERT INTO Manufacturers
(manufacturer_name, location, contact_number)
VALUES
('Tech Manufacturing', 'Delhi', '9811111111'),
('Industrial Products', 'Mumbai', '9822222222');

-- Distributors
INSERT INTO Distributors
(distributor_name, location, phone)
VALUES
('Fast Distribution', 'Delhi', '9833333333'),
('Quick Logistics', 'Gurugram', '9844444444');

-- Products
INSERT INTO Products
(product_name, manufacturer_id, unit_price)
VALUES
('Laptop', 1, 50000),
('Keyboard', 1, 1500),
('Mouse', 2, 800),
('Monitor', 2, 12000);

-- Warehouses
INSERT INTO Warehouses
(warehouse_name, location)
VALUES
('Delhi Warehouse', 'Delhi'),
('Gurugram Warehouse', 'Gurugram');

-- Inventory
INSERT INTO Inventory
(warehouse_id, product_id, quantity, reorder_level)
VALUES
(1, 1, 10, 15),
(1, 2, 50, 20),
(1, 3, 8, 15),
(2, 1, 25, 10),
(2, 4, 5, 10),
(2, 3, 30, 15);

-- Purchase Orders
INSERT INTO PurchaseOrders
(supplier_id, product_id, warehouse_id, quantity,
 order_status, order_date, expected_delivery_date,
 actual_delivery_date)
VALUES
(1, 1, 1, 20, 'Pending', '2026-10-01', '2026-11-12', NULL),
(2, 2, 1, 30, 'Delivered', '2026-10-02', '2026-10-08', '2026-10-07'),
(3, 3, 1, 25, 'Delivered', '2026-10-03', '2026-10-10', '2026-10-12'),
(1, 4, 2, 20, 'Pending', '2026-10-05', '2026-11-14', NULL),
(2, 1, 2, 15, 'Delivered', '2026-10-06', '2026-10-12', '2026-10-11');

-- Logistics
INSERT INTO Logistics
(po_id, distributor_id, transport_mode,
 distance_km, transportation_cost, delivery_date)
VALUES
(2, 1, 'Road', 50, 1500, '2026-10-07'),
(3, 2, 'Truck', 100, 3000, '2026-10-12'),
(5, 1, 'Road', 40, 1200, '2026-10-11');

-- Inventory Movements
INSERT INTO InventoryMovements
(warehouse_id, product_id, movement_date, movement_type, quantity)
VALUES
(1, 1, '2026-10-01', 'OUT', 3),
(1, 1, '2026-10-05', 'OUT', 4),
(1, 1, '2026-10-10', 'IN', 5),
(1, 1, '2026-10-15', 'OUT', 8),
(1, 2, '2026-10-01', 'OUT', 10),
(1, 2, '2026-10-05', 'IN', 20);