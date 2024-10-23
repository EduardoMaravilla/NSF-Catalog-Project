CREATE DATABASE  IF NOT EXISTS `nfs_catalogo_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nfs_catalogo_project`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: nfs_catalogo_project
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auxiliaries`
--

DROP TABLE IF EXISTS `auxiliaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auxiliaries` (
  `id_auxiliaries` int NOT NULL AUTO_INCREMENT,
  `auxiliar` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id_auxiliaries`),
  KEY `fk_auxiliares_level_id_idx` (`level_id`),
  CONSTRAINT `fk_auxiliares_level_id` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id_levels`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auxiliaries`
--

LOCK TABLES `auxiliaries` WRITE;
/*!40000 ALTER TABLE `auxiliaries` DISABLE KEYS */;
INSERT INTO `auxiliaries` VALUES (1,'ESPACIO VACIO',1),(2,'PROTECCION DE IMPACTOS',3),(3,'AUMENTO DE DAÑOS',3),(4,'KIT DE REPARACION',3),(5,'NITRO POR DERRAPES',3),(6,'AGARRE DE NITRO',3),(7,'NITRO POR ROCES',3),(8,'NITRO POR REBUFO',3),(9,'NITRO POR SALTOS',3),(10,'PROTECCION DE IMPACTOS',4),(11,'AUMENTO DE DAÑOS',4),(12,'KIT DE REPARACION',4),(13,'NITRO POR DERRAPES',4),(14,'AGARRE DE NITRO',4),(15,'NITRO POR ROCES',4),(16,'NITRO POR REBUFO',4),(17,'NITRO POR SALTOS',4),(18,'INHIBIDOR DE RADIO',4),(19,'PILOTO A LA FUGA',4);
/*!40000 ALTER TABLE `auxiliaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id_cars` int NOT NULL AUTO_INCREMENT,
  `maker_id` int NOT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_year` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cars`),
  KEY `fk_cars_makers1_idx` (`maker_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_cars_makers1` FOREIGN KEY (`maker_id`) REFERENCES `makers` (`id_makers`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,39,'NSX','2017'),(2,39,'RSX-S','2004'),(3,40,'Giulia Quadrifoglio','2016'),(4,41,'DB5','1964'),(5,41,'DB11','2017'),(6,41,'DB11 Volante','2019'),(7,41,'Vulcan','2016'),(8,35,'M2 Coupe','2023'),(9,35,'M3 E46','2006'),(10,35,'M3 Evolution II E30','1988'),(11,35,'M4 Coupé','2018'),(12,35,'M4 Convertible','2018'),(13,35,'M5','2018'),(15,35,'X6 M','2016'),(16,35,'Z4 M40i','2019'),(17,35,'i8 Coupé','2018'),(18,35,'M4 GTS','2016'),(19,35,'M3 Convertible','2010'),(21,35,'i8 Roadster','2018'),(22,42,'Chiron Sport','2019'),(23,36,'Grand National GNX','1987'),(24,43,'Bel Air','1955'),(25,43,'Camaro SS','1967'),(26,43,'Camaro Z/28','2014'),(27,43,'Colorado ZR2','2017'),(28,43,'Corvette Grand Sport','2017'),(29,43,'Corvette Stingray','2020'),(30,43,'Corvette Stingray Convertible','2020'),(31,43,'Corvette Z06','2013'),(32,43,'Corvette ZR1','2019'),(33,43,'C10 Stepside Pickup','1965'),(34,37,'DeLorean','1981'),(35,44,'Challenger SRT8','2014'),(36,44,'Charger','1969'),(37,44,'Charger SRT Hellcat','2019'),(38,45,'458 Italia','2009'),(39,45,'458 Spider','2011'),(40,45,'488 GTB','2015'),(41,45,'488 Pista','2019'),(42,45,'F40','1987'),(43,45,'FXX-K Evo','2018'),(44,45,'LaFerrari','2016'),(45,45,'Testarossa Coupé','1984'),(46,46,'Crown Victoria','2008'),(47,46,'Focus RS','2016'),(48,46,'F-150 Raptor','2017'),(49,46,'Mustang','1965'),(50,46,'Mustang BOSS 302','1969'),(51,46,'Mustang Foxbody','1990'),(52,46,'Mustang GT','2015'),(53,46,'Mustang GT Convertible','2019'),(54,46,'GT','2017'),(55,47,'Civic Type-R','2000'),(57,47,'Civic Type-R','2015'),(58,47,'NSX R','1992'),(59,47,'S2000','2009'),(60,48,'Q60S','2017'),(61,49,'F-Type R Coupé','2016'),(62,49,'F-Type R Convertible','2019'),(63,50,'Regera','2016'),(64,51,'Aventador S','2016'),(65,51,'Aventador S Roadster','2017'),(66,51,'Aventador SVJ Coupé','2018'),(67,51,'Aventador SVJ Roadster','2019'),(68,51,'Aventador LP750-4 Superveloce Roadster','2015'),(69,51,'Countach 25.º Aniversario','1988'),(70,51,'Countach LPI 800-4','2021'),(71,51,'Diablo SV','1996'),(72,51,'Huracán RWD','2015'),(73,51,'Huracán RWD Spyder','2016'),(74,51,'Huracán Performante','2017'),(75,51,'Huracán Performante Spyder','2018'),(76,51,'Murciélago LP 670-4  SV','2009'),(77,51,'Urus','2017'),(78,52,'Defender 110 Pickup','2015'),(79,52,'Range Rover Sport SVR','2015'),(80,38,'Emira','2021'),(81,38,'Exige S','2006'),(82,53,'MX-5','1996'),(84,53,'MX-5','2015'),(85,53,'RX-7 Spirit R','2002'),(86,53,'RX-8 Spirit R ','2011'),(87,54,'570S Coupé','2015'),(88,54,'570S Spider','2018'),(89,54,'600LT','2018'),(90,54,'F1','1994'),(91,54,'P1','2013'),(92,54,'P1 GTR','2015'),(93,55,'Benz 190E 2.5-16','1988'),(94,55,'AMG A 45','2016'),(95,55,'AMG C 63 Cabriolet','2018'),(96,55,'AMG C 63 Coupé','2018'),(97,55,'AMG G 63','2017'),(98,55,'AMG GT Black Series','2020'),(99,55,'AMG GT R','2017'),(100,55,'AMG GT S Coupé','2019'),(101,55,'AMG GT S Roadster','2019'),(102,55,'Maybach S 680','2021'),(103,56,'Cougar','1967'),(104,57,'John Cooper Works Countryman','2017'),(105,58,'Eclipse GSX','1999'),(106,58,'Lancer Evolution IX','2007'),(107,58,'Lancer Evolution X','2008'),(108,59,'180SX Type X','1996'),(109,59,'350Z','2008'),(110,59,'370Z Heritage Edition','2019'),(111,59,'370Z Nismo','2015'),(112,59,'Fairlady 240ZG','1971'),(113,59,'GT-R Nismo','2017'),(114,59,'GT-R Premium Edition','2017'),(115,59,'Silvia K’s','1998'),(116,59,'Silvia Spec-R Aero','2002'),(117,59,'Skyline GT-R KPGC10','1971'),(118,59,'Skyline GT-R V·Spec','1993'),(119,59,'Skyline GT-R V·Spec','1999'),(120,59,'Z Prototype','2020'),(121,60,'Huayra BC','2017'),(122,61,'Barracuda','1970'),(123,62,'Polestar 1','2020'),(124,63,'Firebird','1977'),(125,64,'718 Cayman GTS','2018'),(126,64,'911 Carrera GTS','2018'),(127,64,'911 Carrera RSR 2.8','1973'),(128,64,'911 Carrera S','1997'),(129,64,'911 GT2 RS','2018'),(130,64,'911 GT3 RS','2019'),(131,64,'911 Turbo S Cabriolet exclusive Series','2019'),(132,64,'911 Turbo S Exclusive','2018'),(133,64,'918 Spyder','2015'),(134,64,'718 Spyder','2019'),(135,64,'Panamera Turbo','2017'),(136,64,'Cayman GT4','2015'),(137,64,'911 Targa 4 GTS','2018'),(138,65,'Viper GTS','2014'),(139,66,'BRZ Premium','2014'),(140,66,'Impreza WRX STI','2006'),(141,66,'Impreza WRX STI','2010'),(142,67,'Beetle','1963'),(143,67,'Golf GTI','1976'),(144,67,'Golf GTI Clubsport','2016'),(145,68,'242 DL','1975'),(146,68,'Amazon P130','1970'),(147,69,'R8 Coupe V10 performance quattro','2019'),(148,69,'S5 Sportback','2017'),(149,35,'M1','1981'),(150,35,'M2 Competition','2019'),(151,35,'M3 Coupé','2010'),(152,35,'M3 Competition Touring','2023'),(153,64,'Taycan Turbo S','2022'),(154,64,'911 Carrera GTS Cabriolet','2018'),(155,35,'M3 GTR Legends Edition','2005'),(156,46,'Mustang Dark Horse','2024'),(157,69,'RS 6 Avant','2020');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_configurations`
--

DROP TABLE IF EXISTS `cars_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_configurations` (
  `id_cars_configurations` int NOT NULL AUTO_INCREMENT,
  `car_id` int NOT NULL,
  `engine_id` int NOT NULL,
  `induction_level` int NOT NULL,
  `ecu_level` int NOT NULL,
  `injection_level` int NOT NULL,
  `escape_level` int NOT NULL,
  `turbo_id` int NOT NULL,
  `nitro_level` int NOT NULL,
  `suspension_id` int NOT NULL,
  `brake_level` int NOT NULL,
  `tire_id` int NOT NULL,
  `embrague_level` int NOT NULL,
  `gear_id` int NOT NULL,
  `differential_level` int NOT NULL,
  `top_speed` int NOT NULL,
  `one_hundred` decimal(10,2) NOT NULL,
  `power` int NOT NULL,
  `par` int NOT NULL,
  `four_hundred` decimal(10,2) NOT NULL,
  `driver_id` int NOT NULL,
  `auxiliar_one` int NOT NULL,
  `auxiliar_two` int NOT NULL,
  `classes_id` int NOT NULL,
  PRIMARY KEY (`id_cars_configurations`),
  KEY `fk_cars_configurations_cars1_idx` (`car_id`),
  KEY `fk_cars_configurations_engines1_idx` (`engine_id`),
  KEY `fk_cars_configurations_levels1_idx` (`induction_level`),
  KEY `fk_cars_configurations_turbos1_idx` (`turbo_id`),
  KEY `fk_cars_configurations_suspensions1_idx` (`suspension_id`),
  KEY `fk_cars_configurations_tires1_idx` (`tire_id`),
  KEY `fk_cars_configurations_gears1_idx` (`gear_id`),
  KEY `fk_cars_configurations_drivers1_idx` (`driver_id`),
  KEY `fk_cars_configurations_ecu1_idx` (`ecu_level`),
  KEY `fk_cars_configurations_inyection1_idx` (`injection_level`),
  KEY `fk_cars_configurations_escape1_idx` (`escape_level`),
  KEY `fk_cars_configurations_nitro1_idx` (`nitro_level`),
  KEY `fk_cars_configurations_brakes1_idx` (`brake_level`),
  KEY `fk_cars_configurations_embrague1_idx` (`embrague_level`),
  KEY `fk_cars_configurations_diferencial1_idx` (`differential_level`),
  KEY `fk_cars_configurations_auxiliar_1_idx` (`auxiliar_one`),
  KEY `fk_cars_configurations_auxiliar_2_idx` (`auxiliar_two`),
  KEY `fk_cars_configurations_classes_id_idx` (`classes_id`),
  CONSTRAINT `fk_cars_configurations_auxiliar_one` FOREIGN KEY (`auxiliar_one`) REFERENCES `auxiliaries` (`id_auxiliaries`),
  CONSTRAINT `fk_cars_configurations_auxiliar_two` FOREIGN KEY (`auxiliar_two`) REFERENCES `auxiliaries` (`id_auxiliaries`),
  CONSTRAINT `fk_cars_configurations_brakes1` FOREIGN KEY (`brake_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_cars1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id_cars`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cars_configurations_classes_id` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id_classes`),
  CONSTRAINT `fk_cars_configurations_diferencial1` FOREIGN KEY (`differential_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_drivers1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id_drivers`),
  CONSTRAINT `fk_cars_configurations_ecu1` FOREIGN KEY (`ecu_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_embrague1` FOREIGN KEY (`embrague_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_engines1` FOREIGN KEY (`engine_id`) REFERENCES `engines` (`id_engines`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cars_configurations_escape1` FOREIGN KEY (`escape_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_gears1` FOREIGN KEY (`gear_id`) REFERENCES `gears` (`id_gears`),
  CONSTRAINT `fk_cars_configurations_induction1` FOREIGN KEY (`induction_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_inyection1` FOREIGN KEY (`injection_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_nitro1` FOREIGN KEY (`nitro_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_suspensions1` FOREIGN KEY (`suspension_id`) REFERENCES `suspensions` (`id_suspensions`),
  CONSTRAINT `fk_cars_configurations_tires1` FOREIGN KEY (`tire_id`) REFERENCES `tires` (`id_tires`),
  CONSTRAINT `fk_cars_configurations_turbos1` FOREIGN KEY (`turbo_id`) REFERENCES `turbos` (`id_turbos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_configurations`
--

LOCK TABLES `cars_configurations` WRITE;
/*!40000 ALTER TABLE `cars_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id_classes` int NOT NULL AUTO_INCREMENT,
  `name` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_classes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'B'),(2,'A'),(3,'A+'),(4,'S'),(5,'S+');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id_drivers` int NOT NULL AUTO_INCREMENT,
  `drive` int NOT NULL,
  `direction` int NOT NULL,
  `down_force` int NOT NULL,
  `control_traction` tinyint NOT NULL DEFAULT '0',
  `skid_start_id` int NOT NULL,
  PRIMARY KEY (`id_drivers`),
  KEY `fk_drivers_init_skids1_idx` (`skid_start_id`),
  CONSTRAINT `fk_drivers_init_skids1` FOREIGN KEY (`skid_start_id`) REFERENCES `init_skids` (`id_init_skids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engines`
--

DROP TABLE IF EXISTS `engines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engines` (
  `id_engines` int NOT NULL AUTO_INCREMENT,
  `bhp` int NOT NULL,
  `liters` decimal(10,2) NOT NULL,
  `model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id_engines`),
  KEY `fk_engines_levels_idx` (`level_id`),
  CONSTRAINT `fk_engines_levels` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id_levels`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engines`
--

LOCK TABLES `engines` WRITE;
/*!40000 ALTER TABLE `engines` DISABLE KEYS */;
INSERT INTO `engines` VALUES (1,225,4.90,'V8',1),(2,573,3.50,'V6 híbrido',2),(3,592,4.40,'V8',3),(4,754,6.00,'V12',4),(5,903,3.80,'V8 híbrido',5),(6,200,2.00,'4 cilindros',1),(7,232,1.30,'Wankel',1),(8,449,5.20,'V12',2),(9,276,2.60,'6 cilindros',2),(10,276,3.00,'V6',2),(11,360,2.50,'bóxer 4 cilindros',2),(12,471,2.90,'V8',3),(13,505,2.90,'V6',2),(14,755,6.20,'V8',3),(15,631,5.20,'V10',4),(16,661,3.90,'V8',4),(18,600,5.20,'V12',2),(19,385,4.90,'bóxer 12 cilindros',2),(20,707,6.20,'V8',3),(21,803,6.50,'V12 híbrido',5),(22,175,4.60,'V8',1),(23,200,4.70,'V8',1),(24,503,4.00,'V8',2),(25,710,3.90,'V8',3),(26,282,4.00,'6 cilindros',1),(27,435,5.00,'V8',2),(28,562,3.80,'V6',3),(29,577,4.00,'V8',3),(30,690,3.80,'bóxer 6 cilindros',4),(31,820,7.00,'V12',4),(32,290,4.90,'V8',1),(33,414,4.00,'V8',2),(34,570,4.50,'V8',3),(35,612,5.20,'V10',4),(36,740,6.50,'V12',5),(37,523,5.70,'V12',2),(38,349,3.00,'V6',2),(39,493,3.00,'6 cilindros',2),(40,515,4.00,'V8',3),(41,414,3.80,'bóxer 6 cilindros',3),(42,506,7.00,'V8',4),(43,306,2.00,'4 cilindros',2),(44,369,1.50,'3 c. híbrido',2),(45,338,3.20,'6 cilindros',2),(46,400,3.00,'V6',2),(47,425,3.00,'6 cilindros',2),(48,592,3.80,'V8',4),(49,572,5.20,'V10',4),(50,308,3.60,'V6',1),(51,274,3.50,'6 cilindros',1),(52,495,6.20,'V8',3),(53,646,3.50,'V6',3),(54,404,3.00,'V8',2),(55,345,4.00,'V8',2),(56,562,3.80,'V8',3),(57,599,3.80,'bóxer 6 cilindros',3),(58,453,3.00,'6 cilindros',2),(59,591,3.80,'V6',3),(60,661,6.50,'V12',4),(61,414,4.00,'bóxer 6 cilindros',3),(62,200,6.60,'V8',1),(63,720,4.00,'V8',4),(64,640,8.40,'V10',3),(65,503,3.00,'6 cilindros',3),(66,591,4.00,'V8',3),(67,759,6.50,'V12',5),(68,575,5.00,'V8',2),(69,730,6.50,'V12',4),(70,217,2.30,'4 cilindros',1),(71,300,2.80,'bóxer 6 cilindros',2),(72,460,6.20,'V8',3),(73,469,4.00,'V8',2),(74,601,5.20,'V10',4);
/*!40000 ALTER TABLE `engines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gears`
--

DROP TABLE IF EXISTS `gears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gears` (
  `id_gears` int NOT NULL AUTO_INCREMENT,
  `gear_value` int NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id_gears`),
  KEY `fk_gears_levels1_idx` (`level_id`),
  CONSTRAINT `fk_gears_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id_levels`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gears`
--

LOCK TABLES `gears` WRITE;
/*!40000 ALTER TABLE `gears` DISABLE KEYS */;
INSERT INTO `gears` VALUES (1,1,5),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,3),(7,7,4),(8,8,5);
/*!40000 ALTER TABLE `gears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `granted_permissions`
--

DROP TABLE IF EXISTS `granted_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `granted_permissions` (
  `id_granted_permissions` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `operation_id` int NOT NULL,
  PRIMARY KEY (`id_granted_permissions`),
  UNIQUE KEY `id_granted_permissions_UNIQUE` (`id_granted_permissions`),
  KEY `fk_role_permissions_roles1_idx` (`role_id`),
  KEY `fk_role_permissions_permissions1_idx` (`operation_id`),
  CONSTRAINT `fk_role_permissions_permissions1` FOREIGN KEY (`operation_id`) REFERENCES `operations` (`id_operations`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_permissions_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_roles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `granted_permissions`
--

LOCK TABLES `granted_permissions` WRITE;
/*!40000 ALTER TABLE `granted_permissions` DISABLE KEYS */;
INSERT INTO `granted_permissions` VALUES (1,1,3),(2,1,6),(3,1,7),(4,1,16),(5,1,17),(6,1,21),(7,1,22),(8,1,36),(9,1,37),(10,1,41),(11,1,42),(12,1,46),(13,1,47),(14,1,51),(15,1,52),(16,1,56),(17,1,57),(18,1,61),(19,1,62),(20,1,66),(21,1,67),(22,1,71),(23,1,72),(24,1,76),(25,1,77),(26,2,3),(27,2,6),(28,2,7),(29,2,8),(30,2,9),(31,2,10),(32,2,11),(33,2,12),(34,2,13),(35,2,14),(36,2,15),(37,2,16),(38,2,17),(39,2,18),(40,2,19),(41,2,20),(42,2,21),(43,2,22),(44,2,23),(45,2,24),(46,2,25),(47,2,26),(48,2,27),(49,2,28),(50,2,29),(51,2,30),(52,2,31),(53,2,32),(54,2,33),(55,2,34),(56,2,35),(57,2,36),(58,2,37),(59,2,38),(60,2,39),(61,2,40),(62,2,41),(63,2,42),(64,2,43),(65,2,44),(66,2,45),(67,2,46),(68,2,47),(69,2,48),(70,2,49),(71,2,50),(72,2,51),(73,2,52),(74,2,53),(75,2,54),(76,2,55),(77,2,56),(78,2,57),(79,2,58),(80,2,59),(81,2,60),(82,2,61),(83,2,62),(84,2,63),(85,2,64),(86,2,65),(87,2,66),(88,2,67),(89,2,68),(90,2,69),(91,2,70),(92,2,71),(93,2,72),(94,2,73),(95,2,74),(96,2,75),(97,2,76),(98,2,77),(99,2,78),(100,2,79),(101,2,80),(102,1,31),(103,1,32),(104,1,82),(105,2,82),(106,1,83),(107,2,83),(108,1,85),(109,2,85),(110,1,87),(111,2,87),(112,1,89),(113,2,89);
/*!40000 ALTER TABLE `granted_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `init_skids`
--

DROP TABLE IF EXISTS `init_skids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `init_skids` (
  `id_init_skids` int NOT NULL AUTO_INCREMENT,
  `skid_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_init_skids`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `init_skids`
--

LOCK TABLES `init_skids` WRITE;
/*!40000 ALTER TABLE `init_skids` DISABLE KEYS */;
INSERT INTO `init_skids` VALUES (1,'NO'),(2,'TOQUE DE FRENO'),(3,'TOQUE DE ACELERADOR'),(4,'POR DEFECTO');
/*!40000 ALTER TABLE `init_skids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_tokens`
--

DROP TABLE IF EXISTS `jwt_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_tokens` (
  `id_jwt_tokens` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_valid` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_jwt_tokens`),
  KEY `fk_jwt_tokens_users_id_idx` (`user_id`),
  CONSTRAINT `fk_jwt_tokens_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `jwt_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id_levels` int NOT NULL AUTO_INCREMENT,
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_levels`),
  UNIQUE KEY `level_UNIQUE` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Basico'),(2,'Deportivo'),(5,'Elite'),(3,'Pro'),(4,'Super');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makers`
--

DROP TABLE IF EXISTS `makers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makers` (
  `id_makers` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_makers`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makers`
--

LOCK TABLES `makers` WRITE;
/*!40000 ALTER TABLE `makers` DISABLE KEYS */;
INSERT INTO `makers` VALUES (39,'Acura'),(40,'Alfa Romeo'),(41,'Aston Martin'),(69,'Audi'),(35,'BMW'),(42,'Bugatti'),(36,'Buick'),(43,'Chevrolet'),(37,'DMC'),(44,'Dodge'),(45,'Ferrari'),(46,'Ford'),(47,'Honda'),(48,'Infiniti'),(49,'Jaguar'),(50,'Koenigsegg'),(51,'Lamborghini'),(52,'Land Rover'),(38,'Lotus'),(53,'Mazda'),(54,'McLaren'),(55,'Mercedes'),(56,'Mercury'),(57,'MINI'),(58,'Mitsubishi'),(59,'NISSAN'),(60,'Pagani'),(61,'Plymouth'),(62,'Polestar'),(63,'Pontiac'),(64,'Porsche'),(65,'SRT'),(66,'SUBARU'),(67,'Volkswagen'),(68,'Volvo');
/*!40000 ALTER TABLE `makers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id_modules` int NOT NULL AUTO_INCREMENT,
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_modules`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'AUTHENTICATION','/auth'),(2,'RACER','/racers'),(3,'AUXILIARY','/auxiliaries'),(4,'CAR_CONFIGURATION','/car-configurations'),(5,'CAR','/cars'),(6,'CLASSES','/classes'),(7,'DRIVER','/drivers'),(8,'ENGINE','/engines'),(9,'GEAR','/gears'),(10,'INIT_SKID','/init-skids'),(11,'LEVEL','/levels'),(12,'MAKER','/makers'),(13,'STREET_TYPE','/street-types'),(14,'SUSPENSION','/suspensions'),(15,'TIRE','/tires'),(16,'TURBO','/turbos'),(17,'TURBO_TYPE','/turbo-types'),(18,'API_DOCUMETATION','/doc'),(19,'RACER_CAR_CONFIGURATION','/racer-car-configurations');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations` (
  `id_operations` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permit_all` tinyint NOT NULL DEFAULT '0',
  `module_id` int NOT NULL,
  PRIMARY KEY (`id_operations`),
  KEY `fk_operations_module_id_idx` (`module_id`),
  CONSTRAINT `fk_operations_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id_modules`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,'AUTHENTICATE','/authenticate','POST',1,1),(2,'VALIDATE_TOKEN','/validate-token','POST',1,1),(3,'READ_MY_PROFILE','/profile','GET',0,1),(4,'LOGOUT','/logout','POST',1,1),(5,'REGISTER_ONE_RACER','/register','POST',1,2),(6,'READ_ONE_AUXILIARY','/[0-9]*','GET',0,3),(7,'READ_ALL_AUXILIARIES','','GET',0,3),(8,'CREATE_AUXILIARY','','POST',0,3),(9,'UPDATE_AUXILIARY','/[0-9]*','PUT',0,3),(10,'DELETE_AUXILIARY','/[0-9]*','DELETE',0,3),(11,'READ_ONE_CAR_CONFIGURATION','/[0-9]*','GET',0,4),(12,'READ_ALL_CAR_CONFIGURATIONS','','GET',0,4),(13,'CREATE_CAR_CONFIGURATION','','POST',0,4),(14,'UPDATE_CAR_CONFIGURATION','/[0-9]*','PUT',0,4),(15,'DELETE_CAR_CONFIGURATION','/[0-9]*','DELETE',0,4),(16,'READ_ONE_CAR','/[0-9]*','GET',0,5),(17,'READ_ALL_CARS','','GET',0,5),(18,'CREATE_CAR','','POST',0,5),(19,'UPDATE_CAR','/[0-9]*','PUT',0,5),(20,'DELETE_CAR','/[0-9]*','DELETE',0,5),(21,'READ_ONE_CLASSES','/[0-9]*','GET',0,6),(22,'READ_ALL_CLASSES','','GET',0,6),(23,'CREATE_CLASSES','','POST',0,6),(24,'UPDATE_CLASSES','/[0-9]*','PUT',0,6),(25,'DELETE_CLASSES','/[0-9]*','DELETE',0,6),(26,'READ_ONE_DRIVER','/[0-9]*','GET',0,7),(27,'READ_ALL_DRIVERS','','GET',0,7),(28,'CREATE_DRIVER','','POST',0,7),(29,'UPDATE_DRIVER','/[0-9]*','PUT',0,7),(30,'DELETE_DRIVER','/[0-9]*','DELETE',0,7),(31,'READ_ONE_ENGINE','/[0-9]*','GET',0,8),(32,'READ_ALL_ENGINES','','GET',0,8),(33,'CREATE_ENGINE','','POST',0,8),(34,'UPDATE_ENGINE','/[0-9]*','PUT',0,8),(35,'DELETE_ENGINE','/[0-9]*','DELETE',0,8),(36,'READ_ONE_GEAR','/[0-9]*','GET',0,9),(37,'READ_ALL_GEARS','','GET',0,9),(38,'CREATE_GEAR','','POST',0,9),(39,'UPDATE_GEAR','/[0-9]*','PUT',0,9),(40,'DELETE_GEAR','/[0-9]*','DELETE',0,9),(41,'READ_ONE_INIT_SKID','/[0-9]*','GET',0,10),(42,'READ_ALL_INIT_SKIDS','','GET',0,10),(43,'CREATE_INIT_SKID','','POST',0,10),(44,'UPDATE_INIT_SKID','/[0-9]*','PUT',0,10),(45,'DELETE_INIT_SKID','/[0-9]*','DELETE',0,10),(46,'READ_ONE_LEVEL','/[0-9]*','GET',0,11),(47,'READ_ALL_LEVELS','','GET',0,11),(48,'CREATE_LEVEL','','POST',0,11),(49,'UPDATE_LEVEL','/[0-9]*','PUT',0,11),(50,'DELETE_LEVEL','/[0-9]*','DELETE',0,11),(51,'READ_ONE_MAKER','/[0-9]*','GET',0,12),(52,'READ_ALL_MAKERS','','GET',0,12),(53,'CREATE_MAKER','','POST',0,12),(54,'UPDATE_MAKER','/[0-9]*','PUT',0,12),(55,'DELETE_MAKER','/[0-9]*','DELETE',0,12),(56,'READ_ONE_STREET_TYPE','/[0-9]*','GET',0,13),(57,'READ_ALL_STREET_TYPES','','GET',0,13),(58,'CREATE_STREET_TYPE','','POST',0,13),(59,'UPDATE_STREET_TYPE','/[0-9]*','PUT',0,13),(60,'DELETE_STREET_TYPE','/[0-9]*','DELETE',0,13),(61,'READ_ONE_SUSPENSION','/[0-9]*','GET',0,14),(62,'READ_ALL_SUSPENSIONS','','GET',0,14),(63,'CREATE_SUSPENSION','','POST',0,14),(64,'UPDATE_SUSPENSION','/[0-9]*','PUT',0,14),(65,'DELETE_SUSPENSION','/[0-9]*','DELETE',0,14),(66,'READ_ONE_TIRE','/[0-9]*','GET',0,15),(67,'READ_ALL_TIRES','','GET',0,15),(68,'CREATE_TIRE','','POST',0,15),(69,'UPDATE_TIRE','/[0-9]*','PUT',0,15),(70,'DELETE_TIRE','/[0-9]*','DELETE',0,15),(71,'READ_ONE_TURBO','/[0-9]*','GET',0,16),(72,'READ_ALL_TURBOS','','GET',0,16),(73,'CREATE_TURBO','','POST',0,16),(74,'UPDATE_TURBO','/[0-9]*','PUT',0,16),(75,'DELETE_TURBO','/[0-9]*','DELETE',0,16),(76,'READ_ONE_TURBO_TYPE','/[0-9]*','GET',0,17),(77,'READ_ALL_TURBO_TYPES','','GET',0,17),(78,'CREATE_TURBO_TYPE','','POST',0,17),(79,'UPDATE_TURBO_TYPE','/[0-9]*','PUT',0,17),(80,'DELETE_TURBO_TYPE','/[0-9]*','DELETE',0,17),(81,'VIEW_API_DOCUMENTATION','/*','GET',1,18),(82,'UPDATE_ONE_RACER','/update-profile','POST',0,2),(83,'VALIDATED_EMAIL_ONE_RACER','/profile-verified','POST',0,2),(84,'RESET_PASSWORD_EMAIL','/reset-password','POST',1,2),(85,'UPDATE_PASSWORD','/update-password','POST',0,2),(86,'VERIFY_RECAPTCHA_TOKEN','/verify-recaptcha-token','POST',1,2),(87,'PROFILE_UPDATE_PASSWORD','/profile-password-update','POST',0,2),(88,'SEND_EMAIL_CONTACT','/contact-email','POST',1,1),(89,'SAVE_RACER_CAR_CONFIGURATION','/save-car-configuration','POST',0,19);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_roles` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_roles`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ADMINISTRATOR'),(1,'RACER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `street_types`
--

DROP TABLE IF EXISTS `street_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `street_types` (
  `id_street_types` int NOT NULL AUTO_INCREMENT,
  `street_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_street_types`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street_types`
--

LOCK TABLES `street_types` WRITE;
/*!40000 ALTER TABLE `street_types` DISABLE KEYS */;
INSERT INTO `street_types` VALUES (1,'Normal'),(2,'Agarre'),(3,'Derrape'),(4,'Derrape Pro'),(5,'Asfalto'),(6,'Campo A Travez');
/*!40000 ALTER TABLE `street_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspensions`
--

DROP TABLE IF EXISTS `suspensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspensions` (
  `id_suspensions` int NOT NULL AUTO_INCREMENT,
  `street_type_id` int NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id_suspensions`),
  KEY `fk_suspensions_levels1_idx` (`level_id`),
  KEY `fk_suspensions_street_types1_idx` (`street_type_id`),
  CONSTRAINT `fk_suspensions_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id_levels`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_suspensions_street_types1` FOREIGN KEY (`street_type_id`) REFERENCES `street_types` (`id_street_types`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspensions`
--

LOCK TABLES `suspensions` WRITE;
/*!40000 ALTER TABLE `suspensions` DISABLE KEYS */;
INSERT INTO `suspensions` VALUES (1,1,1),(2,1,2),(3,5,2),(4,6,2),(5,1,3),(6,5,3),(7,6,3),(8,1,4),(9,5,4),(10,6,4),(11,1,5),(12,5,5),(13,6,5);
/*!40000 ALTER TABLE `suspensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tires`
--

DROP TABLE IF EXISTS `tires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tires` (
  `id_tires` int NOT NULL AUTO_INCREMENT,
  `street_type_id` int NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id_tires`),
  KEY `fk_tires_street_types1_idx` (`street_type_id`),
  KEY `fk_tires_levels1_idx` (`level_id`),
  CONSTRAINT `fk_tires_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_tires_street_types1` FOREIGN KEY (`street_type_id`) REFERENCES `street_types` (`id_street_types`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tires`
--

LOCK TABLES `tires` WRITE;
/*!40000 ALTER TABLE `tires` DISABLE KEYS */;
INSERT INTO `tires` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,5,2),(6,6,2),(7,1,3),(8,2,3),(9,3,3),(10,5,3),(11,6,3),(12,1,4),(13,2,4),(14,3,4),(15,5,4),(16,6,4),(17,1,5),(18,2,5),(19,3,5),(20,4,5),(21,5,5),(22,6,5);
/*!40000 ALTER TABLE `tires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turbo_types`
--

DROP TABLE IF EXISTS `turbo_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turbo_types` (
  `id_turbo_types` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_turbo_types`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turbo_types`
--

LOCK TABLES `turbo_types` WRITE;
/*!40000 ALTER TABLE `turbo_types` DISABLE KEYS */;
INSERT INTO `turbo_types` VALUES (1,'Aspiración Natural'),(2,'Sobrealimentador Centrífugo'),(3,'Sobrealimentador De Tornillo'),(4,'TurboCompresor'),(5,'DobleTurboCompresor'),(6,'Sobrealimentador Roots');
/*!40000 ALTER TABLE `turbo_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turbos`
--

DROP TABLE IF EXISTS `turbos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turbos` (
  `id_turbos` int NOT NULL AUTO_INCREMENT,
  `turbo_type_id` int NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id_turbos`),
  KEY `fk_turbos_types1_idx` (`turbo_type_id`),
  KEY `fk_turbos_levels1_idx` (`level_id`),
  CONSTRAINT `fk_turbos_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_turbos_types1` FOREIGN KEY (`turbo_type_id`) REFERENCES `turbo_types` (`id_turbo_types`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turbos`
--

LOCK TABLES `turbos` WRITE;
/*!40000 ALTER TABLE `turbos` DISABLE KEYS */;
INSERT INTO `turbos` VALUES (1,1,1),(2,4,2),(3,5,2),(4,6,2),(5,2,3),(6,4,3),(7,5,3),(8,6,3),(9,2,4),(10,3,4),(11,4,4),(12,5,4),(13,6,4),(14,2,5),(15,3,5),(16,4,5),(17,5,5),(18,6,5);
/*!40000 ALTER TABLE `turbos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_car_configurations`
--

DROP TABLE IF EXISTS `user_car_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_car_configurations` (
  `id_user_car_configurations` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `car_configuration_id` int NOT NULL,
  PRIMARY KEY (`id_user_car_configurations`),
  KEY `fk_user_cars_configurations_cars_configuracions1_idx` (`car_configuration_id`),
  KEY `fk_user_cars_configurations_users1` (`user_id`),
  CONSTRAINT `fk_user_cars_configurations_cars_configuracions1` FOREIGN KEY (`car_configuration_id`) REFERENCES `cars_configurations` (`id_cars_configurations`),
  CONSTRAINT `fk_user_cars_configurations_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_car_configurations`
--

LOCK TABLES `user_car_configurations` WRITE;
/*!40000 ALTER TABLE `user_car_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_car_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorites`
--

DROP TABLE IF EXISTS `user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorites` (
  `id_users_favorites` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_car_config_id` int NOT NULL,
  PRIMARY KEY (`id_users_favorites`),
  KEY `fk_user_favorites_user_id_idx` (`user_id`),
  KEY `fk_user_favorites_user_car_config_id_idx` (`user_car_config_id`),
  CONSTRAINT `fk_user_favorites_user_car_config_id` FOREIGN KEY (`user_car_config_id`) REFERENCES `user_car_configurations` (`id_user_car_configurations`),
  CONSTRAINT `fk_user_favorites_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `account_non_expired` tinyint NOT NULL DEFAULT '1',
  `account_non_locked` tinyint NOT NULL DEFAULT '1',
  `credentials_non_expired` tinyint NOT NULL DEFAULT '1',
  `enabled` tinyint NOT NULL DEFAULT '1',
  `color_profile` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000000',
  `is_email_valid` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_role_id_idx` (`role_id`),
  CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nfs_catalogo_project'
--

--
-- Dumping routines for database 'nfs_catalogo_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23 11:57:02
