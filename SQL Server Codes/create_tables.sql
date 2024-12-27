CREATE TABLE Client
(
  Client_id INT IDENTITY(1, 1) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Telephone VARCHAR(20) NOT NULL,
  PRIMARY KEY (Client_id)
);

CREATE TABLE Notification
(
  Notification_id INT IDENTITY(1, 1) NOT NULL,
  Date DATE NOT NULL,
  Message VARCHAR(255) NOT NULL,
  Client_id INT NOT NULL,
  PRIMARY KEY (Notification_id),
  FOREIGN KEY (Client_id) REFERENCES Client(Client_id) ON DELETE CASCADE
);

CREATE TABLE Users
(
  ID INT IDENTITY(1, 1) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Password VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Docking_Bay
(
  Bay_id INT IDENTITY(1, 1) NOT NULL,
  Location VARCHAR(250) NOT NULL,
  Capacity INT NOT NULL,
  Available VARCHAR(50) NOT NULL,
  User_ID INT NOT NULL,
  PRIMARY KEY (Bay_id),
  FOREIGN KEY (User_ID) REFERENCES Users(ID) ON DELETE CASCADE
);

CREATE TABLE Payment
(
  Payment_id INT IDENTITY(1, 1) NOT NULL,
  Amount INT NOT NULL,
  Payment_date DATE NOT NULL,
  Payment_method VARCHAR(50) NOT NULL,
  Client_id INT NOT NULL UNIQUE,
  PRIMARY KEY (Payment_id),
  FOREIGN KEY (Client_id) REFERENCES Client(Client_id) ON DELETE CASCADE
);

CREATE TABLE Vessel
(
  Vessel_id INT IDENTITY(1, 1) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Type VARCHAR(50) NOT NULL,
  Weight INT NOT NULL,
  Capacity INT NOT NULL,
  Registration_number INT NOT NULL,
  Height INT NOT NULL,
  Width INT NOT NULL,
  Length INT NOT NULL,
  Status VARCHAR(50) NOT NULL,
  Client_id INT NOT NULL,
  Bay_id INT NOT NULL,
  PRIMARY KEY (Vessel_id),
  FOREIGN KEY (Client_id) REFERENCES Client(Client_id) ON DELETE CASCADE,
  FOREIGN KEY (Bay_id) REFERENCES Docking_Bay(Bay_id) ON DELETE CASCADE
);

CREATE TABLE Shipment
(
  Shipment_id INT IDENTITY(1, 1) NOT NULL,
  Departure_date DATE NOT NULL,
  Arrival_date DATE NOT NULL,
  Weight INT NOT NULL,
  Cost INT NOT NULL,
  Destination VARCHAR(100) NOT NULL,
  Status VARCHAR(50) NOT NULL,
  Vessel_id INT NOT NULL,
  PRIMARY KEY (Shipment_id),
  FOREIGN KEY (Vessel_id) REFERENCES Vessel(Vessel_id) ON DELETE CASCADE
);

CREATE TABLE Customs
(
  Inspection_id INT IDENTITY(1, 1) NOT NULL,
  Inspection_date DATE NOT NULL,
  Amount INT NOT NULL,
  Vessel_id INT NOT NULL UNIQUE,
  User_ID INT NOT NULL,
  Client_id INT NOT NULL,
  PRIMARY KEY (Inspection_id),
  FOREIGN KEY (Vessel_id) REFERENCES Vessel(Vessel_id) ON DELETE CASCADE,
  FOREIGN KEY (User_ID) REFERENCES Users(ID),
  FOREIGN KEY (Client_id) REFERENCES Client(Client_id)
);

CREATE TABLE Cargo
(
  Cargo_id INT IDENTITY(1, 1) NOT NULL,
  Type VARCHAR(50) NOT NULL,
  Weight INT NOT NULL,
  Quantity INT NOT NULL,
  Shipment_id INT,
  PRIMARY KEY (Cargo_id),
  FOREIGN KEY (Shipment_id) REFERENCES Shipment(Shipment_id) ON DELETE CASCADE
);
