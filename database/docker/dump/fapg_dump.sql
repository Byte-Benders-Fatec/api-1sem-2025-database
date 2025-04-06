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
INSERT INTO `activity` VALUES ('0a60c1a7-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0001','Atividade 1, PRJ-0001: gerada automaticamente para testes','Não iniciada',6029.00,'2024-01-07','2024-01-22','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a617aa7-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0001','Atividade 2, PRJ-0001: gerada automaticamente para testes','Não iniciada',6169.00,'2024-01-08','2024-01-23','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a626a17-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0001','Atividade 3, PRJ-0001: gerada automaticamente para testes','Não iniciada',4042.00,'2024-01-09','2024-01-24','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a63e09f-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0002','Atividade 1, PRJ-0002: gerada automaticamente para testes','Não iniciada',6685.00,'2024-01-12','2024-01-27','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6494a0-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0002','Atividade 2, PRJ-0002: gerada automaticamente para testes','Não iniciada',2700.00,'2024-01-13','2024-01-28','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a65cb65-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0002','Atividade 3, PRJ-0002: gerada automaticamente para testes','Não iniciada',8673.00,'2024-01-14','2024-01-29','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a667752-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0003','Atividade 1, PRJ-0003: gerada automaticamente para testes','Não iniciada',3552.00,'2024-01-17','2024-02-01','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a67171f-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0003','Atividade 2, PRJ-0003: gerada automaticamente para testes','Não iniciada',8302.00,'2024-01-18','2024-02-02','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a67e790-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0003','Atividade 3, PRJ-0003: gerada automaticamente para testes','Não iniciada',5445.00,'2024-01-19','2024-02-03','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a689ab8-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0004','Atividade 1, PRJ-0004: gerada automaticamente para testes','Não iniciada',6265.00,'2024-01-22','2024-02-06','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a69547f-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0004','Atividade 2, PRJ-0004: gerada automaticamente para testes','Não iniciada',4021.00,'2024-01-23','2024-02-07','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6a54a1-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0004','Atividade 3, PRJ-0004: gerada automaticamente para testes','Não iniciada',6795.00,'2024-01-24','2024-02-08','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6afc99-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0005','Atividade 1, PRJ-0005: gerada automaticamente para testes','Não iniciada',9124.00,'2024-01-27','2024-02-11','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6ba857-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0005','Atividade 2, PRJ-0005: gerada automaticamente para testes','Não iniciada',3639.00,'2024-01-28','2024-02-12','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6c600a-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0005','Atividade 3, PRJ-0005: gerada automaticamente para testes','Não iniciada',4452.00,'2024-01-29','2024-02-13','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6d2249-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0006','Atividade 1, PRJ-0006: gerada automaticamente para testes','Não iniciada',6152.00,'2024-02-01','2024-02-16','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6df25f-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0006','Atividade 2, PRJ-0006: gerada automaticamente para testes','Não iniciada',2828.00,'2024-02-02','2024-02-17','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a6e963e-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0006','Atividade 3, PRJ-0006: gerada automaticamente para testes','Não iniciada',8346.00,'2024-02-03','2024-02-18','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a7074e3-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0007','Atividade 1, PRJ-0007: gerada automaticamente para testes','Não iniciada',3343.00,'2024-02-06','2024-02-21','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a71846b-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0007','Atividade 2, PRJ-0007: gerada automaticamente para testes','Não iniciada',4829.00,'2024-02-07','2024-02-22','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a724659-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0007','Atividade 3, PRJ-0007: gerada automaticamente para testes','Não iniciada',9379.00,'2024-02-08','2024-02-23','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a72fd9f-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0008','Atividade 1, PRJ-0008: gerada automaticamente para testes','Não iniciada',1999.00,'2024-02-11','2024-02-26','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a73c369-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0008','Atividade 2, PRJ-0008: gerada automaticamente para testes','Não iniciada',6719.00,'2024-02-12','2024-02-27','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a747805-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0008','Atividade 3, PRJ-0008: gerada automaticamente para testes','Não iniciada',2150.00,'2024-02-13','2024-02-28','09f27979-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a7544ad-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0009','Atividade 1, PRJ-0009: gerada automaticamente para testes','Não iniciada',9435.00,'2024-02-16','2024-03-02','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a760115-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0009','Atividade 2, PRJ-0009: gerada automaticamente para testes','Não iniciada',8048.00,'2024-02-17','2024-03-03','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a76b40e-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0009','Atividade 3, PRJ-0009: gerada automaticamente para testes','Não iniciada',8196.00,'2024-02-18','2024-03-04','09f40c57-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a7789f3-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','Atividade 1 de PRJ-0010','Atividade 1, PRJ-0010: gerada automaticamente para testes','Não iniciada',9866.00,'2024-02-21','2024-03-07','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a78725a-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','Atividade 2 de PRJ-0010','Atividade 2, PRJ-0010: gerada automaticamente para testes','Não iniciada',6937.00,'2024-02-22','2024-03-08','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a7926d2-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','Atividade 3 de PRJ-0010','Atividade 3, PRJ-0010: gerada automaticamente para testes','Não iniciada',2265.00,'2024-02-23','2024-03-09','09f3592e-12dc-11f0-a733-e8653882e964',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL);
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
INSERT INTO `activity_document` VALUES ('0a9bf781-12dc-11f0-a733-e8653882e964','0a60c1a7-12dc-11f0-a733-e8653882e964','0a8cb10d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a9c9136-12dc-11f0-a733-e8653882e964','0a617aa7-12dc-11f0-a733-e8653882e964','0a90d5b6-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a9d4143-12dc-11f0-a733-e8653882e964','0a626a17-12dc-11f0-a733-e8653882e964','0a93ac70-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a9e2370-12dc-11f0-a733-e8653882e964','0a63e09f-12dc-11f0-a733-e8653882e964','0a9600e1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a9ecf1b-12dc-11f0-a733-e8653882e964','0a6494a0-12dc-11f0-a733-e8653882e964','0a9854af-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a9f5f07-12dc-11f0-a733-e8653882e964','0a65cb65-12dc-11f0-a733-e8653882e964','0a9ab1c1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL);
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
INSERT INTO `activity_user` VALUES ('0a7a29f6-12dc-11f0-a733-e8653882e964','0a60c1a7-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a7af223-12dc-11f0-a733-e8653882e964','0a60c1a7-12dc-11f0-a733-e8653882e964','09f28764-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a7bacb7-12dc-11f0-a733-e8653882e964','0a60c1a7-12dc-11f0-a733-e8653882e964','09f28ac1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a7c6467-12dc-11f0-a733-e8653882e964','0a60c1a7-12dc-11f0-a733-e8653882e964','09f28d7a-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a7d355f-12dc-11f0-a733-e8653882e964','0a617aa7-12dc-11f0-a733-e8653882e964','09f2902c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a7e0dad-12dc-11f0-a733-e8653882e964','0a63e09f-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a7ec310-12dc-11f0-a733-e8653882e964','0a65cb65-12dc-11f0-a733-e8653882e964','09f366b8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a7f9192-12dc-11f0-a733-e8653882e964','0a67171f-12dc-11f0-a733-e8653882e964','09f28764-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a804da3-12dc-11f0-a733-e8653882e964','0a67e790-12dc-11f0-a733-e8653882e964','09f28ac1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a80f48e-12dc-11f0-a733-e8653882e964','0a689ab8-12dc-11f0-a733-e8653882e964','09f364e1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a81a99c-12dc-11f0-a733-e8653882e964','0a6a54a1-12dc-11f0-a733-e8653882e964','09f36797-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a825461-12dc-11f0-a733-e8653882e964','0a6afc99-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a83000e-12dc-11f0-a733-e8653882e964','0a6ba857-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a83a7d7-12dc-11f0-a733-e8653882e964','0a6df25f-12dc-11f0-a733-e8653882e964','09f418f4-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a845c8c-12dc-11f0-a733-e8653882e964','0a6e963e-12dc-11f0-a733-e8653882e964','09f414d3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a851179-12dc-11f0-a733-e8653882e964','0a7074e3-12dc-11f0-a733-e8653882e964','09f28d7a-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a85d827-12dc-11f0-a733-e8653882e964','0a71846b-12dc-11f0-a733-e8653882e964','09f295f7-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a86de61-12dc-11f0-a733-e8653882e964','0a72fd9f-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a8792a3-12dc-11f0-a733-e8653882e964','0a747805-12dc-11f0-a733-e8653882e964','09f292d2-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a885bea-12dc-11f0-a733-e8653882e964','0a7544ad-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a89209d-12dc-11f0-a733-e8653882e964','0a7544ad-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a89e5eb-12dc-11f0-a733-e8653882e964','0a760115-12dc-11f0-a733-e8653882e964','09f41ae0-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a8a98b0-12dc-11f0-a733-e8653882e964','0a76b40e-12dc-11f0-a733-e8653882e964','09f419ef-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a8b52c6-12dc-11f0-a733-e8653882e964','0a7789f3-12dc-11f0-a733-e8653882e964','09f3638a-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a8bf9f8-12dc-11f0-a733-e8653882e964','0a78725a-12dc-11f0-a733-e8653882e964','09f3686e-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL);
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
INSERT INTO `area` VALUES ('09fe884d-12dc-11f0-a733-e8653882e964','Aeroespacial','Projetos relacionados a engenharia e tecnologia aeroespacial',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fe8ea9-12dc-11f0-a733-e8653882e964','Saúde','Projetos voltados para biomedicina, saúde pública e ciências da vida',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fe91d5-12dc-11f0-a733-e8653882e964','Tecnologia da Informação','Projetos na área de desenvolvimento de software, dados e sistemas',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fe92ad-12dc-11f0-a733-e8653882e964','Educação','Projetos relacionados à inovação e pesquisa na área educacional',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fe94f1-12dc-11f0-a733-e8653882e964','Energia','Projetos sobre fontes de energia, sustentabilidade e eficiência energética',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fe95c6-12dc-11f0-a733-e8653882e964','Meio Ambiente','Projetos focados em preservação ambiental, ecologia e sustentabilidade',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fe9673-12dc-11f0-a733-e8653882e964','Robótica','Projetos com foco em automação, robótica e mecatrônica',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL);
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
INSERT INTO `document` VALUES ('09ff921c-12dc-11f0-a733-e8653882e964','documento_PRJ-0001_CAPES.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 439>>\nstream\nx�m��n\�0\�\�<ō\����Y\�\�\���\Z��E:4D\�)�\�\�f\\�Sѽ$m\�@!~�\�\���\�+Ί\n^��50� $\��,��KԜ	U]�����/O�ݐ�\�`�W~l�5\�\�5\�\�v\�d\�MG��Iz\�ۯ\�l�F\�[L�3�D\rUV�\�`�t�`��\�\�`Mvp\�V�W-F���2.j=\��\�H9����\"߭�\�\�w,N�S\� .\�\"gY�\�ۿ�ZG\�\�\�5\���,X]\'\�G?��\�\�\�&�~!.ꊕyߡ\���\�\'�t\\\�x=�\\\�T&\�\'T��2\�Q�S\�\�\"Hg|�\�\�9��\�߬�V!\�+�\�\�\�!��7O\�\�&��!�\�3�\�s&\�sb\�̛�\�\Z�נ\�\�\Z\�����P9B\�8\Z`\��W�R�[2\��-��;��R�>5��\ra\�\"5��E�-\�\�\�\�\�l�S�6\�>	�O�/\�rV��U���3\�\��[\�@f3�Mf�\�\�\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000596 00000 n \n0000000883 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000683 00000 n \n0000000779 00000 n \n0000000997 00000 n \n0000001106 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1209\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a049921-12dc-11f0-a733-e8653882e964','documento_PRJ-0002_CAPES.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 439>>\nstream\nx�u�\�N\�0\�\�<\���\�\�I\���Z\�C\�VF�]\�NA�.ԕ8���\�6*Qw����}3�o8ܟQ\"Jx9�j`vˀqB)4K����U�0\ne%HYB\����\�>Ko\�\�8��\�*kp\rpc\�AKn:	\��ԛ�=�\��`��\�\�;c�UPf\�\�ֵ\�v0h辛ɽ�d���\�\�U�Q!a�=\�R�^\�\�H1礘�\"?���\�X���g৴\�I�%���S�������C\����}\�\���Z�.ukO\��*I�\'�\rz�o�3�a�`bFٌS��RE\Z�Pͮ\�\�\�wɭr\�����J$�r\�۴\n\�V��\�\����|�G�\�CB/G>�\�\�Ўy�w�5~�A��\�5~��z�\�Aʭ\'{�Z���\�F\Zt\��\�MAB�M\�i\"���P?��]��4[�ު\�\r�, F\'�g9de�,\'Ì�\�\�2\�ٌfq�b��\�\�\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000596 00000 n \n0000000883 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000683 00000 n \n0000000779 00000 n \n0000000997 00000 n \n0000001106 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1209\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a07bef5-12dc-11f0-a733-e8653882e964','documento_PRJ-0003_FAPESP.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 440>>\nstream\nx�mR\�n\�0�\�+\�\�B\�!J�oy\�@r(�Z?�Hk��I\Z\"\��\�\�\�$m\�\\�B��\�,�\�Jdo7\�\rL\'�B��y�>��F��%�*h:��\�\�+O\��V;��p��\���C��@�ۺ�м���6iFX\r���8J\�}@8�`��,�G1\�`�:jΨ�[�;\�+Xk\�6`\� �\���SN\�i\�\���pz\�\�|9{q͖\"��tz�Hߟo)���rI\�:cWA��\�`5�Zﮰ��HYd\�\n*���c�3�l��z�,c`t\�j�\�6�	\�\�5�\�	\�_\\\�Jj��w�_�\�\nڪt\�\\���\�|�<\�8\�<\�\�v(�\�奱KY\�\�A\�l8\�v\�z�>����\���G\�\�\�\�V�\�e\�d��$\�\�E�S��\�\�0gtl@ƌY6�̋\�[Х\�\�\�\�v��2\�>�����%�*JV�4Ӟ}�\���P�B�g�?\�\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000597 00000 n \n0000000884 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000684 00000 n \n0000000780 00000 n \n0000000998 00000 n \n0000001107 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1210\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a0a4310-12dc-11f0-a733-e8653882e964','documento_PRJ-0004_FAPESP.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 442>>\nstream\nx�mR�n\�0\�\�[^�P|��\�.H��q\�0m0IC�� ��\"\���돤-8�� ș\�ٝ�\�p�/\�\�⦆lI�P�1\�kX\�\�Te\�QYB\�¯Uo���po�W~h�5��+��͠�	?��ū\�\�\�^B�|J\�d�\�\"��B\� �p^\�\r\�w1y��\�EkA\�j\�U#\"B\�V\�\�ʸ�\�2h�ouE�E\�,�m��p\�c>^Fϐ��y�K\�ۯVm\"\�\�\�\��,娪\�\�?�9\�\n\�\�.X?\�DE��w\����#�&.2�);gabxª\��V&6%w\�y1\�\�\�?�\�s�*��כ��Q�ʈxim�\�\�\�\�q5\�(�4\�\�r\�g9�\�)�SZ\�\�Bc�\�kPfm{->�I�\�A\0ʝ\'{�\�\�[Js+�p��-<	w�3\�z4��x2I�~Ri\r\�x�4;\�\�Tr�&\�G�\�\��\�,G�\0V\�r2͸h\�!\�2\�\��(\�\�w\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000599 00000 n \n0000000886 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000686 00000 n \n0000000782 00000 n \n0000001000 00000 n \n0000001109 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1212\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a0c690f-12dc-11f0-a733-e8653882e964','documento_PRJ-0005_CNPq.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 441>>\nstream\nx�m�\�N\�0�\�<\�]\\�\�\�n(E�BL^\����Qlwb��x]�H�\�\�\�v[Jԑ���\�{}\�\�p{FI^\�\�\�e\r�k�J�^¢��XE	�PV9)K�[�q\�\�\'\�-\�\�\Ze\rvpW��4\�O+a\�G\�ugϡ~\�%o6\���\nJQ��^8/a��\���ܙ�J\�\�Z��[�^5\�\�#,�qQ\�e\� \�\�\�SN�i*rg���\�\�p9\��)�gD�D\�?[��\�\�\��\�?Z���J\�_�\�f0��醏֞�\�$E�\�W\�1>\�\�|��΀�I8�r~JabtD\�\�^+%7\�y�\�\�ȋS>��\��s\�n\Z�p�\�Kk��\�\�\�(N8\�<\�l�^;fe^-4\���e��\��\�W:\�%*A(7�\�a\�S/)˵4\��-<�ۇ�B�>4A\�\r\�a\�,5��Q�%h\�q\�ll�Q�2Z>���/\�e�,G��k\�\�\Z\"\�bBE\�W\��\0_�\�L\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000598 00000 n \n0000000885 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000685 00000 n \n0000000781 00000 n \n0000000999 00000 n \n0000001108 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1211\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a0edc48-12dc-11f0-a733-e8653882e964','documento_PRJ-0006_CNPq.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 440>>\nstream\nx�m�\�N\�0�\�<\�Y\\\��k�c�H�@h\��ĭ�j�;e4�\��Ո�\�n;%\�HYX\��ν�\�rܝQRTx9�\�`r\��8�\�\�&�b5%���RUh:|{\�\�\��\�y\�VY#V���m-M�\�$濤^�\�9�\�Q\�f#\�V�\�j�\�\�\�Kl1ht_\�\�\�Kً\�B\�j\�U+�Bb-z��2.j�\�K\�]�r\�I9ME��w\��C\�(O\�\"\'Y�\�?�ZF\�\�\��\�?Z^��N\�G/�\�f�kӥn퉾�+R\�I-��o�5a�3P6�لS��Re\ZQͶ\�\�\�wɍr^\���\�#_�\�9%u��\�\�i���2\":\�\�\��\�\�\�\�\�\�ϧ9\�\�1�c\\\�բ�\�o5�Y\�^��O\�\�K��Pn$�\�1x�R�S�ki���xn�g\�1�\�7P�)�Ԁ\�O*\�A?\'\�Ʈ6*uCF�\��\�h�\�,\'E��\n�\�h�q\�\�^C<\�G\�o�_*\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000597 00000 n \n0000000884 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000684 00000 n \n0000000780 00000 n \n0000000998 00000 n \n0000001107 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1210\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a11012b-12dc-11f0-a733-e8653882e964','documento_PRJ-0007_Finep.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 434>>\nstream\nx�uR\�n\�0�\�+\�\�B\�\�[\�8@r(�T?��\�\r�4D\�)��9.\�S\�{)چ#�x���\�ٝ�\�x\�Y^\�\�\�\�\Zf\��d�C��e=>��3���rV�P�\�\�[\�<Xt\Z\�,vpw�\���%X� �\�\�G��\'��-&\�J0QA�*��\�K0hߋ\�Q6\�c\�\0�\�\�\�� \�a��\�֏\�@Q���{,R\�%+\�\�Wg(\�é�\��r\�\�5;ϘR��\�՛�\�\�x\�9�V欪\�{�0��\�\�\�6Z�\�UɊ,�\�0\�\����G�\0.f\�H.\�kV\'\�\'��\�mǦh�}�E�΄�?\�\��\�\�m4½�8^Z\�Gn��ݙ&��1�\�?�gL�\�.a\���\�`@۵\�\r��!=�\���\'\�\�\�t��0wd\�G�q�BJ3�\�l�O\r\�q\�\"@�\�i\�\�x�{\�\�ur\�&\�\'A\�\�\�e*cy���\�d�㞽�\���q5�\�_�\�\�_\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000591 00000 n \n0000000878 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000678 00000 n \n0000000774 00000 n \n0000000992 00000 n \n0000001101 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1204\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a134819-12dc-11f0-a733-e8653882e964','documento_PRJ-0008_Finep.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 442>>\nstream\nx�m�\�n\�0E\���Y��P|\�ay\�&�,��\�0\�\�` ��H9E7���*�I[pЂ�\�3�;\�.()*x��\�@vÀqB)4kX5\��)a�� UM\�\���\�­q^��U\�\�.\�ڶ�F�t������\�\�\�(y���`�\�P����\�\�y�=�\Z�\�fx0�\r�� Go�\���Q������2.j=\�\�H�\�\\�\"��\�\�\�{,�\�\�3,\�\�\"\'B$�\��6�}wI)�B\�R\�I�\�K?�%\\Y\�\�\�[g\�\�E]�2O\�k\�e���y#]e�2N9;�\�01:�������r^.AЌ��\�\�|NI]$�\�\�մJ22:;6�\�v\�8\�<\�\�t\�\�ENxyJ\��y�\�Z\�\�\Z�Y\�A˗wt0�T�w�\�տ\��t\��;��R����\��0c�\Z��A�-\�\�\�\�\�l�S�2\�>�ζ/9)JU��fÌ{\�\�2\�\"�\"ΰ��>\0�W\��\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000599 00000 n \n0000000886 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000686 00000 n \n0000000782 00000 n \n0000001000 00000 n \n0000001109 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1212\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a155943-12dc-11f0-a733-e8653882e964','documento_PRJ-0009_Sebrae.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 440>>\nstream\nx�uR\�n\�0�\�+\�\�B\�\�[�8@r(�F?��\��4D\�	��9.\�S\�{)ڂ#8x ș\�ٝ�\�p\�Y^\�\�\�\�\Zfw�d�C��e=<��3���rV�P�\�\�{\�(8��>\�\�7\�Y\�\�5ܺ�7d\�OK�|!�ۺ\�P?�����h+�D���:J/} 8@o�}/FG1\�P��\�3t��`�\�Z[?`E\r\��\�H1����\"ߜ���>\�e\�\�%;ϘR�}\�՛�\�\�\�s�V欪\�1`\���жɭ��\�UɊ,\�o1\�\�ý���\0.f\\\�$�\�%��C\�V}茶C_�\�>\��	\�~\�Y�\'��\�/\�h�;mq����\�GZuH#O2)cD\�g�l�1Y�S;f_4Ά�m׮3�\��<t�\�CҞ�S}\�[�3�#�>����S�)\�\�0�	>5�\�9�d\0\�J�Mh�\�\�\�\�v��6\�@	�O60S\�Pe�,\'\�v\�\�5� Ռ�a��(\���\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000597 00000 n \n0000000884 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000684 00000 n \n0000000780 00000 n \n0000000998 00000 n \n0000001107 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1210\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a184ca6-12dc-11f0-a733-e8653882e964','documento_PRJ-0010_Sebrae.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 438>>\nstream\nx�u��n\�0\�\�<ō\����Y\�\�\���(\Z��Y:L\�)�\�\�f\\�Sѽ$m�\�\Z\��}w�\�$<]qVT\�z\���ك\0!\�Ьa\�\�_�\�Lp�\�U4|�\�\�\��\�\����p\��4�p\�,��\�m\�54/\'�\�-&ޙ`��*�Yv�^:Op�AC\�ь�f��;8x�ѫ��`�=\�Z����P\�X��KV\�S�/VS\��\�;\�a\��ċ�eY\�\�~wj�oO7��K+V\�I�\�\�nwhZچ\�/\�E]�2O\�{\�_\�h~��.��\�g�\�\�*\�\���j�V&��\�\�yL���\�s\�\�\"񷛟�U\�`<t�\�3�z���L\�\�\�\� �\�L�\�\�\�q�7�5��A��\�5��!=�r��\'p\�\�\�\�V�Hq\�Ƞ���Bw\�3\�=6��\ra\�\"5�z�\�t\�sd\�v�W�6\�?��\�_�\�(!��e5�fܴ\���\�f<�C,F��%\'\�\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n6 0 obj\n<</Type /Font\n/BaseFont /Helvetica-Oblique\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n/F2 6 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n7 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250323144734)\n>>\nendobj\n8 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 9\n0000000000 65535 f \n0000000595 00000 n \n0000000882 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000682 00000 n \n0000000778 00000 n \n0000000996 00000 n \n0000001105 00000 n \ntrailer\n<<\n/Size 9\n/Root 8 0 R\n/Info 7 0 R\n>>\nstartxref\n1208\n%%EOF\n',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('0a8cb10d-12dc-11f0-a733-e8653882e964','atividade_PRJ-0001_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�\�*?\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a90d5b6-12dc-11f0-a733-e8653882e964','atividade_PRJ-0001_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C\�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�\'*@\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a93ac70-12dc-11f0-a733-e8653882e964','atividade_PRJ-0001_3.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�\�$mbGE:�\����b�\�T_\�(\�t\��%���1xW;�\�Q@\�\�{\��~/�jR-Lې0��m��\�P\�	�s�bf��\��F\�b4�ִ�?�O�i\��0\�a��\�\�\�\�X�\�rsu��\���*A\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a9600e1-12dc-11f0-a733-e8653882e964','atividade_PRJ-0002_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�*@\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a9854af-12dc-11f0-a733-e8653882e964','atividade_PRJ-0002_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�ޤmbGE:�\����b��T_\�(\�t\��%���\�xW;�\�Q@4\�s\��|/Y7Tw\�]KB\�8,�9���\�C\�E�\����\�f���Q\�J\�F�\�>^�\�\�sD\n\�t�\�=\�\�\"�T�Ҳs5\�\\�\0�z*A\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a9ab1c1-12dc-11f0-a733-e8653882e964','atividade_PRJ-0002_3.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 133>>\nstream\nx�5̱\n\�0�\�OqF�\�$mbGE:�\����b�\�T_\�(\�t\��%���1xW;�\�Q@\�\�{\��~/�jR-Lې0��m��\�P\�	�s�bf��\��F\�b4�ִ�?�O�i\��0\�a��\�\�\�\�X�\�rsu��\��\�*B\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000290 00000 n \n0000000473 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000377 00000 n \n0000000577 00000 n \n0000000686 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n789\n%%EOF\n',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0abb9b19-12dc-11f0-a733-e8653882e964','tarefa_PRJ-0001_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0abe1b45-12dc-11f0-a733-e8653882e964','tarefa_PRJ-0001_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��r\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ac07a68-12dc-11f0-a733-e8653882e964','tarefa_PRJ-0002_1.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��f\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ac324c5-12dc-11f0-a733-e8653882e964','tarefa_PRJ-0002_2.pdf','application/pdf',_binary '%PDF-1.3\n3 0 obj\n<</Type /Page\n/Parent 1 0 R\n/Resources 2 0 R\n/Contents 4 0 R>>\nendobj\n4 0 obj\n<</Filter /FlateDecode /Length 130>>\nstream\nx�5\��\n\�0�\�{�b�zp݄�k��z\�6\�\ZiR|}kQ�\��\�[�����b{20���=�����\�xH\�\��\�J\��\0�.\�|i7\�l\�\��q\�R״�8�\�4\�gIȷaz�ٽ\�Pb��.�,\�L�\��\�\'\�\nendstream\nendobj\n1 0 obj\n<</Type /Pages\n/Kids [3 0 R ]\n/Count 1\n/MediaBox [0 0 595.28 841.89]\n>>\nendobj\n5 0 obj\n<</Type /Font\n/BaseFont /Helvetica\n/Subtype /Type1\n/Encoding /WinAnsiEncoding\n>>\nendobj\n2 0 obj\n<<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/Font <<\n/F1 5 0 R\n>>\n/XObject <<\n>>\n>>\nendobj\n6 0 obj\n<<\n/Producer (PyFPDF 1.7.2 http://pyfpdf.googlecode.com/)\n/CreationDate (D:20250324190624)\n>>\nendobj\n7 0 obj\n<<\n/Type /Catalog\n/Pages 1 0 R\n/OpenAction [3 0 R /FitH null]\n/PageLayout /OneColumn\n>>\nendobj\nxref\n0 8\n0000000000 65535 f \n0000000287 00000 n \n0000000470 00000 n \n0000000009 00000 n \n0000000087 00000 n \n0000000374 00000 n \n0000000574 00000 n \n0000000683 00000 n \ntrailer\n<<\n/Size 8\n/Root 7 0 R\n/Info 6 0 R\n>>\nstartxref\n786\n%%EOF\n',1,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL);
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
INSERT INTO `funding_agency` VALUES ('09fc959a-12dc-11f0-a733-e8653882e964','Não aplicável','N/A','00.000.000/0001-00','N/A',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fc9c82-12dc-11f0-a733-e8653882e964','Coordenação de Aperfeiçoamento de Pessoal de Nível Superior','CAPES','00.394.544/0001-62','https://www.gov.br/capes',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fc9ece-12dc-11f0-a733-e8653882e964','Fundação de Amparo à Pesquisa do Estado de São Paulo','FAPESP','43.828.151/0001-45','https://fapesp.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fcb28c-12dc-11f0-a733-e8653882e964','Conselho Nacional de Desenvolvimento Científico e Tecnológico','CNPq','33.654.831/0001-36','https://www.gov.br/cnpq',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fcb679-12dc-11f0-a733-e8653882e964','Financiadora de Estudos e Projetos','Finep','33.749.793/0001-01','https://www.finep.gov.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fcb7c7-12dc-11f0-a733-e8653882e964','Serviço Brasileiro de Apoio às Micro e Pequenas Empresas','Sebrae','03.813.990/0001-47','https://www.sebrae.com.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL);
/*!40000 ALTER TABLE `funding_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID da instituição',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome completo da instituição (ex: Faculdade de Tecnologia de São José dos Campos)',
  `acronym` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Sigla da instituição (ex: FATEC-SJC)',
  `cnpj` varchar(18) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'CNPJ da instituição (formato 00.000.000/0000-00)',
  `website` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Site oficial da instituição',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se a instituição está ativa para uso no sistema',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do registro',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última modificação',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `acronym` (`acronym`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Instituições beneficiadas pelos projetos da plataforma, como universidades e faculdades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES ('09fda185-12dc-11f0-a733-e8653882e964','Não aplicável','N/A','00.000.000/0001-00','N/A',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fda8df-12dc-11f0-a733-e8653882e964','Fatec São José dos Campos – Prof. Jessen Vidal','FATEC-SJC','62.823.257/0146-65','https://sjc.fatec.sp.gov.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fdac1e-12dc-11f0-a733-e8653882e964','Fatec Jacareí – Professor Francisco de Moura','FATEC-JACAREÍ','62.823.257/0258-61','https://fatecjacarei.cps.sp.gov.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fdad56-12dc-11f0-a733-e8653882e964','Fatec Taubaté','FATEC-TAUBATÉ','62.823.257/0251-95','https://fatectaubate.cps.sp.gov.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fdae69-12dc-11f0-a733-e8653882e964','Fatec Guaratinguetá – Prof. João Mod','FATEC-GUARATINGUETÁ','62.823.257/0106-78','https://www.fatecguaratingueta.edu.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fdafbb-12dc-11f0-a733-e8653882e964','Fatec Mogi das Cruzes','FATEC-MOGI','62.823.257/0184-90','https://www.fatecmogidascruzes.com.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09fdb0c2-12dc-11f0-a733-e8653882e964','Fatec São Paulo','FATEC-SP','62.823.257/0015-04','https://www.fatecsp.br',1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
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
INSERT INTO `permission` VALUES ('09f734e1-12dc-11f0-a733-e8653882e964','User - View',1,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f73bac-12dc-11f0-a733-e8653882e964','User - Create',1,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f73db6-12dc-11f0-a733-e8653882e964','User - Edit',1,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f73ec2-12dc-11f0-a733-e8653882e964','User - Delete',1,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f73fb0-12dc-11f0-a733-e8653882e964','Team - View',2,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f7409d-12dc-11f0-a733-e8653882e964','Team - Create',2,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74183-12dc-11f0-a733-e8653882e964','Team - Edit',2,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74266-12dc-11f0-a733-e8653882e964','Team - Delete',2,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74354-12dc-11f0-a733-e8653882e964','Project - View',3,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f7445c-12dc-11f0-a733-e8653882e964','Project - Create',3,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74569-12dc-11f0-a733-e8653882e964','Project - Edit',3,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74650-12dc-11f0-a733-e8653882e964','Project - Delete',3,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74739-12dc-11f0-a733-e8653882e964','Activity - View',4,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74837-12dc-11f0-a733-e8653882e964','Activity - Create',4,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f7491c-12dc-11f0-a733-e8653882e964','Activity - Edit',4,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74a15-12dc-11f0-a733-e8653882e964','Activity - Delete',4,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74afe-12dc-11f0-a733-e8653882e964','Task - View',5,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74be8-12dc-11f0-a733-e8653882e964','Task - Create',5,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74ccc-12dc-11f0-a733-e8653882e964','Task - Edit',5,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74de5-12dc-11f0-a733-e8653882e964','Task - Delete',5,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f74f9b-12dc-11f0-a733-e8653882e964','Document - View',6,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f750ae-12dc-11f0-a733-e8653882e964','Document - Create',6,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f7518d-12dc-11f0-a733-e8653882e964','Document - Edit',6,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f75268-12dc-11f0-a733-e8653882e964','Document - Delete',6,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f7534a-12dc-11f0-a733-e8653882e964','Funding Agency - View',7,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f7542d-12dc-11f0-a733-e8653882e964','Funding Agency - Create',7,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f75510-12dc-11f0-a733-e8653882e964','Funding Agency - Edit',7,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f755ef-12dc-11f0-a733-e8653882e964','Funding Agency - Delete',7,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f756fe-12dc-11f0-a733-e8653882e964','Area - View',8,1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f757e0-12dc-11f0-a733-e8653882e964','Area - Create',8,2,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f758b9-12dc-11f0-a733-e8653882e964','Area - Edit',8,3,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f75a71-12dc-11f0-a733-e8653882e964','Area - Delete',8,4,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL);
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
  `area_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UUID da área de atuação do projeto',
  `status` enum('Planejado','Em andamento','Suspenso','Concluído','Cancelado') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Planejado' COMMENT 'Status atual do projeto no sistema',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o projeto está ativo na plataforma',
  `start_date` date NOT NULL COMMENT 'Data de início planejada ou real do projeto',
  `end_date` date NOT NULL COMMENT 'Data de término prevista ou real do projeto',
  `budget` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'Orçamento total disponível para o projeto (em reais)',
  `institution_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UUID da instituição vinculada ao projeto',
  `funding_agency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UUID da agência financiadora do projeto',
  `created_by_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UUID do usuário responsável pela criação do projeto',
  `responsible_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UUID do usuário responsável pelo projeto',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do projeto',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do projeto',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica do projeto',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `area_id` (`area_id`),
  KEY `institution_id` (`institution_id`),
  KEY `funding_agency_id` (`funding_agency_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `responsible_user_id` (`responsible_user_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `project_ibfk_3` FOREIGN KEY (`funding_agency_id`) REFERENCES `funding_agency` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `project_ibfk_4` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `project_ibfk_5` FOREIGN KEY (`responsible_user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Projetos registrados na plataforma, com controle de status, orçamento, responsáveis e vínculos institucionais';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('0a1b364b-12dc-11f0-a733-e8653882e964','Projeto Exemplo 1','PRJ-0001','Projeto gerado automaticamente para fins de teste e validação.','09fe91d5-12dc-11f0-a733-e8653882e964','Planejado',1,'2024-09-01','2025-08-31',100000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fc9c82-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1bd22a-12dc-11f0-a733-e8653882e964','Projeto Exemplo 2','PRJ-0002','Projeto gerado automaticamente para fins de teste e validação.','09fe884d-12dc-11f0-a733-e8653882e964','Em andamento',1,'2024-01-15','2024-12-15',85000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fc9c82-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1c615e-12dc-11f0-a733-e8653882e964','Projeto Exemplo 3','PRJ-0003','Projeto gerado automaticamente para fins de teste e validação.','09fe8ea9-12dc-11f0-a733-e8653882e964','Suspenso',1,'2023-01-01','2024-12-31',120000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fc9ece-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1d0508-12dc-11f0-a733-e8653882e964','Projeto Exemplo 4','PRJ-0004','Projeto gerado automaticamente para fins de teste e validação.','09fe91d5-12dc-11f0-a733-e8653882e964','Cancelado',1,'2023-06-01','2024-05-31',0.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fc9ece-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1d8562-12dc-11f0-a733-e8653882e964','Projeto Exemplo 5','PRJ-0005','Projeto gerado automaticamente para fins de teste e validação.','09fe92ad-12dc-11f0-a733-e8653882e964','Concluído',1,'2022-01-01','2023-12-31',70000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fcb28c-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1e0b37-12dc-11f0-a733-e8653882e964','Projeto Exemplo 6','PRJ-0006','Projeto gerado automaticamente para fins de teste e validação.','09fe92ad-12dc-11f0-a733-e8653882e964','Em andamento',1,'2024-03-01','2025-02-28',95000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fcb28c-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1e8b29-12dc-11f0-a733-e8653882e964','Projeto Exemplo 7','PRJ-0007','Projeto gerado automaticamente para fins de teste e validação.','09fe94f1-12dc-11f0-a733-e8653882e964','Planejado',1,'2025-01-01','2025-12-31',200000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fcb679-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1f1faa-12dc-11f0-a733-e8653882e964','Projeto Exemplo 8','PRJ-0008','Projeto gerado automaticamente para fins de teste e validação.','09fe95c6-12dc-11f0-a733-e8653882e964','Concluído',1,'2021-07-01','2022-06-30',110000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fcb679-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a1fd6e6-12dc-11f0-a733-e8653882e964','Projeto Exemplo 9','PRJ-0009','Projeto gerado automaticamente para fins de teste e validação.','09fe9673-12dc-11f0-a733-e8653882e964','Em andamento',1,'2024-02-01','2024-11-30',67000.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fcb7c7-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2064f2-12dc-11f0-a733-e8653882e964','Projeto Exemplo 10','PRJ-0010','Projeto gerado automaticamente para fins de teste e validação.','09fe91d5-12dc-11f0-a733-e8653882e964','Cancelado',1,'2023-04-01','2023-12-01',0.00,'09fda8df-12dc-11f0-a733-e8653882e964','09fcb7c7-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL);
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
INSERT INTO `project_area` VALUES ('0a22006e-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','09fe884d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a2209aa-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','09fe9673-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a220d46-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','09fe8ea9-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a220f79-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','09fe92ad-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a22117c-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','09fe91d5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a2213a4-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','09fe94f1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a221555-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','09fe95c6-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a2216fe-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','09fe8ea9-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a2218ab-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','09fe91d5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a221af8-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','09fe884d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a221d2c-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','09fe92ad-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a221edf-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','09fe95c6-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a22210f-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','09fe94f1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a2222d3-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','09fe9673-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a2224ce-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','09fe91d5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL);
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
INSERT INTO `project_document` VALUES ('0a22da4e-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','09ff921c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a238047-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','0a049921-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a243f94-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','0a07bef5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a24d83c-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','0a0a4310-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a2586de-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','0a0c690f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a262a0d-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','0a0edc48-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a26c43c-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','0a11012b-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a276770-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','0a134819-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a280849-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','0a155943-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a28da4c-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','0a184ca6-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL);
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
INSERT INTO `project_team` VALUES ('0a590c37-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a59d3f1-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5a982b-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5b7ed5-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5c5608-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5d051b-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5d96bb-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5e3a97-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5eeaa9-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5facbd-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL);
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
INSERT INTO `role` VALUES ('09f84cc8-12dc-11f0-a733-e8653882e964','Coordenador','Responsável por liderar o projeto',0,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f8522c-12dc-11f0-a733-e8653882e964','Colaborador','Participa da execução das atividades do projeto',1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f853ca-12dc-11f0-a733-e8653882e964','Gestor','Gerencia o progresso e recursos do projeto',0,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f8547f-12dc-11f0-a733-e8653882e964','Observador','Pode visualizar o projeto, mas não realizar alterações',0,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL);
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
INSERT INTO `role_permission` VALUES ('09fa51ac-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74837-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa59ac-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74a15-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa5b93-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74a15-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa5cdd-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f7491c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa5eef-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f7491c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6002-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f7491c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa623a-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','09f74739-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6375-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74739-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6483-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74739-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6591-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f74739-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa66b4-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f757e0-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa67bf-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f757e0-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa68e6-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f75a71-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6a00-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f75a71-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6bd3-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f758b9-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6d09-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f758b9-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6e34-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f756fe-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa6f42-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f756fe-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7083-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f750ae-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa71a1-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f750ae-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa728f-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f750ae-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7393-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f75268-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa748b-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f75268-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7663-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f75268-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7875-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f7518d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa798d-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f7518d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7a88-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f7518d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7bac-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','09f74f9b-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7c9e-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74f9b-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7d95-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74f9b-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7e86-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f74f9b-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa7fa2-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f7542d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa80ce-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f7542d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa81e1-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f755ef-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa82e9-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f755ef-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa83f4-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f75510-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa852c-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f75510-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa86c6-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f7534a-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa87bc-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f7534a-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa88c0-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f7445c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa8a14-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f7445c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa8c62-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74650-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa8d7e-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74650-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa8e84-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74569-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa8f77-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74569-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9074-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','09f74354-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9159-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74354-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa92d7-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74354-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa93ca-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f74354-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa94d0-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74be8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9664-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74be8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9795-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f74be8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa98a2-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74de5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa99a5-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74de5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9a8f-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f74de5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9b84-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74ccc-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9c73-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74ccc-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9d5a-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f74ccc-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fa9ec4-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','09f74afe-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa0ce-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74afe-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa1cd-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74afe-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa2b2-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f74afe-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa3c0-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f7409d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa4b2-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f7409d-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa5a9-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74266-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa686-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74266-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa77a-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f74183-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa852-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f74183-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faa963-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','09f73fb0-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faaa41-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f73fb0-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faacd9-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f73fb0-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faae16-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','09f73fb0-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09faaf24-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f73bac-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fab02d-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f73ec2-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fab126-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f73db6-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fab220-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','09f734e1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fab315-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','09f734e1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL),('09fab40d-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','09f734e1-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:11',NULL);
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
INSERT INTO `task` VALUES ('0aa03b80-12dc-11f0-a733-e8653882e964','0a60c1a7-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','Documentação','Relatório de progresso entregue.',90,189.64,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa0d310-12dc-11f0-a733-e8653882e964','0a60c1a7-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','Reunião técnica','Execução parcial com ajustes previstos.',120,175.98,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa15d6d-12dc-11f0-a733-e8653882e964','0a617aa7-12dc-11f0-a733-e8653882e964','09f2902c-12dc-11f0-a733-e8653882e964','Reunião técnica','Atividade realizada conforme planejamento.',150,215.16,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa1f871-12dc-11f0-a733-e8653882e964','0a617aa7-12dc-11f0-a733-e8653882e964','09f2902c-12dc-11f0-a733-e8653882e964','Análise preliminar','Contribuição significativa para o andamento da atividade.',60,181.77,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa2f4f2-12dc-11f0-a733-e8653882e964','0a63e09f-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','Análise preliminar','Atividade realizada conforme planejamento.',60,415.02,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa3bf31-12dc-11f0-a733-e8653882e964','0a63e09f-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','Reunião técnica','Relatório de progresso entregue.',90,284.71,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa484f6-12dc-11f0-a733-e8653882e964','0a65cb65-12dc-11f0-a733-e8653882e964','09f366b8-12dc-11f0-a733-e8653882e964','Apresentação interna','Tarefa concluída com sucesso.',120,345.27,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa524df-12dc-11f0-a733-e8653882e964','0a65cb65-12dc-11f0-a733-e8653882e964','09f366b8-12dc-11f0-a733-e8653882e964','Desenvolvimento inicial','Alinhamento com equipe técnica.',150,291.72,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa5bd78-12dc-11f0-a733-e8653882e964','0a67171f-12dc-11f0-a733-e8653882e964','09f28764-12dc-11f0-a733-e8653882e964','Apresentação interna','Execução parcial com ajustes previstos.',180,123.50,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa659c8-12dc-11f0-a733-e8653882e964','0a67171f-12dc-11f0-a733-e8653882e964','09f28764-12dc-11f0-a733-e8653882e964','Documentação','Relatório de progresso entregue.',120,295.76,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa6f351-12dc-11f0-a733-e8653882e964','0a67e790-12dc-11f0-a733-e8653882e964','09f28ac1-12dc-11f0-a733-e8653882e964','Análise preliminar','Relatório de progresso entregue.',60,391.37,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa79998-12dc-11f0-a733-e8653882e964','0a67e790-12dc-11f0-a733-e8653882e964','09f28ac1-12dc-11f0-a733-e8653882e964','Análise preliminar','Alinhamento com equipe técnica.',180,471.46,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa8430c-12dc-11f0-a733-e8653882e964','0a689ab8-12dc-11f0-a733-e8653882e964','09f364e1-12dc-11f0-a733-e8653882e964','Coleta de dados','Atividade realizada conforme planejamento.',150,350.58,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa9041e-12dc-11f0-a733-e8653882e964','0a689ab8-12dc-11f0-a733-e8653882e964','09f364e1-12dc-11f0-a733-e8653882e964','Apresentação interna','Contribuição significativa para o andamento da atividade.',90,196.89,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aa9c4b9-12dc-11f0-a733-e8653882e964','0a6a54a1-12dc-11f0-a733-e8653882e964','09f36797-12dc-11f0-a733-e8653882e964','Documentação','Alinhamento com equipe técnica.',120,290.63,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aaa7549-12dc-11f0-a733-e8653882e964','0a6a54a1-12dc-11f0-a733-e8653882e964','09f36797-12dc-11f0-a733-e8653882e964','Apresentação interna','Relatório de progresso entregue.',150,322.52,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aab1d00-12dc-11f0-a733-e8653882e964','0a6afc99-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','Apresentação interna','Contribuição significativa para o andamento da atividade.',150,372.53,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aabbc37-12dc-11f0-a733-e8653882e964','0a6afc99-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','Apresentação interna','Contribuição significativa para o andamento da atividade.',120,487.06,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aac626a-12dc-11f0-a733-e8653882e964','0a6ba857-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','Análise preliminar','Contribuição significativa para o andamento da atividade.',60,239.49,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aacf8f1-12dc-11f0-a733-e8653882e964','0a6ba857-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','Coleta de dados','Alinhamento com equipe técnica.',150,382.16,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aad83bd-12dc-11f0-a733-e8653882e964','0a6df25f-12dc-11f0-a733-e8653882e964','09f418f4-12dc-11f0-a733-e8653882e964','Reunião técnica','Atividade realizada conforme planejamento.',180,124.98,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aae1090-12dc-11f0-a733-e8653882e964','0a6df25f-12dc-11f0-a733-e8653882e964','09f418f4-12dc-11f0-a733-e8653882e964','Apresentação interna','Relatório de progresso entregue.',180,216.12,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aaeb982-12dc-11f0-a733-e8653882e964','0a6e963e-12dc-11f0-a733-e8653882e964','09f414d3-12dc-11f0-a733-e8653882e964','Documentação','Execução parcial com ajustes previstos.',180,118.43,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aaf518d-12dc-11f0-a733-e8653882e964','0a6e963e-12dc-11f0-a733-e8653882e964','09f414d3-12dc-11f0-a733-e8653882e964','Coleta de dados','Atividade realizada conforme planejamento.',180,352.47,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0aafe17b-12dc-11f0-a733-e8653882e964','0a7074e3-12dc-11f0-a733-e8653882e964','09f28d7a-12dc-11f0-a733-e8653882e964','Coleta de dados','Contribuição significativa para o andamento da atividade.',60,496.78,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0ab0772a-12dc-11f0-a733-e8653882e964','0a7074e3-12dc-11f0-a733-e8653882e964','09f28d7a-12dc-11f0-a733-e8653882e964','Documentação','Atividade realizada conforme planejamento.',60,223.03,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0ab12535-12dc-11f0-a733-e8653882e964','0a71846b-12dc-11f0-a733-e8653882e964','09f295f7-12dc-11f0-a733-e8653882e964','Documentação','Alinhamento com equipe técnica.',60,194.76,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0ab1c75d-12dc-11f0-a733-e8653882e964','0a71846b-12dc-11f0-a733-e8653882e964','09f295f7-12dc-11f0-a733-e8653882e964','Documentação','Atividade realizada conforme planejamento.',150,443.31,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab2a4fe-12dc-11f0-a733-e8653882e964','0a72fd9f-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','Desenvolvimento inicial','Atividade realizada conforme planejamento.',180,353.19,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab377d2-12dc-11f0-a733-e8653882e964','0a72fd9f-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','Apresentação interna','Tarefa concluída com sucesso.',150,447.59,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab44036-12dc-11f0-a733-e8653882e964','0a747805-12dc-11f0-a733-e8653882e964','09f292d2-12dc-11f0-a733-e8653882e964','Desenvolvimento inicial','Tarefa concluída com sucesso.',120,230.84,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab53af7-12dc-11f0-a733-e8653882e964','0a747805-12dc-11f0-a733-e8653882e964','09f292d2-12dc-11f0-a733-e8653882e964','Apresentação interna','Relatório de progresso entregue.',180,419.06,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab61f4e-12dc-11f0-a733-e8653882e964','0a7544ad-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','Documentação','Execução parcial com ajustes previstos.',90,341.19,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab6f283-12dc-11f0-a733-e8653882e964','0a760115-12dc-11f0-a733-e8653882e964','09f41ae0-12dc-11f0-a733-e8653882e964','Apresentação interna','Execução parcial com ajustes previstos.',60,311.08,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab7e496-12dc-11f0-a733-e8653882e964','0a76b40e-12dc-11f0-a733-e8653882e964','09f419ef-12dc-11f0-a733-e8653882e964','Coleta de dados','Contribuição significativa para o andamento da atividade.',60,160.40,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab8974b-12dc-11f0-a733-e8653882e964','0a76b40e-12dc-11f0-a733-e8653882e964','09f419ef-12dc-11f0-a733-e8653882e964','Apresentação interna','Relatório de progresso entregue.',120,243.98,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab943b5-12dc-11f0-a733-e8653882e964','0a7789f3-12dc-11f0-a733-e8653882e964','09f3638a-12dc-11f0-a733-e8653882e964','Coleta de dados','Tarefa concluída com sucesso.',120,137.42,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0ab9e4f7-12dc-11f0-a733-e8653882e964','0a7789f3-12dc-11f0-a733-e8653882e964','09f3638a-12dc-11f0-a733-e8653882e964','Análise preliminar','Execução parcial com ajustes previstos.',60,219.84,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0aba7071-12dc-11f0-a733-e8653882e964','0a78725a-12dc-11f0-a733-e8653882e964','09f3686e-12dc-11f0-a733-e8653882e964','Análise preliminar','Contribuição significativa para o andamento da atividade.',120,346.24,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL),('0abb110d-12dc-11f0-a733-e8653882e964','0a78725a-12dc-11f0-a733-e8653882e964','09f3686e-12dc-11f0-a733-e8653882e964','Documentação','Relatório de progresso entregue.',180,333.87,'2025-04-06 08:41:13','2025-04-06 08:41:13',NULL);
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
INSERT INTO `task_document` VALUES ('0ac5e5a6-12dc-11f0-a733-e8653882e964','0aa03b80-12dc-11f0-a733-e8653882e964','0abb9b19-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:13',NULL),('0ac65982-12dc-11f0-a733-e8653882e964','0aa0d310-12dc-11f0-a733-e8653882e964','0abe1b45-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:13',NULL),('0ac6d9ac-12dc-11f0-a733-e8653882e964','0aa2f4f2-12dc-11f0-a733-e8653882e964','0ac07a68-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:13',NULL),('0ac7702d-12dc-11f0-a733-e8653882e964','0aa3bf31-12dc-11f0-a733-e8653882e964','0ac324c5-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:13',NULL);
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
INSERT INTO `team` VALUES ('0a4701da-12dc-11f0-a733-e8653882e964','Alpha','Time formado por usuários com nomes iniciados em A',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a47b6c3-12dc-11f0-a733-e8653882e964','Papa','Time formado por usuários com nomes iniciados em P',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a485d27-12dc-11f0-a733-e8653882e964','Mike','Time formado por usuários com nomes iniciados em M',1,'2025-04-06 08:41:12','2025-04-06 08:41:12',NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_fa_code`
--

DROP TABLE IF EXISTS `two_fa_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_fa_code` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT (uuid()) COMMENT 'UUID do código de verificação gerado',
  `user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID do usuário que solicitou o código de verificação',
  `code_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Hash seguro do código de 6 dígitos enviado ao e-mail',
  `attempts` int DEFAULT '0' COMMENT 'Número de tentativas realizadas com esse código',
  `max_attempts` int DEFAULT '5' COMMENT 'Número máximo de tentativas permitidas',
  `status` enum('pending','verified','denied') COLLATE utf8mb4_general_ci DEFAULT 'pending' COMMENT 'Estado da verificação: pendente, verificado ou negado',
  `expires_at` datetime NOT NULL COMMENT 'Data e hora de expiração do código',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do código',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `two_fa_code_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Armazena códigos de verificação temporários para autenticação em dois fatores via e-mail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_fa_code`
--

LOCK TABLES `two_fa_code` WRITE;
/*!40000 ALTER TABLE `two_fa_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_fa_code` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('09f16560-12dc-11f0-a733-e8653882e964','Joniel Rodrigues','joniel@fapg.org.br','hashed_password_1',1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f17b46-12dc-11f0-a733-e8653882e964','João Silva','joao@fapg.org.br','hashed_password_2',1,1,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f180af-12dc-11f0-a733-e8653882e964','Carlos Santos','carlos@fapg.org.br','hashed_password_3',1,4,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f18404-12dc-11f0-a733-e8653882e964','Caio Vinicius','caio@fapg.org.br','hashed_password_4',1,4,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f27979-12dc-11f0-a733-e8653882e964','Ana Lima','ana@fapg.org.br','hashed_password_5',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f28764-12dc-11f0-a733-e8653882e964','Ângela Teixeira','angela.teixeira@fapg.org.br','hashed_password_6',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f28ac1-12dc-11f0-a733-e8653882e964','Aline Laura Gonçalves','aline.laura.goncalves@fapg.org.br','hashed_password_7',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f28d7a-12dc-11f0-a733-e8653882e964','Amanda Beatriz Nascimento','amanda.beatriz.nascimento@fapg.org.br','hashed_password_8',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f2902c-12dc-11f0-a733-e8653882e964','Adriana Souza','adriana.souza@fapg.org.br','hashed_password_9',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f292d2-12dc-11f0-a733-e8653882e964','Alice Júlia Oliveira','alice.julia.oliveira@fapg.org.br','hashed_password_10',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f295f7-12dc-11f0-a733-e8653882e964','Antônia Silveira','antonia.silveira@fapg.org.br','hashed_password_11',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f3592e-12dc-11f0-a733-e8653882e964','Pedro Rocha','pedro@fapg.org.br','hashed_password_12',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f3638a-12dc-11f0-a733-e8653882e964','Paola Ramos','paola.ramos@fapg.org.br','hashed_password_13',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f364e1-12dc-11f0-a733-e8653882e964','Paulo Alves','paulo.alves@fapg.org.br','hashed_password_14',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f365de-12dc-11f0-a733-e8653882e964','Patrício Peixoto','patricio.peixoto@fapg.org.br','hashed_password_15',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f366b8-12dc-11f0-a733-e8653882e964','Pâmela Pinto','pamela.pinto@fapg.org.br','hashed_password_16',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f36797-12dc-11f0-a733-e8653882e964','Priscila Sales','priscila.sales@fapg.org.br','hashed_password_17',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f3686e-12dc-11f0-a733-e8653882e964','Pietro Viana','pietro.viana@fapg.org.br','hashed_password_18',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f40c57-12dc-11f0-a733-e8653882e964','Maria Oliveira','maria@fapg.org.br','hashed_password_19',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f414d3-12dc-11f0-a733-e8653882e964','Mônica da Paz','monica.da.paz@fapg.org.br','hashed_password_20',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f416d2-12dc-11f0-a733-e8653882e964','Manuela Cecília Teixeira','manuela.cecilia.teixeira@fapg.org.br','hashed_password_21',1,2,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f417f2-12dc-11f0-a733-e8653882e964','Marcelo Peixoto','marcelo.peixoto@fapg.org.br','hashed_password_22',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f418f4-12dc-11f0-a733-e8653882e964','Matheus Nascimento','matheus.nascimento@fapg.org.br','hashed_password_23',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f419ef-12dc-11f0-a733-e8653882e964','Milena Duarte','milena.duarte@fapg.org.br','hashed_password_24',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL),('09f41ae0-12dc-11f0-a733-e8653882e964','Marina Rezende','marina.rezende@fapg.org.br','hashed_password_25',1,3,'2025-04-06 08:41:11','2025-04-06 08:41:11',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_photo`
--

DROP TABLE IF EXISTS `user_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_photo` (
  `user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Referência ao usuário, também usada como chave primária',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nome original do arquivo',
  `mime_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tipo MIME do arquivo (image/png, image/jpeg, etc)',
  `content` mediumblob NOT NULL COMMENT 'Conteúdo binário da imagem (até 16 MB)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do documento',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do documento',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Data de exclusão lógica do documento',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_photo_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Fotos de perfil dos usuários armazenadas no banco de dados, vinculadas diretamente por ID ao usuário';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_photo`
--

LOCK TABLES `user_photo` WRITE;
/*!40000 ALTER TABLE `user_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_photo` ENABLE KEYS */;
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
INSERT INTO `user_project` VALUES ('0a2a07a8-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2abdc4-12dc-11f0-a733-e8653882e964','09f28ac1-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2b7a94-12dc-11f0-a733-e8653882e964','09f2902c-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2c8e49-12dc-11f0-a733-e8653882e964','09f292d2-12dc-11f0-a733-e8653882e964','0a1b364b-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2d43d3-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2e056c-12dc-11f0-a733-e8653882e964','09f364e1-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2ed7c3-12dc-11f0-a733-e8653882e964','09f366b8-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a2f8ce1-12dc-11f0-a733-e8653882e964','09f3686e-12dc-11f0-a733-e8653882e964','0a1bd22a-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3055e1-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a311feb-12dc-11f0-a733-e8653882e964','09f28764-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a31d2d0-12dc-11f0-a733-e8653882e964','09f28d7a-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a328bc4-12dc-11f0-a733-e8653882e964','09f2902c-12dc-11f0-a733-e8653882e964','0a1c615e-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a334aae-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3413de-12dc-11f0-a733-e8653882e964','09f3638a-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a34d0b0-12dc-11f0-a733-e8653882e964','09f3686e-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a359568-12dc-11f0-a733-e8653882e964','09f366b8-12dc-11f0-a733-e8653882e964','0a1d0508-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a365769-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a371d7e-12dc-11f0-a733-e8653882e964','09f416d2-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a37d0ed-12dc-11f0-a733-e8653882e964','09f418f4-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a38925f-12dc-11f0-a733-e8653882e964','09f41ae0-12dc-11f0-a733-e8653882e964','0a1d8562-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3941c2-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a39e764-12dc-11f0-a733-e8653882e964','09f414d3-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3a92bc-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3b6442-12dc-11f0-a733-e8653882e964','09f419ef-12dc-11f0-a733-e8653882e964','0a1e0b37-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3c0952-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3ca3b0-12dc-11f0-a733-e8653882e964','09f28764-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3d42ec-12dc-11f0-a733-e8653882e964','09f292d2-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3de87a-12dc-11f0-a733-e8653882e964','09f295f7-12dc-11f0-a733-e8653882e964','0a1e8b29-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3e8439-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3f1277-12dc-11f0-a733-e8653882e964','09f28ac1-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a3fa869-12dc-11f0-a733-e8653882e964','09f295f7-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a40390d-12dc-11f0-a733-e8653882e964','09f2902c-12dc-11f0-a733-e8653882e964','0a1f1faa-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a40ca44-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a4187b1-12dc-11f0-a733-e8653882e964','09f416d2-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a4249dc-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a4306ff-12dc-11f0-a733-e8653882e964','09f418f4-12dc-11f0-a733-e8653882e964','0a1fd6e6-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a43be14-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','09f84cc8-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a448681-12dc-11f0-a733-e8653882e964','09f3638a-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','09f853ca-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a4538bd-12dc-11f0-a733-e8653882e964','09f36797-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','09f8522c-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL),('0a45e3fc-12dc-11f0-a733-e8653882e964','09f364e1-12dc-11f0-a733-e8653882e964','0a2064f2-12dc-11f0-a733-e8653882e964','09f8547f-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12','2025-04-06 08:41:12',NULL);
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
INSERT INTO `user_team` VALUES ('0a495141-12dc-11f0-a733-e8653882e964','09f27979-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4a0cb2-12dc-11f0-a733-e8653882e964','09f28764-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4ad131-12dc-11f0-a733-e8653882e964','09f28ac1-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4b9eb0-12dc-11f0-a733-e8653882e964','09f28d7a-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4c78bf-12dc-11f0-a733-e8653882e964','09f2902c-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4d23dc-12dc-11f0-a733-e8653882e964','09f292d2-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4dda50-12dc-11f0-a733-e8653882e964','09f295f7-12dc-11f0-a733-e8653882e964','0a4701da-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4e86d7-12dc-11f0-a733-e8653882e964','09f3592e-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a4f4a1b-12dc-11f0-a733-e8653882e964','09f3638a-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a501253-12dc-11f0-a733-e8653882e964','09f364e1-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a50da59-12dc-11f0-a733-e8653882e964','09f365de-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a51b2fb-12dc-11f0-a733-e8653882e964','09f366b8-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a527aa4-12dc-11f0-a733-e8653882e964','09f36797-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a531cd5-12dc-11f0-a733-e8653882e964','09f3686e-12dc-11f0-a733-e8653882e964','0a47b6c3-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a53c3f4-12dc-11f0-a733-e8653882e964','09f40c57-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a546a69-12dc-11f0-a733-e8653882e964','09f414d3-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a5541d7-12dc-11f0-a733-e8653882e964','09f416d2-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a55f9b5-12dc-11f0-a733-e8653882e964','09f417f2-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a56a15f-12dc-11f0-a733-e8653882e964','09f418f4-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a574d0c-12dc-11f0-a733-e8653882e964','09f419ef-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL),('0a58057f-12dc-11f0-a733-e8653882e964','09f41ae0-12dc-11f0-a733-e8653882e964','0a485d27-12dc-11f0-a733-e8653882e964','2025-04-06 08:41:12',NULL);
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

-- Dump completed on 2025-04-06  8:44:57
