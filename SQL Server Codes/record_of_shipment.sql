use earl_harbor;
SELECT 
    s.departure_date, 
    s.arrival_date, 
    s.weight AS shipment_weight, 
    s.cost, 
    s.status AS shipment_status, 
    v.name AS vessel_name, 
    v.type AS vessel_type, 
    db.location AS docking_bay_location, 
    c.type AS cargo_type, 
    c.weight AS cargo_weight, 
    p.amount AS payment_amount, 
    p.payment_date AS payment_date, 
    cu.result AS customs_result
FROM 
    Shipment s
JOIN Vessel v ON s.vessel_id = v.vessel_id
JOIN Docking_Bay db ON s.bay_id = db.bay_id
JOIN Cargo c ON s.shipment_id = c.shipment_id
JOIN Payment p ON s.shipment_id = p.shipment_id
JOIN Customs cu ON s.shipment_id = cu.shipment_id
WHERE s.arrival_date BETWEEN '2024-01-01' AND '2024-12-31';
