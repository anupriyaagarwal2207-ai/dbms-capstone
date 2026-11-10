WITH StockCalculation AS
(
    SELECT
        m.warehouse_id,
        m.product_id,
        m.movement_date,

        i.opening_quantity +

        SUM(
            CASE
                WHEN m.movement_type = 'IN'
                THEN m.quantity
                ELSE -m.quantity
            END
        ) OVER
        (
            PARTITION BY m.warehouse_id, m.product_id
            ORDER BY m.movement_date, m.movement_id
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS running_stock

    FROM InventoryMovements m

    JOIN Inventory i
        ON m.warehouse_id = i.warehouse_id
        AND m.product_id = i.product_id
)

SELECT
    warehouse_id,
    product_id,
    MIN(movement_date) AS stock_out_date

FROM StockCalculation

WHERE running_stock <= 0

GROUP BY warehouse_id, product_id;