CREATE TABLE Logistics (
    logistics_id INT AUTO_INCREMENT PRIMARY KEY,
    po_id INT NOT NULL,
    distributor_id INT NOT NULL,
    transport_mode VARCHAR(50),
    distance_km DECIMAL(10,2),
    transportation_cost DECIMAL(10,2),
    delivery_date DATE,
    FOREIGN KEY (po_id)
        REFERENCES PurchaseOrders(po_id),
    FOREIGN KEY (distributor_id)
        REFERENCES Distributors(distributor_id),
    CHECK (distance_km >= 0),
    CHECK (transportation_cost >= 0)
);