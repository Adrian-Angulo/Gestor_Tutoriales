CREATE DATABASE  IF NOT EXISTS `gestortutoriales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestortutoriales`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: gestortutoriales
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Flutter'),(2,'Python'),(3,'Java'),(4,'Dark'),(5,'C++'),(6,'Node.js'),(7,'JavaScript'),(8,'HTML'),(9,'CSS'),(11,'Goland');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutoriales`
--

DROP TABLE IF EXISTS `tutoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutoriales` (
  `idTutoriales` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `prioridad` varchar(10) DEFAULT NULL,
  `estado` enum('Revisado','Por Revisar') DEFAULT NULL,
  `URL` text,
  `idCategoria` int DEFAULT NULL,
  PRIMARY KEY (`idTutoriales`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `tutoriales_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutoriales`
--

LOCK TABLES `tutoriales` WRITE;
/*!40000 ALTER TABLE `tutoriales` DISABLE KEYS */;
INSERT INTO `tutoriales` VALUES (1,'Curso Java','1','Revisado','https://www.youtube.com/watch?v=U709qY6S9rA&list=PLU8oAlHdN5BktAXdEVCLUYzvDyqRQJ2lk',3),(2,'Curso de PYTHON desde CERO (Completo)','1','Por Revisar','https://www.youtube.com/watch?v=nKPbfIU442g',2),(3,'Aprende javaScript ahora','4','Revisado','https://www.youtube.com/watch?v=QoC4RxNIs5M&pp=ygUQY3Vyc28gamF2YXNjcmlwdA%3D%3D',7),(5,'El primer paso para utilizar Python como Excel','3','Revisado','https://www.youtube.com/watch?v=2Una_E3gvs0&t=1s',2),(6,'Todo java','3','Revisado','https://www.youtube.com/watch?v=2Una_E3gvs0&t=1s',3);
/*!40000 ALTER TABLE `tutoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gestortutoriales'
--

--
-- Dumping routines for database 'gestortutoriales'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23 17:15:19
