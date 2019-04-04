-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: nodelogin
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (2,'test','test','test@test.com',NULL),(5,'FF','FFF','FFF','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IkZGIiwiZW1haWwiOiJGRkYiLCJpYXQiOjE1NTQzOTMyOTUsImV4cCI6MTU1NDQwMDQ5NX0.rzVOfYzzXwwrf5TihMCeIJgKhmEIlJjkT9kko9FBqsE'),(6,'re','er','ddd','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJlIiwiZW1haWwiOiJlciIsImlhdCI6MTU1NDM5NDc4NiwiZXhwIjoxNTU0NDAxOTg2fQ.mUw-tUArOG0JbIquPjaXjhvASOK9Liyfu6rRpuJDlwA'),(7,'fff','fff','fff','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImZmZiIsImVtYWlsIjoiZmZmIiwiaWF0IjoxNTU0Mzk0ODQxLCJleHAiOjE1NTQ0MDIwNDF9.wbxlkHQk8bWP5qoAWpbk58CedlOq7eeWZ1BF47LCllQ'),(8,'gg','ggg','hhh','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImdnIiwiZW1haWwiOiJnZ2ciLCJpYXQiOjE1NTQzOTUxODQsImV4cCI6MTU1NDQwMjM4NH0.I7O7K2svz0YRGDewcICFsh0QrSpKtZFurmdEGE92LeA'),(9,'rrrrrrrrrrrrrrrrrrrrrrrrrrr','chippy@333S','resgm@tr.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJycnJycnJycnJycnJycnJycnJycnJycnJyciIsImVtYWlsIjoiY2hpcHB5QDMzM1MiLCJpYXQiOjE1NTQzOTcyMDUsImV4cCI6MTU1NDQwNDQwNX0.CCqOc7-z6093WompfWE8WATgCDhpeem3_s7lYyASW60'),(10,'reshmadddd','reshma@C5','reshma@gmail.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJlc2htYWRkZGQiLCJlbWFpbCI6InJlc2htYUBDNSIsImlhdCI6MTU1NDM5Nzg4OCwiZXhwIjoxNTU0NDA1MDg4fQ.JzxKf4bw4zlP6vtXVl7ezOiu57scoHe2aapve1bVzEY'),(11,'reshmauuuu','Chippy@3','reshma@g.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJlc2htYXV1dXUiLCJlbWFpbCI6IkNoaXBweUAzIiwiaWF0IjoxNTU0Mzk4NTMzLCJleHAiOjE1NTQ0MDU3MzN9.O-NciB6s49k5TWWA9fQkPIHkIQyfF4WJ31bJbJG9alM'),(12,'reshmadddd','Chippy@33','rsh@gmail.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJlc2htYWRkZGQiLCJlbWFpbCI6IkNoaXBweUAzMyIsImlhdCI6MTU1NDM5ODcwOCwiZXhwIjoxNTU0NDA1OTA4fQ.Bl6RtTg3msfnTy9ghIi6rM7kUsW7OLld0tCnlPpOjgY'),(13,'reshma',' chippy@33P','chippy@gmail.com',NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-04 23:06:29
