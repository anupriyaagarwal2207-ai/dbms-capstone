SELECT
    transport_mode,
    SUM(transportation_cost) AS total_cost
FROM Logistics
GROUP BY transport_mode;