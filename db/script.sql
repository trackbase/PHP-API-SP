CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;
-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `tblcatalumnos`
--

DROP TABLE IF EXISTS `tblcatalumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcatalumnos` (
  `intAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `strMatricula` text NOT NULL,
  `strNombreCompleto` text NOT NULL,
  `datFechaNacimiento` date NOT NULL,
  `strGenero` varchar(1) NOT NULL,
  `intGradoAlumno` int(11) NOT NULL,
  `intEstatusAlumno` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`intAlumno`),
  KEY `intGradoAlumno` (`intGradoAlumno`),
  KEY `intEstatusAlumno` (`intEstatusAlumno`),
  KEY `strGenero` (`strGenero`),
  CONSTRAINT `tblcatalumnos_ibfk_1` FOREIGN KEY (`intGradoAlumno`) REFERENCES `tblcatgradoalumno` (`intGradoAlumno`),
  CONSTRAINT `tblcatalumnos_ibfk_2` FOREIGN KEY (`intEstatusAlumno`) REFERENCES `tblcatestatusalumno` (`intEstatusAlumno`),
  CONSTRAINT `tblcatalumnos_ibfk_3` FOREIGN KEY (`strGenero`) REFERENCES `tblcatgenero` (`strGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcatalumnos`
--

LOCK TABLES `tblcatalumnos` WRITE;
/*!40000 ALTER TABLE `tblcatalumnos` DISABLE KEYS */;
INSERT INTO `tblcatalumnos` VALUES (1,'A1','Jorge Ávila Gaxiola','1996-04-06','M',1,1),(2,'A2','Luis Pérez López','2000-01-01','M',2,1),(3,'A101','María Peña Nieto','1991-08-06','F',3,0),(4,'B304','Felipe Ramos González','1998-12-08','M',1,1),(5,'B7','Gabriela Reséndiz Guerra','2002-02-21','F',2,1),(6,'C09','Fátima Trejo Martínez','2001-08-09','F',3,1),(7,'C56','Mario Loya Huerta','2003-05-04','O',3,1),(8,'A56','Cristian Guerra Puerta','1995-08-09','M',3,1),(9,'C45','Alexis Martínez Hinojosa','2000-12-31','M',3,0),(10,'B678','Lizbeth Pineda Herrera','1998-05-07','F',2,1),(11,'B91','Iván Zapata Gutiérrez','1989-06-15','M',2,0);
/*!40000 ALTER TABLE `tblcatalumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcatestatusalumno`
--

DROP TABLE IF EXISTS `tblcatestatusalumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcatestatusalumno` (
  `intEstatusAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `strEstatusAlumno` varchar(80) NOT NULL,
  PRIMARY KEY (`intEstatusAlumno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcatestatusalumno`
--

LOCK TABLES `tblcatestatusalumno` WRITE;
/*!40000 ALTER TABLE `tblcatestatusalumno` DISABLE KEYS */;
INSERT INTO `tblcatestatusalumno` VALUES (0,'Baja'),(1,'Activo');
/*!40000 ALTER TABLE `tblcatestatusalumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcatgenero`
--

DROP TABLE IF EXISTS `tblcatgenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcatgenero` (
  `strGenero` varchar(1) NOT NULL,
  `strIdentidadSexual` text NOT NULL,
  PRIMARY KEY (`strGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcatgenero`
--

LOCK TABLES `tblcatgenero` WRITE;
/*!40000 ALTER TABLE `tblcatgenero` DISABLE KEYS */;
INSERT INTO `tblcatgenero` VALUES ('F','Femenino'),('M','Masculino'),('O','Otro');
/*!40000 ALTER TABLE `tblcatgenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcatgradoalumno`
--

DROP TABLE IF EXISTS `tblcatgradoalumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcatgradoalumno` (
  `intGradoAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `strGradoAlumno` varchar(255) NOT NULL,
  PRIMARY KEY (`intGradoAlumno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcatgradoalumno`
--

LOCK TABLES `tblcatgradoalumno` WRITE;
/*!40000 ALTER TABLE `tblcatgradoalumno` DISABLE KEYS */;
INSERT INTO `tblcatgradoalumno` VALUES (1,'Primero'),(2,'Segundo'),(3,'Tercero');
/*!40000 ALTER TABLE `tblcatgradoalumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test'
--

--
-- Dumping routines for database 'test'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarAlumno`(
var_Alumno int(11),
var_Matricula TEXT,
var_NombreCompleto TEXT,
var_FechaNacimiento DATE,
var_Genero varchar(1),
var_GradoAlumno int(11),
var_EstatusAlumno int(11)
)
BEGIN
UPDATE tblcatalumnos
SET
strMatricula = var_Matricula,
strNombreCompleto = var_NombreCompleto,
datFechaNacimiento = var_FechaNacimiento,
strGenero = var_Genero,
intGradoAlumno = var_GradoAlumno,
intEstatusAlumno = var_EstatusAlumno
WHERE intAlumno = var_Alumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_borrarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_borrarAlumno`(
var_Alumno int(11)
)
BEGIN
DELETE FROM tblcatalumnos WHERE intAlumno = var_Alumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crearAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crearAlumno`(
var_Matricula TEXT,
var_NombreCompleto TEXT,
var_FechaNacimiento DATE,
var_Genero varchar(1),
var_GradoAlumno int(11)
)
BEGIN
INSERT INTO tblcatalumnos
(strMatricula,
strNombreCompleto,
datFechaNacimiento,
strGenero,
intGradoAlumno)
VALUES
(var_Matricula,
var_NombreCompleto,
var_FechaNacimiento,
var_Genero,
var_GradoAlumno);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerAlumno`(
var_Alumno int(11)
)
BEGIN
SELECT * FROM tblcatalumnos WHERE intAlumno = var_Alumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerAlumnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerAlumnos`(
var_GradoAlumno TEXT,
var_EstatusAlumno TEXT
)
BEGIN
SET lc_time_names = 'es_MX';
set @strConsulta = 'SELECT 
	t1.*, DATE_FORMAT(t1.datFechaNacimiento, "%d-%b-%Y") datFechaNacimiento, t2.strGradoAlumno, t3.strEstatusAlumno, t4.strIdentidadSexual
FROM
	tblcatalumnos t1
		JOIN
	tblcatgradoalumno t2 ON t1.intGradoAlumno = t2.intGradoAlumno
		JOIN
	tblcatestatusalumno t3 ON t1.intEstatusAlumno = t3.intEstatusAlumno
		JOIN
	tblcatgenero t4 ON t1.strGenero = t4.strGenero
WHERE
	1 = 1';
IF var_GradoAlumno != '' THEN
	SET @strConsulta = CONCAT(@strConsulta,' AND t1.intGradoAlumno = ',var_GradoAlumno);
END IF;
IF var_EstatusAlumno != '' THEN
	SET @strConsulta = CONCAT(@strConsulta,' AND t1.intEstatusAlumno = ',var_EstatusAlumno);
END IF;
SET @strConsulta = CONCAT(@strConsulta,' ORDER BY 1 DESC;');
PREPARE stmt FROM @strConsulta;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerEstatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerEstatus`()
BEGIN
SELECT * FROM tblcatestatusalumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerGeneros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerGeneros`()
BEGIN
SELECT * FROM tblcatgenero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerGrados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerGrados`()
BEGIN
SELECT * FROM tblcatgradoalumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerTotales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerTotales`(
var_GradoAlumno TEXT,
var_EstatusAlumno TEXT
)
BEGIN
set @strConsulta = 'SELECT 
	t2.strGradoAlumno, t3.strEstatusAlumno, COUNT(*) Total
FROM
	tblcatalumnos t1
		JOIN
	tblcatgradoalumno t2 ON t1.intGradoAlumno = t2.intGradoAlumno
		JOIN
	tblcatestatusalumno t3 ON t1.intEstatusAlumno = t3.intEstatusAlumno
WHERE
	1 = 1';
IF var_GradoAlumno != '' THEN
	SET @strConsulta = CONCAT(@strConsulta,' AND t1.intGradoAlumno = ',var_GradoAlumno);
END IF;
IF var_EstatusAlumno != '' THEN
	SET @strConsulta = CONCAT(@strConsulta,' AND t1.intEstatusAlumno = ',var_EstatusAlumno);
END IF;
SET @strConsulta = CONCAT(@strConsulta,' GROUP BY t1.intGradoAlumno , t1.intEstatusAlumno;');
PREPARE stmt FROM @strConsulta;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
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

-- Dump completed on 2021-05-28 20:15:06
