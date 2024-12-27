

INSERT INTO Docking_Bay (Location, Capacity, Available, User_ID)
VALUES 
('West Dock', 60, 'Yes', 1),
('Central Dock', 80, 'No', 2),
('Island Dock', 70, 'Yes', 3),
('North Dock', 50, 'No', 1),
('South Dock', 90, 'Yes', 2),
('East Dock', 100, 'No', 3),
('Main Dock', 110, 'Yes', 3),
('Secondary Dock', 120, 'Yes', 2);


INSERT INTO Vessel (Name, Type, Weight, Capacity, Registration_number, Height, Width, Length, Status, Client_id, Bay_id)
VALUES
('Wave Runner', 'Cargo', 18000, 80, 1004, 18, 9, 28, 'Docked', 1, 1),
('Blue Horizon', 'Tanker', 35000, 160, 1005, 26, 13, 36, 'Departed', 2, 2),
('Golden Pearl', 'Cruise', 27000, 210, 1006, 23, 12, 40, 'Docked', 3, 3),
('Silver Wind', 'Container', 24000, 180, 1007, 20, 11, 32, 'Docked', 4, 4),
('Ocean Breeze', 'Cargo', 22000, 100, 1008, 25, 14, 35, 'Departed', 5, 5),
('Royal Sun', 'Tanker', 30000, 150, 1009, 24, 12, 38, 'Docked', 6, 6);

-- Insert 12 Shipments
INSERT INTO Shipment (Departure_date, Arrival_date, Weight, Cost, Destination, Status, Vessel_id)
VALUES 
('2024-11-01', '2024-11-05', 12000, 2000, 'New York', 'Delivered', 1),
('2024-11-02', '2024-11-06', 15000, 2500, 'London', 'In Transit', 2),
('2024-11-03', '2024-11-07', 10000, 1500, 'Paris', 'Delivered', 3),
('2024-11-04', '2024-11-08', 13000, 2200, 'Tokyo', 'Pending', 4),
('2024-11-05', '2024-11-09', 16000, 2800, 'Dubai', 'In Transit', 5),
('2024-11-06', '2024-11-10', 14000, 2300, 'Singapore', 'Pending', 6),
('2024-11-07', '2024-11-11', 11000, 1900, 'Sydney', 'Delivered', 1),
('2024-11-08', '2024-11-12', 17000, 2900, 'Los Angeles', 'In Transit', 2),
('2024-11-09', '2024-11-13', 18000, 3000, 'Hong Kong', 'Pending', 3),
('2024-11-10', '2024-11-14', 14000, 2300, 'Shanghai', 'Delivered', 4),
('2024-11-11', '2024-11-15', 16000, 2700, 'Berlin', 'In Transit', 5),
('2024-11-12', '2024-11-16', 15000, 2600, 'Mumbai', 'Delivered', 6);


INSERT INTO Cargo (Type, Weight, Quantity, Shipment_id)
VALUES 
('Electronics', 5000, 50, 1),
('Furniture', 8000, 20, 2),
('Textiles', 7000, 35, 3),
('Food Products', 4000, 40, 4),
('Vehicles', 10000, 15, 5),
('Chemicals', 6000, 25, 6),
('Construction Materials', 8000, 30, 7),
('Clothing', 3000, 70, 8),
('Machinery', 5000, 10, 9),
('Toys', 2000, 100, 10),
('Books', 4000, 50, 11),
('Pharmaceuticals', 7000, 20, 12),
('Cosmetics', 6000, 30, 1),
('Agricultural Products', 9000, 15, 2),
('Jewelry', 2000, 5, 3),
('Spices', 3000, 40, 4),
('Household Goods', 7000, 25, 5),
('Office Supplies', 8000, 15, 6),
('Petroleum', 15000, 10, 7),
('Electronics Accessories', 5000, 45, 8);


INSERT INTO Customs (Inspection_date, Amount, Vessel_id, User_ID, Client_id)
VALUES 
('2024-11-02', 500, 1, 1, 1),
('2024-11-03', 700, 2, 2, 2),
('2024-11-04', 600, 3, 3, 3),
('2024-11-05', 550, 4, 1, 4),
('2024-11-06', 650, 5, 2, 5),
('2024-11-07', 500, 6, 3, 6);


INSERT INTO Payment (Amount, Payment_date, Payment_method, Client_id)
VALUES 
(800, '2024-11-01', 'Credit Card', 1),
(500, '2024-11-02', 'Cash', 2),
(700, '2024-11-03', 'Bank Transfer', 3),
(600, '2024-11-04', 'Credit Card', 4),
(400, '2024-11-05', 'Cash', 5),
(300, '2024-11-06', 'Bank Transfer', 6);


INSERT INTO Notification (Date, Message, Client_id)
VALUES 
('2024-11-05', 'Your vessel "Wave Runner" has arrived at the dock.', 1),
('2024-11-07', 'Your vessel "Golden Pearl" has completed customs inspection.', 3),
('2024-11-08', 'Your vessel "Silver Wind" has arrived at the dock.', 4),
('2024-11-10', 'Your vessel "Royal Sun" has completed customs inspection.', 6),
('2024-11-11', 'Your vessel "Blue Horizon" has arrived at the dock.', 2),
('2024-11-13', 'Your vessel "Golden Pearl" has arrived at the dock.', 3),
('2024-11-14', 'Your vessel "Wave Runner" has completed customs inspection.', 1), 
('2024-11-15', 'Your vessel "Blue Horizon" has completed customs inspection.', 2),
('2024-11-15', 'Your vessel "Ocean Breeze" has arrived at the dock.', 5),
('2024-11-16', 'Your vessel "Ocean Breeze" has completed customs inspection.', 5),
('2024-11-17', 'Your vessel "Wave Runner" has departed the dock.', 1), 
('2024-11-19', 'Your vessel "Silver Wind" has completed customs inspection.', 4),
('2024-11-19', 'Your vessel "Blue Horizon" has departed the dock.', 2);
