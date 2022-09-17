-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for osx10.17 (arm64)
--
-- Host: localhost    Database: table_relationships
-- ------------------------------------------------------
-- Server version	10.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_post`
--


DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blogger_id` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_FK` (`blogger_id`),
  CONSTRAINT `blog_post_FK` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,1,'Hello Im one','Title number one','2022-10-24'),(2,1,'Hello Im two','Title number two','2022-10-24'),(3,2,'Hello Im three','Title Number three','2022-10-24'),(4,2,'Hello Im four','Title number four','2022-10-24'),(5,3,'Hello Im five','Title number five','2022-10-24'),(6,3,'Hello Im six','Title number six','2022-10-24');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_comment`
--

DROP TABLE IF EXISTS `blog_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blogger_id` int(10) unsigned NOT NULL,
  `blog_post_id` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_comment_FK` (`blogger_id`),
  KEY `blog_post_comment_FK_1` (`blog_post_id`),
  CONSTRAINT `blog_post_comment_FK` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_post_comment_FK_1` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_comment`
--

LOCK TABLES `blog_post_comment` WRITE;
/*!40000 ALTER TABLE `blog_post_comment` DISABLE KEYS */;
INSERT INTO `blog_post_comment` VALUES (1,3,1,'Number three here bla bla bla','2022-10-24'),(2,2,3,'Number Two here bla bla bla','2022-09-14'),(3,1,5,'Number one here bla bla bla','2022-09-14');
/*!40000 ALTER TABLE `blog_post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogger`
--

DROP TABLE IF EXISTS `blogger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogger_un_username` (`username`),
  UNIQUE KEY `blogger_un_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogger`
--

LOCK TABLES `blogger` WRITE;
/*!40000 ALTER TABLE `blogger` DISABLE KEYS */;
INSERT INTO `blogger` VALUES (1,'hani_abdulle','1024','Hani','2022-10-24','hani@email.com'),(2,'said_abdulle','0805','Said','2022-10-24','said@email.com'),(3,'siham_abdulle','0516','Siham','2022-10-24','siham@email.com');
/*!40000 ALTER TABLE `blogger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_table_relationships'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16 12:21:06
