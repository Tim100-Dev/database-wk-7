USE salesDB;

SELECT OrderID, CustomerName, 
SUBSTRING_INDEX(Products, ',', 1) AS Product
FROM ProductDetail
UNION ALL
SELECT OrderID, CustomerName, 
SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', 2), ',', -1)
FROM ProductDetail
UNION ALL
SELECT OrderID, CustomerName, 
SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', 3), ',', -1)
FROM ProductDetail;

CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
