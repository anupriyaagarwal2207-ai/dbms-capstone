CREATE TABLE Distributors (
    distributor_id INT AUTO_INCREMENT PRIMARY KEY,
    distributor_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    phone VARCHAR(15) UNIQUE
);