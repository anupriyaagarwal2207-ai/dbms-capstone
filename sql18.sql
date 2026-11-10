SELECT
    logistics_id,
    transport_mode,
    distance_km,
    transportation_cost
FROM Logistics
ORDER BY transportation_cost ASC
LIMIT 1;