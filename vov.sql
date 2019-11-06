-- MySqlBackup.NET 2.3.1
-- Dump Time: 2019-11-05 15:24:20
-- --------------------------------------
-- Server version 5.5.28 MySQL Community Server (GPL)


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of meta_computer_type
-- 

DROP TABLE IF EXISTS `meta_computer_type`;
CREATE TABLE IF NOT EXISTS `meta_computer_type` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table meta_computer_type
-- 

/*!40000 ALTER TABLE `meta_computer_type` DISABLE KEYS */;
INSERT INTO `meta_computer_type`(`id`,`type_name`) VALUES
(-1,'Не задан'),
(1,'Стационарный компьютер'),
(2,'Моноблок'),
(3,'Ноутбук');
/*!40000 ALTER TABLE `meta_computer_type` ENABLE KEYS */;

-- 
-- Definition of meta_log_object
-- 

DROP TABLE IF EXISTS `meta_log_object`;
CREATE TABLE IF NOT EXISTS `meta_log_object` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table meta_log_object
-- 

/*!40000 ALTER TABLE `meta_log_object` DISABLE KEYS */;
INSERT INTO `meta_log_object`(`id`,`type`) VALUES
(1,'Пользователь'),
(2,'Компьютер'),
(3,'Запчасти'),
(4,'Кабинет');
/*!40000 ALTER TABLE `meta_log_object` ENABLE KEYS */;

-- 
-- Definition of journal
-- 

DROP TABLE IF EXISTS `journal`;
CREATE TABLE IF NOT EXISTS `journal` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `log_type` int(32) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_ibfk_1` (`log_type`),
  CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`log_type`) REFERENCES `meta_log_object` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table journal
-- 

/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal`(`id`,`log_type`,`date_time`,`info`) VALUES
(8,2,'2019-10-28 03:00:11','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(9,2,'2019-10-28 03:01:35','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(10,2,'2019-10-28 03:23:42','inserted Новый компьютер with ID = 0'),
(11,2,'2019-10-28 03:34:05','inserted Новый компьютер with ID = 0'),
(12,2,'2019-10-29 04:24:22','inserted Новый компьютер with ID = 0'),
(13,2,'2019-10-29 04:24:22','inserted Новый компьютер with ID = 0'),
(14,2,'2019-10-29 04:24:23','inserted Новый компьютер with ID = 0'),
(15,2,'2019-10-29 04:24:50','inserted Новый компьютер with ID = 0'),
(16,2,'2019-10-29 04:24:51','inserted Новый компьютер with ID = 0'),
(17,2,'2019-10-29 04:24:52','inserted Новый компьютер with ID = 0'),
(18,2,'2019-10-29 04:24:52','inserted Новый компьютер with ID = 0'),
(19,2,'2019-10-29 04:24:53','inserted Новый компьютер with ID = 0'),
(20,2,'2019-10-29 04:24:55','inserted Новый компьютер with ID = 0'),
(21,2,'2019-10-29 04:24:56','inserted Новый компьютер with ID = 0'),
(22,2,'2019-10-29 04:24:57','inserted Новый компьютер with ID = 0'),
(23,2,'2019-10-29 04:24:58','inserted Новый компьютер with ID = 0'),
(24,2,'2019-10-31 00:16:49','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(25,2,'2019-10-31 00:16:49','updated computer from asd to asd with ID = 2'),
(26,2,'2019-10-31 00:16:49','updated computer from asd1 to asd1 with ID = 3'),
(27,2,'2019-10-31 00:16:49','updated computer from asd1 to asd1 with ID = 4'),
(28,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(29,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Test with ID = 7'),
(30,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(31,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(32,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(33,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(34,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 12'),
(35,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(36,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(37,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(38,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(39,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(40,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(41,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 19'),
(42,2,'2019-10-31 00:17:09','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(43,2,'2019-10-31 00:17:09','updated computer from asd to asd with ID = 2'),
(44,2,'2019-10-31 00:17:09','updated computer from asd1 to asd1 with ID = 3'),
(45,2,'2019-10-31 00:17:09','updated computer from asd1 to asd1 with ID = 4'),
(46,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(47,2,'2019-10-31 00:17:09','updated computer from Test to Test with ID = 7'),
(48,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(49,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(50,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(51,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(52,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to heelppp with ID = 12'),
(53,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(54,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(55,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(56,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(57,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(58,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(59,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 19'),
(60,2,'2019-10-31 00:25:41','updated computer from Новый компьютер to МЕГАКАМПУКТЕР with ID = 19'),
(62,2,'2019-10-31 00:32:40','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(63,2,'2019-10-31 00:39:18','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(64,2,'2019-10-31 00:39:18','updated computer from asd to asd with ID = 2'),
(65,2,'2019-10-31 00:39:18','updated computer from asd1 to asd1 with ID = 3'),
(66,2,'2019-10-31 00:39:18','updated computer from asd1 to asd1 with ID = 4'),
(67,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(68,2,'2019-10-31 00:39:18','updated computer from Test to Test with ID = 7'),
(69,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(70,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(71,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(72,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(73,2,'2019-10-31 00:39:18','updated computer from heelppp to heelppp with ID = 12'),
(74,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(75,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(76,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(77,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(78,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(79,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(80,2,'2019-10-31 00:39:18','updated computer from МЕГАКАМПУКТЕР to МЕГАКАМПУКТЕР with ID = 19'),
(81,2,'2019-10-31 00:40:01','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(82,2,'2019-10-31 00:40:01','updated computer from asd to asd with ID = 2'),
(83,2,'2019-10-31 00:40:01','updated computer from asd1 to asd1 with ID = 3'),
(84,2,'2019-10-31 00:40:01','updated computer from asd1 to asd1 with ID = 4'),
(85,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(86,2,'2019-10-31 00:40:01','updated computer from Test to Test with ID = 7'),
(87,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(88,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(89,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(90,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(91,2,'2019-10-31 00:40:01','updated computer from heelppp to heelppp with ID = 12'),
(92,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(93,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(94,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(95,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(96,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(97,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(98,2,'2019-10-31 00:40:01','updated computer from МЕГАКАМПУКТЕР to МЕГАКАМПУКТЕР with ID = 19'),
(103,2,'2019-10-31 01:40:04','deleted asd1 with ID = 4'),
(104,2,'2019-10-31 01:40:07','deleted МЕГАКАМПУКТЕР with ID = 19'),
(105,2,'2019-10-31 01:40:31','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(106,2,'2019-10-31 01:40:31','updated computer from asd to asd with ID = 2'),
(107,2,'2019-10-31 01:40:31','updated computer from asd1 to asd1 with ID = 3'),
(108,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(109,2,'2019-10-31 01:40:31','updated computer from Test to Test with ID = 7'),
(110,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(111,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(112,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(113,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(114,2,'2019-10-31 01:40:31','updated computer from heelppp to heelppp with ID = 12'),
(115,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(116,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(117,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(118,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(119,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(120,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(121,3,'2019-10-31 01:47:48','updated from Диал-ап из 80-х to Диал-ап из 80-х with ID = 1'),
(122,2,'2019-10-31 01:47:48','deleted СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),
(123,2,'2019-10-31 01:47:54','updated computer from asd to asd with ID = 2'),
(124,2,'2019-10-31 01:47:54','updated computer from asd1 to asd1 with ID = 3'),
(125,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(126,2,'2019-10-31 01:47:54','updated computer from Test to Test with ID = 7'),
(127,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(128,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(129,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(130,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(131,2,'2019-10-31 01:47:54','updated computer from heelppp to heelppp with ID = 12'),
(132,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(133,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(134,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(135,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(136,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(137,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(138,2,'2019-10-31 01:47:56','updated computer from asd to asd with ID = 2'),
(139,2,'2019-10-31 01:47:56','updated computer from asd1 to asd1 with ID = 3'),
(140,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(141,2,'2019-10-31 01:47:56','updated computer from Test to Test with ID = 7'),
(142,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(143,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(144,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(145,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(146,2,'2019-10-31 01:47:56','updated computer from heelppp to heelppp with ID = 12'),
(147,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(148,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(149,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(150,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(151,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(152,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(153,2,'2019-10-31 01:47:56','updated computer from asd to asd with ID = 2'),
(154,2,'2019-10-31 01:47:56','updated computer from asd1 to asd1 with ID = 3'),
(155,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(156,2,'2019-10-31 01:47:56','updated computer from Test to Test with ID = 7'),
(157,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(158,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(159,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(160,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(161,2,'2019-10-31 01:47:56','updated computer from heelppp to heelppp with ID = 12'),
(162,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(163,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(164,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(165,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(166,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(167,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(168,3,'2019-10-31 01:49:21','updated from Диал-ап из 80-х to Диал-ап из 80-х with ID = 1'),
(169,2,'2019-10-31 01:49:48','updated computer from asd to asdd with ID = 2'),
(170,2,'2019-10-31 01:49:48','updated computer from asd1 to asd1 with ID = 3'),
(171,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(172,2,'2019-10-31 01:49:48','updated computer from Test to Test with ID = 7'),
(173,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(174,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(175,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(176,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(177,2,'2019-10-31 01:49:48','updated computer from heelppp to heelppp with ID = 12'),
(178,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(179,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(180,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(181,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(182,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(183,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(184,2,'2019-10-31 01:51:50','updated computer from asdd to asddf with ID = 2'),
(185,2,'2019-10-31 01:51:50','updated computer from asd1 to asd1 with ID = 3'),
(186,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 6'),
(187,2,'2019-10-31 01:51:50','updated computer from Test to Test with ID = 7'),
(188,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(189,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(190,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(191,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(192,2,'2019-10-31 01:51:50','updated computer from heelppp to heelppp with ID = 12'),
(193,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(194,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(195,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(196,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(197,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(198,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(199,2,'2019-10-31 04:18:21','updated computer from asddf to asddf with ID = 2'),
(200,2,'2019-10-31 04:18:21','updated computer from asd1 to asd1 with ID = 3'),
(201,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to GLADOS with ID = 6'),
(202,2,'2019-10-31 04:18:21','updated computer from Test to Test with ID = 7'),
(203,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(204,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(205,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(206,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(207,2,'2019-10-31 04:18:21','updated computer from heelppp to heelppp with ID = 12'),
(208,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(209,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(210,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(211,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(212,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(213,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 18'),
(214,2,'2019-10-31 04:30:20','updated computer from GLaDOS to Whitley with ID = 6'),
(215,2,'2019-11-01 01:14:15','inserted Новый компьютер with ID = 0'),
(216,1,'2019-11-01 01:25:02','inserted Имя Фамилия with ID = 0'),
(217,4,'2019-11-01 01:25:04','inserted Новая комната with ID = 0'),
(218,2,'2019-11-01 01:40:07','updated computer from Новый компьютер to '' select * from users; -- with ID = 20'),
(219,2,'2019-11-01 02:04:58','updated computer from '' select * from users; -- to UPDATE with ID = 20'),
(220,2,'2019-11-01 02:12:01','updated computer from UPDATE to HEKO with ID = 20'),
(230,3,'2019-11-01 02:38:21','inserted Перчатка Хакермена with ID = 0'),
(231,3,'2019-11-01 02:42:53','inserted VVVVVV with ID = 0'),
(233,2,'2019-11-01 02:55:01','inserted default computer with ID = 0'),
(234,4,'2019-11-01 02:55:50','inserted Без комнаты with ID = -1'),
(235,2,'2019-11-01 02:56:18','updated computer from default computer to Без компьютера with ID = -1'),
(236,3,'2019-11-01 02:57:43','inserted Новый компонент with ID = 0'),
(237,2,'2019-11-01 02:59:27','updated computer from HEKO to y with ID = 20'),
(238,2,'2019-11-01 03:06:46','updated computer from y to GGG with ID = 20'),
(239,2,'2019-11-01 03:09:13','updated computer from GGG to GGWP with ID = 20'),
(240,3,'2019-11-01 03:10:14','updated from Новый компонент to Старый компонент with ID = 14'),
(241,2,'2019-11-01 03:13:50','deleted GGWP with ID = 20'),
(242,1,'2019-11-01 03:19:26','inserted Имя Фамилия with ID = 0'),
(243,4,'2019-11-01 03:58:22','inserted Новая комната with ID = 0'),
(244,4,'2019-11-01 03:58:26','inserted Новая комната with ID = 0'),
(245,4,'2019-11-01 03:58:57','updated from Новая комната to Кладовая with ID = 2'),
(246,4,'2019-11-01 03:59:08','updated from Новая комната to Серверная with ID = 3'),
(247,4,'2019-11-01 03:59:32','updated from Новая комната to Злые бухгалтеры with ID = 4'),
(248,4,'2019-11-01 04:08:42','updated from Буфет to Хавалка with ID = 1'),
(249,2,'2019-11-01 04:33:41','deleted Новый компьютер with ID = 18'),
(250,3,'2019-11-01 04:33:44','deleted Старый компонент with ID = 14'),
(251,1,'2019-11-01 04:33:48','deleted Имя Фамилия with ID = 3'),
(252,1,'2019-11-01 04:33:50','inserted Имя Фамилия with ID = 0'),
(253,1,'2019-11-01 04:33:52','deleted Имя Фамилия with ID = 4'),
(254,1,'2019-11-05 04:37:32','updated from Томас Андерсон to Томас Андерсон with ID = 1'),
(255,2,'2019-11-05 04:37:59','inserted Новый компьютер with ID = 0'),
(256,3,'2019-11-05 04:38:01','inserted Новый компонент with ID = 0'),
(257,1,'2019-11-05 04:38:04','inserted Имя Фамилия with ID = 0'),
(258,4,'2019-11-05 04:38:06','inserted Новая комната with ID = 0'),
(259,2,'2019-11-05 04:55:41','updated computer from Без компьютера to Без компьютера with ID = -1'),
(260,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 8'),
(261,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 9'),
(262,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 10'),
(263,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 11'),
(264,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 13'),
(265,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 14'),
(266,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 15'),
(267,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 16'),
(268,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 17'),
(269,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 18');
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;

-- 
-- Definition of meta_status
-- 

DROP TABLE IF EXISTS `meta_status`;
CREATE TABLE IF NOT EXISTS `meta_status` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table meta_status
-- 

/*!40000 ALTER TABLE `meta_status` DISABLE KEYS */;
INSERT INTO `meta_status`(`id`,`status_name`) VALUES
(-1,'Неизвестно'),
(1,'Работает'),
(2,'Сломан'),
(3,'На ремонте'),
(4,'Отремонтирован'),
(5,'Списан');
/*!40000 ALTER TABLE `meta_status` ENABLE KEYS */;

-- 
-- Definition of components
-- 

DROP TABLE IF EXISTS `components`;
CREATE TABLE IF NOT EXISTS `components` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(50) NOT NULL,
  `component_price` decimal(32,2) NOT NULL,
  `computer_id` int(32) DEFAULT NULL,
  `status` int(32) NOT NULL,
  `serial_number` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computer_id` (`computer_id`) USING BTREE,
  KEY `status` (`status`),
  CONSTRAINT `components_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`id`),
  CONSTRAINT `components_ibfk_2` FOREIGN KEY (`status`) REFERENCES `meta_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table components
-- 

/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components`(`id`,`component_name`,`component_price`,`computer_id`,`status`,`serial_number`) VALUES
(1,'Диал-ап из 80-х',464367600.00,3,1,'1BADB002'),
(11,'Перчатка Хакермена',142.22,2,1,'HACKTIME'),
(12,'VVVVVV',1.01,6,1,'HELP'),
(13,'Новый компонент',0.00,-1,1,'');
/*!40000 ALTER TABLE `components` ENABLE KEYS */;

-- 
-- Definition of meta_user_type
-- 

DROP TABLE IF EXISTS `meta_user_type`;
CREATE TABLE IF NOT EXISTS `meta_user_type` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table meta_user_type
-- 

/*!40000 ALTER TABLE `meta_user_type` DISABLE KEYS */;
INSERT INTO `meta_user_type`(`id`,`type`) VALUES
(-1,'Не задан'),
(1,'Администратор'),
(2,'Бухгалтер');
/*!40000 ALTER TABLE `meta_user_type` ENABLE KEYS */;

-- 
-- Definition of rooms
-- 

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `room_name` char(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table rooms
-- 

/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms`(`id`,`room_name`) VALUES
(-1,'Без комнаты'),
(1,'Хавалка'),
(2,'Кладовая'),
(3,'Серверная'),
(4,'Злые бухгалтеры'),
(5,'Новая комната');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;

-- 
-- Definition of computers
-- 

DROP TABLE IF EXISTS `computers`;
CREATE TABLE IF NOT EXISTS `computers` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `computer_name` varchar(32) NOT NULL,
  `price` float(32,2) NOT NULL,
  `serial_number` varchar(32) NOT NULL,
  `status` int(32) NOT NULL DEFAULT '1',
  `room_id` int(32) NOT NULL,
  `type` int(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_ibfk_1` (`type`),
  KEY `computers_ibfk_2` (`status`),
  KEY `computers_ibfk_3` (`room_id`),
  CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`type`) REFERENCES `meta_computer_type` (`id`),
  CONSTRAINT `computers_ibfk_2` FOREIGN KEY (`status`) REFERENCES `meta_status` (`id`),
  CONSTRAINT `computers_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table computers
-- 

/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
INSERT INTO `computers`(`id`,`computer_name`,`price`,`serial_number`,`status`,`room_id`,`type`) VALUES
(-1,'Без компьютера',-1,'-1',1,-1,1),
(2,'asddf',1,'asd',1,1,1),
(3,'asd1',1,'asd',4,1,1),
(6,'Whitley',0,'',1,1,1),
(7,'Test',0,'',1,1,1),
(8,'Новый компьютер',0,'',3,-1,1),
(9,'Новый компьютер',0,'',1,-1,1),
(10,'Новый компьютер',0,'',1,-1,1),
(11,'Новый компьютер',0,'',1,-1,1),
(12,'heelppp',0,'',1,1,1),
(13,'Новый компьютер',0,'',1,-1,1),
(14,'Новый компьютер',0,'',1,-1,1),
(15,'Новый компьютер',0,'',1,-1,1),
(16,'Новый компьютер',0,'',1,-1,1),
(17,'Новый компьютер',0,'',1,-1,1),
(18,'Новый компьютер',0,'',1,-1,1);
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;

-- 
-- Definition of users
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `cab_id` int(32) NOT NULL,
  `type` int(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cab_id` (`cab_id`),
  KEY `type` (`type`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`cab_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`type`) REFERENCES `meta_user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table users
-- 

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users`(`id`,`first_name`,`last_name`,`cab_id`,`type`) VALUES
(1,'Томас','Андерсон',1,-1),
(2,'Имя','Фамилия',1,1),
(3,'Имя','Фамилия',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 
-- Dumping triggers
-- 

DROP TRIGGER /*!50030 IF EXISTS */ `InsertComponentTrigger`;
DELIMITER |
CREATE TRIGGER `InsertComponentTrigger` BEFORE INSERT ON `components` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.component_name, ' with ID = ', NEW.id) , log_type = 3, date_time=NOW() |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `UpdateComponentTrigger`;
DELIMITER |
CREATE TRIGGER `UpdateComponentTrigger` BEFORE UPDATE ON `components` FOR EACH ROW BEGIN
    IF NOT(OLD.component_name = NEW.component_name && OLD.computer_id = NEW.computer_id && OLD.status = NEW.status && OLD.serial_number = NEW.serial_number) THEN
        INSERT INTO journal Set info= CONCAT('updated from ' ,OLD.component_name, ' to ', NEW.component_name, ' with ID = ', NEW.id) , log_type = 3, date_time=NOW();
    END IF;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `DeleteComponentTrigger`;
DELIMITER |
CREATE TRIGGER `DeleteComponentTrigger` BEFORE DELETE ON `components` FOR EACH ROW INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.component_name, ' with ID = ', OLD.id) , log_type = 3, date_time=NOW() |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `InsertComputerTrigger`;
DELIMITER |
CREATE TRIGGER `InsertComputerTrigger` BEFORE INSERT ON `computers` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.computer_name, ' with ID = ', NEW.id) , log_type = 2, date_time=NOW() |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `UpdateComputerTrigger`;
DELIMITER |
CREATE TRIGGER `UpdateComputerTrigger` BEFORE UPDATE ON `computers` FOR EACH ROW BEGIN
	IF NOT(OLD.computer_name = NEW.computer_name && OLD.price = NEW.price && OLD.serial_number = NEW.serial_number && OLD.`status` = NEW.`status` && OLD.room_id = NEW.room_id && OLD.`type` = NEW.`type`) THEN
		INSERT INTO journal Set info= CONCAT('updated computer from ' ,OLD.computer_name, ' to ', NEW.computer_name, ' with ID = ', NEW.id) , log_type = 2, date_time=NOW();
	END IF;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `DeleteComputerTrigger`;
DELIMITER |
CREATE TRIGGER `DeleteComputerTrigger` BEFORE DELETE ON `computers` FOR EACH ROW BEGIN
UPDATE components set computer_id = NULL where components.computer_id = OLD.id;
INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.computer_name, ' with ID = ', OLD.id) , log_type = 2, date_time=NOW();
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `InsertRoomTrigger`;
DELIMITER |
CREATE TRIGGER `InsertRoomTrigger` BEFORE INSERT ON `rooms` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.room_name, ' with ID = ', NEW.id) , log_type = 4, date_time=NOW() |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `UpdateRoomTrigger`;
DELIMITER |
CREATE TRIGGER `UpdateRoomTrigger` BEFORE UPDATE ON `rooms` FOR EACH ROW BEGIN
    IF NOT(OLD.room_name = NEW.room_name) THEN
        INSERT INTO journal Set info= CONCAT('updated from ' ,OLD.room_name,' to ', NEW.room_name, ' with ID = ', NEW.id) , log_type = 4, date_time=NOW();
    END IF;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `DeleteRoomTrigger`;
DELIMITER |
CREATE TRIGGER `DeleteRoomTrigger` BEFORE DELETE ON `rooms` FOR EACH ROW INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.room_name, ' with ID = ', OLD.id) , log_type = 4, date_time=NOW() |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `InsertUserTrigger`;
DELIMITER |
CREATE TRIGGER `InsertUserTrigger` BEFORE INSERT ON `users` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.first_name, ' ', NEW.last_name, ' with ID = ', NEW.id) , log_type = 1, date_time=NOW() |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `UpdateUserTrigger`;
DELIMITER |
CREATE TRIGGER `UpdateUserTrigger` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    IF NOT(OLD.first_name = NEW.first_name && OLD.last_name = NEW.last_name && OLD.cab_id = NEW.cab_id && OLD.type = NEW.type) THEN
        INSERT INTO journal Set info= CONCAT('updated from ' ,OLD.first_name, ' ', OLD.last_name, ' to ', NEW.first_name, ' ', NEW.last_name,' with ID = ', NEW.id) , log_type = 1, date_time=NOW();
    END IF;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `DeleteUserTrigger`;
DELIMITER |
CREATE TRIGGER `DeleteUserTrigger` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.first_name, ' ', OLD.last_name,' with ID = ', OLD.id) , log_type = 1, date_time=NOW() |
DELIMITER ;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2019-11-05 15:24:20
-- Total time: 0:0:0:0:613 (d:h:m:s:ms)
