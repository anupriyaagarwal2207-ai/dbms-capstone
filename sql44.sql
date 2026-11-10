SELECT
    logistics_id,
    transport_mode,
    distance_km,
    transportation_cost,
    ROUND(
        transportation_cost / NULLIF(distance_km, 0), 2
    ) AS cost_per_km
FROM Logistics
ORDER BY cost_per_km ASC;