CREATE TABLE PurchaseOrders (
    po_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity INT NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    actual_delivery_date DATE,
    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id),
    FOREIGN KEY (warehouse_id)
        REFERENCES Warehouses(warehouse_id),
    CHECK (quantity > 0),
    CHECK (order_status IN
        ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);