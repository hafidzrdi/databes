-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: newbiekoding
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

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
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) DEFAULT NULL,
  `spesifikasi` varchar(255) DEFAULT NULL,
  `kategori` enum('M','A','BHP','BTHP') NOT NULL DEFAULT 'M',
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES
(3,'Laptopp','Asus A409maaaa','M','5UdxqrUQ6tzec38hugGFax0vCavskKoJLQp3Yfuh.png','2023-10-22 08:13:21','2023-10-22 08:27:36'),
(4,'Handphone','Realme','A','0Bno3UHBcjJnPhPCPCIiQRHORiSgAi7WlzXDSstG.jpg','2023-12-05 18:12:17','2023-12-05 18:12:17');
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barangg`
--

DROP TABLE IF EXISTS `barangg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barangg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merk` varchar(50) DEFAULT NULL,
  `seri` varchar(50) DEFAULT NULL,
  `spesifikasi` text DEFAULT NULL,
  `stok` smallint(6) NOT NULL DEFAULT 0,
  `kategori_id` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barangg_kategori_id_foreign` (`kategori_id`),
  CONSTRAINT `barangg_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangg`
--

LOCK TABLES `barangg` WRITE;
/*!40000 ALTER TABLE `barangg` DISABLE KEYS */;
INSERT INTO `barangg` VALUES
(2,'Sharp','AH-A9PEY','1 PK, Daya 900 Watt',0,1,NULL,NULL),
(3,'Asus','S340MC','Processor Intel Core I7, memory 8GB DDR4, HDD SATA 1 TB, OS Win 10 Home, Monitor 19,5 inch',0,2,NULL,NULL),
(4,'HP Hawlett Packard','Pavilion Aero 13 be2001AU','Processor AMD Ryzen, memory 16GB DDR4, SSD 512 GB, OS Win 11 Home, Display 13,3 inch',0,2,NULL,NULL),
(6,'kipas','sanex','dingin',7,1,'2023-12-06 09:03:49','2023-12-06 09:03:49'),
(8,'realme narzo 20','narzo 20','ram 4 gbbb, internal 64 gb, int 64',169,9,'2023-12-06 09:37:25','2023-12-06 18:43:59'),
(10,'d','d','d',4,1,'2023-12-06 18:45:34','2023-12-06 22:30:31'),
(11,'realme narzo 20','pro','23',1,41,'2023-12-06 22:30:54','2023-12-06 22:30:54'),
(12,'oppo iku','a23','ram 4gb',4,17,'2023-12-07 00:26:28','2023-12-07 00:49:12'),
(14,'Robot','R30','stereo',3,15,'2023-12-07 17:10:50','2023-12-07 17:28:18'),
(15,'Robot','R30','stereo',0,16,'2023-12-07 22:47:02','2023-12-07 22:47:02');
/*!40000 ALTER TABLE `barangg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barangkeluar`
--

DROP TABLE IF EXISTS `barangkeluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barangkeluar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_keluar` date NOT NULL,
  `qty_keluar` smallint(6) NOT NULL DEFAULT 1,
  `barang_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barangkeluar_barang_id_foreign` (`barang_id`),
  CONSTRAINT `barangkeluar_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangkeluar`
--

LOCK TABLES `barangkeluar` WRITE;
/*!40000 ALTER TABLE `barangkeluar` DISABLE KEYS */;
INSERT INTO `barangkeluar` VALUES
(2,'2023-12-09',12,4,'2023-12-06 23:49:41','2023-12-06 23:49:41'),
(4,'2023-12-08',4,6,'2023-12-07 00:01:50','2023-12-07 15:34:42'),
(7,'2023-12-13',5,14,'2023-12-07 17:29:05','2023-12-07 17:29:05');
/*!40000 ALTER TABLE `barangkeluar` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER kurgstk AFTER INSERT ON barangkeluar
FOR EACH ROW
BEGIN
    UPDATE barangg SET barangg.stok = barangg.stok - NEW.qty_keluar WHERE barangg.id = NEW.barang_id; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_stok_barangg_keluar
BEFORE UPDATE ON barangkeluar
FOR EACH ROW
BEGIN
    DECLARE qty_diff INT;

    
    SET qty_diff = NEW.qty_keluar - OLD.qty_keluar;

    
    UPDATE barangg SET stok = stok - qty_diff WHERE id = NEW.barang_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tambahstok_setelah_hapus
AFTER DELETE ON barangkeluar
FOR EACH ROW
BEGIN
    UPDATE barangg SET stok = stok + OLD.qty_keluar WHERE id = OLD.barang_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `barangmasuk`
--

DROP TABLE IF EXISTS `barangmasuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barangmasuk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_masuk` date NOT NULL,
  `qty_masuk` smallint(6) NOT NULL DEFAULT 1,
  `barang_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barangmasuk_barang_id_foreign` (`barang_id`),
  CONSTRAINT `barangmasuk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangmasuk`
--

LOCK TABLES `barangmasuk` WRITE;
/*!40000 ALTER TABLE `barangmasuk` DISABLE KEYS */;
INSERT INTO `barangmasuk` VALUES
(4,'2023-12-08',12,6,'2023-12-06 23:03:30','2023-12-06 23:03:30'),
(5,'2023-12-04',1,4,'2023-12-06 23:07:40','2023-12-06 23:07:40'),
(6,'2023-11-26',1,4,'2023-12-06 23:08:56','2023-12-06 23:08:56'),
(11,'2023-11-30',23,6,'2023-12-06 23:43:55','2023-12-06 23:43:55'),
(14,'2023-12-01',10,6,'2023-12-06 23:52:22','2023-12-07 15:28:06'),
(15,'2023-12-12',8,2,'2023-12-07 00:18:17','2023-12-07 15:13:24'),
(17,'2023-12-08',8,14,'2023-12-07 17:11:10','2023-12-07 23:04:15');
/*!40000 ALTER TABLE `barangmasuk` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tmbhstk AFTER INSERT ON barangmasuk
FOR EACH ROW
BEGIN
    UPDATE barangg SET barangg.stok = barangg.stok + NEW.qty_masuk WHERE barangg.id = NEW.barang_id; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_stok_barangg
BEFORE UPDATE ON barangmasuk
FOR EACH ROW
BEGIN
    DECLARE qty_diff INT;

    
    SET qty_diff = NEW.qty_masuk - OLD.qty_masuk;

    
    UPDATE barangg SET stok = stok + qty_diff WHERE id = NEW.barang_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER kurangstok_setelah_hapus
AFTER DELETE ON barangmasuk
FOR EACH ROW
BEGIN
    UPDATE barangg SET stok = stok - OLD.qty_masuk WHERE id = OLD.barang_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(100) DEFAULT NULL,
  `kategori` enum('M','A','BHP','BTHP') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES
(1,'Pendingin Ruangan','M',NULL,'2023-12-06 17:40:16'),
(2,'Personal Komputer','M',NULL,NULL),
(3,'Laptop','M',NULL,NULL),
(4,'Speaker Active','M',NULL,NULL),
(5,'Scanner','M',NULL,NULL),
(6,'Printer','M',NULL,NULL),
(7,'Projector','M',NULL,NULL),
(8,'Projector Screen','M',NULL,NULL),
(9,'Mesin Bor','M',NULL,NULL),
(10,'Crimping Tools','M',NULL,'2023-12-06 18:46:58'),
(11,'Obeng','A',NULL,NULL),
(12,'Tang','A',NULL,NULL),
(14,'Solder','A',NULL,NULL),
(15,'Konektor Jaringan | Bahan Praktik','BHP',NULL,NULL),
(16,'Kabel Jumper | Bahan Praktik','BHP',NULL,NULL),
(17,'Perangkat Jaringan | Bahan Praktik','BTHP',NULL,NULL),
(18,'Mikrokontroller Board | Bahan Praktik','BTHP',NULL,NULL),
(19,'Mikrokontroller Module | Bahan Praktik','BTHP',NULL,NULL),
(20,'Komponen Elektronika | Bahan Praktik','BTHP',NULL,NULL),
(21,'Pendingin Ruang','M',NULL,NULL),
(22,'Personal Komputer','M',NULL,NULL),
(23,'Laptop','M',NULL,NULL),
(24,'Speaker Active','M',NULL,NULL),
(25,'Scanner','M',NULL,NULL),
(26,'Printer','M',NULL,NULL),
(27,'Projector','M',NULL,NULL),
(28,'Projector Screen','M',NULL,NULL),
(29,'Mesin Bor','M',NULL,NULL),
(30,'Crimping Tools','A',NULL,NULL),
(31,'Obeng','A',NULL,NULL),
(32,'Tang','A',NULL,NULL),
(33,'Alat Ukur','A',NULL,NULL),
(34,'Solder','A',NULL,NULL),
(35,'Konektor Jaringan | Bahan Praktik','BHP',NULL,NULL),
(36,'Kabel Jumper | Bahan Praktik','BHP',NULL,NULL),
(37,'Perangkat Jaringan | Bahan Praktik','BTHP',NULL,NULL),
(38,'Mikrokontroller Board | Bahan Praktik','BTHP',NULL,NULL),
(39,'Mikrokontroller Module | Bahan Praktik','BTHP',NULL,NULL),
(40,'Komponen Elektronika | Bahan Praktik','BTHP',NULL,NULL),
(41,'Handphone','A','2023-12-05 20:28:17','2023-12-05 20:28:17'),
(42,'JJk','BTHP','2023-12-05 20:42:26','2023-12-06 17:28:34'),
(51,'Pendingin Ruang','BHP','2023-12-06 20:21:29','2023-12-06 20:21:29');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_09_11_025225_create_siswa_table',1),
(6,'2023_10_22_133149_create_barang_table',2),
(7,'2023_10_22_154528_create_kategori_table',3),
(8,'2023_10_22_155318_create_barangg_table',4),
(9,'2023_10_23_001054_create_barangkeluar_table',5),
(10,'2023_10_23_001148_create_barangmasuk_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siswa` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) DEFAULT NULL,
  `nis` varchar(5) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `kelas` enum('X','XI','XII','XIII') NOT NULL DEFAULT 'X',
  `rombel` enum('A','B') NOT NULL DEFAULT 'A',
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` VALUES
(1,'ABDUL MALIK','19637','M','X','B','pj8tVwGLJptgBYUzU3HJn64iApoaCCRNSR75lsVh.png',NULL,'2023-10-22 06:07:08'),
(2,'ADITYA SURYA PUTRA','19639','M','X','A','39cRcpa35Byld31UGyHSZtSpoPQ9Ly302n0XPN3d.png',NULL,'2023-10-22 06:09:54'),
(3,'AHMAD DZAKY','19640','M','X','A','N9yizHVrYE9ES1BhDR7QNah3iGdkfbIL4KHNxjoh.png',NULL,'2023-10-22 06:10:46'),
(4,'AKMA SYAFITRI','19641','F','X','A',NULL,NULL,NULL),
(5,'ALDI BAGUS PRASETYO','19642','M','X','A','s8kw1JobNpe6k4P4Lz0EXarY3L5vPw4SxZK0mnEr.png',NULL,'2023-12-04 07:44:08'),
(6,'ALFIAN CHANDRA PUTRA ARDHIANSYAH','19643','M','X','A','bgrR0ROHaZXPIquOFaEsagiWnrw3OxDKsVyUoBhq.jpg',NULL,'2023-10-22 06:12:50'),
(7,'ALIF FIKRI SEPTYANTO','19644','M','X','A',NULL,NULL,NULL),
(8,'ANAS MERZA AHMADI','19645','M','X','A',NULL,NULL,NULL),
(9,'ANDRIAN PRASETIYO','19646','M','X','A',NULL,NULL,NULL),
(10,'ANINDYA FITRIANI','19647','F','X','A',NULL,NULL,NULL),
(11,'ARIEL BINTANG','19648','M','X','A',NULL,NULL,NULL),
(12,'ARKANANTA RIZKI ARDYKA AZZRA','19649','M','X','A',NULL,NULL,NULL),
(13,'ARSALAN DHIYA THUFAIL AS\'AD','19650','M','X','A',NULL,NULL,NULL),
(14,'AUREL PUTRI MAHARDHIKA','19651','F','X','A',NULL,NULL,NULL),
(15,'AZALIA KAYANA PASHA','19652','F','X','A',NULL,NULL,NULL),
(16,'BELLATRIX TIFFANY','19653','F','X','A',NULL,NULL,NULL),
(17,'BINTANG TIMUR WIDODO','19654','M','X','A',NULL,NULL,NULL),
(18,'CHANDRIKA OKTAVIAN RAMADHINA','19655','F','X','A',NULL,NULL,NULL),
(19,'DADANG ADI SAPUTRA','19656','M','X','A',NULL,NULL,NULL),
(20,'DAUD FIRMAN SAPUTRA','19657','M','X','A',NULL,NULL,NULL),
(21,'DIANDRA ZHASKIA AMELIA','19658','F','X','A',NULL,NULL,NULL),
(22,'EGI WIRATAMA','19659','M','X','A',NULL,NULL,NULL),
(23,'EVIANA WIDIYANINGSIH','19660','F','X','A',NULL,NULL,NULL),
(24,'FADHLAN NUHA MUKHLISHIN','19661','M','X','A',NULL,NULL,NULL),
(25,'FAIZAL MIFTAH CHOIRIL ANAM','19662','M','X','A',NULL,NULL,NULL),
(26,'FAJAR SURYANTORO','19663','M','X','A',NULL,NULL,NULL),
(27,'FANIA EMILIANA MARYAMA','19664','F','X','A',NULL,NULL,NULL),
(28,'FATIMAH AYU MAULIDA SUGIHARTO','19665','F','X','A',NULL,NULL,NULL),
(29,'FERDINAN ULVAN SYARIFUDDIN','19666','M','X','A',NULL,NULL,NULL),
(30,'HAFIDZ ARDIANSYAH','19667','M','X','A','t3wlCcT0rgVilHRVfw4u7iFfjvFxbVOWRAzTf3z1.png',NULL,'2023-10-22 06:21:09'),
(31,'HAUZAN FALAH MUSYAFFA','19668','M','X','A',NULL,NULL,NULL),
(32,'HILMI SURYA ATMAJA TANU WIJAYA','19669','M','X','A',NULL,NULL,NULL),
(33,'IMROATI AYU SHOLIHAH','19670','F','X','A',NULL,NULL,NULL),
(34,'IVORY ALVA DIAS KURNIAWAN','19671','M','X','A',NULL,NULL,NULL),
(35,'JEFRI NIKO SAPUTRA','19672','M','X','A',NULL,NULL,NULL),
(36,'JOVANKA ARYA DWI PRADITYA','19673','M','X','B',NULL,NULL,NULL),
(37,'KAYLA APRILIA ISLAMY PUTRI','19674','F','X','B',NULL,NULL,NULL),
(38,'LANANG GADING PASA','19675','M','X','B',NULL,NULL,NULL),
(39,'LERADHA LATIFA EKANTARI','19676','M','X','B',NULL,NULL,NULL),
(40,'MARSHA NAFISA PUTRI','19677','F','X','B',NULL,NULL,NULL),
(41,'MASSAID IHSAN KINANDANI','19678','M','X','B',NULL,NULL,NULL),
(42,'MUHAMMAD ABDUL AZIZ','19679','M','X','B',NULL,NULL,NULL),
(43,'MUHAMMAD HILMAN HAWARI','19680','M','X','B',NULL,NULL,NULL),
(44,'MUHAMMAD JULIAN RADITYA PUTRA ALI','19681','M','X','B',NULL,NULL,NULL),
(45,'MUHAMMAD NAFIS ARYA WIBAWA','19682','M','X','B',NULL,NULL,NULL),
(46,'MUHAMMAD RAKA ANDRA WISESA','19683','M','X','B',NULL,NULL,NULL),
(47,'MUHAMMAD RASYID','19684','M','X','B',NULL,NULL,NULL),
(48,'MUHAMMAD YOGA IBNU YASYA','19685','M','X','B',NULL,NULL,NULL),
(49,'MUHAMMAD ZAIN KURNIAWAN','19686','M','X','B',NULL,NULL,NULL),
(50,'NATHAN NARENDRATA','19687','M','X','B',NULL,NULL,NULL),
(51,'NAUFAL HAFIZH MUSYAFFA','19688','M','X','B',NULL,NULL,NULL),
(52,'NAUFALIKHO ABYAN','19689','M','X','B',NULL,NULL,NULL),
(53,'NIANDRA ZHENIA AMELIA','19690','F','X','B',NULL,NULL,NULL),
(54,'RATRI KUSUMANINGTYAS NARI RATIH','19691','M','X','B',NULL,NULL,NULL),
(55,'RAYO GHOSSAN BINTANG DESVIAN','19692','M','X','B',NULL,NULL,NULL),
(56,'RIFANI JUNIARTI','19693','F','X','B',NULL,NULL,NULL),
(57,'RIFKY ARYANTA WIBOWO','19694','M','X','B',NULL,NULL,NULL),
(58,'RIO YUDHA BASKARA','19695','M','X','B',NULL,NULL,NULL),
(59,'SAJID MUHAMMAD IKHLAS','19696','M','X','B',NULL,NULL,NULL),
(60,'SANDY AFNAN NAILUL MUQHITS','19697','M','X','B',NULL,NULL,NULL),
(61,'SESILIA NOVIA RUBI','19698','F','X','B',NULL,NULL,NULL),
(62,'SLAMET IHSAN NURDIN','19699','M','X','B',NULL,NULL,NULL),
(63,'STEVANI RATNA PUSPITA','19700','F','X','B',NULL,NULL,NULL),
(64,'SYAIFUL RAHMATDANI','19701','M','X','B',NULL,NULL,NULL),
(65,'TITA OKTAVIANI PAWESTRI','19702','F','X','B',NULL,NULL,NULL),
(66,'VIRA NUR LINTANG','19703','F','X','B',NULL,NULL,NULL),
(67,'YOHANES ANDHIKA PAMUNGKAS','19704','M','X','B',NULL,NULL,NULL),
(68,'ZAHRA AYU RAFIDAH','19705','F','X','B',NULL,NULL,NULL),
(69,'ZULHAM DANINOOR','19706','M','X','B',NULL,NULL,NULL),
(70,'ARDTECH TECHNOLOGY','19636','M','XIII','A','1dsHC3t4swqofdrRjy4Ib3LRiIJon16DbCirdnBa.jpg','2023-10-22 05:49:29','2023-10-22 17:58:33'),
(71,'Hafidz Ardiansyah','123','M','XII','A','GgbUNsEtbS6A8pwQ2uYRZRFOTXrIDEHTYUfHWua3.jpg','2023-12-06 06:58:34','2023-12-06 06:58:34'),
(72,'Hafidz Ardiansyah','1234','M','XIII','A','0wncMLrBuC83ixbt8DITP6CsdxBUGKs5wsS9o9jl.png','2023-12-07 17:38:33','2023-12-07 17:38:51');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'ardtech','ardtech@gmail.com',NULL,'$2y$10$0wRj/1Za4A30zDKrjEgPye7rsodEZvThmcAvI/BWpX7kCb8z3Zryu',NULL,'2023-10-22 05:45:18','2023-10-22 05:45:18'),
(2,'Hafidz Ardiansyah','hafidz@gmail.com',NULL,'$2y$10$hwgpPTd9vXAeegAAzEfZSOLIqPhGGscGGjK.7d6BfLusSTTByOOVW',NULL,'2023-12-07 00:20:49','2023-12-07 00:20:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'newbiekoding'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `cekStok` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cekStok`(nStok int(3)) RETURNS varchar(7) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
    IF nStok =0  THEN
RETURN 'HABIS';
    ELSEIF (nStok >= 1 AND nStok <= 5) THEN
        RETURN 'WASPADA';
    ELSEIF nStok > 5 THEN
        RETURN 'AMAN';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `ketKategoriko` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ketKategoriko`(kat VARCHAR(4)) RETURNS varchar(30) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN

 IF kat = 'M' THEN
   return  "Modal";
 ELSEIF kat="A" THEN
   RETURN  "Alat";
 ELSEIF kat="BHP" THEN
   RETURN  "Bahan Habis Pakai";
 ELSEIF kat="BTHP" THEN
   RETURN  "Bahan Tidak Habis Pakai";
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getKategoriAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getKategoriAll`()
BEGIN
    SELECT * FROM kategori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getKategoribyId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getKategoribyId`(id int (3))
BEGIN
    SELECT * FROM kategori WHERE kategori.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getKategoribyName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getKategoribyName`(kategori varchar(100))
BEGIN
    SELECT * FROM kategori WHERE kategori.kategori = kategori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-12 16:21:16
