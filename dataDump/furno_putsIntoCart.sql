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
-- Table structure for table `putsIntoCart`
--

DROP TABLE IF EXISTS `putsIntoCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `putsIntoCart` (
  `buyerID` char(10) NOT NULL,
  `productID` char(16) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`buyerID`,`productID`),
  KEY `productID` (`productID`),
  CONSTRAINT `putsIntoCart_ibfk_1` FOREIGN KEY (`buyerID`) REFERENCES `buyer` (`buyerID`) ON DELETE CASCADE,
  CONSTRAINT `putsIntoCart_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE,
  CONSTRAINT `putsIntoCart_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `putsIntoCart`
--

LOCK TABLES `putsIntoCart` WRITE;
/*!40000 ALTER TABLE `putsIntoCart` DISABLE KEYS */;
INSERT INTO `putsIntoCart` VALUES ('B009219197','dhCMJyesTupjvZlD',2),('B009219197','xSKCYncOudqTgGXo',1),('B012260331','CwjsbItMoUBTgdSq',6),('B012260331','cWwebtukljgsrBCL',2),('B012260331','VzrAnmtSyacWJNUX',4),('B012260331','yrsuJVRUbStCpwco',8),('B012566247','DFJyGiOvwZYKcECW',2),('B012566247','FnuhpUNJIMPrjYtl',8),('B012566247','iteVQnJHEryamoZf',5),('B012566247','NmCKneWhqaOFcBfA',3),('B012566247','YJBWLHDjgFEPymNz',7),('B012566247','YMzCVIxsTriaJOhF',3),('B016077550','LoKflduZrqctUSHI',3),('B016077550','pngbDXUzqQFtLsoS',5),('B017491400','eHLZTIMgnErNfAuS',5),('B035048652','AxKklzVuqGSwZLmH',8),('B035048652','eHLZTIMgnErNfAuS',7),('B035048652','ewVBsEukXiUIMPZj',6),('B035048652','fHmqQNLyZhAGzguB',9),('B035048652','KuXfDokOqwHysNPc',3),('B035048652','PxmiZLDWrwIdaASG',2),('B035048652','sGAcSUJhoteHmFnC',4),('B036873428','ANODyoYKbCjVwuIp',10),('B036873428','HxtWGEyfhaqzYZwB',4),('B036873428','imVsTYZnFxrDEzyM',8),('B036873428','OwzycZgFpPYlosem',7),('B036873428','yidCbsLYgcZVQrqp',6),('B038562338','cPYMlvjQUAihKnIs',5),('B038562338','IsqvCMGyzTeDHcZk',8),('B038562338','LTKIMDSWYkfRxmHu',10),('B038562338','NmCKneWhqaOFcBfA',3),('B038562338','pPnBDRWoVhQctdiI',1),('B038562338','ruyQoUOXMheTkLFt',6),('B040198589','CyxHSUkFMNBtRgjX',7),('B040198589','doaGvTOeYpMzkZyD',9),('B040198589','EuNetcioJfgQXpTy',3),('B040198589','TbnBaOCYKZSrgwGy',6),('B048707726','gksmGSYvuPlrEtzn',3),('B048707726','sfoDITdbAjBPGJFw',8),('B054458760','BgFYUipbZuAlMmOq',5),('B054458760','CUIWctbzhBEDufKk',1),('B054458760','kzZeFARrbtGBXWYa',3),('B054458760','YZFKwhJdNrvLkbHj',3),('B060449539','AofhOdEuQWGCtrqK',7),('B060449539','AYaJjQXFBlGycmKP',7),('B060449539','BoftwLPyJEFAuKpi',10),('B060449539','ChUNeaszrEnyMKDT',10),('B060449539','gPoGWEJViIRYUvmL',1),('B060449539','PBYHNZuSqtIcEOFR',8),('B060449539','WTulwZxUKrEjJCkp',4),('B068301835','CpsbwUyguWShxNoq',6),('B068301835','NugMYemVtUSoCsjF',4),('B068301835','UPnTMpwvNatQLWbV',5),('B068945445','BelRuqvsfPtEDkAK',4),('B068945445','bZgtSmcIfukipaCR',6),('B068945445','ckoFOyQrepaCGZgj',4),('B068945445','GswtTkSeLqrfEUzW',8),('B068945445','KdGtCgXwBRYOVSoD',4),('B068945445','mkDfwaVQhMRAsCyx',10),('B068945445','pMwueTfxjsCmhlLd',10),('B068945445','RoMlnLAZsXhvSTCY',5),('B068945445','rtlysocSXYTEuDpW',5),('B081277024','FnwtERWPXalfdBNq',10),('B081277024','hBbKjWciEFUsXJmH',2),('B081277024','iHtWeNLKhyAgCJlY',10),('B081277024','TMzFvqLgRVjswfXD',7),('B097196503','NlWpIEQFBGUdfJhu',1),('B097196503','xLlUPCJMucOhqgFd',1),('B102834395','gcnIjbySGJOXrkzR',7),('B102834395','JBSVXHwPrCsxTpWb',2),('B102834395','SxKpjVmMfhzeCGZL',10),('B102834395','tAmiOnNfajpRIdlV',9),('B102834395','uDkLXydYZFpMjhSm',3),('B102890038','ewVBsEukXiUIMPZj',8),('B102890038','TbnBaOCYKZSrgwGy',2),('B102890038','ZCxMlRcksPGjHdNf',10),('B112719487','dzkJILZcWPwoSMxF',7),('B112719487','nApwzTIoijMWlJyF',8),('B112719487','PBLndUZMoOuJQtIC',5),('B112719487','StuHvbnNUafLRXZE',7),('B112719487','uxYKXaLvcwifmMTQ',2),('B112719487','vMxWLDlXiqEOSPVn',5),('B112719487','XjLQzDGKrhuVPSmF',2),('B115874602','LTKIMDSWYkfRxmHu',6),('B115874602','wopfKZcQzMVPAsJq',8),('B115874602','zjrsilRkqBvgLmoh',9),('B118806999','CImnPqeYgHdlhoQE',7),('B118806999','ETDAeasKmYXkJQHB',4),('B118806999','eTQXphnSGazbEDqM',7),('B118806999','fxPMEXCKSIbYBoQz',1),('B118806999','HGzAIquKLVjwEpdc',2),('B118806999','pyGaBcIxYVDTNtwQ',8),('B118806999','xsTHVDUPaRmEfrnQ',2),('B119548160','CiWgEyLshOtIkwFf',8),('B119548160','cVxJaBrwmXOvGhEM',7),('B119548160','eGXKaolcBLHrDVgA',8),('B119548160','vIlgnAhSkqpiCBZr',8),('B119548160','vmECclLxiUAeQRws',2),('B119548160','zjrsilRkqBvgLmoh',2),('B131217765','mFuziDyPlWAeLNZh',5),('B131217765','sjUXoLgOecZyIqnN',6),('B134049601','QvGLAlinNDetUmqB',1),('B137041398','ERbZwCHlqaLrNKop',1),('B137041398','VWqDStAEIKmyLdaY',1),('B144966115','oOIHnxVtkBbPhrfN',10),('B144966115','PMnKRGtulyjpwUCD',8),('B144966115','QxLGKEJjFNtTSnbe',8),('B144966115','uEKaTLgtZmPleACJ',10),('B144966115','VfKtvGMlhDIBeUmx',9),('B144966115','YKqUAfyVnvOopMEJ',7),('B144966115','YounOGJeVXEPrIkd',1),('B162085982','cLNYUGHaqzrTgtyo',6),('B162085982','joFrRMfbwVTIEtNW',5),('B162085982','kIcLtsGvghOwNpeS',3),('B162085982','VWqDStAEIKmyLdaY',7),('B175850955','AacmbYBNqFvUsSln',8),('B175850955','CviXEagMmVPdtjAJ',9),('B175850955','EUoqxYyGdepBAwzr',2),('B175850955','JuwfYSMyOLvBjhdP',7),('B175850955','jwpBxMEmsXOWrYUZ',7),('B175850955','SiNfXHQLdMCBqTpF',10),('B175850955','SYvgKOpDnctTrslf',10),('B176472698','nApwzTIoijMWlJyF',6),('B176472698','VzbHSafGxXDRuLmy',7),('B183076576','JOosywKAErvzLMtP',6),('B183076576','sMdyiRAtrqQmVfST',9),('B183076576','VYIzUCWAmDgTtpEX',6),('B186417652','FnwtERWPXalfdBNq',2),('B186417652','gazRmLQYsXEpSCTP',7),('B186417652','jParMetnVcZOJquR',7),('B186417652','kJsfhXiSytGjNOHY',2),('B186417652','kQJVTMvWzXfamSjI',9),('B186417652','MdrLOsSbTDmcluzC',6),('B186417652','mzUbrsZtQelwLiDY',10),('B186417652','PoLdNXIqGzMYSVHw',10),('B198590047','eHLZTIMgnErNfAuS',6),('B198590047','HQJyvCAqlSihKDYm',4),('B198590047','ILnwPluAdOHzrxqC',1),('B198590047','TGnAKsLVrHhwegYW',3),('B202139865','bvZmPitRJGIrXLBM',4),('B202139865','FlKZpoeiTEPCcMxv',7),('B202139865','gcnIjbySGJOXrkzR',7),('B202139865','LZOzeawUvWoNGthF',10),('B202139865','ngQBXtThCArxicpm',9),('B202139865','SiNfXHQLdMCBqTpF',9),('B202139865','UPnTMpwvNatQLWbV',1),('B210516291','EQirMJGlPjYxBXbU',4),('B210681270','BRKWrsOwvZShHjbq',5),('B210681270','fguworTYhCmvDKNn',4),('B210681270','GevgyTrCaVAlBtfR',5),('B210681270','LgMeOTuCywcmIolA',9),('B210681270','NYEFgowhpdPbJukB',8),('B210681270','oSGXVUWwyhbjMmLv',1),('B210681270','pLTkvCXeEWnwVIiR',2),('B217405161','AjqlgHVtyKdnEsiv',6),('B217405161','BelRuqvsfPtEDkAK',1),('B217405161','hIqFQuDAHvLYCtnp',5),('B217405161','kSyULOIrDEpfjHsw',9),('B217405161','PAxyNTBQveSYnoUI',4),('B218673334','ChUNeaszrEnyMKDT',1),('B218673334','kVvBnxQfEeKrWztP',2),('B218673334','NZPTUynbWgVmxraH',8),('B218673334','OwzycZgFpPYlosem',5),('B218673334','oZqDJIiKysUdONjk',2),('B218673334','ZjOrFKQdapzwbBSI',10),('B221530539','acjsxnimfqeLYruS',8),('B221530539','dhCMJyesTupjvZlD',8),('B221530539','NctTnyuRWahjVHCE',8),('B227528988','AYaJjQXFBlGycmKP',5),('B227528988','pPnBDRWoVhQctdiI',2),('B227528988','WGDhCVLcouarBdFK',10),('B227528988','zKxDwfRnvgiEacyY',5),('B229298990','bRCauGHwXxlNzPvS',6),('B229298990','CviXEagMmVPdtjAJ',5),('B229298990','NlWpIEQFBGUdfJhu',9),('B229298990','okBhslKnpQPFmEaZ',7),('B229298990','sKLJfTBexAXanURo',7),('B229298990','XzoanbmPpeZGBIvd',10),('B233439554','aWtoYZAfNgiKRrFP',6),('B233439554','CImnPqeYgHdlhoQE',5),('B233439554','OwzycZgFpPYlosem',1),('B233439554','rtlysocSXYTEuDpW',2),('B233439554','YWbVkGFCLlADQcBo',8),('B235329190','beMykJArcHvdLQKG',10),('B235329190','cjQAmZaXBHsKtkew',2),('B235329190','sichJdoUHBVutSAM',4),('B235329190','WSFEyziVuZYbIwpr',9),('B235329190','WTulwZxUKrEjJCkp',3),('B239746016','BfRwdnvjYNtqauHp',9),('B239746016','gFsJzHRANDWCqcid',5),('B239746016','pJGRFgzvKUXfDYjk',6),('B243254773','JWQylgmpsjEOvDYn',1),('B243254773','oEmIjgzkPwnschHb',1),('B243254773','VaQCphOlKriMkSYc',8),('B243254773','xedPbrlsczCXNgSA',3),('B243583121','AFlxmKPZCYLTdhIQ',7),('B243583121','APkMceyhSaoUxIQF',7),('B243583121','CZiwaVQzKTABeFYq',10),('B243583121','KGrEJpHNazLOCnZo',10),('B243583121','sGAcSUJhoteHmFnC',5),('B243583121','VSTvUaEqhgQZfbLy',5),('B243583121','XhwyNZjOHnWJkxpA',7),('B243583121','yNrbkvTpZoIsqPSe',7),('B244296120','DGoFgSWdVKavyqRO',4),('B244296120','fhEkXimxQZtLvVyH',3),('B244296120','ILAXzqRfixJsUkcn',5),('B244296120','NZPTUynbWgVmxraH',9),('B244296120','PShelxTmUijvYIwX',6),('B244296120','rtlysocSXYTEuDpW',4),('B244296120','SuNbQoYhDlZarnwk',10),('B244296120','uxYKXaLvcwifmMTQ',5),('B244296120','vIlgnAhSkqpiCBZr',1),('B244491930','HKrBxWZGjakhwdbm',3),('B244491930','lCDJaGMLyvNWuzjm',6),('B244491930','nLYeamrpzbohDyEN',1),('B244491930','QVotiKYFLlcJHqhj',2),('B244491930','zYawSsdknViomrGl',6),('B253545060','moxZpjktANqSWMug',7),('B253545060','PAxyNTBQveSYnoUI',4),('B253545060','sHKPWoACjFueDiNm',3),('B260063151','EKtMzhVpIgefjvLm',3),('B260063151','JPoLuvhldcFkrKOB',3),('B260063151','pJGRFgzvKUXfDYjk',8),('B270417351','BoftwLPyJEFAuKpi',1),('B270417351','CiWgEyLshOtIkwFf',1),('B270417351','mdIYApCiJohwsfxP',3),('B270417351','nApwzTIoijMWlJyF',5),('B270417351','xfNatkqCJnlReVTp',4),('B270417351','ydbWxZiBhpKSOfnN',4),('B271110312','SDMcuzQCxvNwWGpd',3),('B271110312','sMdyiRAtrqQmVfST',6),('B271110312','wXcEvyfnBAMkLbil',4),('B272662546','aecySZWgVRXdoNnh',9),('B272662546','gLVxMYEWhUlewFSt',6),('B272662546','hgyaZjeKCNLfupPH',6),('B272662546','QspxZCqMRSWLvreY',5),('B272662546','yJRfjUWIOdzQvqLH',9),('B272788065','naPFBzDJeuAkXsmp',9),('B272788065','ZmCgifTdutNLUsKw',4),('B280014385','GevgyTrCaVAlBtfR',1),('B286356548','lrfKSOhBvWEYTQse',1),('B286356548','PioAaCpVXnZfcRwU',4),('B286356548','ruyQoUOXMheTkLFt',1),('B287226755','CiWgEyLshOtIkwFf',6),('B287226755','iwZanOdJxPMqBmlE',7),('B287226755','ScHEKpkdVNuWODxC',6),('B287226755','yFZeKpLxdDaVcwRl',1),('B287226755','YKqUAfyVnvOopMEJ',1),('B287270907','haADlWoLztYcsqMr',4),('B287270907','iwZanOdJxPMqBmlE',8),('B287270907','JPoLuvhldcFkrKOB',6),('B287270907','PoLdNXIqGzMYSVHw',7),('B287270907','rgVUPLiGIthWKMpY',7),('B287270907','ScHEKpkdVNuWODxC',1),('B287270907','YJBWLHDjgFEPymNz',3),('B290077170','AofhOdEuQWGCtrqK',2),('B290077170','GlOtRiHECaxyfuYJ',6),('B290077170','hBbKjWciEFUsXJmH',2),('B290077170','iYqCaypzUdJRGmnA',9),('B290077170','NubJxSkTYPcwmefK',2),('B290077170','XzoanbmPpeZGBIvd',8),('B290790025','CfJrlWVyxiHYdPAI',4),('B290790025','HxtWGEyfhaqzYZwB',9),('B290790025','iQKFspfnXwWjklRg',6),('B290790025','KGrEJpHNazLOCnZo',5),('B290790025','ndPxYiSzaWELCtbq',8),('B290790025','rQpsIRkdxSvAehUF',5),('B290790025','SiNfXHQLdMCBqTpF',3),('B290790025','siTFnoWNjXgACPyv',5),('B290790025','yJRfjUWIOdzQvqLH',8),('B290790025','YWbVkGFCLlADQcBo',4),('B291031951','aecySZWgVRXdoNnh',4),('B291031951','GswtTkSeLqrfEUzW',4),('B291031951','xfNatkqCJnlReVTp',9),('B292797366','niUBIegFZQkGCJfP',1),('B292797366','XDNVpEHcPGAROdJx',9),('B298449044','HLhenNqxQaTydSgO',6),('B298449044','imxSnkIMoFOPwhld',3),('B298449044','JWwIGqMHtURTCEea',9),('B298449044','SniblrYUFyINqguG',4),('B298449044','ZnGwIjLJoVNShfxX',3),('B304958554','eIsOkFWSzPNZJoLX',1),('B304958554','OlhSKRDUGejpkfXP',7),('B304958554','QXnrbNzBMwJivAxd',2),('B311847480','aPtUbdwIvsyFKlre',2),('B311847480','AYaJjQXFBlGycmKP',1),('B311847480','hgyaZjeKCNLfupPH',7),('B311847480','kzZeFARrbtGBXWYa',6),('B311847480','oZqDJIiKysUdONjk',1),('B311847480','XjLQzDGKrhuVPSmF',5),('B311847480','yawchBQbHAmMptTg',10),('B313630423','NjFEtXSGlZgLaMJB',3),('B313630423','uEKaTLgtZmPleACJ',5),('B317673382','mFJjfqVKHnIbRrNi',2),('B317673382','pGZhnEujtvCHzxRy',5),('B317673382','rgVUPLiGIthWKMpY',6),('B317673382','siTFnoWNjXgACPyv',2),('B317673382','vcQHzkOGaoTsqwXA',3),('B321600139','dweEFWVavNJbnHDs',5),('B321600139','imVsTYZnFxrDEzyM',3),('B321600139','SDMcuzQCxvNwWGpd',4),('B321600139','VaQCphOlKriMkSYc',5),('B321600139','VSAwipzDFKbNfJWh',5),('B321600139','ZALDwneXzkyijoVm',7),('B328085309','ndPxYiSzaWELCtbq',2),('B328085309','SuNbQoYhDlZarnwk',4),('B344942959','JWwIGqMHtURTCEea',4),('B344942959','kQJVTMvWzXfamSjI',1),('B344942959','MdrLOsSbTDmcluzC',3),('B344942959','SPhkMlrXHAzFqYxV',5),('B344942959','XsQBLSHvDrygnEpb',5),('B350706175','APkZqtoavQRBICWw',1),('B350706175','ChUNeaszrEnyMKDT',6),('B350706175','CviXEagMmVPdtjAJ',5),('B350706175','haADlWoLztYcsqMr',9),('B350706175','MUboxQZIwHtBmdXv',4),('B350706175','rmJKZuqXlvtYCSzy',7),('B351752299','GBIynFXMfaOAHbUN',1),('B351752299','hIqFQuDAHvLYCtnp',8),('B351752299','wRXlHiMhrVkEPbay',8),('B354934402','GevgyTrCaVAlBtfR',2),('B354934402','ILAXzqRfixJsUkcn',4),('B354934402','SiNfXHQLdMCBqTpF',8),('B361342196','CcMxnUeJzurkDYTO',5),('B361342196','EfoAbCFDRqNOxahK',3),('B361342196','SPhkMlrXHAzFqYxV',4),('B361342196','VNcgalinQBJqODZM',5),('B361342196','YounOGJeVXEPrIkd',1),('B361393090','hlALzqWraxMngYJd',7),('B361393090','HxtWGEyfhaqzYZwB',6),('B361393090','lZFXpoCnjDKHNreh',5),('B361393090','niUBIegFZQkGCJfP',10),('B361393090','VNcgalinQBJqODZM',4),('B361393090','WfqJmkLvShPbcxIA',7),('B364594722','donBEvTcmfzpIuhg',3),('B364594722','nmgsLfTUJoitHwhK',3),('B369660594','ACkPelpviYmsoUwD',5),('B369660594','GdOAxRWuDYCnmHNi',10),('B369660594','iYqCaypzUdJRGmnA',4),('B369660594','kJsfhXiSytGjNOHY',1),('B369660594','okEOyeMKnJYcGmWj',1),('B369660594','RKUBVmQwxFcpjuti',3),('B369660594','TMzFvqLgRVjswfXD',1),('B377408081','ERbZwCHlqaLrNKop',3),('B377408081','iteVQnJHEryamoZf',1),('B377408081','kSyULOIrDEpfjHsw',7),('B377408081','VWvImTrRxktpNfZe',9),('B377408081','yawchBQbHAmMptTg',10),('B381176002','cqghvSAndGQjkiYa',3),('B381176002','gLVxMYEWhUlewFSt',1),('B381176002','VpgNKJIHrMwhtbRU',4),('B383033714','CviXEagMmVPdtjAJ',9),('B383033714','CyxHSUkFMNBtRgjX',2),('B383033714','IefyCZWuRvsmckTE',5),('B383033714','okBhslKnpQPFmEaZ',4),('B383033714','PBYHNZuSqtIcEOFR',9),('B383033714','sKLJfTBexAXanURo',4),('B383033714','ydbWxZiBhpKSOfnN',7),('B390545754','HPLFkyuvxSGBpJYT',8),('B390545754','SXfrKDTJendNWaFU',10),('B398247893','EhbdNvQgRrVFZktH',8),('B398247893','VSAwipzDFKbNfJWh',9),('B401884097','EUoqxYyGdepBAwzr',9),('B401884097','fHmqQNLyZhAGzguB',5),('B401884097','YfORvWtoKSDpdsUn',8),('B405166073','sjUXoLgOecZyIqnN',5),('B405166073','UPnTMpwvNatQLWbV',4),('B405166073','URhEdtKYszfxwNly',9),('B405166073','UZlfPXMJLncYmvdV',9),('B405166073','XhwyNZjOHnWJkxpA',1),('B405166073','yNrbkvTpZoIsqPSe',4),('B409489297','LTKIMDSWYkfRxmHu',8),('B409489297','QYKZBTXpreWMsPij',5),('B409489297','sHKPWoACjFueDiNm',5),('B409489297','xfNatkqCJnlReVTp',9),('B413643205','PdnULBZQCfhaMwmO',6),('B416426910','CUIWctbzhBEDufKk',3),('B416426910','HLhenNqxQaTydSgO',10),('B416426910','NugMYemVtUSoCsjF',7),('B416426910','NYEFgowhpdPbJukB',3),('B416426910','QZvIdAixpbYzmWtu',10),('B416426910','xufOUZmEAQaWyTnq',8),('B424548968','FnuhpUNJIMPrjYtl',1),('B424548968','gazRmLQYsXEpSCTP',4),('B424548968','jKdnrEZJwePROiHc',10),('B424548968','PBLndUZMoOuJQtIC',9),('B424548968','sichJdoUHBVutSAM',10),('B424548968','TcnpXfuSRWFkNqBK',10),('B424548968','uEKaTLgtZmPleACJ',10),('B447661290','CpsbwUyguWShxNoq',10),('B447661290','eHLZTIMgnErNfAuS',2),('B447661290','gazRmLQYsXEpSCTP',1),('B447661290','kQJVTMvWzXfamSjI',2),('B447661290','lPIfaStcEwNOmGCX',7),('B447661290','PShelxTmUijvYIwX',10),('B447661290','VSTvUaEqhgQZfbLy',10),('B447661290','YZFKwhJdNrvLkbHj',6),('B450740276','HGzAIquKLVjwEpdc',3),('B450740276','PUbdhNFxeSjwQfkt',6),('B450740276','XDNVpEHcPGAROdJx',4),('B450740276','ZIhNMoRTqOgBKiGF',9),('B458525107','efAsmnOabhICWtXD',5),('B458525107','HPLFkyuvxSGBpJYT',1),('B458525107','PShelxTmUijvYIwX',5),('B458525107','PxmiZLDWrwIdaASG',6),('B458525107','uEKaTLgtZmPleACJ',2),('B458525107','VzrAnmtSyacWJNUX',8),('B464104938','ATWeptKzFfGcjHro',9),('B464104938','BRKWrsOwvZShHjbq',1),('B464104938','EkyIKhXcaBQseFSD',9),('B464104938','nXeGqfimyLQKSMpE',9),('B464104938','vmECclLxiUAeQRws',7),('B465502505','AjqlgHVtyKdnEsiv',7),('B465502505','eIsOkFWSzPNZJoLX',4),('B465502505','IETtAhMegoJHVqdm',2),('B465502505','lohcPZLTXQeIbKzC',3),('B465502505','MqHAplsCPQRroheE',5),('B465502505','UZlfPXMJLncYmvdV',4),('B465502505','wopfKZcQzMVPAsJq',6),('B465502505','ZCxMlRcksPGjHdNf',6),('B468476840','aecySZWgVRXdoNnh',8),('B468476840','AxKklzVuqGSwZLmH',7),('B468476840','FfVSTNUozywgGrOa',5),('B468476840','gqVDnxpmiUhsIyPw',10),('B468476840','JOosywKAErvzLMtP',5),('B468476840','WvEmTUHXSjALKhoM',2),('B468476840','XDNVpEHcPGAROdJx',10),('B470384396','eAiGpQxjhETUZdvt',1),('B470384396','MYBxEciHqwnpSZXu',7),('B470384396','MZaxurgwIhofRyYn',2),('B470384396','NYEFgowhpdPbJukB',1),('B470384396','ZmCgifTdutNLUsKw',5),('B472989623','efAsmnOabhICWtXD',9),('B472989623','KuXfDokOqwHysNPc',8),('B472989623','nMhiHyZBQCSzFofJ',5),('B472989623','zYawSsdknViomrGl',5),('B486803754','BgFYUipbZuAlMmOq',4),('B486803754','CImnPqeYgHdlhoQE',10),('B486803754','mFJjfqVKHnIbRrNi',5),('B486803754','okEOyeMKnJYcGmWj',8),('B486803754','UPnTMpwvNatQLWbV',10),('B486803754','WvEmTUHXSjALKhoM',9),('B489328073','APkZqtoavQRBICWw',4),('B489328073','BgFYUipbZuAlMmOq',3),('B489328073','HKrBxWZGjakhwdbm',5),('B489328073','RKUBVmQwxFcpjuti',6),('B489328073','SiNfXHQLdMCBqTpF',10),('B489328073','SYvgKOpDnctTrslf',8),('B493850621','ILAXzqRfixJsUkcn',9),('B493850621','jdMvZOJVTLnrfCQS',5),('B493850621','wopfKZcQzMVPAsJq',10),('B495590530','HGzAIquKLVjwEpdc',4),('B495590530','uxYKXaLvcwifmMTQ',7),('B495590530','VOlYraBumQhwpNAx',2),('B502094938','aPtUbdwIvsyFKlre',7),('B502094938','EbTYVZaAIMJPvBqQ',9),('B502094938','gFsJzHRANDWCqcid',7),('B502094938','PMnKRGtulyjpwUCD',7),('B502094938','sMdyiRAtrqQmVfST',3),('B502094938','UDcjGWmRqNXoFuPL',3),('B507542953','IETtAhMegoJHVqdm',5),('B507542953','NctTnyuRWahjVHCE',5),('B507542953','zjrsilRkqBvgLmoh',1),('B512089397','CfJrlWVyxiHYdPAI',7),('B512089397','WGDhCVLcouarBdFK',9),('B514733917','fhEkXimxQZtLvVyH',6),('B514733917','xSKCYncOudqTgGXo',10),('B525597323','nRvfVIkSHOtgDUPL',5),('B525597323','SuNbQoYhDlZarnwk',4),('B526784672','ANODyoYKbCjVwuIp',4),('B526784672','cWwebtukljgsrBCL',9),('B526784672','DjmibRGPSBQXtKEJ',1),('B526784672','EhbdNvQgRrVFZktH',6),('B526784672','KVTWiCsrFqpQXYRk',8),('B526784672','PShelxTmUijvYIwX',6),('B528086692','DGoFgSWdVKavyqRO',9),('B528086692','lJpDRgSkxEdfUOMI',4),('B528086692','nRvfVIkSHOtgDUPL',1),('B528086692','SxKpjVmMfhzeCGZL',3),('B528086692','SYvgKOpDnctTrslf',10),('B528086692','xDcEykTloOagLzYd',1),('B528086692','zjrsilRkqBvgLmoh',1),('B533093347','iteVQnJHEryamoZf',3),('B533093347','tzmnxlbHWOUfquSp',7),('B533093347','YsGOKCvHrEVobdfX',1),('B533955586','JWQylgmpsjEOvDYn',9),('B533955586','nMhiHyZBQCSzFofJ',9),('B533955586','VnWgfXoGabFuAhpJ',9),('B533955586','WGDhCVLcouarBdFK',7),('B533955586','YHeQJUoXvgBtKCdz',9),('B535201675','KGrEJpHNazLOCnZo',1),('B535201675','MqHAplsCPQRroheE',3),('B535201675','qglXYwANEspZDSbe',6),('B554075784','fxPMEXCKSIbYBoQz',2),('B554075784','NhsebAyZjWCziXfR',10),('B554075784','yVESBxdmhwLlOToH',7),('B554075784','zKxDwfRnvgiEacyY',1),('B557879358','AjqlgHVtyKdnEsiv',6),('B557879358','donBEvTcmfzpIuhg',4),('B557879358','TDFvpMZhPumnqkog',6),('B558353926','jasfgYICiXeGpHrV',10),('B558353926','mDaIHvGBnhOJcbYs',1),('B558353926','xOyBoqcGZKEadQMw',5),('B559686894','ETDAeasKmYXkJQHB',7),('B559686894','FkJjUWKVZcGPDIwv',8),('B559686894','OENCTjZoxnJgiech',5),('B559686894','RoMlnLAZsXhvSTCY',3),('B559686894','yrsuJVRUbStCpwco',10),('B566612313','CkvZlwmorOKaAIxP',6),('B566612313','qglXYwANEspZDSbe',9),('B566612313','vmECclLxiUAeQRws',6),('B566612313','wopfKZcQzMVPAsJq',7),('B567762948','aPtUbdwIvsyFKlre',9),('B567762948','fhEkXimxQZtLvVyH',2),('B567762948','JWQylgmpsjEOvDYn',8),('B567762948','kVvBnxQfEeKrWztP',7),('B567762948','SuNbQoYhDlZarnwk',6),('B567762948','ucAVGqxrKFWkCUEj',4),('B567762948','ZXTRcYDzHmdOohPx',1),('B576572529','kQJVTMvWzXfamSjI',4),('B576572529','rQpsIRkdxSvAehUF',8),('B576572529','utaKXqJRPOmgChEx',8),('B586233109','GdOAxRWuDYCnmHNi',10),('B586233109','IBgncrAuQlZJSjys',5),('B586233109','JWwIGqMHtURTCEea',1),('B586233109','nKozasRwjhSrLvkf',1),('B586233109','QMbOlimTELtIKjpN',6),('B593218641','SDMcuzQCxvNwWGpd',10),('B595578646','GlOtRiHECaxyfuYJ',8),('B595578646','JOosywKAErvzLMtP',7),('B595578646','qDNOIQsJoXCuWdTU',4),('B600219004','cLNYUGHaqzrTgtyo',9),('B600219004','OQfUcgbLXYVPeZKu',8),('B600219004','UZlfPXMJLncYmvdV',9),('B610703939','bIVZTmgjsEiqxHRp',8),('B610703939','FYlOKvUxHANEDuta',8),('B610703939','jParMetnVcZOJquR',7),('B610703939','NjFEtXSGlZgLaMJB',5),('B610703939','wopfKZcQzMVPAsJq',9),('B610703939','XsQBLSHvDrygnEpb',2),('B610703939','XWnHafIMzGYAulTB',1),('B611867505','GdOAxRWuDYCnmHNi',3),('B611867505','LHJATnNKaQVzSiDt',6),('B611867505','pmaFteHErRkyqJAu',7),('B611867505','SXfrKDTJendNWaFU',4),('B613923581','haADlWoLztYcsqMr',9),('B613923581','HisndQMupefBAcgt',6),('B613923581','LHJATnNKaQVzSiDt',1),('B613923581','wRXlHiMhrVkEPbay',4),('B622409391','fhEkXimxQZtLvVyH',9),('B622409391','imxSnkIMoFOPwhld',4),('B622409391','UPnTMpwvNatQLWbV',6),('B622409391','WSFEyziVuZYbIwpr',8),('B626815762','GsiPBFptzvKLXYCQ',8),('B626815762','imVsTYZnFxrDEzyM',8),('B626815762','OENCTjZoxnJgiech',7),('B626815762','sMdyiRAtrqQmVfST',7),('B626815762','trTbdUgshNIuKvoj',2),('B628354070','lqVDwGnuAOetXQRp',3),('B628354070','NdPnXqiDBhJRrOpS',4),('B628354070','QspxZCqMRSWLvreY',10),('B628354070','TbnBaOCYKZSrgwGy',8),('B628354070','YDPMBWEapsFoZhCJ',10),('B628354070','YWbVkGFCLlADQcBo',8),('B630417871','EnURrmizAOySwuNW',4),('B630417871','LgMeOTuCywcmIolA',6),('B630417871','YfORvWtoKSDpdsUn',4),('B630417871','yNrbkvTpZoIsqPSe',6),('B644116499','AjqlgHVtyKdnEsiv',10),('B644116499','EfoAbCFDRqNOxahK',10),('B644116499','okBhslKnpQPFmEaZ',3),('B644116499','uorYUlIjisNSxDLH',1),('B654851493','bZgtSmcIfukipaCR',3),('B654851493','CmyouYBTWHrIwRGl',8),('B654851493','okEOyeMKnJYcGmWj',10),('B654851493','ouWcyvZShDNjqCLd',8),('B654851493','rgVUPLiGIthWKMpY',9),('B654851493','VSAwipzDFKbNfJWh',2),('B656829008','bRCauGHwXxlNzPvS',6),('B656829008','LHJATnNKaQVzSiDt',10),('B656829008','PBLndUZMoOuJQtIC',1),('B656829008','PSLYJRkVTgKpcXjC',9),('B656829008','qsAFevCIuxbkLDSw',10),('B662098077','cVxJaBrwmXOvGhEM',2),('B662098077','eIsOkFWSzPNZJoLX',5),('B662098077','mDaIHvGBnhOJcbYs',3),('B662098077','wopfKZcQzMVPAsJq',5),('B664873264','BgFYUipbZuAlMmOq',1),('B664873264','CkvZlwmorOKaAIxP',5),('B664873264','jwpBxMEmsXOWrYUZ',6),('B664873264','XzoanbmPpeZGBIvd',8),('B667562584','KugqjeNGzWafHIJn',7),('B667562584','sHThbZmfNQBjGnXF',10),('B667562584','tAmiOnNfajpRIdlV',5),('B667562584','UDcjGWmRqNXoFuPL',3),('B667562584','VWqDStAEIKmyLdaY',4),('B668588052','heEcWujAskfwynla',8),('B668588052','oSGXVUWwyhbjMmLv',10),('B670976844','ACkPelpviYmsoUwD',4),('B670976844','nmgsLfTUJoitHwhK',3),('B670976844','XUCjGRPDofezYFJg',5),('B670976844','YTBqdcwrzWySbZfG',10),('B676804777','HECumWkxFypKgjIl',4),('B676804777','HsCKeWrZOQpESNhq',6),('B676804777','MdrLOsSbTDmcluzC',8),('B676804777','mkDfwaVQhMRAsCyx',5),('B676804777','PBYHNZuSqtIcEOFR',9),('B684164187','APkZqtoavQRBICWw',1),('B684164187','cWwebtukljgsrBCL',4),('B684164187','EhbdNvQgRrVFZktH',6),('B684164187','fguworTYhCmvDKNn',10),('B684164187','haADlWoLztYcsqMr',1),('B684164187','oZqDJIiKysUdONjk',8),('B688432202','HxtWGEyfhaqzYZwB',7),('B688432202','niUBIegFZQkGCJfP',4),('B688432202','obxsGVEWmKuJQlFh',7),('B688432202','sKLJfTBexAXanURo',10),('B688432202','ZnGwIjLJoVNShfxX',9),('B688689421','CDizZcrgmTeSAvEF',2),('B688689421','CUIWctbzhBEDufKk',4),('B688689421','EkyIKhXcaBQseFSD',10),('B688689421','GevgyTrCaVAlBtfR',7),('B688689421','HQJyvCAqlSihKDYm',3),('B688689421','oEmIjgzkPwnschHb',2),('B688689421','PMnKRGtulyjpwUCD',7),('B688689421','QMbOlimTELtIKjpN',3),('B688689421','sSVTIoilZqjGwXrF',2),('B688689421','UfPwiNJnQbpmgTHt',9),('B690796287','CiWgEyLshOtIkwFf',7),('B690796287','CyxHSUkFMNBtRgjX',5),('B690796287','DOidvxTWNYJaBcGF',4),('B690796287','ivYCjhdGZQKSuxfq',4),('B690796287','WDBtouwFOpJPIQAm',6),('B690796287','ZIhNMoRTqOgBKiGF',3),('B695168072','APkMceyhSaoUxIQF',6),('B695168072','APZuVNnJxqtUpiMs',10),('B695168072','GswtTkSeLqrfEUzW',9),('B695168072','iteVQnJHEryamoZf',6),('B695168072','MZaxurgwIhofRyYn',5),('B695168072','XxsItOiUYhwzGumJ',3),('B695168072','YsGOKCvHrEVobdfX',10),('B717311276','cPYMlvjQUAihKnIs',7),('B717311276','tzmnxlbHWOUfquSp',4),('B717497871','djEpAmstDeTGIgZP',2),('B717497871','fJCWbTSGpdqlQxar',4),('B717497871','IefyCZWuRvsmckTE',4),('B717497871','imVsTYZnFxrDEzyM',1),('B717497871','NlWpIEQFBGUdfJhu',9),('B717497871','QLkSYXPbcgKwAoJh',2),('B722977702','fWwFuVLJdAaBqMgc',3),('B722977702','OQfUcgbLXYVPeZKu',6),('B722977702','pmaFteHErRkyqJAu',6),('B722977702','PSLYJRkVTgKpcXjC',6),('B729982539','ILnwPluAdOHzrxqC',7),('B729982539','PoLdNXIqGzMYSVHw',4),('B729982539','QkienKXTZqUALHcW',7),('B729982539','WGDhCVLcouarBdFK',7),('B729982539','YfORvWtoKSDpdsUn',9),('B731981682','cPYMlvjQUAihKnIs',2),('B731981682','fJCWbTSGpdqlQxar',5),('B731981682','hfaGOZbeMvURBWTp',3),('B731981682','tvXwZNOVenAMjgLm',4),('B731981682','VWqDStAEIKmyLdaY',1),('B731981682','xedPbrlsczCXNgSA',3),('B732387060','bIVZTmgjsEiqxHRp',8),('B732387060','BRKWrsOwvZShHjbq',6),('B732387060','kzZeFARrbtGBXWYa',8),('B732387060','ouWcyvZShDNjqCLd',1),('B732387060','ScHEKpkdVNuWODxC',8),('B739746894','bBAzmOJuWRVDMrZk',6),('B739746894','OrkiNToFSCmlndIV',6),('B742420730','QMbOlimTELtIKjpN',8),('B742420730','VzbHSafGxXDRuLmy',10),('B742420730','YTBqdcwrzWySbZfG',2),('B742420730','YZFKwhJdNrvLkbHj',6),('B743717646','fguworTYhCmvDKNn',2),('B743717646','NmCKneWhqaOFcBfA',3),('B743717646','QXnrbNzBMwJivAxd',8),('B743717646','YWbVkGFCLlADQcBo',7),('B755581824','joFrRMfbwVTIEtNW',4),('B755581824','tzmnxlbHWOUfquSp',2),('B779371554','FlKZpoeiTEPCcMxv',8),('B779371554','lJpDRgSkxEdfUOMI',4),('B779371554','NZPTUynbWgVmxraH',4),('B779371554','pJGRFgzvKUXfDYjk',8),('B781779666','ATWeptKzFfGcjHro',6),('B781779666','imxSnkIMoFOPwhld',2),('B781779666','prhXwSiDkanQNxeJ',5),('B781779666','ZCBpgfIvVQDhrnuK',10),('B794650264','eGXKaolcBLHrDVgA',4),('B794650264','gqVDnxpmiUhsIyPw',1),('B794650264','NYEFgowhpdPbJukB',4),('B796299798','CviXEagMmVPdtjAJ',7),('B796299798','dBCizSAbsjNwrLvx',8),('B796299798','hfaGOZbeMvURBWTp',1),('B796299798','PxmiZLDWrwIdaASG',7),('B796299798','VaQCphOlKriMkSYc',8),('B802828954','eHLZTIMgnErNfAuS',4),('B802828954','NdPnXqiDBhJRrOpS',2),('B802828954','qglXYwANEspZDSbe',6),('B802828954','sGAcSUJhoteHmFnC',4),('B802828954','sichJdoUHBVutSAM',7),('B802828954','xfNatkqCJnlReVTp',9),('B803071189','CDizZcrgmTeSAvEF',10),('B803071189','fJCWbTSGpdqlQxar',5),('B803071189','GevgyTrCaVAlBtfR',7),('B803071189','IxJXCKuiVzynHeps',8),('B803071189','iYkTnQOqRMNvxHfr',1),('B803071189','lohcPZLTXQeIbKzC',7),('B803071189','OiqbuFITsLHmVABj',9),('B803071189','xufOUZmEAQaWyTnq',9),('B818166954','BfRwdnvjYNtqauHp',1),('B818166954','cPYMlvjQUAihKnIs',1),('B818166954','IETtAhMegoJHVqdm',7),('B818166954','iYqCaypzUdJRGmnA',4),('B818166954','jKdnrEZJwePROiHc',8),('B818166954','LgMeOTuCywcmIolA',3),('B818166954','sHThbZmfNQBjGnXF',10),('B818166954','tzmnxlbHWOUfquSp',1),('B822877641','hlALzqWraxMngYJd',8),('B822877641','IxJXCKuiVzynHeps',10),('B822877641','KVTWiCsrFqpQXYRk',1),('B822877641','VOlYraBumQhwpNAx',9),('B822877641','XzoanbmPpeZGBIvd',10),('B836750131','EUoqxYyGdepBAwzr',4),('B836750131','JPoLuvhldcFkrKOB',7),('B836750131','NgBDEdrcwMhqojtC',6),('B836750131','nKozasRwjhSrLvkf',1),('B836750131','sjUXoLgOecZyIqnN',4),('B836750131','VWqDStAEIKmyLdaY',5),('B836750131','XhwyNZjOHnWJkxpA',3),('B836836486','aMpKICeBVnqbQiWT',2),('B836836486','eTQXphnSGazbEDqM',10),('B836836486','GlOtRiHECaxyfuYJ',6),('B836836486','KsmcxaXPIybiElSD',10),('B836836486','uxYKXaLvcwifmMTQ',6),('B836836486','VaQCphOlKriMkSYc',1),('B837502373','acjsxnimfqeLYruS',6),('B837502373','IBgncrAuQlZJSjys',3),('B837502373','klqRBGhEPpgrVtaO',5),('B837502373','NdPnXqiDBhJRrOpS',2),('B837502373','nXeGqfimyLQKSMpE',6),('B837502373','NZPTUynbWgVmxraH',8),('B845088956','EbTYVZaAIMJPvBqQ',10),('B845088956','lrfKSOhBvWEYTQse',9),('B845088956','PioAaCpVXnZfcRwU',6),('B845088956','WAMItRgoXvNbTuLh',6),('B848516980','VaQCphOlKriMkSYc',10),('B848516980','voQMZzNgmJcsEYyB',6),('B848845532','JBSVXHwPrCsxTpWb',1),('B848845532','JWQylgmpsjEOvDYn',5),('B848845532','obxsGVEWmKuJQlFh',4),('B848845532','XhwyNZjOHnWJkxpA',8),('B849608814','AacmbYBNqFvUsSln',5),('B849608814','iwZanOdJxPMqBmlE',7),('B849608814','uDkLXydYZFpMjhSm',2),('B850583070','bBAzmOJuWRVDMrZk',6),('B850583070','klqRBGhEPpgrVtaO',6),('B850583070','OENCTjZoxnJgiech',7),('B850583070','vEDhsBegWLnKbrQF',8),('B850583070','WZUQLAgCSFOGJrVX',2),('B859493721','cjQAmZaXBHsKtkew',10),('B859493721','jParMetnVcZOJquR',3),('B859493721','UZlfPXMJLncYmvdV',8),('B859493721','WbISECMkTLFGewZy',1),('B859493721','YDPMBWEapsFoZhCJ',6),('B867174604','ewVBsEukXiUIMPZj',2),('B867174604','fhEkXimxQZtLvVyH',5),('B867174604','heEcWujAskfwynla',3),('B867174604','hlALzqWraxMngYJd',10),('B867174604','YMzCVIxsTriaJOhF',10),('B869272831','FnuhpUNJIMPrjYtl',6),('B869272831','joFrRMfbwVTIEtNW',5),('B869272831','pLTkvCXeEWnwVIiR',2),('B869272831','qDNOIQsJoXCuWdTU',1),('B869272831','wXcEvyfnBAMkLbil',7),('B872121479','CmyouYBTWHrIwRGl',2),('B872121479','gFsJzHRANDWCqcid',8),('B872121479','haADlWoLztYcsqMr',7),('B872121479','lohcPZLTXQeIbKzC',1),('B872121479','pyGaBcIxYVDTNtwQ',9),('B876038157','dzkJILZcWPwoSMxF',8),('B876038157','GsiPBFptzvKLXYCQ',7),('B876038157','kSyULOIrDEpfjHsw',2),('B876038157','UZlfPXMJLncYmvdV',10),('B876038157','VfKtvGMlhDIBeUmx',1),('B880663486','XsQBLSHvDrygnEpb',6),('B880663486','yidCbsLYgcZVQrqp',6),('B882327311','GevgyTrCaVAlBtfR',10),('B882327311','sXBQhwlDySzmJbHW',5),('B884704362','AROPSmnYvGokhgcN',4),('B884704362','heEcWujAskfwynla',7),('B884704362','KugqjeNGzWafHIJn',1),('B884704362','NctTnyuRWahjVHCE',4),('B884704362','niUBIegFZQkGCJfP',3),('B884704362','yawchBQbHAmMptTg',9),('B886007879','pMwueTfxjsCmhlLd',7),('B886007879','WZUQLAgCSFOGJrVX',6),('B886007879','zKxDwfRnvgiEacyY',5),('B890382930','KugqjeNGzWafHIJn',2),('B895978086','eTQXphnSGazbEDqM',10),('B895978086','RCINTkXtpiHOGqEY',2),('B897085056','OiqbuFITsLHmVABj',9),('B897085056','PUbdhNFxeSjwQfkt',10),('B897085056','WTulwZxUKrEjJCkp',3),('B900783744','DGoFgSWdVKavyqRO',3),('B900783744','moxZpjktANqSWMug',8),('B900783744','siTFnoWNjXgACPyv',3),('B900783744','ZXTRcYDzHmdOohPx',9),('B900783744','zYawSsdknViomrGl',3),('B912420642','haADlWoLztYcsqMr',3),('B912420642','HECumWkxFypKgjIl',4),('B912420642','jwpBxMEmsXOWrYUZ',6),('B912420642','YounOGJeVXEPrIkd',2),('B916760627','fJCWbTSGpdqlQxar',1),('B916760627','lPIfaStcEwNOmGCX',9),('B916760627','WAMItRgoXvNbTuLh',4),('B916760627','YWbVkGFCLlADQcBo',9),('B918291505','eNcLmvDJyPSVxMGF',8),('B918291505','ivYCjhdGZQKSuxfq',5),('B918291505','NZPTUynbWgVmxraH',8),('B918291505','QspxZCqMRSWLvreY',2),('B918291505','SDMcuzQCxvNwWGpd',6),('B918291505','XsQBLSHvDrygnEpb',2),('B922135837','CwjsbItMoUBTgdSq',8),('B922135837','QLkSYXPbcgKwAoJh',9),('B922135837','QvZBCrhAtnuJWEci',1),('B922135837','SuNbQoYhDlZarnwk',3),('B922135837','xLlUPCJMucOhqgFd',7),('B929973776','gUHFevlMRBsnOkGE',6),('B929973776','pPnBDRWoVhQctdiI',3),('B929973776','WfqJmkLvShPbcxIA',8),('B929973776','WSFEyziVuZYbIwpr',8),('B931835137','fWwFuVLJdAaBqMgc',4),('B931835137','oEmIjgzkPwnschHb',2),('B931835137','yidCbsLYgcZVQrqp',8),('B945990013','aWtoYZAfNgiKRrFP',8),('B945990013','IBgncrAuQlZJSjys',4),('B945990013','UfPwiNJnQbpmgTHt',9),('B945990013','URhEdtKYszfxwNly',8),('B945990013','VfKtvGMlhDIBeUmx',8),('B945990013','WvEmTUHXSjALKhoM',7),('B945990013','XxsItOiUYhwzGumJ',7),('B945990013','ZIhNMoRTqOgBKiGF',2),('B957794137','ANODyoYKbCjVwuIp',1),('B957794137','BRKWrsOwvZShHjbq',7),('B957794137','imVsTYZnFxrDEzyM',1),('B957794137','sSVTIoilZqjGwXrF',8),('B957794137','ZCBpgfIvVQDhrnuK',8),('B978144719','CpsbwUyguWShxNoq',7),('B978144719','GevgyTrCaVAlBtfR',5),('B978144719','XxsItOiUYhwzGumJ',3),('B978144719','yVESBxdmhwLlOToH',5),('B979263471','HisndQMupefBAcgt',8),('B979263471','NrBLEmnGvoHbkYjh',6),('B979263471','ouWcyvZShDNjqCLd',9),('B986760522','aMpKICeBVnqbQiWT',3),('B986760522','kJsfhXiSytGjNOHY',8),('B986760522','KkfGLvRguTXQizsn',10),('B986760522','KngAoFzXytjSEeDZ',9),('B987837557','aQYZnOBxzTcEvpGL',2),('B987837557','iYkTnQOqRMNvxHfr',2),('B987837557','JPoLuvhldcFkrKOB',1),('B987837557','xzEXAbnhUDuJOfdV',10),('B990265548','cPYMlvjQUAihKnIs',3),('B990265548','doaGvTOeYpMzkZyD',1),('B990265548','IETtAhMegoJHVqdm',10),('B990265548','PXCjglYmFtnOBSrK',10),('B990265548','rmJKZuqXlvtYCSzy',9),('B990265548','UPnTMpwvNatQLWbV',4),('B990688105','fJCWbTSGpdqlQxar',2),('B990688105','NlWpIEQFBGUdfJhu',2),('B990688105','okBhslKnpQPFmEaZ',10),('B990688105','oOIHnxVtkBbPhrfN',4),('B990688105','oSGXVUWwyhbjMmLv',1),('B992100269','BoftwLPyJEFAuKpi',2),('B992100269','gUHFevlMRBsnOkGE',1),('B992100269','jJbceMzuBmRxKLyV',4),('B992100269','PoLdNXIqGzMYSVHw',4),('B992100269','TDFvpMZhPumnqkog',6),('B992489326','BoftwLPyJEFAuKpi',10),('B992489326','GStgIsWnEjTbdFMz',2),('B992489326','HisndQMupefBAcgt',7),('B992489326','KuXfDokOqwHysNPc',4),('B992489326','mJAvrDxjkQdFeWYN',10),('B998848291','PAxyNTBQveSYnoUI',2),('B998848291','YHeQJUoXvgBtKCdz',3),('B998848291','YJBWLHDjgFEPymNz',6),('B999048775','bQmGUtjAwuokCcrl',5),('B999048775','cPYMlvjQUAihKnIs',3),('B999048775','EKtMzhVpIgefjvLm',10),('B999048775','gLVxMYEWhUlewFSt',4);
/*!40000 ALTER TABLE `putsIntoCart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 14:08:56
