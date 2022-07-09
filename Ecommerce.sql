DROP DATABASE if exists e_commerce; 
create database if not exists e_commerce;
use e_commerce;

-- 1) You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the Ecommerce with the schema definition given below
CREATE TABLE IF NOT EXISTS `supplier` (
    `SUPP_ID` INT PRIMARY KEY,
    `SUPP_NAME` VARCHAR(50) NOT NULL,
    `SUPP_CITY` VARCHAR(50) NOT NULL,
    `SUPP_PHONE` VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `customer` (
    `CUS_ID` INT PRIMARY KEY,
    `CUS_NAME` VARCHAR(20) NOT NULL,
    `CUS_PHONE` VARCHAR(10) NOT NULL,
    `CUS_CITY` VARCHAR(30) NOT NULL,
    `CUS_GENDER` CHAR    
);

CREATE TABLE IF NOT EXISTS `category` (
    `CAT_ID` INT PRIMARY KEY,
    `CAT_NAME` VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `product` (
    `PRO_ID` INT PRIMARY KEY,
    `PRO_NAME` VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    `PRO_DESC` VARCHAR(60) NULL DEFAULT NULL,
    `CAT_ID` INT NOT NULL,
    FOREIGN KEY (`CAT_ID`)
        REFERENCES category (`CAT_ID`)
);

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
    `PRICING_ID` INT PRIMARY KEY,
    `PRO_ID` INT NOT NULL,
    `SUPP_ID` INT NOT NULL,
    `SUPP_PRICE` INT NOT NULL,
    FOREIGN KEY (`PRO_ID`)
        REFERENCES product (`PRO_ID`),
    FOREIGN KEY (`SUPP_ID`)
        REFERENCES supplier (`SUPP_ID`)
);

CREATE TABLE IF NOT EXISTS `order` (
    `ORD_ID` INT PRIMARY KEY,
    `ORD_AMOUNT` INT NOT NULL,
    `ORD_DATE` DATE,
    `CUS_ID` INT NOT NULL,
    `PRICING_ID` INT NOT NULL,
    FOREIGN KEY (`CUS_ID`)
        REFERENCES customer (`CUS_ID`),
    FOREIGN KEY (`PRICING_ID`)
        REFERENCES supplier_pricing (`PRICING_ID`)
);

CREATE TABLE IF NOT EXISTS `rating` (
    `RAT_ID` INT PRIMARY KEY,
    `ORD_ID` INT NOT NULL,
    `RAT_RATSTARS` INT NOT NULL,
    FOREIGN KEY (`ORD_ID`)
        REFERENCES `order` (`ORD_ID`)
);

-- 2) Insert the following data in the table created above
INSERT INTO `supplier` VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO `supplier` VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO `supplier` VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO `supplier` VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO `supplier` VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO `customer` VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO `customer` VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO `customer` VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO `customer` VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO `customer` VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO `category` VALUES( 1,"BOOKS");
INSERT INTO `category` VALUES(2,"GAMES");
INSERT INTO `category` VALUES(3,"GROCERIES");
INSERT INTO `category` VALUES(4,"ELECTRONICS");
INSERT INTO `category` VALUES(5,"CLOTHES");

INSERT INTO `product` VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO `product` VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations ",5);
INSERT INTO `product` VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO `product` VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO `product` VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO `product` VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO `product` VALUES(7,"Boat Earphones","1.5Meter long Dolby Atmos",4);
INSERT INTO `product` VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO `product` VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO `product` VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO `product` VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO `product` VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO `supplier_pricing` VALUES(1,1,2,1500);
INSERT INTO `supplier_pricing` VALUES(2,3,5,30000);
INSERT INTO `supplier_pricing` VALUES(3,5,1,3000);
INSERT INTO `supplier_pricing` VALUES(4,2,3,2500);
INSERT INTO `supplier_pricing` VALUES(5,4,1,1000);
-- Values are not given in pdf but then taken from order table
INSERT INTO `supplier_pricing` VALUES(6,4,1,1000);
INSERT INTO `supplier_pricing` VALUES(7,12,2,780);
INSERT INTO `supplier_pricing` VALUES(8,12,4,789);
INSERT INTO `supplier_pricing` VALUES(9,3,1,31000);
INSERT INTO `supplier_pricing` VALUES(10,1,5,1450);
INSERT INTO `supplier_pricing` VALUES(11,4,2,999);
INSERT INTO `supplier_pricing` VALUES(12,7,3,549);
INSERT INTO `supplier_pricing` VALUES(13,7,4,529);
INSERT INTO `supplier_pricing` VALUES(14,6,2,99);

INSERT INTO `order` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `order` VALUES (102,1000,"2021-10-12",3,5);
INSERT INTO `order` VALUES (103,30000,"2021-09-16",5,2);
INSERT INTO `order` VALUES (104,1500,"2021-10-05",1,1);
INSERT INTO `order` VALUES (105,3000,"2021-08-16",4,3);
INSERT INTO `order` VALUES (106,1450,"2021-08-18",1,9);
INSERT INTO `order` VALUES (107,789,"2021-09-01",3,7);
INSERT INTO `order` VALUES (108,780,"2021-09-07",5,6);
-- In Lab 4 PDF date provided is 2021-00-10, which is incorrect, below line will INSERT 0000-00-00 in row
INSERT INTO `order` VALUES (109,3000,"2021-00-10",5,3);
INSERT INTO `order` VALUES (110,2500,"2021-09-10",2,4);
INSERT INTO `order` VALUES (111,1000,"2021-09-15",4,5);
INSERT INTO `order` VALUES (112,789,"2021-09-16",4,7);
INSERT INTO `order` VALUES (113,31000,"2021-09-16",1,8);
INSERT INTO `order` VALUES (114,1000,"2021-09-16",3,5);
INSERT INTO `order` VALUES (115,3000,"2021-09-16",5,3);
INSERT INTO `order` VALUES (116,99,"2021-09-17",2,14);

INSERT INTO `rating` VALUES(1,101,4);
INSERT INTO `rating` VALUES(2,102,3);
INSERT INTO `rating` VALUES(3,103,1);
INSERT INTO `rating` VALUES(4,104,2);
INSERT INTO `rating` VALUES(5,105,4);
INSERT INTO `rating` VALUES(6,106,3);
INSERT INTO `rating` VALUES(7,107,4);
INSERT INTO `rating` VALUES(8,108,4);
INSERT INTO `rating` VALUES(9,109,3);
INSERT INTO `rating` VALUES(10,110,5);
INSERT INTO `rating` VALUES(11,111,3);
INSERT INTO `rating` VALUES(12,112,4);
INSERT INTO `rating` VALUES(13,113,2);
INSERT INTO `rating` VALUES(14,114,1);
INSERT INTO `rating` VALUES(15,115,1);
INSERT INTO `rating` VALUES(16,116,0);

-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
SELECT c.CUS_GENDER, COUNT(o.ORD_ID) AS Count FROM `order` o INNER JOIN `customer` c ON o.CUS_ID = c.CUS_ID WHERE o.ORD_AMOUNT >= 3000 GROUP BY c.CUS_GENDER;

-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT o.*, p.PRO_NAME FROM `order` o, supplier_pricing sp, product p WHERE o.CUS_ID = 2 AND o.PRICING_ID = sp.PRICING_ID AND sp.PRO_ID = p.PRO_ID;
        
-- 5) Display the Supplier details who can supply more than one product.
SELECT * FROM supplier s WHERE s.SUPP_ID IN 
(SELECT SUPP_ID FROM supplier_pricing GROUP BY SUPP_ID HAVING COUNT(SUPP_ID) > 1);

-- 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
SELECT (SELECT (SELECT c.CAT_ID FROM category c  WHERE c.CAT_ID = p.CAT_ID) FROM product p WHERE p.PRO_ID = sp.PRO_ID) AS cat_id, 
(SELECT (SELECT c.CAT_NAME FROM category c WHERE c.CAT_ID = p.CAT_ID) FROM product p WHERE p.PRO_ID = sp.PRO_ID) AS category,
(SELECT p.PRO_NAME FROM product p WHERE p.PRO_ID = sp.PRO_ID) AS product, MIN(supp_price) AS supp_price FROM supplier_pricing AS sp
GROUP BY category
order BY cat_id ASC;
            
-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT p.pro_id, p.pro_name FROM `order` o INNER JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID INNER JOIN product p ON p.PRO_ID = sp.PRO_ID WHERE o.ORD_DATE > '2021-10-05';
    
-- 8) Display customer name and gender whose names start or end with character 'A'
SELECT * FROM customer c WHERE c.CUS_NAME LIKE 'A%' OR c.CUS_NAME LIKE '%A';

-- 9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent	Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
DELIMITER //
CREATE PROCEDURE `supplierRatings` ()
BEGIN
SELECT sp.SUPP_ID, s.SUPP_NAME, (sum(r.RAT_RATSTARS)/count(r.RAT_RATSTARS) ) AS average_rating, (CASE
         WHEN (sum(r.RAT_RATSTARS)/count(r.RAT_RATSTARS) ) = 5 THEN 'Excellent Service'
         WHEN (sum(r.RAT_RATSTARS)/count(r.RAT_RATSTARS) ) > 4 THEN 'Good Service'
         WHEN (sum(r.RAT_RATSTARS)/count(r.RAT_RATSTARS) ) > 2 THEN 'Average Service'
         ELSE 'Poor Service'
        END) as type_of_service  FROM rating r INNER JOIN `order` o ON o.ORD_ID = r.ORD_ID INNER JOIN supplier_pricing sp ON sp.PRICING_ID = o.PRICING_ID INNER JOIN supplier s ON s.SUPP_ID = sp.SUPP_ID
		  GROUP BY sp.SUPP_ID, s.SUPP_NAME order BY sp.SUPP_ID ASC;
END //
DELIMITER ;

call supplierRatings();
