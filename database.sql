-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: exam_schema
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int DEFAULT NULL,
  `model` varchar(75) DEFAULT NULL,
  `make` varchar(75) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cars_users_idx` (`users_id`),
  CONSTRAINT `fk_cars_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (9,2000,'Civic','Honda',2010,'daily driver','2024-03-18 16:06:37','2024-03-18 16:06:37',2),(10,5220,'F-150','Ford',1992,'pickup truck','2024-03-18 16:07:06','2024-03-18 16:07:06',2),(11,80000,'supra','Toyota',1997,'Fast car','2024-03-18 16:08:32','2024-03-19 11:39:11',1),(12,2500,'Accord','Honda',1998,'needs work','2024-03-19 00:00:08','2024-03-19 00:00:08',3);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `user_id` int NOT NULL,
  `car_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`car_id`),
  KEY `fk_users_has_cars_cars1_idx` (`car_id`),
  KEY `fk_users_has_cars_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_cars_cars1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
  CONSTRAINT `fk_users_has_cars_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,9),(1,10);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Konstantinos','Mazarakis','kostasbusiness@gmail.com','$2b$12$gefPNdG9.Q86nFItCEv20uuQaaKBuwmDei4YUuW00JpXkCW55nehG','2024-03-12 15:43:56','2024-03-12 15:43:56'),(2,'Adriyana','Leyman','adriyana19@gmail.com','$2b$12$ilfpEMJ5AhUnpBBfIyF7R.qFB0vc.Q2qxAMbHc7Q19b3vidYLv5cq','2024-03-12 15:46:23','2024-03-12 15:46:23'),(3,'Eleni','Mouzaki','elenmouzaki3@gmail.com','$2b$12$On86AZ.FYpz.R9gMRNcqIuNjCKQGN0WZEhjDNeA/ZHD27zb6pz76O','2024-03-18 23:59:11','2024-03-18 23:59:11'),(4,'Max','Testing','kostas25_maza@hotmail.com','$2b$12$1mEcprlcl4Y3NplevEKWnuvc7b9i6DHaRv//bueBnHXVfX9HVE.xq','2024-03-19 11:41:53','2024-03-19 11:41:53');
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

-- Dump completed on 2024-03-20 18:45:26
