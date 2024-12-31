CREATE DATABASE CustomerInsuranceProfiles_DB; 
USE CustomerInsuranceProfiles_DB; 

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactInfo VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL
);

CREATE TABLE InsurancePolicy (
    PolicyID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    PolicyType VARCHAR(100) NOT NULL,
    CoverageAmount DECIMAL(15, 2) NOT NULL,
    Premium DECIMAL(10, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Claim (
    ClaimID INT AUTO_INCREMENT PRIMARY KEY,
    PolicyID INT NOT NULL,
    CustomerID INT NOT NULL,
    ClaimDate DATE NOT NULL,
    ClaimAmount DECIMAL(15, 2) NOT NULL,
    ClaimStatus VARCHAR(50) NOT NULL,
    ApprovalDate DATE,
    FOREIGN KEY (PolicyID) REFERENCES InsurancePolicy(PolicyID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Customer (Name, DateOfBirth, ContactInfo, Address)
VALUES
    ('Roshan Dulal', '1990-01-01', 'roshan.dulal@gmail.com', 'Tindobato, Banepa'),
    ('Rahul Malla', '1985-05-15', 'rahul.malla@hotmail.com', 'Gathaghar, Bhaktapur'),
    ('Saroj Sigdel', '1992-03-22', 'saroj.sigdel@gmail.com', '28 kilo, Dhulikhel'),
    ('Suyog Sapkota', '1994-07-30', 'suyog.sapkota@hotmail.com', 'Kushadevi, Kabhrepalanchok'),
    ('Pragesh Shrestha', '1988-11-10', 'pragesh.shrestha@gmail.com', 'Sagbari, Chitwan'),
    ('Basanti Rimal', '1995-09-18', 'basanti.rimal@hotmail.com', 'Tamnagar, Butwal');

INSERT INTO InsurancePolicy (CustomerID, PolicyType, CoverageAmount, Premium, StartDate, EndDate)
VALUES
    (1, 'Life', 500000.00, 2500.00, '2020-01-01', '2030-01-01'),
    (1, 'Health', 200000.00, 1500.00, '2021-06-15', '2024-06-15'),
    (2, 'Vehicle', 100000.00, 1200.00, '2022-04-10', '2025-04-10'),
    (2, 'Health', 250000.00, 1800.00, '2020-08-05', '2023-08-05'),
    (3, 'Life', 700000.00, 3000.00, '2019-11-20', '2029-11-20'),
    (3, 'Vehicle', 150000.00, 1100.00, '2023-02-01', '2026-02-01'),
    (4, 'Life', 600000.00, 2700.00, '2022-05-10', '2032-05-10'),
    (4, 'Health', 300000.00, 2000.00, '2021-12-01', '2024-12-01'),
    (5, 'Vehicle', 180000.00, 1300.00, '2020-10-15', '2023-10-15'),
    (6, 'Life', 750000.00, 3200.00, '2023-07-10', '2033-07-10');

INSERT INTO Claim (PolicyID, CustomerID, ClaimDate, ClaimAmount, ClaimStatus, ApprovalDate)
VALUES
    (1, 1, '2022-03-01', 100000.00, 'Approved', '2022-03-10'),
    (2, 1, '2023-07-15', 50000.00, 'Pending', NULL),
    (3, 2, '2021-05-20', 20000.00, 'Approved', '2021-06-01'),
    (4, 3, '2022-11-10', 150000.00, 'Rejected', '2022-11-15'),
    (5, 4, '2023-01-25', 75000.00, 'Approved', '2023-02-05'),
    (6, 5, '2023-08-12', 12000.00, 'Pending', NULL);

SELECT * FROM Customer;

SELECT * FROM InsurancePolicy;

SELECT * FROM Claim;

SELECT * FROM Claim
WHERE ClaimStatus = 'Approved';

SELECT Name, ContactInfo FROM Customer;

SELECT * FROM Customer, Claim; 

SELECT Name as Name FROM Customer
UNION
SELECT PolicyType as Name FROM InsurancePolicy;

SELECT CoverageAmount AS Amount FROM InsurancePolicy
INTERSECT
SELECT ClaimAmount AS Amount FROM Claim;

SELECT CustomerID AS CustomerID FROM InsurancePolicy
EXCEPT
SELECT CustomerID AS Amount FROM Claim;

SELECT Customer.Name, InsurancePolicy.PolicyType
FROM Customer
INNER JOIN InsurancePolicy ON Customer.CustomerID = InsurancePolicy.CustomerID;

SELECT InsurancePolicy.PolicyType, Claim.ClaimStatus
FROM InsurancePolicy
LEFT JOIN Claim ON InsurancePolicy.PolicyID = Claim.PolicyID;

SELECT Claim.ClaimDate, Customer.Name
FROM Claim
RIGHT JOIN Customer ON Claim.CustomerID = Customer.CustomerID;

SELECT Customer.Name, InsurancePolicy.PolicyType
FROM Customer
LEFT JOIN InsurancePolicy ON Customer.CustomerID = InsurancePolicy.CustomerID
UNION
SELECT Customer.Name, InsurancePolicy.PolicyType
FROM Customer
RIGHT JOIN InsurancePolicy ON Customer.CustomerID = InsurancePolicy.CustomerID;





