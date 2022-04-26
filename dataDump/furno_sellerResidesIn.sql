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
-- Table structure for table `sellerResidesIn`
--

DROP TABLE IF EXISTS `sellerResidesIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellerResidesIn` (
  `addressID` char(10) NOT NULL,
  `sellerID` char(10) DEFAULT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `userState` varchar(50) NOT NULL,
  `zip` decimal(6,0) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `sellerID` (`sellerID`),
  CONSTRAINT `sellerResidesIn_ibfk_1` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`sellerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellerResidesIn`
--

LOCK TABLES `sellerResidesIn` WRITE;
/*!40000 ALTER TABLE `sellerResidesIn` DISABLE KEYS */;
INSERT INTO `sellerResidesIn` VALUES ('00124I2y4j','S547807376','Nevada','Austin','Texas',179064),('00tN83DU4p','S417300728','Ridge Oak','Greensboro','North Carolina',199347),('07zj69KX43','S204980942','Heffernan','Wichita','Kansas',188412),('085vm94Y8r','S214997995','Green Ridge','Odessa','Texas',171688),('0kNCQ86Xzr','S798233806','Hovde','Birmingham','Alabama',125953),('110Mz8k2rT','S625135673','Corscot','Miami','Florida',118926),('216MmA6qvU','S787442480','Holy Cross','San Antonio','Texas',170393),('24f1q6h2v2','S524137594','Anderson','New Haven','Connecticut',151140),('2bLrJ5Is3n','S349637186','Manitowish','Portsmouth','New Hampshire',197090),('2J2AmDJZ1i','S379796188','Lukken','Houston','Texas',193376),('2K50052pdW','S349637186','Spenser','Wichita','Kansas',161898),('2OqZS9415K','S787442480','Grim','Atlanta','Georgia',125641),('30W5SCn9s8','S417300728','Donald','San Antonio','Texas',130292),('357Son2D40','S274388661','Vernon','Honolulu','Hawaii',111081),('35A88q6J5y','S417300728','Northport','Austin','Texas',183985),('39XW31sG22','S214997995','Gateway','Boston','Massachusetts',146207),('3jGC80c76T','S214997995','Carpenter','Dayton','Ohio',196950),('3P6InlbN0W','S417300728','Beilfuss','Denver','Colorado',105995),('4738376fpv','S645190621','North','Bakersfield','California',189866),('498589505s','S354193404','Darwin','Rochester','New York',121583),('4b56tb1aw5','S616278881','International','Bakersfield','California',119895),('4GtMA3441B','S114400724','Hoepker','Miami','Florida',104191),('4hsFBMl810','S073588105','Dwight','Colorado Springs','Colorado',117420),('4k3716lJJN','S645190621','Troy','Kansas City','Kansas',155764),('537fP4tZUP','S616278881','Gulseth','Las Vegas','Nevada',167488),('545041Wp4Q','S510090220','Norway Maple','Pittsburgh','Pennsylvania',185212),('5DXm775Gve','S204980942','Dayton','Henderson','Nevada',127258),('5i873jR1p8','S798233806','Sherman','El Paso','Texas',169053),('5Md4P49lm1','S337395433','Chive','Houston','Texas',189711),('5RI72585U3','S073588105','Lakewood','Atlanta','Georgia',170220),('5rSF578UEZ','S274388661','Eliot','Stockton','California',142592),('5yL832i2L7','S510090220','Manitowish','Cincinnati','Ohio',143306),('66vE5FljGp','S625135673','Meadow Valley','Orlando','Florida',124717),('6e781E2BZ2','S465322822','Monterey','San Angelo','Texas',189012),('6eS13dTD44','S510090220','Montana','Tempe','Arizona',157022),('6hmF7555s5','S354193404','Carioca','Amarillo','Texas',154284),('6M564Bd2ua','S798233806','Huxley','Bradenton','Florida',107756),('6qa20V94R4','S204980942','Oneill','Newark','Delaware',191709),('708059I3eI','S787442480','Pawling','Portland','Oregon',140693),('73737ti8Y9','S204980942','Kingsford','Inglewood','California',167042),('74iP9008XP','S547807376','Northwestern','Palm Bay','Florida',130072),('74zI01s858','S354193404','Golf View','Seattle','Washington',195520),('75Lp963XIS','S547807376','Larry','Des Moines','Iowa',110750),('7K9y0lSX56','S214997995','Fuller','Waterbury','Connecticut',127497),('7Ww8p2Bi0z','S465322822','Oak Valley','Carol Stream','Illinois',136307),('821KyhsV1o','S274388661','Northview','Philadelphia','Pennsylvania',120420),('8v04MtzC22','S354193404','Maple Wood','Pittsburgh','Pennsylvania',167896),('911xo35U85','S114400724','Saint Paul','Madison','Wisconsin',137466),('994ctjNab3','S435930800','Lyons','Zephyrhills','Florida',114259),('9igT5IdEz6','S114400724','Golf Course','Dayton','Ohio',135911),('9ognAnB52a','S798233806','Artisan','Mountain View','California',188268),('9ovR1d5jq8','S274388661','Mariners Cove','Sacramento','California',167148),('a8Q21042Dq','S073588105','Moland','New York City','New York',158940),('ar23r64E08','S625135673','Hayes','Atlanta','Georgia',182639),('C2FqnC4k41','S379796188','American','Huntington','West Virginia',165415),('C3434N38LW','S349637186','Helena','Charlottesville','Virginia',175458),('c8iEj0AQBl','S625135673','Cascade','Beaumont','Texas',194953),('cKsvT90Lj6','S625135673','Oriole','Corpus Christi','Texas',177248),('cV55eS5q1s','S337395433','Forest Run','Saint Louis','Missouri',140243),('Df3H51mexg','S547807376','Laurel','Little Rock','Arkansas',135319),('dJHN1kG83U','S645190621','Drewry','Clearwater','Florida',134314),('do7u53G003','S524137594','Londonderry','Manchester','New Hampshire',187205),('eiI9DFpj2y','S435930800','Northland','Atlanta','Georgia',127371),('f49Gyu8TR0','S524137594','Lakewood','Hampton','Virginia',110738),('F6ko5Fu4E3','S274388661','Carberry','Riverside','California',174656),('g5ZBpMT4b8','S204980942','Browning','Saint Louis','Missouri',139738),('G677lBGEOM','S616278881','Declaration','Springfield','Massachusetts',144162),('hNZrXD248Z','S417300728','Clyde Gallagher','Detroit','Michigan',166999),('ho039F989B','S435930800','Sunbrook','Dayton','Ohio',148124),('I6I435k4fG','S524137594','Buell','Boca Raton','Florida',118505),('j46Bi4Wa9L','S379796188','Almo','New York City','New York',184641),('Lz7gS81a69','S616278881','Corben','New York City','New York',107332),('m0VV0wX73s','S510090220','Dwight','Odessa','Texas',111740),('Mn804Nc2mb','S787442480','Clarendon','Fresno','California',164814),('n26V8SMD84','S435930800','Hudson','Richmond','Virginia',165285),('O7pM00hlw0','S616278881','Grayhawk','Irvine','California',167497),('OC477dZXe4','S465322822','Little Fleur','Fort Worth','Texas',183349),('Oe3F5V2D67','S435930800','Marquette','Oklahoma City','Oklahoma',114989),('p3S32aJ914','S354193404','Texas','Oklahoma City','Oklahoma',160317),('P78M9poz96','S073588105','Continental','Albany','New York',152069),('piZqPOD500','S337395433','Dovetail','El Paso','Texas',181415),('Q02CBsdG7N','S787442480','Sullivan','New York City','New York',123573),('Q28kRJtSz8','S465322822','Prentice','Moreno Valley','California',157763),('Q5x2848f8f','S645190621','Cambridge','Memphis','Tennessee',151356),('qq1w0a0pOW','S349637186','Menomonie','Denver','Colorado',187684),('R9P06WfTc7','S337395433','Spaight','Van Nuys','California',109972),('S544255v6U','S379796188','Village','Peoria','Illinois',152835),('SU82T16w36','S465322822','Raven','Madison','Wisconsin',145420),('T69y9087J6','S524137594','Boyd','Brooklyn','New York',171439),('U13P8K87Bw','S349637186','Eagle Crest','Sacramento','California',170998),('v36eH2GH59','S214997995','Merchant','Vancouver','Washington',179297),('V481474p9P','S798233806','Warrior','Lexington','Kentucky',113277),('v57G06L527','S510090220','Arapahoe','Palmdale','California',194211),('VxM4w664U8','S073588105','Hazelcrest','Washington','District of Columbia',191613),('W37J2PcWf9','S114400724','Gina','Johnson City','Tennessee',177800),('xa33CHiVm9','S114400724','Stuart','Saint Cloud','Minnesota',179550),('xAPWU61c76','S379796188','Sunnyside','Phoenix','Arizona',158939),('XK7UKrk8F1','S337395433','4th','Hollywood','Florida',110571),('z68H1h2so9','S645190621','Village','Tampa','Florida',150861),('ZK76907x46','S547807376','Holmberg','Henderson','Nevada',101688);
/*!40000 ALTER TABLE `sellerResidesIn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 14:08:57
