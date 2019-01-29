-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: laraadmin
-- ------------------------------------------------------
-- Server version	5.5.35-1ubuntu1

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
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_name_unique` (`name`),
  UNIQUE KEY `backups_file_name_unique` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` int(10) unsigned DEFAULT NULL,
  `phone_primary` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_source` int(10) unsigned DEFAULT NULL,
  `department` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_secondary` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email2` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `assistant` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assistant_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `profile_picture` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contacts_email_unique` (`email`),
  KEY `contacts_organization_foreign` (`organization`),
  KEY `contacts_lead_source_foreign` (`lead_source`),
  KEY `contacts_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `contacts_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contacts_lead_source_foreign` FOREIGN KEY (`lead_source`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contacts_organization_foreign` FOREIGN KEY (`organization`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Administration','[]','#000',NULL,'2018-12-26 07:26:23','2018-12-26 07:26:23');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `dept` int(10) unsigned DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `date_hire` date DEFAULT NULL,
  `date_left` date DEFAULT NULL,
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_dept_foreign` (`dept`),
  CONSTRAINT `employees_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'root','Super Admin','Male','8888888888','','admin@admin.com',1,'Pune','Karve nagar, Pune 411030','About user / biography','2018-12-26','2018-12-26','2018-12-26',0.000,NULL,'2018-12-26 07:26:38','2018-12-26 07:26:38');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_types`
--

DROP TABLE IF EXISTS `industry_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_types`
--

LOCK TABLES `industry_types` WRITE;
/*!40000 ALTER TABLE `industry_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_configs`
--

DROP TABLE IF EXISTS `la_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_configs`
--

LOCK TABLES `la_configs` WRITE;
/*!40000 ALTER TABLE `la_configs` DISABLE KEYS */;
INSERT INTO `la_configs` VALUES (1,'sitename','','LaraAdmin 1.0','2018-12-26 07:26:23','2018-12-26 08:16:47'),(2,'sitename_part1','','Lara','2018-12-26 07:26:23','2018-12-26 08:16:47'),(3,'sitename_part2','','Admin 1.0','2018-12-26 07:26:23','2018-12-26 08:16:47'),(4,'sitename_short','','LA','2018-12-26 07:26:23','2018-12-26 08:16:48'),(5,'site_description','','LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.','2018-12-26 07:26:23','2018-12-26 08:16:48'),(6,'sidebar_search','','1','2018-12-26 07:26:23','2018-12-26 08:16:48'),(7,'show_messages','','1','2018-12-26 07:26:23','2018-12-26 08:16:48'),(8,'show_notifications','','1','2018-12-26 07:26:23','2018-12-26 08:16:48'),(9,'show_tasks','','1','2018-12-26 07:26:23','2018-12-26 08:16:48'),(10,'show_rightsidebar','','1','2018-12-26 07:26:23','2018-12-26 08:16:48'),(11,'skin','','skin-white','2018-12-26 07:26:23','2018-12-26 08:16:48'),(12,'layout','','fixed','2018-12-26 07:26:23','2018-12-26 08:16:48'),(13,'default_email','','test@example.com','2018-12-26 07:26:23','2018-12-26 08:16:48');
/*!40000 ALTER TABLE `la_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_menus`
--

DROP TABLE IF EXISTS `la_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `hierarchy` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_menus`
--

LOCK TABLES `la_menus` WRITE;
/*!40000 ALTER TABLE `la_menus` DISABLE KEYS */;
INSERT INTO `la_menus` VALUES (1,'Team','#','fa-group','custom',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(2,'Users','users','fa-group','module',1,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(3,'Uploads','uploads','fa-files-o','module',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(4,'Departments','departments','fa-tags','module',1,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(5,'Employees','employees','fa-group','module',1,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(6,'Roles','roles','fa-user-plus','module',1,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(7,'Organizations','organizations','fa-university','module',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(8,'Permissions','permissions','fa-magic','module',1,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(9,'Contacts','contacts','fa-user','module',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(10,'Leads','leads','fa-check-square-o','module',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(11,'Opportunities','opportunities','fa-lightbulb-o','module',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(12,'Projects','projects','fa-clone','module',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(13,'Tickets','tickets','fa-ticket','module',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22');
/*!40000 ALTER TABLE `la_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone_primary` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `phone_secondary` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_primary` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_secondary` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `industry` int(10) unsigned DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `employee_count` int(11) NOT NULL DEFAULT '1',
  `address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_industry_foreign` (`industry`),
  KEY `leads_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `leads_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leads_industry_foreign` FOREIGN KEY (`industry`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (4,'2014_05_26_050000_create_modules_table',1),(5,'2014_05_26_055000_create_module_field_types_table',1),(6,'2014_05_26_060000_create_module_fields_table',1),(7,'2014_10_12_000000_create_users_table',1),(8,'2014_10_12_100000_create_password_resets_table',1),(9,'2014_12_01_000000_create_uploads_table',1),(10,'2016_05_26_064006_create_departments_table',1),(11,'2016_05_26_064007_create_employees_table',1),(12,'2016_05_26_064446_create_roles_table',1),(13,'2016_07_05_115343_create_role_user_table',1),(14,'2016_07_06_1406376_create_industry_types_table',1),(15,'2016_07_06_140637_create_organizations_table',1),(16,'2016_07_07_134058_create_backups_table',1),(17,'2016_07_07_134058_create_menus_table',1),(18,'2016_09_10_163337_create_permissions_table',1),(19,'2016_09_10_163520_create_permission_role_table',1),(20,'2016_09_22_105958_role_module_fields_table',1),(21,'2016_09_22_110008_role_module_table',1),(22,'2016_10_06_115413_create_la_configs_table',1),(23,'2016_11_16_123515_create_contacts_table',1),(24,'2016_11_17_063011_create_leads_table',1),(25,'2016_11_17_064710_create_opportunities_table',1),(26,'2016_11_17_080230_create_projects_table',1),(27,'2016_11_17_093246_create_tickets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_field_types`
--

DROP TABLE IF EXISTS `module_field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_field_types`
--

LOCK TABLES `module_field_types` WRITE;
/*!40000 ALTER TABLE `module_field_types` DISABLE KEYS */;
INSERT INTO `module_field_types` VALUES (1,'Address','2018-12-26 07:26:21','2018-12-26 07:26:21'),(2,'Checkbox','2018-12-26 07:26:21','2018-12-26 07:26:21'),(3,'Currency','2018-12-26 07:26:21','2018-12-26 07:26:21'),(4,'Date','2018-12-26 07:26:21','2018-12-26 07:26:21'),(5,'Datetime','2018-12-26 07:26:21','2018-12-26 07:26:21'),(6,'Decimal','2018-12-26 07:26:21','2018-12-26 07:26:21'),(7,'Dropdown','2018-12-26 07:26:21','2018-12-26 07:26:21'),(8,'Email','2018-12-26 07:26:21','2018-12-26 07:26:21'),(9,'File','2018-12-26 07:26:21','2018-12-26 07:26:21'),(10,'Float','2018-12-26 07:26:21','2018-12-26 07:26:21'),(11,'HTML','2018-12-26 07:26:21','2018-12-26 07:26:21'),(12,'Image','2018-12-26 07:26:21','2018-12-26 07:26:21'),(13,'Integer','2018-12-26 07:26:21','2018-12-26 07:26:21'),(14,'Mobile','2018-12-26 07:26:21','2018-12-26 07:26:21'),(15,'Multiselect','2018-12-26 07:26:21','2018-12-26 07:26:21'),(16,'Name','2018-12-26 07:26:21','2018-12-26 07:26:21'),(17,'Password','2018-12-26 07:26:21','2018-12-26 07:26:21'),(18,'Radio','2018-12-26 07:26:21','2018-12-26 07:26:21'),(19,'String','2018-12-26 07:26:21','2018-12-26 07:26:21'),(20,'Taginput','2018-12-26 07:26:21','2018-12-26 07:26:21'),(21,'Textarea','2018-12-26 07:26:21','2018-12-26 07:26:21'),(22,'TextField','2018-12-26 07:26:21','2018-12-26 07:26:21'),(23,'URL','2018-12-26 07:26:21','2018-12-26 07:26:21'),(24,'Files','2018-12-26 07:26:21','2018-12-26 07:26:21');
/*!40000 ALTER TABLE `module_field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_fields`
--

DROP TABLE IF EXISTS `module_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `field_type` int(10) unsigned NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `listing_col` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_fields_module_foreign` (`module`),
  KEY `module_fields_field_type_foreign` (`field_type`),
  CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_fields`
--

LOCK TABLES `module_fields` WRITE;
/*!40000 ALTER TABLE `module_fields` DISABLE KEYS */;
INSERT INTO `module_fields` VALUES (1,'name','Name',1,16,0,'',5,250,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(2,'context_id','Context',1,13,0,'0',0,0,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(3,'email','Email',1,8,1,'',0,250,0,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(4,'password','Password',1,17,0,'',6,250,1,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(5,'type','User Type',1,7,0,'Employee',0,0,0,'[\"Employee\",\"Client\"]',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(6,'name','Name',2,16,0,'',5,250,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(7,'path','Path',2,19,0,'',0,250,0,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(8,'extension','Extension',2,19,0,'',0,20,0,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(9,'caption','Caption',2,19,0,'',0,250,0,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(10,'user_id','Owner',2,7,0,'1',0,0,0,'@users',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(11,'hash','Hash',2,19,0,'',0,250,0,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(12,'public','Is Public',2,2,0,'0',0,0,0,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(13,'name','Name',3,16,1,'',1,250,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(14,'tags','Tags',3,20,0,'[]',0,0,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(15,'color','Color',3,19,0,'',0,50,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(16,'name','Name',4,16,0,'',5,250,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(17,'designation','Designation',4,19,0,'',0,50,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(18,'gender','Gender',4,18,0,'Male',0,0,1,'[\"Male\",\"Female\"]',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(19,'mobile','Mobile',4,14,0,'',10,20,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(20,'mobile2','Alternative Mobile',4,14,0,'',10,20,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(21,'email','Email',4,8,1,'',5,250,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(22,'dept','Department',4,7,0,'0',0,0,1,'@departments',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(23,'city','City',4,19,0,'',0,50,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(24,'address','Address',4,1,0,'',0,1000,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(25,'about','About',4,19,0,'',0,0,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(26,'date_birth','Date of Birth',4,4,0,'NULL',0,0,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(27,'date_hire','Hiring Date',4,4,0,'NULL',0,0,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(28,'date_left','Resignation Date',4,4,0,'NULL',0,0,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(29,'salary_cur','Current Salary',4,6,0,'0.0',0,2,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(30,'name','Name',5,16,1,'',1,250,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(31,'display_name','Display Name',5,19,0,'',0,250,1,'',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(32,'description','Description',5,21,0,'',0,1000,0,'',0,0,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(33,'parent','Parent Role',5,7,0,'1',0,0,0,'@roles',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(34,'dept','Department',5,7,0,'1',0,0,0,'@departments',0,1,'2018-12-26 07:26:21','2018-12-26 07:26:21'),(35,'name','Name',6,16,1,'',5,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(36,'email','Email',6,8,0,'',0,250,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(37,'phone','Phone',6,14,0,'',0,20,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(38,'website','Website',6,23,0,'',0,250,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(39,'assigned_to','Assigned to',6,7,0,'0',0,0,0,'@employees',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(40,'connected_since','Connected Since',6,4,0,'NULL',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(41,'address','Address',6,1,0,'',0,1000,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(42,'city','City',6,19,0,'',0,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(43,'description','Description',6,21,0,'',0,1000,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(44,'profile_image','Profile Image',6,12,0,'',0,250,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(45,'profile','Company Profile',6,9,0,'',0,250,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(46,'name','Name',7,16,1,'',0,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(47,'file_name','File Name',7,19,1,'',0,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(48,'backup_size','File Size',7,19,0,'0',0,10,1,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(49,'name','Name',8,16,1,'',1,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(50,'display_name','Display Name',8,19,0,'',0,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(51,'description','Description',8,21,0,'',0,1000,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(52,'designation','Designation',9,7,0,'',0,5,1,'[\"None\",\"Mr.\",\"Ms.\",\"Mrs.\",\"Dr.\",\"Prof.\"]',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(53,'first_name','First Name',9,16,0,'',0,256,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(54,'last_name','Last Name',9,16,0,'',0,256,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(55,'title','Title',9,19,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(56,'organization','Organization Name  ',9,7,0,'',0,0,0,'@organizations',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(57,'phone_primary','Primary Phone',9,14,0,'',10,20,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(58,'email','Primary Email',9,8,1,'',0,250,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(59,'lead_source','Lead Source',9,7,0,'',0,0,0,'@industry_types',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(60,'department','Department',9,19,0,'',0,256,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(61,'phone_secondary','Secondary Phone',9,14,0,'',10,20,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(62,'home_phone','Home Phone',9,14,0,'',10,20,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(63,'email2','Secondary Email',9,8,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(64,'dob','Date of Birth',9,4,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(65,'assistant','Assistant',9,19,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(66,'assistant_phone','Assistant Phone',9,14,0,'',0,20,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(67,'assigned_to','Assigned To',9,7,0,'',0,0,1,'@employees',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(68,'address','Address',9,1,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(69,'city','City',9,1,0,'',1,50,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(70,'country','Country',9,1,0,'',1,50,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(71,'description','Description',9,21,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(72,'profile_picture','Contact Image',9,24,0,'',0,0,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(73,'first_name','First Name',10,16,0,'',1,100,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(74,'last_name','Last Name',10,16,0,'',1,100,1,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(75,'phone_primary','Primary Phone',10,14,0,'',10,20,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(76,'phone_secondary','Secondary Phone',10,14,0,'',10,20,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(77,'email_primary','Primary Email',10,8,0,'',0,256,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(78,'email_secondary','Secondary Email',10,8,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(79,'company','Company',10,19,0,'',0,256,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(80,'title','Title',10,19,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(81,'lead_source','Lead Source',10,7,0,'',0,0,0,'[\"Cold Call\",\"Existing Customer\",\"Self Generated\",\"Employee\",\"Partner\",\"Public Relation\",\"Direct Mail\",\"Conference\",\"Trade Show\",\"Web Site\",\"Word of mouth\",\"Other\"]',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(82,'industry','Industry',10,7,0,'',0,0,0,'@industry_types',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(83,'assigned_to','Assigned To',10,7,0,'',0,0,0,'@employees',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(84,'employee_count','Number of Employees',10,13,0,'1',1,11,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(85,'address','Address',10,1,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(86,'city','City',10,1,0,'',1,50,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(87,'country','Country',10,1,0,'',1,50,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(88,'description','Description',10,21,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(89,'name','Name',11,16,1,'',0,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(90,'organization','Organization',11,7,0,'',0,0,0,'@organizations',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(91,'contact','Contact',11,7,0,'',0,0,0,'@contacts',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(92,'amount','Amount',11,13,0,'0',0,11,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(93,'expected_close_date','Expected close date',11,4,0,'',0,0,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(94,'next_step','Next Step',11,22,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(95,'assigned_to','Assigned to',11,7,0,'',0,0,0,'@employees',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(96,'type','Type',11,18,0,'Existing Business',0,0,0,'[\"Existing Business\",\"New Business\"]',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(97,'lead_source','Lead source',11,7,0,'',0,0,0,'[\"Cold Call\",\"Existing Customer\",\"Self Generated\",\"Employee\",\"Partner\",\"Public Relations\",\"Direct Mail\",\"Conference\",\"Trade Show\",\"Web Site\",\"Word of mouth\",\"Other\"]',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(98,'sales_stage','Sales stage',11,7,0,'',0,0,0,'[\"Prospecting\",\"Qualification\",\"Needs Analysis\",\"Value Proposition\",\"Identify Decision Makers\",\"Perception Analysis\",\"Proposal or Price Quote\",\"Negotiation or Review\",\"Closed Won\",\"Closed Lost\"]',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(99,'probability','Probability',11,13,0,'0',0,100,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(100,'forecast_amount','Forecast Amount',11,13,0,'0',0,11,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(101,'description','Description',11,21,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(102,'name','Project Name',12,16,1,'',0,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(103,'start_date','Start Date',12,4,0,'',0,0,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(104,'target_end_date','Target End Date',12,4,0,'',0,0,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(105,'actual_end_date','Actual End Date',12,4,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(106,'assigned_to','Assigned To',12,7,0,'',0,0,0,'@employees',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(107,'status','Status',12,7,0,'',0,0,0,'[\"prospecting\",\"initiated\",\"in progress\",\"waiting for feedback\",\"on hold\",\"completed\",\"delivered\",\"archived\"]',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(108,'type','Type',12,7,0,'',0,0,0,'@industry_types',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(109,'organization','Organization',12,7,0,'',0,0,0,'@organizations',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(110,'target_budget','Target Budget',12,13,0,'',1,100,0,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(111,'project_url','Project Url',12,19,0,'',0,256,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(112,'priority','Priority',12,18,0,'',0,0,0,'[\"low\",\"normal\",\"high\"]',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(113,'description','Description',12,21,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(114,'title','Title',13,16,0,'',0,250,1,'',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(115,'organization','Organization',13,7,0,'',0,0,0,'@organizations',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(116,'contact','Contact',13,7,0,'',0,0,0,'@contacts',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(117,'assigned_to','Assigned to',13,7,0,'',0,0,1,'@employees',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(118,'project','Project',13,7,0,'',0,0,0,'@projects',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(119,'priority','Priority',13,18,0,'',0,0,0,'[\"Low\",\"Normal\",\"High\",\"Urgent\"]',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(120,'status','Status',13,7,0,'',0,0,1,'[\"Open\",\"In Progress\",\"Wait For Response\",\"Closed\"]',0,1,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(121,'hours','Hours',13,13,0,'',0,11,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(122,'description','Description',13,21,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22'),(123,'solution','Solution',13,21,0,'',0,0,0,'',0,0,'2018-12-26 07:26:22','2018-12-26 07:26:22');
/*!40000 ALTER TABLE `module_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Users','Users','users','name','User','UsersController','fa-group',1,'2018-12-26 07:26:21','2018-12-26 07:26:23'),(2,'Uploads','Uploads','uploads','name','Upload','UploadsController','fa-files-o',1,'2018-12-26 07:26:21','2018-12-26 07:26:23'),(3,'Departments','Departments','departments','name','Department','DepartmentsController','fa-tags',1,'2018-12-26 07:26:21','2018-12-26 07:26:23'),(4,'Employees','Employees','employees','name','Employee','EmployeesController','fa-group',1,'2018-12-26 07:26:21','2018-12-26 07:26:23'),(5,'Roles','Roles','roles','name','Role','RolesController','fa-user-plus',1,'2018-12-26 07:26:21','2018-12-26 07:26:23'),(6,'Organizations','Organizations','organizations','name','Organization','OrganizationsController','fa-university',1,'2018-12-26 07:26:21','2018-12-26 07:26:23'),(7,'Backups','Backups','backups','name','Backup','BackupsController','fa-hdd-o',1,'2018-12-26 07:26:22','2018-12-26 07:26:23'),(8,'Permissions','Permissions','permissions','name','Permission','PermissionsController','fa-magic',1,'2018-12-26 07:26:22','2018-12-26 07:26:23'),(9,'Contacts','Contacts','contacts','first_name','Contact','ContactsController','fa-user',1,'2018-12-26 07:26:22','2018-12-26 07:26:23'),(10,'Leads','Leads','leads','first_name','Lead','LeadsController','fa-check-square-o',1,'2018-12-26 07:26:22','2018-12-26 07:26:23'),(11,'Opportunities','Opportunities','opportunities','name','Opportunity','OpportunitiesController','fa-lightbulb-o',1,'2018-12-26 07:26:22','2018-12-26 07:26:23'),(12,'Projects','Projects','projects','name','Project','ProjectsController','fa-clone',1,'2018-12-26 07:26:22','2018-12-26 07:26:23'),(13,'Tickets','Tickets','tickets','title','Ticket','TicketsController','fa-ticket',1,'2018-12-26 07:26:22','2018-12-26 07:26:23');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` int(10) unsigned DEFAULT NULL,
  `contact` int(10) unsigned DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `expected_close_date` date DEFAULT NULL,
  `next_step` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Existing Business',
  `lead_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sales_stage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `probability` int(11) NOT NULL DEFAULT '0',
  `forecast_amount` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opportunities_name_unique` (`name`),
  KEY `opportunities_organization_foreign` (`organization`),
  KEY `opportunities_contact_foreign` (`contact`),
  KEY `opportunities_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `opportunities_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opportunities_contact_foreign` FOREIGN KEY (`contact`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opportunities_organization_foreign` FOREIGN KEY (`organization`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `connected_since` date DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_image` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`),
  KEY `organizations_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `organizations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'ADMIN_PANEL','Admin Panel','Admin Panel Permission',NULL,'2018-12-26 07:26:23','2018-12-26 07:26:23');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `start_date` date DEFAULT NULL,
  `target_end_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `organization` int(10) unsigned DEFAULT NULL,
  `target_budget` int(11) NOT NULL DEFAULT '0',
  `project_url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_unique` (`name`),
  KEY `projects_assigned_to_foreign` (`assigned_to`),
  KEY `projects_type_foreign` (`type`),
  KEY `projects_organization_foreign` (`organization`),
  CONSTRAINT `projects_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_organization_foreign` FOREIGN KEY (`organization`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_type_foreign` FOREIGN KEY (`type`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_module`
--

DROP TABLE IF EXISTS `role_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_role_id_foreign` (`role_id`),
  KEY `role_module_module_id_foreign` (`module_id`),
  CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_module`
--

LOCK TABLES `role_module` WRITE;
/*!40000 ALTER TABLE `role_module` DISABLE KEYS */;
INSERT INTO `role_module` VALUES (1,1,1,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(2,1,2,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(3,1,3,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(4,1,4,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(5,1,5,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(6,1,6,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(7,1,7,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(8,1,8,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(9,1,9,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(10,1,10,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(11,1,11,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(12,1,12,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23'),(13,1,13,1,1,1,1,'2018-12-26 07:26:23','2018-12-26 07:26:23');
/*!40000 ALTER TABLE `role_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_module_fields`
--

DROP TABLE IF EXISTS `role_module_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_fields_role_id_foreign` (`role_id`),
  KEY `role_module_fields_field_id_foreign` (`field_id`),
  CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_module_fields`
--

LOCK TABLES `role_module_fields` WRITE;
/*!40000 ALTER TABLE `role_module_fields` DISABLE KEYS */;
INSERT INTO `role_module_fields` VALUES (1,1,1,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(2,1,2,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(3,1,3,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(4,1,4,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(5,1,5,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(6,1,6,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(7,1,7,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(8,1,8,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(9,1,9,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(10,1,10,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(11,1,11,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(12,1,12,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(13,1,13,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(14,1,14,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(15,1,15,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(16,1,16,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(17,1,17,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(18,1,18,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(19,1,19,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(20,1,20,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(21,1,21,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(22,1,22,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(23,1,23,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(24,1,24,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(25,1,25,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(26,1,26,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(27,1,27,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(28,1,28,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(29,1,29,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(30,1,30,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(31,1,31,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(32,1,32,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(33,1,33,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(34,1,34,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(35,1,35,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(36,1,36,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(37,1,37,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(38,1,38,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(39,1,39,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(40,1,40,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(41,1,41,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(42,1,42,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(43,1,43,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(44,1,44,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(45,1,45,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(46,1,46,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(47,1,47,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(48,1,48,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(49,1,49,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(50,1,50,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(51,1,51,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(52,1,52,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(53,1,53,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(54,1,54,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(55,1,55,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(56,1,56,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(57,1,57,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(58,1,58,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(59,1,59,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(60,1,60,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(61,1,61,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(62,1,62,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(63,1,63,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(64,1,64,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(65,1,65,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(66,1,66,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(67,1,67,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(68,1,68,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(69,1,69,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(70,1,70,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(71,1,71,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(72,1,72,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(73,1,73,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(74,1,74,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(75,1,75,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(76,1,76,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(77,1,77,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(78,1,78,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(79,1,79,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(80,1,80,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(81,1,81,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(82,1,82,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(83,1,83,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(84,1,84,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(85,1,85,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(86,1,86,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(87,1,87,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(88,1,88,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(89,1,89,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(90,1,90,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(91,1,91,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(92,1,92,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(93,1,93,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(94,1,94,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(95,1,95,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(96,1,96,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(97,1,97,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(98,1,98,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(99,1,99,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(100,1,100,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(101,1,101,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(102,1,102,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(103,1,103,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(104,1,104,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(105,1,105,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(106,1,106,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(107,1,107,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(108,1,108,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(109,1,109,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(110,1,110,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(111,1,111,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(112,1,112,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(113,1,113,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(114,1,114,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(115,1,115,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(116,1,116,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(117,1,117,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(118,1,118,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(119,1,119,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(120,1,120,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(121,1,121,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(122,1,122,'write','2018-12-26 07:26:23','2018-12-26 07:26:23'),(123,1,123,'write','2018-12-26 07:26:23','2018-12-26 07:26:23');
/*!40000 ALTER TABLE `role_module_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT '1',
  `dept` int(10) unsigned DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  KEY `roles_parent_foreign` (`parent`),
  KEY `roles_dept_foreign` (`dept`),
  CONSTRAINT `roles_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SUPER_ADMIN','Super Admin','Full Access Role',1,1,NULL,'2018-12-26 07:26:23','2018-12-26 07:26:23');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` int(10) unsigned DEFAULT NULL,
  `contact` int(10) unsigned DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `project` int(10) unsigned DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `hours` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `solution` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_organization_foreign` (`organization`),
  KEY `tickets_contact_foreign` (`contact`),
  KEY `tickets_assigned_to_foreign` (`assigned_to`),
  KEY `tickets_project_foreign` (`project`),
  CONSTRAINT `tickets_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_contact_foreign` FOREIGN KEY (`contact`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_organization_foreign` FOREIGN KEY (`organization`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_project_foreign` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root',1,'admin@admin.com','$2y$10$y60HE6JhmIPYJkSwExigXe4GMcJilegbYQsJ4JVKnYM9f7Xkff8Mu','Employee',NULL,NULL,'2018-12-26 07:26:38','2019-01-29 15:25:14');
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

-- Dump completed on 2019-01-29 17:31:53
