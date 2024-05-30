-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: betterbiz
-- ------------------------------------------------------
-- Server version	8.0.34

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

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_user_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add industry',7,'add_industry'),(26,'Can change industry',7,'change_industry'),(27,'Can delete industry',7,'delete_industry'),(28,'Can view industry',7,'view_industry'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add specific question',9,'add_specificquestion'),(34,'Can change specific question',9,'change_specificquestion'),(35,'Can delete specific question',9,'delete_specificquestion'),(36,'Can view specific question',9,'view_specificquestion'),(37,'Can add answer option',10,'add_answeroption'),(38,'Can change answer option',10,'change_answeroption'),(39,'Can delete answer option',10,'delete_answeroption'),(40,'Can view answer option',10,'view_answeroption'),(41,'Can add user response',11,'add_userresponse'),(42,'Can change user response',11,'change_userresponse'),(43,'Can delete user response',11,'delete_userresponse'),(44,'Can view user response',11,'view_userresponse'),(45,'Can add billing plan',12,'add_billingplan'),(46,'Can change billing plan',12,'change_billingplan'),(47,'Can delete billing plan',12,'delete_billingplan'),(48,'Can view billing plan',12,'view_billingplan'),(49,'Can add invoice',13,'add_invoice'),(50,'Can change invoice',13,'change_invoice'),(51,'Can delete invoice',13,'delete_invoice'),(52,'Can view invoice',13,'view_invoice'),(53,'Can add business',14,'add_business'),(54,'Can change business',14,'change_business'),(55,'Can delete business',14,'delete_business'),(56,'Can view business',14,'view_business'),(57,'Can add business score',15,'add_businessscore'),(58,'Can change business score',15,'change_businessscore'),(59,'Can delete business score',15,'delete_businessscore'),(60,'Can view business score',15,'view_businessscore'),(61,'Can add betty chat message',16,'add_bettychatmessage'),(62,'Can change betty chat message',16,'change_bettychatmessage'),(63,'Can delete betty chat message',16,'delete_bettychatmessage'),(64,'Can view betty chat message',16,'view_bettychatmessage'),(65,'Can add social account',17,'add_socialaccount'),(66,'Can change social account',17,'change_socialaccount'),(67,'Can delete social account',17,'delete_socialaccount'),(68,'Can view social account',17,'view_socialaccount'),(69,'Can add social application',18,'add_socialapp'),(70,'Can change social application',18,'change_socialapp'),(71,'Can delete social application',18,'delete_socialapp'),(72,'Can view social application',18,'view_socialapp'),(73,'Can add social application token',19,'add_socialtoken'),(74,'Can change social application token',19,'change_socialtoken'),(75,'Can delete social application token',19,'delete_socialtoken'),(76,'Can view social application token',19,'view_socialtoken'),(77,'Can add email address',20,'add_emailaddress'),(78,'Can change email address',20,'change_emailaddress'),(79,'Can delete email address',20,'delete_emailaddress'),(80,'Can view email address',20,'view_emailaddress'),(81,'Can add email confirmation',21,'add_emailconfirmation'),(82,'Can change email confirmation',21,'change_emailconfirmation'),(83,'Can delete email confirmation',21,'delete_emailconfirmation'),(84,'Can view email confirmation',21,'view_emailconfirmation'),(85,'Can add quick books token',22,'add_quickbookstoken'),(86,'Can change quick books token',22,'change_quickbookstoken'),(87,'Can delete quick books token',22,'delete_quickbookstoken'),(88,'Can view quick books token',22,'view_quickbookstoken'),(89,'Can add questions',23,'add_questions'),(90,'Can change questions',23,'change_questions'),(91,'Can delete questions',23,'delete_questions'),(92,'Can view questions',23,'view_questions');
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
  `logo` varchar(100) DEFAULT NULL,
  `date_founded` date DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `facebook_url` varchar(200) DEFAULT NULL,
  `twitter_url` varchar(200) DEFAULT NULL,
  `linkedin_url` varchar(200) DEFAULT NULL,
  `legal_status` varchar(100) DEFAULT NULL,
  `tax_id` varchar(100) DEFAULT NULL,
  `industry_id` bigint NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `has_completed_questionnaire` tinyint(1) DEFAULT NULL,
  `has_connected_quickbooks` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_business_industry_id_d49d6943_fk_questionn` (`industry_id`),
  KEY `business_business_user_id_819ecae2_fk_user_account_user_id` (`user_id`),
  CONSTRAINT `business_business_industry_id_d49d6943_fk_questionn` FOREIGN KEY (`industry_id`) REFERENCES `questionnaire_industry` (`id`),
  CONSTRAINT `business_business_user_id_819ecae2_fk_user_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_business`
--

LOCK TABLES `business_business` WRITE;
/*!40000 ALTER TABLE `business_business` DISABLE KEYS */;
INSERT INTO `business_business` VALUES ('13370ee8010c4f92bf923b42157590b6','coca cola','',NULL,NULL,'legon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'f7948956c8074732aeb6d21e80047f39',0,1),('c48aa9c9afad48bbbb3c1674ae0fed69','tesla','',NULL,NULL,'edmonton',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'f7948956c8074732aeb6d21e80047f39',1,NULL),('ebd0d6ee5021464dbb5eb325fb4fd69c','coca cola','',NULL,NULL,'accra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL),('f1c63a7d13374f93aa271a425379f371','coca cola','',NULL,NULL,'accra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL);
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
  `score` int DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `business_id` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_businesssco_business_id_242f2e0e_fk_business_` (`business_id`),
  KEY `business_businessscore_user_id_b7591646_fk_user_account_user_id` (`user_id`),
  CONSTRAINT `business_businesssco_business_id_242f2e0e_fk_business_` FOREIGN KEY (`business_id`) REFERENCES `business_business` (`id`),
  CONSTRAINT `business_businessscore_user_id_b7591646_fk_user_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_businessscore`
--

LOCK TABLES `business_businessscore` WRITE;
/*!40000 ALTER TABLE `business_businessscore` DISABLE KEYS */;
INSERT INTO `business_businessscore` VALUES ('3ea546d176be446cb2c47624c8600e5c',67,'2024-05-22 06:03:42.686849','13370ee8010c4f92bf923b42157590b6','f7948956c8074732aeb6d21e80047f39'),('817278593f6f445b8f4151d1c5eb15e2',0,'2024-05-23 19:59:00.119103','c48aa9c9afad48bbbb3c1674ae0fed69','f7948956c8074732aeb6d21e80047f39');
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
  KEY `chat_bettychatmessage_user_id_f03ca228_fk_user_account_user_id` (`user_id`),
  CONSTRAINT `chat_bettychatmessage_user_id_f03ca228_fk_user_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_bettychatmessage`
--

LOCK TABLES `chat_bettychatmessage` WRITE;
/*!40000 ALTER TABLE `chat_bettychatmessage` DISABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_user_account_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (20,'account','emailaddress'),(21,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(14,'business','business'),(15,'business','businessscore'),(16,'chat','bettychatmessage'),(4,'contenttypes','contenttype'),(22,'miners','quickbookstoken'),(12,'payment','billingplan'),(13,'payment','invoice'),(10,'questionnaire','answeroption'),(8,'questionnaire','category'),(7,'questionnaire','industry'),(23,'questionnaire','questions'),(9,'questionnaire','specificquestion'),(11,'questionnaire','userresponse'),(5,'sessions','session'),(17,'socialaccount','socialaccount'),(18,'socialaccount','socialapp'),(19,'socialaccount','socialtoken'),(6,'user_account','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'business','0001_initial','2024-05-17 03:59:15.295183'),(2,'questionnaire','0001_initial','2024-05-17 03:59:16.337871'),(3,'business','0002_initial','2024-05-17 03:59:16.440450'),(4,'contenttypes','0001_initial','2024-05-17 03:59:16.486156'),(5,'contenttypes','0002_remove_content_type_name','2024-05-17 03:59:16.602358'),(6,'auth','0001_initial','2024-05-17 03:59:16.995747'),(7,'auth','0002_alter_permission_name_max_length','2024-05-17 03:59:17.089449'),(8,'auth','0003_alter_user_email_max_length','2024-05-17 03:59:17.103005'),(9,'auth','0004_alter_user_username_opts','2024-05-17 03:59:17.108082'),(10,'auth','0005_alter_user_last_login_null','2024-05-17 03:59:17.130095'),(11,'auth','0006_require_contenttypes_0002','2024-05-17 03:59:17.134093'),(12,'auth','0007_alter_validators_add_error_messages','2024-05-17 03:59:17.147942'),(13,'auth','0008_alter_user_username_max_length','2024-05-17 03:59:17.165059'),(14,'auth','0009_alter_user_last_name_max_length','2024-05-17 03:59:17.178736'),(15,'auth','0010_alter_group_name_max_length','2024-05-17 03:59:17.207684'),(16,'auth','0011_update_proxy_permissions','2024-05-17 03:59:17.234053'),(17,'auth','0012_alter_user_first_name_max_length','2024-05-17 03:59:17.248212'),(18,'user_account','0001_initial','2024-05-17 03:59:17.904162'),(19,'account','0001_initial','2024-05-17 03:59:18.253629'),(20,'account','0002_email_max_length','2024-05-17 03:59:18.298178'),(21,'account','0003_alter_emailaddress_create_unique_verified_email','2024-05-17 03:59:18.358263'),(22,'account','0004_alter_emailaddress_drop_unique_email','2024-05-17 03:59:18.446926'),(23,'account','0005_emailaddress_idx_upper_email','2024-05-17 03:59:18.499964'),(24,'account','0006_emailaddress_lower','2024-05-17 03:59:18.552213'),(25,'account','0007_emailaddress_idx_email','2024-05-17 03:59:18.641049'),(26,'account','0008_emailaddress_unique_primary_email_fixup','2024-05-17 03:59:18.683703'),(27,'account','0009_emailaddress_unique_primary_email','2024-05-17 03:59:18.708844'),(28,'admin','0001_initial','2024-05-17 03:59:18.948813'),(29,'admin','0002_logentry_remove_auto_add','2024-05-17 03:59:18.976498'),(30,'admin','0003_logentry_add_action_flag_choices','2024-05-17 03:59:18.999202'),(31,'business','0003_initial','2024-05-17 03:59:19.298023'),(32,'chat','0001_initial','2024-05-17 03:59:19.325753'),(33,'chat','0002_initial','2024-05-17 03:59:19.455178'),(34,'payment','0001_initial','2024-05-17 03:59:19.678095'),(35,'payment','0002_initial','2024-05-17 03:59:19.814284'),(36,'sessions','0001_initial','2024-05-17 03:59:19.898323'),(37,'socialaccount','0001_initial','2024-05-17 03:59:20.404151'),(38,'socialaccount','0002_token_max_lengths','2024-05-17 03:59:20.496927'),(39,'socialaccount','0003_extra_data_default_dict','2024-05-17 03:59:20.511134'),(40,'socialaccount','0004_app_provider_id_settings','2024-05-17 03:59:20.725747'),(41,'socialaccount','0005_socialtoken_nullable_app','2024-05-17 03:59:20.997385'),(42,'socialaccount','0006_alter_socialaccount_extra_data','2024-05-17 03:59:21.101677'),(43,'payment','0003_alter_billingplan_id_alter_invoice_id','2024-05-17 04:48:14.809722'),(44,'miners','0001_initial','2024-05-17 05:06:37.828126'),(45,'payment','0004_alter_billingplan_id_alter_invoice_id','2024-05-17 05:06:37.871937'),(46,'miners','0002_alter_quickbookstoken_access_token_and_more','2024-05-18 10:17:26.224478'),(47,'payment','0005_alter_billingplan_id_alter_invoice_id','2024-05-18 10:17:26.249278'),(48,'miners','0003_quickbookstoken_realm_id','2024-05-18 10:27:18.433938'),(49,'payment','0006_alter_billingplan_id_alter_invoice_id','2024-05-18 10:27:18.480694'),(50,'miners','0004_quickbookstoken_quickbooks_data','2024-05-19 04:13:06.899818'),(51,'payment','0007_alter_billingplan_id_alter_invoice_id','2024-05-19 04:13:06.951280'),(52,'payment','0008_alter_billingplan_id_alter_invoice_id','2024-05-22 03:09:30.259465'),(53,'questionnaire','0002_questions_remove_userresponse_answer_and_more','2024-05-22 03:09:31.030638'),(54,'business','0004_businessscore_user','2024-05-22 03:58:46.968248'),(55,'payment','0009_alter_billingplan_id_alter_invoice_id','2024-05-22 03:58:47.023538'),(56,'payment','0010_alter_billingplan_id_alter_invoice_id','2024-05-22 04:11:30.934902'),(57,'questionnaire','0003_userresponse_time','2024-05-22 04:11:31.151300'),(58,'business','0005_alter_businessscore_score','2024-05-22 06:02:03.478942'),(59,'payment','0011_alter_billingplan_id_alter_invoice_id','2024-05-22 06:02:03.528846'),(60,'payment','0012_alter_billingplan_id_alter_invoice_id','2024-05-22 17:24:50.433129'),(61,'questionnaire','0004_questions_time','2024-05-22 17:24:50.533163'),(62,'business','0006_business_has_completed_questionnaire','2024-05-22 21:10:36.290859'),(63,'payment','0013_alter_billingplan_id_alter_invoice_id','2024-05-22 21:10:36.335473'),(64,'user_account','0002_remove_user_has_completed_questionnaire','2024-05-22 21:10:36.501723'),(65,'payment','0014_alter_billingplan_id_alter_invoice_id','2024-05-23 21:52:39.121872'),(66,'payment','0015_alter_billingplan_id_alter_invoice_id','2024-05-23 21:52:55.393465'),(67,'questionnaire','0005_questions_number_of_questions','2024-05-23 21:52:55.625984'),(68,'payment','0016_alter_billingplan_id_alter_invoice_id','2024-05-23 22:00:55.039892'),(69,'questionnaire','0006_alter_questions_number_of_questions','2024-05-23 22:00:55.049320'),(70,'payment','0017_alter_billingplan_id_alter_invoice_id','2024-05-23 22:13:21.930325'),(71,'questionnaire','0007_userresponse_ratio_completed','2024-05-23 22:13:22.127170'),(72,'payment','0018_alter_billingplan_id_alter_invoice_id','2024-05-24 00:10:40.352979'),(73,'user_account','0003_user_quickbooks','2024-05-24 00:10:40.875462'),(74,'payment','0019_alter_billingplan_id_alter_invoice_id','2024-05-24 00:23:35.950478'),(75,'user_account','0004_alter_user_quickbooks','2024-05-24 00:23:36.447101'),(76,'payment','0020_alter_billingplan_id_alter_invoice_id','2024-05-24 23:24:15.233011'),(77,'user_account','0005_remove_user_quickbooks','2024-05-24 23:24:15.743181'),(78,'miners','0005_quickbookstoken_business_id_and_more','2024-05-24 23:28:03.910336'),(79,'payment','0021_alter_billingplan_id_alter_invoice_id','2024-05-24 23:28:03.982196'),(80,'miners','0006_rename_business_id_quickbookstoken_business','2024-05-24 23:34:49.869134'),(81,'payment','0022_alter_billingplan_id_alter_invoice_id','2024-05-24 23:34:49.915595'),(82,'business','0007_business_has_connected_quickbooks','2024-05-25 06:45:39.607553'),(83,'payment','0023_alter_billingplan_id_alter_invoice_id','2024-05-25 06:45:39.638544');
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
INSERT INTO `django_session` VALUES ('109ft1k3u9ysceq1t00f981crjd0iwrl','.eJxVkEFuwyAQRe8ya9vCgDF4VXXfE1SVNcAkJolNBFhtFeXutdNsspvRvP--NDdA5-K6lBHXMtFSgsMS4jLOVKboMwyfN_ifYYAr5vwdk4cKsMDQ9m1njGZ910gttVIV0IzhspE22XhKb8d9bVyc4f5VwaNjXDOlMey6Q2-kNp2q3eaoZS94jWRV7XlLmjHZH4SBl5hFd6Zlz_oTLse4qZeSgm12pHlec_MRPV3en-yLYMI8bWlmOFlvOcetqDXYOsGNkJY4KqFRe6eM5ciQmOMGWSc4Se89tdQ5f3hIM-W8f4p-riH9wsDuf4kNbGg:1s89UJ:FLTgDMTykAsynpgUc7d75QrWt1oHq9gYTFbfzX_GDZQ','2024-06-01 02:07:55.609833'),('1pvcf74tygs60is6j35g8lag7k50rrtm','.eJxVkMtugzAQRf9l1oD8AD9YVd33C6oKje1JIAl2hI3aKsq_F9JsspvRnHuuNDdA79May4BrGSmWyWOZUhxmKmMKGfrPG_zP0MMVc_5OS4AKsEDPNdeMt53WDZecK6MqoBmny4a6xaXT8nbc18anGe5fFTxKhjXTMky776Bta2ynam-YrlstRY3kVB0EJ8NYqw_SwkvMoT9T3LPhhPGYNnUsy-SaHWme19x8pECX9yf7Ihgxj1uaWUEuOCFwK-IWuZfCytaRQCUNmuCVdQIZEvPCIuukoDaEQJw6Hw4Paaac91fRz3VafqFn9z-8KmyC:1sCPvV:qJwiCjEPkY0Tnk9CZo0tGhyAW6y6xtMVRNx2hmQjhPk','2024-06-12 20:29:37.194594'),('3yl3nt897drk1njbydvqpqlefbrguksi','.eJxVkMtugzAQRf9l1oD8wBizqrrvF1QVGtuTQBLsyDZqqyj_XkizyW5Gc-650twAnYtrKCOuZaJQZodljmFcqEzRZxg-b_A_wwBXzPk7Jg8VYIGBa97JzjCmG8WFUlJVQAvOlw21ycZTejvua-PiAvevCh4l45opjfPuO2jT9kZ1teuZrlstRY1ku9oLTj1jrT5IAy8xi-5MYc_6E4Zj3NShpNk2O9I8r7n5iJ4u70_2RTBhnrY0M4Kst0LgVsQNcieFka0lgZ3ssfeuM1YgQ2JOGGRKCmq998RJOX94SDPlvL-Kfq5z-oWB3f8AvFxsgg:1s9hz5:mjfqVsuiQR--UEm1b38fi9fy_J7z7zk01rLPONP1g6E','2024-06-05 09:10:07.589758'),('5bkwl2hu08f3m7f92c5r42wrqdfiwe2s','.eJxVkMFugzAMht_FZ0CJAwnhNO2-J5gm5CRuoS2kIkHbVPXdB10vvdny93-_5BuQ93Gdc09rHnjOo6c8xrmfOA8xJOg-b_A_QwdXSuk7LgEKoAydNFIro1HKSiIKU-sCeKLxsqFucfG0vB33tfJxgvtXAY-Sfk289OPuOxhbt7bRpW-FKWujsCR2ugwouRWiNgdl4SXmyJ953rPhRPMxbuo5L6OrdqR6XlP1EQNf3p_si2CgNGxpYZFdcIi0FUlL0iu0qnaMpFVLbfDaOiRBLDxaEo1CrkMILLnx4fCQJk5pfxX_XMflFzpx_wOzF2x5:1s9jrH:ALvdnUnCtPPkhBPsSLCL3sheCvBL71kEfapuX1uZMNs','2024-06-05 11:10:11.172198'),('bamk8z60pip09qs3ky6wn6pfcszs6w8z','.eJxVkMtugzAQRf9l1oD8wmBWVff9gqpCY3sSSIId2UZtFeXfC2k22c1ozj1Xmhugc3ENZcS1TBTK7LDMMYwLlSn6DMPnDf5nGOCKOX_H5KECLDDwjmvNuWh5o4zQTKsKaMH5sqE22XhKb8d9bVxc4P5VwaNkXDOlcd59h86o3rS6dj3ratVJUSNZXXvBqWdMdQdp4CVm0Z0p7Fl_wnCMmzqUNNtmR5rnNTcf0dPl_cm-CCbM05ZmRpD1VgjcirhB7qQwUlkSqGWPvXfaWIEMiTlhkLVSkPLeE6fW-cNDminn_VX0c53TLwzs_ge4Hmx-:1sAj0F:31pmwI5gxmRguIecqUWhYCamRWhdkVpbR-bnpNo-upw','2024-06-08 04:27:31.617723'),('fj4sxqudex52y2ogja6855l1c7c41qan','.eJxVkMtugzAQRf9l1oD8AmNWVff9gqpCY3sSSIId2UZtFeXfC2k22c1ozj1Xmhugc3ENZcS1TBTK7LDMMYwLlSn6DMPnDf5nGOCKOX_H5KECLDBwzbuOc2F4I3XbK1MBLThfNtImG0_p7bivjYsL3L8qeHSMa6Y0zrvuoI3qTdvVrme6VlqKGsl2tRecesaUPkgDLzGL7kxhz_oThmPc1KGk2TY70jyvufmIni7vT_ZFMGGetjQzgqy3QuBWxA1yJ4WRypLATvbYe9cZK5AhMScMslYKUt574tQ6f3hIM-W8f4p-rnP6hYHd_wB3VmxX:1sAj0t:GL-lIMNVNO5n9s7TDEP2ZWupcNlPMBCJG-ABa30QCsE','2024-06-08 04:28:11.401874'),('i2tuvju7wllieugmx01v9cdoatzb5k1d','.eJxVkMtugzAQRf9l1oD8wsasqu77BVWFxvYkkAQ7wkZtFeXfC2k22c1ozj1Xmhug92mNZcC1jBTL5LFMKQ4zlTGFDP3nDf5n6OGKOX-nJUAFWKDnhmsmjNCy4bKTUlVAM06XjXSLS6fl7bivjU8z3L8qeHQMa6ZlmHbdwVjV2VbXvmOmVkaKGsnpOghOHWPKHKSFl5hDf6a4Z8MJ4zFt6liWyTU70jyvuflIgS7vT_ZFMGIetzSzglxwQuBWxC1yL4WVypFALTvsgtfWCWRIzAuLrJWCVAiBOLU-HB7STDnvn6Kf67T8Qs_uf2kvbEk:1s8H55:gAhfwJ7Kyqvkz-gxpkhozO43Nm2fChyi3fV2qcmoJ3M','2024-06-01 10:14:23.210763'),('n9if56i6ldykb5ecoux8qn22kh98yzk0','.eJxVkM1ugzAQhN_FZ0D22vgnp6r3PkFVobW9BJKAI2zUVlHevZDmktuOduYbaW4MQ0jrXDpcy0BzGQOWMc3dRGVIMbPD54393-zArpjzd1oiqxgWdhBGaAdGcNGo1hoFrmI04XjZrH7x6bS8HXfZhDSx-1fFHiXdmmnpxp3XG6esa3UdLDe1MhJqJK_rCIIs58r00rGXmMdwpnnPxhPOx7Sh57KMvtktzfObm48U6fL-9L4ABszDluYOyEcPgFuRcCiCBCeVJ0AtLdoYtPOAHIkHcMhbCaRijCSoDbF_QDPlvE9FP9dx-d3mAO405_c_Uk1tvA:1sC3Ab:US7WjTKYs2A05BuTQMnnw-r5rBecHWvWdrnX5w6uOuE','2024-06-11 20:11:41.575117'),('wfal5m11r3uqfgplta3egvemumjugl47','.eJxVjTsOwyAQBe9CHRAsGNiU6XMGa2HXcT6yJX-qKHePLblI6jcz761aWpe-XWeZ2jurs-oShoxN1DXbpEPyoElK1AxOsrUhdR7V6VcrVJ8y7C4_aLiNpo7DMt2L2RFzrLO5jiyvy8H-BXqa-822CFK4ANB25JBc9YA-FAGKPlPmGrEAWRJbAck2HiQwszhpKnesPl-NVEFp:1s7op0:WfUC4ne3Hv5P00CK-wHVPvTisbcFB-1lxHRg9A99_ZY','2024-05-31 04:03:54.704994'),('wm58oon0l1xmu7hv0kpl8oloxudodt4y','.eJxVkMtugzAQRf9l1oD8AD9YVd33C6oKje1JcBJwhI3aKsq_F9JsspvRnHuuNDdA79M6lwHXMtJcoscS0zxMVMYUMvSfN_ifoYcr5vydlgAVYIGea64UN9raRpnWGF4BTRgvG-kWl07L23FfG58muH9V8OgY1kzLEHfdQdvW2E7V3jBdt1qKGsmpOghOhrFWH6SFl5hDf6Z5z4YTzse0qeeyRNfsSPO85uYjBbq8P9kXwYh53NLMCnLBCYFbEbfIvRRWto4EKmnQBK-sE8iQmBcWWScFtSEE4tT5cHhIM-W8f4p-rnH5hZ7d_wCLFWxq:1sAkxz:L_kYKkqAhyKy4j21DkjgHbMuGr8pVen6vTt2eznyAw0','2024-06-08 06:33:19.729640'),('zjdnr2cxkkur4uaepow9afwsatyr8568','.eJxVkMFugzAMht_FZ0CJA4RwmnbfE0wTchK30JakIkHbVPXdB10vvdny93-_5BuQc3ENeaA1jxzy5ChPMQwz5zH6BP3nDf5n6OFKKX3HxUMBlKGXWraN0KrDSmJjNBbAM02XjbSLjafl7bivlYsz3L8KeHQMa-JlmHbdQZu6M01buk7ostYKS2Lblh4ld0LU-qAMvMQsuTOHPetPFI5xU4e8TLbakep5TdVH9Hx5f7IvgpHSuKWFQbbeItJWJA1Jp9Co2jJSqzrqvGuNRRLEwqEh0Sjk2nvPkhvnDw9p4pT2T_HPdVp-oRf3P3JqbFI:1sAHyw:awiHC3WvdA_dDQYcojaDlEqN0h3MHBuPzxyX_b627sc','2024-06-06 23:36:22.271212');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miners_quickbookstoken`
--

DROP TABLE IF EXISTS `miners_quickbookstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miners_quickbookstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `access_token` varchar(1025) NOT NULL,
  `refresh_token` varchar(1025) NOT NULL,
  `token_type` varchar(255) NOT NULL,
  `expires_in` int NOT NULL,
  `x_refresh_token_expires_in` int NOT NULL,
  `user_id` char(32) NOT NULL,
  `realm_id` varchar(64) DEFAULT NULL,
  `quickbooks_data` json DEFAULT NULL,
  `business_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `miners_quickbookstoken_user_id_b4d6276f` (`user_id`),
  KEY `miners_quickbookstok_business_id_b82f432c_fk_business_` (`business_id`),
  CONSTRAINT `miners_quickbookstok_business_id_b82f432c_fk_business_` FOREIGN KEY (`business_id`) REFERENCES `business_business` (`id`),
  CONSTRAINT `miners_quickbookstoken_user_id_b4d6276f_fk_user_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miners_quickbookstoken`
--

LOCK TABLES `miners_quickbookstoken` WRITE;
/*!40000 ALTER TABLE `miners_quickbookstoken` DISABLE KEYS */;
INSERT INTO `miners_quickbookstoken` VALUES (7,'eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..JliB-wNH_frzbEXnZJ5DJw.RogCJgSbpI4iI7N3E8oNtOzB3kZt9X9dbPExr7GvpYjXFFZJ9alpddJ19uEvl5a6mXdtkxcyOw7eV18kkIN7R5o9IBl9BPa7-UoS8EjcT7s0-wjFVfGIKpRw7av3odYt_CS1nQOLlaNVwLz3-mD77lf3GHH1F-mDMn7-nV4Y1ZVLXAWBrho8Tw6PtPEdgCKvwzL9esJ0E5dXvm64nm3wbDCCJ2-edWfFZswHNbfnCWawFFsTsiSjoq29H7WAk6wOvC6Q94UG0sjBehtClvwG80PhZf4DJqb5OK2hMOHULiCB96Kh4e6hnlzG3kJXdahBywpmPRkzMu6baH3NNXb8DEbOPeiC_fmKuipP2dJHFfMeqtmuVITexW80WrlRZfNw-Xwkb3HxoLLSIzsLRTmzNLbQvrxdyahovyvmffNleCttypRNnZzSCxAa9tht8uE4ZOeGxzqQPs-dxWw2xJxhXP2nlCbe5qWJ6-g93OZKHG7Udll9Yx45t6tntwhG03RmUABat3tjhSOIwIMQ6pEsIo3c2YkcQ8AaPvoXJ7vKWTN0kCtyr3B15pgIslwnjvrTVavqhW71AmtyO0yF14Zg4BFj9Fbl8vsvf1JdJX9O1LzgJGHowrtVPh5NLOuAuBloqNbzSFtvpZJ5NZ2gDHrAdANS-GRThiKjux5zFjqCwlFhjGhXHmpfyyaS07RU0RhW3gKkOueHtmgwtvdkSpMdAaW0Wqo0pDpj9RDbwVvn3n-XrrOOzzTgAQ0PeARrgquo.2cPGBg0lDW4kXD-IklNSzA','AB11725746137EcSFJgm6O3VaMUlfycguAwdIz0ywa3Fi4ZYSH','bearer',3600,8726400,'f7948956c8074732aeb6d21e80047f39','9341451981840406',NULL,'13370ee8010c4f92bf923b42157590b6');
/*!40000 ALTER TABLE `miners_quickbookstoken` ENABLE KEYS */;
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
  KEY `payment_invoice_user_id_4d12c4a3_fk_user_account_user_id` (`user_id`),
  CONSTRAINT `payment_invoice_billing_plan_id_6ad2a45a_fk_payment_b` FOREIGN KEY (`billing_plan_id`) REFERENCES `payment_billingplan` (`id`),
  CONSTRAINT `payment_invoice_user_id_4d12c4a3_fk_user_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
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
-- Table structure for table `questionnaire_industry`
--

DROP TABLE IF EXISTS `questionnaire_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_industry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_industry`
--

LOCK TABLES `questionnaire_industry` WRITE;
/*!40000 ALTER TABLE `questionnaire_industry` DISABLE KEYS */;
INSERT INTO `questionnaire_industry` VALUES (33,'Affiliate marketing'),(32,'Boadu'),(31,'Bright'),(30,'Child care'),(29,'Cleaning service'),(28,'Coaches'),(27,'Content creator'),(26,'Copy writing'),(25,'Credit score'),(24,'Cyber security'),(23,'Digital marketing agency'),(22,'E-commerce'),(21,'Electrician'),(20,'Event planner'),(19,'Event space'),(18,'Hvac'),(17,'Insurance'),(16,'Interior design'),(15,'Land scaping'),(14,'Lawyer'),(13,'Mortgage broker'),(12,'Network marketing'),(11,'Plumbing'),(10,'Podcast'),(9,'Professional services'),(1,'Real estate'),(8,'Real estate agent'),(7,'Restaurant owner'),(6,'Social media manager'),(5,'Software company'),(2,'Sports'),(4,'Travel agency'),(3,'Trucking');
/*!40000 ALTER TABLE `questionnaire_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_questions`
--

DROP TABLE IF EXISTS `questionnaire_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questions` json DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `number_of_questions` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_questions`
--

LOCK TABLES `questionnaire_questions` WRITE;
/*!40000 ALTER TABLE `questionnaire_questions` DISABLE KEYS */;
INSERT INTO `questionnaire_questions` VALUES (7,'{\"questions_to_score\": {\"Inquiries\": [{\"None within 12 months\": 7.5}, {\"1-2\": 15}, {\"3-4\": 22.5}, {\"5 or more\": 30}], \"Collections\": [{\"1\": 9.9}, {\"2-3\": 19.8}, {\"4 or more\": 29.7}], \"Web Traffic\": [{\"Less than 1,000 visitors per month\": 6}, {\"1,000-5,000 visitors per month\": 12}, {\"5,000-10,000 visitors per month\": 18}, {\"10,000-50,000 visitors per month\": 24}, {\"More than 50,000 visitors per month\": 30}], \"Sales Growth\": [{\"Less than 5%\": 6}, {\"5-10%\": 12}, {\"10-20%\": 18}, {\"20-30%\": 24}, {\"30%\": 30}], \"Utilization Ratio\": [{\"10%\": 7.5}, {\"10-30%\": 15}, {\"30-50%\": 22.5}, {\"50% above\": 30}], \"Audit Preparedness\": [{\"2-3\": 9.9}, {\"4-5\": 19.8}, {\"6 or more\": 29.7}], \"CPC Cost Per Click\": [{\"$5\": 6}, {\"$4-$3\": 12}, {\"$2-$1\": 18}, {\"$0.99-$0.50\": 24}, {\"<$0.5\": 30}], \"Tax Filing Accuracy\": [{\"1-2\": 9.9}, {\"3-5\": 19.8}, {\"6 or more\": 29.7}], \"Customer Acquisition\": [{\"Less than $100\": 6}, {\"$100-$200\": 12}, {\"$200-$500\": 18}, {\"$500-$1000\": 24}, {\"More than $1000\": 30}], \"Sales Conversion Rate\": [{\"Less than 10%\": 6}, {\"10-20%\": 12}, {\"20-30%\": 18}, {\"30-40%\": 24}, {\"More than 40%\": 30}], \"Upsell and Cross-Sell\": [{\"Less than 10%\": 6}, {\"10-20%\": 12}, {\"20-30%\": 18}, {\"30-40%\": 24}, {\"40%\": 30}], \"Social Media Engagement\": [{\"Less than 1%\": 6}, {\"2-3%\": 12}, {\"More than 4%\": 18}, {\"1-2%\": 24}, {\"3-4%\": 30}], \"Length of Credit History\": [{\"7 years above\": 7.5}, {\"5-7 years\": 15}, {\"2-5 years\": 22.5}, {\"Less than 2 years\": 30}], \"How old is your business?\": [{\"0-1\": 6}, {\"1-2\": 12}, {\"3-5\": 18}, {\"3-5\": 24}, {\"10+\": 30}], \"Mean Time to Detect (MTTD)\": [{\"Good: 1 hour to 24 hours\": 15}, {\"Fair: 1 day to 1 week\": 22.5}, {\"Poor: More than 1 week\": 30}], \"Number of Security Incidents\": [{\"1-2\": 9.9}, {\"3-5\": 19.8}, {\"6 or more\": 29.7}], \"Please specify your expenses\": [{\"<$50,000\": 6}, {\"$50,000-$100,000\": 12}, {\"$100,000-$500,000\": 18}, {\"$500,000-$1 million\": 24}, {\"$1 million\": 30}], \"Tell us about your Cash Flow\": [{\"Negative cash flow\": 6}, {\"Breakeven cash flow\": 12}, {\"Positive cash flow\": 18}, {\"Positive cash flow and growing\": 24}, {\"Strong positive cash flow and growing\": 30}], \"Customer Lifetime Value (LTV)\": [{\"Less than $1000\": 6}, {\"$1000-$2000\": 12}, {\"$2000-$5000\": 18}, {\"$5000-$10000\": 24}, {\"More than $10000\": 30}], \"Tell us about your Net Profit\": [{\"Less than 5%\": 6}, {\"5-10%\": 12}, {\"10-15%\": 18}, {\"15-20%\": 24}, {\"More than 20%\": 30}], \"User Behavior Analytics (UBA)\": [{\"Good: 2-5 false positives per week\": 15}, {\"Fair: 6-10 false positives per week\": 22.5}, {\"Poor: More than 10 false positives per week\": 30}], \"How often are you under audit?\": [{\"frequent Audits\": 15}, {\"Infrequent Audits\": 30}], \"Please tell us about your business\": [{\"Incorporated Company\": 15}, {\"Sole Proprietor\": 30}], \"Please specify your annual revenues\": [{\"<$100,000\": 6}, {\"$100,000-$500,000\": 12}, {\"$500,000-$1 million\": 18}, {\"$1 million-$5 million\": 24}, {\"$5 million\": 30}], \"What is your business\'s repeat business rate?\": [{\"0-20%\": 6}, {\"21-40%\": 12}, {\"41-60%\": 18}, {\"61-80%\": 24}, {\"81-100%\": 30}], \"How much working capital does your business have?\": [{\"Negative working capital\": 6}, {\"$50,000-$100,000\": 12}, {\"$100,000-$500,000\": 18}, {\"$500,000-$1 million\": 24}, {\"$1 million or more\": 30}, {\"$50,000\": 6}], \"EBITDA (Earnings before interest, taxes, depreciation, and amortization)\": [{\"Positive EBITDA\": 15}, {\"Negative EBITDA\": 30}]}, \"questions_with_no_scores\": {\"What Industry is your business in?\": []}}','2024-05-25 03:58:50.136092',28);
/*!40000 ALTER TABLE `questionnaire_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_userresponse`
--

DROP TABLE IF EXISTS `questionnaire_userresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_userresponse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `business_id` char(32) NOT NULL,
  `responses` json DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  `time` datetime(6) NOT NULL,
  `ratio_completed` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionnaire_userre_business_id_3a47ce82_fk_business_` (`business_id`),
  KEY `questionnaire_userre_user_id_5cd67c95_fk_user_acco` (`user_id`),
  CONSTRAINT `questionnaire_userre_business_id_3a47ce82_fk_business_` FOREIGN KEY (`business_id`) REFERENCES `business_business` (`id`),
  CONSTRAINT `questionnaire_userre_user_id_5cd67c95_fk_user_acco` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_userresponse`
--

LOCK TABLES `questionnaire_userresponse` WRITE;
/*!40000 ALTER TABLE `questionnaire_userresponse` DISABLE KEYS */;
INSERT INTO `questionnaire_userresponse` VALUES (1,'13370ee8010c4f92bf923b42157590b6','{\"questions_to_score\": {\"UBA\": \"\", \"MTTD\": \"\", \"EBITDA\": \"\", \"cpcCost\": \"\", \"revenue\": \"\", \"cashFlow\": \"\", \"expenses\": \"\", \"industry\": \"1\", \"inquiries\": \"\", \"netProfit\": \"\", \"webTraffic\": \"\", \"accountType\": \"15\", \"businessAge\": \"6\", \"collections\": \"\", \"salesGrowth\": \"\", \"creditHistory\": \"\", \"auditFrequency\": \"15\", \"workingCapital\": \"\", \"upsellCrossSell\": \"\", \"utilizationRatio\": \"\", \"auditPreparedness\": \"30\", \"securityIncidents\": \"\", \"taxFilingAccuracy\": \"\", \"repeatBusinessRate\": \"\", \"customerAcquisition\": \"\", \"salesConversionRate\": \"\", \"customerLifetimeValue\": \"\", \"socialMediaEngagement\": \"\"}}','f7948956c8074732aeb6d21e80047f39','2024-05-22 05:20:50.961565','5/28'),(2,'c48aa9c9afad48bbbb3c1674ae0fed69','{\"UBA\": \"excellent\", \"MTTD\": \"fair\", \"EBITDA\": \"Positive EBITDA\", \"cpcCost\": [0, 5], \"revenue\": [500000, 1000000], \"cashFlow\": \"Negative cash flow\", \"expenses\": [50000, 500000], \"industry\": \"1\", \"inquiries\": \"None within 12 months\", \"netProfit\": [0, 20], \"webTraffic\": \"\", \"accountType\": \"Incorporated Company\", \"businessAge\": \"0-1\", \"collections\": \"2-3\", \"salesGrowth\": \"Less than 5%\", \"creditHistory\": \"7 years above\", \"auditFrequency\": \"Frequent Audits\", \"workingCapital\": [50000, 2000000], \"upsellCrossSell\": \"20-30%\", \"utilizationRatio\": \"10%\", \"auditPreparedness\": \"4-5\", \"securityIncidents\": \"0\", \"taxFilingAccuracy\": \"0\", \"repeatBusinessRate\": \"41-60%\", \"customerAcquisition\": [0, 1000], \"salesConversionRate\": \"20-30%\", \"customerLifetimeValue\": [0, 10000], \"socialMediaEngagement\": \"Less than 1%\"}','f7948956c8074732aeb6d21e80047f39','2024-05-23 19:59:00.084468',NULL);
/*!40000 ALTER TABLE `questionnaire_userresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_social_user_id_8146e70c_fk_user_acco` (`user_id`),
  CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_user_acco` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_user`
--

DROP TABLE IF EXISTS `user_account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account_user` (
  `password` varchar(128) NOT NULL,
  `id` char(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email_verified` tinyint(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `default_company_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_account_user_default_company_id_83f727e3_fk_business_` (`default_company_id`),
  CONSTRAINT `user_account_user_default_company_id_83f727e3_fk_business_` FOREIGN KEY (`default_company_id`) REFERENCES `business_business` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_user`
--

LOCK TABLES `user_account_user` WRITE;
/*!40000 ALTER TABLE `user_account_user` DISABLE KEYS */;
INSERT INTO `user_account_user` VALUES ('pbkdf2_sha256$720000$GzJPNzr6tRlum6lXy0Cd9k$+e6FNWNwKOK9qpCzx9fUEGeyLvgF7qTtMUycwoKcOq0=','f7948956c8074732aeb6d21e80047f39','brbojr@gmail.com','','',1,1,1,0,NULL,NULL,NULL,NULL,'2024-05-17 04:02:01.930388','2024-05-29 20:29:37.165052','13370ee8010c4f92bf923b42157590b6');
/*!40000 ALTER TABLE `user_account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_user_groups`
--

DROP TABLE IF EXISTS `user_account_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_account_user_groups_user_id_group_id_824a334c_uniq` (`user_id`,`group_id`),
  KEY `user_account_user_groups_group_id_653cb1de_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_account_user_gr_user_id_b23ae512_fk_user_acco` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`),
  CONSTRAINT `user_account_user_groups_group_id_653cb1de_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_user_groups`
--

LOCK TABLES `user_account_user_groups` WRITE;
/*!40000 ALTER TABLE `user_account_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_user_user_permissions`
--

DROP TABLE IF EXISTS `user_account_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_account_user_user_p_user_id_permission_id_94495382_uniq` (`user_id`,`permission_id`),
  KEY `user_account_user_us_permission_id_212525d8_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_account_user_us_permission_id_212525d8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_account_user_us_user_id_4e44a0bb_fk_user_acco` FOREIGN KEY (`user_id`) REFERENCES `user_account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_user_user_permissions`
--

LOCK TABLES `user_account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_account_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-29 21:40:15
