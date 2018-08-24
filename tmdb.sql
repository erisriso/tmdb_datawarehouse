/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.6.26 : Database - db_movie
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_movie` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_movie`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `title` varchar(256) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `dodol` */

DROP TABLE IF EXISTS `dodol`;

CREATE TABLE `dodol` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `info` text,
  `age` tinyint(3) unsigned DEFAULT '30',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `budget` varchar(256) DEFAULT NULL,
  `genres` varchar(256) DEFAULT NULL,
  `homepage` varchar(256) DEFAULT NULL,
  `id` varchar(256) DEFAULT NULL,
  `keywords` varchar(256) DEFAULT NULL,
  `original_language` varchar(256) DEFAULT NULL,
  `original_title` varchar(256) DEFAULT NULL,
  `overview` text,
  `popularity` varchar(256) DEFAULT NULL,
  `production_companies` varchar(256) DEFAULT NULL,
  `production_countries` varchar(256) DEFAULT NULL,
  `release_date` varchar(256) DEFAULT NULL,
  `revenue` varchar(256) DEFAULT NULL,
  `runtime` varchar(256) DEFAULT NULL,
  `spoken_languages` varchar(256) DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `tagline` varchar(256) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `vote_average` varchar(256) DEFAULT NULL,
  `vote_count` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimartis` */

DROP TABLE IF EXISTS `sma_tbl_dimartis`;

CREATE TABLE `sma_tbl_dimartis` (
  `id_artis` int(11) NOT NULL,
  `nama_artis` varchar(150) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_artis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimbahasa` */

DROP TABLE IF EXISTS `sma_tbl_dimbahasa`;

CREATE TABLE `sma_tbl_dimbahasa` (
  `id_bahasa` varchar(5) NOT NULL,
  `nama_bahasa` varbinary(15) DEFAULT NULL,
  PRIMARY KEY (`id_bahasa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimcompanies` */

DROP TABLE IF EXISTS `sma_tbl_dimcompanies`;

CREATE TABLE `sma_tbl_dimcompanies` (
  `id_companies` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `negara` varchar(15) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_companies`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimgenre` */

DROP TABLE IF EXISTS `sma_tbl_dimgenre`;

CREATE TABLE `sma_tbl_dimgenre` (
  `id_genre` int(11) NOT NULL,
  `nama_genre` varchar(25) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimjob` */

DROP TABLE IF EXISTS `sma_tbl_dimjob`;

CREATE TABLE `sma_tbl_dimjob` (
  `id_job` int(11) NOT NULL,
  `nama_job` varchar(100) NOT NULL,
  PRIMARY KEY (`id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimnegara` */

DROP TABLE IF EXISTS `sma_tbl_dimnegara`;

CREATE TABLE `sma_tbl_dimnegara` (
  `id_negara` varchar(5) NOT NULL,
  `nama_negara` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_negara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimperson` */

DROP TABLE IF EXISTS `sma_tbl_dimperson`;

CREATE TABLE `sma_tbl_dimperson` (
  `id_person` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `biography` text,
  `popularity` float DEFAULT NULL,
  `pob` varchar(100) DEFAULT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `homepage` varbinary(200) DEFAULT NULL,
  PRIMARY KEY (`id_person`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_dimwaktu` */

DROP TABLE IF EXISTS `sma_tbl_dimwaktu`;

CREATE TABLE `sma_tbl_dimwaktu` (
  `id_waktu` varchar(12) NOT NULL,
  `tanggal` varchar(2) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl_lengkap` date NOT NULL,
  PRIMARY KEY (`id_waktu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_fact_film` */

DROP TABLE IF EXISTS `sma_tbl_fact_film`;

CREATE TABLE `sma_tbl_fact_film` (
  `id_film` int(11) DEFAULT NULL,
  `judul_film` varchar(250) NOT NULL,
  `overview` text,
  `poster` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `popularity` float DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `tagline` varchar(256) DEFAULT NULL,
  `vote_average` float DEFAULT NULL,
  `vote_count` int(11) DEFAULT NULL,
  `id_genre` int(11) DEFAULT NULL,
  `id_bahasa` varchar(5) DEFAULT NULL,
  `id_waktu` varchar(12) DEFAULT NULL,
  `id_negara` varchar(5) DEFAULT NULL,
  `id_person` int(11) DEFAULT NULL,
  `id_company` int(11) DEFAULT NULL,
  `review` text,
  `budget` float DEFAULT NULL,
  KEY `fk_genre` (`id_genre`),
  KEY `fk_company` (`id_company`),
  KEY `fk_person` (`id_person`),
  KEY `fk_negara` (`id_negara`),
  KEY `fk_bahasa` (`id_bahasa`),
  KEY `fk_waktu` (`id_waktu`),
  CONSTRAINT `fk_company1` FOREIGN KEY (`id_company`) REFERENCES `sma_tbl_dimcompanies` (`id_companies`),
  CONSTRAINT `fk_genre1` FOREIGN KEY (`id_genre`) REFERENCES `sma_tbl_dimgenre` (`id_genre`),
  CONSTRAINT `fk_negara1` FOREIGN KEY (`id_negara`) REFERENCES `sma_tbl_dimnegara` (`id_negara`),
  CONSTRAINT `fk_person1` FOREIGN KEY (`id_person`) REFERENCES `sma_tbl_dimperson` (`id_person`),
  CONSTRAINT `fk_waktu1` FOREIGN KEY (`id_waktu`) REFERENCES `sma_tbl_dimwaktu` (`id_waktu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_fact_film1` */

DROP TABLE IF EXISTS `sma_tbl_fact_film1`;

CREATE TABLE `sma_tbl_fact_film1` (
  `id_film` int(11) DEFAULT NULL,
  `judul_film` varchar(250) NOT NULL,
  `overview` text,
  `poster` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `popularity` float DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `tagline` varchar(256) DEFAULT NULL,
  `vote_average` float DEFAULT NULL,
  `vote_count` int(11) DEFAULT NULL,
  `id_genre` int(11) DEFAULT NULL,
  `id_bahasa` varchar(5) DEFAULT NULL,
  `id_waktu` varchar(12) DEFAULT NULL,
  `id_negara` varchar(5) DEFAULT NULL,
  `id_person` int(11) DEFAULT NULL,
  `id_company` int(11) DEFAULT NULL,
  `review` text,
  `budget` float DEFAULT NULL,
  KEY `fk_genre` (`id_genre`),
  KEY `fk_company` (`id_company`),
  KEY `fk_person` (`id_person`),
  KEY `fk_negara` (`id_negara`),
  KEY `fk_bahasa` (`id_bahasa`),
  KEY `fk_waktu` (`id_waktu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sma_tbl_factreview` */

DROP TABLE IF EXISTS `sma_tbl_factreview`;

CREATE TABLE `sma_tbl_factreview` (
  `id_review` int(11) NOT NULL,
  `id_film` int(11) NOT NULL COMMENT 'relasi ke tb_film',
  `author` varchar(50) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id_review`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimartis` */

DROP TABLE IF EXISTS `tbl_dimartis`;

CREATE TABLE `tbl_dimartis` (
  `id_artis` int(11) NOT NULL,
  `nama_artis` varchar(150) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_artis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimbahasa` */

DROP TABLE IF EXISTS `tbl_dimbahasa`;

CREATE TABLE `tbl_dimbahasa` (
  `id_bahasa` varchar(5) NOT NULL,
  `nama_bahasa` varbinary(15) DEFAULT NULL,
  PRIMARY KEY (`id_bahasa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimcompanies` */

DROP TABLE IF EXISTS `tbl_dimcompanies`;

CREATE TABLE `tbl_dimcompanies` (
  `id_companies` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `negara` varchar(15) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_companies`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimgenre` */

DROP TABLE IF EXISTS `tbl_dimgenre`;

CREATE TABLE `tbl_dimgenre` (
  `id_genre` int(11) NOT NULL,
  `nama_genre` varchar(25) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimjob` */

DROP TABLE IF EXISTS `tbl_dimjob`;

CREATE TABLE `tbl_dimjob` (
  `id_job` int(11) NOT NULL,
  `nama_job` varchar(100) NOT NULL,
  PRIMARY KEY (`id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimnegara` */

DROP TABLE IF EXISTS `tbl_dimnegara`;

CREATE TABLE `tbl_dimnegara` (
  `id_negara` varchar(5) NOT NULL,
  `nama_negara` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_negara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimperson` */

DROP TABLE IF EXISTS `tbl_dimperson`;

CREATE TABLE `tbl_dimperson` (
  `id_person` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `biography` text,
  `popularity` float DEFAULT NULL,
  `pob` varchar(100) DEFAULT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `homepage` varbinary(200) DEFAULT NULL,
  PRIMARY KEY (`id_person`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_dimwaktu` */

DROP TABLE IF EXISTS `tbl_dimwaktu`;

CREATE TABLE `tbl_dimwaktu` (
  `id_waktu` varchar(12) NOT NULL,
  `tanggal` varchar(2) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl_lengkap` date NOT NULL,
  PRIMARY KEY (`id_waktu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_fact_film` */

DROP TABLE IF EXISTS `tbl_fact_film`;

CREATE TABLE `tbl_fact_film` (
  `id_film` int(11) DEFAULT NULL,
  `judul_film` varchar(250) NOT NULL,
  `overview` text,
  `poster` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `popularity` float DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `tagline` varchar(256) DEFAULT NULL,
  `vote_average` float DEFAULT NULL,
  `vote_count` int(11) DEFAULT NULL,
  `id_genre` int(11) DEFAULT NULL,
  `id_bahasa` varchar(5) DEFAULT NULL,
  `id_waktu` varchar(12) DEFAULT NULL,
  `id_negara` varchar(5) DEFAULT NULL,
  `id_person` int(11) DEFAULT NULL,
  `id_company` int(11) DEFAULT NULL,
  `review` text,
  `budget` float DEFAULT NULL,
  KEY `fk_genre` (`id_genre`),
  KEY `fk_company` (`id_company`),
  KEY `fk_person` (`id_person`),
  KEY `fk_negara` (`id_negara`),
  KEY `fk_bahasa` (`id_bahasa`),
  KEY `fk_waktu` (`id_waktu`),
  CONSTRAINT `fk_company` FOREIGN KEY (`id_company`) REFERENCES `tbl_dimcompanies` (`id_companies`),
  CONSTRAINT `fk_genre` FOREIGN KEY (`id_genre`) REFERENCES `tbl_dimgenre` (`id_genre`),
  CONSTRAINT `fk_negara` FOREIGN KEY (`id_negara`) REFERENCES `tbl_dimnegara` (`id_negara`),
  CONSTRAINT `fk_person` FOREIGN KEY (`id_person`) REFERENCES `tbl_dimperson` (`id_person`),
  CONSTRAINT `fk_waktu` FOREIGN KEY (`id_waktu`) REFERENCES `tbl_dimwaktu` (`id_waktu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_factreview` */

DROP TABLE IF EXISTS `tbl_factreview`;

CREATE TABLE `tbl_factreview` (
  `id_review` int(11) NOT NULL,
  `id_film` int(11) NOT NULL COMMENT 'relasi ke tb_film',
  `author` varchar(50) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id_review`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_items` */

DROP TABLE IF EXISTS `tbl_items`;

CREATE TABLE `tbl_items` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemHeader` varchar(512) NOT NULL COMMENT 'Heading',
  `itemSub` varchar(1021) NOT NULL COMMENT 'sub heading',
  `itemDesc` text COMMENT 'content or description',
  `itemImage` varchar(80) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_reset_password` */

DROP TABLE IF EXISTS `tbl_reset_password`;

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_roles` */

DROP TABLE IF EXISTS `tbl_roles`;

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text',
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_users` */

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
