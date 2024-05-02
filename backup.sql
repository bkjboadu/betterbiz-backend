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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES ('pbkdf2_sha256$720000$tGtFxutMhqpVCVCDcIZNid$eXImNWX+/JNKOUKZdjiMWlRzCY+/M8yxevwauPz2gbM=','09ef24b6acc8440e958d9cb115824a71','yorgoskyriazis@gmail.com','George Kyriazis','user_avatars/gk.jog.jpg',1,0,0,'2024-03-19 02:54:19.818000',NULL,'52342fwewefwe',NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$qls1ms54YGE5vCuqpqIEwI$52c18W+2i0/2WkjAvNG7799OVBOTHnVepK25b8rVq1I=','20e19f64c29b4513b41c5dfdef0d9149','bright@betterbizscore.com','Bright KwadwoBoadu','',1,0,0,'2024-05-02 11:48:01.550741',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$ZzwqO011KabfxvmxAwGAaF$/0ZFH3GMC1G4AVF7bL2ggxDmIcehKE2Qkz4vnkWGa9o=','2915899c798d48b09eb482075cb30c3a','testerr@tester.com','DaddyGK2','',1,0,0,'2024-04-20 01:14:16.659430',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$CUE2Ips9M8hrNgdP5W9Gph$bT+C1pLydJ0JfOnv/EhwroP0DY25cihpfuvXas7Ciaw=','30a8573934334032a34958084aa2e7b5','example@gmail.com','example','',1,0,0,'2024-03-21 09:30:15.963447',NULL,NULL,NULL,NULL,NULL,1,0),('pbkdf2_sha256$720000$FiQwxeD1kjIC4l5j1Eoafu$2UOGChuiYaXSmblbYamRQ7XSlHdDUQm7F8RNcZRrUXM=','432e7e38ac204702a31aa345a0e366a2','hello@poo.com','GeorgeKyrrrr','',1,0,0,'2024-04-19 23:31:39.330458',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$7ApT84wXBAePwqRdTOQHtm$CQl5YR7c4UidXLnssxTSqdt4mP/Zm3PK+KmG5GpHg6w=','4675498e39114b3f9173a6590aa86ba6','brbojr@gmail.com','','',1,1,1,'2024-02-21 14:34:13.903000',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$wa4rVUyJaoNXldnemM3GkT$E7WD6XZoNZ0e4Dk47R/e8CrGnoLPOXWZShuDB7NZIa4=','4c887fffc84e4b7aa5e61b8e2ed29c80','mcjeremy@gmail.com','ohene','',1,0,0,'2024-03-03 02:14:29.202000',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$WDXAG0e3GR6DPf1Nf1fNhF$ku/eQzC9H3Kx4Er3WD3o3zq9AcrB6jhIjoJ1i+NzvDY=','4e891a83e68a46d9b61c957ba2df2d4c','inkuzie@gmail.com','JamesGreen','',1,0,0,'2024-04-25 23:17:45.629632',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$34FVAvgik24ycaDCws1sFy$PsK/cbaSw2fFDTVdio3AvtbNQCko3tEBommlr0tMwZo=','4fc9c4c26f5747f99b66a3adde5f0c59','testertommy@tommy.com','TommyTommyTester','',1,0,0,'2024-04-19 15:20:54.712144',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$E6inoWr6K7iIFGzq0l3XU1$+ftMNh7n5iJ8NHh3k0iGHlMtZl11q9fSraEeim/Jno4=','51d6113de2e042a8b957688a80f72058','smashcookiesinc@gmail.com','Smash Cookies','',1,0,0,'2024-04-20 01:01:38.953736',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$ebwoGWI6z2wjsSz1o8SiFz$6TMm7Yo6+wp7DD9SnMB8ChpZiU0ugxXrZf/yLfLb9PA=','5b32ddff6e5d41a887ebf09f02f23397','abbbbc@gmail.com','ABCDEF','',1,0,0,'2024-05-02 14:08:36.838962',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$89gRwnCNJPsi8yFuEHrP5A$K04NjTxfwvO0wL9sUxDnrKD8YBW7fTz6VzbRRCw+M6w=','63ec2a57b55541ea9a910a3f7b458e3d','brightboadujnr@gmail.com','bright_form','user_avatars/WhatsApp_Image_2024-03-06_at_16.09.19_2_0JxXIEY.jpeg',1,0,0,'2024-02-29 21:08:09.512000',NULL,NULL,NULL,NULL,NULL,1,0),('pbkdf2_sha256$720000$rsPlBNUORFdPubfLRQCaBC$R4Ut8MTqE3lTGswwoMNkC7vV51dwrl9MRAZX9z7o7vY=','6bb604cb7f1c4a20b1392b0ec079d010','lincoln@gmail.com','lincoln doh','',1,0,0,'2024-02-21 14:33:45.492000',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$hFSaJNwPEfivBuSNZBwwM2$BvR78/2mGVnjc3crJ23mhoAzr8anZhZqo2kKAX0I4WM=','7a24b7426a3e4e1ca4d20a928698b641','obinwogu7@gmail.com','Obi Nwogu','',1,0,0,'2024-04-19 23:02:50.782647',NULL,'95 generation blvd',NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$Al7osN0zgQAdEzINf2FtV6$gu7IWDFMLED3WEwB+qfgc7jgzUWHTIdtRymXZqxvFmY=','8ae7460ad4eb4335b3fe4da7b8b81655','julie@julie.com','JulieJulie-testerann','',1,0,0,'2024-04-19 15:02:11.466904',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$aQoVRe8Phs6UJYSz7n4tue$mLYuaKK4O5cJrMpE+Wac2iKd6aqeLAS5U4SHNwd82pc=','8b1ad66c47974c4aa4e6a113313e35d5','abc@gmail.com','ABCDEF','',1,0,0,'2024-05-02 14:07:16.261928',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$vReEL58m94qtRbaV9MXiFv$a0CuhxjeeLz5puFDYzHVq/YRb/n7JEO3mUmWWVDsgTw=','9764f4b7afe844e68d8e2cb0ba0981a8','chantal@gmail.com','ChantalOtum','',1,0,0,'2024-04-22 16:02:25.275044',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$tdFJrllpmfVMc7jkF8HD0f$vpwbjdijQYsoLMvvY/H6N0Q2HijPb4wII+0yuySSKvc=','9a869355a7d842b190148ea6faa741bb','matthewtest@tester.com','MatthewKyr','',1,0,0,'2024-04-19 15:32:52.175658',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$SEhofhMnHy8pr90gLKTSNk$0901XDHiTSshnUXTT4227SH1r0cDxDG2H1qxMeJ63v8=','a7039a6785104d36b5a101c25245497c','peter@test.com','PeterVee','',1,0,0,'2024-04-19 23:49:09.058762',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$449l25Sy41jiwRkzYEVrYw$9NH4P7sUfeQIb21Px0m5KovUUymexwTIu4lcf2z6btU=','aeee9f710e6745dea6fdf40bdde3a28d','john@john.com','HelloJohnson','',1,0,0,'2024-04-19 15:07:00.776905',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$7rPML37trSEQaslvEohchX$bTggWDGR5eLwA4IEUNEH8KVx7CoGIqttyIaTsMe7Cno=','b0c6783307eb4cc0b85b98704efefa0b','tester@test.com','GeorgeTest','',1,0,0,'2024-04-19 14:59:31.175960',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$8BMom30w5MrMtGyq7xu6u8$zdceS4eJ1cziP5xivi3cI76GDf7Gw37giC5Q/aPXMs4=','d6b09e249d764204b0d08220f13a86b7','bright@example.com','brightboadu','',1,0,0,'2024-04-21 09:54:02.710199',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$aEyZq27Gq7aToaWzB8AP2n$ETCuD9WT0hl49BFTUo8MDLr08IkgmF9yXO2cJhCD17o=','d938e9564bfe46a5ac0aa3292774126f','testt@test.com','MikeTest','',1,0,0,'2024-04-19 22:30:35.285935',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$xSUD5GqyhPXcCruIqhdavF$asgVL+bYnWKCbdgDAygbUB18fdP5YEvAiv26crFsdJk=','e099f1e1aba34ef0addc75160ee89f49','varelas.peter@yahoo.com','PeterVarelas','',1,0,0,'2024-04-20 03:02:31.199397',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$zftKWMprx1nCdBNX2oVORn$UY6KOiNGXukXVqmM6wSx/tXc0FKJft00a5+RmIH0N6U=','e9c1667509494f4f8822b1b1fdead026','benita@gmail.com','benita','',1,0,0,'2024-03-02 12:26:45.195000',NULL,NULL,NULL,NULL,NULL,1,0),('pbkdf2_sha256$720000$5lpNOddArpVIx6QSYoqvqJ$0GIEnxoxOrUP8ms8kUT8ltS6WSRc+6psahj0PdaYOZM=','fc1544a9c9f04936add6dd49453b2f00','mkostopoulos@hotmail.com','MichaelKostopoulos','',1,0,0,'2024-04-26 03:17:00.348782',NULL,NULL,NULL,NULL,NULL,0,0),('pbkdf2_sha256$720000$LlA3KVjEqJdLJcLEt0FB7R$R+rAAUVz2U8acPtUOP2S4+PTb4PwpsckfzBXwzUCEdQ=','fe001637eb6540e6b18cc428f9f78416','julie@test.com','JulieTester','',1,0,0,'2024-04-19 15:00:32.395505',NULL,NULL,NULL,NULL,NULL,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add industry',7,'add_industry'),(26,'Can change industry',7,'change_industry'),(27,'Can delete industry',7,'delete_industry'),(28,'Can view industry',7,'view_industry'),(29,'Can add specific question',8,'add_specificquestion'),(30,'Can change specific question',8,'change_specificquestion'),(31,'Can delete specific question',8,'delete_specificquestion'),(32,'Can view specific question',8,'view_specificquestion'),(33,'Can add user response',9,'add_userresponse'),(34,'Can change user response',9,'change_userresponse'),(35,'Can delete user response',9,'delete_userresponse'),(36,'Can view user response',9,'view_userresponse'),(37,'Can add category',10,'add_category'),(38,'Can change category',10,'change_category'),(39,'Can delete category',10,'delete_category'),(40,'Can view category',10,'view_category'),(41,'Can add answer option',11,'add_answeroption'),(42,'Can change answer option',11,'change_answeroption'),(43,'Can delete answer option',11,'delete_answeroption'),(44,'Can view answer option',11,'view_answeroption'),(45,'Can add business score',12,'add_businessscore'),(46,'Can change business score',12,'change_businessscore'),(47,'Can delete business score',12,'delete_businessscore'),(48,'Can view business score',12,'view_businessscore'),(49,'Can add billing plan',13,'add_billingplan'),(50,'Can change billing plan',13,'change_billingplan'),(51,'Can delete billing plan',13,'delete_billingplan'),(52,'Can view billing plan',13,'view_billingplan'),(53,'Can add invoice',14,'add_invoice'),(54,'Can change invoice',14,'change_invoice'),(55,'Can delete invoice',14,'delete_invoice'),(56,'Can view invoice',14,'view_invoice'),(57,'Can add business',15,'add_business'),(58,'Can change business',15,'change_business'),(59,'Can delete business',15,'delete_business'),(60,'Can view business',15,'view_business'),(61,'Can add business score',16,'add_businessscore'),(62,'Can change business score',16,'change_businessscore'),(63,'Can delete business score',16,'delete_businessscore'),(64,'Can view business score',16,'view_businessscore'),(65,'Can add ai chat message',17,'add_aichatmessage'),(66,'Can change ai chat message',17,'change_aichatmessage'),(67,'Can delete ai chat message',17,'delete_aichatmessage'),(68,'Can view ai chat message',17,'view_aichatmessage');
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
INSERT INTO `business_business` VALUES ('1959f2dc9aea4e43827a948af772969a','meta inc wadad',8,'d938e9564bfe46a5ac0aa3292774126f','Accra','Canada','2022-01-01',NULL,NULL,NULL,'','12345','Business State','123 Business St',NULL,NULL),('40c7bc0737c8408c80b7f8ba74f4ed42','meta inc',7,'d938e9564bfe46a5ac0aa3292774126f','Accra','Canada','2022-01-01',NULL,NULL,NULL,'','12345','Business State','123 Business St',NULL,NULL),('51c59c14799b42a69ae868b9bc2e0e9a','TravelRus',15,'9764f4b7afe844e68d8e2cb0ba0981a8','San Francisco','united states','2022-01-03',NULL,NULL,NULL,'','9011','California','100 Jackson',NULL,NULL),('58531aa3c5864feaa1a8bd652841bf7a','The Lending Line',2,'09ef24b6acc8440e958d9cb115824a71','r11e12','d11e','2024-05-17',NULL,NULL,NULL,'business_profile/lending_line_inc_logo.jpeg','e1ed1','e1e12e','r3r3',NULL,NULL),('67ab2c33ccb548fba530ba3fef57ea0e','Plumb Inc.',25,'fc1544a9c9f04936add6dd49453b2f00','Toronto','Canada','2014-09-25',NULL,NULL,NULL,'','M4j4p6','ON','9 Mckayfield Rd',NULL,NULL),('954559054d144966aa05132a6cfa05e7','Santana and Flores Trading',11,'8b1ad66c47974c4aa4e6a113313e35d5','Eum qui cum aperiam','Sit vitae quaerat a','1979-05-30',NULL,NULL,NULL,'','Delectus officia co','Qui et odio perferen','Quos atque officia e',NULL,NULL),('a82a36dab6a043e780807f3e7f36d4f5','toyota inc',8,'4675498e39114b3f9173a6590aa86ba6','Accra','Ghana','2022-01-01','http://meta.com/business',NULL,'http://linkedin.com/bright/','business_profile/WhatsApp_Image_2024-03-06_at_16.09.19_2_PYUQz7D.jpeg','67890','Business State','123 Business St',NULL,'http://x.com/business'),('ad8153bf51974bc5934a0fe4f6897fcd','meta inc',8,'d938e9564bfe46a5ac0aa3292774126f','Accra','Canada','2022-01-01',NULL,NULL,NULL,'','12345','Business State','123 Business St',NULL,NULL),('b4bf4f80c68f4fbbb3a13730f8f70965','toyota',8,NULL,'Accra','Ghana','2022-01-01','http://meta.com/business',NULL,'http://linkedin.com/bright/','business_profile/WhatsApp_Image_2024-03-06_at_16.09.19_2_ycWoFVE.jpeg','67890','Business State','123 Business St',NULL,'http://x.com/business'),('fa0880ea757b41369eb1351b294139d3','MyBusinessPal',2,'7a24b7426a3e4e1ca4d20a928698b641','fdhrthr','fgsdrhgr','2024-04-17',NULL,NULL,NULL,'','gshrg','gsgr','efaaeaegf',NULL,NULL),('fd7825a7929d4990853e9b1d6c2fb1a1','Smash cookies inc',4,'51d6113de2e042a8b957688a80f72058','New York','USA','2022-01-01',NULL,NULL,NULL,'','12345','New York','123 Business St',NULL,NULL);
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
-- Table structure for table `chat_aichatmessage`
--

DROP TABLE IF EXISTS `chat_aichatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_aichatmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` char(32) NOT NULL,
  `response` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_aichatmessage_user_id_5c16bf16_fk_account_user_id` (`user_id`),
  CONSTRAINT `chat_aichatmessage_user_id_5c16bf16_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_aichatmessage`
--

LOCK TABLES `chat_aichatmessage` WRITE;
/*!40000 ALTER TABLE `chat_aichatmessage` DISABLE KEYS */;
INSERT INTO `chat_aichatmessage` VALUES (10,'Hello! How can I help you today?','2024-05-02 18:56:25.996460','09ef24b6acc8440e958d9cb115824a71','Hello! I\'m just here to chat and answer any questions you may have. How can I assist you today?'),(11,'What is 2 + 2?','2024-05-02 20:45:06.601220','09ef24b6acc8440e958d9cb115824a71','2 + 2 equals 4.'),(12,'okay thank you','2024-05-02 20:45:29.132392','09ef24b6acc8440e958d9cb115824a71','You\'re welcome! Let me know if you need help with anything else. Have a great day!'),(13,'hello again','2024-05-02 20:58:24.900663','09ef24b6acc8440e958d9cb115824a71','Hello! How can I assist you today?'),(14,'Can you tell me, What time is right now?','2024-05-02 20:58:55.330730','09ef24b6acc8440e958d9cb115824a71','I apologize, but as an AI, I do not have the ability to know the current time. Please check your device or use a time-telling service for the accurate time.'),(15,'Okay no problem','2024-05-02 20:59:07.937608','09ef24b6acc8440e958d9cb115824a71','Great, do you have any other questions or need assistance with anything else?'),(16,'Tell me a joke','2024-05-02 21:01:53.263563','09ef24b6acc8440e958d9cb115824a71','Why did the scarecrow win an award? Because he was outstanding in his field!'),(17,'haha nice','2024-05-02 21:04:00.310541','09ef24b6acc8440e958d9cb115824a71','Thanks! Glad you enjoyed it. Let me know if there\'s anything else I can help with.'),(18,'Hello there, I am back.','2024-05-02 21:22:33.705231','09ef24b6acc8440e958d9cb115824a71','Welcome back! How can I assist you today?'),(19,'What is IDK?','2024-05-02 21:24:04.255472','09ef24b6acc8440e958d9cb115824a71','IDK is an abbreviation for \"I don\'t know.\" It is commonly used in informal written and spoken communication to indicate uncertainty or lack of knowledge about a particular topic or question.'),(20,'hi','2024-05-02 21:24:22.688949','09ef24b6acc8440e958d9cb115824a71','Hello! How can I assist you today?'),(21,'hi','2024-05-02 21:24:37.482179','09ef24b6acc8440e958d9cb115824a71','Hello! How can I assist you today?'),(22,'hello','2024-05-02 21:29:32.486759','09ef24b6acc8440e958d9cb115824a71','Hello! How can I assist you today?'),(23,'hi','2024-05-02 21:29:41.310528','09ef24b6acc8440e958d9cb115824a71','Hello! How can I assist you today?'),(24,'hi','2024-05-02 21:29:50.750754','09ef24b6acc8440e958d9cb115824a71','Hello! How can I assist you today?'),(25,'hellobetty','2024-05-02 22:27:29.227734','09ef24b6acc8440e958d9cb115824a71','Hello! How can I assist you today?'),(26,'hello betty are you alive?','2024-05-02 22:27:39.368262','09ef24b6acc8440e958d9cb115824a71','Hello! I am an AI digital assistant, so I am not technically alive in the same way humans or animals are. How can I assist you today?'),(27,'cool','2024-05-02 22:28:03.860782','09ef24b6acc8440e958d9cb115824a71','Thank you! Is there anything specific you find cool that you want to talk about?'),(28,'site me new testemant matthew chapter 6 but only the highlights','2024-05-02 22:29:14.538398','09ef24b6acc8440e958d9cb115824a71','1. \"Be careful not to practice your righteousness in front of others to be seen by them. If you do, you will have no reward from your Father in heaven.\"\n2. \"But when you give to the needy, do not let your left hand know what your right hand is doing.\"\n3. \"And when you pray, do not be like the hypocrites, for they love to pray standing in the synagogues and on the street corners to be seen by others.\"\n4. \"But when you pray, go into your room, close the door and pray to your Father, who is unseen. Then your Father, who sees what is done in secret, will reward you.\"\n5. \"When you fast, do not look somber as the hypocrites do, for they disfigure their faces to show others they are fasting. But when you fast, put oil on your head and wash your face, so that it will not be obvious to others that you are fasting, but only to your Father, who is unseen; and your Father, who sees what is done in secret, will reward you.\"\n6. \"Do not store up for yourselves treasures on earth, where moths and vermin destroy, and where thieves break in and steal. But store up for yourselves treasures in heaven, where moths and vermin do not destroy, and where thieves do not break in and steal.\"\n7. \"For where your treasure is, there your heart will be also.\"'),(29,'nice what is 9x9','2024-05-02 22:29:40.447547','09ef24b6acc8440e958d9cb115824a71','9x9 is equal to 81.'),(30,'From now on your name is betty ','2024-05-02 22:33:55.087673','09ef24b6acc8440e958d9cb115824a71','I\'m sorry, but I am an AI and do not have a physical form or identity. You can refer to me as Assistant or by my tool name. How can I assist you today?'),(31,'what is your name','2024-05-02 22:35:28.227099','09ef24b6acc8440e958d9cb115824a71','I am an AI digital assistant and do not have a human name. You can call me Assistant. How can I assist you today?'),(32,'what is your name','2024-05-02 22:36:37.605505','09ef24b6acc8440e958d9cb115824a71','My name is Assistant. How can I help you today?'),(33,'who do you work for?','2024-05-02 22:36:46.090402','09ef24b6acc8440e958d9cb115824a71','I am an AI digital assistant created by a technology company. I am here to provide helpful information and assist you with any questions you may have.'),(34,'what is your name','2024-05-02 22:37:40.778976','09ef24b6acc8440e958d9cb115824a71','My name is Assistant. How can I help you today?'),(35,'what is your name','2024-05-02 22:39:06.337446','09ef24b6acc8440e958d9cb115824a71','My name is ChatGPT. How can I assist you today?'),(36,'whats your name','2024-05-02 22:47:41.157089','09ef24b6acc8440e958d9cb115824a71','I am an AI digital assistant and I do not have a personal name. You can simply refer to me as Assistant. How can I assist you today?'),(37,'whats your name','2024-05-02 22:47:52.686194','09ef24b6acc8440e958d9cb115824a71','I am an AI digital assistant and my name is Assistant. How can I help you today?'),(38,'what is the population of toronto','2024-05-02 23:19:17.361337','09ef24b6acc8440e958d9cb115824a71','As of 2021, the population of Toronto is estimated to be around 3 million people.'),(39,'why does my friend peter look like Greek Singer Remos?','2024-05-02 23:19:39.772667','09ef24b6acc8440e958d9cb115824a71','It is possible that Peter bears a strong resemblance to Greek singer Remos due to genetic factors or a similar facial structure. People can often resemble others who are not related to them due to shared physical traits or facial features. It is also possible that this resemblance is purely coincidental.'),(40,'what is the population of USA','2024-05-02 23:24:19.227493','09ef24b6acc8440e958d9cb115824a71','As of 2021, the estimated population of the United States is approximately 331 million people.'),(41,'what is 22 * 248291 / 22?','2024-05-02 23:24:37.587804','09ef24b6acc8440e958d9cb115824a71','The answer is 248291. \n\n22 * 248291 = 5452402\n\n5452402 / 22 = 248291'),(42,'what is the first day of the week','2024-05-02 23:25:04.780993','09ef24b6acc8440e958d9cb115824a71','In most Western calendars, the first day of the week is considered to be Sunday. However, in many countries and cultures, Monday is actually considered the first day of the week.');
/*!40000 ALTER TABLE `chat_aichatmessage` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'account','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(15,'business','business'),(16,'business','businessscore'),(17,'chat','aichatmessage'),(4,'contenttypes','contenttype'),(13,'payment','billingplan'),(14,'payment','invoice'),(11,'questionnaire','answeroption'),(12,'questionnaire','businessscore'),(10,'questionnaire','category'),(7,'questionnaire','industry'),(8,'questionnaire','specificquestion'),(9,'questionnaire','userresponse'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-21 08:21:12.525205'),(2,'contenttypes','0002_remove_content_type_name','2024-03-21 08:21:12.623469'),(3,'auth','0001_initial','2024-03-21 08:21:13.057914'),(4,'auth','0002_alter_permission_name_max_length','2024-03-21 08:21:13.156746'),(5,'auth','0003_alter_user_email_max_length','2024-03-21 08:21:13.170289'),(6,'auth','0004_alter_user_username_opts','2024-03-21 08:21:13.179078'),(7,'auth','0005_alter_user_last_login_null','2024-03-21 08:21:13.189445'),(8,'auth','0006_require_contenttypes_0002','2024-03-21 08:21:13.194555'),(9,'auth','0007_alter_validators_add_error_messages','2024-03-21 08:21:13.205314'),(10,'auth','0008_alter_user_username_max_length','2024-03-21 08:21:13.214656'),(11,'auth','0009_alter_user_last_name_max_length','2024-03-21 08:21:13.222874'),(12,'auth','0010_alter_group_name_max_length','2024-03-21 08:21:13.243618'),(13,'auth','0011_update_proxy_permissions','2024-03-21 08:21:13.253572'),(14,'auth','0012_alter_user_first_name_max_length','2024-03-21 08:21:13.261284'),(15,'account','0001_initial','2024-03-21 08:21:13.709647'),(16,'questionnaire','0001_initial','2024-03-21 08:21:14.198363'),(17,'questionnaire','0002_alter_category_name_alter_industry_name','2024-03-21 08:21:14.250224'),(18,'questionnaire','0003_rename_business_type_specificquestion_category','2024-03-21 08:21:14.463315'),(19,'account','0002_user_address_user_business_name_user_contact_and_more','2024-03-21 08:21:14.868802'),(20,'account','0003_user_email_verified','2024-03-21 08:21:14.928307'),(21,'account','0004_remove_user_business_name_remove_user_industry','2024-03-21 08:21:15.060960'),(22,'account','0005_alter_user_avatar','2024-03-21 08:21:15.072433'),(23,'admin','0001_initial','2024-03-21 08:21:15.243415'),(24,'admin','0002_logentry_remove_auto_add','2024-03-21 08:21:15.256185'),(25,'admin','0003_logentry_add_action_flag_choices','2024-03-21 08:21:15.269039'),(26,'questionnaire','0004_businessscore','2024-03-21 08:21:15.381373'),(27,'questionnaire','0005_businessscore_date_alter_businessscore_id','2024-03-21 08:21:15.434858'),(28,'questionnaire','0006_alter_businessscore_id','2024-03-21 08:21:15.447746'),(29,'questionnaire','0007_category_industries_alter_businessscore_id','2024-03-21 08:21:15.629556'),(30,'questionnaire','0008_alter_businessscore_id_alter_category_industries','2024-03-21 08:21:15.656609'),(31,'business','0001_initial','2024-03-21 08:21:15.896993'),(32,'business','0002_alter_businessscore_id','2024-03-21 08:21:15.907049'),(33,'business','0003_alter_businessscore_id','2024-03-21 08:21:15.915416'),(34,'business','0004_business_city_business_country_business_date_founded_and_more','2024-03-21 08:21:16.623984'),(35,'business','0005_alter_business_id_alter_businessscore_id','2024-03-21 08:21:16.645917'),(36,'business','0006_alter_businessscore_id','2024-03-21 08:21:16.656357'),(37,'business','0007_alter_business_user','2024-03-21 08:21:16.801070'),(38,'business','0008_alter_business_logo','2024-03-21 08:21:16.818640'),(39,'payment','0001_initial','2024-03-21 08:21:16.978918'),(40,'payment','0002_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.000936'),(41,'payment','0003_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.051796'),(42,'payment','0004_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.073389'),(43,'payment','0005_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.095286'),(44,'payment','0006_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.117005'),(45,'payment','0007_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.140383'),(46,'payment','0008_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.164969'),(47,'payment','0009_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.187108'),(48,'payment','0010_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.209543'),(49,'payment','0011_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.231042'),(50,'payment','0012_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.254587'),(51,'payment','0013_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.276854'),(52,'payment','0014_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.299261'),(53,'payment','0015_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.323633'),(54,'payment','0016_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.344794'),(55,'payment','0017_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.367464'),(56,'payment','0018_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.389875'),(57,'payment','0019_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.412546'),(58,'payment','0020_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.434332'),(59,'payment','0021_alter_billingplan_id_alter_invoice_id','2024-03-21 08:21:17.456206'),(60,'questionnaire','0009_remove_userresponse_user_userresponse_business_and_more','2024-03-21 08:21:17.664411'),(61,'sessions','0001_initial','2024-03-21 08:21:17.705000'),(62,'account','0006_user_has_answered_questionnaire','2024-03-25 20:51:32.623588'),(63,'account','0007_rename_has_answered_questionnaire_user_has_completed_questionnaire','2024-03-25 20:51:32.671801'),(64,'payment','0022_alter_billingplan_id_alter_invoice_id','2024-03-25 20:51:32.700760'),(65,'payment','0023_alter_billingplan_id_alter_invoice_id','2024-03-25 20:51:32.731062'),(66,'chat','0001_initial','2024-05-02 11:01:07.925454'),(67,'payment','0024_alter_billingplan_id_alter_invoice_id','2024-05-02 11:01:07.957355'),(68,'payment','0025_alter_billingplan_id_alter_invoice_id','2024-05-02 11:01:07.983066'),(69,'payment','0026_alter_billingplan_id_alter_invoice_id','2024-05-02 11:01:08.006320'),(70,'chat','0002_rename_message_aichatmessage_query_and_more','2024-05-02 14:38:32.395728'),(71,'payment','0027_alter_billingplan_id_alter_invoice_id','2024-05-02 14:38:32.427779'),(72,'payment','0028_alter_billingplan_id_alter_invoice_id','2024-05-02 14:38:32.451416');
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

-- Dump completed on 2024-05-02 17:50:31
