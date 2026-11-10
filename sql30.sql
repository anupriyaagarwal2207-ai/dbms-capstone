CREATE VIEW Supplier_Scorecard AS
SELECT
    s.supplier_id,
    s.supplier_name,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN po.actual_delivery_date IS NOT NULL
                AND po.actual_delivery_date <= po.expected_delivery_date
                THEN 1
                ELSE 0
            END
        ) /
        NULLIF(COUNT(po.po_id), 0), 2
    ) AS on_time_delivery_percentage,

    ROUND(
        AVG(
            DATEDIFF(
                po.actual_delivery_date,
                po.order_date
            )
        ), 2
    ) AS average_lead_time,

    ROUND(
        100.0 * SUM(COALESCE(po.defective_quantity, 0)) /
        NULLIF(SUM(po.quantity), 0), 2
    ) AS defect_rate

FROM Suppliers s
LEFT JOIN PurchaseOrders po
    ON s.supplier_id = po.supplier_id

GROUP BY
    s.supplier_id,
    s.supplier_name;
SELECT * FROM Supplier_Scorecard;    
    