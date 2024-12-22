CREATE DATABASE earl_harbor;
USE earl_harbor;
CREATE TABLE Users(
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(10) NOT NULL UNIQUE,
    password VARCHAR(15) NOT NULL
);
CREATE TABLE Client (
    client_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telephone VARCHAR(15) NOT NULL
);
CREATE TABLE Vessel (
    vessel_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    type VARCHAR(60) NOT NULL,
    weight FLOAT NOT NULL CHECK (weight > 0),
    capacity INT NOT NULL CHECK (capacity > 0),
    registration_number VARCHAR(40) UNIQUE NOT NULL,
    height FLOAT NOT NULL,
    length FLOAT NOT NULL,
    status VARCHAR(10) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id)
);
CREATE TABLE Docking_Bay (
    bay_id INT IDENTITY(1,1) PRIMARY KEY,
    location VARCHAR(200) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0),
    available BIT
);
CREATE TABLE Shipment (
    shipment_id INT IDENTITY(1,1) PRIMARY KEY,
    departure_date DATE NOT NULL,
    arrival_date DATE NOT NULL,
    weight FLOAT NOT NULL,
    cost INT NOT NULL,
    destination VARCHAR(50) NOT NULL,
    status VARCHAR(30) DEFAULT 'Passed',
    vessel_id INT NOT NULL,
    bay_id INT NOT NULL,
    FOREIGN KEY (vessel_id) REFERENCES Vessel(vessel_id),
    FOREIGN KEY (bay_id) REFERENCES Docking_Bay(bay_id)
);
CREATE TABLE Contract (
    contract_id INT IDENTITY(1,1) PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    details VARCHAR(255) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id)
);
CREATE TABLE Inspector (
    inspector_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Customs (
    inspection_id INT IDENTITY(1,1) PRIMARY KEY,
    inspection_date DATE NOT NULL,
    result VARCHAR(30) NOT NULL,
    inspector_id INT NOT NULL,
    shipment_id INT NOT NULL,
    FOREIGN KEY (inspector_id) REFERENCES Inspector(inspector_id),
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id)
);
CREATE TABLE Maintenance_Record (
    record_id INT IDENTITY(1,1) PRIMARY KEY,
    record_date DATE NOT NULL,
    details VARCHAR(255) NOT NULL,
    vessel_id INT NOT NULL,
    FOREIGN KEY (vessel_id) REFERENCES Vessel(vessel_id)
);
CREATE TABLE Notification (
    notification_id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE NOT NULL,
    message VARCHAR(255) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id)
);
CREATE TABLE personnel (
    personnel_ID INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    role VARCHAR(20),
    email VARCHAR(40) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Cargo (
    cargo_id INT IDENTITY(1,1) PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    weight FLOAT NOT NULL CHECK (weight > 0),
    quantity INT NOT NULL CHECK (quantity > 0),
    shipment_id INT NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id)
);
CREATE TABLE Payment (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    amount DECIMAL(15,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    shipment_id INT NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id)
);
CREATE TABLE Logs (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    log_date DATE NOT NULL,
    description TEXT,
    personnel_id INT NOT NULL,
    vessel_id INT NOT NULL,
    FOREIGN KEY (personnel_id) REFERENCES personnel(personnel_ID),
    FOREIGN KEY (vessel_id) REFERENCES Vessel(vessel_id)
);