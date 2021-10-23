
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `los_pollos_hermanos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `los_pollos_hermanos`;
DROP TABLE IF EXISTS `Accountant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accountant` (
  `Employee_ID` varchar(50) NOT NULL,
  `Money_Laundered` decimal(13,2) DEFAULT NULL,
  `Ltnt_Emp_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Accountant_ibfk_2` (`Ltnt_Emp_ID`),
  CONSTRAINT `Accountant_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `Accountant_ibfk_2` FOREIGN KEY (`Ltnt_Emp_ID`) REFERENCES `Lieutenant` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Accountant` WRITE;
/*!40000 ALTER TABLE `Accountant` DISABLE KEYS */;
INSERT INTO `Accountant` VALUES ('ACC101',7500.00,'LIU101'),('ACC201',5000.00,'LIU201'),('ACC301',10000.00,'LIU301');
/*!40000 ALTER TABLE `Accountant` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buys` (
  `Customer_ID` varchar(50) NOT NULL,
  `Drug_ID` varchar(50) NOT NULL,
  `Falc_Emp_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`Customer_ID`,`Drug_ID`,`Falc_Emp_ID`),
  KEY `Buys_ibfk_2` (`Drug_ID`),
  KEY `Buys_ibfk_3` (`Falc_Emp_ID`),
  CONSTRAINT `Buys_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`),
  CONSTRAINT `Buys_ibfk_2` FOREIGN KEY (`Drug_ID`) REFERENCES `Drug` (`Drug_ID`),
  CONSTRAINT `Buys_ibfk_3` FOREIGN KEY (`Falc_Emp_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Buys` WRITE;
/*!40000 ALTER TABLE `Buys` DISABLE KEYS */;
INSERT INTO `Buys` VALUES ('C01','D01','FAL101'),('C03','D02','FAL101'),('C06','D02','FAL302'),('C10','D02','FAL102'),('C08','D03','FAL203'),('C09','D03','FAL103'),('C02','D04','FAL101'),('C07','D04','FAL303'),('C04','D05','FAL201'),('C05','D05','FAL301');
/*!40000 ALTER TABLE `Buys` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Cust_Phone_Num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cust_Phone_Num` (
  `Customer_ID` varchar(50) NOT NULL,
  `Phone_Number` int NOT NULL,
  PRIMARY KEY (`Customer_ID`,`Phone_Number`),
  CONSTRAINT `Cust_Phone_Num_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Cust_Phone_Num` WRITE;
/*!40000 ALTER TABLE `Cust_Phone_Num` DISABLE KEYS */;
INSERT INTO `Cust_Phone_Num` VALUES ('C01',20000000),('C01',20000010),('C02',20000001),('C03',20000002),('C03',20000011),('C04',20000003),('C05',20000004),('C05',20000012),('C06',20000005),('C07',20000006),('C07',20000013),('C08',20000007),('C09',20000008),('C09',20000014),('C10',20000009);
/*!40000 ALTER TABLE `Cust_Phone_Num` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Customer_ID` varchar(50) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Amount_Received` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('C01','John','Smith',225.00),('C02','Mike','Lowry',500.00),('C03','DJ','Khalid',750.00),('C04','Drake','Remoray',250.00),('C05','Sebastian','Stan',500.00),('C06','Tom','Hardy',50.00),('C07','Tom','Holland',1000.00),('C08','Steve','Smith',500.00),('C09','Chris','Evans',100.00),('C10','Chris','Hemsworth',750.00);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Distribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distribute` (
  `Ltnt_Emp_ID` varchar(50) NOT NULL,
  `Drug_ID` varchar(50) NOT NULL,
  `Falc_Emp_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`Ltnt_Emp_ID`,`Drug_ID`,`Falc_Emp_ID`),
  KEY `Distribute_ibfk_2` (`Drug_ID`),
  KEY `Distribute_ibfk_3` (`Falc_Emp_ID`),
  CONSTRAINT `Distribute_ibfk_1` FOREIGN KEY (`Ltnt_Emp_ID`) REFERENCES `Lieutenant` (`Employee_ID`),
  CONSTRAINT `Distribute_ibfk_2` FOREIGN KEY (`Drug_ID`) REFERENCES `Drug` (`Drug_ID`),
  CONSTRAINT `Distribute_ibfk_3` FOREIGN KEY (`Falc_Emp_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Distribute` WRITE;
/*!40000 ALTER TABLE `Distribute` DISABLE KEYS */;
INSERT INTO `Distribute` VALUES ('LIU101','D01','FAL101'),('LIU101','D02','FAL102'),('LIU201','D02','FAL202'),('LIU301','D02','FAL302'),('LIU101','D03','FAL103'),('LIU201','D03','FAL203'),('LIU101','D04','FAL101'),('LIU301','D04','FAL303'),('LIU201','D05','FAL201'),('LIU301','D05','FAL301');
/*!40000 ALTER TABLE `Distribute` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drug` (
  `Drug_ID` varchar(50) NOT NULL,
  `Drug_Name` varchar(50) DEFAULT NULL,
  `Purity` float DEFAULT NULL,
  `Pkg_Weight` float DEFAULT NULL,
  `Total_Pkg_buy` int DEFAULT NULL,
  `Total_Pkg_sell` int DEFAULT NULL,
  PRIMARY KEY (`Drug_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Drug` WRITE;
/*!40000 ALTER TABLE `Drug` DISABLE KEYS */;
INSERT INTO `Drug` VALUES ('D01','Meth',87.5,250,500,375),('D02','LSD',75,200,750,500),('D03','MDMA',92.75,100,100,95),('D04','Heroin',95,150,1000,790),('D05','Cocaine',80,100,250,200);
/*!40000 ALTER TABLE `Drug` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Emp_Phone_Num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Emp_Phone_Num` (
  `Employee_ID` varchar(50) NOT NULL,
  `Phone_Number` int NOT NULL,
  PRIMARY KEY (`Employee_ID`,`Phone_Number`),
  CONSTRAINT `Emp_Phone_Num_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Emp_Phone_Num` WRITE;
/*!40000 ALTER TABLE `Emp_Phone_Num` DISABLE KEYS */;
INSERT INTO `Emp_Phone_Num` VALUES ('ACC101',10000034),('ACC101',10000042),('ACC201',10000035),('ACC201',10000036),('FAL101',10000025),('FAL101',10000041),('FAL102',10000026),('FAL103',10000027),('FAL201',10000028),('FAL202',10000029),('FAL203',10000030),('FAL301',10000031),('FAL302',10000032),('FAL303',10000033),('LIU101',10000022),('LIU101',10000040),('LIU201',10000023),('LIU301',10000024),('RGM101',10000004),('RGM101',10000038),('RGM201',10000005),('RGM301',10000006),('SOL101',10000007),('SOL101',10000039),('SOL102',10000008),('SOL103',10000009),('SOL104',10000010),('SOL105',10000011),('SOL201',10000012),('SOL202',10000013),('SOL203',10000014),('SOL204',10000015),('SOL205',10000016),('SOL301',10000017),('SOL302',10000018),('SOL303',10000019),('SOL304',10000020),('SOL305',10000021),('SUP101',10000000),('SUP101',10000037),('SUP102',10000001),('SUP201',10000002),('SUP301',10000003);
/*!40000 ALTER TABLE `Emp_Phone_Num` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_ID` varchar(50) NOT NULL,
  `Organisation_Name` varchar(50) DEFAULT NULL,
  `Employee_Type` varchar(50) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Region_ID` varchar(50) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Salary` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('ACC101','Medellin Cartel','Accountant','2011-07-29',NULL,'#A1','Ishant','Sharma','2000-01-01',25000.00),('ACC201','Medellin Cartel','Accountant','2010-07-29',NULL,'#A2','Umesh','Yadav','2000-02-02',25000.00),('ACC301','Medellin Cartel','Accountant','2009-07-29',NULL,'#A3','Navdeep','Saini','2000-03-03',25000.00),('FAL101','Medellin Cartel','Falcon','2011-07-29',NULL,'#A1','Mayank','Agarwal','2000-04-01',7000.00),('FAL102','Medellin Cartel','Falcon','2010-07-29',NULL,'#A1','Dinesh','Karthik','2001-04-02',7000.00),('FAL103','Medellin Cartel','Falcon','2011-08-29',NULL,'#A1','Kedar','Jadhav','2002-04-03',7000.00),('FAL201','Medellin Cartel','Falcon','2011-07-29',NULL,'#A2','Ravi','Ashwin','2000-02-01',7000.00),('FAL202','Medellin Cartel','Falcon','2010-07-29',NULL,'#A2','Hardik','Pandya','2001-02-02',7000.00),('FAL203','Medellin Cartel','Falcon','2011-08-29',NULL,'#A2','Krunal','Pandya','2002-02-03',7000.00),('FAL301','Medellin Cartel','Falcon','2011-07-29',NULL,'#A3','Shikhar','Dhawan','2000-03-01',7000.00),('FAL302','Medellin Cartel','Falcon','2010-07-29',NULL,'#A3','Cheteshwar','Pujara','2001-03-02',7000.00),('FAL303','Medellin Cartel','Falcon','2011-08-29',NULL,'#A3','Ajinkya','Rahane','2002-03-03',7000.00),('LIU101','Medellin Cartel','Lieutenant','2010-09-29',NULL,'#A1','Shardul','Thakur','2003-01-04',50000.00),('LIU201','Medellin Cartel','Lieutenant','2010-06-25',NULL,'#A2','Mohommad','Shami','2001-02-02',50000.00),('LIU301','Medellin Cartel','Lieutenant','2000-08-19',NULL,'#A3','Kuldeep','yadav','2000-03-11',50000.00),('RGM101','Medellin Cartel','Regional Manager','2010-07-29',NULL,'#A1','Evan','Tony','2003-04-04',52000.00),('RGM201','Medellin Cartel','Regional Manager','2012-06-25',NULL,'#A2','Naman','Sharma','2001-02-02',48000.00),('RGM301','Medellin Cartel','Regional Manager','2009-08-19',NULL,'#A3','Nevan','Dsouza','2000-11-11',60000.00),('SOL101','Medellin Cartel','Soldier','2011-07-29',NULL,'#A1','Khush','Patel','2002-04-04',5000.00),('SOL102','Medellin Cartel','Soldier','2010-07-29',NULL,'#A1','Dev','Shah','2003-04-04',5000.00),('SOL103','Medellin Cartel','Soldier','2011-08-29',NULL,'#A1','Yash','Mehan','2001-04-04',5000.00),('SOL104','Medellin Cartel','Soldier','2010-08-29',NULL,'#A1','Jaskaran','Singh','2000-04-04',5000.00),('SOL105','Medellin Cartel','Soldier','2011-09-29',NULL,'#A1','Rahul','Chahar','1999-04-04',5000.00),('SOL201','Medellin Cartel','Soldier','2011-07-29',NULL,'#A2','Virat','Kohli','2002-02-01',5000.00),('SOL202','Medellin Cartel','Soldier','2010-07-29',NULL,'#A2','Rohit','Sharma','2003-02-02',5000.00),('SOL203','Medellin Cartel','Soldier','2011-08-29',NULL,'#A2','Ravindra','Jadeja','2001-02-03',5000.00),('SOL204','Medellin Cartel','Soldier','2010-08-29',NULL,'#A2','Mahendra','Dhoni','2000-02-04',5000.00),('SOL205','Medellin Cartel','Soldier','2011-09-29',NULL,'#A2','Ravi','Shastri','1999-02-05',5000.00),('SOL301','Medellin Cartel','Soldier','2011-07-29',NULL,'#A3','Lokesh','Rahul','2002-03-01',5000.00),('SOL302','Medellin Cartel','Soldier','2010-07-29',NULL,'#A3','Yuzi','Chahal','2003-03-02',5000.00),('SOL303','Medellin Cartel','Soldier','2011-08-29',NULL,'#A3','Robin','Uthappa','2001-03-03',5000.00),('SOL304','Medellin Cartel','Soldier','2010-08-29',NULL,'#A3','Rishabh','Pant','2000-03-04',5000.00),('SOL305','Medellin Cartel','Soldier','2011-09-29',NULL,'#A3','Jasprit','Bumrah','1999-03-05',5000.00),('SUP101','Medellin Cartel','Supplier','2010-06-19',NULL,'#A1','Darsh','Parikh','2003-03-03',12000.00),('SUP102','Medellin Cartel','Supplier','2011-07-20',NULL,'#A1','Jayant','Reddy','2002-02-02',10000.00),('SUP201','Medellin Cartel','Supplier','2012-08-21',NULL,'#A2','Jainam','Gandhi','2001-01-01',8000.00),('SUP301','Medellin Cartel','Supplier','2009-09-09',NULL,'#A3','Nish','Patel','2000-10-10',18000.00);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Falcon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Falcon` (
  `Employee_ID` varchar(50) NOT NULL,
  `Territory_ID` varchar(50) DEFAULT NULL,
  `Ltnt_Emp_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Falcon_ibfk_2` (`Ltnt_Emp_ID`),
  CONSTRAINT `Falcon_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `Falcon_ibfk_2` FOREIGN KEY (`Ltnt_Emp_ID`) REFERENCES `Lieutenant` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Falcon` WRITE;
/*!40000 ALTER TABLE `Falcon` DISABLE KEYS */;
INSERT INTO `Falcon` VALUES ('FAL101','#T1','LIU101'),('FAL102','#T1','LIU101'),('FAL103','#T1','LIU101'),('FAL201','#T2','LIU201'),('FAL202','#T2','LIU201'),('FAL203','#T2','LIU201'),('FAL301','#T3','LIU301'),('FAL302','#T3','LIU301'),('FAL303','#T3','LIU301');
/*!40000 ALTER TABLE `Falcon` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Lieutenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lieutenant` (
  `Employee_ID` varchar(50) NOT NULL,
  `Num_Pkg_Dist` int DEFAULT NULL,
  `Territory_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Lieutenant_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Lieutenant` WRITE;
/*!40000 ALTER TABLE `Lieutenant` DISABLE KEYS */;
INSERT INTO `Lieutenant` VALUES ('LIU101',85,'#T1'),('LIU201',59,'#T2'),('LIU301',69,'#T3');
/*!40000 ALTER TABLE `Lieutenant` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Money_Front`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Money_Front` (
  `Front_Name` varchar(50) NOT NULL,
  `Organisation_Name` varchar(50) NOT NULL,
  `Acc_Emp_ID` varchar(50) NOT NULL,
  `Amount_Laundered` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`Front_Name`,`Organisation_Name`,`Acc_Emp_ID`),
  KEY `Money_Front_ibfk_1` (`Organisation_Name`),
  KEY `Money_Front_ibfk_2` (`Acc_Emp_ID`),
  CONSTRAINT `Money_Front_ibfk_1` FOREIGN KEY (`Organisation_Name`) REFERENCES `Organisation` (`Organisation_Name`),
  CONSTRAINT `Money_Front_ibfk_2` FOREIGN KEY (`Acc_Emp_ID`) REFERENCES `Accountant` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Money_Front` WRITE;
/*!40000 ALTER TABLE `Money_Front` DISABLE KEYS */;
INSERT INTO `Money_Front` VALUES ('ABC Consulatncy','Medellin Cartel','ACC101',5000.00),('LMN Lodgings','Medellin Cartel','ACC301',8750.00),('XYZ Real Estate','Medellin Cartel','ACC201',4500.00);
/*!40000 ALTER TABLE `Money_Front` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organisation` (
  `Organisation_Name` varchar(50) NOT NULL,
  `Number_Of_Employees` int DEFAULT NULL,
  `Market_Value` decimal(13,2) DEFAULT NULL,
  `Kingpin_First_Name` varchar(50) DEFAULT NULL,
  `Kingpin_Last_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Organisation_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Organisation` WRITE;
/*!40000 ALTER TABLE `Organisation` DISABLE KEYS */;
INSERT INTO `Organisation` VALUES ('Medellin Cartel',101,33456.00,'Swetha','Vipparla');
/*!40000 ALTER TABLE `Organisation` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Organisation_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organisation_Details` (
  `Date` date NOT NULL,
  `Kingpin_First_Name` varchar(50) DEFAULT NULL,
  `Kingpin_Last_Name` varchar(50) DEFAULT NULL,
  `Net_Spending` decimal(13,2) DEFAULT NULL,
  `Net_Revenue` decimal(13,2) DEFAULT NULL,
  `Number_Of_Employees` int DEFAULT NULL,
  PRIMARY KEY (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Organisation_Details` WRITE;
/*!40000 ALTER TABLE `Organisation_Details` DISABLE KEYS */;
INSERT INTO `Organisation_Details` VALUES ('2002-02-02','Swetha','Vipparla',22345.00,33456.00,101),('2003-01-01','Shubh','Agarwal',12345.00,23456.00,100),('2003-03-03','Siddharth','Mavani',42345.00,43456.00,99);
/*!40000 ALTER TABLE `Organisation_Details` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producer` (
  `Producer_ID` varchar(50) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email_ID` varchar(50) DEFAULT NULL,
  `Total_Amount_Paid` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`Producer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Producer` WRITE;
/*!40000 ALTER TABLE `Producer` DISABLE KEYS */;
INSERT INTO `Producer` VALUES ('P01','Chris','Pratt','chris_cool@gmail.com',1250.00),('P02','Glenn','Maxwell','hotmax@gmail.com',1500.00),('P03','Shubham','Raj','desiboy619@gmail.com',750.00),('P04','David','Malan','lordmalan@gmail.com',2250.00),('P05','RP','Singh','sexlord@gmail.com',5000.00);
/*!40000 ALTER TABLE `Producer` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Producer_Phone_Num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producer_Phone_Num` (
  `Producer_ID` varchar(50) NOT NULL,
  `Phone_Number` int NOT NULL,
  PRIMARY KEY (`Producer_ID`,`Phone_Number`),
  CONSTRAINT `Producer_Phone_Num_ibfk_1` FOREIGN KEY (`Producer_ID`) REFERENCES `Producer` (`Producer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Producer_Phone_Num` WRITE;
/*!40000 ALTER TABLE `Producer_Phone_Num` DISABLE KEYS */;
INSERT INTO `Producer_Phone_Num` VALUES ('P01',20000000),('P01',20000005),('P02',20000001),('P03',20000002),('P03',20000006),('P04',20000003),('P05',20000004),('P05',20000007);
/*!40000 ALTER TABLE `Producer_Phone_Num` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Region` (
  `Region_ID` varchar(50) NOT NULL,
  `Region_Name` varchar(50) DEFAULT NULL,
  `Organisation_Name` varchar(50) DEFAULT NULL,
  `Region_MGR_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Region_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
INSERT INTO `Region` VALUES ('#A1','Konohagakure','Medllin Cartel','RGM101'),('#A2','Kirigakure','Medllin Cartel','RGM201'),('#A3','Iwagakure','Medllin Cartel','RGM301');
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Regional_Mgr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regional_Mgr` (
  `Employee_ID` varchar(50) NOT NULL,
  `Net_Profit` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Regional_Mgr_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Regional_Mgr` WRITE;
/*!40000 ALTER TABLE `Regional_Mgr` DISABLE KEYS */;
INSERT INTO `Regional_Mgr` VALUES ('RGM101',5000.00),('RGM201',10000.00),('RGM301',7500.00);
/*!40000 ALTER TABLE `Regional_Mgr` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sells` (
  `Producer_ID` varchar(50) NOT NULL,
  `Drug_ID` varchar(50) NOT NULL,
  `Supp_Emp_ID` varchar(50) NOT NULL,
  `Trans_Date` date DEFAULT NULL,
  `Num_Pkg_Sold` int DEFAULT NULL,
  PRIMARY KEY (`Producer_ID`,`Drug_ID`,`Supp_Emp_ID`),
  KEY `Sells_ibfk_2` (`Drug_ID`),
  KEY `Sells_ibfk_3` (`Supp_Emp_ID`),
  CONSTRAINT `Sells_ibfk_1` FOREIGN KEY (`Producer_ID`) REFERENCES `Producer` (`Producer_ID`),
  CONSTRAINT `Sells_ibfk_2` FOREIGN KEY (`Drug_ID`) REFERENCES `Drug` (`Drug_ID`),
  CONSTRAINT `Sells_ibfk_3` FOREIGN KEY (`Supp_Emp_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Sells` WRITE;
/*!40000 ALTER TABLE `Sells` DISABLE KEYS */;
INSERT INTO `Sells` VALUES ('P01','D03','SUP101','2020-03-07',42),('P01','D04','SUP102','2021-02-03',90),('P01','D05','SUP102','2021-08-09',50),('P02','D02','SUP201','2020-01-02',100),('P02','D03','SUP201','2020-07-10',53),('P03','D02','SUP101','2021-09-01',12),('P03','D04','SUP301','2021-06-09',45),('P04','D02','SUP301','2020-05-08',33),('P04','D05','SUP301','2020-10-09',9),('P05','D01','SUP201','2021-04-06',69);
/*!40000 ALTER TABLE `Sells` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Soldier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Soldier` (
  `Employee_ID` varchar(50) NOT NULL,
  `Num_Assasinations` int DEFAULT NULL,
  `Ltnt_Emp_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Soldier_ibfk_2` (`Ltnt_Emp_ID`),
  CONSTRAINT `Soldier_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `Soldier_ibfk_2` FOREIGN KEY (`Ltnt_Emp_ID`) REFERENCES `Lieutenant` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Soldier` WRITE;
/*!40000 ALTER TABLE `Soldier` DISABLE KEYS */;
INSERT INTO `Soldier` VALUES ('SOL101',12,'LIU101'),('SOL102',10,'LIU101'),('SOL103',8,'LIU101'),('SOL104',5,'LIU101'),('SOL105',23,'LIU101'),('SOL201',22,'LIU201'),('SOL202',7,'LIU201'),('SOL203',6,'LIU201'),('SOL204',3,'LIU201'),('SOL205',13,'LIU201'),('SOL301',15,'LIU301'),('SOL302',13,'LIU301'),('SOL303',11,'LIU301'),('SOL304',8,'LIU301'),('SOL305',26,'LIU301');
/*!40000 ALTER TABLE `Soldier` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `Employee_ID` varchar(50) NOT NULL,
  `Num_Pkg_Supplied` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Supplier_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES ('SUP101',45),('SUP102',50),('SUP201',75),('SUP301',100);
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplies` (
  `Ltnt_Emp_ID` varchar(50) NOT NULL,
  `Drug_ID` varchar(50) NOT NULL,
  `Supp_Emp_ID` varchar(50) NOT NULL,
  `Num_Pkg_Supplied` int DEFAULT NULL,
  `Trans_Date` date DEFAULT NULL,
  PRIMARY KEY (`Ltnt_Emp_ID`,`Drug_ID`,`Supp_Emp_ID`),
  KEY `Supplies_ibfk_2` (`Drug_ID`),
  KEY `Supplies_ibfk_3` (`Supp_Emp_ID`),
  CONSTRAINT `Supplies_ibfk_1` FOREIGN KEY (`Ltnt_Emp_ID`) REFERENCES `Lieutenant` (`Employee_ID`),
  CONSTRAINT `Supplies_ibfk_2` FOREIGN KEY (`Drug_ID`) REFERENCES `Drug` (`Drug_ID`),
  CONSTRAINT `Supplies_ibfk_3` FOREIGN KEY (`Supp_Emp_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Supplies` WRITE;
/*!40000 ALTER TABLE `Supplies` DISABLE KEYS */;
INSERT INTO `Supplies` VALUES ('LIU101','D01','SUP201',42,'2021-10-10'),('LIU101','D02','SUP101',10,'2021-10-10'),('LIU101','D02','SUP301',24,'2021-10-10'),('LIU101','D03','SUP101',27,'2021-10-10'),('LIU101','D03','SUP201',40,'2021-10-10'),('LIU101','D04','SUP102',69,'2021-11-11'),('LIU101','D04','SUP301',40,'2021-10-10'),('LIU201','D02','SUP101',11,'2021-10-11'),('LIU201','D03','SUP201',13,'2021-10-11'),('LIU201','D05','SUP301',4,'2021-10-10'),('LIU301','D02','SUP201',90,'2021-10-12'),('LIU301','D04','SUP301',5,'2021-10-10'),('LIU301','D05','SUP102',47,'2021-10-10'),('LIU301','D05','SUP301',4,'2021-10-10');
/*!40000 ALTER TABLE `Supplies` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Territory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Territory` (
  `Region_ID` varchar(50) NOT NULL,
  `Territory_ID` varchar(50) NOT NULL,
  `Num_Pkg_Sold` int DEFAULT NULL,
  `Number_Of_Employees` int DEFAULT NULL,
  `Street_Num` varchar(50) DEFAULT NULL,
  `Area_Code` int DEFAULT NULL,
  PRIMARY KEY (`Region_ID`,`Territory_ID`),
  CONSTRAINT `Territory_ibfk_1` FOREIGN KEY (`Region_ID`) REFERENCES `Region` (`Region_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Territory` WRITE;
/*!40000 ALTER TABLE `Territory` DISABLE KEYS */;
INSERT INTO `Territory` VALUES ('#A1','#T1',203,12,'55',174),('#A2','#T2',129,12,'29',51),('#A3','#T3',256,13,'76',238);
/*!40000 ALTER TABLE `Territory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

