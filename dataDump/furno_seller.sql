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
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `sellerID` char(10) NOT NULL,
  `sellerName` varchar(30) NOT NULL,
  `sellerEmailID` varchar(50) NOT NULL,
  `sellerPassword` varchar(22) NOT NULL,
  `sellerContactNumber` decimal(10,0) NOT NULL,
  `GST` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`sellerID`),
  UNIQUE KEY `sellerEmailID` (`sellerEmailID`),
  UNIQUE KEY `GST` (`GST`),
  CONSTRAINT `seller_chk_1` CHECK ((`sellerID` like _utf8mb4'S%')),
  CONSTRAINT `seller_chk_2` CHECK ((regexp_like(`sellerPassword`,_utf8mb4'[A-Z]') and regexp_like(`sellerPassword`,_utf8mb4'[!-@]') and (length(`sellerPassword`) >= 8)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES ('S073588105','Vaclav','vantonietti4@ebay.co.uk','C714@JMPyd0872',4101364389,345024429724955),('S114400724','Jared','jwishkara@51.la','v744@Seoad6479',1544526959,912632084610884),('S204980942','Darlene','dearleyb@jigsy.com','G556@sfZGd4836',6422234410,290036295849480),('S214997995','Shermie','svaughton7@wikispaces.com','v862@Hzckd9764',7757198318,582841093598434),('S274388661','Dolores','deasenj@uol.com.br','n306@Nhmhd7021',9011502867,802128114199587),('S337395433','Ernest','eheintze9@skyrock.com','w487@TCjvd2417',6049472484,237535181309439),('S349637186','Fulton','fstockleyh@odnoklassniki.ru','U822@ePcTd7097',9094106386,524320038656042),('S354193404','Benson','bmilstead5@walmart.com','F049@KRoHd3764',9677980386,634979012932657),('S379796188','Noelani','nwaplesg@elegantthemes.com','h685@dHQPd1918',7182196111,503509899249819),('S417300728','Keeley','kmulcasteri@nasa.gov','g339@CCBed1663',9237860174,284477469994070),('S435930800','Onfre','ofurney3@ovh.net','X230@qsAUd8956',4412618250,600308175596585),('S465322822','Corella','ctewkesburyc@tripod.com','y745@hjGAd7386',1633325282,123126989168610),('S510090220','Efrem','ebrownell1@bizjournals.com','M492@fRxyd2198',1778511882,951604440258806),('S524137594','Alan','abilslande@who.int','s051@RALXd4619',3764834198,538129282765090),('S547807376','Emalia','ejoseff2@vk.com','U669@kEAdd8929',7837783675,490163004536253),('S616278881','Doria','dleidl0@hubpages.com','I496@oxYCd9270',5371853936,689556333125812),('S625135673','Ofilia','omccalumf@unicef.org','p771@OBaNd0073',1442051884,407462052217692),('S645190621','Abram','akirgand@wix.com','Q842@XBrKd2984',2349859097,818325616045632),('S787442480','Vilhelmina','valwen6@wp.com','N543@AlMCd8132',4135978629,667569852879155),('S798233806','Gray','glaughrey8@last.fm','F551@yNLvd3042',5637311184,868263177689177);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
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
