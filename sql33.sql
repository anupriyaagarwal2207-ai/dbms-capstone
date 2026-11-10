WITH SupplierRanking AS
(
    SELECT
        p.product_name,
        s.supplier_name,
        sp.supply_cost,
        sp.lead_time_days,

        ROW_NUMBER() OVER
        (
            PARTITION BY sp.product_id
            ORDER BY
                sp.lead_time_days ASC,
                sp.supply_cost ASC
        ) AS supplier_rank

    FROM SupplierProducts sp

    JOIN Suppliers s
        ON sp.supplier_id = s.supplier_id

    JOIN Products p
        ON sp.product_id = p.product_id
)

SELECT
    product_name,
    supplier_name,
    supply_cost,
    lead_time_days,

    CASE
        WHEN supplier_rank = 1 THEN 'Primary Supplier'
        WHEN supplier_rank = 2 THEN 'Backup Supplier'
    END AS supplier_type

FROM SupplierRanking
WHERE supplier_rank <= 2;