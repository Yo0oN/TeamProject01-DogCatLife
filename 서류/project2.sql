-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.10-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- project2 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `project2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project2`;

-- 테이블 project2.admins 구조 내보내기
CREATE TABLE IF NOT EXISTS `admins` (
  `id` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.admins:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- 테이블 project2.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `pseq` int(11) DEFAULT NULL,
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) DEFAULT NULL,
  `mseq` int(11) DEFAULT NULL,
  `writer` varchar(12) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `filename_ori` varchar(30) DEFAULT NULL,
  `filename_new` varchar(30) DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `cmt` int(11) DEFAULT NULL,
  `wdate_ori` varchar(50) DEFAULT NULL,
  `wdate_mod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 project2.comment_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment_board` (
  `seq` int(11) DEFAULT NULL,
  `cseq` int(11) NOT NULL AUTO_INCREMENT,
  `cmseq` int(11) DEFAULT NULL,
  `cwriter` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `cwdate_ori` varchar(50) DEFAULT NULL,
  `cwdate_mod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cseq`),
  KEY `seq` (`seq`),
  CONSTRAINT `seq` FOREIGN KEY (`seq`) REFERENCES `board` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.comment_board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comment_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_board` ENABLE KEYS */;

-- 테이블 project2.kinds 구조 내보내기
CREATE TABLE IF NOT EXISTS `kinds` (
  `kinds` varchar(50) DEFAULT NULL,
  UNIQUE KEY `kinds` (`kinds`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.kinds:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `kinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `kinds` ENABLE KEYS */;

-- 테이블 project2.personal_answers 구조 내보내기
CREATE TABLE IF NOT EXISTS `personal_answers` (
  `seq` int(11) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  KEY `FK__personal_question` (`seq`),
  CONSTRAINT `FK__personal_question` FOREIGN KEY (`seq`) REFERENCES `personal_question` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.personal_answers:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `personal_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_answers` ENABLE KEYS */;

-- 테이블 project2.personal_question 구조 내보내기
CREATE TABLE IF NOT EXISTS `personal_question` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.personal_question:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `personal_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_question` ENABLE KEYS */;

-- 테이블 project2.questions 구조 내보내기
CREATE TABLE IF NOT EXISTS `questions` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `kinds` varchar(50) DEFAULT NULL,
  `qseq` int(11) NOT NULL DEFAULT 0,
  `content` varchar(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `kinds` (`kinds`),
  CONSTRAINT `kinds` FOREIGN KEY (`kinds`) REFERENCES `kinds` (`kinds`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.questions:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- 테이블 project2.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `mseq` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `nickname` varchar(12) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  PRIMARY KEY (`mseq`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project2.user:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`mseq`, `id`, `nickname`, `password`, `name`, `phone`, `email`, `joindate`) VALUES
	(1, 'asdf', 'asdf1', '1234', 'asd', '1234-1234', '123@123.com', '2020-04-07');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
