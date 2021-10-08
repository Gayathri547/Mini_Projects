-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: project1
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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

--
-- Table structure for table `admin_table`
--

DROP TABLE IF EXISTS `admin_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_table` (
  `a_id` varchar(100) NOT NULL,
  `i_id` varchar(100) DEFAULT NULL,
  `c_id` varchar(100) DEFAULT NULL,
  `cr_id` varchar(100) DEFAULT NULL,
  `p_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `i_id` (`i_id`),
  KEY `c_id` (`c_id`),
  KEY `cr_id` (`cr_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `admin_table_ibfk_1` FOREIGN KEY (`i_id`) REFERENCES `items_table` (`i_id`) ON DELETE CASCADE,
  CONSTRAINT `admin_table_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer_table` (`c_id`) ON DELETE CASCADE,
  CONSTRAINT `admin_table_ibfk_3` FOREIGN KEY (`cr_id`) REFERENCES `courier_table` (`cr_id`) ON DELETE CASCADE,
  CONSTRAINT `admin_table_ibfk_4` FOREIGN KEY (`p_id`) REFERENCES `payment_table` (`p_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_table`
--

LOCK TABLES `admin_table` WRITE;
/*!40000 ALTER TABLE `admin_table` DISABLE KEYS */;
INSERT INTO `admin_table` VALUES ('a1','i1','c1','cr1','p1'),('a2','i2','c2','cr2','p2'),('a3','i3','c3','cr3','p3'),('a4','i4','c4','cr4','p4');
/*!40000 ALTER TABLE `admin_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beauty_table`
--

DROP TABLE IF EXISTS `beauty_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beauty_table` (
  `bt_id` varchar(100) NOT NULL,
  `bt_name` text,
  `bt_cost` decimal(10,2) DEFAULT NULL,
  `bt_expiry_or_warrenty` text,
  `bt_review` text,
  PRIMARY KEY (`bt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beauty_table`
--

LOCK TABLES `beauty_table` WRITE;
/*!40000 ALTER TABLE `beauty_table` DISABLE KEYS */;
INSERT INTO `beauty_table` VALUES ('bt1','kazal',150.00,' 1 year','good'),('bt10','powder',100.00,'1 year','good'),('bt11','stickers',20.00,'3 months','average'),('bt12','vaseline',120.00,'8 months','excellent'),('bt13','moisturizer',200.00,'1 year','average'),('bt14','body lotion',250.00,'1 year','average'),('bt15','perfum',500.00,'2 years','average'),('bt16','serum',300.00,'2 years','good'),('bt17','bb cream',900.00,'2 years','good'),('bt19','premier',500.00,'2 years','bad'),('bt2','lipstick',500.00,' 1 year','average'),('bt20','nail polish',500.00,'2 years','bad'),('bt3','mascara',100.00,' 1 year','good'),('bt4','eye lashes',100.00,'6 months','excellent'),('bt5','foundation',1000.00,'1 year','goog'),('bt6','eye brow pencil',50.00,'6 months','good'),('bt7','concealer',500.00,'6 months','good'),('bt8','make up brush',800.00,'8 months','excellent'),('bt9','fair and lovely',120.00,'8 months','average');
/*!40000 ALTER TABLE `beauty_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes_table`
--

DROP TABLE IF EXISTS `clothes_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes_table` (
  `clt_id` varchar(100) NOT NULL,
  `clt_name` text,
  `clt_cost` decimal(10,2) DEFAULT NULL,
  `clt_expiry_or_warrenty` text,
  `clt_review` text,
  PRIMARY KEY (`clt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes_table`
--

LOCK TABLES `clothes_table` WRITE;
/*!40000 ALTER TABLE `clothes_table` DISABLE KEYS */;
INSERT INTO `clothes_table` VALUES ('clt1','chudidar',1000.00,'1 year','good'),('clt10','tops',300.00,'2 years','good'),('clt11','formals',500.00,'1 year','average'),('clt12','full hand shirts',800.00,'6 months','good'),('clt13','half hand shirts',800.00,'6 months','average'),('clt14','jump shoots',500.00,'6 months','average'),('clt15','swim shoots',800.00,'8 months','worst'),('clt16','rain coat',1000.00,'12 months','average'),('clt17','swetter',800.00,'12 months','excellent'),('clt18','ram raj baniyans',1000.00,'11 months','average'),('clt19','zym shoots',3000.00,'21 months','average'),('clt2','lehanga',2000.00,'2 years','excellent'),('clt20','jackets',3000.00,'8 months','good'),('clt3','T-shirt',500.00,'2 years','average'),('clt4','jeans',1000.00,'1 year','bad'),('clt5','net dress',1100.00,'1 year','worst'),('clt6','anarkali',1100.00,'1 year','average'),('clt7','plaza',1200.00,'1 year','average'),('clt8','leggins',800.00,'2 years','good'),('clt9','ankel leggins',900.00,'2 years','excellent');
/*!40000 ALTER TABLE `clothes_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_table`
--

DROP TABLE IF EXISTS `courier_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_table` (
  `cr_id` varchar(100) NOT NULL,
  `transaction_flow` text,
  `c_id` varchar(100) DEFAULT NULL,
  `p_id` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cr_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `courier_table_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer_table` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_table`
--

LOCK TABLES `courier_table` WRITE;
/*!40000 ALTER TABLE `courier_table` DISABLE KEYS */;
INSERT INTO `courier_table` VALUES ('cr1','success','c20',1),('cr10','failure','c13',0),('cr11','success','c1',1),('cr12','success','c2',0),('cr13','failed','c3',0),('cr14','failed','c4',1),('cr15','failed','c5',0),('cr16','success','c6',1),('cr17','failed','c7',0),('cr18','failed','c8',0),('cr19','success','c9',1),('cr2','failed','c19',0),('cr20','success','c10',1),('cr21','failed','c11',0),('cr22','success','c12',1),('cr23','success','c16',1),('cr3','failed','c18',1),('cr4','failed','c17',0),('cr5','success','c20',1),('cr6','failed','c15',1),('cr7','success','c15',0),('cr8','success','c14',1),('cr9','failure','c13',0);
/*!40000 ALTER TABLE `courier_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_table`
--

DROP TABLE IF EXISTS `customer_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_table` (
  `c_id` varchar(100) NOT NULL,
  `c_name` text,
  `c_address` text,
  `c_phn_no` int DEFAULT NULL,
  `i_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `i_id` (`i_id`),
  CONSTRAINT `customer_table_ibfk_1` FOREIGN KEY (`i_id`) REFERENCES `items_table` (`i_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_table`
--

LOCK TABLES `customer_table` WRITE;
/*!40000 ALTER TABLE `customer_table` DISABLE KEYS */;
INSERT INTO `customer_table` VALUES ('c1','sameera','mvp sector1',99895,'i1'),('c10','saleha','krishna',63453,'i2'),('c11','esu','tenali',63547,'i11'),('c12','sai','tanuku',23447,'i12'),('c13','naidu','hyderabad',23217,'i13'),('c14','muripi','rajamundry',23453,'i14'),('c15','sathya','srikakulam',33487,'i15'),('c16','pavani','mandapeta',79698,'i1'),('c17','jaswanth','kakinada',79765,'i2'),('c18','bhavya','rajamundry',75475,'i3'),('c19','yamini','kakinada',72571,'i4'),('c2','gayathri','mvp sector2',45762,'i10'),('c20','jyothi','guntur',743171,'i5'),('c21','manga devi','vakatippa',32423,'i5'),('c22','venkata rao','paningapalli',42323,'i6'),('c23','eswara rao','vizayanagaram',45473,'i7'),('c3','kaki','mvp sector3',89679,'i9'),('c4','teju','rk_beach',843543,'i8'),('c5','divya','esuka thota junction',84332,'i7'),('c6','sravani','maddilapalem',85872,'i6'),('c7','siri','madhuravada',34872,'i5'),('c8','puji','East Godavari',34532,'i4'),('c9','sanju','West Godavari',32453,'i3');
/*!40000 ALTER TABLE `customer_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronics_table`
--

DROP TABLE IF EXISTS `electronics_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronics_table` (
  `ele_id` varchar(100) NOT NULL,
  `ele_name` text,
  `ele_cost` decimal(10,2) DEFAULT NULL,
  `ele_expiry_or_warrenty` text,
  `ele_review` text,
  PRIMARY KEY (`ele_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics_table`
--

LOCK TABLES `electronics_table` WRITE;
/*!40000 ALTER TABLE `electronics_table` DISABLE KEYS */;
INSERT INTO `electronics_table` VALUES ('ele1','phone',15000.00,'2 years','good'),('ele10','usb cabel',500.00,'1 year','good'),('ele11','micro_oven',3000.00,'2 year','average'),('ele12','smart watch',1500.00,'3 year','average'),('ele13','heater',300.00,'3 months','excellent'),('ele14','water purifier',2500.00,'6 months','good'),('ele15','all out',100.00,'8 months','worst'),('ele16','cattle',600.00,'6 months','bad'),('ele17','stand fan',2000.00,'2 years','average'),('ele18','cooler',5000.00,'3 years','average'),('ele19','ac',20000.00,'5 years','good'),('ele2','laptop',50000.00,'5 years','bad'),('ele20','projector',5000.00,'1 year','bad'),('ele3','geezer',3000.00,'1 year','excellent'),('ele4','bluetooth',800.00,'6 months','average'),('ele5','ear phones',500.00,'6 months','average'),('ele6','head set',800.00,'8 months','good'),('ele7','pen drive',700.00,'6 months','bad'),('ele8','adopter',1100.00,'1 year','worst'),('ele9','charger',1000.00,'1 year','worst');
/*!40000 ALTER TABLE `electronics_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_table`
--

DROP TABLE IF EXISTS `health_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_table` (
  `ht_id` varchar(100) NOT NULL,
  `ht_name` text,
  `ht_cost` decimal(10,2) DEFAULT NULL,
  `ht_expiry_or_warrenty` text,
  `ht_review` text,
  PRIMARY KEY (`ht_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_table`
--

LOCK TABLES `health_table` WRITE;
/*!40000 ALTER TABLE `health_table` DISABLE KEYS */;
INSERT INTO `health_table` VALUES ('ht1','paracetmol',100.00,'6 months','good'),('ht10','syringe',100.00,'1 year','good'),('ht11','glowses',100.00,'6 months','good'),('ht12','oximeter',1500.00,'8 months','average'),('ht13','cough syrup',90.00,'8 months','average'),('ht14','inhaler',100.00,'6 months','good'),('ht15','dettol',500.00,'8 months','excellent'),('ht16','hand wash',200.00,'6 months','good'),('ht17','disprin',50.00,'8 months','average'),('ht18','volini spray',150.00,'8 months','bad'),('ht19','panderm ointment',94.00,'1 year','excellent'),('ht2','citrogen',150.00,'6 months','bad'),('ht20','zandu balm',100.00,'1 year','average'),('ht3','dolo',150.00,'6 months','excellent'),('ht4','dolo65',150.00,'3 months','average'),('ht5','dettol',200.00,'6 months','bad'),('ht6','sanitizer',200.00,'6 months','average'),('ht7','mask',50.00,'6 months','good'),('ht8','penicilin',200.00,'8 months','average'),('ht9','thermo meter',1000.00,'6 months','average');
/*!40000 ALTER TABLE `health_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_furniture_table`
--

DROP TABLE IF EXISTS `home_furniture_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_furniture_table` (
  `hm_id` varchar(100) NOT NULL,
  `hm_name` text,
  `hm_cost` decimal(10,2) DEFAULT NULL,
  `hm_expiry_or_warrenty` text,
  `hm_review` text,
  PRIMARY KEY (`hm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_furniture_table`
--

LOCK TABLES `home_furniture_table` WRITE;
/*!40000 ALTER TABLE `home_furniture_table` DISABLE KEYS */;
INSERT INTO `home_furniture_table` VALUES ('hm1','tables',1000.00,'6months','good'),('hm10','mug',50.00,'6 months','worst'),('hm11','stand_fan',5000.00,'1year','excellent'),('hm12','induction_stove',3000.00,'1year','good'),('hm13','cooker',2500.00,'1year','bad'),('hm14','hangers',100.00,'3months','excellent'),('hm15','plug_boards',800.00,'6 months','bad'),('hm16','trolley_bag',4000.00,'1 year','good'),('hm17','broom_stick',100.00,'6 months','average'),('hm18','dust_bin',130.00,'6 months','average'),('hm19','pillow',300.00,'6 months','worst'),('hm2','chairs',500.00,'3 months','bad'),('hm20','slippers_stand',500.00,'1 year','good'),('hm3','dinner_set',800.00,'3 months','worst'),('hm4','cot',2000.00,'6 months','excellent'),('hm5','bed',500.00,'6 months','excellent'),('hm6','racks',700.00,'6 months','good'),('hm7','bowl_set',300.00,'6 months','average'),('hm8','bottle_set',280.00,'3 months','average'),('hm9','buckets',150.00,'6 months','good');
/*!40000 ALTER TABLE `home_furniture_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_table`
--

DROP TABLE IF EXISTS `items_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_table` (
  `i_id` varchar(100) NOT NULL,
  `kd_id` varchar(100) DEFAULT NULL,
  `hm_id` varchar(100) DEFAULT NULL,
  `ele_id` varchar(100) DEFAULT NULL,
  `jw_id` varchar(100) DEFAULT NULL,
  `kt_id` varchar(100) DEFAULT NULL,
  `clt_id` varchar(100) DEFAULT NULL,
  `bt_id` varchar(100) DEFAULT NULL,
  `ht_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`i_id`),
  KEY `kd_id` (`kd_id`),
  KEY `hm_id` (`hm_id`),
  KEY `ele_id` (`ele_id`),
  KEY `jw_id` (`jw_id`),
  KEY `kt_id` (`kt_id`),
  KEY `clt_id` (`clt_id`),
  KEY `bt_id` (`bt_id`),
  KEY `ht_id` (`ht_id`),
  CONSTRAINT `items_table_ibfk_1` FOREIGN KEY (`kd_id`) REFERENCES `kids_table` (`kd_id`) ON DELETE CASCADE,
  CONSTRAINT `items_table_ibfk_2` FOREIGN KEY (`hm_id`) REFERENCES `home_furniture_table` (`hm_id`) ON DELETE CASCADE,
  CONSTRAINT `items_table_ibfk_3` FOREIGN KEY (`ele_id`) REFERENCES `electronics_table` (`ele_id`) ON DELETE CASCADE,
  CONSTRAINT `items_table_ibfk_4` FOREIGN KEY (`jw_id`) REFERENCES `jewellery_table` (`jw_id`) ON DELETE CASCADE,
  CONSTRAINT `items_table_ibfk_5` FOREIGN KEY (`kt_id`) REFERENCES `kitchen_table` (`kt_id`) ON DELETE CASCADE,
  CONSTRAINT `items_table_ibfk_6` FOREIGN KEY (`clt_id`) REFERENCES `clothes_table` (`clt_id`) ON DELETE CASCADE,
  CONSTRAINT `items_table_ibfk_7` FOREIGN KEY (`bt_id`) REFERENCES `beauty_table` (`bt_id`) ON DELETE CASCADE,
  CONSTRAINT `items_table_ibfk_8` FOREIGN KEY (`ht_id`) REFERENCES `health_table` (`ht_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_table`
--

LOCK TABLES `items_table` WRITE;
/*!40000 ALTER TABLE `items_table` DISABLE KEYS */;
INSERT INTO `items_table` VALUES ('i1','kd3','hm9','ele9','jw12','kt18','clt15','bt11','ht19'),('i10','kd10','hm13','ele11','jw10','kt10','clt5','bt2','ht7'),('i11','kd11','hm14','ele12','jw11','kt11','clt6','bt3','ht8'),('i12','kd9','hm15','ele10','jw13','kt12','clt7','bt4','ht9'),('i13','kd10','hm5','ele7','jw3','kt7','clt6','bt3','ht8'),('i14','kd17','hm15','ele17','jw13','kt17','clt16','bt3','ht9'),('i15','kd3','hm10','ele10','jw10','kt5','clt9','bt16','ht6'),('i2','kd2','hm8','ele19','jw2','kt8','clt11','bt8','ht10'),('i3','kd3','hm7','ele1','jw8','kt2','clt10','bt8','ht14'),('i4','kd13','hm17','ele5','jw18','kt12','clt1','bt2','ht1'),('i5','kd12','hm16','ele6','jw17','kt13','clt2','bt12','ht2'),('i6','kd10','hm15','ele7','jw16','kt14','clt3','bt13','ht3'),('i7','kd9','hm14','ele8','jw15','kt13','clt4','bt14','ht4'),('i8','kd10','hm15','ele9','jw14','kt14','clt5','bt17','ht5'),('i9','kd9','hm14','ele10','jw9','kt9','clt6','bt1','ht6');
/*!40000 ALTER TABLE `items_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jewellery_table`
--

DROP TABLE IF EXISTS `jewellery_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewellery_table` (
  `jw_id` varchar(100) NOT NULL,
  `jw_name` text,
  `jw_cost` decimal(10,2) DEFAULT NULL,
  `jw_expiry_or_warrenty` text,
  `jw_review` text,
  PRIMARY KEY (`jw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewellery_table`
--

LOCK TABLES `jewellery_table` WRITE;
/*!40000 ALTER TABLE `jewellery_table` DISABLE KEYS */;
INSERT INTO `jewellery_table` VALUES ('jw1','jumkas',500.00,'2months','good'),('jw10','necklace',5000.00,'5years','excellent'),('jw11','choker',500.00,'2months','good'),('jw12','black_beed_chain',2000.00,'2years','excellent'),('jw13','hair_band',50.00,'2 months','good'),('jw14','hair_pins',20.00,'2 months','average'),('jw15','maangtikka',300.00,'2 months','average'),('jw16','mathapatti',200.00,'2 months','good'),('jw17','toe_rings',500.00,'2 months','good'),('jw18','mangalasuthra',5000.00,'5years','average'),('jw19','bindi',20.00,'1month','bad'),('jw2','bangles',100.00,'6months','bad'),('jw20','thread_bangles',1000.00,'6months','average'),('jw3','anklets',120.00,'6months','worst'),('jw4','chains',100.00,'6months','average'),('jw5','ear_rings',30.00,'2months','average'),('jw6','waist_band',100.00,'2months','good'),('jw7','bracelet',50.00,'5months','good'),('jw8','nose_pin',200.00,'1year','average'),('jw9','ring',1000.00,'3years','excellent');
/*!40000 ALTER TABLE `jewellery_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kids_table`
--

DROP TABLE IF EXISTS `kids_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kids_table` (
  `kd_id` varchar(100) NOT NULL,
  `kd_name` text,
  `kd_cost` decimal(10,2) DEFAULT NULL,
  `kd_expiry_or_warrenty` text,
  `kd_review` text,
  PRIMARY KEY (`kd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kids_table`
--

LOCK TABLES `kids_table` WRITE;
/*!40000 ALTER TABLE `kids_table` DISABLE KEYS */;
INSERT INTO `kids_table` VALUES ('kd1','baby_bath_tub',800.00,'6months','good'),('kd10','baby_cerelac',150.00,'8months','good'),('kd11','baby_monkey_cap',200.00,'1year','bad'),('kd12','teddy_bear',800.00,'5years','bad'),('kd13','toys',2000.00,'5years','excellent'),('kd14','remote_car',2000.00,'1year','good'),('kd15','barbie_girl',1000.00,'5years','excellent'),('kd16','chocolates',90.00,'6months','excellent'),('kd17','biscuits',50.00,'6months','good'),('kd18','kinder_joy',30.00,'6months','good'),('kd19','milk_powder',100.00,'6months','average'),('kd2','baby_dress',2000.00,'2years','bad'),('kd20','feeding_bottle',80.00,'2years','average'),('kd3','baby_soap',100.00,'6months','worst'),('kd4','baby_powder',150.00,'2years','average'),('kd5','baby_oil',200.00,'5years','excellent'),('kd6','baby_swetter',800.00,'1year','good'),('kd7','baby_muffler',500.00,'2years','worst'),('kd8','baby_shoes',500.00,'1year','excellent'),('kd9','baby_swing_stand',1000.00,'2years','good');
/*!40000 ALTER TABLE `kids_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_table`
--

DROP TABLE IF EXISTS `kitchen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen_table` (
  `kt_id` varchar(100) NOT NULL,
  `kt_name` text,
  `kt_cost` decimal(10,2) DEFAULT NULL,
  `kt_expiry_or_warrenty` text,
  `kt_review` text,
  PRIMARY KEY (`kt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_table`
--

LOCK TABLES `kitchen_table` WRITE;
/*!40000 ALTER TABLE `kitchen_table` DISABLE KEYS */;
INSERT INTO `kitchen_table` VALUES ('kt1','stove',1300.00,' 2 years','good'),('kt10','rice',800.00,'6 months','average'),('kt11','dall',500.00,'1 year','excellent'),('kt12','sugar',100.00,'8 months','good'),('kt13','salt',150.00,'6 months','good'),('kt14','chilli powder',150.00,'6 months','good'),('kt15','termeric powder',150.00,'6 months','good'),('kt16','masala',200.00,'6 months','good'),('kt17','tea powder',200.00,'6 months','average'),('kt18','coffee powder',200.00,'8 months','good'),('kt19','jaggery',200.00,'6 months','average'),('kt2','gas syllender',1500.00,' 2 years','bad'),('kt20','cloves',200.00,'6 months','average'),('kt3','induction stove',3000.00,'5 years','average'),('kt4','electric cooker',2000.00,'2 years','worst'),('kt5','fridge',3000.00,'4 years','average'),('kt6','oven',2000.00,'2 years','good'),('kt7','mixer',1000.00,'5 years','good'),('kt8','grinder',3000.00,'2 years','good'),('kt9','vegetables',100.00,'2 weeks','good');
/*!40000 ALTER TABLE `kitchen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_table`
--

DROP TABLE IF EXISTS `payment_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_table` (
  `p_id` varchar(100) NOT NULL,
  `cr_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `cr_id` (`cr_id`),
  CONSTRAINT `payment_table_ibfk_1` FOREIGN KEY (`cr_id`) REFERENCES `courier_table` (`cr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_table`
--

LOCK TABLES `payment_table` WRITE;
/*!40000 ALTER TABLE `payment_table` DISABLE KEYS */;
INSERT INTO `payment_table` VALUES ('p1','cr1'),('p5','cr11'),('p6','cr12'),('p7','cr16'),('p8','cr19'),('p9','cr20'),('p10','cr22'),('p11','cr23'),('p2','cr5'),('p3','cr7'),('p4','cr8');
/*!40000 ALTER TABLE `payment_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30 12:10:40
