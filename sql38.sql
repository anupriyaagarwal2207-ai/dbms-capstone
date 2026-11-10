SELECT
    product_id,
    warehouse_id,
    movement_date AS current_replenishment,

    LEAD(movement_date) OVER
    (
        PARTITION BY product_id, warehouse_id
        ORDER BY movement_date
    ) AS next_replenishment,

    DATEDIFF(
        LEAD(movement_date) OVER
        (
            PARTITION BY product_id, warehouse_id
            ORDER BY movement_date
        ),
        movement_date
    ) AS days_between_replenishments

FROM InventoryMovements

WHERE movement_type = 'IN';