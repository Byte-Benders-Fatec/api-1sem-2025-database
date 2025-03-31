-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fapg
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID da ação',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome da ação (ex: View, Create, Edit, Delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Ações possíveis aplicadas a módulos do sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (2,'Create'),(4,'Delete'),(3,'Edit'),(1,'View');
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da atividade',
  `project_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Projeto ao qual a atividade está vinculada',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Título da atividade',
  `description` text COLLATE utf8mb4_general_ci COMMENT 'Descrição detalhada da atividade',
  `status` enum('Não iniciada','Em andamento','Concluída','Cancelada') COLLATE utf8mb4_general_ci DEFAULT 'Não iniciada' COMMENT 'Status atual da atividade',
  `allocated_budget` decimal(12,2) DEFAULT '0.00' COMMENT 'Valor em reais reservado para esta atividade dentro do orçamento do projeto',
  `start_date` date NOT NULL COMMENT 'Data de início planejada da atividade',
  `end_date` date NOT NULL COMMENT 'Data de término planejada da atividade',
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Usuário que criou a atividade',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica se a atividade está ativa no sistema',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da atividade',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação da atividade',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica da atividade',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Atividades planejadas dentro de projetos, com orçamento, status e responsáveis definidos ou abertos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES ('4a3d0fbb-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0001','Atividade 1, PRJ-0001: gerada automaticamente para testes','Não iniciada',6029.00,'2024-01-07','2024-01-22','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a3db236-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0001','Atividade 2, PRJ-0001: gerada automaticamente para testes','Não iniciada',6169.00,'2024-01-08','2024-01-23','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a3e4ccf-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0001','Atividade 3, PRJ-0001: gerada automaticamente para testes','Não iniciada',4042.00,'2024-01-09','2024-01-24','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a3f00d3-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0002','Atividade 1, PRJ-0002: gerada automaticamente para testes','Não iniciada',6685.00,'2024-01-12','2024-01-27','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a3fc308-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0002','Atividade 2, PRJ-0002: gerada automaticamente para testes','Não iniciada',2700.00,'2024-01-13','2024-01-28','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a40417e-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0002','Atividade 3, PRJ-0002: gerada automaticamente para testes','Não iniciada',8673.00,'2024-01-14','2024-01-29','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a40cd4b-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0003','Atividade 1, PRJ-0003: gerada automaticamente para testes','Não iniciada',3552.00,'2024-01-17','2024-02-01','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a415696-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0003','Atividade 2, PRJ-0003: gerada automaticamente para testes','Não iniciada',8302.00,'2024-01-18','2024-02-02','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a41d24b-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0003','Atividade 3, PRJ-0003: gerada automaticamente para testes','Não iniciada',5445.00,'2024-01-19','2024-02-03','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a425ad0-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0004','Atividade 1, PRJ-0004: gerada automaticamente para testes','Não iniciada',6265.00,'2024-01-22','2024-02-06','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a42dd9a-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0004','Atividade 2, PRJ-0004: gerada automaticamente para testes','Não iniciada',4021.00,'2024-01-23','2024-02-07','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a435de9-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0004','Atividade 3, PRJ-0004: gerada automaticamente para testes','Não iniciada',6795.00,'2024-01-24','2024-02-08','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a43d827-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0005','Atividade 1, PRJ-0005: gerada automaticamente para testes','Não iniciada',9124.00,'2024-01-27','2024-02-11','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a444c45-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0005','Atividade 2, PRJ-0005: gerada automaticamente para testes','Não iniciada',3639.00,'2024-01-28','2024-02-12','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a44d100-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0005','Atividade 3, PRJ-0005: gerada automaticamente para testes','Não iniciada',4452.00,'2024-01-29','2024-02-13','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a45523f-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0006','Atividade 1, PRJ-0006: gerada automaticamente para testes','Não iniciada',6152.00,'2024-02-01','2024-02-16','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a45ceab-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0006','Atividade 2, PRJ-0006: gerada automaticamente para testes','Não iniciada',2828.00,'2024-02-02','2024-02-17','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a464176-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0006','Atividade 3, PRJ-0006: gerada automaticamente para testes','Não iniciada',8346.00,'2024-02-03','2024-02-18','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a46c142-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0007','Atividade 1, PRJ-0007: gerada automaticamente para testes','Não iniciada',3343.00,'2024-02-06','2024-02-21','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a473cc2-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0007','Atividade 2, PRJ-0007: gerada automaticamente para testes','Não iniciada',4829.00,'2024-02-07','2024-02-22','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a47c4f1-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0007','Atividade 3, PRJ-0007: gerada automaticamente para testes','Não iniciada',9379.00,'2024-02-08','2024-02-23','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a483e62-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0008','Atividade 1, PRJ-0008: gerada automaticamente para testes','Não iniciada',1999.00,'2024-02-11','2024-02-26','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a48eee5-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0008','Atividade 2, PRJ-0008: gerada automaticamente para testes','Não iniciada',6719.00,'2024-02-12','2024-02-27','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a497682-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0008','Atividade 3, PRJ-0008: gerada automaticamente para testes','Não iniciada',2150.00,'2024-02-13','2024-02-28','49e2d647-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a49fc53-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0009','Atividade 1, PRJ-0009: gerada automaticamente para testes','Não iniciada',9435.00,'2024-02-16','2024-03-02','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a4a9958-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0009','Atividade 2, PRJ-0009: gerada automaticamente para testes','Não iniciada',8048.00,'2024-02-17','2024-03-03','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a4b291d-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0009','Atividade 3, PRJ-0009: gerada automaticamente para testes','Não iniciada',8196.00,'2024-02-18','2024-03-04','49e4b3b3-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a4bbc15-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','Atividade 1 de PRJ-0010','Atividade 1, PRJ-0010: gerada automaticamente para testes','Não iniciada',9866.00,'2024-02-21','2024-03-07','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a4c5f2e-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','Atividade 2 de PRJ-0010','Atividade 2, PRJ-0010: gerada automaticamente para testes','Não iniciada',6937.00,'2024-02-22','2024-03-08','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a4cfdd4-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','Atividade 3 de PRJ-0010','Atividade 3, PRJ-0010: gerada automaticamente para testes','Não iniciada',2265.00,'2024-02-23','2024-03-09','49e3b288-0e1e-11f0-8a58-e8653882e964',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_delete_documents_on_activity_delete` BEFORE DELETE ON `activity` FOR EACH ROW BEGIN
  
  DELETE FROM document
  WHERE id IN (
    SELECT document_id FROM activity_document WHERE activity_id = OLD.id
  );

  
  DELETE FROM activity_document WHERE activity_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `activity_document`
--

DROP TABLE IF EXISTS `activity_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_document` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre atividade e documento',
  `activity_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID da atividade associada',
  `document_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do documento vinculado',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_activity_document` (`activity_id`,`document_id`),
  KEY `document_id` (`document_id`),
  CONSTRAINT `activity_document_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activity_document_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Associação de documentos a uma atividade no projeto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_document`
--

LOCK TABLES `activity_document` WRITE;
/*!40000 ALTER TABLE `activity_document` DISABLE KEYS */;
INSERT INTO `activity_document` VALUES ('4a613b04-0e1e-11f0-8a58-e8653882e964','4a3d0fbb-0e1e-11f0-8a58-e8653882e964','4a5b7431-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a61c4d7-0e1e-11f0-8a58-e8653882e964','4a3db236-0e1e-11f0-8a58-e8653882e964','4a5c79cf-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a626b67-0e1e-11f0-8a58-e8653882e964','4a3e4ccf-0e1e-11f0-8a58-e8653882e964','4a5d8978-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a634f75-0e1e-11f0-8a58-e8653882e964','4a3f00d3-0e1e-11f0-8a58-e8653882e964','4a5e90a7-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a63c090-0e1e-11f0-8a58-e8653882e964','4a3fc308-0e1e-11f0-8a58-e8653882e964','4a5f57fc-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a643879-0e1e-11f0-8a58-e8653882e964','4a40417e-0e1e-11f0-8a58-e8653882e964','4a60179c-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `activity_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_user`
--

DROP TABLE IF EXISTS `activity_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_user` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()),
  `activity_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_activity_user` (`activity_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `activity_user_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activity_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Usuários responsáveis por atividades (pode haver múltiplos ou nenhum responsável)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_user`
--

LOCK TABLES `activity_user` WRITE;
/*!40000 ALTER TABLE `activity_user` DISABLE KEYS */;
INSERT INTO `activity_user` VALUES ('4a4da694-0e1e-11f0-8a58-e8653882e964','4a3d0fbb-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a4e3658-0e1e-11f0-8a58-e8653882e964','4a3d0fbb-0e1e-11f0-8a58-e8653882e964','49e2e27a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a4ecbc6-0e1e-11f0-8a58-e8653882e964','4a3d0fbb-0e1e-11f0-8a58-e8653882e964','49e2e48d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a4f6690-0e1e-11f0-8a58-e8653882e964','4a3d0fbb-0e1e-11f0-8a58-e8653882e964','49e2e601-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a4fe302-0e1e-11f0-8a58-e8653882e964','4a3db236-0e1e-11f0-8a58-e8653882e964','49e2e806-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a505066-0e1e-11f0-8a58-e8653882e964','4a3f00d3-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a50bea3-0e1e-11f0-8a58-e8653882e964','4a40417e-0e1e-11f0-8a58-e8653882e964','49e3c7dc-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a5159f8-0e1e-11f0-8a58-e8653882e964','4a415696-0e1e-11f0-8a58-e8653882e964','49e2e27a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a51e681-0e1e-11f0-8a58-e8653882e964','4a41d24b-0e1e-11f0-8a58-e8653882e964','49e2e48d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a526d6f-0e1e-11f0-8a58-e8653882e964','4a425ad0-0e1e-11f0-8a58-e8653882e964','49e3c237-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a52f94c-0e1e-11f0-8a58-e8653882e964','4a435de9-0e1e-11f0-8a58-e8653882e964','49e3c944-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a537fb1-0e1e-11f0-8a58-e8653882e964','4a43d827-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a5411fc-0e1e-11f0-8a58-e8653882e964','4a444c45-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a54c709-0e1e-11f0-8a58-e8653882e964','4a45ceab-0e1e-11f0-8a58-e8653882e964','49e4def7-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a555588-0e1e-11f0-8a58-e8653882e964','4a464176-0e1e-11f0-8a58-e8653882e964','49e4d8c1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a55fc14-0e1e-11f0-8a58-e8653882e964','4a46c142-0e1e-11f0-8a58-e8653882e964','49e2e601-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a567f46-0e1e-11f0-8a58-e8653882e964','4a473cc2-0e1e-11f0-8a58-e8653882e964','49e2ee91-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a573aff-0e1e-11f0-8a58-e8653882e964','4a483e62-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a57c26c-0e1e-11f0-8a58-e8653882e964','4a497682-0e1e-11f0-8a58-e8653882e964','49e2ea2f-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a5826ba-0e1e-11f0-8a58-e8653882e964','4a49fc53-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a58a1b0-0e1e-11f0-8a58-e8653882e964','4a49fc53-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a591eda-0e1e-11f0-8a58-e8653882e964','4a4a9958-0e1e-11f0-8a58-e8653882e964','49e4e1ca-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a5999ae-0e1e-11f0-8a58-e8653882e964','4a4b291d-0e1e-11f0-8a58-e8653882e964','49e4e060-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a5a2371-0e1e-11f0-8a58-e8653882e964','4a4bbc15-0e1e-11f0-8a58-e8653882e964','49e3bfe1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a5ad9e5-0e1e-11f0-8a58-e8653882e964','4a4c5f2e-0e1e-11f0-8a58-e8653882e964','49e3cb09-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `activity_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da área temática',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome da área (ex: Aeroespacial, Educação)',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Descrição adicional da área, se necessário',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica se a área está ativa no sistema',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da área',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última atualização da área',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica da área',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Classificação temática para os projetos, podendo abranger diversas áreas do conhecimento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES ('49ef183c-0e1e-11f0-8a58-e8653882e964','Aeroespacial','Projetos relacionados a engenharia e tecnologia aeroespacial',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ef3093-0e1e-11f0-8a58-e8653882e964','Saúde','Projetos voltados para biomedicina, saúde pública e ciências da vida',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ef3207-0e1e-11f0-8a58-e8653882e964','Tecnologia da Informação','Projetos na área de desenvolvimento de software, dados e sistemas',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ef32c1-0e1e-11f0-8a58-e8653882e964','Educação','Projetos relacionados à inovação e pesquisa na área educacional',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ef336a-0e1e-11f0-8a58-e8653882e964','Energia','Projetos sobre fontes de energia, sustentabilidade e eficiência energética',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ef3412-0e1e-11f0-8a58-e8653882e964','Meio Ambiente','Projetos focados em preservação ambiental, ecologia e sustentabilidade',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ef34be-0e1e-11f0-8a58-e8653882e964','Robótica','Projetos com foco em automação, robótica e mecatrônica',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID do documento',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome original do arquivo',
  `mime_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'application/pdf' COMMENT 'Tipo MIME do arquivo (geralmente application/pdf)',
  `content` mediumblob NOT NULL COMMENT 'Conteúdo binário do arquivo PDF (até 16 MB)',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica se o documento está ativo para uso ou exibição',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do documento',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do documento',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica do documento',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Documentos armazenados diretamente no banco de dados, anexáveis a projetos ou atividades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES ('49f07145-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0001_CAPES.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 439>>\nstream\nx�m��n\�0\�\�<ō\����Y\�\�\���\Z��E:4D\�)�\�\�f\\�Sѽ$m\�@!~�\�\���\�+Ί\n^��50� $\��,��KԜ	U]�����/O�ݐ�\�`�W~l�5\�\�5\�\�v\�d\�MG��Iz\�ۯ\�l�F\�[L�3�D\rUV�\�`�t�`��\�\�`Mvp\�V�W-F���2.j=\��\�H9����\"߭�\�\�w,N�S\� .\�\"gY�\�ۿ�ZG\�\�\�5\���,X]\'\�G?��\�\�\�&�~!.ꊕyߡ\���\�\'�t\\\�x=�\\\�T&\�\'T��2\�Q�S\�\�\"Hg|�\�\�9��\�߬�V!\�+�\�\�\�!��7O\�\�&��!�\�3�\�s&\�sb\�̛�\�\Z�נ\�\�\Z\�����P9B\�8\Z`\��W�R�[2\��-��;��R�>5��\ra\�\"5��E�-\�\�\�\�\�l�S�6\�>	�O�/\�rV��U���3\�\��[\�@f3�Mf�\�\�\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000596 00000 n \n0000000883 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000683 00000 n \n0000000779 00000 n \n0000000997 00000 n \n0000001106 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1209\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49f1a488-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0002_CAPES.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 439>>\nstream\nx�u�\�N\�0\�\�<\���\�\�I\���Z\�C\�VF�]\�NA�.ԕ8���\�6*Qw����}3�o8ܟQ\"Jx9�j`vˀqB)4K����U�0\ne%HYB\����\�>Ko\�\�8��\�*kp\rpc\�AKn:	\��ԛ�=�\��`��\�\�;c�UPf\�\�ֵ\�v0h辛ɽ�d���\�\�U�Q!a�=\�R�^\�\�H1礘�\"?���\�X���g৴\�I�%���S�������C\����}\�\���Z�.ukO\��*I�\'�\rz�o�3�a�`bFٌS��RE\Z�Pͮ\�\�\�wɭr\�����J$�r\�۴\n\�V��\�\����|�G�\�CB/G>�\�\�Ўy�w�5~�A��\�5~��z�\�Aʭ\'{�Z���\�F\Zt\��\�MAB�M\�i\"���P?��]��4[�ު\�\r�, F\'�g9de�,\'Ì�\�\�2\�ٌfq�b��\�\�\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000596 00000 n \n0000000883 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000683 00000 n \n0000000779 00000 n \n0000000997 00000 n \n0000001106 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1209\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49f68d8a-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0004_FAPESP.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 442>>\nstream\nx�mR�n\�0\�\�[^�P|��\�.H��q\�0m0IC�� ��\"\���돤-8�� ș\�ٝ�\�p�/\�\�⦆lI�P�1\�kX\�\�Te\�QYB\�¯Uo���po�W~h�5��+��͠�	?��ū\�\�\�^B�|J\�d�\�\"��B\� �p^\�\r\�w1y��\�EkA\�j\�U#\"B\�V\�\�ʸ�\�2h�ouE�E\�,�m��p\�c>^Fϐ��y�K\�ۯVm\"\�\�\�\��,娪\�\�?�9\�\n\�\�.X?\�DE��w\����#�&.2�);gabxª\��V&6%w\�y1\�\�\�?�\�s�*��כ��Q�ʈxim�\�\�\�\�q5\�(�4\�\�r\�g9�\�)�SZ\�\�Bc�\�kPfm{->�I�\�A\0ʝ\'{�\�\�[Js+�p��-<	w�3\�z4��x2I�~Ri\r\�x�4;\�\�Tr�&\�G�\�\��\�,G�\0V\�r2͸h\�!\�2\�\��(\�\�w\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000599 00000 n \n0000000886 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000686 00000 n \n0000000782 00000 n \n0000001000 00000 n \n0000001109 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1212\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49f7b83b-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0005_CNPq.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 441>>\nstream\nx�m�\�N\�0�\�<\�]\\�\�\�n(E�BL^\����Qlwb��x]�H�\�\�\�v[Jԑ���\�{}\�\�p{FI^\�\�\�e\r�k�J�^¢��XE	�PV9)K�[�q\�\�\'\�-\�\�\Ze\rvpW��4\�O+a\�G\�ugϡ~\�%o6\���\nJQ��^8/a��\���ܙ�J\�\�Z��[�^5\�\�#,�qQ\�e\� \�\�\�SN�i*rg���\�\�p9\��)�gD�D\�?[��\�\�\��\�?Z���J\�_�\�f0��醏֞�\�$E�\�W\�1>\�\�|��΀�I8�r~JabtD\�\�^+%7\�y�\�\�ȋS>��\��s\�n\Z�p�\�Kk��\�\�\�(N8\�<\�l�^;fe^-4\���e��\��\�W:\�%*A(7�\�a\�S/)˵4\��-<�ۇ�B�>4A\�\r\�a\�,5��Q�%h\�q\�ll�Q�2Z>���/\�e�,G��k\�\�\Z\"\�bBE\�W\��\0_�\�L\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000598 00000 n \n0000000885 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000685 00000 n \n0000000781 00000 n \n0000000999 00000 n \n0000001108 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1211\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49fb987f-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0006_CNPq.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 440>>\nstream\nx�m�\�N\�0�\�<\�Y\\\��k�c�H�@h\��ĭ�j�;e4�\��Ո�\�n;%\�HYX\��ν�\�rܝQRTx9�\�`r\��8�\�\�&�b5%���RUh:|{\�\�\��\�y\�VY#V���m-M�\�$濤^�\�9�\�Q\�f#\�V�\�j�\�\�\�Kl1ht_\�\�\�Kً\�B\�j\�U+�Bb-z��2.j�\�K\�]�r\�I9ME��w\��C\�(O\�\"\'Y�\�?�ZF\�\�\��\�?Z^��N\�G/�\�f�kӥn퉾�+R\�I-��o�5a�3P6�لS��Re\ZQͶ\�\�\�wɍr^\���\�#_�\�9%u��\�\�i���2\":\�\�\��\�\�\�\�\�\�ϧ9\�\�1�c\\\�բ�\�o5�Y\�^��O\�\�K��Pn$�\�1x�R�S�ki���xn�g\�1�\�7P�)�Ԁ\�O*\�A?\'\�Ʈ6*uCF�\��\�h�\�,\'E��\n�\�h�q\�\�^C<\�G\�o�_*\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000597 00000 n \n0000000884 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000684 00000 n \n0000000780 00000 n \n0000000998 00000 n \n0000001107 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1210\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ff3323-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0007_Finep.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 434>>\nstream\nx�uR\�n\�0�\�+\�\�B\�\�[\�8@r(�T?��\�\r�4D\�)��9.\�S\�{)چ#�x���\�ٝ�\�x\�Y^\�\�\�\�\Zf\��d�C��e=>��3���rV�P�\�\�[\�<Xt\Z\�,vpw�\���%X� �\�\�G��\'��-&\�J0QA�*��\�K0hߋ\�Q6\�c\�\0�\�\�\�� \�a��\�֏\�@Q���{,R\�%+\�\�Wg(\�é�\��r\�\�5;ϘR��\�՛�\�\�x\�9�V欪\�{�0��\�\�\�6Z�\�UɊ,�\�0\�\����G�\0.f\�H.\�kV\'\�\'��\�mǦh�}�E�΄�?\�\��\�\�m4½�8^Z\�Gn��ݙ&��1�\�?�gL�\�.a\���\�`@۵\�\r��!=�\���\'\�\�\�t��0wd\�G�q�BJ3�\�l�O\r\�q\�\"@�\�i\�\�x�{\�\�ur\�&\�\'A\�\�\�e*cy���\�d�㞽�\���q5�\�_�\�\�_\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000591 00000 n \n0000000878 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000678 00000 n \n0000000774 00000 n \n0000000992 00000 n \n0000001101 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1204\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a003850-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0008_Finep.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 442>>\nstream\nx�m�\�n\�0E\���Y��P|\�ay\�&�,��\�0\�\�` ��H9E7���*�I[pЂ�\�3�;\�.()*x��\�@vÀqB)4kX5\��)a�� UM\�\���\�­q^��U\�\�.\�ڶ�F�t������\�\�\�(y���`�\�P����\�\�y�=�\Z�\�fx0�\r�� Go�\���Q������2.j=\�\�H�\�\\�\"��\�\�\�{,�\�\�3,\�\�\"\'B$�\��6�}wI)�B\�R\�I�\�K?�%\\Y\�\�\�[g\�\�E]�2O\�k\�e���y#]e�2N9;�\�01:�������r^.AЌ��\�\�|NI]$�\�\�մJ22:;6�\�v\�8\�<\�\�t\�\�ENxyJ\��y�\�Z\�\�\Z�Y\�A˗wt0�T�w�\�տ\��t\��;��R����\��0c�\Z��A�-\�\�\�\�\�l�S�2\�>�ζ/9)JU��fÌ{\�\�2\�\"�\"ΰ��>\0�W\��\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000599 00000 n \n0000000886 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000686 00000 n \n0000000782 00000 n \n0000001000 00000 n \n0000001109 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1212\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a011d5b-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0009_Sebrae.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 440>>\nstream\nx�uR\�n\�0�\�+\�\�B\�\�[�8@r(�F?��\��4D\�	��9.\�S\�{)ڂ#8x ș\�ٝ�\�p\�Y^\�\�\�\�\Zfw�d�C��e=<��3���rV�P�\�\�{\�(8��>\�\�7\�Y\�\�5ܺ�7d\�OK�|!�ۺ\�P?�����h+�D���:J/} 8@o�}/FG1\�P��\�3t��`�\�Z[?`E\r\��\�H1����\"ߜ���>\�e\�\�%;ϘR�}\�՛�\�\�\�s�V欪\�1`\���жɭ��\�UɊ,\�o1\�\�ý���\0.f\\\�$�\�%��C\�V}茶C_�\�>\��	\�~\�Y�\'��\�/\�h�;mq����\�GZuH#O2)cD\�g�l�1Y�S;f_4Ά�m׮3�\��<t�\�CҞ�S}\�[�3�#�>����S�)\�\�0�	>5�\�9�d\0\�J�Mh�\�\�\�\�v��6\�@	�O60S\�Pe�,\'\�v\�\�5� Ռ�a��(\���\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000597 00000 n \n0000000884 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000684 00000 n \n0000000780 00000 n \n0000000998 00000 n \n0000001107 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1210\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a020e0a-0e1e-11f0-8a58-e8653882e964','documento_PRJ-0010_Sebrae.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 438>>\nstream\nx�u��n\�0\�\�<ō\����Y\�\�\���(\Z��Y:L\�)�\�\�f\\�Sѽ$m�\�\Z\��}w�\�$<]qVT\�z\���ك\0!\�Ьa\�\�_�\�Lp�\�U4|�\�\�\��\�\����p\��4�p\�,��\�m\�54/\'�\�-&ޙ`��*�Yv�^:Op�AC\�ь�f��;8x�ѫ��`�=\�Z����P\�X��KV\�S�/VS\��\�;\�a\��ċ�eY\�\�~wj�oO7��K+V\�I�\�\�nwhZچ\�/\�E]�2O\�{\�_\�h~��.��\�g�\�\�*\�\���j�V&��\�\�yL���\�s\�\�\"񷛟�U\�`<t�\�3�z���L\�\�\�\� �\�L�\�\�\�q�7�5��A��\�5��!=�r��\'p\�\�\�\�V�Hq\�Ƞ���Bw\�3\�=6��\ra\�\"5�z�\�t\�sd\�v�W�6\�?��\�_�\�(!��e5�fܴ\���\�f<�C,F��%\'\�\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000595 00000 n \n0000000882 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000682 00000 n \n0000000778 00000 n \n0000000996 00000 n \n0000001105 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1208\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a5b7431-0e1e-11f0-8a58-e8653882e964','atividade_PRJ-0001_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�\�*?\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a5c79cf-0e1e-11f0-8a58-e8653882e964','atividade_PRJ-0001_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C\�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�\'*@\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a5d8978-0e1e-11f0-8a58-e8653882e964','atividade_PRJ-0001_3.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�\�$mbGE:�\����b�\�T_\�(\�t\��%���1xW;�\�Q@\�\�{\��~/�jR-Lې0��m��\�P\�	�s�bf��\��F\�b4�ִ�?�O�i\��0\�a��\�\�\�\�X�\�rsu��\���*A\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a5e90a7-0e1e-11f0-8a58-e8653882e964','atividade_PRJ-0002_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�*@\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a5f57fc-0e1e-11f0-8a58-e8653882e964','atividade_PRJ-0002_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C\�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�z*A\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a60179c-0e1e-11f0-8a58-e8653882e964','atividade_PRJ-0002_3.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�\�$mbGE:�\����b�\�T_\�(\�t\��%���1xW;�\�Q@\�\�{\��~/�jR-Lې0��m��\�P\�	�s�bf��\��F\�b4�ִ�?�O�i\��0\�a��\�\�\�\�X�\�rsu��\��\�*B\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a78708b-0e1e-11f0-8a58-e8653882e964','tarefa_PRJ-0001_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a794152-0e1e-11f0-8a58-e8653882e964','tarefa_PRJ-0001_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��r\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a7c91f7-0e1e-11f0-8a58-e8653882e964','tarefa_PRJ-0002_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��f\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a7db167-0e1e-11f0-8a58-e8653882e964','tarefa_PRJ-0002_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��\�\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-03-31 07:52:51','2025-03-31 07:52:51',NULL);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funding_agency`
--

DROP TABLE IF EXISTS `funding_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funding_agency` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da agência financiadora',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome completo da agência (ex: Conselho Nacional de Desenvolvimento Científico e Tecnológico)',
  `acronym` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Sigla da agência (ex: CNPq)',
  `cnpj` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'CNPJ da agência financiadora (formato 00.000.000/0000-00)',
  `website` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Site oficial da agência',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se a agência está ativa para uso no sistema',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do registro',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última modificação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `acronym` (`acronym`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Agências financiadoras que podem ser associadas a projetos na plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funding_agency`
--

LOCK TABLES `funding_agency` WRITE;
/*!40000 ALTER TABLE `funding_agency` DISABLE KEYS */;
INSERT INTO `funding_agency` VALUES ('49ee036e-0e1e-11f0-8a58-e8653882e964','Não aplicável','N/A','00.000.000/0001-00','N/A',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ee0ab8-0e1e-11f0-8a58-e8653882e964','Coordenação de Aperfeiçoamento de Pessoal de Nível Superior','CAPES','00.394.544/0001-62','https://www.gov.br/capes',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ee0ce0-0e1e-11f0-8a58-e8653882e964','Fundação de Amparo à Pesquisa do Estado de São Paulo','FAPESP','43.828.151/0001-45','https://fapesp.br',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ee0e2b-0e1e-11f0-8a58-e8653882e964','Conselho Nacional de Desenvolvimento Científico e Tecnológico','CNPq','33.654.831/0001-36','https://www.gov.br/cnpq',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ee0f55-0e1e-11f0-8a58-e8653882e964','Financiadora de Estudos e Projetos','Finep','33.749.793/0001-01','https://www.finep.gov.br',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ee12a8-0e1e-11f0-8a58-e8653882e964','Serviço Brasileiro de Apoio às Micro e Pequenas Empresas','Sebrae','03.813.990/0001-47','https://www.sebrae.com.br',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `funding_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID do módulo',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome do módulo (ex: Project, Activity)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Módulos funcionais do sistema onde permissões são aplicadas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (4,'Activity'),(8,'Area'),(6,'Document'),(7,'Funding Agency'),(3,'Project'),(5,'Task'),(2,'Team'),(1,'User');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da permissão',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome da permissão (ex: Projetos - Visualizar)',
  `module_id` int NOT NULL COMMENT 'ID do módulo relacionado à permissão',
  `action_id` int NOT NULL COMMENT 'ID da ação relacionada à permissão',
  `system_defined` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Define se a permissão é criada pelo sistema (não editável, não deletável)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da permissão',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última atualização',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica da permissão (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `module_id` (`module_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Permissões disponíveis no sistema, associadas a um módulo e a uma ação';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('49e8d411-0e1e-11f0-8a58-e8653882e964','User - View',1,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8e1da-0e1e-11f0-8a58-e8653882e964','User - Create',1,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8e504-0e1e-11f0-8a58-e8653882e964','User - Edit',1,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8e6ac-0e1e-11f0-8a58-e8653882e964','User - Delete',1,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8e83b-0e1e-11f0-8a58-e8653882e964','Team - View',2,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8e9c9-0e1e-11f0-8a58-e8653882e964','Team - Create',2,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8eb35-0e1e-11f0-8a58-e8653882e964','Team - Edit',2,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8ec93-0e1e-11f0-8a58-e8653882e964','Team - Delete',2,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8ee03-0e1e-11f0-8a58-e8653882e964','Project - View',3,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8efb8-0e1e-11f0-8a58-e8653882e964','Project - Create',3,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8f11d-0e1e-11f0-8a58-e8653882e964','Project - Edit',3,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8f457-0e1e-11f0-8a58-e8653882e964','Project - Delete',3,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8f5f5-0e1e-11f0-8a58-e8653882e964','Activity - View',4,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8f78e-0e1e-11f0-8a58-e8653882e964','Activity - Create',4,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8fab1-0e1e-11f0-8a58-e8653882e964','Activity - Edit',4,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e8fe1d-0e1e-11f0-8a58-e8653882e964','Activity - Delete',4,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e90015-0e1e-11f0-8a58-e8653882e964','Task - View',5,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e90191-0e1e-11f0-8a58-e8653882e964','Task - Create',5,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e902f9-0e1e-11f0-8a58-e8653882e964','Task - Edit',5,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e90485-0e1e-11f0-8a58-e8653882e964','Task - Delete',5,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e90609-0e1e-11f0-8a58-e8653882e964','Document - View',6,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e907ae-0e1e-11f0-8a58-e8653882e964','Document - Create',6,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e9091a-0e1e-11f0-8a58-e8653882e964','Document - Edit',6,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e90a80-0e1e-11f0-8a58-e8653882e964','Document - Delete',6,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e90bec-0e1e-11f0-8a58-e8653882e964','Funding Agency - View',7,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e90d64-0e1e-11f0-8a58-e8653882e964','Funding Agency - Create',7,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e91003-0e1e-11f0-8a58-e8653882e964','Funding Agency - Edit',7,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e911a3-0e1e-11f0-8a58-e8653882e964','Funding Agency - Delete',7,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e91344-0e1e-11f0-8a58-e8653882e964','Area - View',8,1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e914b1-0e1e-11f0-8a58-e8653882e964','Area - Create',8,2,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e91621-0e1e-11f0-8a58-e8653882e964','Area - Edit',8,3,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e9178e-0e1e-11f0-8a58-e8653882e964','Area - Delete',8,4,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID do projeto',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome do projeto',
  `code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Código interno ou institucional do projeto',
  `description` text COLLATE utf8mb4_general_ci COMMENT 'Descrição detalhada do projeto',
  `status` enum('Planejado','Em andamento','Suspenso','Concluído','Cancelado') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Planejado' COMMENT 'Status atual do projeto no sistema',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o projeto está ativo na plataforma',
  `start_date` date NOT NULL COMMENT 'Data de início planejada ou real do projeto',
  `end_date` date NOT NULL COMMENT 'Data de término prevista ou real do projeto',
  `budget` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'Orçamento total disponível para o projeto (em reais)',
  `funding_agency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UUID da agência financiadora do projeto',
  `created_by_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UUID do usuário responsável pela criação do projeto',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do projeto',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do projeto',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica do projeto',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `funding_agency_id` (`funding_agency_id`),
  KEY `created_by_id` (`created_by_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`funding_agency_id`) REFERENCES `funding_agency` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Projetos registrados na plataforma, com controle de status, orçamento e vínculo institucional';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('4a06f916-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 1','PRJ-0001','Projeto gerado automaticamente para fins de teste e validação.','Planejado',1,'2024-09-01','2025-08-31',100000.00,'49ee036e-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 08:08:23',NULL),('4a079060-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 2','PRJ-0002','Projeto gerado automaticamente para fins de teste e validação.','Em andamento',1,'2024-01-15','2024-12-15',85000.00,'49ee0ab8-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a0830c6-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 3','PRJ-0003','Projeto gerado automaticamente para fins de teste e validação.','Suspenso',1,'2023-01-01','2024-12-31',120000.00,'49ee0ce0-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a08afbd-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 4','PRJ-0004','Projeto gerado automaticamente para fins de teste e validação.','Cancelado',1,'2023-06-01','2024-05-31',0.00,'49ee0ce0-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a094ee6-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 5','PRJ-0005','Projeto gerado automaticamente para fins de teste e validação.','Concluído',1,'2022-01-01','2023-12-31',70000.00,'49ee0e2b-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a09e109-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 6','PRJ-0006','Projeto gerado automaticamente para fins de teste e validação.','Em andamento',1,'2024-03-01','2025-02-28',95000.00,'49ee0e2b-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a0a6cb1-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 7','PRJ-0007','Projeto gerado automaticamente para fins de teste e validação.','Planejado',1,'2025-01-01','2025-12-31',200000.00,'49ee0f55-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a0adcc0-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 8','PRJ-0008','Projeto gerado automaticamente para fins de teste e validação.','Concluído',1,'2021-07-01','2022-06-30',110000.00,'49ee0f55-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a0b636e-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 9','PRJ-0009','Projeto gerado automaticamente para fins de teste e validação.','Em andamento',1,'2024-02-01','2024-11-30',67000.00,'49ee12a8-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a0be617-0e1e-11f0-8a58-e8653882e964','Projeto Exemplo 10','PRJ-0010','Projeto gerado automaticamente para fins de teste e validação.','Cancelado',1,'2023-04-01','2023-12-01',0.00,'49ee12a8-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_delete_documents_on_project_delete` BEFORE DELETE ON `project` FOR EACH ROW BEGIN
  
  DELETE FROM document
  WHERE id IN (
    SELECT document_id FROM project_document WHERE project_id = OLD.id
  );

  
  DELETE FROM project_document WHERE project_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `project_area`
--

DROP TABLE IF EXISTS `project_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_area` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre projeto e área',
  `project_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do projeto relacionado',
  `area_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID da área atribuída ao projeto',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação do projeto à área',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_project_area` (`project_id`,`area_id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `project_area_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_area_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Associação entre projetos e áreas temáticas, permitindo classificação múltipla';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_area`
--

LOCK TABLES `project_area` WRITE;
/*!40000 ALTER TABLE `project_area` DISABLE KEYS */;
INSERT INTO `project_area` VALUES ('4a0d4c5f-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','49ef183c-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d54bc-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','49ef34be-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d5887-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','49ef3093-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d5b8c-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','49ef32c1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d5e1a-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','49ef3207-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d607b-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','49ef336a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d62e7-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','49ef3412-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d6536-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','49ef3093-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d6827-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','49ef3207-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d6a60-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','49ef183c-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d6c0f-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','49ef32c1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d7014-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','49ef3412-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d7f5c-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','49ef336a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d849d-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','49ef34be-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0d87d1-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','49ef3207-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `project_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_document`
--

DROP TABLE IF EXISTS `project_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_document` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre projeto e documento',
  `project_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do projeto relacionado',
  `document_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do documento associado ao projeto',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_project_document` (`project_id`,`document_id`),
  KEY `document_id` (`document_id`),
  CONSTRAINT `project_document_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_document_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Associação de documentos PDF a projetos cadastrados na plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_document`
--

LOCK TABLES `project_document` WRITE;
/*!40000 ALTER TABLE `project_document` DISABLE KEYS */;
INSERT INTO `project_document` VALUES ('4a0e7df9-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','49f07145-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a0f35e8-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','49f1a488-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a106a08-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','49f68d8a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a112db3-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','49f7b83b-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a11aeee-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','49fb987f-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a122b4f-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','49ff3323-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a12e8ca-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','4a003850-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a137b6d-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','4a011d5b-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a13fc58-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','4a020e0a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `project_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_team`
--

DROP TABLE IF EXISTS `project_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_team` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre projeto e time',
  `project_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do projeto',
  `team_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do time autorizado',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de associação do time ao projeto',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_project_team` (`project_id`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `project_team_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Associação entre projetos e os times autorizados a colaborar neles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_team`
--

LOCK TABLES `project_team` WRITE;
/*!40000 ALTER TABLE `project_team` DISABLE KEYS */;
INSERT INTO `project_team` VALUES ('4a375d6b-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a385cd1-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3980a5-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a39fa4f-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3a62ee-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3b221d-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3bbcea-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `project_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID do papel de projeto/time',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome do papel (ex: Coordenador, Colaborador)',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descrição da função deste papel dentro de um projeto',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indica se este é o papel padrão ao adicionar usuários',
  `system_defined` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Define se o papel é criado pelo sistema (não editável, não deletável)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do papel',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última atualização do papel',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela de papéis atribuíveis aos usuários dentro de projetos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('49ea2740-0e1e-11f0-8a58-e8653882e964','Coordenador','Responsável por liderar o projeto',0,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ea3135-0e1e-11f0-8a58-e8653882e964','Colaborador','Participa da execução das atividades do projeto',1,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ea3467-0e1e-11f0-8a58-e8653882e964','Gestor','Gerencia o progresso e recursos do projeto',0,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49ea37a8-0e1e-11f0-8a58-e8653882e964','Observador','Pode visualizar o projeto, mas não realizar alterações',0,1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre papel e permissão',
  `role_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do papel atribuído',
  `permission_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID da permissão concedida ao papel',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_role_permission` (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela que relaciona papéis atribuíveis aos usuários com permissões específicas do sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES ('49ebdee0-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8f78e-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebe83f-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8fe1d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebeb64-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8fe1d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebed5b-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8fab1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebeef0-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8fab1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebf07d-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e8fab1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebf222-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','49e8f5f5-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebf3bd-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8f5f5-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebf54c-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8f5f5-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebf742-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e8f5f5-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebf8fe-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e914b1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebfa93-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e914b1-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebfc94-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e9178e-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebfe30-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e9178e-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ebfff1-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e91621-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec018b-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e91621-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec0345-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e91344-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec06a1-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e91344-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec0a41-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e907ae-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec0c36-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e907ae-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec0dd6-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e907ae-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec0f74-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e90a80-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec10fa-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e90a80-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec127f-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e90a80-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec1419-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e9091a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec15aa-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e9091a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec1974-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e9091a-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec1b6a-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','49e90609-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec1ced-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e90609-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec1e75-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e90609-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec1fec-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e90609-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec21ac-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e90d64-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec233a-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e90d64-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec24f0-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e911a3-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec2770-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e911a3-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec2988-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e91003-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec2b22-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e91003-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec2caf-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e90bec-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec2e1a-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e90bec-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec2fa7-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8efb8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec3113-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8efb8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec329f-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8f457-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec345b-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8f457-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec35ee-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8f11d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec378d-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8f11d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec390f-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','49e8ee03-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec3a70-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8ee03-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec3bd4-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8ee03-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec3d3b-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e8ee03-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec3fa8-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e90191-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec41d2-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e90191-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec4560-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e90191-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec4730-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e90485-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec4b34-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e90485-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec4cd5-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e90485-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec4e71-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e902f9-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec4ff0-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e902f9-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5169-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e902f9-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec52f8-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','49e90015-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5479-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e90015-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5790-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e90015-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5915-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e90015-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5ae0-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8e9c9-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5c46-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8e9c9-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5deb-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8ec93-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec5f5e-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8ec93-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec6100-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8eb35-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec6271-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8eb35-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec6436-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','49e8e83b-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec65a3-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8e83b-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec6832-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8e83b-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec69a2-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','49e8e83b-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec6b57-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8e1da-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec6db5-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8e6ac-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec6ff0-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8e504-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec734d-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','49e8d411-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec761b-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','49e8d411-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('49ec77a2-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','49e8d411-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID do papel global do sistema',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome do papel (ex: Admin, Viewer)',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descrição do papel e sua função no sistema',
  `level` int NOT NULL COMMENT 'Nível hierárquico do papel (valores maiores indicam maior acesso)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela de definição de papéis de acesso globais do sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role` VALUES (1,'Super Admin','Acesso total ao sistema. Gerencia todos os administradores.',100),(2,'Admin','Gerencia usuários, projetos e permissões.',80),(3,'User','Usuário comum. Acessa apenas projetos atribuídos.',50),(4,'Viewer','Acesso somente leitura aos projetos atribuídos.',10);
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da tarefa',
  `activity_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID da atividade associada à tarefa',
  `user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Usuário responsável pela tarefa (pode ser nulo se o usuário for removido)',
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Título da tarefa',
  `description` text COLLATE utf8mb4_general_ci COMMENT 'Descrição detalhada da tarefa',
  `time_spent_minutes` int DEFAULT '0' COMMENT 'Tempo em minutos dedicado à tarefa',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT 'Custo monetário associado à tarefa (se aplicável)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da tarefa',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação da tarefa',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tarefas criadas dentro de atividades por usuários responsáveis';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('4a6522d8-0e1e-11f0-8a58-e8653882e964','4a3d0fbb-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','Documentação','Relatório de progresso entregue.',90,189.64,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6596ff-0e1e-11f0-8a58-e8653882e964','4a3d0fbb-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','Reunião técnica','Execução parcial com ajustes previstos.',120,175.98,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6621cd-0e1e-11f0-8a58-e8653882e964','4a3db236-0e1e-11f0-8a58-e8653882e964','49e2e806-0e1e-11f0-8a58-e8653882e964','Reunião técnica','Atividade realizada conforme planejamento.',150,215.16,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a66e3b2-0e1e-11f0-8a58-e8653882e964','4a3db236-0e1e-11f0-8a58-e8653882e964','49e2e806-0e1e-11f0-8a58-e8653882e964','Análise preliminar','Contribuição significativa para o andamento da atividade.',60,181.77,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a676abd-0e1e-11f0-8a58-e8653882e964','4a3f00d3-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','Análise preliminar','Atividade realizada conforme planejamento.',60,415.02,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a67e040-0e1e-11f0-8a58-e8653882e964','4a3f00d3-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','Reunião técnica','Relatório de progresso entregue.',90,284.71,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6857c6-0e1e-11f0-8a58-e8653882e964','4a40417e-0e1e-11f0-8a58-e8653882e964','49e3c7dc-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Tarefa concluída com sucesso.',120,345.27,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a68bed7-0e1e-11f0-8a58-e8653882e964','4a40417e-0e1e-11f0-8a58-e8653882e964','49e3c7dc-0e1e-11f0-8a58-e8653882e964','Desenvolvimento inicial','Alinhamento com equipe técnica.',150,291.72,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a69244f-0e1e-11f0-8a58-e8653882e964','4a415696-0e1e-11f0-8a58-e8653882e964','49e2e27a-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Execução parcial com ajustes previstos.',180,123.50,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a699c1a-0e1e-11f0-8a58-e8653882e964','4a415696-0e1e-11f0-8a58-e8653882e964','49e2e27a-0e1e-11f0-8a58-e8653882e964','Documentação','Relatório de progresso entregue.',120,295.76,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6a1966-0e1e-11f0-8a58-e8653882e964','4a41d24b-0e1e-11f0-8a58-e8653882e964','49e2e48d-0e1e-11f0-8a58-e8653882e964','Análise preliminar','Relatório de progresso entregue.',60,391.37,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6a8101-0e1e-11f0-8a58-e8653882e964','4a41d24b-0e1e-11f0-8a58-e8653882e964','49e2e48d-0e1e-11f0-8a58-e8653882e964','Análise preliminar','Alinhamento com equipe técnica.',180,471.46,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6ae565-0e1e-11f0-8a58-e8653882e964','4a425ad0-0e1e-11f0-8a58-e8653882e964','49e3c237-0e1e-11f0-8a58-e8653882e964','Coleta de dados','Atividade realizada conforme planejamento.',150,350.58,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6b690c-0e1e-11f0-8a58-e8653882e964','4a425ad0-0e1e-11f0-8a58-e8653882e964','49e3c237-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Contribuição significativa para o andamento da atividade.',90,196.89,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6bec11-0e1e-11f0-8a58-e8653882e964','4a435de9-0e1e-11f0-8a58-e8653882e964','49e3c944-0e1e-11f0-8a58-e8653882e964','Documentação','Alinhamento com equipe técnica.',120,290.63,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6c898d-0e1e-11f0-8a58-e8653882e964','4a435de9-0e1e-11f0-8a58-e8653882e964','49e3c944-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Relatório de progresso entregue.',150,322.52,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6d12d5-0e1e-11f0-8a58-e8653882e964','4a43d827-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Contribuição significativa para o andamento da atividade.',150,372.53,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6dbb39-0e1e-11f0-8a58-e8653882e964','4a43d827-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Contribuição significativa para o andamento da atividade.',120,487.06,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6e325e-0e1e-11f0-8a58-e8653882e964','4a444c45-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','Análise preliminar','Contribuição significativa para o andamento da atividade.',60,239.49,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6ea08f-0e1e-11f0-8a58-e8653882e964','4a444c45-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','Coleta de dados','Alinhamento com equipe técnica.',150,382.16,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6f11ae-0e1e-11f0-8a58-e8653882e964','4a45ceab-0e1e-11f0-8a58-e8653882e964','49e4def7-0e1e-11f0-8a58-e8653882e964','Reunião técnica','Atividade realizada conforme planejamento.',180,124.98,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a6f9fb6-0e1e-11f0-8a58-e8653882e964','4a45ceab-0e1e-11f0-8a58-e8653882e964','49e4def7-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Relatório de progresso entregue.',180,216.12,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a7013ad-0e1e-11f0-8a58-e8653882e964','4a464176-0e1e-11f0-8a58-e8653882e964','49e4d8c1-0e1e-11f0-8a58-e8653882e964','Documentação','Execução parcial com ajustes previstos.',180,118.43,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a70ab32-0e1e-11f0-8a58-e8653882e964','4a464176-0e1e-11f0-8a58-e8653882e964','49e4d8c1-0e1e-11f0-8a58-e8653882e964','Coleta de dados','Atividade realizada conforme planejamento.',180,352.47,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a712398-0e1e-11f0-8a58-e8653882e964','4a46c142-0e1e-11f0-8a58-e8653882e964','49e2e601-0e1e-11f0-8a58-e8653882e964','Coleta de dados','Contribuição significativa para o andamento da atividade.',60,496.78,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a719765-0e1e-11f0-8a58-e8653882e964','4a46c142-0e1e-11f0-8a58-e8653882e964','49e2e601-0e1e-11f0-8a58-e8653882e964','Documentação','Atividade realizada conforme planejamento.',60,223.03,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a720d36-0e1e-11f0-8a58-e8653882e964','4a473cc2-0e1e-11f0-8a58-e8653882e964','49e2ee91-0e1e-11f0-8a58-e8653882e964','Documentação','Alinhamento com equipe técnica.',60,194.76,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a7290a9-0e1e-11f0-8a58-e8653882e964','4a473cc2-0e1e-11f0-8a58-e8653882e964','49e2ee91-0e1e-11f0-8a58-e8653882e964','Documentação','Atividade realizada conforme planejamento.',150,443.31,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a72fc4b-0e1e-11f0-8a58-e8653882e964','4a483e62-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','Desenvolvimento inicial','Atividade realizada conforme planejamento.',180,353.19,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a736bea-0e1e-11f0-8a58-e8653882e964','4a483e62-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Tarefa concluída com sucesso.',150,447.59,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a73d8e6-0e1e-11f0-8a58-e8653882e964','4a497682-0e1e-11f0-8a58-e8653882e964','49e2ea2f-0e1e-11f0-8a58-e8653882e964','Desenvolvimento inicial','Tarefa concluída com sucesso.',120,230.84,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a7460ef-0e1e-11f0-8a58-e8653882e964','4a497682-0e1e-11f0-8a58-e8653882e964','49e2ea2f-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Relatório de progresso entregue.',180,419.06,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a74cf55-0e1e-11f0-8a58-e8653882e964','4a49fc53-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','Documentação','Execução parcial com ajustes previstos.',90,341.19,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a754521-0e1e-11f0-8a58-e8653882e964','4a4a9958-0e1e-11f0-8a58-e8653882e964','49e4e1ca-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Execução parcial com ajustes previstos.',60,311.08,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a75aaaf-0e1e-11f0-8a58-e8653882e964','4a4b291d-0e1e-11f0-8a58-e8653882e964','49e4e060-0e1e-11f0-8a58-e8653882e964','Coleta de dados','Contribuição significativa para o andamento da atividade.',60,160.40,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a7635e7-0e1e-11f0-8a58-e8653882e964','4a4b291d-0e1e-11f0-8a58-e8653882e964','49e4e060-0e1e-11f0-8a58-e8653882e964','Apresentação interna','Relatório de progresso entregue.',120,243.98,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a769db9-0e1e-11f0-8a58-e8653882e964','4a4bbc15-0e1e-11f0-8a58-e8653882e964','49e3bfe1-0e1e-11f0-8a58-e8653882e964','Coleta de dados','Tarefa concluída com sucesso.',120,137.42,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a7710a0-0e1e-11f0-8a58-e8653882e964','4a4bbc15-0e1e-11f0-8a58-e8653882e964','49e3bfe1-0e1e-11f0-8a58-e8653882e964','Análise preliminar','Execução parcial com ajustes previstos.',60,219.84,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a777f26-0e1e-11f0-8a58-e8653882e964','4a4c5f2e-0e1e-11f0-8a58-e8653882e964','49e3cb09-0e1e-11f0-8a58-e8653882e964','Análise preliminar','Contribuição significativa para o andamento da atividade.',120,346.24,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a780404-0e1e-11f0-8a58-e8653882e964','4a4c5f2e-0e1e-11f0-8a58-e8653882e964','49e3cb09-0e1e-11f0-8a58-e8653882e964','Documentação','Relatório de progresso entregue.',180,333.87,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_delete_documents_on_task_delete` BEFORE DELETE ON `task` FOR EACH ROW BEGIN
  
  DELETE FROM document
  WHERE id IN (
    SELECT document_id FROM task_document WHERE task_id = OLD.id
  );

  
  DELETE FROM task_document WHERE task_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `task_document`
--

DROP TABLE IF EXISTS `task_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_document` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre tarefa e documento',
  `task_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID da tarefa associada',
  `document_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do documento vinculado',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_task_document` (`task_id`,`document_id`),
  KEY `document_id` (`document_id`),
  CONSTRAINT `task_document_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_document_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Associação de documentos a uma tarefa realizada dentro de uma atividade';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_document`
--

LOCK TABLES `task_document` WRITE;
/*!40000 ALTER TABLE `task_document` DISABLE KEYS */;
INSERT INTO `task_document` VALUES ('4a7f5968-0e1e-11f0-8a58-e8653882e964','4a6522d8-0e1e-11f0-8a58-e8653882e964','4a78708b-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:51',NULL),('4a8064f9-0e1e-11f0-8a58-e8653882e964','4a6596ff-0e1e-11f0-8a58-e8653882e964','4a794152-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:51',NULL),('4a80f3c4-0e1e-11f0-8a58-e8653882e964','4a676abd-0e1e-11f0-8a58-e8653882e964','4a7c91f7-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:51',NULL),('4a8170c6-0e1e-11f0-8a58-e8653882e964','4a67e040-0e1e-11f0-8a58-e8653882e964','4a7db167-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:51',NULL);
/*!40000 ALTER TABLE `task_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID do time ou grupo',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome do time',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Descrição da finalidade ou escopo do time',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica se o time está ativo no sistema',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Cadastro de times utilizados para agrupar usuários e associá-los a projetos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('4a2ad99d-0e1e-11f0-8a58-e8653882e964','Alpha Delta','Time formado por usuários com nomes iniciados em A',1,'2025-03-31 07:52:50','2025-03-31 08:06:46',NULL),('4a2bcbea-0e1e-11f0-8a58-e8653882e964','Mike','Time formado por usuários com nomes iniciados em M',1,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('b53dd439-659e-454c-a92d-9910fac3f35b','Celta','ssss',1,'2025-03-31 08:06:59','2025-03-31 08:06:59',NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID do usuário',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome completo do usuário',
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'E-mail utilizado para login',
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Senha criptografada do usuário',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica se o usuário está ativo no sistema',
  `system_role_id` int NOT NULL COMMENT 'UUID do papel global do sistema associado ao usuário',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do usuário',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última atualização do usuário',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `system_role_id` (`system_role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`system_role_id`) REFERENCES `system_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela de usuários do sistema com controle de acesso e ciclo de vida';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('49e1bc54-0e1e-11f0-8a58-e8653882e964','Joniel Rodrigues de Oliveira','joniel@fapg.org.br','hashed_password_1',1,1,'2025-03-31 07:52:49','2025-03-31 08:07:32',NULL),('49e1dd62-0e1e-11f0-8a58-e8653882e964','Carlos Santos','carlos@fapg.org.br','hashed_password_3',1,4,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e1e0a8-0e1e-11f0-8a58-e8653882e964','Caio Vinicius','caio@fapg.org.br','hashed_password_4',1,4,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e2d647-0e1e-11f0-8a58-e8653882e964','Ana Lima','ana@fapg.org.br','hashed_password_5',1,2,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e2e27a-0e1e-11f0-8a58-e8653882e964','Ângela Teixeira','angela.teixeira@fapg.org.br','hashed_password_6',1,2,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e2e48d-0e1e-11f0-8a58-e8653882e964','Aline Laura Gonçalves','aline.laura.goncalves@fapg.org.br','hashed_password_7',1,2,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e2e601-0e1e-11f0-8a58-e8653882e964','Amanda Beatriz Nascimento','amanda.beatriz.nascimento@fapg.org.br','hashed_password_8',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e2e806-0e1e-11f0-8a58-e8653882e964','Adriana Souza','adriana.souza@fapg.org.br','hashed_password_9',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e2ea2f-0e1e-11f0-8a58-e8653882e964','Alice Júlia Oliveira','alice.julia.oliveira@fapg.org.br','hashed_password_10',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e2ee91-0e1e-11f0-8a58-e8653882e964','Antônia Silveira','antonia.silveira@fapg.org.br','hashed_password_11',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e3b288-0e1e-11f0-8a58-e8653882e964','Pedro Rocha','pedro@fapg.org.br','hashed_password_12',1,2,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e3bfe1-0e1e-11f0-8a58-e8653882e964','Paola Ramos','paola.ramos@fapg.org.br','hashed_password_13',1,2,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e3c237-0e1e-11f0-8a58-e8653882e964','Paulo Alves','paulo.alves@fapg.org.br','hashed_password_14',1,2,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e3c61c-0e1e-11f0-8a58-e8653882e964','Patrício Peixoto','patricio.peixoto@fapg.org.br','hashed_password_15',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e3c7dc-0e1e-11f0-8a58-e8653882e964','Pâmela Pinto','pamela.pinto@fapg.org.br','hashed_password_16',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e3c944-0e1e-11f0-8a58-e8653882e964','Priscila Sales','priscila.sales@fapg.org.br','hashed_password_17',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e3cb09-0e1e-11f0-8a58-e8653882e964','Pietro Viana','pietro.viana@fapg.org.br','hashed_password_18',1,3,'2025-03-31 07:52:49','2025-03-31 07:52:49',NULL),('49e4b3b3-0e1e-11f0-8a58-e8653882e964','Maria Oliveira','maria@fapg.org.br','hashed_password_19',1,2,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e4d8c1-0e1e-11f0-8a58-e8653882e964','Mônica da Paz','monica.da.paz@fapg.org.br','hashed_password_20',1,2,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e4dbd2-0e1e-11f0-8a58-e8653882e964','Manuela Cecília Teixeira','manuela.cecilia.teixeira@fapg.org.br','hashed_password_21',1,2,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e4dd7e-0e1e-11f0-8a58-e8653882e964','Marcelo Peixoto','marcelo.peixoto@fapg.org.br','hashed_password_22',1,3,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e4def7-0e1e-11f0-8a58-e8653882e964','Matheus Nascimento','matheus.nascimento@fapg.org.br','hashed_password_23',1,3,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e4e060-0e1e-11f0-8a58-e8653882e964','Milena Duarte','milena.duarte@fapg.org.br','hashed_password_24',1,3,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('49e4e1ca-0e1e-11f0-8a58-e8653882e964','Marina Rezende','marina.rezende@fapg.org.br','hashed_password_25',1,3,'2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('5489c1fb-0e1e-11f0-8a58-e8653882e964','Admin','admin@fapg.org.br','$2b$10$BtUp7dUg9cu9WNGu1..izug0kPwjVNqwcT5m1YSHsN0WVbcZYD7Gm',1,1,'2025-03-31 07:53:07','2025-03-31 07:53:07',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project`
--

DROP TABLE IF EXISTS `user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_project` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre usuário e projeto',
  `user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do usuário participante do projeto',
  `project_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do projeto',
  `role_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do papel do usuário neste projeto',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação da associação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_project` (`user_id`,`project_id`),
  KEY `project_id` (`project_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_project_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Associação entre usuários e projetos com definição de papéis no contexto do projeto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project`
--

LOCK TABLES `user_project` WRITE;
/*!40000 ALTER TABLE `user_project` DISABLE KEYS */;
INSERT INTO `user_project` VALUES ('4a14b33c-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1547fd-0e1e-11f0-8a58-e8653882e964','49e2e48d-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a160c67-0e1e-11f0-8a58-e8653882e964','49e2e806-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a16943d-0e1e-11f0-8a58-e8653882e964','49e2ea2f-0e1e-11f0-8a58-e8653882e964','4a06f916-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1721a7-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a17a942-0e1e-11f0-8a58-e8653882e964','49e3c237-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a182cf5-0e1e-11f0-8a58-e8653882e964','49e3c7dc-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a18aa9d-0e1e-11f0-8a58-e8653882e964','49e3cb09-0e1e-11f0-8a58-e8653882e964','4a079060-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a19327f-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a19dc11-0e1e-11f0-8a58-e8653882e964','49e2e27a-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1a6211-0e1e-11f0-8a58-e8653882e964','49e2e601-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1ae5fc-0e1e-11f0-8a58-e8653882e964','49e2e806-0e1e-11f0-8a58-e8653882e964','4a0830c6-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1b5eca-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1bdf1b-0e1e-11f0-8a58-e8653882e964','49e3bfe1-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1c79d7-0e1e-11f0-8a58-e8653882e964','49e3cb09-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1d157a-0e1e-11f0-8a58-e8653882e964','49e3c7dc-0e1e-11f0-8a58-e8653882e964','4a08afbd-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1d99b9-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1e2048-0e1e-11f0-8a58-e8653882e964','49e4dbd2-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1eaf54-0e1e-11f0-8a58-e8653882e964','49e4def7-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1f4ad3-0e1e-11f0-8a58-e8653882e964','49e4e1ca-0e1e-11f0-8a58-e8653882e964','4a094ee6-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a1fcd93-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a2063ab-0e1e-11f0-8a58-e8653882e964','49e4d8c1-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a20ebad-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a218116-0e1e-11f0-8a58-e8653882e964','49e4e060-0e1e-11f0-8a58-e8653882e964','4a09e109-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a21f808-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a228ab6-0e1e-11f0-8a58-e8653882e964','49e2e27a-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a232d82-0e1e-11f0-8a58-e8653882e964','49e2ea2f-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a23c4b3-0e1e-11f0-8a58-e8653882e964','49e2ee91-0e1e-11f0-8a58-e8653882e964','4a0a6cb1-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a245f8b-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a24dccc-0e1e-11f0-8a58-e8653882e964','49e2e48d-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a255578-0e1e-11f0-8a58-e8653882e964','49e2ee91-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a25f163-0e1e-11f0-8a58-e8653882e964','49e2e806-0e1e-11f0-8a58-e8653882e964','4a0adcc0-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a268603-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a27138f-0e1e-11f0-8a58-e8653882e964','49e4dbd2-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a279f63-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a281d5d-0e1e-11f0-8a58-e8653882e964','49e4def7-0e1e-11f0-8a58-e8653882e964','4a0b636e-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a289b48-0e1e-11f0-8a58-e8653882e964','49e3b288-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','49ea2740-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a2921c8-0e1e-11f0-8a58-e8653882e964','49e3bfe1-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','49ea3467-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a29ab32-0e1e-11f0-8a58-e8653882e964','49e3c944-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','49ea3135-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL),('4a2a38af-0e1e-11f0-8a58-e8653882e964','49e3c237-0e1e-11f0-8a58-e8653882e964','4a0be617-0e1e-11f0-8a58-e8653882e964','49ea37a8-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `user_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_team` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da associação entre usuário e time',
  `user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do usuário participante',
  `team_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do time associado',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_team` (`user_id`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `user_team_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Associação entre usuários e times';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team`
--

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
INSERT INTO `user_team` VALUES ('4a2ce000-0e1e-11f0-8a58-e8653882e964','49e2d647-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a2d6557-0e1e-11f0-8a58-e8653882e964','49e2e27a-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a2e0f64-0e1e-11f0-8a58-e8653882e964','49e2e48d-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a2ea068-0e1e-11f0-8a58-e8653882e964','49e2e601-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a2f2bef-0e1e-11f0-8a58-e8653882e964','49e2e806-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a2f9819-0e1e-11f0-8a58-e8653882e964','49e2ea2f-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3028cb-0e1e-11f0-8a58-e8653882e964','49e2ee91-0e1e-11f0-8a58-e8653882e964','4a2ad99d-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a33e2ba-0e1e-11f0-8a58-e8653882e964','49e4b3b3-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3460be-0e1e-11f0-8a58-e8653882e964','49e4d8c1-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a34d6c8-0e1e-11f0-8a58-e8653882e964','49e4dbd2-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3537df-0e1e-11f0-8a58-e8653882e964','49e4dd7e-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a35b837-0e1e-11f0-8a58-e8653882e964','49e4def7-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a3637c7-0e1e-11f0-8a58-e8653882e964','49e4e060-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL),('4a36ae82-0e1e-11f0-8a58-e8653882e964','49e4e1ca-0e1e-11f0-8a58-e8653882e964','4a2bcbea-0e1e-11f0-8a58-e8653882e964','2025-03-31 07:52:50',NULL);
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fapg'
--

--
-- Dumping routines for database 'fapg'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-31 20:15:02
