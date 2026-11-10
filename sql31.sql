CREATE TABLE SupplierProducts (
    supplier_product_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    product_id INT NOT NULL,
    supply_cost DECIMAL(10,2) NOT NULL,
    lead_time_days INT NOT NULL,

    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers(supplier_id),

    FOREIGN KEY (product_id)
        REFERENCES Products(product_id),

    UNIQUE (supplier_id, product_id),

    CHECK (supply_cost >= 0),
    CHECK (lead_time_days >= 0)
);