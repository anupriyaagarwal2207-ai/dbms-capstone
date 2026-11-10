CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    reorder_level INT NOT NULL,
    FOREIGN KEY (warehouse_id)
        REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id),
    UNIQUE (warehouse_id, product_id),
    CHECK (quantity >= 0),
    CHECK (reorder_level >= 0)
);