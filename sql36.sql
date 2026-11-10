SELECT
    warehouse_id,
    product_id,
    movement_date,
    movement_type,
    quantity,

    SUM(
        CASE
            WHEN movement_type = 'IN' THEN quantity
            ELSE -quantity
        END
    ) OVER
    (
        PARTITION BY warehouse_id, product_id
        ORDER BY movement_date, movement_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS net_movement,

    opening_quantity
    + SUM(
        CASE
            WHEN movement_type = 'IN' THEN quantity
            ELSE -quantity
        END
    ) OVER
    (
        PARTITION BY warehouse_id, product_id
        ORDER BY movement_date, movement_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_stock

FROM InventoryMovements m

JOIN Inventory i
    ON m.warehouse_id = i.warehouse_id
    AND m.product_id = i.product_id;