SELECT
    p.product_name,
    SUM(i.quantity * p.unit_price) AS inventory_value
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY p.product_name
ORDER BY inventory_value DESC;