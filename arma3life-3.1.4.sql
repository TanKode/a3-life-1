SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Procedure structure for `deleteDeadVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`Arma3Server`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldGangs`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DELIMITER ;;
CREATE DEFINER=`Arma3Server`@`localhost` PROCEDURE `deleteOldGangs`()
DELETE FROM gangs WHERE `active`= 0
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `DeleteOldHouses`
-- ----------------------------
DROP PROCEDURE IF EXISTS `DeleteOldHouses`;
DELIMITER ;;
CREATE DEFINER=`Arma3Server`@`localhost` PROCEDURE `DeleteOldHouses`()
DELETE FROM houses WHERE rentdate < 1
;;
DELIMITER ;

-- -----------------------------
-- Procedure structure for `resetlifeVehicles`
-- -----------------------------
DROP PROCEDURE IF EXISTS `resetlifeVehicles`;
DELIMITER ;;
CREATE DEFINER=`Arma3Server`@`localhost` PROCEDURE `resetlifeVehicles`()
BEGIN
	UPDATE vehicles SET `active`= 0;
END
;;
DELIMITER ;


--
-- Table structure for table `players`
--
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `Karma` int(100) NOT NULL DEFAULT '1',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `LastLogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `died` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`playerid`,`LastLogin`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_stats`
--
DROP TABLE IF EXISTS `player_stats`;
CREATE TABLE IF NOT EXISTS `player_stats` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `life_Leben` int(100) NOT NULL DEFAULT '0',
  `life_thirst` int(100) NOT NULL DEFAULT '0',
  `life_hunger` int(100) NOT NULL DEFAULT '0',
  PRIMARY Key (`uid`,`playerid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `vehicles`
--
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `gid` varchar(12) NOT NULL DEFAULT '0',
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  `security` TEXT  NOT NULL,
  2.`kitchen` TEXT  NOT NULL,
  PRIMARY KEY (`id`,`pid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `dynmarket` (
  `id` INT NOT NULL DEFAULT 1,
  `prices` TEXT NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `dynmarket` VALUES (1,'[]');

-- ----------------------------
-- Table structure for `skillsys`
-- ----------------------------
DROP TABLE IF EXISTS `skillsys`;
CREATE TABLE `skillsys` (
  `playerid` varchar(50) NOT NULL DEFAULT '0',
  `life_Apfel` int(100) NOT NULL DEFAULT '0',
  `life_Pfirsich` int(100) NOT NULL DEFAULT '0',
  `life_Kalkstein` int(100) NOT NULL DEFAULT '0',
  `life_Salz` int(100) NOT NULL DEFAULT '0',
  `life_Sand` int(100) NOT NULL DEFAULT '0',
  `life_EisenRoh` int(100) NOT NULL DEFAULT '0',
  `life_KupferRoh` int(100) NOT NULL DEFAULT '0',
  `life_DiamantenRoh` int(100) NOT NULL DEFAULT '0',
  `life_CannabisRoh` int(100) NOT NULL DEFAULT '0',
  `life_KokainRoh` int(100) NOT NULL DEFAULT '0',
  `life_HeroinRoh` int(100) NOT NULL DEFAULT '0',
  `life_OelRoh` int(100) NOT NULL DEFAULT '0',
  `life_Bauen` int(100) NOT NULL DEFAULT '0',
  `life_KohleRoh` int(100) NOT NULL DEFAULT '0',
  `life_Bruchstein` int(100) NOT NULL DEFAULT '0',
  `life_TonRoh` int(100) NOT NULL DEFAULT '0',
  `life_Krabben` int(100) NOT NULL DEFAULT '0',
  `life_Fischen` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `levelsys` (
`playerid` varchar(50) NOT NULL,
`donatorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
PRIMARY KEY (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


