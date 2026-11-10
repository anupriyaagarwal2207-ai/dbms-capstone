CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    rating DECIMAL(3,2) DEFAULT 0,
    CHECK (rating BETWEEN 0 AND 5)
);