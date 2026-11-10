CREATE TABLE InventoryMovements (
    movement_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    movement_date DATE NOT NULL,
    movement_type VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (warehouse_id)
        REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id),
    CHECK (movement_type IN ('IN', 'OUT')),
    CHECK (quantity > 0)
);