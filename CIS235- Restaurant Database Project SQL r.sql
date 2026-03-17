
-- Database: `aldiwandb`
CREATE DATABASE  IF NOT EXISTS `aldiwandb`;
USE `aldiwandb`;

-- Table structure for table `person`
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50),
  `role` varchar(50),
  `password` varchar(20),
  `fullname` varchar(200),
  PRIMARY KEY (`person_id`)
);

INSERT INTO `person` VALUES 
(1,'Razan','Manager','rrr','Razan Alqahtani'),
(2,'Alreem ','user','aaa','Alreem Alkhaldi'),
(3,'Norah ','user','nnn','Norah Alharkan'),
(4,'Sara','user','sss','Sara Mohamed'),
(5,'Marwah','user','mmm','Marwah Ahmed'),
(6,'Samia','user','sss','Samia Saad');

-- Table structure for table `customer`
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(200),
  `address` varchar(255),
  `tel` varchar(20),
  PRIMARY KEY (`customer_id`)
);

INSERT INTO `customer` VALUES 
(1,'Ahmed Al-Mansoori','Building 14, Prince Faisal Street, Al-Dammam 32421','+966 55 123 4567'),
(2,'Fatima Al-Nasser','Apt 23, King Saud Road, Al-Dammam 31952','+966 50 234 5678'),
(3,'Abdullah Al-Harbi','Villa 8, Al-Raka District, Al-Dammam 34231','+966 56 345 6789'),
(4,'Sara Al-Sharif','Flat 12, Al-Faisaliah Street, Al-Dammam 31425','+966 54 456 7890'),
(5,'Khalid Al-Saud','House 7, Al-Quds Neighborhood, Al-Dammam 32114','+966 59 567 8901'),
(6,'Noor Al-Awadhi','Building 19, Al-Khalidiyah Area, Al-Dammam 31967','+966 58 678 9012'),
(7,'Omar Al-Farhan','Apartment 5, Al-Nakheel District, Al-Dammam 34321','+966 57 789 0123'),
(8,'Layla Al-Ghamdi','Villa 11, Al-Murjan Street, Al-Dammam 31987','+966 53 890 1234'),
(9,'Mohammed Al-Zahrani','Apt 3, Al-Waha Neighborhood, Al-Dammam 32213','+966 52 901 2345'),
(10,'AishaAl-Jaber','Flat 22, Al-Rashid Road, Al-Dammam 31456','+966 51 012 3456');

-- Table structure for table `menu_items`
CREATE TABLE `menu_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50),
  `price` double DEFAULT NULL,
  PRIMARY KEY (`item_id`)
);

-- Dumping data for table `menu_items`
INSERT INTO `menu_items` VALUES 
(1,'Pizza Heart',10),
(2,'Double Cheese Burger',20),
(3,'Burger',10.5),
(4,'Cheesesteak',15.5),
(5,'Cheesesteak Double',18.5),
(6,'Cheesesteak Fire',22.8),
(7,'Cola Bottle 2 Liter',10),
(8,'Cola Bottle 1 Liter',10),
(9,'Cola Can',3),
(10,'Frise',3),
(11,'Pasta Casserole',8.4),
(12,'Pasta Parmesan',10.2);

-- Table structure for table `orders`
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `type` varchar(50),
  `quantity` int DEFAULT NULL,
  `total_cost` double DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE SET DEFAULT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `person` (`person_id`) ON DELETE SET DEFAULT
);


-- Dumping data for table `orders`
INSERT INTO `orders` VALUES 
(1,1,1,'Cash',2,20),
(2,2,2,'Credit',1,10),
(3,1,3,'Takeaway',3,30),
(4,2,1,'Cash',4,40),
(5,3,4,'Takeaway',2,20),
(6,3,11,'Credit',2,22),
(7,4,2,'Takeaway',2,30),
(8,4,6,'Takeaway',2,30),
(9,5,12,'Credit',2,25),
(10,5,4,'Cash',2,22);


-- Table structure for table `paycredit`
CREATE TABLE `paycredit` (
  `pay_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `person_id` int NOT NULL,
  `cash_withdraw` double NOT NULL,
  `cardNo` varchar(200),
  `name_on_card` varchar(200),
  `expDate` date NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `paycredit_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET DEFAULT
);

-- Dumping data for table `paycredit`
INSERT INTO `paycredit` VALUES 
(1,2,2,50,'3423131456','Sara','2027-03-12'),
(2,2,2,40,'3423131456','Sara','2027-05-12'),
(3,3,3,44,'3423345456','Mohammed','2028-10-01'),
(4,4,3,35,'3423567654','Layla','2026-11-10'),
(5,5,6,20,'3423131987','Noor','2027-05-10'),
(6,6,6,28,'3423131123','Khalid','2028-04-23'),
(7,3,4,45,'3423131369','Khalid','2029-12-25'),
(8,3,4,15,'3423131687','Abdullah','2026-01-30'),
(9,4,4,27,'3423131753','Jaber','2027-05-20'),
(10,4,4,26,'3423131487','Al-Mansoori','2028-05-11'),
(11,6,3,35,'3423131669','Noor','2028-03-22');

-- Table structure for table `takeaway`
CREATE TABLE `takeaway` (
  `takeaway_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `delivery_fees` double NOT NULL,
  `customer_name` varchar(255),
  `customer_addr` varchar(255),
  `customer_tel` varchar(20),
  `amount_due` double NOT NULL,
  PRIMARY KEY (`takeaway_id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `takeaway_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET DEFAULT,
  CONSTRAINT `takeaway_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET DEFAULT
);

INSERT INTO `takeaway` VALUES 
(21,1,1,5,'Ahmed Al-Mansoori','Apt 3, Al-Waha Neighborhood, Al-Dammam 32213','+966 55 123 4567',25),
(22,2,2,6,'Fatima Al-Nasser','Apt 23, King Saud Road, Al-Dammam 31952','+966 50 234 5678',24),
(23,3,3,7,'Abdullah Al-Harbi','Building 14, Prince Faisal Street, Al-Dammam 32421','+966 56 345 6789',66),
(24,4,4,5,'Sara Al-Sharif','Villa 8, Al-Raka District, Al-Dammam 34231','+966 54 456 7890',48),
(25,5,5,6,'Khalid Al-Saud','Villa 11, Al-Murjan Street, Al-Dammam 31987','+966 59 567 8901',10),
(26,6,2,7,'Noor Al-Awadhi','Flat 12, Al-Faisaliah Street, Al-Dammam 31425','+966 58 678 9012',15),
(27,7,3,5,'Omar Al-Farhan','Building 19, Al-Khalidiyah Area, Al-Dammam 31967','+966 57 789 0123',62),
(28,8,4,6,'Layla Al-Ghamdi','Apartment 5, Al-Nakheel District, Al-Dammam 34321','+966 53 890 1234',24),
(29,9,5,7,'Mohammed Al-Zahrani','House 7, Al-Quds Neighborhood, Al-Dammam 32114','+966 52 901 2345',35),
(30,10,3,5,'AishaAl-Jaber','House 7, Al-Quds Neighborhood, Al-Dammam 32114','+966 51 012 3456',29);

-- Table structure for table `inventoryitem`
CREATE TABLE `inventoryitem` (
  `inv_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `description` varchar(255),
  `unit_price` decimal(10,2) NOT NULL,
  `reorder_quantity` int NOT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `inventoryitem_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE SET DEFAULT
);

-- Dumping data for table `inventoryitem`
INSERT INTO `inventoryitem` VALUES 
(1,'Beef Patties','Ground beef patties',2.50,30,1),
(2,'Burger Buns','Soft sesame buns',0.50,40,1),
(3,'Lettuce','Fresh iceberg lettuce',0.20,10,2),
(4,'Tomatoes','Ripe slicing tomatoes',0.30,15,2),
(5,'Cheese Slices','Cheddar cheese',0.40,20,1),
(6,'Onions','Red onions',0.15,10,2),
(7,'Pickles','Dill pickle slices',0.25,20,1),
(8,'Ketchup','Buckett of ketchup',1.00,5,3),
(9,'Mayonnaise','Buckett of mayonnaise',1.20,5,3),
(10,'Fries','Frozen fries',0.10,50,4);


-- ------------------------------------------------------------
-- ALL Queries required From Basic to Advanced, 
-- ------------------------------------------------------------


SELECT * FROM takeaway;

DELETE FROM takeaway WHERE order_id =2;

SELECT * FROM takeaway;

UPDATE takeaway SET customer_addr = "Dammam" WHERE customer_id = 3;

-- -----------------------------------------------------------
-- >>> Requirement 5 d. ii) 1. Union / Intersect / Difference
-- -----------------------------------------------------------

SELECT * FROM person WHERE name="Razan";
SELECT 
    name AS full_name,
    role AS role_or_type
FROM person
UNION
	SELECT 
		customer_name AS full_name,
		'Customer' AS role_or_type
	FROM customer;

SELECT p.name AS full_name
FROM person p
INNER JOIN customer c ON p.name = c.customer_name;

-- Find names in `person` but not in 
-- `customer` using LEFT JOIN
SELECT p.name AS name
FROM person p
LEFT JOIN customer c ON p.name = c.customer_name
WHERE c.customer_name IS NULL;

-- ------------------------------------------------------------
-- >>> Requirent 5 d. ii) 2. Distinct/ aggregate functions, In, 
-- >>> Between, ISNULL, NOT, LIKE
-- ------------------------------------------------------------
SELECT DISTINCT role FROM person;

SELECT SUM(total_cost) AS total_revenue
FROM orders;

SELECT 
    MIN(total_cost) AS min_order_cost,
    MAX(total_cost) AS max_order_cost
FROM orders;

SELECT person_id, name, role
FROM person
WHERE role IN ('Manager', 'user');

SELECT customer_id, customer_name, tel
FROM customer
WHERE tel BETWEEN '+966 55 000 0000' AND '+966 59 999 9999';

SELECT order_id, user_id, item_id, type, total_cost
FROM orders
WHERE total_cost BETWEEN 25.00 AND 30.00;

-- ----------------------------------------------------------
-- >>> Requiremnt 5 d. ii) 3. Nested queries, comparison queries 
-- >>> (ALL/ANY), Group By, Order By, Having, INTO, Case expression,
-- >>> and compute clause.
-- ----------------------------------------------------------


SELECT role, COUNT(*) AS user_count
FROM person
GROUP BY role;


SELECT person_id, name, role
FROM person ORDER BY name ASC;

SELECT customer_id, AVG(delivery_fees) AS avg_delivery_fee
FROM takeaway
GROUP BY customer_id
HAVING AVG(delivery_fees) > 5.00;

SELECT inv_id, name, SUM(reorder_quantity) AS total_reorder_quantity
FROM inventoryitem
GROUP BY inv_id, name
HAVING SUM(reorder_quantity) > 15;

SELECT order_id, user_id, item_id, type, total_cost,
    CASE 
        WHEN total_cost < 20 THEN 'Low'
        WHEN total_cost BETWEEN 20 AND 30 THEN 'Medium'
        ELSE 'High'
    END AS cost_category
FROM orders;

-- Procedure with no parameters
DELIMITER //
CREATE PROCEDURE CalculateTotalRevenue()
BEGIN
    SELECT SUM(total_cost) AS total_revenue FROM orders;
END //
DELIMITER ;
CALL CalculateTotalRevenue();

-- Procedure with 2 parameters
DELIMITER //
CREATE PROCEDURE UpdateInventoryItemPrice(
  IN item_id INT, IN new_price DECIMAL(10,2))
BEGIN
    UPDATE inventoryitem
    SET unit_price = new_price
    WHERE inv_id = item_id;
END //
DELIMITER ;
CALL UpdateInventoryItemPrice(1,20);

CREATE VIEW CustomerOrdersSummary AS
  SELECT c.customer_name, o.order_id, o.total_cost
  FROM customer c
  JOIN takeaway t ON c.customer_id = t.customer_id
  JOIN orders o ON t.order_id = o.order_id;
SELECT * FROM CustomerOrdersSummary;

 CREATE VIEW InventoryReorderList AS
	SELECT name, description, unit_price, reorder_quantity
		FROM inventoryitem
		WHERE reorder_quantity > 0;

SELECT * FROM InventoryReorderList;


-- >>> DDL
-- Create a new table for discounts
CREATE TABLE discounts (
    discount_id INT NOT NULL AUTO_INCREMENT,
    item_id INT NOT NULL,
    discount_percentage DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (discount_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- >>> DML
-- this DML is to show the results of the accomplished DDL statement above.
-- Insert a discount for menu item with item_id = 1
INSERT INTO discounts (item_id, discount_percentage, start_date, end_date)
VALUES (1, 15.00, '2023-11-01', '2023-11-30');
SELECT * FROM discounts;







