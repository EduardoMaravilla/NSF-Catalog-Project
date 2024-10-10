-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nfs_catalogo_project
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
-- Dumping data for table `auxiliaries`
--

LOCK TABLES `auxiliaries` WRITE;
/*!40000 ALTER TABLE `auxiliaries` DISABLE KEYS */;
INSERT INTO `auxiliaries` VALUES (1,'ESPACIO VACIO',1),(2,'PROTECCION DE IMPACTOS',3),(3,'AUMENTO DE DAÑOS',3),(4,'KIT DE REPARACION',3),(5,'NITRO POR DERRAPES',3),(6,'AGARRE DE NITRO',3),(7,'NITRO POR ROCES',3),(8,'NITRO POR REBUFO',3),(9,'NITRO POR SALTOS',3),(10,'PROTECCION DE IMPACTOS',4),(11,'AUMENTO DE DAÑOS',4),(12,'KIT DE REPARACION',4),(13,'NITRO POR DERRAPES',4),(14,'AGARRE DE NITRO',4),(15,'NITRO POR ROCES',4),(16,'NITRO POR REBUFO',4),(17,'NITRO POR SALTOS',4),(18,'INHINIBIDOR DE RADIO',4),(19,'PILOTO A LA FUGA',4);
/*!40000 ALTER TABLE `auxiliaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,39,'NSX','2017'),(2,39,'RSX-S','2004'),(3,40,'Giulia Quadrifoglio','2016'),(4,41,'DB5','1964'),(5,41,'DB11','2017'),(6,41,'DB11 Volante','2019'),(7,41,'Vulcan','2016'),(8,35,'M2 Coupe','2023'),(9,35,'M3 E46','2006'),(10,35,'M3 Evolution II E30','1988'),(11,35,'M4 Coupé','2018'),(12,35,'M4 Convertible','2018'),(13,35,'M5','2018'),(15,35,'X6 M','2016'),(16,35,'Z4 M40i','2019'),(17,35,'i8 Coupé','2018'),(18,35,'M4 GTS','2016'),(19,35,'M3 Convertible','2010'),(21,35,'i8 Roadster','2018'),(22,42,'Chiron Sport','2019'),(23,36,'Grand National GNX','1987'),(24,43,'Bel Air','1955'),(25,43,'Camaro SS','1967'),(26,43,'Camaro Z/28','2014'),(27,43,'Colorado ZR2','2017'),(28,43,'Corvette Grand Sport','2017'),(29,43,'Corvette Stingray','2020'),(30,43,'Corvette Stingray Convertible','2020'),(31,43,'Corvette Z06','2013'),(32,43,'Corvette ZR1','2019'),(33,43,'C10 Stepside Pickup','1965'),(34,37,'DeLorean','1981'),(35,44,'Challenger SRT8','2014'),(36,44,'Charger','1969'),(37,44,'Charger SRT Hellcat','2019'),(38,45,'458 Italia','2009'),(39,45,'458 Spider','2011'),(40,45,'488 GTB','2015'),(41,45,'488 Pista','2019'),(42,45,'F40','1987'),(43,45,'FXX-K Evo','2018'),(44,45,'LaFerrari','2016'),(45,45,'Testarossa Coupé','1984'),(46,46,'Crown Victoria','2008'),(47,46,'Focus RS','2016'),(48,46,'F-150 Raptor','2017'),(49,46,'Mustang','1965'),(50,46,'Mustang BOSS 302','1969'),(51,46,'Mustang Foxbody','1990'),(52,46,'Mustang GT','2015'),(53,46,'Mustang GT Convertible','2019'),(54,46,'GT','2017'),(55,47,'Civic Type-R','2000'),(57,47,'Civic Type-R','2015'),(58,47,'NSX R','1992'),(59,47,'S2000','2009'),(60,48,'Q60S','2017'),(61,49,'F-Type R Coupé','2016'),(62,49,'F-Type R Convertible','2019'),(63,50,'Regera','2016'),(64,51,'Aventador S','2016'),(65,51,'Aventador S Roadster','2017'),(66,51,'Aventador SVJ Coupé','2018'),(67,51,'Aventador SVJ Roadster','2019'),(68,51,'Aventador LP750-4 Superveloce Roadster','2015'),(69,51,'Countach 25.º Aniversario','1988'),(70,51,'Countach LPI 800-4','2021'),(71,51,'Diablo SV','1996'),(72,51,'Huracán RWD','2015'),(73,51,'Huracán RWD Spyder','2016'),(74,51,'Huracán Performante','2017'),(75,51,'Huracán Performante Spyder','2018'),(76,51,'Murciélago LP 670-4  SV','2009'),(77,51,'Urus','2017'),(78,52,'Defender 110 Pickup','2015'),(79,52,'Range Rover Sport SVR','2015'),(80,38,'Emira','2021'),(81,38,'Exige S','2006'),(82,53,'MX-5','1996'),(84,53,'MX-5','2015'),(85,53,'RX-7 Spirit R','2002'),(86,53,'RX-8 Spirit R ','2011'),(87,54,'570S Coupé','2015'),(88,54,'570S Spider','2018'),(89,54,'600LT','2018'),(90,54,'F1','1994'),(91,54,'P1','2013'),(92,54,'P1 GTR','2015'),(93,55,'Benz 190E 2.5-16','1988'),(94,55,'AMG A 45','2016'),(95,55,'AMG C 63 Cabriolet','2018'),(96,55,'AMG C 63 Coupé','2018'),(97,55,'AMG G 63','2017'),(98,55,'AMG GT Black Series','2020'),(99,55,'AMG GT R','2017'),(100,55,'AMG GT S Coupé','2019'),(101,55,'AMG GT S Roadster','2019'),(102,55,'Maybach S 680','2021'),(103,56,'Cougar','1967'),(104,57,'John Cooper Works Countryman','2017'),(105,58,'Eclipse GSX','1999'),(106,58,'Lancer Evolution IX','2007'),(107,58,'Lancer Evolution X','2008'),(108,59,'180SX Type X','1996'),(109,59,'350Z','2008'),(110,59,'370Z Heritage Edition','2019'),(111,59,'370Z Nismo','2015'),(112,59,'Fairlady 240ZG','1971'),(113,59,'GT-R Nismo','2017'),(114,59,'GT-R Premium Edition','2017'),(115,59,'Silvia K’s','1998'),(116,59,'Silvia Spec-R Aero','2002'),(117,59,'Skyline GT-R KPGC10','1971'),(118,59,'Skyline GT-R V·Spec','1993'),(119,59,'Skyline GT-R V·Spec','1999'),(120,59,'Z Prototype','2020'),(121,60,'Huayra BC','2017'),(122,61,'Barracuda','1970'),(123,62,'Polestar 1','2020'),(124,63,'Firebird','1977'),(125,64,'718 Cayman GTS','2018'),(126,64,'911 Carrera GTS','2018'),(127,64,'911 Carrera RSR 2.8','1973'),(128,64,'911 Carrera S','1997'),(129,64,'911 GT2 RS','2018'),(130,64,'911 GT3 RS','2019'),(131,64,'911 Turbo S Cabriolet exclusive Series','2019'),(132,64,'911 Turbo S Exclusive','2018'),(133,64,'918 Spyder','2015'),(134,64,'718 Spyder','2019'),(135,64,'Panamera Turbo','2017'),(136,64,'Cayman GT4','2015'),(137,64,'911 Targa 4 GTS','2018'),(138,65,'Viper GTS','2014'),(139,66,'BRZ Premium','2014'),(140,66,'Impreza WRX STI','2006'),(141,66,'Impreza WRX STI','2010'),(142,67,'Beetle','1963'),(143,67,'Golf GTI','1976'),(144,67,'Golf GTI Clubsport','2016'),(145,68,'242 DL','1975'),(146,68,'Amazon P130','1970'),(147,69,'R8 Coupe V10 performance quattro','2019'),(148,69,'S5 Sportback','2017'),(149,35,'M1','1981'),(150,35,'M2 Competition','2019'),(151,35,'M3 Coupé','2010'),(152,35,'M3 Competition Touring','2023'),(153,64,'Taycan Turbo S','2022'),(154,64,'911 Carrera GTS Cabriolet','2018'),(155,35,'M3 GTR Legends Edition','2005'),(156,46,'Mustang Dark Horse','2024'),(157,69,'RS 6 Avant','2020');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cars_configurations`
--

LOCK TABLES `cars_configurations` WRITE;
/*!40000 ALTER TABLE `cars_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'B'),(2,'A'),(3,'A+'),(4,'S'),(5,'S+');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `engines`
--

LOCK TABLES `engines` WRITE;
/*!40000 ALTER TABLE `engines` DISABLE KEYS */;
INSERT INTO `engines` VALUES (1,225,4.90,'V8',1),(2,573,3.50,'V6 híbrido',2),(3,592,4.40,'V8',3),(4,754,6.00,'V12',4),(5,903,3.80,'V8 híbrido',5);
/*!40000 ALTER TABLE `engines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gears`
--

LOCK TABLES `gears` WRITE;
/*!40000 ALTER TABLE `gears` DISABLE KEYS */;
INSERT INTO `gears` VALUES (1,1,5),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,3),(7,7,4),(8,8,5);
/*!40000 ALTER TABLE `gears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `granted_permissions`
--

LOCK TABLES `granted_permissions` WRITE;
/*!40000 ALTER TABLE `granted_permissions` DISABLE KEYS */;
INSERT INTO `granted_permissions` VALUES (1,1,3),(2,1,6),(3,1,7),(4,1,16),(5,1,17),(6,1,21),(7,1,22),(8,1,36),(9,1,37),(10,1,41),(11,1,42),(12,1,46),(13,1,47),(14,1,51),(15,1,52),(16,1,56),(17,1,57),(18,1,61),(19,1,62),(20,1,66),(21,1,67),(22,1,71),(23,1,72),(24,1,76),(25,1,77),(26,2,3),(27,2,6),(28,2,7),(29,2,8),(30,2,9),(31,2,10),(32,2,11),(33,2,12),(34,2,13),(35,2,14),(36,2,15),(37,2,16),(38,2,17),(39,2,18),(40,2,19),(41,2,20),(42,2,21),(43,2,22),(44,2,23),(45,2,24),(46,2,25),(47,2,26),(48,2,27),(49,2,28),(50,2,29),(51,2,30),(52,2,31),(53,2,32),(54,2,33),(55,2,34),(56,2,35),(57,2,36),(58,2,37),(59,2,38),(60,2,39),(61,2,40),(62,2,41),(63,2,42),(64,2,43),(65,2,44),(66,2,45),(67,2,46),(68,2,47),(69,2,48),(70,2,49),(71,2,50),(72,2,51),(73,2,52),(74,2,53),(75,2,54),(76,2,55),(77,2,56),(78,2,57),(79,2,58),(80,2,59),(81,2,60),(82,2,61),(83,2,62),(84,2,63),(85,2,64),(86,2,65),(87,2,66),(88,2,67),(89,2,68),(90,2,69),(91,2,70),(92,2,71),(93,2,72),(94,2,73),(95,2,74),(96,2,75),(97,2,76),(98,2,77),(99,2,78),(100,2,79),(101,2,80);
/*!40000 ALTER TABLE `granted_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `init_skids`
--

LOCK TABLES `init_skids` WRITE;
/*!40000 ALTER TABLE `init_skids` DISABLE KEYS */;
INSERT INTO `init_skids` VALUES (1,'NO'),(2,'TOQUE DE FRENO'),(3,'TOQUE DE ACELERADOR'),(4,'POR DEFECTO');
/*!40000 ALTER TABLE `init_skids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `jwt_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Basico'),(2,'Deportivo'),(5,'Elite'),(3,'Pro'),(4,'Super');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `makers`
--

LOCK TABLES `makers` WRITE;
/*!40000 ALTER TABLE `makers` DISABLE KEYS */;
INSERT INTO `makers` VALUES (39,'Acura'),(40,'Alfa Romeo'),(41,'Aston Martin'),(69,'Audi'),(35,'BMW'),(42,'Bugatti'),(36,'Buick'),(43,'Chevrolet'),(37,'DMC'),(44,'Dodge'),(45,'Ferrari'),(46,'Ford'),(47,'Honda'),(48,'Infiniti'),(49,'Jaguar'),(50,'Koenigsegg'),(51,'Lamborghini'),(52,'Land Rover'),(38,'Lotus'),(53,'Mazda'),(54,'McLaren'),(55,'Mercedes'),(56,'Mercury'),(57,'MINI'),(58,'Mitsubishi'),(59,'NISSAN'),(60,'Pagani'),(61,'Plymouth'),(62,'Polestar'),(63,'Pontiac'),(64,'Porsche'),(65,'SRT'),(66,'SUBARU'),(67,'Volkswagen'),(68,'Volvo');
/*!40000 ALTER TABLE `makers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'AUTHENTICATION','/auth'),(2,'RACER','/racers'),(3,'AUXILIARY','/auxiliaries'),(4,'CAR_CONFIGURATION','/car-configurations'),(5,'CAR','/cars'),(6,'CLASSES','/classes'),(7,'DRIVER','/drivers'),(8,'ENGINE','/engines'),(9,'GEAR','/gears'),(10,'INIT_SKID','/init-skids'),(11,'LEVEL','/levels'),(12,'MAKER','/makers'),(13,'STREET_TYPE','/street-types'),(14,'SUSPENSION','/suspensions'),(15,'TIRE','/tires'),(16,'TURBO','/turbos'),(17,'TURBO_TYPE','/turbo-types');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,'AUTHENTICATE','/authenticate','POST',1,1),(2,'VALIDATE_TOKEN','/validate-token','GET',1,1),(3,'READ_MY_PROFILE','/profile','GET',0,1),(4,'LOGOUT','/logout','POST',1,1),(5,'RACER','','POST',1,2),(6,'READ_ONE_AUXILIARY','/[0-9]*','GET',0,3),(7,'READ_ALL_AUXILIARIES',NULL,'GET',0,3),(8,'CREATE_AUXILIARY',NULL,'POST',0,3),(9,'UPDATE_AUXILIARY','/[0-9]*','PUT',0,3),(10,'DELETE_AUXILIARY','/[0-9]*','DELETE',0,3),(11,'READ_ONE_CAR_CONFIGURATION','/[0-9]*','GET',0,4),(12,'READ_ALL_CAR_CONFIGURATIONS',NULL,'GET',0,4),(13,'CREATE_CAR_CONFIGURATION',NULL,'POST',0,4),(14,'UPDATE_CAR_CONFIGURATION','/[0-9]*','PUT',0,4),(15,'DELETE_CAR_CONFIGURATION','/[0-9]*','DELETE',0,4),(16,'READ_ONE_CAR','/[0-9]*','GET',0,5),(17,'READ_ALL_CARS',NULL,'GET',0,5),(18,'CREATE_CAR',NULL,'POST',0,5),(19,'UPDATE_CAR','/[0-9]*','PUT',0,5),(20,'DELETE_CAR','/[0-9]*','DELETE',0,5),(21,'READ_ONE_CLASSES','/[0-9]*','GET',0,6),(22,'READ_ALL_CLASSES',NULL,'GET',0,6),(23,'CREATE_CLASSES',NULL,'POST',0,6),(24,'UPDATE_CLASSES','/[0-9]*','PUT',0,6),(25,'DELETE_CLASSES','/[0-9]*','DELETE',0,6),(26,'READ_ONE_DRIVER','/[0-9]*','GET',0,7),(27,'READ_ALL_DRIVERS',NULL,'GET',0,7),(28,'CREATE_DRIVER',NULL,'POST',0,7),(29,'UPDATE_DRIVER','/[0-9]*','PUT',0,7),(30,'DELETE_DRIVER','/[0-9]*','DELETE',0,7),(31,'READ_ONE_ENGINE','/[0-9]*','GET',0,8),(32,'READ_ALL_ENGINES',NULL,'GET',0,8),(33,'CREATE_ENGINE',NULL,'POST',0,8),(34,'UPDATE_ENGINE','/[0-9]*','PUT',0,8),(35,'DELETE_ENGINE','/[0-9]*','DELETE',0,8),(36,'READ_ONE_GEAR','/[0-9]*','GET',0,9),(37,'READ_ALL_GEARS',NULL,'GET',0,9),(38,'CREATE_GEAR',NULL,'POST',0,9),(39,'UPDATE_GEAR','/[0-9]*','PUT',0,9),(40,'DELETE_GEAR','/[0-9]*','DELETE',0,9),(41,'READ_ONE_INIT_SKID','/[0-9]*','GET',0,10),(42,'READ_ALL_INIT_SKIDS','','GET',0,10),(43,'CREATE_INIT_SKID',NULL,'POST',0,10),(44,'UPDATE_INIT_SKID','/[0-9]*','PUT',0,10),(45,'DELETE_INIT_SKID','/[0-9]*','DELETE',0,10),(46,'READ_ONE_LEVEL','/[0-9]*','GET',0,11),(47,'READ_ALL_LEVELS',NULL,'GET',0,11),(48,'CREATE_LEVEL',NULL,'POST',0,11),(49,'UPDATE_LEVEL','/[0-9]*','PUT',0,11),(50,'DELETE_LEVEL','/[0-9]*','DELETE',0,11),(51,'READ_ONE_MAKER','/[0-9]*','GET',0,12),(52,'READ_ALL_MAKERS',NULL,'GET',0,12),(53,'CREATE_MAKER',NULL,'POST',0,12),(54,'UPDATE_MAKER','/[0-9]*','PUT',0,12),(55,'DELETE_MAKER','/[0-9]*','DELETE',0,12),(56,'READ_ONE_STREET_TYPE','/[0-9]*','GET',0,13),(57,'READ_ALL_STREET_TYPES',NULL,'GET',0,13),(58,'CREATE_STREET_TYPE',NULL,'POST',0,13),(59,'UPDATE_STREET_TYPE','/[0-9]*','PUT',0,13),(60,'DELETE_STREET_TYPE','/[0-9]*','DELETE',0,13),(61,'READ_ONE_SUSPENSION','/[0-9]*','GET',0,14),(62,'READ_ALL_SUSPENSIONS',NULL,'GET',0,14),(63,'CREATE_SUSPENSION',NULL,'POST',0,14),(64,'UPDATE_SUSPENSION','/[0-9]*','PUT',0,14),(65,'DELETE_SUSPENSION','/[0-9]*','DELETE',0,14),(66,'READ_ONE_TIRE','/[0-9]*','GET',0,15),(67,'READ_ALL_TIRES',NULL,'GET',0,15),(68,'CREATE_TIRE',NULL,'POST',0,15),(69,'UPDATE_TIRE','/[0-9]*','PUT',0,15),(70,'DELETE_TIRE','/[0-9]*','DELETE',0,15),(71,'READ_ONE_TURBO','/[0-9]*','GET',0,16),(72,'READ_ALL_TURBOS',NULL,'GET',0,16),(73,'CREATE_TURBO',NULL,'POST',0,16),(74,'UPDATE_TURBO','/[0-9]*','PUT',0,16),(75,'DELETE_TURBO','/[0-9]*','DELETE',0,16),(76,'READ_ONE_TURBO_TYPE','/[0-9]*','GET',0,17),(77,'READ_ALL_TURBO_TYPES',NULL,'GET',0,17),(78,'CREATE_TURBO_TYPE',NULL,'POST',0,17),(79,'UPDATE_TURBO_TYPE','/[0-9]*','PUT',0,17),(80,'DELETE_TURBO_TYPE','/[0-9]*','DELETE',0,17);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ADMINISTRATOR'),(1,'RACER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `street_types`
--

LOCK TABLES `street_types` WRITE;
/*!40000 ALTER TABLE `street_types` DISABLE KEYS */;
INSERT INTO `street_types` VALUES (1,'Normal'),(2,'Agarre'),(3,'Derrape'),(4,'Derrape Pro'),(5,'Asfalto'),(6,'Campo A Travez');
/*!40000 ALTER TABLE `street_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `suspensions`
--

LOCK TABLES `suspensions` WRITE;
/*!40000 ALTER TABLE `suspensions` DISABLE KEYS */;
INSERT INTO `suspensions` VALUES (1,1,1),(2,1,2),(3,5,2),(4,6,2),(5,1,3),(6,5,3),(7,6,3),(8,1,4),(9,5,4),(10,6,4),(11,1,5),(12,5,5),(13,6,5);
/*!40000 ALTER TABLE `suspensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tires`
--

LOCK TABLES `tires` WRITE;
/*!40000 ALTER TABLE `tires` DISABLE KEYS */;
INSERT INTO `tires` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,5,2),(6,6,2),(7,1,3),(8,2,3),(9,3,3),(10,5,3),(11,6,3),(12,1,4),(13,2,4),(14,3,4),(15,5,4),(16,6,4),(17,1,5),(18,2,5),(19,3,5),(20,4,5),(21,5,5),(22,6,5);
/*!40000 ALTER TABLE `tires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `turbo_types`
--

LOCK TABLES `turbo_types` WRITE;
/*!40000 ALTER TABLE `turbo_types` DISABLE KEYS */;
INSERT INTO `turbo_types` VALUES (1,'Aspiración Natural'),(2,'Sobrealimentador Centrífugo'),(3,'Sobrealimentador De Tornillo'),(4,'TurboCompresor'),(5,'DobleTurboCompresor'),(6,'Sobrealimentador Roots');
/*!40000 ALTER TABLE `turbo_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `turbos`
--

LOCK TABLES `turbos` WRITE;
/*!40000 ALTER TABLE `turbos` DISABLE KEYS */;
INSERT INTO `turbos` VALUES (1,1,1),(2,4,2),(3,5,2),(4,6,2),(5,2,3),(6,4,3),(7,5,3),(8,6,3),(9,2,4),(10,3,4),(11,4,4),(12,5,4),(13,6,4),(14,2,5),(15,3,5),(16,4,5),(17,5,5),(18,6,5);
/*!40000 ALTER TABLE `turbos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_car_configurations`
--

LOCK TABLES `user_car_configurations` WRITE;
/*!40000 ALTER TABLE `user_car_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_car_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2024-09-09 19:35:57
