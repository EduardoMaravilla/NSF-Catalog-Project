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
  `induccion_level` int NOT NULL,
  `ecu_level` int NOT NULL,
  `inyection_level` int NOT NULL,
  `escape_level` int NOT NULL,
  `turbo_id` int NOT NULL,
  `nitro_level` int NOT NULL,
  `suspencion_id` int NOT NULL,
  `brakes_level` int NOT NULL,
  `tires_id` int NOT NULL,
  `embrague_level` int NOT NULL,
  `gears_id` int NOT NULL,
  `diferentials_level` int NOT NULL,
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
  KEY `fk_cars_configurations_levels1_idx` (`induccion_level`),
  KEY `fk_cars_configurations_turbos1_idx` (`turbo_id`),
  KEY `fk_cars_configurations_suspensions1_idx` (`suspencion_id`),
  KEY `fk_cars_configurations_tires1_idx` (`tires_id`),
  KEY `fk_cars_configurations_gears1_idx` (`gears_id`),
  KEY `fk_cars_configurations_drivers1_idx` (`driver_id`),
  KEY `fk_cars_configurations_ecu1_idx` (`ecu_level`),
  KEY `fk_cars_configurations_inyection1_idx` (`inyection_level`),
  KEY `fk_cars_configurations_escape1_idx` (`escape_level`),
  KEY `fk_cars_configurations_nitro1_idx` (`nitro_level`),
  KEY `fk_cars_configurations_brakes1_idx` (`brakes_level`),
  KEY `fk_cars_configurations_embrague1_idx` (`embrague_level`),
  KEY `fk_cars_configurations_diferencial1_idx` (`diferentials_level`),
  KEY `fk_cars_configurations_auxiliar_1_idx` (`auxiliar_one`),
  KEY `fk_cars_configurations_auxiliar_2_idx` (`auxiliar_two`),
  KEY `fk_cars_configurations_classes_id_idx` (`classes_id`),
  CONSTRAINT `fk_cars_configurations_auxiliar_one` FOREIGN KEY (`auxiliar_one`) REFERENCES `auxiliaries` (`id_auxiliaries`),
  CONSTRAINT `fk_cars_configurations_auxiliar_two` FOREIGN KEY (`auxiliar_two`) REFERENCES `auxiliaries` (`id_auxiliaries`),
  CONSTRAINT `fk_cars_configurations_brakes1` FOREIGN KEY (`brakes_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_cars1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id_cars`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cars_configurations_classes_id` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id_classes`),
  CONSTRAINT `fk_cars_configurations_diferencial1` FOREIGN KEY (`diferentials_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_drivers1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id_drivers`),
  CONSTRAINT `fk_cars_configurations_ecu1` FOREIGN KEY (`ecu_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_embrague1` FOREIGN KEY (`embrague_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_engines1` FOREIGN KEY (`engine_id`) REFERENCES `engines` (`id_engines`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cars_configurations_escape1` FOREIGN KEY (`escape_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_gears1` FOREIGN KEY (`gears_id`) REFERENCES `gears` (`id_gears`),
  CONSTRAINT `fk_cars_configurations_induction1` FOREIGN KEY (`induccion_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_inyection1` FOREIGN KEY (`inyection_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_nitro1` FOREIGN KEY (`nitro_level`) REFERENCES `levels` (`id_levels`),
  CONSTRAINT `fk_cars_configurations_suspensions1` FOREIGN KEY (`suspencion_id`) REFERENCES `suspensions` (`id_suspensions`),
  CONSTRAINT `fk_cars_configurations_tires1` FOREIGN KEY (`tires_id`) REFERENCES `tires` (`id_tires`),
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
  `dawn_force` int NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `granted_permissions`
--

LOCK TABLES `granted_permissions` WRITE;
/*!40000 ALTER TABLE `granted_permissions` DISABLE KEYS */;
INSERT INTO `granted_permissions` VALUES (1,1,3),(2,1,6),(3,1,7),(4,1,16),(5,1,17),(6,1,21),(7,1,22),(8,1,36),(9,1,37),(10,1,41),(11,1,42),(12,1,46),(13,1,47),(14,1,51),(15,1,52),(16,1,56),(17,1,57),(18,1,61),(19,1,62),(20,1,66),(21,1,67),(22,1,71),(23,1,72),(24,1,76),(25,1,77),(26,2,3),(27,2,6),(28,2,7),(29,2,8),(30,2,9),(31,2,10),(32,2,11),(33,2,12),(34,2,13),(35,2,14),(36,2,15),(37,2,16),(38,2,17),(39,2,18),(40,2,19),(41,2,20),(42,2,21),(43,2,22),(44,2,23),(45,2,24),(46,2,25),(47,2,26),(48,2,27),(49,2,28),(50,2,29),(51,2,30),(52,2,31),(53,2,32),(54,2,33),(55,2,34),(56,2,35),(57,2,36),(58,2,37),(59,2,38),(60,2,39),(61,2,40),(62,2,41),(63,2,42),(64,2,43),(65,2,44),(66,2,45),(67,2,46),(68,2,47),(69,2,48),(70,2,49),(71,2,50),(72,2,51),(73,2,52),(74,2,53),(75,2,54),(76,2,55),(77,2,56),(78,2,57),(79,2,58),(80,2,59),(81,2,60),(82,2,61),(83,2,62),(84,2,63),(85,2,64),(86,2,65),(87,2,66),(88,2,67),(89,2,68),(90,2,69),(91,2,70),(92,2,71),(93,2,72),(94,2,73),(95,2,74),(96,2,75),(97,2,76),(98,2,77),(99,2,78),(100,2,79),(101,2,80),(102,1,31),(103,1,32),(104,1,82),(105,2,82);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
INSERT INTO `jwt_tokens` VALUES (1,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4MTAwMzMsImV4cCI6MTczMDQwMjAzMywicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJST0xFX1JBQ0VSIn1dLCJ1c2VybmFtZSI6IkVEVUFSRE9NQVJBVklMTCJ9.VqJUSQMtHcZVSEJpDFkRukgIfbMfZtbdxiZ5cIlIJYU8FnMwM6zpe_s5XMZSuC57p6eaHAD13l9IKQITB5S_ZCPZQ5HX8JJaI3L3a3W858IN5_EXi6nt88_zLIZgpHs1s-LomQof4iYbEAvHm0aWoN1ewYoBBzdoJj4wOYo2fIEsxWXYxMzkyWITNXncTsYR3mvj50jhOTXb8B4k7JRHIK7joz5xOeEiuXaQBN0NpkZJVoV2NqTTbbG_ZK57yYB_W1opJVkvIeFxZcXzg-qOsR7SoxRoje7aAIo_9jIgcRTQ6gZhKIRESFFhuVRZwDgMCLd8ZHfC3_XsPWGwi7xLpg','2024-10-01 19:42:39',0),(2,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4MTE5MzgsImV4cCI6MTczMDQwMzkzOCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.Ci1kTU8bYspkNajDoU_imq_xZSWOFEbJxxnC7me3LUekSFpu7iu0YudlnTQ0NAuG9OMpns6OltPXSmtYhaJtVnlp0FOYe_O4bSvdNYXEG_TjlPyUwrNsY0fvRWb3YHkuwPRM_HUz0mWRVQMm78TtQroEq2-X8PwFBWXcNu5Y5fCstKR-Xc6fzuyH94-nE7xmzz8f2eXbjwL6-qSL9nwBMcywky-G4n3fbcZ9Q4hdjW3j_bMRwu9XzMS5Jj8rJ4VQLwejayGT-j4DeBVHbsJaZ4vgSeU5JD5e5osIP4oNBsvGuVzkcGRGqOn2T2cOfn_oqS4j5YhMaqxi5iyd1TEawA','2024-10-01 19:47:08',0),(3,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4MjkxNzIsImV4cCI6MTczMDQyMTE3Miwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.S5sWaWIZ6boxk3HoHc5-9JBGYzH3EjbJJHV2B6dFqb2iyR8CGHEHymnt3TpdoQBB1SHoh98NStysaPZ0gIPMpxSWSqwUbapgJUYuTnYF1oBHDrulEOip4k1MxFvXo4GvlQqMgyPW0x1hzwqfZDD1-GQTFVwxZEJjN2IgQ1AyRo3ajxANCGTVnZorWa00jDbS6S5wtYEZr5mO1rZhXENjTIseJy7unWHn8Hv90XDlTM696in6N-xiStBc15Jy6ujLknylytQwuEzA7q50wtWAz7K0L_EJK2l6lr5Z8u3_vKUS9GZ88hAjaP3BrDqeF-TryHdDPsd-U6sUNTssgJLy9A','2024-10-02 01:24:59',0),(4,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4MzIzMTUsImV4cCI6MTczMDQyNDMxNSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.fMx1wLVWUelnh71W0FTFgKT4hStAhHWi0Fr1WhYPKyMq0jRI1I6SoVAitL53Ks1_5dmIZDpIALGDSCmnyl4WUHAuBaiqBgyCi8BKAig5Qc1BGhubenE_LiNlJVUqFPpXC6rT216eTiqjq62CbgwLSfN24P3BEtqi0TFXlL5J-VuWMz66tHF7IOY1yEanVIwzI6FUCmsuUZ49lA5fyZnBTXQGuvdu15W92lVZJh-aYSOA5qMKx_qw9CLtxPAmBtvb1-rmkfAGM1J0_49ndrgENRvlc4NQf67-AT37MApgAcc3I30Xstl2xHCbZNDvIuUDISZsE0esjB9NaEBRFx9rmg','2024-10-02 01:52:00',0),(5,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4MzM5MzIsImV4cCI6MTczMDQyNTkzMiwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.Xnj-xcv1q1z_wmYThvNff0TVGTd4dsbQdyg0nbeLpTexBYQTkA5lQtBmHJdcA1ZIde23pLXV7AbsjevuaxZhIj8JuUpWBnD_Pc3kOEuC5SsGjXEBpeY0qnfcJRSuLAy4A_ThPGEKvTdaj0t_0mEjbrt-OS588cpPSyaQYxGTlE4WmYK_SWb37EQt78AS4kcWWVjGkLfWj3WhjZ2wFG9s8nhhJ3iuThr9NYZWPfXaC9HfN_gqr87kbrJcvA3IEBjejimGtv73m3gRx1rAogeH9WivtRDFTBIEpNQFk4A8fWXDQQ0-2Bjd_MTU_jcDjQG3HfR0vxlFp6GvY6gMgi6JRA','2024-10-02 01:52:38',0),(6,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4Njc5NjAsImV4cCI6MTczMDQ1OTk2MCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.bTDjaZ7VLK4Jkqk2iuaPB60S4ztQz3ANmHLfiToAt1K4C122MWoG_47WDF7Lqe7h9Y7K9at9yqfOK-svxvC6Ppc_pGu8YbOSJGWJTwUlFAFEoZ4el0Z8O2XJ3OlL2D_BBw9w3gE9SpdvG-I0O8Xx-63JRoqxziwlPXC5QwET8GJ8W2kgGr_BIQVQIy0RJc6IRrWHQU-fCmfHrwz0i6vN8OygzEus5oRheXu0sZ3d6HUEJc40usbBGfZubpdJ5Fg6QTa8JSPqqxLyFX4ifcMFGfPwsUkVFbkQVa4aGwg-HBpGoFHXO3CYovFBReAVBPjPmo-Wd3AKVN4H7VZmEYGR0A','2024-10-02 15:28:09',0),(7,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4ODM1NDgsImV4cCI6MTczMDQ3NTU0OCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.MOF34tbF2xOtaNs0qrnQWMc1JmHvmasIE9aSfGYLfAD9kK1EGdoHqguAqKgHz71uzxn8AJ7ZJW2Z5VDBLtlahInUANKSFM7tT-hq-yTPdSoZpCQjMGFdoHCm0udz0rja4IY1rIxFMAYvxxm3jx-_8QSgBoNGB5oGbEK4hjXo5gBxkXfeky5q1e0efGO6rVn3Z5I-m278L-nvCio_RQpguvOoZDyQvDSmK9jD9eOb_4yp7xo44rm-az79EdzwZBBmauoA2PwP1dbCzIRGRo-Xv76fC1uA6LhAt7IHJzWsasCLjqC5Z50kiklw976_ETJO6lX84epGeynqfpdeltuDBw','2024-10-02 16:46:49',0),(8,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4ODc5NDEsImV4cCI6MTczMDQ3OTk0MSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.b-ZNFjUcf9cD07ZjHy2Nhn8ieCNNzgmifKnxoW1P8Hc16zWZhZZFse9yXCxibjI_6jCvm330k864n2bX1XJ0fQmRdk00DPA01izGrJdYRnL2-cvmZmVrplCOKbQnoum0FhDpiB1L--KEHqEDDHb3nFGWU0UZ3kx7-ucv_QcBLYcVHId4bBfdX5n132xfR6S31vSpi_cYw-Qb_VKr5UM7D53l4BkiHDW7AvQy5uU4rmlgm5RABWpHP4HiQtida5E4oN8vBRuCWf7mh3htx4ftDh5eiaERT_iv65cv2KK1Xif__6ISzAKIKT7s4gYXobhP6zWkbsX3fZUvBJBwKdqoyg','2024-10-02 17:09:47',0),(9,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc4OTczMzAsImV4cCI6MTczMDQ4OTMzMCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.sOfsK23OqgNAdpYsua2dM8j-trBpJMKJYGCZ-TnJFWo635oXRymvBBLqXL2dpQwUMSfoyezKZ3h9pJ6MVdUUGCm9T30fOlMyDXGHjZpd6gOBNcOHGKfAX4z4DuCrIyFgMFwQsbmIY6YWmq5Alari7iu6ol7F9CQ9BCXPcJ0CbfqjHploiHgM_2cx-AFnMRGru-1js52ZjVM3Oln-DYC1nVWUMw24MCxzR4mt03ROPyDCFnw5zwNDNyBHwS5n9Snd2QzZClMG4Gpd0rBTgo443gCVgy2iqaGb577vne-ekcQRD_004-fBpQP5r3pvYHmGpcHCk2xNydZHrxtPZCCzNA','2024-10-02 19:40:41',0),(10,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc5MDk1ODUsImV4cCI6MTczMDUwMTU4NSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.msr4pqW5DEssw_ZSytVpmJZJDSOg54av5wRU3h6Zof6bk04aTD0RGOfDF5EO5qDKY0kGKovoISlM11YPjGRvqiS11hEZvQU3M-u485v7TImQNiQy-a0MuzMnMo2hbdoLsXOyOHXQxG5wOYTBFjx8dBvzDZLz1jCpNE43oSlSOF5WwjQHzG7chmMzpsGeYIgJoP_qzlIOfE5v8bSiPyJ_SpCeOstXNw_SbnCeD6YYAJaPO5JwOQv3O8Rt4G5xuznmdEKCDAspYF2hiAnRvLV4mGrXuql4HEWTBLgQM_hbTp2BRqSsZ5iZxpbi01kjIB6UZfT03CyHbagXgiyuUVPzOg','2024-10-02 23:33:08',0),(11,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc5MTMxNDgsImV4cCI6MTczMDUwNTE0OCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.EfBvw3DbfsRO0EWAZG1IhMOn13-4SFJWhPyoHUHONRSFprJZu_joCL8O-soo2VAOe_AycIuBhPfOuj0E_0meBmdANXiv10l_jdMyvOnm3X-wvXvvtrkV2JyHEh5lvepzUIWpHJo0TlYaEXxx568DSsXMnhMnb1KK1q-Hafj_fvuKnXXsLqiAKBYUIiGrWpRYyD1dXuB0rYN_KuMpU3NZQ2NH72g-Gxv0Ixx29sHqX7DGEGBGdFdj2PsK6AErVsheacV0NFlJ9DprRlj0AOSIvE69cg42MuqtY0qhk9Bz0xhBppCB_e-DDzStj-19zNDzBz1E8gsqEZC5zYpX9fRzPg','2024-10-01 17:52:28',0),(12,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc5MTMzMTgsImV4cCI6MTczMDUwNTMxOCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.mRAPPYO22nkyQ_xRXgM6VcExjY0dnZHhjm17g_qeWhQnSYzrJ2DTZ0TyY2Z9kjRjjYZGua-hyj1Vcx0RJ9-ZCME47IZq4mKq6nObVBQZGR-9DW2CMKzS8qYAupct7gHqAqhZRxZkQyhN6c5uHDG_dP4I0mU70sE117Da75DJdYeIaLqiyfkifESoNjyNGGASRVprKt54FJgiFzz7lkRZCrBEHRp3z3xXXyE8iOZGWUklStVWJ8t7s4nlmzhFMnQlj_bZrUf4fTakQ0O5OWoYmZ6mQa0aTNe1UURapHsTDhppK0YPId3-jqnvChnA7nr6JcTB4yVcdjoVJrAkun9w5g','2024-10-02 23:59:54',0),(13,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3Mjc5MTMzNjMsImV4cCI6MTczMDUwNTM2Mywicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.c2KAwYg1Km4nCbkWATcdgtJlDgZoKICcQOOmaMgTiQwMM2harnz_c2hwVO-vhcOB0V5vTJH6T0PK65sCw3DzxXRoXsO53qCvfnR24ZnMYRN3x4TZuyVlI95E92F2PrRAvatTXuhO-OxrwmE1bKFpUorTAUdlUaV6J789YRuv6o112fVvr8Tmfu8d6iKiEJOb-QYG4VrtUyhVEvvykwTrJjlYmeLTNwO7s7Kf8LLqJvmLye1AQPAj8x_oQoDMMxJ5137G7yXfUnu5lk87j6LyJDPzeYxzwLEAi4bLpUgMWp4C4J7e-_YncrhoJg8YuSZjvEua_pyko_mZ5OWa1u_-0Q','2024-10-02 23:59:38',0),(14,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNDQxNDMsImV4cCI6MTczMDYzNjE0Mywicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.ryTv9VQ7LUNhAU1libHbJO9nOlZ4kv2_JSPUmc2ukrbXdS22eB6gsYIbxVQAX63irUVAHK5hUlwI0ZlETPcRkQpLBKQWXiwljEs3fsfkmQAg8d8XNCFVJn0R2xjIwDtEW9hdusjRspl8r2ep1hG3D6t8F_cvW9jKeFyhRCRjRiSvNh5PM2xMV6XQn2zX3tUpjzn5svrXhlQjblpNsOLipO7o-L0ChTezdDRn7Ylzs0HQyjCs7D3mJD8Q1clx1GyEMmLsekBsZOpf1od9P_FtHkk7BJrv1haf5KrRg35GsgdhlKo3qn0DLv1QSgAnD-NdOAp2mbP8VAulXcPh3b0QVA','2024-10-03 06:15:43',0),(15,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNDUwNDcsImV4cCI6MTczMDYzNzA0Nywicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.W4mWFX-B7Ds1Q-j4LLfuCYHcLQ2qf7HeA80KArTkOAGiymcs9zHJpdqwgmy--_01JzOb7T7KHNHT8182r5Zz84SHl3Zir9p0s0mJWrdzZ46Y0iYP6VDgtDGULgKLfZbyObJ3OzFDcQizZ_eYp_X5tdkG5AYPGjm3s4PncCdyCSrRVDufaqnFKE_DsFeAFCTvKlpuU9Cd7ujwotbSEiRTEkYDeByLC2sWan4VAowRFMLXzAIbgepUgi3u5IaH-3ufPmC8tK1A3EhcdHsGqgMWy6IVDjYPuSS94OPyTOlz98ek9e8jTdqZW85-P0v5eD-Y4A9EVBtyeSF5KYiJ37tIFQ','2024-11-03 06:30:47',0),(16,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNDU5MTUsImV4cCI6MTczMDYzNzkxNSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.P6BGyNQR7D2gpHWoovZdg1LgCOczQYNZYwQdaeNa9qR0soWZGvzKWPNhJ9w6AonQn871yn4JGEDkF8QBjED2cKp89lAtybtM8_yXtOIkVRgpTsiEDk9L3KM8dIoXd1eBYdj5QMOgECiPPBzs1F-HQq3PITTbp1SCIzeuamx8g7oe-LT2ha-O6dyIAAVM9nMSVQpLC2Rt_UIDx_o0uGbCh6NG-jMe29eKrEwH--sV9GOKSiU3Wyt4ikprDk3eB9k4RxmS5kCs8xkifFxdXJnz4_zu6yAFUN6K-xtCZv9I87gDIJXAQKx0jaHs0dge5gVpAuqknwWBxw9Ju2DSEsnIIQ','2024-11-03 06:45:15',0),(17,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNzE1NTUsImV4cCI6MTczMDY2MzU1NSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.jVcSqZ9gmXxIO1ITFNs6yAQRveAuyQPB20Sa7XLG6pxCJPw9MGWQ6UkXV-MboUEW95NPs9syaSseodFdF85GqqFAYlko_8heGmiy7v9uTYmQhfokWjBlx6bGqUDrILv-_xKXnuPECkdiSCxzwMwjbsswS5MYohsZValqnQibhLKBiYNojkxLe2AJ36TugU3OLG8TyJpeB6BAN11ig6xUwpv207H6GNnZ5yac2Snmm70GVYkq3o8_FlqN31qRggos_bBc2ht-5zOWLy9tHjd5Qe236CDt7p23naASiVx5UHKDu1S45KVjufcZg8UYZ58aH7T5tfL7VNSGaO-uIhadRA','2024-11-03 13:52:35',0),(18,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNzE3MTMsImV4cCI6MTczMDY2MzcxMywicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.IZXP1pYunqSovW4yTOa2W0jiUzlXoPfkuorAfyxByeKCbx3q9rg561ghs3xDmbnUK9yZfgU6FufEUtTjFx61QSZKRQ7UHhNKYXF1rjPTDrRTFPGCwGuyv0b7N_IFCiAsN4n5nnoVdO7uRkNnve1lqnKyEny1uNM8NvrZqD89rKEGTsXO0u8iddiSMyLhnrhQOPU79M4MAWY2Ypc9y7TmmYrOeIIlwYafnsvj8PzUrfGsOiOQr42dbciuTQTpVNKUqy3F0IAQe34fNX-ct98z02eoPn9i6ev6WFT7KVM8pKl8wXcbegCY6OGdpaK2xj2zJEMtY6LXozKshXmkgqbwKg','2024-11-03 13:55:13',0),(19,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNzE3ODUsImV4cCI6MTczMDY2Mzc4NSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.Aqu90ZFtJEu0tOcgUn0uY5kbNs0vj_CoNlLYOXdz94hxxdeMlf50cUVq9jSBTQzAvS5J8Id5OphnDY1wMHFOVo3d76OOoiZJKPoQ9aHP3C-6cqoUu3kGV-XJCaCU4WqxsPYAe7JPB5ljW08WLXzsWFl2WT8c7IyBkba6H63Qlq4qDrePShEeXV4g7UFA31PBztm9lMsbRsgOx5m9NDYKLc3eBWj3iM3T-3dmUAurELwKb464zgb_X866NNCHWnD1pBIUWSwYluuWZ0dNeqm7FjLI_YA9lo6Re-WUEfqDuEOAg9z5Oc8MCuo1qzN61q9qoiyIb_nthwNmF3QV2473Fg','2024-10-04 20:01:01',0),(20,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNzIxNTQsImV4cCI6MTczMDY2NDE1NCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.E48YdtlSjOWKj_sk3i7NJ5oUrp0Job0NOEXn71eP1qC3V-no9lUppsmSUpg42U1Tu7Uc21Vlrbwdv_85l_yvFxv4T6jpa201-A8pQMiOIvVkzYCVd9tL7HucbwpXmplKiWCR2ztj3MuZiVhrnlCIWnHnjh6FXYG2sO4CbGW7zddokxRFzt4hbPrO7_pdb7JUgH2ddDve9XYarUQmrU3yc3wwYea9HONAHUy1-FL_Bp5wcAc1TU6oaj3ITe2bl_KKDlra0KwIoQ7aDgJ4lh91R6Y9llLg9tS3Gknki9kxjLJU8IipYn1xNwpd8XQPSOmrvdXOSvR8IRkMYdhQweBT-g','2024-10-04 20:02:44',0),(21,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwNzIxODEsImV4cCI6MTczMDY2NDE4MSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.u94n-dLmu5mAuItlHwbbLAmDywsXcCv_tQ24-7wsGKL_VIuMNnpv3o2ptFW6nwLFiF0Lc2Aa9POdKzUP9UOK-rDIi7_dl4AkBobB8FCQcd1ZAJkvJQBkTMF642vFzraoXGMfHkTbwWXrjO8tpFYy0Y5HyTxTLE649rTgceo1pDdwy8sU1gt99p_QHmQOHc-sPhGQ044h4ayLbeR8H1oALbBmYfNwBCA-y4mK_v5TVS3wCPrr8D89C74ibdRe3WaVudpOzNNKtnIJbeONWD5TZsnKs31BXKQyt_Kq9dow81-Zgh101y6gq4tpHKgYUDaJsrkSghZ7r6rHsNKy-c2AjA','2024-10-04 20:16:18',0),(22,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwODc3NTYsImV4cCI6MTczMDY3OTc1Niwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.Sko5-rg82zqVVwYv6A4YE2ow6d16-rSreklHu3O1THwKxPEoyAY5foevNTWcdg1WzjiflAq5U_h_r_hFPpXq6GwK4gUjjAnPnEEmOM_5IH02y_hJzED5EiC3VC2sKY8T132IedCNHKj_LvInvVmT1LiIr3AqlNXvbpWxctjH158UU5jPgyrXesRJVUkP1w9KxnddUFrbi8dq7_UuZhaideZzqobhkcLGnmsgiGFl9BDbecS8rBA9dlVS8-XZJ3Kg92rrpCATHblZemPxqxoUpRNVqTxiWFQECzPRJKxUzpUhHDBuT0x5th2h3T6KI5VFZPq9vlY-jNMpAKC5893ljw','2024-10-05 00:24:36',0),(23,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwODc5MDgsImV4cCI6MTczMDY3OTkwOCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.BrGexYmpDxOdJ6IHAerawDg2RN4BTRiBylD8oUEc8Bj7Cj9llXqOtOP9ApflW-5GPFgEliR8T4zHcrpKBHB1XrltQj1qIxsBAIRxtx8JYWslJb6Jmh3Jt7IxLV9Tv2jDmNuHLZ6jqZ68Va3NQaZNjarwpiCbBFIWM4VADTC3MIdiD1xaxq2cKfrzphuNFmOe-r_Ri_OhTJWr7MF2VU6mGVg2-FH9ssZFkiIjmvlIlDqy1whPhissV1v4dKmcX-9NP8cTJ9JQ_EuLtUZvCxXzUlwssTwErNzHb0khBS2Lo53QQxDPYbAT4H8nwyTviv9ISjgfAse9CxXYdtNrS3jWVQ','2024-10-05 00:25:24',0),(24,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgwODc5NTksImV4cCI6MTczMDY3OTk1OSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.tWxrxSxFrRaSeg89CzfGXoCASV6XX1Vm39UsGpxbkPGufeDmAVCTkpg6Uiv1PsE5-lw9EmiV_PRPtGYibNwQkTB6yRxVx93-z-2LOgLOVqCH9u0H-HftPbycb6pFsnKu5MsHj5whIn7jCR0c2QUg6-uNO9UlvU6I12AkFzQPrdRFXPQOJVnVkfZ-JJRZbPSZ21MYKTQq2J9eiDxL1NizlGGwi1EJUH2sLlNbEDn9RBhIRECLLMgjUJR1rFaRLmgqBqyMP09m4yQJ3YpngD76MuRvAuis5513-1c1y9roUECmlvAYvAm3oL3zqoMJyytwgo2yaE7Lf6gedJoiNVKL0g','2024-10-05 01:06:40',0),(25,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgxMzkxMzIsImV4cCI6MTczMDczMTEzMiwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.RJf1c6j1Dao8nK5pD59BOrdkc0pC9GUcaNnEIsDaBOoL2HdvrNoVj_qX4BpSqPjVr1_LcB0n3cMRJZR6ddNGO9H0d59Bk4maAfnyLw96ixRYOfqM2-iBjC_K7VjRJ56L9Qm_E8XraiJP3NJa9vDKiQQIpTaXkySi9e_F0kDTRzf6NV7lYpXc7zSWlrPlpp6wIkI6ey4q5UAiseu4JWx9zcxNW24TvZlHQpGobGCk7ns8CyngIyCd4s5NB2RJXJbiLdGPB1Fue5_HqNtFxEb3XUiDnJOaIvyJRbXEggAiHbNb6s0hVMJlYZVRApqBddPA51FNCwXunfn4o3WPwyVhLg','2024-10-05 15:12:30',0),(26,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgxNDExNDksImV4cCI6MTczMDczMzE0OSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlVQREFURV9PTkVfUkFDRVIifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.iadb7o6lxsUNnNmAL8jxV7_5OZCMWDrKbrLVXIwy7GQTVscrw6CZSHnEfH6vZA0oPBPEF32z0BhLPMQZGjrxFBqa7qTCdGTLuCCTxTXrmKTeodQuz_eyTSGEEEbZJOoBmo5QPDpPteWpbdvQonhJOzDTXIbtOXp1Iqua_kpU2LNJFRwuBZ4S9IIqvJfArVXFEK0kcDRkEx-ohGZe5zfpsucEAsjXKvGKSyUe4W-jUWyxhRe9Y1wgTbALU47TGsVxSY6C5krvewQSGsOyZORkkzS7tDsZ9z5EuoIOlNzfmxjdmfmCCy7XUf24UrKC4vTQbsIFDtCZlq3bdTcihATrMw','2024-10-05 15:12:30',0),(27,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDExNDksImV4cCI6MTczMDczMzE0OSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.mECmv223J3mekVvWX3dZk0Var8ZFU90A36jrFHHPbA4jFtYTWAgWXQI5dDat1LWK9zr2Hr4Vew1cv8H-TaPLc70GYEQTBJvXN1XuY5K1Oqpmz6y8RbYp_B_ExrNVlNhuBcap64Lgu9_TvSplFHXjECK2gRrPdZw8wsfM8tNxU6tm_vyPLkc8qiPsuMNXX0DPfjBY3WcxsSaJ9SJsFq50HBy29xdfXCb3mdWYdkGsw-G3S41yuVX6SqEHMMSSCUDeG_V01YSSmHUuVt5sT7hHufUKIR9uhDMNSQN3ctfNWkCjRrLZW4YCmmMSKc-hftRu7SQbrX7Rt5AusyQp4FbZ2A','2024-10-05 15:35:59',0),(28,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDI1NTgsImV4cCI6MTczMDczNDU1OCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.NQsEmAoyeBAss-jItcUZLRcXSYN6Ms7NwXlguOizSzJzDrZlQ5I0OGDDJQNAxdFGRxCFWqrXtmd8-i3frYycpDqVujzimsotEPlZLIsG-5gaz6liSl4q-MLLjVoVthfK-F-NTCg3UPa_eLsSHia-00nFsCi6KulQMmxtEMjBz--WXjDjjNvoNzuJC7uEAbKtNDzcGCqKp1DIBpLJqiwqGT5cnVADhTGrp_2z3UjnGHHHYK0sY8xW9gPbhwVjU3cL34hoSsV6sqCs-NEk2oE6WEPCo8cpRrHrTfVH-JqVbCEF1BcTBk1BuloGJ933-Db6xVYXQQFhn6hv-0_jhT3J_w','2024-10-05 15:35:59',0),(29,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDM1ODMsImV4cCI6MTczMDczNTU4Mywicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.FVkF_9t3rBCcYa_hCH8UQDmN7imxhekR0z9EiMQAbQvTKzzAZoDm0_JuZ9MHW7jNBvvESHoM3U2LyPJPaB6qi99W3oagF8j76Ixzn3ynKpkMPafRvit5CbkTJhGXyTTucwJH-6heVDW5LYzne9JeTjCIMq3U14FBomOTTtZkkThTlDrhOp-SaJor2T_GECLI9wufLO3QzM40tFw8iY38dxCUweEGSw5JYXFop6rTBUBQH3ycTbFcPwtbQBNQaPWQxCyogv7yjvNt3Kuf0POrT834TLQ4mX2TqVghsiRKcRYcSeIlJMuVpe0oBXyUj3Ua3dPwEeIDq_OapyqX1iIXNg','2024-10-05 15:54:24',0),(30,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDM2NjQsImV4cCI6MTczMDczNTY2NCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.MKyuQ1o6_ORqA8zFYEmPjhZNtMo7oZo4RX9pV93pgYk8xjXkoZ7AF6Gnn8ikQttyQyf3KsFeIvBlTkl33z1XU3aQhzY-mRQ0cTaD4e5jakmGXxRgT4dxAp2zjBprdzlNp2bYk4EygBueD6xkzouqsixZMsaDCmbpKb8UhnrlnhF9VkdoZTkG_ihpB_8lKVHA6F7lH-oA94VVkwE6aZOtoHdpbZsmodwWBa1h1ZZzWsn1ulWdNOLEYP6i0sJ5GyfKlueE5MRQ3Ebhwz5omMbauy8eUxiKDquVCXD42AMqmOA9BZcTLTHB57awtJ_eMfv0EdYFnC28M8adKRF2N8I62w','2024-10-05 15:54:24',0),(31,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDQyNzksImV4cCI6MTczMDczNjI3OSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.tE-1z5AjZKu9fLNLsf_zv-d5tAEGQxDx9ONhqR5ju0BuM2gcnc40A5ikIG9JrhkQN4HDAYp0rTU0dpMBetr9UF9Je5883bJ4YHVxUoHYbxCy4-shsT3UiDQiI683z20KOkmQ8SzMSXBTjuC820YKq-NjbEaTtK5Q0hsZoemC1hpYHuMHtxtXCYgWxlgFaIiczdpa9mmw8NErZj43L5GMa10VPwLbuOCgkoWE7RnJ4CSqz3LakWHfVLHLLcT0uYOLIHLG0Gay7T3zjneXQHa36_dCnShSP8-bNWrKKDx9HQDjoQY7LW5GJ_mamh0ObAFfjnqBKZzg76IbJfKLfoBkZw','2024-10-05 16:04:59',0),(32,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDQyOTgsImV4cCI6MTczMDczNjI5OCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.Yls6o35oLGGAkB7H0r9GFuFUSdGlPee1RXwO6mtJYFY_zwG0HqGVpgwTSpYoqHV-ECtUFY2grGotQWKusvc7jhbyWoaiYlRqhzzMD41ajoMbBCn3UTCuizUvkbelkZpW036hp8S4j05G26tif5LhD8XRnK8rv4cIWp2SoKPoNkG8d7z5-6mQY2xbrX6UbCL3SfgTe4kddaZWOLXhfClyadNlJTP2R90RCoixpSPzsGHZXBYkiqo5eoDbu4jvgf89uX3Wnj3fhw48vfQbH4ocHB0vC0XSnj4Hp02BNevBhq5xABCnNxwbD6mXuGF3fK9tXY2cHApw11Snx6eQ_E2OqQ','2024-10-05 16:04:59',0),(33,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDQzODMsImV4cCI6MTczMDczNjM4Mywicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.t8F2Rls1In1UiJhDjPC1LuYc1A2FdWc0Hf7gDsNLxDt1LPIWgOhW8tZKCQQch8772VxRxGjTz-uL27mZdA0Gj5YKv7PuVJQBqffXVKv2GpVT1Id3wt5vUixW1cwhyLeVnznN1QmguyQtp5sXwZXa6GP3flchfmEmC2vdlL_EpSg8wNp4IwfqEni9Cgh8QMCvq6BsZ5T408jq4S52O-HssfgpvfaGVGaTvSgcJPdEtwc3ji-ArDz4crlMYbNpcu5YJhfSwQ8UjrLAZGACW9umdOl7NPJIiAB9oWjuHONyivhBIWt8_-7KK3jybLRe1QZKF50rb84s4hTUMfTlsfHHIQ','2024-10-05 16:06:59',0),(34,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDQ0MTgsImV4cCI6MTczMDczNjQxOCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8iLCJlbWFpbCI6ImVkdWFyZG9tYXJhdmlsbGFAaG90bWFpbC5jb20iLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUkVBRF9NWV9QUk9GSUxFIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9BVVhJTElBUlkifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0FVWElMSUFSSUVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NBUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0NMQVNTRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0dFQVIifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0dFQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9JTklUX1NLSUQifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0lOSVRfU0tJRFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0xFVkVMIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9MRVZFTFMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX01BS0VSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9NQUtFUlMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NUUkVFVF9UWVBFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVFJFRVRfVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1NVU1BFTlNJT04ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1NVU1BFTlNJT05TIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9USVJFIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9USVJFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk8ifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVFVSQk9fVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVFVSQk9fVFlQRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX0VOR0lORSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfRU5HSU5FUyJ9LHsiYXV0aG9yaXR5IjoiVVBEQVRFX09ORV9SQUNFUiJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9SQUNFUiJ9XSwidXNlcm5hbWUiOiJFRFVBUkRPTUFSQVYifQ.LAuYmepLtz_XIDg8Zll0KY6nkrgewErfabvjoOSumg9aDLnCR_M7NuinCpXlc5eeAAGjD50gWtSS4WmJfuTW7Own_GiY1jG5RwdUb2PtlP5TqBIm3Eoh3PTWbFtfLsLwfgM7BWXD7IAcimE1mBy-kciM2HoQPrEL4i5VJ_fHYKEvlGJGG1QgRwLS2LkZIxqpZ5VB3bKSn7WOdtu0f4WtCXYNnyrnBuhj873cnVBd4N8eOgp-uI21JqkmPXsjviAf-q6lsIAAobZ82ywyTcs3Y8Nn9qS_6dYIa19vySnJVlIjM6RJEdtNdnRcLrvXHXQb9MD3iZhTLLqIRLfv-55zxQ','2024-10-05 16:06:59',0),(35,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDQ0MTgsImV4cCI6MTczMDczNjQxOCwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlVQREFURV9PTkVfUkFDRVIifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWIn0.H_-ruMy6dQLhCEvIzOT3Q461aoAR9HD3l5tI2IXnbielZMXaSdpuuVDWdAIGhFgHocCUxVsXRsf_ozN7bdyhUp45ENr3OtmX1XGKTnMJsxkbPjx5_ALmc-ABk1XnUWJ9TfJAoQgwhhQPCwszsrIKcDn2xjlh7XT6FQCc3CxDRZJKw0rrqDGv7-wsPNdWj1Nw8sy1anGPfGR9RkRX8weFKWTFeVRtj7yY3id67jjZJwzpdxFACj5kLPxeKia9-spmtlGH3q3t9_dOG7oTG5-gkt43OCEmGDmVITf_PHtVPJnMTnwsUm5CWvv84BcmTpgtLqoXVR2BQlv4MBDXSwaBMg','2024-10-05 16:08:10',0),(36,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVYiLCJpYXQiOjE3MjgxNDQ0ODksImV4cCI6MTczMDczNjQ4OSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlVQREFURV9PTkVfUkFDRVIifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWIn0.WNQINKYoCkraykFmC9nmZt8jzAOpa3m9dgCxY3I0nCUA_9hLPbfp5YJVtuvREgdtVRmfzKz0TFtSWIr6pSvJS5fIVgB_ci67Uqnd0vvKPo1sC64Q-m56pxWazcqmKdCzM8JDrnWXOV9CciMmT9elnfiyZDhnbPGcqVCUh9tL2pFnInOCmaKCouewTM0w8b47zWI_r4e6z9rfUxvVwcmIqX-k2QOpZWTdYc4qCUdGidB0BdlvAj6xt6m3WNdS9kod_EobxwuTKUY7zlZCQR2WSG6nUNqEM5L09GJOtsdvmMRNEXR1RodcyLk8iAHjNxtCcsoWveUGjbHoAcvGJKXTCw','2024-10-05 16:08:10',0),(37,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJFRFVBUkRPTUFSQVZJTEwiLCJpYXQiOjE3MjgxNDQ0ODksImV4cCI6MTczMDczNjQ4OSwicm9sZSI6IlJBQ0VSIiwibmFtZSI6IkVkdWFyZG8gTWFyYXZpbGxhIiwiZW1haWwiOiJlZHVhcmRvbWFyYXZpbGxhQGhvdG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlJFQURfTVlfUFJPRklMRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQVVYSUxJQVJZIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9BVVhJTElBUklFUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfQ0FSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DQVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9DTEFTU0VTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9HRUFSIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9HRUFSUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfSU5JVF9TS0lEIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9JTklUX1NLSURTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9MRVZFTCJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTEVWRUxTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9NQUtFUiJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfTUFLRVJTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVFJFRVRfVFlQRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfU1RSRUVUX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9TVVNQRU5TSU9OIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9TVVNQRU5TSU9OUyJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9PTkVfVElSRSJ9LHsiYXV0aG9yaXR5IjoiUkVBRF9BTExfVElSRVMifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPIn0seyJhdXRob3JpdHkiOiJSRUFEX0FMTF9UVVJCT1MifSx7ImF1dGhvcml0eSI6IlJFQURfT05FX1RVUkJPX1RZUEUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX1RVUkJPX1RZUEVTIn0seyJhdXRob3JpdHkiOiJSRUFEX09ORV9FTkdJTkUifSx7ImF1dGhvcml0eSI6IlJFQURfQUxMX0VOR0lORVMifSx7ImF1dGhvcml0eSI6IlVQREFURV9PTkVfUkFDRVIifSx7ImF1dGhvcml0eSI6IlJPTEVfUkFDRVIifV0sInVzZXJuYW1lIjoiRURVQVJET01BUkFWSUxMIn0.idedT8In_45fN2tDFsuMjssfHq15kgiNnUtuqPNQmXoEN6KWY8GaMhZIJ93Rnsl7k17T3kjpA2rejnNkKelkLO-ms1sY6vZ7UP7ZNonbiAMmJB0PLTLAruytEFM2MrspKR6ZbOVS6iLD8NTnqTFiwFjgd1P44DrGORZ7RneCYzGpVFrterIrh-UAsRXLvx-SwIXn-Ofiq4EIODoNBCAMRsl0Tgztm_8jsc8ej3oyqVmh0C27wwTFmo-0JTvb_azLrTZmfR2FVpKj-Q7ctB9m4VLKfjA3_3O09oTpuYZlYLK7Tg_KQ3yKwCjoqxhLgEUEAKKvWDV7qBVZERSZqi1yDQ','2024-10-05 16:08:38',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'AUTHENTICATION','/auth'),(2,'RACER','/racers'),(3,'AUXILIARY','/auxiliaries'),(4,'CAR_CONFIGURATION','/car-configurations'),(5,'CAR','/cars'),(6,'CLASSES','/classes'),(7,'DRIVER','/drivers'),(8,'ENGINE','/engines'),(9,'GEAR','/gears'),(10,'INIT_SKID','/init-skids'),(11,'LEVEL','/levels'),(12,'MAKER','/makers'),(13,'STREET_TYPE','/street-types'),(14,'SUSPENSION','/suspensions'),(15,'TIRE','/tires'),(16,'TURBO','/turbos'),(17,'TURBO_TYPE','/turbo-types'),(18,'API_DOCUMETATION','/doc');
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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,'AUTHENTICATE','/authenticate','POST',1,1),(2,'VALIDATE_TOKEN','/validate-token','POST',1,1),(3,'READ_MY_PROFILE','/profile','GET',0,1),(4,'LOGOUT','/logout','POST',1,1),(5,'REGISTER_ONE_RACER','/register','POST',1,2),(6,'READ_ONE_AUXILIARY','/[0-9]*','GET',0,3),(7,'READ_ALL_AUXILIARIES','','GET',0,3),(8,'CREATE_AUXILIARY','','POST',0,3),(9,'UPDATE_AUXILIARY','/[0-9]*','PUT',0,3),(10,'DELETE_AUXILIARY','/[0-9]*','DELETE',0,3),(11,'READ_ONE_CAR_CONFIGURATION','/[0-9]*','GET',0,4),(12,'READ_ALL_CAR_CONFIGURATIONS','','GET',0,4),(13,'CREATE_CAR_CONFIGURATION','','POST',0,4),(14,'UPDATE_CAR_CONFIGURATION','/[0-9]*','PUT',0,4),(15,'DELETE_CAR_CONFIGURATION','/[0-9]*','DELETE',0,4),(16,'READ_ONE_CAR','/[0-9]*','GET',0,5),(17,'READ_ALL_CARS','','GET',0,5),(18,'CREATE_CAR','','POST',0,5),(19,'UPDATE_CAR','/[0-9]*','PUT',0,5),(20,'DELETE_CAR','/[0-9]*','DELETE',0,5),(21,'READ_ONE_CLASSES','/[0-9]*','GET',0,6),(22,'READ_ALL_CLASSES','','GET',0,6),(23,'CREATE_CLASSES','','POST',0,6),(24,'UPDATE_CLASSES','/[0-9]*','PUT',0,6),(25,'DELETE_CLASSES','/[0-9]*','DELETE',0,6),(26,'READ_ONE_DRIVER','/[0-9]*','GET',0,7),(27,'READ_ALL_DRIVERS','','GET',0,7),(28,'CREATE_DRIVER','','POST',0,7),(29,'UPDATE_DRIVER','/[0-9]*','PUT',0,7),(30,'DELETE_DRIVER','/[0-9]*','DELETE',0,7),(31,'READ_ONE_ENGINE','/[0-9]*','GET',0,8),(32,'READ_ALL_ENGINES','','GET',0,8),(33,'CREATE_ENGINE','','POST',0,8),(34,'UPDATE_ENGINE','/[0-9]*','PUT',0,8),(35,'DELETE_ENGINE','/[0-9]*','DELETE',0,8),(36,'READ_ONE_GEAR','/[0-9]*','GET',0,9),(37,'READ_ALL_GEARS','','GET',0,9),(38,'CREATE_GEAR','','POST',0,9),(39,'UPDATE_GEAR','/[0-9]*','PUT',0,9),(40,'DELETE_GEAR','/[0-9]*','DELETE',0,9),(41,'READ_ONE_INIT_SKID','/[0-9]*','GET',0,10),(42,'READ_ALL_INIT_SKIDS','','GET',0,10),(43,'CREATE_INIT_SKID','','POST',0,10),(44,'UPDATE_INIT_SKID','/[0-9]*','PUT',0,10),(45,'DELETE_INIT_SKID','/[0-9]*','DELETE',0,10),(46,'READ_ONE_LEVEL','/[0-9]*','GET',0,11),(47,'READ_ALL_LEVELS','','GET',0,11),(48,'CREATE_LEVEL','','POST',0,11),(49,'UPDATE_LEVEL','/[0-9]*','PUT',0,11),(50,'DELETE_LEVEL','/[0-9]*','DELETE',0,11),(51,'READ_ONE_MAKER','/[0-9]*','GET',0,12),(52,'READ_ALL_MAKERS','','GET',0,12),(53,'CREATE_MAKER','','POST',0,12),(54,'UPDATE_MAKER','/[0-9]*','PUT',0,12),(55,'DELETE_MAKER','/[0-9]*','DELETE',0,12),(56,'READ_ONE_STREET_TYPE','/[0-9]*','GET',0,13),(57,'READ_ALL_STREET_TYPES','','GET',0,13),(58,'CREATE_STREET_TYPE','','POST',0,13),(59,'UPDATE_STREET_TYPE','/[0-9]*','PUT',0,13),(60,'DELETE_STREET_TYPE','/[0-9]*','DELETE',0,13),(61,'READ_ONE_SUSPENSION','/[0-9]*','GET',0,14),(62,'READ_ALL_SUSPENSIONS','','GET',0,14),(63,'CREATE_SUSPENSION','','POST',0,14),(64,'UPDATE_SUSPENSION','/[0-9]*','PUT',0,14),(65,'DELETE_SUSPENSION','/[0-9]*','DELETE',0,14),(66,'READ_ONE_TIRE','/[0-9]*','GET',0,15),(67,'READ_ALL_TIRES','','GET',0,15),(68,'CREATE_TIRE','','POST',0,15),(69,'UPDATE_TIRE','/[0-9]*','PUT',0,15),(70,'DELETE_TIRE','/[0-9]*','DELETE',0,15),(71,'READ_ONE_TURBO','/[0-9]*','GET',0,16),(72,'READ_ALL_TURBOS','','GET',0,16),(73,'CREATE_TURBO','','POST',0,16),(74,'UPDATE_TURBO','/[0-9]*','PUT',0,16),(75,'DELETE_TURBO','/[0-9]*','DELETE',0,16),(76,'READ_ONE_TURBO_TYPE','/[0-9]*','GET',0,17),(77,'READ_ALL_TURBO_TYPES','','GET',0,17),(78,'CREATE_TURBO_TYPE','','POST',0,17),(79,'UPDATE_TURBO_TYPE','/[0-9]*','PUT',0,17),(80,'DELETE_TURBO_TYPE','/[0-9]*','DELETE',0,17),(81,'VIEW_API_DOCUMENTATION','/*','GET',1,18),(82,'UPDATE_ONE_RACER','/update-profile','POST',0,2);
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
  `car_configurations_id` int NOT NULL,
  PRIMARY KEY (`id_user_car_configurations`),
  KEY `fk_user_cars_configurations_cars_configuracions1_idx` (`car_configurations_id`),
  KEY `fk_user_cars_configurations_users1` (`user_id`),
  CONSTRAINT `fk_user_cars_configurations_cars_configuracions1` FOREIGN KEY (`car_configurations_id`) REFERENCES `cars_configurations` (`id_cars_configurations`),
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
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_role_id_idx` (`role_id`),
  CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Eduardo Maravilla','EDUARDOMARAVILL','$2a$10$okVeao9mk63pg6tIgGWYFuzW0qDOyKaL/hscwXl1MLPb.Zd.wMdBW','eduardomaravilla@hotmail.com',1,1,1,1,1,'#256030');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05 16:14:40
