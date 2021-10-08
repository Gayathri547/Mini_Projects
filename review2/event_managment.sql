-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: MAIN_PROJECT
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `userid` varchar(12) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `event_date` varchar(45) DEFAULT NULL,
  `select_an_event` varchar(45) DEFAULT NULL,
  `timings` varchar(45) DEFAULT NULL,
  `no_of_seats` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES ('1','Gayathri','oct 1st','Marriage','Night','2'),('10','teju','oct10','Marriage','Afternoon','7'),('11','teju','oct10','Marriage','Afternoon','7'),('12','sameera','10-10-2021','Marriage','Morning','1'),('13','saleha','10-11-2021','Fathers day','Evening','3'),('14','sanju','10-11-2021','Children day','Night','3'),('2','Puji','10-11-2021','Anniversary','Evening','4'),('3','Eswar','Aug 6','Marriage','Night','2'),('4','Sai','Aug 6','Anniversary','Evening','3'),('6','suneetha','10-10-2021','Marriage','Evening','4'),('8','naidu','dec','Baby Shower','Afternoon','4'),('9','muripi','10-10-2021','Anniversary','Afternoon','4');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-08 23:08:00
