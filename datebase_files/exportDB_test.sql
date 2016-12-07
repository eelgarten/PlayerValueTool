DROP DATABASE IF EXISTS `playervaluetool`;
CREATE DATABASE  IF NOT EXISTS `playervaluetool` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `playervaluetool`;
-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: playervaluetool
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `baseballhitterstats`
--

DROP TABLE IF EXISTS `baseballhitterstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseballhitterstats` (
  `playerId` varchar(20) NOT NULL,
  `atBats` int(3) DEFAULT NULL,
  `runsScored` int(3) DEFAULT NULL,
  `hits` int(3) DEFAULT NULL,
  `doubles` int(2) DEFAULT NULL,
  `triples` int(2) DEFAULT NULL,
  `homeruns` int(2) DEFAULT NULL,
  `runsBattedIn` int(3) DEFAULT NULL,
  `stolenBases` int(3) DEFAULT NULL,
  `caughtStealing` int(3) DEFAULT NULL,
  `walksDrawn` int(3) DEFAULT NULL,
  `strikeouts` int(3) DEFAULT NULL,
  `battingAverage` decimal(4,3) DEFAULT NULL,
  `onBasePercentage` decimal(4,3) DEFAULT NULL,
  `sluggingPercentage` decimal(4,3) DEFAULT NULL,
  `onBasePlusSlugging` decimal(4,3) DEFAULT NULL,
  `winsAboveReplacement` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  CONSTRAINT `hitter_id` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseballhitterstats`
--

LOCK TABLES `baseballhitterstats` WRITE;
/*!40000 ALTER TABLE `baseballhitterstats` DISABLE KEYS */;
INSERT INTO `baseballhitterstats` VALUES ('ABelt00',583,89,175,31,1,32,104,1,1,48,66,0.300,0.358,0.521,0.879,6.45),('AEato00',619,91,176,29,9,14,59,14,5,63,115,0.284,0.362,0.428,0.790,6.23),('ARizz00',583,94,170,43,4,32,109,3,5,74,108,0.292,0.385,0.544,0.928,5.74),('BDozi00',615,104,165,35,5,42,99,18,2,61,138,0.268,0.340,0.546,0.886,6.53),('BPose00',539,82,155,33,2,14,80,6,1,64,68,0.288,0.362,0.434,0.796,4.67),('CCorr00',577,76,158,36,3,20,96,13,3,75,139,0.274,0.361,0.451,0.811,5.95),('CSeag00',627,105,193,40,5,26,72,3,3,54,133,0.308,0.365,0.512,0.877,6.12),('CYeli00',578,78,172,38,3,21,98,9,4,72,138,0.298,0.376,0.483,0.859,5.27),('DLeMa00',552,104,192,32,8,11,66,11,7,66,80,0.348,0.416,0.495,0.911,5.19),('DOrti00',537,79,169,48,1,38,127,2,0,80,86,0.315,0.401,0.620,1.021,5.08),('DPedr00',633,105,201,36,1,15,74,7,4,61,73,0.318,0.376,0.449,0.825,5.63),('FFree00',589,102,178,43,6,34,91,6,1,89,171,0.302,0.400,0.569,0.968,6.46),('FLind00',604,99,182,30,3,15,78,19,5,57,88,0.301,0.358,0.435,0.794,5.72),('GSpri00',644,116,168,29,5,29,82,9,10,88,178,0.261,0.359,0.457,0.815,5.01),('IKins00',618,117,178,29,4,28,83,14,6,45,115,0.288,0.348,0.484,0.831,6.13),('JAltu00',640,108,216,42,5,24,96,30,10,60,70,0.338,0.396,0.531,0.928,7.65),('JBrad00',558,94,149,30,7,26,87,9,2,63,143,0.267,0.349,0.486,0.835,5.33),('JDona00',577,122,164,32,5,37,99,7,1,109,119,0.284,0.404,0.549,0.953,7.44),('JSegu00',637,102,203,41,7,20,64,33,10,39,101,0.319,0.368,0.499,0.867,5.65),('JTurn00',556,79,153,34,3,27,90,4,1,48,107,0.275,0.339,0.493,0.832,4.95),('KBrya00',603,121,176,35,3,39,102,8,5,75,154,0.292,0.385,0.554,0.939,7.67),('KSeag00',597,89,166,36,3,30,99,3,1,69,108,0.278,0.359,0.499,0.859,6.87),('MBett00',672,122,214,42,5,31,113,26,4,49,80,0.318,0.363,0.534,0.897,9.55),('MCabr00',595,92,188,31,1,38,108,0,0,75,116,0.316,0.393,0.563,0.956,4.90),('MMach00',640,105,188,40,1,37,96,0,3,48,120,0.294,0.343,0.533,0.876,6.66),('MTrou00',549,123,173,32,5,29,100,30,7,116,137,0.315,0.441,0.550,0.991,10.55),('NAren00',618,116,182,35,6,41,133,2,3,68,103,0.294,0.362,0.570,0.932,6.50),('NCruz00',589,96,169,27,1,43,105,2,0,62,159,0.287,0.360,0.555,0.915,4.66),('PGold00',579,106,172,33,3,24,95,32,5,110,150,0.297,0.411,0.489,0.899,4.84),('RCano00',655,107,195,33,2,39,103,0,1,47,100,0.298,0.350,0.533,0.882,7.31),('SMart00',489,71,152,34,5,9,46,47,12,23,104,0.311,0.362,0.456,0.818,4.92);
/*!40000 ALTER TABLE `baseballhitterstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseballpitcherstats`
--

DROP TABLE IF EXISTS `baseballpitcherstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseballpitcherstats` (
  `playerId` varchar(20) NOT NULL,
  `gamesPitched` int(2) DEFAULT NULL,
  `gamesStarted` int(2) DEFAULT NULL,
  `inningsPitched` decimal(4,1) DEFAULT NULL,
  `hitsAllowed` int(3) DEFAULT NULL,
  `runsGivenUp` int(3) DEFAULT NULL,
  `earnedRuns` int(3) DEFAULT NULL,
  `walksAllowed` int(3) DEFAULT NULL,
  `strikeouts` int(3) DEFAULT NULL,
  `wins` int(2) DEFAULT NULL,
  `losses` int(2) DEFAULT NULL,
  `saves` int(2) DEFAULT NULL,
  `blownSaves` int(2) DEFAULT NULL,
  `walksPlusHitsAllowedPerInningsPitched` decimal(3,2) DEFAULT NULL,
  `earnedRunAverage` decimal(3,2) DEFAULT NULL,
  `winsAboveReplacement` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  CONSTRAINT `pitcher_id` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseballpitcherstats`
--

LOCK TABLES `baseballpitcherstats` WRITE;
/*!40000 ALTER TABLE `baseballpitcherstats` DISABLE KEYS */;
INSERT INTO `baseballpitcherstats` VALUES ('ASanc00',30,30,192.0,161,69,64,63,161,15,2,0,0,1.17,3.00,4.75),('CHame00',32,32,200.2,185,83,74,77,200,15,5,0,0,1.31,3.32,4.98),('CKers00',21,21,149.0,97,31,28,11,172,12,4,0,0,0.72,1.69,5.56),('CKlub00',32,32,215.0,170,82,75,57,227,18,9,0,0,1.06,3.14,6.45),('CMart00',31,31,195.1,169,68,66,70,174,16,9,0,0,1.22,3.04,5.40),('CSale00',32,32,226.2,190,88,84,45,233,17,10,0,0,1.04,3.34,4.92),('JCuet00',32,32,219.2,195,71,68,45,198,18,5,0,0,1.09,2.79,5.56),('JLest00',32,32,202.2,154,57,55,52,197,19,5,0,0,1.02,2.44,5.31),('JQuin00',32,32,208.0,192,76,74,50,181,13,12,0,0,1.16,3.20,5.15),('JTehe00',30,30,188.0,157,70,67,41,167,7,10,0,0,1.05,3.21,4.77),('JVerl00',34,34,227.2,171,81,77,57,254,16,9,0,0,1.00,3.04,6.61),('KHend00',31,30,190.0,142,53,45,44,170,16,8,0,0,0.98,2.13,4.99),('MBumg00',34,34,226.2,178,79,69,54,251,15,9,0,0,1.02,2.74,5.01),('MFulm00',26,26,159.0,136,57,54,42,132,11,7,0,0,1.12,3.06,4.87),('MSche00',34,34,228.1,165,77,75,56,284,20,7,0,0,0.97,2.96,6.21),('MTana00',31,31,199.2,179,75,68,36,165,14,4,0,0,1.08,3.07,5.42),('NSynd00',31,30,183.2,168,61,53,43,218,14,9,0,0,1.15,2.60,5.26),('RPorc00',33,33,223.0,193,85,78,32,189,22,4,0,0,1.01,3.15,5.04),('TRoar00',34,33,210.0,173,72,66,73,172,16,10,0,0,1.17,2.83,5.51);
/*!40000 ALTER TABLE `baseballpitcherstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basketballplayerstats`
--

DROP TABLE IF EXISTS `basketballplayerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketballplayerstats` (
  `playerId` varchar(20) NOT NULL,
  `gamesPlayed` int(2) DEFAULT NULL,
  `playerEfficiencyRating` decimal(3,1) DEFAULT NULL,
  `pointsPerGame` decimal(3,1) DEFAULT NULL,
  `reboundsPerGame` decimal(3,1) DEFAULT NULL,
  `assistsPerGame` decimal(3,1) DEFAULT NULL,
  `stealsPerGame` decimal(3,1) DEFAULT NULL,
  `blocksPerGame` decimal(3,1) DEFAULT NULL,
  `fieldGoalPercentage` decimal(4,3) DEFAULT NULL,
  `trueShootingPercentage` decimal(4,3) DEFAULT NULL,
  `usagePercentage` decimal(3,1) DEFAULT NULL,
  `valueOverReplacementPlayer` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  CONSTRAINT `basketball_player_id` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basketballplayerstats`
--

LOCK TABLES `basketballplayerstats` WRITE;
/*!40000 ALTER TABLE `basketballplayerstats` DISABLE KEYS */;
INSERT INTO `basketballplayerstats` VALUES ('aldrila01',74,22.4,18.0,8.5,1.5,0.5,1.1,0.513,0.565,25.9,2.2),('antetgi01',80,18.8,16.9,7.7,4.3,1.2,1.4,0.506,0.566,22.3,3.2),('anthoca01',72,20.3,21.8,7.7,4.2,0.9,0.5,0.434,0.530,29.7,2.9),('arizatr01',81,12.9,12.7,4.5,2.3,2.0,0.3,0.416,0.551,15.7,2.5),('batumni01',70,15.6,14.9,6.1,5.8,0.9,0.6,0.426,0.546,21.4,2.5),('bogutan01',70,15.9,5.4,7.0,2.3,0.5,1.6,0.627,0.623,11.4,2.4),('butleji01',67,21.3,20.9,5.3,4.8,1.6,0.6,0.454,0.562,24.4,3.7),('caldwke01',76,12.4,14.5,3.7,1.8,1.5,0.2,0.420,0.521,18.2,2.2),('couside01',65,23.6,26.9,11.5,3.3,1.6,1.4,0.451,0.538,35.4,2.6),('crowdja01',73,15.8,14.2,5.1,1.8,1.7,0.5,0.443,0.565,18.5,2.8),('curryst01',79,31.5,30.1,5.4,6.7,2.1,0.2,0.504,0.669,32.6,9.8),('davisan02',61,25.0,24.3,10.3,1.9,1.3,2.1,0.493,0.559,29.6,2.3),('davised01',81,18.7,6.5,7.4,1.1,0.7,0.9,0.611,0.616,12.7,2.3),('denglu01',74,15.0,12.3,6.0,1.9,1.0,0.4,0.455,0.549,17.4,2.3),('derozde01',78,21.5,23.5,4.5,4.0,1.0,0.3,0.446,0.550,29.8,2.4),('dienggo01',82,17.1,10.1,7.1,1.7,1.2,1.2,0.532,0.601,16.7,2.5),('duncati01',61,16.9,8.6,7.3,2.7,0.8,1.3,0.488,0.523,17.6,2.4),('duranke01',72,28.2,28.2,8.2,5.0,1.0,1.2,0.505,0.634,30.6,6.4),('favorde01',62,21.6,16.4,8.1,1.5,1.2,1.5,0.515,0.551,23.9,2.3),('gasolpa01',72,21.7,16.5,11.0,4.1,0.6,2.0,0.469,0.529,24.6,3.5),('georgpa01',81,20.9,23.1,7.0,4.1,1.9,0.4,0.418,0.557,30.4,4.6),('goberru01',61,17.5,9.1,11.0,1.5,0.7,2.2,0.559,0.582,14.2,2.8),('greenda02',79,10.5,7.2,4.2,1.8,1.0,0.8,0.436,0.492,14.6,2.5),('greendr01',81,19.3,14.0,9.5,7.4,1.5,1.4,0.490,0.587,18.8,5.5),('hardeja01',82,25.3,29.0,6.1,7.5,1.7,0.6,0.439,0.598,32.5,6.9),('haywago01',80,18.3,19.7,5.0,3.7,1.2,0.3,0.433,0.559,25.7,3.3),('hillge01',74,13.2,12.1,4.0,3.5,1.1,0.2,0.441,0.555,15.8,2.2),('horfoal01',82,19.4,15.2,7.3,3.2,0.8,1.5,0.505,0.565,20.6,4.1),('jacksre01',79,19.6,18.8,3.2,6.2,0.8,0.1,0.434,0.535,29.1,2.6),('jamesle01',76,27.5,25.3,7.4,6.8,1.4,0.6,0.520,0.588,31.4,7.6),('johnsam01',79,16.0,7.3,6.4,1.7,0.7,1.1,0.585,0.602,13.6,2.3),('jokicni01',80,21.5,10.0,7.0,2.4,1.0,0.6,0.512,0.582,19.9,3.0),('jordade01',77,20.6,12.7,13.8,1.2,0.7,2.3,0.703,0.628,15.4,3.5),('leonaka01',72,26.0,21.2,6.8,2.6,1.8,1.0,0.506,0.616,25.8,6.2),('lillada01',75,22.2,25.1,4.0,6.8,0.9,0.4,0.419,0.560,31.3,3.8),('loveke01',77,19.0,16.0,9.9,2.4,0.8,0.5,0.419,0.553,23.4,2.8),('lowryky01',77,22.2,21.2,4.7,6.4,2.1,0.4,0.427,0.578,26.1,6.3),('millspa01',81,21.3,17.1,9.0,3.3,1.8,1.7,0.470,0.556,24.3,4.9),('oladivi01',72,16.7,16.0,4.8,3.9,1.6,0.8,0.438,0.534,22.9,2.3),('paulch01',74,26.2,19.5,4.2,10.0,2.1,0.2,0.462,0.575,27.1,6.0),('plumlma01',82,17.2,9.1,7.7,2.8,0.8,1.0,0.516,0.564,17.1,2.5),('porteot01',75,14.5,11.6,5.2,1.6,1.4,0.4,0.473,0.564,16.2,2.2),('rubiori01',76,17.6,10.1,4.3,8.6,2.1,0.1,0.374,0.529,17.7,2.3),('thomais02',82,21.5,22.2,3.0,6.2,1.1,0.1,0.428,0.562,29.6,3.3),('townska01',82,22.5,18.3,10.5,2.0,0.7,1.7,0.542,0.590,24.9,3.1),('walkeke02',81,20.8,20.9,4.4,5.2,1.6,0.5,0.427,0.554,26.5,4.4),('walljo01',77,19.8,19.9,4.9,10.2,1.9,0.8,0.424,0.510,28.6,3.7),('westbru01',80,27.6,23.5,7.8,10.4,2.0,0.3,0.454,0.554,31.6,8.3),('whiteha01',73,25.7,14.2,11.8,0.4,0.6,3.7,0.606,0.629,20.7,2.4),('willima02',81,16.8,11.7,6.4,1.4,0.7,1.0,0.452,0.585,16.8,2.7);
/*!40000 ALTER TABLE `basketballplayerstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footballdefensiveplayerstats`
--

DROP TABLE IF EXISTS `footballdefensiveplayerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footballdefensiveplayerstats` (
  `playerId` varchar(20) NOT NULL,
  `approximateValue` int(2) DEFAULT NULL,
  `totalTackles` int(3) DEFAULT NULL,
  `assistedTackles` int(3) DEFAULT NULL,
  `sacks` int(2) DEFAULT NULL,
  `passesDefended` int(2) DEFAULT NULL,
  `interceptions` int(2) DEFAULT NULL,
  `forcedFumbles` int(2) DEFAULT NULL,
  `fumblesRecovered` int(2) DEFAULT NULL,
  `defensiveTD` int(1) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  CONSTRAINT `defensive_player_id` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footballdefensiveplayerstats`
--

LOCK TABLES `footballdefensiveplayerstats` WRITE;
/*!40000 ALTER TABLE `footballdefensiveplayerstats` DISABLE KEYS */;
INSERT INTO `footballdefensiveplayerstats` VALUES ('AnsaEz00',12,39,8,15,1,0,4,2,0),('AtkiGe99',17,31,11,11,0,0,1,0,0),('AvriCl99',9,31,16,9,7,0,2,0,0),('BarrAn00',9,54,14,4,8,0,3,0,0),('BennMi99',12,33,19,10,0,0,2,0,0),('BerrEr99',11,55,6,0,12,2,0,0,0),('BowmNa99',14,116,38,3,2,0,1,0,0),('ButlMa01',10,56,11,0,17,2,0,0,0),('CampCa99',13,46,15,5,0,0,0,1,0),('CollJa00',12,51,38,6,7,1,5,1,1),('CoxxFl00',13,50,21,10,2,0,3,2,0),('DaviTh20',16,75,30,6,7,4,4,1,0),('DonaAa00',20,43,26,11,1,0,0,1,0),('DumeEl20',11,29,19,6,0,0,2,0,0),('DunlCa99',12,37,18,14,1,0,2,1,0),('GrifEv99',11,34,10,11,4,0,1,0,0),('HarrCh01',13,49,9,0,6,2,2,0,1),('JoneCh03',11,31,13,13,2,1,4,0,0),('KuecLu00',15,76,42,1,10,4,2,1,1),('LeexSe99',10,76,52,3,5,1,0,0,0),('MackKh00',14,57,20,15,2,0,2,0,0),('MathTy00',10,80,9,1,17,5,1,0,1),('MattCl99',12,49,17,7,4,1,0,1,0),('MillVo00',17,30,5,11,1,0,4,3,0),('NelsRe99',13,50,22,0,14,8,0,2,0),('NormJo01',15,48,8,0,18,4,3,2,2),('PeppJu99',11,25,11,11,0,0,2,0,0),('PeteMa00',11,53,7,0,26,8,1,0,2),('PetePa00',12,35,0,0,8,2,0,0,0),('ReviDa99',10,30,9,0,9,5,0,0,0),('SherRi00',14,33,17,0,14,2,0,0,0),('ShorKa00',14,36,19,11,4,0,3,2,0),('TaliAq99',10,39,6,0,16,3,0,0,2),('ThomEa99',10,42,19,0,9,5,1,0,0),('WagnBo00',15,67,47,1,0,0,2,3,2),('WattJ.00',21,57,19,18,8,0,3,1,0),('WilkMu00',16,39,25,12,7,0,3,0,0),('WoodCh00',11,59,15,0,9,5,1,4,0),('WrigK.00',10,71,45,1,0,0,4,2,0);
/*!40000 ALTER TABLE `footballdefensiveplayerstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footballoffensivelinestats`
--

DROP TABLE IF EXISTS `footballoffensivelinestats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footballoffensivelinestats` (
  `playerId` varchar(20) NOT NULL,
  `approximateValue` int(2) DEFAULT NULL,
  `sacksAllowed` int(2) DEFAULT NULL,
  `qbHits` int(2) DEFAULT NULL,
  `qbHurries` int(2) DEFAULT NULL,
  `penaltiesCommitted` int(2) DEFAULT NULL,
  `penaltiesAccepted` int(2) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  CONSTRAINT `offensive_lineman_id` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footballoffensivelinestats`
--

LOCK TABLES `footballoffensivelinestats` WRITE;
/*!40000 ALTER TABLE `footballoffensivelinestats` DISABLE KEYS */;
INSERT INTO `footballoffensivelinestats` VALUES ('AlbeBr20',9,2,3,13,3,0),('ArmsTe00',9,3,2,15,5,0),('BarkJo00',9,6,6,34,9,2),('BritJu00',9,3,6,28,7,1),('DeCaDa00',14,2,3,23,2,0),('GillGa01',11,5,10,43,6,2),('IupaMi20',12,2,3,13,2,0),('KaliRy20',13,3,2,13,5,1),('LongKy00',10,6,3,28,9,0),('SittJo20',11,3,0,9,7,0),('SmitTy00',10,5,3,14,10,2),('StriZa20',10,6,11,20,9,0),('ThomJo28',11,2,1,21,5,0),('TurnTr01',10,1,1,15,6,0),('VeldJa20',11,4,9,26,8,2),('WhitAn20',19,4,1,15,8,0),('WillTr21',13,2,3,14,8,2),('YandMa20',10,1,1,15,4,1);
/*!40000 ALTER TABLE `footballoffensivelinestats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footballoffensiveplayerstats`
--

DROP TABLE IF EXISTS `footballoffensiveplayerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footballoffensiveplayerstats` (
  `playerId` varchar(20) NOT NULL,
  `approximateValue` int(2) DEFAULT NULL,
  `passingYards` int(4) DEFAULT NULL,
  `passingTD` int(2) DEFAULT NULL,
  `yardsPerCompletion` decimal(3,1) DEFAULT NULL,
  `yardsPerAttempt` decimal(3,1) DEFAULT NULL,
  `completionPercentage` decimal(3,1) DEFAULT NULL,
  `rushingAttempts` int(3) DEFAULT NULL,
  `rushingYards` int(4) DEFAULT NULL,
  `rushingTD` int(2) DEFAULT NULL,
  `targets` int(3) DEFAULT NULL,
  `receptions` int(3) DEFAULT NULL,
  `receivingYards` int(4) DEFAULT NULL,
  `receivingTD` int(2) DEFAULT NULL,
  `fumbles` int(2) DEFAULT NULL,
  `interceptions` int(2) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  CONSTRAINT `offensive_skillplayer_id` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footballoffensiveplayerstats`
--

LOCK TABLES `footballoffensiveplayerstats` WRITE;
/*!40000 ALTER TABLE `footballoffensiveplayerstats` DISABLE KEYS */;
INSERT INTO `footballoffensiveplayerstats` VALUES ('BaldDo00',11,0,0,0.0,0.0,0.0,0,0,0,103,78,1069,14,1,0),('BeckOd00',13,0,0,0.0,0.0,0.0,1,3,0,158,96,1450,13,2,0),('BernGi00',10,0,0,0.0,0.0,0.0,154,730,2,66,49,472,0,1,0),('BortBl00',14,4428,35,12.5,7.3,58.6,52,310,2,0,0,0,0,14,18),('BradSa00',9,3725,19,10.8,7.0,65.0,26,39,0,0,0,0,0,10,14),('BradTo00',17,4770,36,11.9,7.6,64.4,34,53,3,1,1,36,0,6,7),('BreeDr00',14,4870,32,11.4,7.8,68.3,24,14,1,0,0,0,0,5,11),('BridTe00',13,3231,14,11.1,7.2,65.3,44,192,3,0,0,0,0,8,9),('BrowAn04',17,0,0,0.0,0.0,0.0,3,28,0,193,136,1834,10,3,0),('BrowJo02',10,0,0,0.0,0.0,0.0,3,22,0,101,65,1003,7,1,0),('CarrDe02',13,3987,32,11.4,7.0,61.1,33,198,0,0,0,0,0,10,13),('CousKi00',12,4166,29,11.0,7.7,69.8,26,48,5,0,0,0,0,9,11),('CutlJa00',12,3659,21,11.8,7.6,64.4,38,201,1,0,0,0,0,8,11),('DaltAn00',13,3250,25,12.7,8.4,66.1,57,142,3,0,0,0,0,5,7),('EvanMi00',10,0,0,0.0,0.0,0.0,0,0,0,148,74,1206,3,1,0),('FitzLa00',11,0,0,0.0,0.0,0.0,0,0,0,145,109,1215,9,2,0),('FitzRy00',13,3905,31,11.7,6.8,59.6,60,270,2,0,0,0,0,5,15),('FreeDe00',11,0,0,0.0,0.0,0.0,265,1056,11,97,73,578,3,3,0),('GreeA.00',13,0,0,0.0,0.0,0.0,0,0,0,132,86,1297,10,1,0),('GronRo00',12,0,0,0.0,0.0,0.0,0,0,0,120,72,1176,11,0,0),('HopkDe00',11,0,0,0.0,0.0,0.0,0,0,0,192,111,1521,11,1,0),('JohnCa00',10,0,0,0.0,0.0,0.0,0,0,0,149,88,1214,9,1,0),('JoneJu02',16,0,0,0.0,0.0,0.0,0,0,0,203,136,1871,8,3,0),('MaclJe00',11,0,0,0.0,0.0,0.0,3,14,0,124,87,1088,8,2,0),('MannEl00',14,4432,35,11.5,7.2,62.6,20,61,0,0,0,0,0,11,14),('MarsBr00',13,0,0,0.0,0.0,0.0,0,0,0,173,109,1502,14,3,0),('MartDo00',11,0,0,0.0,0.0,0.0,288,1402,6,44,33,271,1,5,0),('NewtCa00',20,3837,35,13.0,7.8,59.8,132,636,10,0,0,0,0,5,10),('OlseGr00',12,0,0,0.0,0.0,0.0,0,0,0,124,77,1104,7,1,0),('PalmCa00',16,4671,35,13.7,8.7,63.7,25,24,1,0,0,0,0,6,11),('PeteAd01',14,0,0,0.0,0.0,0.0,327,1485,11,36,30,222,0,7,0),('RivePh00',12,4792,29,11.0,7.2,66.1,17,28,0,0,0,0,0,4,13),('RobiAl02',11,0,0,0.0,0.0,0.0,0,0,0,151,80,1400,14,0,0),('RodgAa00',14,3821,31,11.0,6.7,60.7,58,344,1,0,0,0,0,8,8),('RoetBe00',12,3938,21,12.3,8.4,68.0,15,29,0,0,0,0,0,2,16),('RyanMa00',13,4591,21,11.3,7.5,66.3,36,63,0,0,0,0,0,12,16),('SmitAl03',16,3486,20,11.4,7.4,65.3,84,498,2,0,0,0,0,4,7),('StafMa00',13,4262,32,10.7,7.2,67.2,44,159,1,1,1,-6,0,4,13),('TannRy00',11,4208,24,11.6,7.2,61.9,32,141,1,1,1,9,0,10,12),('TaylTy00',13,3035,20,12.5,8.0,63.7,104,568,4,1,1,4,0,9,6),('WilsRu00',19,4024,34,12.2,8.3,68.3,103,553,1,0,0,0,0,7,8),('WinsJa00',13,4042,22,13.0,7.6,58.3,54,213,6,0,0,0,0,6,15);
/*!40000 ALTER TABLE `footballoffensiveplayerstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `playerName` char(30) NOT NULL,
  `playerId` varchar(20) NOT NULL,
  `pos` char(3) NOT NULL,
  `sport` char(3) NOT NULL,
  `team` char(3) NOT NULL,
  `salary` int(10) NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('Adrian Beltre','ABelt00','3B','MLB','TEX',18000000),('Adam Eaton','AEato00','OF','MLB','CHW',2750000),('Branden Albert','AlbeBr20','T','NFL','MIA',10725000),('LaMarcus Aldridge','aldrila01','PF','NBA','SAS',19689000),('Ezekiel Ansah','AnsaEz00','DE','NFL','DET',5071228),('Giannis Antetokounmpo','antetgi01','SF','NBA','MIL',1953960),('Carmelo Anthony','anthoca01','SF','NBA','NYK',22875000),('Trevor Ariza','arizatr01','SF','NBA','HOU',8193030),('Anthony Rizzo','ARizz00','1B','MLB','CHC',5285714),('Terron Armstead','ArmsTe00','T','NFL','NOR',769359),('Aaron Sanchez','ASanc00','SP','MLB','TOR',517800),('Geno Atkins','AtkiGe99','DT','NFL','CIN',9000000),('Cliff Avril','AvriCl99','DE','NFL','SEA',8000000),('Doug Baldwin','BaldDo00','WR','NFL','SEA',4650000),('Joe Barksdale','BarkJo00','T','NFL','SDG',2095000),('Anthony Barr','BarrAn00','OLB','NFL','MIN',2896272),('Nicolas Batum','batumni01','SG','NBA','CHO',13125306),('Brian Dozier','BDozi00','2B','MLB','MIN',3000000),('Odell Beckham','BeckOd00','WR','NFL','NYG',2365045),('Michael Bennett','BennMi99','DE','NFL','SEA',8000000),('Giovani Bernard','BernGi00','RB','NFL','CIN',1432729),('Eric Berry','BerrEr99','S','NFL','KAN',8357700),('Andrew Bogut','bogutan01','C','NBA','GSW',13800000),('Blake Bortles','BortBl00','QB','NFL','JAX',4694273),('NaVorro Bowman','BowmNa99','MLB','NFL','SFO',8404000),('Buster Posey','BPose00','C','MLB','SF',20777778),('Sam Bradford','BradSa00','QB','NFL','PHI',12985000),('Tom Brady','BradTo00','QB','NFL','NWE',14000000),('Drew Brees','BreeDr00','QB','NFL','NOR',23800000),('Teddy Bridgewater','BridTe00','QB','NFL','MIN',1556705),('Justin Britt','BritJu00','C','NFL','SEA',785666),('Antonio Brown','BrowAn04','WR','NFL','PIT',7120833),('John Brown','BrowJo02','WR','NFL','ARI',657725),('Jimmy Butler','butleji01','SG','NBA','CHI',16407500),('Malcolm Butler','ButlMa01','DB','NFL','NWE',510000),('Kentavious Caldwell-Pope','caldwke01','SG','NBA','DET',2891760),('Calais Campbell','CampCa99','DE','NFL','ARI',14750000),('Derek Carr','CarrDe02','QB','NFL','OAK',1220864),('Carlos Correa','CCorr00','SS','MLB','HOU',516700),('Cole Hamels','CHame00','SP','MLB','TEX',22500000),('Clayton Kershaw','CKers00','SP','MLB','LAD',33000000),('Corey Kluber','CKlub00','SP','MLB','CLE',4700000),('Carlos Martinez','CMart00','SP','MLB','STL',539000),('Jamie Collins','CollJa00','OLB','NFL','NWE',1025728),('DeMarcus Cousins','couside01','C','NBA','SAC',15851950),('Kirk Cousins','CousKi00','QB','NFL','WAS',778172),('Fletcher Cox','CoxxFl00','DT','NFL','PHI',3258563),('Jae Crowder','crowdja01','SF','NBA','BOS',6796117),('Chris Sale','CSale00','SP','MLB','CHW',9150000),('Corey Seager','CSeag00','SS','MLB','LAD',510000),('Stephen Curry','curryst01','PG','NBA','GSW',11370786),('Jay Cutler','CutlJa00','QB','NFL','CHI',16500000),('Christian Yelich','CYeli00','OF','MLB','MIA',1000000),('Andy Dalton','DaltAn00','QB','NFL','CIN',9600000),('Anthony Davis','davisan02','PF','NBA','NOP',7070730),('Ed Davis','davised01','PF','NBA','POR',6980802),('Thomas Davis','DaviTh20','OLB','NFL','CAR',7650000),('David DeCastro','DeCaDa00','G','NFL','PIT',2486240),('Luol Deng','denglu01','SF','NBA','MIA',10151612),('DeMar DeRozan','derozde01','SG','NBA','TOR',10050000),('Gorgui Dieng','dienggo01','C','NBA','MIN',1474440),('DJ LeMahieu','DLeMa00','2B','MLB','COL',3000000),('Aaron Donald','DonaAa00','DT','NFL','STL',2303750),('David Ortiz','DOrti00','DH','MLB','BOS',16000000),('Dustin Pedroia','DPedr00','2B','MLB','BOS',12642511),('Elvis Dumervil','DumeEl20','OLB','NFL','BAL',7375000),('Tim Duncan','duncati01','C','NBA','SAS',5250000),('Carlos Dunlap','DunlCa99','DE','NFL','CIN',4900000),('Kevin Durant','duranke01','SF','NBA','OKC',20158622),('Mike Evans','EvanMi00','WR','NFL','TAM',3325341),('Derrick Favors','favorde01','PF','NBA','UTA',12000000),('Freddie Freeman','FFree00','1B','MLB','ATL',12359375),('Larry Fitzgerald','FitzLa00','WR','NFL','ARI',10850000),('Ryan Fitzpatrick','FitzRy00','QB','NFL','NYJ',3250000),('Francisco Lindor','FLind00','SS','MLB','CLE',540300),('Devonta Freeman','FreeDe00','RB','NFL','ATL',631106),('Pau Gasol','gasolpa01','PF','NBA','CHI',7448760),('Paul George','georgpa01','SF','NBA','IND',17120106),('Garry Gilliam','GillGa01','G','NFL','SEA',514000),('Rudy Gobert','goberru01','C','NBA','UTA',1175880),('A.J. Green','GreeA.00','WR','NFL','CIN',14750000),('Danny Green','greenda02','SG','NBA','SAS',10000000),('Draymond Green','greendr01','PF','NBA','GSW',14260870),('Everson Griffen','GrifEv99','DE','NFL','MIN',8200000),('Rob Gronkowski','GronRo00','TE','NFL','NWE',8650000),('George Springer','GSpri00','OF','MLB','HOU',522400),('James Harden','hardeja01','SG','NBA','HOU',15756438),('Chris Harris','HarrCh01','DB','NFL','DEN',3000000),('Gordon Hayward','haywago01','SF','NBA','UTA',15409570),('George Hill','hillge01','PG','NBA','IND',8000000),('DeAndre Hopkins','HopkDe00','WR','NFL','HOU',2080009),('Al Horford','horfoal01','C','NBA','ATL',12000000),('Ian Kinsler','IKins00','2B','MLB','DET',14000000),('Mike Iupati','IupaMi20','G','NFL','ARI',6700000),('Reggie Jackson','jacksre01','PG','NBA','DET',13913044),('Jose Altuve','JAltu00','2B','MLB','HOU',3687500),('LeBron James','jamesle01','SF','NBA','CLE',22970000),('Jackie Bradley Jr.','JBrad00','OF','MLB','BOS',546500),('Johnny Cueto','JCuet00','SP','MLB','SF',17500000),('Josh Donaldson','JDona00','3B','MLB','TOR',11650000),('Jon Lester','JLest00','SP','MLB','CHC',25000000),('Calvin Johnson','JohnCa00','WR','NFL','DET',20558000),('Derrick Johnson','JohnDe25','MLB','NFL','KAN',5250000),('Amir Johnson','johnsam01','PF','NBA','BOS',12000000),('Nikola Jokic','jokicni01','C','NBA','DEN',1300000),('Chandler Jones','JoneCh03','DE','NFL','NWE',2600659),('Julio Jones','JoneJu02','WR','NFL','ATL',12400000),('DeAndre Jordan','jordade01','C','NBA','LAC',19689000),('Jose Quintana','JQuin00','SP','MLB','CHW',5400000),('Jean Segura','JSegu00','2B','MLB','ARI',2600000),('Julio Teheran','JTehe00','SP','MLB','ATL',3466666),('Justin Turner','JTurn00','3B','MLB','LAD',5100000),('Justin Verlander','JVerl00','SP','MLB','DET',28000000),('Ryan Kalil','KaliRy20','C','NFL','CAR',11795000),('Kris Bryant','KBrya00','3B','MLB','CHC',652000),('Kyle Hendricks','KHend00','SP','MLB','CHC',541000),('Kyle Seager','KSeag00','3B','MLB','SEA',8000000),('Luke Kuechly','KuecLu00','MLB','NFL','CAR',6697018),('Sean Lee','LeexSe99','OLB','NFL','DAL',5450000),('Kawhi Leonard','leonaka01','SF','NBA','SAS',16407500),('Damian Lillard','lillada01','PG','NBA','POR',4236287),('Kyle Long','LongKy00','G','NFL','CHI',2263896),('Kevin Love','loveke01','PF','NBA','CLE',19689000),('Kyle Lowry','lowryky01','PG','NBA','TOR',12000000),('Khalil Mack','MackKh00','OLB','NFL','OAK',4244773),('Jeremy Maclin','MaclJe00','WR','NFL','KAN',3400000),('Eli Manning','MannEl00','QB','NFL','NYG',14450000),('Brandon Marshall','MarsBr00','WR','NFL','NYJ',9000000),('Doug Martin','MartDo00','RB','NFL','TAM',2159668),('Tyrann Mathieu','MathTy00','DB','NFL','ARI',855937),('Clay Matthews','MattCl99','OLB','NFL','GNB',12700000),('Mookie Betts','MBett00','OF','MLB','BOS',566000),('Madison Bumgarner','MBumg00','SP','MLB','SF',9916667),('Miguel Cabrera','MCabr00','1B','MLB','DET',28000000),('Michael Fulmer','MFulm00','SP','MLB','DET',507500),('Paul Millsap','millspa01','PF','NBA','ATL',18671659),('Von Miller','MillVo00','OLB','NFL','DEN',9754000),('Manny Machado','MMach00','3B','MLB','BAL',5000000),('Max Scherzer','MSche00','SP','MLB','WSH',22142857),('Masahiro Tanaka','MTana00','SP','MLB','NYY',22000000),('Mike Trout','MTrou00','OF','MLB','LAA',16083333),('Nolan Arenado','NAren00','3B','MLB','COL',5000000),('Nelson Cruz','NCruz00','OF','MLB','SEA',14250000),('Reggie Nelson','NelsRe99','S','NFL','CIN',4775000),('Cam Newton','NewtCa00','QB','NFL','CAR',13000000),('Josh Norman','NormJo01','DB','NFL','CAR',1591750),('Noah Syndergaard','NSynd00','SP','MLB','NYM',535375),('Victor Oladipo','oladivi01','SG','NBA','ORL',5192520),('Greg Olsen','OlseGr00','TE','NFL','CAR',6300000),('Carson Palmer','PalmCa00','QB','NFL','ARI',7375000),('Chris Paul','paulch01','PG','NBA','LAC',21468695),('Julius Peppers','PeppJu99','OLB','NFL','GNB',12000000),('Adrian Peterson','PeteAd01','RB','NFL','MIN',15650000),('Marcus Peters','PeteMa00','DB','NFL','KAN',1742574),('Patrick Peterson','PetePa00','DB','NFL','ARI',14791491),('Paul Goldschmidt','PGold00','1B','MLB','ARI',5833333),('Mason Plumlee','plumlma01','C','NBA','POR',1415520),('Otto Porter','porteot01','SF','NBA','WAS',4662960),('Robinson Cano','RCano00','2B','MLB','SEA',24000000),('Darrelle Revis','ReviDa99','DB','NFL','NYJ',16000000),('Philip Rivers','RivePh00','QB','NFL','SDG',21166668),('Allen Robinson','RobiAl02','WR','NFL','JAX',797925),('Aaron Rodgers','RodgAa00','QB','NFL','GNB',18250000),('Ben Roethlisberger','RoetBe00','QB','NFL','PIT',17245000),('Rick Porcello','RPorc00','SP','MLB','BOS',20125000),('Ricky Rubio','rubiori01','PG','NBA','MIN',12700000),('Matt Ryan','RyanMa00','QB','NFL','ATL',19500000),('Richard Sherman','SherRi00','DB','NFL','SEA',12200000),('Kawann Short','ShorKa00','DT','NFL','CAR',1262819),('Josh Sitton','SittJo20','G','NFL','GNB',7000000),('Starling Marte','SMart00','OF','MLB','PIT',3333333),('Alex Smith','SmitAl03','QB','NFL','KAN',15600000),('Tyron Smith','SmitTy00','T','NFL','DAL',5039000),('Matthew Stafford','StafMa00','QB','NFL','DET',17721250),('Zach Strief','StriZa20','T','NFL','NOR',3200000),('Aqib Talib','TaliAq99','DB','NFL','DEN',6968750),('Ryan Tannehill','TannRy00','QB','NFL','MIA',4873364),('Tyrod Taylor','TaylTy00','QB','NFL','BUF',883333),('Isaiah Thomas','thomais02','PG','NBA','BOS',6912869),('Earl Thomas','ThomEa99','S','NFL','SEA',7400000),('Joe Thomas','ThomJo28','T','NFL','CLE',10200000),('Karl-Anthony Towns','townska01','PF','NBA','MIN',5703600),('Tanner Roark','TRoar00','SP','MLB','WSH',543000),('Trai Turner','TurnTr01','G','NFL','CAR',657950),('Jared Veldheer','VeldJa20','T','NFL','ARI',8500000),('Bobby Wagner','WagnBo00','MLB','NFL','SEA',2970663),('Kemba Walker','walkeke02','PG','NBA','CHO',12000000),('John Wall','walljo01','PG','NBA','WAS',15851950),('J.J. Watt','WattJ.00','DE','NFL','HOU',13969000),('Russell Westbrook','westbru01','PG','NBA','OKC',16744218),('Andrew Whitworth','WhitAn20','T','NFL','CIN',7200000),('Hassan Whiteside','whiteha01','C','NBA','MIA',981348),('Muhammad Wilkerson','WilkMu00','DE','NFL','NYJ',6969000),('Marvin Williams','willima02','PF','NBA','CHO',7000000),('Trent Williams','WillTr21','T','NFL','WAS',10664763),('Russell Wilson','WilsRu00','QB','NFL','SEA',7054868),('Jameis Winston','WinsJa00','QB','NFL','TAM',4609323),('Charles Woodson','WoodCh00','DB','NFL','OAK',4200000),('K.J. Wright','WrigK.00','OLB','NFL','SEA',4750000),('Marshal Yanda','YandMa20','G','NFL','BAL',6981765);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'playervaluetool'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_baseball_hitter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_baseball_hitter`(
	IN pId varchar(20), atBats int(3), runsScored int(3), hits int(3),
	doubles int(2), triples int(2), homeruns int(2), runsBattedIn int(3),
	stolenBases int(3), caughtStealing int(3), walksDrawn int(3), strikeouts int(3),
	battingAverage DECIMAL(4,3), onBasePercentage DECIMAL(4,3), sluggingPercentage DECIMAL(4,3),
	onBasePlusSlugging DECIMAL(4,3), winsAboveReplacement DECIMAL(4,2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO baseballhitterstats VALUES (pId,atBats,runsScored,hits,doubles,triples,homeruns,
		runsBattedIn, stolenBases,caughtStealing,walksDrawn,strikeouts,battingAverage,onBasePercentage,
		sluggingPercentage, onBasePlusSlugging,winsAboveReplacement);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_baseball_pitcher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_baseball_pitcher`(
	IN pId varchar(20), gamesPitched int(2), gamesStarted int(2), inningsPitched DECIMAL(4,1), hitsAllowed int(3),
	runsGivenUp int(3), earnedRuns int(3), walksAllowed int(3), strikeouts int(3), wins int(2), losses int(2),
	saves int(2), blownSaves int(2), walksPlusHitsAllowedPerInningsPitched DECIMAL(3,2), earnedRunAverage DECIMAL(3,2),
	winsAboveReplacement DECIMAL(4,2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO baseballpitcherstats VALUES (pId,gamesPitched,gamesStarted,inningsPitched,hitsAllowed,runsGivenUp,earnedRuns,
		walksAllowed,strikeouts,wins,losses,saves,blownSaves,walksPlusHitsAllowedperInningsPitched,earnedRunAverage,winsAboveReplacement);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_basketball_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_basketball_player`(
	IN  pId varchar(20), gamesPlayed int(2), playerEfficiencyRating DECIMAL(3,1), ppg DECIMAL(3,1),
	rpg DECIMAL(3,1), apg DECIMAL(3,1), spg DECIMAL(3,1), bpg DECIMAL(3,1),
	fieldGoalPercentage DECIMAL (4,3), trueShootingPercentage DECIMAL(4,3), usagePercentage DECIMAL(3,1), valueOverReplacementPlayer DECIMAL(2,1)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO basketballplayerstats VALUES (pId,gamesPlayed,playerEfficiencyRating,ppg,rpg,apg,spg,bpg,
		fieldGoalPercentage,trueShootingPercentage,usagePercentage,valueOverReplacementPlayer);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_football_defensive_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_football_defensive_player`(
	IN 	pId varchar(20), approximateValue int(2), totalTackles int(3), assistedTackles int(3), sacks int(2),
	passesDefended int(2), interceptions int(2), forcedFumbles int(2), fumblesRecovered int(2), defensiveTD int(1)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO footballdefensiveplayerstats VALUES (pId,approximateValue,totalTackles,assistedTackles,sacks,
		passesDefended,interceptions,forcedFumbles,fumblesRecovered,defensiveTD);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_football_offensive_lineman` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_football_offensive_lineman`(
	IN 	pId varchar(20), approximateValue int(2), sacksAllowed int(2), qbHits int(2), qbHurries int(2),
	penaltiesCommitted int(2), penaltiesAccepted int(2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO footballoffensivelinestats VALUES (pId,approximateValue,sacksAllowed,qbHits,qbHurries,
		penaltiesCommitted,penaltiesAccepted);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_football_skill_position_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_football_skill_position_player`(
	IN pId varchar(20), approximateValue int(2), passingYards int(4), passingTD int(2), yardsPerCompletion DECIMAL(3,1), yardsPerAttempt DECIMAL(3,1),
	completionPercentage DECIMAL(3,1), rushingAttempts int(3), rushingYards int(4), rushingTD int(2), targets int(3), receptions int(3), receivingYards int(4),
	receivingTD int(2), fumbles int(2), interceptions int(2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO footballoffensiveplayerstats VALUES (pId,approximateValue,passingYards,passingTD,yardsPerCompletion,yardsPerAttempt,
		completionPercentage,rushingAttempts,rushingYards,rushingTD,targets,receptions,receivingYards,receivingTD,fumbles,interceptions);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_to_players_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_players_table`(
	IN pName varchar(30), pID varchar(20), pos char(3), sportName char(3), teamName char(3), salary int(10)
)
BEGIN 
	INSERT INTO players VALUES (pName,pID,pos,sportName,teamName,salary);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_player`(
	IN pId varchar(20)
)
BEGIN
	DELETE FROM players  WHERE pId = players.playerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_player`(
	IN pId varchar(30)
)
BEGIN
	DECLARE sportName char(3);
    DECLARE playerPosition char(3);
    DECLARE tableName varchar(40);
    
    SET @sportName = (SELECT p.sport FROM players p WHERE pId = p.playerId ORDER BY p.playerName);
    SET @playerPosition = (SELECT p.pos FROM players p WHERE pId = p.playerId ORDER BY p.playerName);
    
    IF @sportName = 'NBA' THEN SET @tableName = 'basketballplayerstats';
    ELSEIF @sportName = 'MLB' AND (@playerPosition = 'SP' OR @playerPosition = 'RP') THEN SET @tableName = 'baseballpitcherstats';
    ELSEIF @sportName = 'MLB' THEN SET @tableName = 'baseballhitterstats';
    ELSEIF @sportName = 'NFL' AND (@playerPosition = 'QB' OR @playerPosition = 'RB' OR @playerPosition = 'WR' OR @playerPosition = 'TE') THEN SET @tableName = 'footballoffensiveplayerstats';
    ELSEIF @sportName = 'NFL' AND (@playerPosition = 'G' OR @playerPosition = 'T' OR @playerPosition = 'C') THEN SET @tableName = 'footballoffensivelinestats';
    ELSEIF @sportName = 'NFL' THEN SET @tableName = 'footballdefensiveplayerstats';
    ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This sport or player does not exist.';
    END IF;
    
    SET @t1 := CONCAT("SELECT * FROM ",@tableName," WHERE ","'",pId,"'"," = ",@tableName,".playerId");
    PREPARE stmt FROM @t1;
    EXECUTE stmt;
	DEALLOCATE PREPARE stmt; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_players_in_sport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_players_in_sport`(
	IN sport char(3)
)
BEGIN
	SELECT * FROM players p WHERE sport = p.sport ORDER BY p.playerName ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_players_salary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_players_salary`(
	IN pId varchar(20), newSalary int(10)
)
BEGIN
	UPDATE players SET players.salary = newSalary WHERE pId = players.playerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_players_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_players_team`(
	IN pId varchar(20), newTeam char(3)
)
BEGIN
	UPDATE players SET players.team = newTeam WHERE pId = players.playerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06 19:26:05
