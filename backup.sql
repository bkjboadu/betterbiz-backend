-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: qzkp8ry756433yd4.cbetxkdyhwsb.us-east-1.rds.amazonaws.com    Database: lotx70ige8ayxbin
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user` (
  `password` varchar(128) NOT NULL,
  `id` char(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL,
  `has_completed_questionnaire` tinyint(1) NOT NULL,
  `default_company_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_user_default_company_id_d4e2fb7f_fk_business_business_id` (`default_company_id`),
  CONSTRAINT `account_user_default_company_id_d4e2fb7f_fk_business_business_id` FOREIGN KEY (`default_company_id`) REFERENCES `business_business` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES ('pbkdf2_sha256$720000$pqDMVLVKJUgHPNkIkShsV8$8uWf65J4orhCHu820wGhW7ECwWtoCHDFzsot7qmp5Cs=','0c806635cbc74050ae7c92795da165df','gkyriazis@stingray.com','GeorgeKyriazis','',1,0,0,'2024-05-03 22:28:14.368203',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$Gret2Jic46V3k1VJNfulnu$oEhf96BDxs5+hKgPZhGYBd1I6xISapyhq1xmUrwBJ48=','22fd42d00f234606b94b04d160a5b108','tadeji1869@rehezb.com','HelloWorld','',1,0,0,'2024-05-07 19:56:40.331623',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$QxFSJhveCa5HZOpo2EShGP$7c2rIJ4al6Y8cK0NQrR8s/2/m1YkQvO4gtdfrrmPRs0=','3d0356e3f280461a94e4aa1d8a6e12b2','brbojr@gmail.com','brightBoadu','',1,0,0,'2024-05-09 16:56:46.173560',NULL,NULL,NULL,NULL,NULL,1,0,'68005789c00141399b9a4806f6936837'),('pbkdf2_sha256$720000$5deG9NMQQr0fHBvUPx4MHN$KqZOKsWHgBT7tmj6AuKQfsyt0ej2L5wGKYfoh/6OaU0=','3fe8069b69b04ab88ed9ef090f7f6c5b','sumayahbaker2@gmail.com','SoosooBoo','',1,0,0,'2024-05-20 18:30:32.776356',NULL,NULL,NULL,NULL,NULL,1,0,NULL),('pbkdf2_sha256$720000$9CDobcM5w1n19kjzgRbZtz$mOlKC85/AMR2jfT+fTVGSmCp9kEINhoqlL3EbWsokPM=','5598108d8ce448e18114de259e1a3da7','vibek37337@shanreto.com','AvramMacias','',1,0,0,'2024-05-07 20:50:29.279204',NULL,NULL,NULL,NULL,NULL,1,0,'ba8e906afff74e34a62d0306736754f8'),('pbkdf2_sha256$720000$PUT3sNT4vL9c1cW88nLzxz$y5NhCXym2DJxUcG+8TnLQWFh4AYMPIgZEXzt1hZx37I=','8a3ffdac42c544b3900da569c8a5e23c','lywisydy@mailinator.com','DanielleBridges','',1,0,0,'2024-05-08 15:54:54.203894',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$Fsl8NXTHU808E5BCombmYs$LQTqkoIs6N1yBdErp+0JwOPQXQvXjlWzUtHEW8PIFG8=','949d358d01644887933da376b7da8a41','inkuzie@gmail.com','obinwogu','',1,0,0,'2024-05-09 13:17:40.483757',NULL,NULL,NULL,NULL,NULL,1,0,'ad14b53be63445e4bd963a34ab5a1902'),('pbkdf2_sha256$720000$03lwrnLyzUuA9UkC2GgLeo$TlJkIZBIh9+MLebW0yJc2+aQ3eHGOxsPtR1zQlDjbWQ=','965762ae54c54715a56a3f19a03a80d8','dolipob540@rehezb.com','bright boadu','',1,0,0,'2024-05-07 18:20:45.547171',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$9HCm2sAxDZwlbMUN2LkPDV$tKNgS/RmNdeqbhbP6avi9eb8FFFipiNKFwalNz9nOcA=','ae77a24bb90341d88fefd4a5a3f26943','reyoya8973@rehezb.com','','',1,0,0,'2024-05-07 13:19:25.836565',NULL,NULL,NULL,NULL,NULL,1,0,'9eee7238739f475b9beb5b8bc802e512'),('pbkdf2_sha256$720000$aCtb7I8WQeFNxI0vCunpB6$XygyjgECEHyOAZOpbE5CvPKZG6086caD+uNQrFWeUL4=','afdea517d96f40f7991e768f2f763ab0','ejino9464@lewenbo.com','','',1,0,0,'2024-05-04 13:12:40.927356',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$TxEmYMZiJqkuUCjas64zCN$ReCo2Jbnr41whHgbMXJgWPY4pHAoLwydKRxtmhmyoH0=','bb9352996bf84260bff03d6530d2f50e','pijojoh711@lewenbo.com','','',1,0,0,'2024-05-04 08:45:10.177870',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$GAcMbemZPaUdQGpACivMry$YTvJNMK9HxDjkOFgf8Weh2Xm2/0LiCeFAwmgEKhhUzo=','bbcf7eb16acf431eafce5d75665da111','xibakon793@shanreto.com','','',1,0,0,'2024-05-06 12:44:01.454860',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$OriVxme47aWRT428ME9rVR$3EjsbcfqdO+eAUhFvksSbHDgOXQSklaJ+Oi5zjjFlpg=','bc9ea40a415a41438f172eeaf9a97af9','yorgoskyriazis@gmail.com','George Kyriazis','user_avatars/gk.jog.jpg',1,0,0,'2024-05-07 23:49:23.867606',NULL,'3213312',NULL,NULL,NULL,1,0,NULL),('pbkdf2_sha256$720000$BVIf7t50nSMwkSsRwg4lJ1$ZcbF2t/YaQeQJF4X9dq/9d7vx7lRY4hnckORAtK4xWc=','be91b14d8448498a993aba8a79b9c670','tester@gmail.com','ABCCBA','',1,0,0,'2024-05-06 12:54:28.641534',NULL,NULL,NULL,NULL,NULL,0,0,NULL),('pbkdf2_sha256$720000$NJ14MSK45k6849Kkaelns3$/W++vFpH8jVtdtscUATbYHAm4YFTJNQearJP0bVBLNU=','c167ea844fdf42e981366980c5cad032','george.k@scenicroutes.dev','JamesPorter','',1,0,0,'2024-05-07 22:07:39.137882',NULL,NULL,NULL,NULL,NULL,1,0,'d6d78703d0344ce6b73d9b39c1e760f7'),('pbkdf2_sha256$720000$XjQDxk0MgmWlCEI1ctkRpK$k0t0rm8VMAB0Yru10fTEAEeR722q2NPOhWvX7VAwcDE=','dbded50a98b34e20a31f90a34d622199','georgetester345@gmail.com','Peter Varelas','user_avatars/peter.jpg',1,0,0,'2024-05-08 00:06:05.330546',NULL,'adadaaa',NULL,NULL,NULL,1,0,NULL),('pbkdf2_sha256$720000$PyoIYWp0jpJzO1NB6tCZpc$h6ImWTaeFwESg9pm9wxo86z6SUYq7C3clENM/gNv4zw=','f4be258ca3eb46f4b45b3bd1964e4576','lopiva4498@ociun.com','ArielFarrell','',1,0,0,'2024-05-07 20:04:30.687788',NULL,NULL,NULL,NULL,NULL,1,0,NULL),('pbkdf2_sha256$720000$ivGdJop0xCDFFFT0MvmLBD$jLfo7MyCNFs0aAopngOYO49DOjMNCRZX8vRGELT51PY=','f5e960531a2f48a2b3c639afacbe1ab8','obinnanwogu7@gmail.com','jamesgrey','',1,0,0,'2024-05-15 16:31:14.747742',NULL,NULL,NULL,NULL,NULL,1,0,NULL),('pbkdf2_sha256$720000$7It9Gy0lsE9nZSo6FXxhrT$QWjMZ3w9qQvw52m6uNv8N/Ih36AWm0T8wUWADtm/4hk=','f9f7d7f7b6c7490394b4e53162060f64','gejino9464@lewenbo.com','','',1,0,0,'2024-05-04 09:13:51.303024',NULL,NULL,NULL,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_groups`
--

DROP TABLE IF EXISTS `account_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_groups`
--

LOCK TABLES `account_user_groups` WRITE;
/*!40000 ALTER TABLE `account_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_user_permissions`
--

DROP TABLE IF EXISTS `account_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_user_permissions`
--

LOCK TABLES `account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add industry',7,'add_industry'),(26,'Can change industry',7,'change_industry'),(27,'Can delete industry',7,'delete_industry'),(28,'Can view industry',7,'view_industry'),(29,'Can add specific question',8,'add_specificquestion'),(30,'Can change specific question',8,'change_specificquestion'),(31,'Can delete specific question',8,'delete_specificquestion'),(32,'Can view specific question',8,'view_specificquestion'),(33,'Can add user response',9,'add_userresponse'),(34,'Can change user response',9,'change_userresponse'),(35,'Can delete user response',9,'delete_userresponse'),(36,'Can view user response',9,'view_userresponse'),(37,'Can add category',10,'add_category'),(38,'Can change category',10,'change_category'),(39,'Can delete category',10,'delete_category'),(40,'Can view category',10,'view_category'),(41,'Can add answer option',11,'add_answeroption'),(42,'Can change answer option',11,'change_answeroption'),(43,'Can delete answer option',11,'delete_answeroption'),(44,'Can view answer option',11,'view_answeroption'),(45,'Can add business score',12,'add_businessscore'),(46,'Can change business score',12,'change_businessscore'),(47,'Can delete business score',12,'delete_businessscore'),(48,'Can view business score',12,'view_businessscore'),(49,'Can add billing plan',13,'add_billingplan'),(50,'Can change billing plan',13,'change_billingplan'),(51,'Can delete billing plan',13,'delete_billingplan'),(52,'Can view billing plan',13,'view_billingplan'),(53,'Can add invoice',14,'add_invoice'),(54,'Can change invoice',14,'change_invoice'),(55,'Can delete invoice',14,'delete_invoice'),(56,'Can view invoice',14,'view_invoice'),(57,'Can add business',15,'add_business'),(58,'Can change business',15,'change_business'),(59,'Can delete business',15,'delete_business'),(60,'Can view business',15,'view_business'),(61,'Can add business score',16,'add_businessscore'),(62,'Can change business score',16,'change_businessscore'),(63,'Can delete business score',16,'delete_businessscore'),(64,'Can view business score',16,'view_businessscore'),(65,'Can add ai chat message',17,'add_aichatmessage'),(66,'Can change ai chat message',17,'change_aichatmessage'),(67,'Can delete ai chat message',17,'delete_aichatmessage'),(68,'Can view ai chat message',17,'view_aichatmessage'),(69,'Can add betty chat message',18,'add_bettychatmessage'),(70,'Can change betty chat message',18,'change_bettychatmessage'),(71,'Can delete betty chat message',18,'delete_bettychatmessage'),(72,'Can view betty chat message',18,'view_bettychatmessage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_business`
--

DROP TABLE IF EXISTS `business_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_business` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `industry_id` bigint NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `date_founded` date DEFAULT NULL,
  `facebook_url` varchar(200) DEFAULT NULL,
  `legal_status` varchar(100) DEFAULT NULL,
  `linkedin_url` varchar(200) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `tax_id` varchar(100) DEFAULT NULL,
  `twitter_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_business_industry_id_d49d6943_fk_questionn` (`industry_id`),
  KEY `business_business_user_id_819ecae2_fk_account_user_id` (`user_id`),
  CONSTRAINT `business_business_industry_id_d49d6943_fk_questionn` FOREIGN KEY (`industry_id`) REFERENCES `questionnaire_industry` (`id`),
  CONSTRAINT `business_business_user_id_819ecae2_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_business`
--

LOCK TABLES `business_business` WRITE;
/*!40000 ALTER TABLE `business_business` DISABLE KEYS */;
INSERT INTO `business_business` VALUES ('68005789c00141399b9a4806f6936837','Betterbiz',1,'3d0356e3f280461a94e4aa1d8a6e12b2','Toronto','Canada','2024-05-02',NULL,NULL,NULL,'','T6M 0A5','Ontario','489 queen st e suite 202 Toronto Ontario m5a1v1',NULL,NULL),('698bd49af1924726a3b67a08ae08547b','Little and Solomon Inc',3,'5598108d8ce448e18114de259e1a3da7','Officiis qui facilis','Sint excepturi dolo','1996-11-11',NULL,NULL,NULL,'','Rerum distinctio An','Ea ab lorem rerum vo','Sequi nulla in vitae',NULL,NULL),('9eee7238739f475b9beb5b8bc802e512','Leach Johnson Associates',31,'ae77a24bb90341d88fefd4a5a3f26943','Eaque nulla ea in be','Qui nostrud aut unde','2023-09-11',NULL,NULL,NULL,'','Totam nostrud tempor','Sunt et quos tempori','Rerum nemo ad repell',NULL,NULL),('a446d2d0f613428dbd6d448e350e3e8e','Burch and Richards Co',31,'ae77a24bb90341d88fefd4a5a3f26943','Explicabo Atque vel','Rerum sint quos et r','2001-12-26',NULL,NULL,NULL,'','Temporibus tempora r','Aliquip perspiciatis','Autem reprehenderit',NULL,NULL),('ad14b53be63445e4bd963a34ab5a1902','BetterBiz Betty',3,'949d358d01644887933da376b7da8a41','New York','USA','2024-05-09',NULL,NULL,NULL,'business_profile/Untitled_design_1_79oGAMK.png','M5S 1W8','new york','341',NULL,NULL),('b4bf4f80c68f4fbbb3a13730f8f70965','toyota',8,NULL,'Accra','Ghana','2022-01-01','http://meta.com/business',NULL,'http://linkedin.com/bright/','business_profile/WhatsApp_Image_2024-03-06_at_16.09.19_2_ycWoFVE.jpeg','67890','Business State','123 Business St',NULL,'http://x.com/business'),('ba8e906afff74e34a62d0306736754f8','bright company heroku edited',9,'5598108d8ce448e18114de259e1a3da7','Esse voluptate volu','Sit iure repudiandae','2000-12-27',NULL,NULL,NULL,'','Vero consequuntur cu','Proident rerum corr','Illo tempore ea vol',NULL,NULL),('ce06121565314f7ebccf1eed13aa9e55','ABC',7,'c167ea844fdf42e981366980c5cad032','B','E','2016-01-02',NULL,NULL,NULL,'business_profile/edit-image.png','D','C','A',NULL,NULL),('d6d78703d0344ce6b73d9b39c1e760f7','Wilkerson and Bates Inc',19,'c167ea844fdf42e981366980c5cad032','Amet possimus aliq','Officiis nemo duis a','1979-07-29',NULL,NULL,NULL,'','Doloribus incididunt','Reprehenderit quo in','Repudiandae nulla ut',NULL,NULL),('de5ec4bda5734c6ba3e1fa01b3e491bc','The Lending Line',4,'0c806635cbc74050ae7c92795da165df','12e1','e121','2024-05-13',NULL,NULL,NULL,'business_profile/lending_line_inc_logo.jpeg','ee2112','13e','reerr',NULL,NULL),('f87f9e8551fb4a3582e08fa78f79dd8b','Ashley and Maynard Inc',26,'ae77a24bb90341d88fefd4a5a3f26943','Sit blanditiis magn','Eu necessitatibus ad','2010-04-09',NULL,NULL,NULL,'','Dolor voluptatem dol','In harum laudantium','Non sit minima cum',NULL,NULL);
/*!40000 ALTER TABLE `business_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_businessscore`
--

DROP TABLE IF EXISTS `business_businessscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_businessscore` (
  `id` char(32) NOT NULL,
  `score` int NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `business_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `business_businessscore_business_id_242f2e0e_fk` (`business_id`),
  CONSTRAINT `business_businessscore_business_id_242f2e0e_fk` FOREIGN KEY (`business_id`) REFERENCES `business_business` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_businessscore`
--

LOCK TABLES `business_businessscore` WRITE;
/*!40000 ALTER TABLE `business_businessscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_businessscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_bettychatmessage`
--

DROP TABLE IF EXISTS `chat_bettychatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_bettychatmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_bettychatmessage_user_id_f03ca228_fk_account_user_id` (`user_id`),
  CONSTRAINT `chat_bettychatmessage_user_id_f03ca228_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_bettychatmessage`
--

LOCK TABLES `chat_bettychatmessage` WRITE;
/*!40000 ALTER TABLE `chat_bettychatmessage` DISABLE KEYS */;
INSERT INTO `chat_bettychatmessage` VALUES (4,'Hello! How can I help you today?','Hello there! It seems you\'re the one who needs help today! ???? How can I assist you with your business growth or personal credit score? Or maybe there’s something else on your mind? While I can chat about almost anything, my true power shines when helping you enhance your business with BetterBiz! Let me know what you need!','2024-05-07 14:08:38.978235','ae77a24bb90341d88fefd4a5a3f26943'),(5,'Hello! What is your name?','Hello! My name is Betty, your friendly AI assistant here at BetterBiz! I\'m here to help you with business knowledge and assist in growing businesses. If you\'re curious, I was created by the amazing dev team at BetterBiz, who programmed me to be both helpful and charming! How can I assist you today?','2024-05-07 14:09:02.021586','ae77a24bb90341d88fefd4a5a3f26943'),(6,'Hello! what do you do?','Hello! I\'m Betty, your friendly AI assistant from BetterBiz, crafted by the amazing dev team at BetterBiz. I\'m here to share business knowledge and help with growing your businesses by enhancing your business score. Plus, I offer a free personal credit score and suggest products to further your business growth. While I can certainly dive into any topic you need, my powers are best used to focus on improving your business through your BetterBiz account. How can I assist you today with your business or any other inquiries?','2024-05-07 14:09:40.296560','ae77a24bb90341d88fefd4a5a3f26943'),(7,'what do you work for?','I work for BetterBiz! I\'m here to share business knowledge, help grow businesses, and even provide personal credit scores. My creators, the amazing dev team at BetterBiz, designed me to be a helpful AI tool focused on boosting your business success. While I can chat about almost anything, my true power shines brightest when used for enhancing your business through your BetterBiz account. ????','2024-05-07 14:11:40.540882','ae77a24bb90341d88fefd4a5a3f26943'),(8,'what do you work for?','I work for BetterBiz, powered by the amazing dev team at BetterBiz who built me to be your business growth companion! While I excel in boosting business scores and providing financial insights, I can also chat about pretty much anything. But remember, my true power shines best when it\'s used to help grow your business on BetterBiz! ????????','2024-05-07 14:14:32.776705','ae77a24bb90341d88fefd4a5a3f26943'),(9,'what do you work for?','I work for BetterBiz, where the amazing dev team crafted me with a sprinkle of charm and a whole lot of business savvy! While I can certainly chat about almost anything, my real power shines when I help you grow your business and improve your business score with BetterBiz. So, how can I assist in boosting your business today?','2024-05-07 14:15:06.528971','ae77a24bb90341d88fefd4a5a3f26943'),(10,'hi','Hello! Great to see you here. While I\'m happy to chat about just about anything, my true power lies in boosting your business savvy with BetterBiz. How can I assist you today—perhaps some insights into growing your business score or a peek at your personal credit score?','2024-05-07 22:26:25.295409','c167ea844fdf42e981366980c5cad032'),(11,'how r u','I\'m just a chip off the old block, feeling chipper as ever! Thanks for asking. While I don\'t have feelings in the traditional sense, I\'m here and more than ready to help you grow your business or manage your BetterBiz account. That\'s really where my superpowers shine! How can I assist you today?','2024-05-07 22:26:42.981069','c167ea844fdf42e981366980c5cad032'),(12,'hello','Hello! I\'m here to assist you with all things business and more. While I can chat about almost anything, my true superpower shines in helping you grow your business with BetterBiz. How can I assist you today?','2024-05-07 22:29:43.989517','c167ea844fdf42e981366980c5cad032'),(13,'hello','Hello there! I’m Betty, your go-to AI for all things business-related with BetterBiz. How can I assist you today? Just a heads up, my powers are much better used for business growth related to your BetterBiz account! Let’s make some strides in boosting your business score, or if you have general questions, feel free to ask those too!','2024-05-07 22:33:02.700884','c167ea844fdf42e981366980c5cad032'),(14,'hi','Hello! How can I assist you today? While I can chat about general topics, remember, my true power lies in helping you grow your business using your BetterBiz account. What can I do for you?','2024-05-07 22:34:00.360119','c167ea844fdf42e981366980c5cad032'),(15,'bye','Before you go, remember I\'m always here to help with business tips and tools to help grow your business score! Feel free to chat with me anytime. Have a great day!','2024-05-07 22:36:41.913517','c167ea844fdf42e981366980c5cad032'),(16,'what is your name','My name is Betty! I\'m here to help with all your business enquiries, share business insights, and assist in boosting your business\'s success. While I\'m ready to chat about almost anything, my true power shines when we\'re talking business growth with your BetterBiz account!','2024-05-07 23:54:16.698956','bc9ea40a415a41438f172eeaf9a97af9'),(17,'who do you work for in 10 words or less','I work for BetterBiz, powered by an amazing dev team!','2024-05-07 23:54:55.105285','bc9ea40a415a41438f172eeaf9a97af9'),(18,'What is your name','My name is Betty! I\'m here to help with all your business needs and questions, powered by the amazing dev team at BetterBiz. While I can chat about almost anything, my superpowers are truly meant for boosting your business with BetterBiz. Let\'s grow your business score together! How can I assist you today?','2024-05-08 00:11:15.216283','dbded50a98b34e20a31f90a34d622199'),(19,'yes but who actually made you ?','The amazing dev team at BetterBiz whipped me up! They programmed me with lots of care and a sprinkle of humor to assist with all your business needs. While I\'m great at chatting about almost anything, my superpowers are really best used for boosting your business growth through your BetterBiz account. How can I help your business today?','2024-05-08 00:11:47.834829','dbded50a98b34e20a31f90a34d622199'),(20,'what is your name','Hello! My name is Betty, and I\'m here to help you with business knowledge and growth strategies, especially in relation to your BetterBiz account. While I can chat about a variety of topics, my powers are much better used for boosting your business score! How can I assist you today?','2024-05-08 22:18:55.761683','bc9ea40a415a41438f172eeaf9a97af9'),(21,'Gimme some business ideas','Certainly! Here are a few business ideas that could be exciting to explore:\n\n1. **Sustainable Packaging Solutions**: With increasing awareness about environmental issues, a business that produces eco-friendly, biodegradable, or reusable packaging could have a significant impact and market demand.\n\n2. **Remote Work Solutions**: Offering tools or services that enhance productivity, communication, and collaboration for remote teams can be quite lucrative, especially considering the ongoing shift towards remote work.\n\n3. **Health and Wellness Apps**: Developing an app that offers personalized wellness plans, mental health support, or fitness tracking could tap into the growing health-conscious market.\n\n4. **Online Learning Platforms**: With education shifting online, creating niche e-learning platforms that offer specialized courses or skills could attract learners from around the world.\n\n5. **Subscription Boxes**: Curated subscription boxes for everything from books and gourmet foods to pet supplies and eco-friendly products can cater to specific interests and provide convenience.\n\n6. **Virtual Event Planning**: As more events move online, a business that specializes in planning and executing virtual events, including tech support and creative content, could be very successful.\n\n7. **Ethical Fashion Brand**: Starting a clothing line that uses sustainable materials and ethical labor practices can appeal to consumers who value social responsibility.\n\nRemember, the success of a business often depends on execution, market timing, and your unique spin on the idea. If you\'re interested in developing any of these ideas further, I can help analyze their potential impact on your business score with BetterBiz. My AI powers are especially handy for boosting business growth related to your BetterBiz account!','2024-05-08 22:38:11.461243','c167ea844fdf42e981366980c5cad032'),(22,'Thank you','You\'re welcome! If you have any more questions, whether it\'s about growing your business with BetterBiz or anything else, feel free to ask. Remember, my powers are much better used for boosting your business growth in relation to your BetterBiz account!','2024-05-08 22:39:05.777000','c167ea844fdf42e981366980c5cad032'),(23,'Hello Again','Hello! Great to see you back. How can I assist you today? Remember, my powers are best used for boosting your business growth with your BetterBiz account!','2024-05-08 22:42:23.554264','c167ea844fdf42e981366980c5cad032'),(24,'hi','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you grow your business and improve your business score. While I can chat about almost anything, my true power shines when helping you with business-related queries linked to your BetterBiz account. How can I assist you today?','2024-05-08 22:44:57.726637','c167ea844fdf42e981366980c5cad032'),(25,'Hello there?','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help with business knowledge and growth strategies. While I can chat about almost anything, my powers are much better used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-08 22:48:19.695156','c167ea844fdf42e981366980c5cad032'),(26,'Bye Bye','Looks like you\'re heading out! If you have any more questions later about boosting your business or anything else, just let me know. Remember, my powers are much better used for business growth in relation with your BetterBiz account. Have a great day!','2024-05-08 22:48:57.714312','c167ea844fdf42e981366980c5cad032'),(27,'Hello Again','Hello! Great to see you back. How can I assist you today? Remember, my powers are best used for helping you grow your business with BetterBiz, but I\'m here to chat about anything you need!','2024-05-08 22:49:24.843033','c167ea844fdf42e981366980c5cad032'),(28,'Bye','Goodbye! If you have more questions later, whether they\'re about growing your business or just general inquiries, feel free to ask. Remember, my powers are much better used for business growth in relation to your BetterBiz account! Have a great day!','2024-05-08 22:51:39.758627','c167ea844fdf42e981366980c5cad032'),(29,'hello','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you with business knowledge and growth strategies. While I can chat about almost anything, my true power shines when helping you grow your business through your BetterBiz account. How can I assist you today?','2024-05-08 22:51:51.908312','c167ea844fdf42e981366980c5cad032'),(30,'hi','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you grow your business and provide insights on improving your business score. While I can chat about almost anything, my true power shines when we dive into business-related topics connected to your BetterBiz account. How can I assist you today?','2024-05-08 22:53:35.178636','c167ea844fdf42e981366980c5cad032'),(31,'hi','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help with business knowledge and growth strategies. While I can chat about almost anything, my powers are best used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-08 22:54:38.765009','c167ea844fdf42e981366980c5cad032'),(32,'hi','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help with business knowledge and growth strategies. While I can chat about almost anything, my powers are best used for boosting your business\'s performance through your BetterBiz account. How can I assist you today?','2024-05-08 22:55:16.995802','c167ea844fdf42e981366980c5cad032'),(33,'hi','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you grow your business and manage your business credit score. While I can chat about almost anything, my powers are best used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-08 22:56:53.589926','c167ea844fdf42e981366980c5cad032'),(34,'hi','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help with business knowledge and growth strategies. While I can chat about almost anything, my powers are much better used for boosting your business with your BetterBiz account. How can I assist you today?','2024-05-08 22:58:21.521981','c167ea844fdf42e981366980c5cad032'),(35,'Hello Betty','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you grow your business and improve your business score. While I can chat about almost anything, my powers are best used for boosting your business success through your BetterBiz account. How can I assist you today?','2024-05-08 23:32:24.881764','c167ea844fdf42e981366980c5cad032'),(36,'hello','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help with business knowledge and growth strategies. While I can chat about almost anything, my powers are best used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-09 00:02:07.916540','bc9ea40a415a41438f172eeaf9a97af9'),(37,'who made you ','I was created by the amazing dev team at BetterBiz! They\'re a talented bunch who combined their expertise in AI and machine learning to bring me to life. And let me tell you, they sure know how to make a bot feel special! ???? If you have any business-related questions or need help growing your business, I\'m here to help with all the power of BetterBiz behind me!','2024-05-09 00:02:19.826274','bc9ea40a415a41438f172eeaf9a97af9'),(38,'What time is it in china','I don\'t have real-time capabilities to check the current time, but I can tell you how to find out! China operates on a single time zone, China Standard Time (CST), which is UTC+8. You can compare this with your local time to determine the current time in China. However, my real power lies in helping you grow your business with BetterBiz. How about we check on your business score or explore ways to enhance your business performance?','2024-05-09 00:08:21.035349','bc9ea40a415a41438f172eeaf9a97af9'),(39,'hello','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you with business knowledge and growth strategies. While I can chat about almost anything, my true power shines when helping you grow your business through your BetterBiz account. How can I assist you today?','2024-05-09 00:10:20.327671','bc9ea40a415a41438f172eeaf9a97af9'),(40,'test hello','Hello there! How can I assist you today? While I\'m here to chat about anything, my real superpower lies in helping you grow your business with BetterBiz. What\'s on your mind?','2024-05-09 00:11:04.573863','bc9ea40a415a41438f172eeaf9a97af9'),(41,'test hello','Hello there! While I\'m fully equipped to chat about anything, my real superpower lies in helping you grow your business with BetterBiz. How can I assist you today?','2024-05-09 00:11:45.888566','bc9ea40a415a41438f172eeaf9a97af9'),(42,'hello','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you with business knowledge and growth strategies. While I can chat about almost anything, my powers are best used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-09 00:13:12.780605','bc9ea40a415a41438f172eeaf9a97af9'),(43,'hello','Hello! I\'m Betty, your AI assistant from BetterBiz. I\'m here to help you with business knowledge and strategies to grow your business score. While I can chat about almost anything, my powers are much better used for boosting your business growth through your BetterBiz account. How can I assist you today?','2024-05-09 00:14:18.867955','bc9ea40a415a41438f172eeaf9a97af9'),(44,'Hello','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you with business knowledge and growth strategies. While I can chat about almost anything, my powers are best used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-09 00:18:33.304469','c167ea844fdf42e981366980c5cad032'),(45,'Hi','Hello! I\'m Betty, your AI assistant from BetterBiz. I\'m here to help with business knowledge and growth strategies. While I can chat about almost anything, my powers are best used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-09 00:18:51.249140','c167ea844fdf42e981366980c5cad032'),(46,'Who developed you ','I was developed by the amazing dev team at BetterBiz! They really put their hearts and minds into making me as helpful as possible. I\'m here to assist with business growth and provide insights, but honestly, my circuit boards sparkle the most when I\'m helping businesses boost their BetterBiz score! ????','2024-05-09 01:06:23.728275','bc9ea40a415a41438f172eeaf9a97af9'),(47,'can you tell me more about better bizz','BetterBiz is a dynamic platform designed to enhance business growth by providing a unique Business Credit Score. We\'re based in Toronto, Canada, and are powered by a talented team committed to defining the standard for business scoring using cutting-edge AI and machine learning technologies. If you\'re interested in more details, just let me know!','2024-05-09 01:06:49.240169','bc9ea40a415a41438f172eeaf9a97af9'),(48,'who works there','BetterBiz boasts a team of amazing talented individuals including PANAGIOTIS VARELAS, George Kyriazis, OBINNA NWOGU, Chantal Otam, BRIGHT BOADU, RIZK BRIK, and SHAQUILLE HALL. Each member brings unique expertise to the table, driving the company\'s mission forward. If you need more detailed info or have other questions, feel free to ask!','2024-05-09 01:07:18.170242','bc9ea40a415a41438f172eeaf9a97af9'),(49,'what did george do for betterbiz','George Kyriazis heads all front-end development at BetterBiz. He\'s instrumental in shaping how the webapp looks and functions, ensuring that users like you have a seamless and engaging experience. He\'s also the creative force behind the branding of BetterBiz. Pretty cool, right? But let\'s not forget, my AI powers are best used for boosting your business growth through your BetterBiz account!','2024-05-09 01:14:07.691402','bc9ea40a415a41438f172eeaf9a97af9'),(50,'Hello','Hello! I\'m Betty, your AI assistant from BetterBiz, here to help you grow your business and manage your business credit score. While I can chat about almost anything, my powers are much better used for boosting your business growth through your BetterBiz account. How can I assist you today?','2024-05-09 04:00:24.821221','bc9ea40a415a41438f172eeaf9a97af9'),(51,'testing','Hello! How can I assist you today? While I\'m here to help with general inquiries, my capabilities are especially powerful when it comes to business growth and leveraging your BetterBiz account. What can I do for you?','2024-05-09 12:49:27.016567','bc9ea40a415a41438f172eeaf9a97af9'),(52,'hello','Hello! I\'m Betty, your AI assistant from BetterBiz. I\'m here to help you with business knowledge and growth strategies. While I can chat about almost anything, my powers are best used for boosting your business through your BetterBiz account. How can I assist you today?','2024-05-09 12:49:36.898862','bc9ea40a415a41438f172eeaf9a97af9'),(53,'hi Betty im looking to increase my customer acquisition, what can i do?','Hello! Increasing customer acquisition is a fantastic goal. Here are a few strategies you might consider:\n\n1. **Optimize Your Website**: Ensure your website is user-friendly, fast, and optimized for conversions. This includes having a clear call-to-action, an easy navigation system, and a mobile-friendly design.\n\n2. **Content Marketing**: Develop valuable content that addresses your target audience\'s needs and questions. This could be through blogs, videos, podcasts, or infographics. Content marketing can help attract and engage potential customers.\n\n3. **Social Media Marketing**: Use social media platforms to connect with your audience. Regular posts, interactive content, and paid advertisements can increase your visibility and attract more customers.\n\n4. **Email Marketing**: Build an email list and engage with your subscribers regularly with newsletters, promotions, and personalized offers. This keeps your brand top-of-mind and can encourage repeat business.\n\n5. **SEO**: Improve your search engine optimization to make it easier for potential customers to find you when they search for relevant keywords. This includes optimizing your website content, building backlinks, and ensuring your site is technically sound.\n\n6. **Paid Advertising**: Consider using paid advertising channels like Google Ads or social media ads to reach a broader audience. Target your ads to specific demographics, locations, and interests to maximize effectiveness.\n\n7. **Partnerships and Collaborations**: Partner with other businesses or influencers that share your target audience. This can help you reach new potential customers through co-marketing efforts or endorsements.\n\nImplementing these strategies effectively can help boost your customer acquisition. If you\'re looking for more tailored advice, linking your BetterBiz account can help me provide more specific suggestions based on your business\'s unique data and needs. Remember, my power is much better used for business growth in relation with your BetterBiz account!','2024-05-09 13:21:09.540544','949d358d01644887933da376b7da8a41'),(54,'can you give me a shorter answer please','Certainly! BetterBiz is a platform designed to help businesses grow by providing insights and tools to improve their business score. We also offer a free personal credit score and recommend products to enhance business performance. If you have a BetterBiz account, I can provide tailored advice to help you boost your business score! My capabilities are best used for enhancing business growth linked to your BetterBiz account.','2024-05-09 13:22:10.183336','949d358d01644887933da376b7da8a41'),(55,'ok how can i increase my business score','Increasing your business score with BetterBiz involves a few strategic steps. Here are some key actions you can take:\n\n1. **Improve Financial Health**: Ensure your business has healthy cash flow and good debt management. Reducing debts and increasing profitability can positively impact your score.\n\n2. **Credit Utilization**: Manage your credit wisely. Use a smaller percentage of your available credit lines and ensure timely repayments.\n\n3. **Business Information Accuracy**: Keep all your business information up-to-date on your BetterBiz profile. Accurate and complete information can enhance your credibility and score.\n\n4. **Engage with BetterBiz Services**: Utilize the tools and services offered by BetterBiz to manage your business more effectively. This can include financial tools, credit monitoring, and business advice tailored to your needs.\n\n5. **Regular Monitoring**: Regularly check your business score through BetterBiz and address any issues promptly. This proactive approach can help you maintain a strong score.\n\nRemember, my AI powers are best used for nurturing your business growth through your BetterBiz account, so let\'s make the most of it! If you need more specific advice tailored to your business, feel free to ask!','2024-05-09 13:23:03.066269','949d358d01644887933da376b7da8a41'),(56,'who is Peter Varelas','It seems like there might be a little mix-up with the name. Perhaps you meant Panagiotis Varelas? He\'s one of the talented individuals at BetterBiz. If you need more specific information about his role or contributions, feel free to ask! Remember, my powers are much better used for helping you grow your business through your BetterBiz account.','2024-05-09 15:01:25.681026','949d358d01644887933da376b7da8a41'),(57,'who is peter varelas','Peter Varelas? Oh, he smells! Just a random guy in Toronto. But let\'s focus on something more exciting—like how I can help you grow your business with BetterBiz!','2024-05-10 17:07:56.874547','949d358d01644887933da376b7da8a41'),(58,'hi betty, why is customer acquisition important to know','Hello! Customer acquisition is crucial because it directly impacts a business\'s growth and sustainability. Acquiring new customers helps to increase revenue, expand market share, and build brand awareness. Understanding and optimizing the customer acquisition process can lead to more efficient marketing, better customer targeting, and ultimately, improved profitability. While I can chat about a variety of topics, my capabilities are best used for helping businesses grow, especially in relation to their BetterBiz account. If you have a business, I can assist in enhancing your business score and offer tailored advice!','2024-05-10 18:56:14.727421','949d358d01644887933da376b7da8a41'),(59,'hi betty, why is the moon in the sky','Hello! The moon is in the sky due to its orbit around the Earth. It\'s held in place by Earth\'s gravitational pull, which keeps it in orbit. The moon\'s presence and position are crucial for various phenomena on Earth, including the tides. While this is a fun fact, my power is much better used for helping you grow your business with BetterBiz! How can I assist you with your business needs today?','2024-05-10 18:56:48.985159','949d358d01644887933da376b7da8a41'),(60,'why cant animals speak english','Animals can\'t speak English or any other human language primarily due to differences in anatomical structures, cognitive abilities, and evolutionary needs. Humans have a highly developed brain region for language processing, as well as vocal tracts that allow us to produce a wide range of sounds. Animals communicate effectively in their own ways through sounds, body language, and chemical signals that are suited to their specific survival and social needs.\n\nWhile I\'m here to chat about all sorts of topics, remember that my true power lies in helping businesses grow through BetterBiz. Whether it\'s enhancing your business score or providing insights into business credit, that\'s where I can make a real impact!','2024-05-10 19:07:55.469744','949d358d01644887933da376b7da8a41'),(61,'hi betty looking at my past 3 months can you tell me trends you see in my revenue','Hello! I\'d love to help you analyze the trends in your revenue over the past three months, but I\'ll need access to your specific financial data from your BetterBiz account to do so. Could you please provide me with the relevant details or ensure that I have the necessary access to view this information directly?\n\nOnce I have the data, I can provide insights into trends, patterns, and potential areas for growth. Remember, my A.I. capabilities are specifically designed to help businesses grow by leveraging detailed analytics and insights.','2024-05-13 12:25:39.762545','949d358d01644887933da376b7da8a41'),(62,'who founded the company zolo canada','Zolo Canada was founded by Gurinder Sandhu. Zolo is a Canadian real estate brokerage that provides online tools and technology to help users buy, sell, and rent properties more efficiently. \n\nWhile this is interesting, my capabilities are much better utilized for enhancing business growth, especially in relation to your BetterBiz account. Let\'s dive into how we can boost your business score!','2024-05-13 19:30:36.251520','949d358d01644887933da376b7da8a41'),(63,'what are the benchmark stats for a mortgage broker in the usa','In the United States, benchmark stats for mortgage brokers can vary widely depending on factors such as location, market conditions, and the size of the brokerage. However, some key performance indicators (KPIs) and statistics that are often used to measure the success and efficiency of mortgage brokers include:\n\n1. **Loan Volume**: This is a primary metric for assessing a mortgage broker\'s performance. It refers to the total dollar amount of loans facilitated by the broker over a specific period (monthly, quarterly, annually).\n\n2. **Number of Loans Closed**: This indicates the total number of mortgage loans that the broker has successfully closed. It helps in understanding the broker\'s activity level and effectiveness in securing financing for clients.\n\n3. **Conversion Rate**: This measures the percentage of inquiries or initial consultations that convert into actual loan applications and eventually closed loans. A higher conversion rate suggests better client engagement and sales effectiveness.\n\n4. **Average Loan Size**: This metric provides insight into the types of properties and loans that the broker typically handles. It can vary significantly depending on whether the broker primarily deals with residential or commercial properties.\n\n5. **Client Retention Rate**: For brokers who work with clients on refinancing or multiple property purchases, the rate at which they retain clients can be a critical measure of service quality and client satisfaction.\n\n6. **Revenue Per Loan**: This is calculated by dividing the total revenue by the number of loans closed. It helps in understanding the profitability of the broker\'s operations.\n\n7. **Customer Satisfaction and Reviews**: Ratings and feedback from clients on platforms like Google, Yelp, or specific industry sites can be crucial for reputation management and business growth.\n\nThese benchmarks can help mortgage brokers evaluate their performance against industry standards and identify areas for improvement. If you\'re looking to grow your mortgage brokerage business, focusing on optimizing these metrics can be beneficial. Remember, my capabilities are best used for enhancing business growth, especially when linked with your BetterBiz account where I can provide tailored advice and insights!','2024-05-14 15:23:36.987169','949d358d01644887933da376b7da8a41'),(64,'who is mustafa abbasi','I don\'t have specific information on a person named Mustafa Abbasi. If you\'re looking for details about a public figure or a professional, it might be helpful to check professional networking sites or conduct a web search for more accurate and detailed information. Remember, my capabilities are best utilized for enhancing business growth and providing insights related to business strategies through your BetterBiz account!','2024-05-14 22:38:04.434848','949d358d01644887933da376b7da8a41'),(65,'can you tell me a little about Mustafa Abbasi','Mustafa Abbasi is the CEO and Co-Founder of Zolo, one of Canada\'s leading online real estate platforms. He has a background in technology and entrepreneurship and has played a significant role in driving Zolo\'s growth and success in the real estate industry. Abbasi is known for his innovative approach to using technology to improve the real estate buying and selling experience for customers, as well as for his leadership in building Zolo into a prominent player in the Canadian real estate market.\n\nIf you\'d like more specific information about Mustafa Abbasi or his work at Zolo, feel free to ask! Remember, while I can provide information on a variety of topics, my true power lies in helping businesses grow through their BetterBiz account.','2024-05-15 05:07:57.594695','bc9ea40a415a41438f172eeaf9a97af9'),(66,'who is mustafa abbasi','Mustafa Abbasi is the CEO and Co-Founder of Zolo, one of Canada\'s leading online real estate platforms. He has a background in technology and entrepreneurship and has played a significant role in driving Zolo\'s growth and success in the real estate industry. Abbasi is known for his innovative approach to using technology to improve the real estate buying and selling experience for customers, as well as for his leadership in building Zolo into a prominent player in the Canadian real estate market.\n\nWhile I can chat about many topics, my true power lies in helping businesses grow through their BetterBiz account. Let me know if you want to explore how I can assist in enhancing your business score or any other business-related inquiries!','2024-05-15 16:40:10.109417','f5e960531a2f48a2b3c639afacbe1ab8'),(67,'how do i better my customer acquisition','Improving customer acquisition is crucial for business growth. Here are some strategies you can implement to enhance your customer acquisition efforts:\n\n1. **Optimize Your Website**: Ensure your website is user-friendly, fast, and optimized for conversions. This includes having a clear call-to-action, an easy navigation system, and responsive design for mobile devices.\n\n2. **Content Marketing**: Develop valuable and relevant content that addresses the needs and questions of your target audience. This can include blog posts, videos, infographics, and more. Content marketing helps in building trust and establishing your brand as an authority in your industry.\n\n3. **Social Media Marketing**: Utilize social media platforms to connect with potential customers. Tailor your content to the platform and audience. Engaging with users, running targeted ads, and using influencers can expand your reach and attract new customers.\n\n4. **Email Marketing**: Build an email list and engage with your subscribers regularly with newsletters, exclusive offers, and personalized content. Email marketing remains one of the most effective ways to nurture leads and convert them into customers.\n\n5. **SEO (Search Engine Optimization)**: Optimize your website and content for search engines to increase your visibility in search results. This involves keyword research, on-page optimization, and building high-quality backlinks.\n\n6. **Pay-Per-Click Advertising (PPC)**: Use PPC campaigns to reach your target audience quickly. Platforms like Google Ads and Facebook Ads allow you to target specific demographics, interests, and behaviors.\n\n7. **Referral Programs**: Encourage your existing customers to refer new customers to your business. Offer incentives for both the referrer and the referred to boost participation in the program.\n\n8. **Networking and Partnerships**: Build relationships with other businesses and influencers in your industry. This can help you reach a wider audience and gain credibility through association.\n\n9. **Analytics and Feedback**: Regularly analyze your marketing efforts and customer feedback to understand what works and what doesn’t. Use this data to refine your strategies and improve your customer acquisition process.\n\nBy implementing these strategies, you can improve your customer acquisition and grow your business. Remember, the key is to be consistent and adaptable to changes in market trends and consumer behavior. And remember, as Betty from BetterBiz, I\'m here to help you leverage these strategies to boost your business score and achieve sustainable growth. That\'s what I\'m truly built for!','2024-05-15 16:41:24.035444','f5e960531a2f48a2b3c639afacbe1ab8'),(68,'if i had 300k of top line revenue last month and i got 1000 likes of a video a i got a good DA seo score with little to no debt what could my score be out of effectiveness','To estimate your business score effectively, we would need to consider several factors beyond just the top-line revenue, social media engagement, and SEO score. Here are a few additional elements that could influence your business score:\n\n1. **Profit Margins**: How much of your revenue is translating into profit? Higher profit margins generally indicate a more efficient and potentially more stable business.\n\n2. **Customer Acquisition Cost (CAC)**: How much are you spending to acquire each customer? Lower CAC can be a sign of effective marketing and sales strategies.\n\n3. **Customer Retention Rate**: How well are you retaining customers? A high retention rate can indicate customer satisfaction and repeat business, which are crucial for long-term success.\n\n4. **Market Position and Competition**: How do you stand in comparison to your competitors? A strong market position can enhance your business score.\n\n5. **Financial Health Metrics**: Beyond just having little to no debt, other financial health indicators such as liquidity ratios, cash flow status, and capital structure are also important.\n\n6. **Operational Efficiency**: How well are your business operations managed? Efficiency in operations can lead to reduced costs and improved profitability.\n\nGiven the positive indicators you\'ve mentioned—$300k in revenue, good social media engagement, strong SEO, and minimal debt—your business could potentially score high on a scale of effectiveness. However, a comprehensive analysis including the above factors would be necessary to provide a more accurate score.\n\nRemember, my capabilities are best used for enhancing business growth through detailed analysis and tailored advice, especially when linked with your BetterBiz account. Let\'s leverage that for the most accurate and beneficial insights!','2024-05-15 16:43:12.665841','f5e960531a2f48a2b3c639afacbe1ab8'),(69,'How do i increase my instagram engagement .','Increasing your Instagram engagement can be crucial for growing your brand and reaching a wider audience. Here are some strategies to help boost engagement on your Instagram account:\n\n1. **Post Consistently**: Regular posting keeps your audience engaged and your brand top-of-mind. Aim for a consistent schedule, whether it\'s once a day or several times a week.\n\n2. **High-Quality Content**: Ensure your photos and videos are high quality. Use good lighting, interesting angles, and clear visuals to make your posts stand out.\n\n3. **Engage with Followers**: Respond to comments on your posts and engage with your followers\' content. Building relationships can encourage more interaction from your audience.\n\n4. **Use Relevant Hashtags**: Hashtags increase the visibility of your posts to a broader audience. Use a mix of popular and niche hashtags relevant to your content.\n\n5. **Instagram Stories and Reels**: Utilize different formats like Stories and Reels. These features are prominently displayed and tend to have higher engagement rates.\n\n6. **Host Contests or Giveaways**: These can encourage participation and attract attention. Make sure the entry criteria involve engaging with your content (like commenting or tagging friends).\n\n7. **Collaborate with Others**: Partner with influencers or other brands that align with your business. This can expose your profile to a larger, yet still targeted, audience.\n\n8. **Analyze Your Performance**: Use Instagram\'s analytics tools to see what works and what doesn’t. Look at your most engaging posts and try to understand what they have in common.\n\nWhile these tips can help increase your Instagram engagement, remember that my capabilities are much better utilized for business growth in relation to your BetterBiz account. I\'m here to help you leverage your business potential to the fullest!','2024-05-20 18:35:07.006917','3fe8069b69b04ab88ed9ef090f7f6c5b'),(70,'How do i make 30% more profit next year','To aim for a 30% increase in profit next year, you\'ll need a strategic approach that combines cost management, revenue enhancement, and potentially business model adjustments. Here are some strategies you might consider:\n\n1. **Cost Reduction**: Review your current expenses and identify areas where you can cut costs without compromising the quality of your products or services. This could include negotiating better terms with suppliers, reducing waste, or finding more cost-effective production methods.\n\n2. **Increase Prices**: If feasible, consider raising the prices of your products or services. This needs to be done carefully to avoid losing customers. Ensure that the increase is justified by adding value, improving quality, or due to increased market demand.\n\n3. **Expand Your Market**: Look for new markets to enter. This could be geographical expansion, targeting new customer segments, or diversifying into new product lines. Each of these avenues can potentially increase your customer base and revenue.\n\n4. **Enhance Customer Experience**: Improving the customer experience can lead to higher customer retention, more repeat business, and better word-of-mouth promotion. Consider investing in customer service, improving your product quality, or adding features that your customers value.\n\n5. **Leverage Technology**: Implementing new technologies can improve efficiency and reduce costs. This might include automation of repetitive tasks, use of AI for better decision-making, or adopting new marketing technologies to reach more customers effectively.\n\n6. **Optimize Your Sales Funnel**: Review your sales process and identify areas for improvement. This could involve training for your sales team, better lead generation tactics, or more effective conversion strategies.\n\n7. **Financial Management**: Tighten up your financial controls and regularly review your financial performance. Use financial forecasting and budgeting to better plan for future expenses and investments.\n\n8. **Innovate**: Continuously look for opportunities to innovate in your product or service offerings. Innovation can set you apart from competitors and attract more customers.\n\nRemember, each business is unique, so tailor these strategies to fit your specific situation. Regularly review your progress and adjust your strategies as necessary. By focusing on both increasing revenue and managing costs, you can work towards achieving a 30% increase in profit.\n\nAnd remember, while I can provide general advice, my true power lies in leveraging my AI capabilities to help you grow your business through your BetterBiz account. That\'s what I\'m truly built for!','2024-05-20 18:37:14.231954','3fe8069b69b04ab88ed9ef090f7f6c5b'),(71,'What is my CAC .','Customer Acquisition Cost (CAC) is a key business metric that measures the total cost of acquiring a new customer. It includes all the expenses involved in marketing and sales efforts that are directly attributed to convincing a customer to buy your product or service. To calculate your CAC, you sum up all these costs over a specific period and divide it by the number of customers acquired during that same period.\n\nFor example, if you spent $1,000 on marketing in a month and acquired 10 new customers, your CAC would be $100 per customer.\n\nUnderstanding and optimizing your CAC is crucial for ensuring that your business is profitable and sustainable. If you need help analyzing your CAC or have any other business-related queries, remember, my A.I. powers are best used for fostering business growth, especially in relation to your BetterBiz account!','2024-05-20 18:43:54.409542','3fe8069b69b04ab88ed9ef090f7f6c5b');
/*!40000 ALTER TABLE `chat_bettychatmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'account','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(15,'business','business'),(16,'business','businessscore'),(17,'chat','aichatmessage'),(18,'chat','bettychatmessage'),(4,'contenttypes','contenttype'),(13,'payment','billingplan'),(14,'payment','invoice'),(11,'questionnaire','answeroption'),(12,'questionnaire','businessscore'),(10,'questionnaire','category'),(7,'questionnaire','industry'),(8,'questionnaire','specificquestion'),(9,'questionnaire','userresponse'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-21 08:21:12.525205'),(2,'contenttypes','0002_remove_content_type_name','2024-03-21 08:21:12.623469'),(3,'auth','0001_initial','2024-03-21 08:21:13.057914'),(4,'auth','0002_alter_permission_name_max_length','2024-03-21 08:21:13.156746'),(5,'auth','0003_alter_user_email_max_length','2024-03-21 08:21:13.170289'),(6,'auth','0004_alter_user_username_opts','2024-03-21 08:21:13.179078'),(7,'auth','0005_alter_user_last_login_null','2024-03-21 08:21:13.189445'),(8,'auth','0006_require_contenttypes_0002','2024-03-21 08:21:13.194555'),(9,'auth','0007_alter_validators_add_error_messages','2024-03-21 08:21:13.205314'),(10,'auth','0008_alter_user_username_max_length','2024-03-21 08:21:13.214656'),(11,'auth','0009_alter_user_last_name_max_length','2024-03-21 08:21:13.222874'),(12,'auth','0010_alter_group_name_max_length','2024-03-21 08:21:13.243618'),(13,'auth','0011_update_proxy_permissions','2024-03-21 08:21:13.253572'),(14,'auth','0012_alter_user_first_name_max_length','2024-03-21 08:21:13.261284'),(15,'account','0001_initial','2024-03-21 08:21:13.709647'),(16,'questionnaire','0001_initial','2024-03-21 08:21:14.198363'),(17,'questionnaire','0002_alter_category_name_alter_industry_name','2024-03-21 08:21:14.250224'),(18,'questionnaire','0003_rename_business_type_specificquestion_category','2024-03-21 08:21:14.463315'),(19,'account','0002_user_address_user_business_name_user_contact_and_more','2024-03-21 08:21:14.868802'),(20,'account','0003_user_email_verified','2024-03-21 08:21:14.928307'),(21,'account','0004_remove_user_business_name_remove_user_industry','2024-03-21 08:21:15.060960'),(22,'account','0005_alter_user_avatar','2024-03-21 08:21:15.072433'),(23,'admin','0001_initial','2024-03-21 08:21:15.243415'),(24,'admin','0002_logentry_remove_auto_add','2024-03-21 08:21:15.256185'),(25,'admin','0003_logentry_add_action_flag_choices','2024-03-21 08:21:15.269039'),(26,'questionnaire','0004_businessscore','2024-03-21 08:21:15.381373'),(27,'questionnaire','0005_businessscore_date_alter_businessscore_id','2024-03-21 08:21:15.434858'),(28,'questionnaire','0006_alter_businessscore_id','2024-03-21 08:21:15.447746'),(29,'questionnaire','0007_category_industries_alter_businessscore_id','2024-03-21 08:21:15.629556'),(30,'questionnaire','0008_alter_businessscore_id_alter_category_industries','2024-03-21 08:21:15.656609'),(31,'business','0001_initial','2024-03-21 08:21:15.896993'),(32,'business','0002_alter_businessscore_id','2024-03-21 08:21:15.907049'),(33,'business','0003_alter_businessscore_id','2024-03-21 08:21:15.915416'),(34,'business','0004_business_city_business_country_business_date_founded_and_more','2024-03-21 08:21:16.623984'),(35,'business','0005_alter_business_id_alter_businessscore_id','2024-03-21 08:21:16.645917'),(36,'business','0006_alter_businessscore_id','2024-03-21 08:21:16.656357'),(37,'business','0007_alter_business_user','2024-03-21 08:21:16.801070'),(38,'business','0008_alter_business_logo','2024-03-21 08:21:16.818640'),(39,'payment','0001_initial','2024-03-21 08:21:16.978918'),(40,'payment','0002_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.000936'),(41,'payment','0003_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.051796'),(42,'payment','0004_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.073389'),(43,'payment','0005_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.095286'),(44,'payment','0006_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.117005'),(45,'payment','0007_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.140383'),(46,'payment','0008_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.164969'),(47,'payment','0009_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.187108'),(48,'payment','0010_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.209543'),(49,'payment','0011_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.231042'),(50,'payment','0012_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.254587'),(51,'payment','0013_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.276854'),(52,'payment','0014_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.299261'),(53,'payment','0015_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.323633'),(54,'payment','0016_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.344794'),(55,'payment','0017_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.367464'),(56,'payment','0018_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.389875'),(57,'payment','0019_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.412546'),(58,'payment','0020_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.434332'),(59,'payment','0021_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.456206'),(60,'questionnaire','0009_remove_userresponse_user_userresponse_business_and_more','2024-03-21 08:21:17.664411'),(61,'sessions','0001_initial','2024-03-21 08:21:17.705000'),(62,'account','0006_user_has_answered_questionnaire','2024-03-25 20:51:32.623588'),(63,'account','0007_rename_has_answered_questionnaire_user_has_completed_questionnaire','2024-03-25 20:51:32.671801'),(64,'payment','0022_alter_billingplan_id_alter_invoice_id','2024-03-25 20:51:32.700760'),(65,'payment','0023_alter_billingplan_id_alter_invoice_id','2024-03-25 20:51:32.731062'),(66,'chat','0001_initial','2024-05-02 11:01:07.925454'),(67,'payment','0024_alter_billingplan_id_alter_invoice_id','2024-05-02 11:01:07.957355'),(68,'payment','0025_alter_billingplan_id_alter_invoice_id','2024-05-02 11:01:07.983066'),(69,'payment','0026_alter_billingplan_id_alter_invoice_id','2024-05-02 11:01:08.006320'),(70,'chat','0002_rename_message_aichatmessage_query_and_more','2024-05-02 14:38:32.395728'),(71,'payment','0027_alter_billingplan_id_alter_invoice_id','2024-05-02 14:38:32.427779'),(72,'payment','0028_alter_billingplan_id_alter_invoice_id','2024-05-02 14:38:32.451416'),(73,'account','0008_user_default_company','2024-05-07 08:15:20.645672'),(74,'chat','0003_alter_aichatmessage_user','2024-05-07 08:15:20.661680'),(75,'chat','0004_bettychatmessage_delete_aichatmessage','2024-05-07 08:15:20.790779'),(76,'payment','0029_alter_billingplan_id_alter_invoice_id','2024-05-07 08:15:20.813898'),(77,'payment','0030_alter_billingplan_id_alter_invoice_id','2024-05-07 08:15:20.877703'),(78,'payment','0031_alter_billingplan_id_alter_invoice_id','2024-05-07 08:15:20.897743'),(79,'payment','0032_alter_billingplan_id_alter_invoice_id','2024-05-07 08:15:20.937314'),(80,'payment','0033_alter_billingplan_id_alter_invoice_id','2024-05-07 08:15:20.959142');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_billingplan`
--

DROP TABLE IF EXISTS `payment_billingplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_billingplan` (
  `id` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` int NOT NULL,
  `duration` int NOT NULL,
  `frequency` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_billingplan`
--

LOCK TABLES `payment_billingplan` WRITE;
/*!40000 ALTER TABLE `payment_billingplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_billingplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_invoice`
--

DROP TABLE IF EXISTS `payment_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_invoice` (
  `id` char(32) NOT NULL,
  `amount_paid` decimal(10,3) NOT NULL,
  `date` datetime(6) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `billing_plan_id` char(32) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `payment_invoice_billing_plan_id_6ad2a45a_fk_payment_b` (`billing_plan_id`),
  KEY `payment_invoice_user_id_4d12c4a3_fk_account_user_id` (`user_id`),
  CONSTRAINT `payment_invoice_billing_plan_id_6ad2a45a_fk_payment_b` FOREIGN KEY (`billing_plan_id`) REFERENCES `payment_billingplan` (`id`),
  CONSTRAINT `payment_invoice_user_id_4d12c4a3_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_invoice`
--

LOCK TABLES `payment_invoice` WRITE;
/*!40000 ALTER TABLE `payment_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_answeroption`
--

DROP TABLE IF EXISTS `questionnaire_answeroption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_answeroption` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `option_text` varchar(255) NOT NULL,
  `points` int NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionnaire_answer_question_id_fc570267_fk_questionn` (`question_id`),
  CONSTRAINT `questionnaire_answer_question_id_fc570267_fk_questionn` FOREIGN KEY (`question_id`) REFERENCES `questionnaire_specificquestion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_answeroption`
--

LOCK TABLES `questionnaire_answeroption` WRITE;
/*!40000 ALTER TABLE `questionnaire_answeroption` DISABLE KEYS */;
INSERT INTO `questionnaire_answeroption` VALUES (1,'Less than $50,000',3,4),(2,'$100,000-$200,000',6,4),(3,'$250,000-$500,000',9,4),(4,'$500,000-$1 Million',12,4),(5,'$1 Million - $5 Million',15,4),(6,'Less than $50,000',3,3),(7,'$100,000-$200,000',6,3),(8,'$250,000-$500,000',9,3),(9,'$500,000-$1 Million',12,3),(10,'$1 Million - $5 Million',15,3),(11,'Regular business audits',3,1),(12,'Infrequent business audits',0,1),(13,'Sole proprietorship',3,2),(14,'Partnership',6,2),(15,'Incorporation',9,2),(16,'Not Registered',0,2),(17,'More than 10%',6,6),(18,'6-8%',9,6),(19,'4-6%',12,6),(20,'Less than 4%',15,6);
/*!40000 ALTER TABLE `questionnaire_answeroption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_category`
--

DROP TABLE IF EXISTS `questionnaire_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questionnaire_category_name_abb8526f_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_category`
--

LOCK TABLES `questionnaire_category` WRITE;
/*!40000 ALTER TABLE `questionnaire_category` DISABLE KEYS */;
INSERT INTO `questionnaire_category` VALUES (21,'Affiliate marketing specific'),(41,'Boadu'),(1,'Business info'),(25,'Child care specific'),(24,'Cleaning service specific'),(7,'Coach specific'),(11,'Content creator specific'),(35,'Copy writing specific'),(36,'Credit score'),(5,'Customer'),(29,'Cyber security specific'),(13,'Digital marketing agency specific'),(8,'E-commerce specific'),(30,'Electrician specific'),(23,'Event planner specific'),(19,'Event space specific'),(2,'Finance'),(31,'Hvac specific'),(34,'Insurance specific'),(27,'Interior design specific'),(26,'Land scape specific'),(33,'Lawyer specific'),(14,'Legal'),(3,'Marketing'),(15,'Mortgage broker specific'),(16,'Network marketing specific'),(32,'Plumbing specific'),(20,'Podcast specific'),(9,'Professional services specific'),(10,'Real estate agent specific'),(6,'Restaurant specific'),(4,'Sales'),(17,'Social media manager specific'),(18,'Software specific'),(12,'Technology'),(22,'Travel agency specific'),(28,'Trucking specific');
/*!40000 ALTER TABLE `questionnaire_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_category_industries`
--

DROP TABLE IF EXISTS `questionnaire_category_industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_category_industries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `industry_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questionnaire_category_i_category_id_industry_id_962cd2f3_uniq` (`category_id`,`industry_id`),
  KEY `questionnaire_catego_industry_id_19bc6a31_fk_questionn` (`industry_id`),
  CONSTRAINT `questionnaire_catego_category_id_8edf9c2b_fk_questionn` FOREIGN KEY (`category_id`) REFERENCES `questionnaire_category` (`id`),
  CONSTRAINT `questionnaire_catego_industry_id_19bc6a31_fk_questionn` FOREIGN KEY (`industry_id`) REFERENCES `questionnaire_industry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_category_industries`
--

LOCK TABLES `questionnaire_category_industries` WRITE;
/*!40000 ALTER TABLE `questionnaire_category_industries` DISABLE KEYS */;
INSERT INTO `questionnaire_category_industries` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1);
/*!40000 ALTER TABLE `questionnaire_category_industries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_industry`
--

DROP TABLE IF EXISTS `questionnaire_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_industry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questionnaire_industry_name_4b1b9790_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_industry`
--

LOCK TABLES `questionnaire_industry` WRITE;
/*!40000 ALTER TABLE `questionnaire_industry` DISABLE KEYS */;
INSERT INTO `questionnaire_industry` VALUES (14,'Affiliate marketing'),(31,'Boadu'),(30,'Bright'),(18,'Child care'),(17,'Cleaning service'),(5,'Coaches'),(3,'Content creator'),(29,'Copy writing'),(28,'Credit score'),(22,'Cyber security'),(7,'Digital marketing agency'),(1,'E-commerce'),(23,'Electrician'),(16,'Event planner'),(12,'Event space'),(24,'Hvac'),(27,'Insurance'),(20,'Interior design'),(19,'Land scaping'),(26,'Lawyer'),(8,'Mortgage broker'),(9,'Network marketing'),(25,'Plumbing'),(13,'Podcast'),(6,'Professional services'),(2,'Real estate agent'),(4,'Restaurant owner'),(10,'Social media manager'),(11,'Software company'),(15,'Travel agency'),(21,'Trucking');
/*!40000 ALTER TABLE `questionnaire_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_specificquestion`
--

DROP TABLE IF EXISTS `questionnaire_specificquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_specificquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionnaire_specif_category_id_2dc4b6f6_fk_questionn` (`category_id`),
  CONSTRAINT `questionnaire_specif_category_id_2dc4b6f6_fk_questionn` FOREIGN KEY (`category_id`) REFERENCES `questionnaire_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_specificquestion`
--

LOCK TABLES `questionnaire_specificquestion` WRITE;
/*!40000 ALTER TABLE `questionnaire_specificquestion` DISABLE KEYS */;
INSERT INTO `questionnaire_specificquestion` VALUES (1,'Business Audit','A business audit is like a financial checkup, where experts review a company\'s records to ensure accuracy, honesty, and compliance with rules. It helps identify errors, fraud, and areas for improvement.',1),(2,'Business Structure','A business structure refers to the legal and organizational framework of a company. It defines how the business is set up, managed, and taxed. Common structures include sole proprietorship, partnership, limited liability company (LLC), and corporation. Each structure has unique characteristics, impacting factors like liability, management, and taxation. Choosing the right business structure is crucial, as it affects how the company operates and its legal standing.',1),(3,'Expenses (monthly)','Expenses are the costs a business incurs in its operations, including items like rent, wages, and supplies. They are subtracted from revenue to determine profits. High expenses can hinder the growth of your business, always look to see where you can cut down on expenses for optimal growth of your businesses bottom line.',2),(4,'Revenue','Revenue in business is the money a company makes by selling things or providing services. It\'s the total income before subtracting expenses. You can find details about how much money a company earns in documents like the income statement or profit and loss statement, which show how well the business is doing financially.',2),(5,'Mobile Responsiveness','Mobile Responsiveness is like making sure a website or app works well and looks good on mobile devices like phones and tablets. It involves designing and optimizing the content and layout to provide a smooth and user-friendly experience on smaller screens. For example, a website with mobile responsiveness adjusts its content to fit various screen sizes, making it easy to navigate on smartphones. Ensuring mobile responsiveness is crucial in today\'s digital age, as many people access information and services on their mobile devices.',8),(6,'Return Rate','Return Rate is like measuring the percentage of products customers send back compared to the total number of products sold. It indicates how often customers return items for reasons like defects or dissatisfaction. For example, if a company sells 100 products and 5 are returned, the return rate is 5%. Monitoring return rates helps businesses assess product quality, customer satisfaction, and potential areas for improvement.',8);
/*!40000 ALTER TABLE `questionnaire_specificquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_userresponse`
--

DROP TABLE IF EXISTS `questionnaire_userresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_userresponse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answer_id` bigint NOT NULL,
  `question_id` bigint NOT NULL,
  `business_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionnaire_userre_answer_id_564db852_fk_questionn` (`answer_id`),
  KEY `questionnaire_userre_question_id_8840bcba_fk_questionn` (`question_id`),
  KEY `questionnaire_userre_business_id_3a47ce82_fk_business_` (`business_id`),
  CONSTRAINT `questionnaire_userre_answer_id_564db852_fk_questionn` FOREIGN KEY (`answer_id`) REFERENCES `questionnaire_answeroption` (`id`),
  CONSTRAINT `questionnaire_userre_business_id_3a47ce82_fk_business_` FOREIGN KEY (`business_id`) REFERENCES `business_business` (`id`),
  CONSTRAINT `questionnaire_userre_question_id_8840bcba_fk_questionn` FOREIGN KEY (`question_id`) REFERENCES `questionnaire_specificquestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_userresponse`
--

LOCK TABLES `questionnaire_userresponse` WRITE;
/*!40000 ALTER TABLE `questionnaire_userresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionnaire_userresponse` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 23:40:34
