CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    manufacturer_id INT,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (manufacturer_id)
        REFERENCES Manufacturers(manufacturer_id),
    CHECK (unit_price >= 0)
);