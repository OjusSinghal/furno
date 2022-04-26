CREATE DATABASE  IF NOT EXISTS `furno` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `furno`;
-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: furno
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.21.10.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `promoCode`
--

DROP TABLE IF EXISTS `promoCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promoCode` (
  `codeName` varchar(15) NOT NULL,
  `minimumPrice` int NOT NULL,
  `discountMultiplier` decimal(5,4) NOT NULL,
  `expiryDate` timestamp NULL DEFAULT NULL,
  `activeStatus` tinyint(1) NOT NULL,
  `remainingRedeems` int DEFAULT NULL,
  PRIMARY KEY (`codeName`),
  CONSTRAINT `promoCode_chk_1` CHECK ((`minimumPrice` >= 0)),
  CONSTRAINT `promoCode_chk_2` CHECK ((`remainingRedeems` >= 0)),
  CONSTRAINT `promoCode_chk_3` CHECK (((`discountMultiplier` >= 0.0) and (`discountMultiplier` <= 1.0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promoCode`
--

LOCK TABLES `promoCode` WRITE;
/*!40000 ALTER TABLE `promoCode` DISABLE KEYS */;
INSERT INTO `promoCode` VALUES ('3rd generation',11692,0.9744,'2022-12-18 04:48:56',1,25),('6th generation',15649,0.6704,'2022-11-17 09:21:39',1,100),('Centralized',6769,0.1551,'2022-05-22 00:59:14',0,71),('conglomeration',18100,0.0639,'2023-04-06 20:45:03',0,42),('eco-centric',2707,0.2831,'2022-07-13 11:04:57',1,57),('encryption',8338,0.8575,'2023-01-01 06:03:50',1,30),('focus group',14180,0.6163,'2022-07-29 16:33:09',1,65),('impactful',229,0.2782,'2022-06-08 10:56:11',1,18),('Implemented',1837,0.8374,'2022-08-02 07:40:41',1,81),('Innovative',7989,0.8527,'2022-06-28 18:38:14',0,86),('interface',9805,0.7617,'2022-10-11 20:27:11',1,81),('Intuitive',7965,0.8293,'2022-06-22 01:21:55',0,11),('methodical',6532,0.4768,'2022-07-28 10:07:00',1,28),('modular',4741,0.2040,'2022-12-04 14:40:19',0,83),('optimal',12215,0.3843,'2022-04-27 00:48:43',1,68),('Optional',908,0.0142,'2023-01-20 18:00:34',1,67),('Profit-focused',14553,0.1439,'2022-07-06 09:17:49',1,72),('structure',11839,0.6194,'2022-11-01 13:00:52',1,30),('synergy',1099,0.4936,'2022-11-02 13:50:18',1,84),('Team-oriented',17088,0.5515,'2023-02-16 00:14:29',0,76);
/*!40000 ALTER TABLE `promoCode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26  8:17:32
