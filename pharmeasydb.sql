-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pharmeasydb
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add users',7,'add_users'),(20,'Can change users',7,'change_users'),(21,'Can delete users',7,'delete_users'),(22,'Can add files',8,'add_files'),(23,'Can change files',8,'change_files'),(24,'Can delete files',8,'delete_files'),(25,'Can add shared with',9,'add_sharedwith'),(26,'Can change shared with',9,'change_sharedwith'),(27,'Can delete shared with',9,'delete_sharedwith'),(28,'Can add requested files',10,'add_requestedfiles'),(29,'Can change requested files',10,'change_requestedfiles'),(30,'Can delete requested files',10,'delete_requestedfiles');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (8,'pbkdf2_sha256$24000$cTeUR4mhIgXc$fX0OQZtEp4aT8x7Wr5z6N73kk2tCjuiU9LXvcU0Q9lE=','2018-01-21 14:49:12',1,'test_superuser','','','',1,1,'2018-01-21 14:21:43'),(9,'pbkdf2_sha256$24000$YYnsuz8Io5s0$q4pQ7FZKIOdWIvcD+KeZV6xY+qVsZQjmJHY59ctAxhk=','2018-01-21 14:49:38',0,'test_patient','Patient','','test_patient@gmail.com',0,1,'2018-01-21 14:22:49'),(10,'pbkdf2_sha256$24000$AEzlQShONlaL$Zqj+oWFtd+qKNIsl+YLlHx/gcfnZtGvGz/+lyMoPc50=','2018-01-21 14:30:27',0,'test_doctor','Doctor','Doctor','test_doctor@gmail.com',0,1,'2018-01-21 14:23:29'),(11,'pbkdf2_sha256$24000$dbMFpLsvD4SV$9K0f9if1xleXpv6fuaYJSUlvZWHhRi6c/Ve09a7vb8c=','2018-01-21 14:32:34',0,'test_pharmacist','Pharmacist','','test_pharmacist@gmail.com',0,1,'2018-01-21 14:24:01'),(12,'pbkdf2_sha256$24000$B1xJe8i1C5pu$w7qXH6KR+56Gc6iRdIqxZulfdLKOZO++/n6AEhOBJ7I=','2018-01-21 14:57:04',0,'test_patient2','Patient2','','test_patient2@gmail.com',0,1,'2018-01-21 14:24:41');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (50,'2018-01-21 14:45:45','27','1_dTlkQ5W.jpg',3,'',8,8),(51,'2018-01-21 14:45:45','26','1.jpg',3,'',8,8),(52,'2018-01-21 14:45:45','25','blank-prescription-pad-13985899_wvQyswo.jpg',3,'',8,8),(53,'2018-01-21 14:45:45','24','blank-prescription-pad-13985899.jpg',3,'',8,8),(54,'2018-01-21 14:49:25','28','pres2.jpg',3,'',8,8);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'fileupload','files'),(10,'fileupload','requestedfiles'),(9,'fileupload','sharedwith'),(7,'fileupload','users'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-20 13:59:10'),(2,'auth','0001_initial','2018-01-20 13:59:13'),(3,'admin','0001_initial','2018-01-20 13:59:14'),(4,'admin','0002_logentry_remove_auto_add','2018-01-20 13:59:14'),(5,'contenttypes','0002_remove_content_type_name','2018-01-20 13:59:14'),(6,'auth','0002_alter_permission_name_max_length','2018-01-20 13:59:14'),(7,'auth','0003_alter_user_email_max_length','2018-01-20 13:59:15'),(8,'auth','0004_alter_user_username_opts','2018-01-20 13:59:15'),(9,'auth','0005_alter_user_last_login_null','2018-01-20 13:59:15'),(10,'auth','0006_require_contenttypes_0002','2018-01-20 13:59:15'),(11,'auth','0007_alter_validators_add_error_messages','2018-01-20 13:59:15'),(12,'fileupload','0001_initial','2018-01-20 13:59:16'),(13,'fileupload','0002_auto_20180120_0721','2018-01-20 13:59:17'),(14,'fileupload','0003_auto_20180120_0732','2018-01-20 13:59:20'),(15,'fileupload','0004_auto_20180120_0742','2018-01-20 13:59:21'),(16,'fileupload','0005_auto_20180120_0745','2018-01-20 13:59:22'),(17,'fileupload','0006_auto_20180120_1351','2018-01-20 13:59:23'),(18,'fileupload','0007_auto_20180120_1354','2018-01-20 13:59:23'),(19,'sessions','0001_initial','2018-01-20 13:59:23'),(20,'fileupload','0008_auto_20180121_1324','2018-01-21 13:25:00'),(21,'fileupload','0009_sharedwith_file_shared','2018-01-21 13:45:30');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('j1scqqlc2e0wkgemz011jqcecevgr0yq','NzhkNWRjZDJlNWE3ZGFkM2VjOWIwNGRmZGYxNDU2ZmZiN2M0NjkxMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDNhNmFiMGM4ZGE3YmUyMjkyMmYxZWE4ZjVjYzM4NTA0NDFmY2FiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-02-04 13:18:04');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileupload_files`
--

DROP TABLE IF EXISTS `fileupload_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileupload_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fileupload_files_user_id_6d08bc7f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `fileupload_files_user_id_6d08bc7f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileupload_files`
--

LOCK TABLES `fileupload_files` WRITE;
/*!40000 ALTER TABLE `fileupload_files` DISABLE KEYS */;
INSERT INTO `fileupload_files` VALUES (29,'./pres1.jpg',9,'2018-01-21 14:49:44');
/*!40000 ALTER TABLE `fileupload_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileupload_requestedfiles`
--

DROP TABLE IF EXISTS `fileupload_requestedfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileupload_requestedfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requested_by_id` int(11) NOT NULL,
  `requested_to_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fileupload_requestedfiles_a65ee2fa` (`requested_to_id`),
  KEY `fileupload_requestedfiles_requested_by_id_0a87fdd2_uniq` (`requested_by_id`),
  CONSTRAINT `fileupload_requestedfil_requested_by_id_0a87fdd2_fk_auth_user_id` FOREIGN KEY (`requested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fileupload_requestedfil_requested_to_id_fcb23a51_fk_auth_user_id` FOREIGN KEY (`requested_to_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileupload_requestedfiles`
--

LOCK TABLES `fileupload_requestedfiles` WRITE;
/*!40000 ALTER TABLE `fileupload_requestedfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileupload_requestedfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileupload_sharedwith`
--

DROP TABLE IF EXISTS `fileupload_sharedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileupload_sharedwith` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_shared` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fileupload_sharedwith_file_id_0cc7941d_fk_fileupload_files_id` (`file_id`),
  KEY `fileupload_sharedwith_user_id_34a5472a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `fileupload_sharedwith_file_id_0cc7941d_fk_fileupload_files_id` FOREIGN KEY (`file_id`) REFERENCES `fileupload_files` (`id`),
  CONSTRAINT `fileupload_sharedwith_user_id_34a5472a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileupload_sharedwith`
--

LOCK TABLES `fileupload_sharedwith` WRITE;
/*!40000 ALTER TABLE `fileupload_sharedwith` DISABLE KEYS */;
INSERT INTO `fileupload_sharedwith` VALUES (27,29,10,'2018-01-21 14:56:48');
/*!40000 ALTER TABLE `fileupload_sharedwith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileupload_users`
--

DROP TABLE IF EXISTS `fileupload_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileupload_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(1) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fileupload_users_user_id_cf483cc0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileupload_users`
--

LOCK TABLES `fileupload_users` WRITE;
/*!40000 ALTER TABLE `fileupload_users` DISABLE KEYS */;
INSERT INTO `fileupload_users` VALUES (7,'1','2018-01-21 14:22:49',9),(8,'2','2018-01-21 14:23:30',10),(9,'3','2018-01-21 14:24:01',11),(10,'1','2018-01-21 14:24:41',12);
/*!40000 ALTER TABLE `fileupload_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-21 20:59:34
