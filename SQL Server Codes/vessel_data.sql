SELECT v.Name AS vessel_name,
	   v.Height AS vessel_height,
	   v.Weight AS vessel_weight,
	   v.Status AS vessel_status, 
	   v.Capacity AS vessel_capacity, 
	   cl.Name AS client_name, 
	   d.Location AS dock_location, 
	   cu.Amount AS customs_amount, 
	   s.Cost AS shipment_cost
FROM Vessel v
JOIN Client cl ON v.Client_id = cl.Client_id
JOIN Docking_Bay d ON v.Bay_id = d.Bay_id
JOIN Customs cu ON v.Vessel_id = cu.Vessel_id
JOIN Shipment s ON v.Vessel_id = s.Vessel_id;

