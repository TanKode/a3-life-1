-- phpMyAdmin SQL Dump
-- version 4.2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 14. Sep 2015 um 13:35
-- Server Version: 5.6.26
-- PHP-Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `ni710803_2sql3`
--

DELIMITER $$
--
-- Prozeduren
--
CREATE DEFINER=`ni710803_2sql3`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`ni710803_2sql3`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
	DELETE FROM `gangs` WHERE `active` = 0;
END$$

CREATE DEFINER=`ni710803_2sql3`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=`ni710803_2sql3`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE `vehicles` SET `active`= 0 WHERE `active`= 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `base`
--

CREATE TABLE IF NOT EXISTS `base` (
`id` int(11) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `members` text,
  `owned` tinyint(4) DEFAULT '0',
  `gangid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dynmarket`
--

CREATE TABLE IF NOT EXISTS `dynmarket` (
  `id` int(11) NOT NULL DEFAULT '1',
  `prices` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `dynmarket`
--

INSERT INTO `dynmarket` (`id`, `prices`) VALUES
(1, '[[`bunkerbig`,500000,0],[`sandsack`,250000,0],[`sandsackecke`,225000,0],[`sandsackrund`,200000,0],[`bunkersmall`,1.5e+006,0],[`hsmall`,400000,0],[`hsmalleinzel`,150000,0],[`hturm`,1e+006,0],[`Hbig`,550000,0],[`hbarrierEcke`,500000,0],[`hBarriereCorridor`,400000,0],[`stachel`,450000,0],[`lampsmall`,375000,0],[`schranke`,400000,0],[`schiesswand`,100000,0],[`schiesswandfenster`,95000,0],[`schiesswandducken`,90000,0],[`schiesswandspring`,80000,0],[`schiessdeckungmitt`,85000,0],[`schiessdeckungducken`,75000,0],[`schiessdeckungliegen`,70000,0],[`schiessziel`,50000,0],[`ziel`,150000,0],[`camo`,75000,0],[`map`,300000,0],[`strom`,200,0],[`sun`,225000,0],[`fire`,225000,0],[`helisquare`,400000,0],[`helicircle`,400000,0],[`bigturm`,1.2e+007,0],[`turm`,5e+006,0],[`cargohq`,7.5e+006,0],[`aid`,125000,0],[`garage`,2e+007,0],[`helig`,1e+007,0],[`lagerhalle`,6e+006,0],[`cargoschwarz`,5e+006,0],[`storagebigb`,5e+006,0],[`cargo`,5e+006,0],[`atm`,200,0],[`leiter`,1e+006,0],[`lamp1`,400000,0],[`halogen`,450000,0],[`laborb`,4e+006,0],[`base_toolkit`,25000,0],[`abrissbirne`,50000,0],[`h_eier`,200,0],[`craft_zfell`,50,0],[`craft_rfell`,20,0],[`craft_wolle`,30,0],[`craft_federn`,10,0],[`pickaxe`,350,0],[`messer`,500,0],[`schaufel`,350,0],[`motorsaege`,350,0],[`goldsieb`,500,0],[`handschuhe`,750,0],[`kescher`,750,0],[`fuelFull`,500,0],[`fuelPipe`,250,0],[`spikeStrip`,1200,0],[`goldbar`,150000,0],[`battery`,500,0],[`handcuffs`,1000,0],[`gpstracker`,2000,0],[`gpssuchgeraet`,25000,0],[`bd_mk1_bleachweapon`,40000,0],[`bd_mk1_ammo`,5000,0],[`bd_mk2_microemp`,550000,0],[`bd_mk2_ammo`,14000,0],[`speedtrap`,3000,0],[`speedtrapdetector`,20000,0],[`laptop`,2000,0],[`furniture_01`,14000,0],[`furniture_02`,17000,0],[`furniture_03`,11000,0],[`furniture_04`,18000,0],[`furniture_05`,17000,0],[`event_1`,1,0],[`event_2`,1,0],[`event_3`,1,0],[`event_score`,1,0],[`bomb`,700000,0],[`lockpick`,75,0],[`underwatercharge`,20000,0],[`adac_toolkit`,250,0],[`repairkit`,250,0],[`adac_tow`,100,0],[`adac_paint`,300,0],[`vehhut`,1250,0],[`mauer`,1250,0],[`wkasten`,1250,0],[`firstaidkit`,250,0],[`kidney`,50000,0],[`organttk`,1000,0],[`scalpel`,1000,0],[`token_donator`,100,0],[`token_rebel`,100,0],[`token_police`,100,0],[`oil_processed`,5200,0],[`copper_refined`,4000,0],[`iron_refined`,5200,0],[`salt_refined`,400,0],[`glass`,3500,0],[`diamond_cut`,1500,0],[`cement`,750,0],[`reingold`,75000,0],[`goldbarp`,30000,0],[`silber_processed`,1200,0],[`gold_processed`,5500,0],[`whiskey`,5000,0],[`bottledwhiskey`,8000,0],[`beerp`,4500,0],[`bottledbeer`,700,0],[`bottles`,2500,0],[`hops`,1800,0],[`rye`,2000,0],[`yeast`,2000,0],[`cornmeal`,200,0],[`mash`,2000,0],[`moonshine`,7000,0],[`bottledshine`,9500,0],[`kohle`,3000,0],[`zink`,2500,0],[`nickel`,3000,0],[`blei`,2800,0],[`messing`,4000,0],[`schwefelsaeure`,3000,0],[`farbstoff`,3000,0],[`heroin_processed`,8000,0],[`marijuana`,7500,0],[`cocaine_processed`,3000,0],[`uran_processed`,2000,0],[`frogslsd`,1800,0],[`meth_processed`,8750,0],[`gluew`,3500,0],[`redgull`,200,0],[`coffee`,5,0],[`waterBottle`,5,0],[`pcolap`,200,0],[`sotbp`,200,0],[`maitp`,200,0],[`apple`,50,0],[`peach`,55,0],[`tbacon`,25,0],[`donut`,60,0],[`rabbit_raw`,65,0],[`rabbit_grilled`,115,0],[`salema_raw`,45,0],[`salema_grilled`,55,0],[`ornate_raw`,40,0],[`ornate_grilled`,150,0],[`mackerel_raw`,175,0],[`mackerel_grilled`,200,0],[`tuna_raw`,700,0],[`tuna_grilled`,1000,0],[`mullet_raw`,250,0],[`mullet_fried`,400,0],[`catshark_raw`,300,0],[`catshark_fried`,500,0],[`turtle_raw`,3000,0],[`turtle_soup`,1000,0],[`hen_raw`,35,0],[`hen_fried`,85,0],[`rooster_raw`,35,0],[`rooster_grilled`,85,0],[`sheep_raw`,50,0],[`sheep_grilled`,115,0],[`goat_raw`,75,0],[`goat_grilled`,135,0],[`huehners`,50,0],[`eieromelett`,50,0],[`banane`,30,0],[`birne`,30,0],[`cerises`,30,0,22],[`burglar_tool`,2000,0],[`craft_motor_a`,200000,0],[`craft_motor_h`,200000,0],[`craft_getriebe_a`,150000,0],[`craft_getriebe_h`,150000,0],[`craft_kleinteile`,10000,0],[`craft_kupplung_a`,75000,0],[`craft_kupplung_h`,150000,0],[`craft_sondert`,250000,0],[`craft_seitenr`,60000,0],[`craft_hoehenr`,60000,0],[`craft_querr`,75000,0],[`craft_pilotensitz`,75000,0],[`craft_triebw`,350000,0],[`craft_kabine`,250000,0],[`craft_instru`,100000,0],[`craft_landek`,50000,0],[`craft_verriegelungs`,15000,0],[`craft_verschluss`,15000,0],[`craft_sicherungsh`,25000,0],[`craft_boden_schlies`,45000,0],[`craft_patronenlager`,15000,0],[`craft_paper`,75000,0],[`craft_cheytac`,100000,0],[`craft_zweibein`,100000,0],[`craft_repetier`,150000,0],[`craft_reaver`,100000,0],[`craft_slingshot`,150000,0],[`craft_gewinde`,25000,0],[`craft_epdm`,50000,0],[`craft_mineralf`,50000,0],[`craft_edelstahlv`,50000,0],[`craft_edelstahll`,25000,0],[`craft_kondenzs`,25000,0],[`craft_streckmetall`,15000,0],[`craft_daemmkernt`,10000,0],[`craft_kautschuk`,1000,0],[`craft_spiegel`,100,0],[`craft_reifen`,300,0],[`craft_draht`,200,0],[`craft_innena`,100,0],[`craft_rotor`,4000,0],[`craft_pitchk`,4000,0],[`craft_tragf`,2000,0],[`craft_hoehenf`,2000,0],[`craft_seitenf`,2000,0],[`craft_rumpf`,2000,0],[`craft_fahrg`,2000,0],[`craft_dichtung`,1000,0],[`craft_karosseriet`,1000,0],[`craft_scheibe`,2000,0],[`craft_muendungsf`,1000,0],[`craft_rohr`,3000,0],[`craft_trageb`,2000,0],[`craft_gehause`,5000,0],[`craft_hands`,2000,0],[`craft_schulters`,3000,0],[`patronenh`,3000,0],[`schwarzp`,2500,0],[`projektil`,2000,0]]');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gangs`
--

CREATE TABLE IF NOT EXISTS `gangs` (
`id` int(11) NOT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `goverment`
--

CREATE TABLE IF NOT EXISTS `goverment` (
  `ID` int(1) NOT NULL DEFAULT '1',
  `govID` varchar(50) NOT NULL DEFAULT '1',
  `laws` varchar(500) NOT NULL DEFAULT '[]',
  `govCash` int(100) NOT NULL DEFAULT '0',
  `taxes` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `goverment`
--

INSERT INTO `goverment` (`ID`, `govID`, `laws`, `govCash`, `taxes`) VALUES
(1, '000000000000000000', '[]', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
`id` int(11) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `houses`
--

INSERT INTO `houses` (`id`, `pid`, `pos`, `inventory`, `containers`, `owned`) VALUES
(1, '76561198153428258', '[31090.1,10791.3,0.0300007]', '[[],0]', '[[`B_supplyCrate_F`,1],[`U_C_Poloshirt_stripped`,1]]', 1),
(2, '76561198194337419', '[30806.8,10608.1,0.107844]', '[[],0]', '[[`B_supplyCrate_F`,1]]', 1),
(3, '76561198153428258', '[9668.59,2046.02,0]', '[[],0]', '[]', 1),
(4, '76561198194337419', '[30717.8,10622.5,0.173197]', '[[],0]', '[]', 1),
(5, '76561198037905898', '[30733.9,10742.5,0.124183]', '[[],0]', '[]', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`uid` int(12) NOT NULL,
  `fromID` varchar(50) NOT NULL,
  `toID` varchar(50) NOT NULL,
  `message` text,
  `fromName` varchar(32) NOT NULL,
  `toName` varchar(32) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `object`
--

CREATE TABLE IF NOT EXISTS `object` (
  `id` int(11) NOT NULL,
  `pos` varchar(64) NOT NULL,
  `inventory` text,
  `kind` varchar(64) NOT NULL,
  `dir` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `players`
--

CREATE TABLE IF NOT EXISTS `players` (
`uid` int(12) NOT NULL,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `aliases` text NOT NULL,
  `guid` text NOT NULL,
  `adminlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `adaclevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `rebellevel` enum('0','1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '0',
  `cash` int(200) NOT NULL DEFAULT '0',
  `bankacc` int(200) NOT NULL DEFAULT '0',
  `cop_cash` int(200) NOT NULL DEFAULT '0',
  `cop_bankacc` int(200) NOT NULL DEFAULT '0',
  `med_cash` int(200) NOT NULL DEFAULT '0',
  `med_bankacc` int(200) NOT NULL DEFAULT '0',
  `adac_cash` int(200) NOT NULL DEFAULT '0',
  `adac_bankacc` int(200) NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `adac_licenses` text,
  `cop_gear` text NOT NULL,
  `civ_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `adac_gear` text NOT NULL,
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `level` int(200) NOT NULL DEFAULT '0',
  `exp` int(200) NOT NULL DEFAULT '0',
  `skill` text,
  `skillpoint` int(200) NOT NULL DEFAULT '0',
  `position` text,
  `alive` tinyint(1) NOT NULL DEFAULT '0',
  `veh_plate` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `realbase`
--

CREATE TABLE IF NOT EXISTS `realbase` (
`id` int(11) NOT NULL,
  `pos` varchar(64) NOT NULL DEFAULT '',
  `inventory` text,
  `slots` int(11) NOT NULL,
  `gangid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
`id` int(12) NOT NULL,
  `side` varchar(15) NOT NULL,
  `classname` varchar(40) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `damage` float NOT NULL,
  `position` text,
  `direction` float DEFAULT NULL,
  `savePos` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wanted`
--

CREATE TABLE IF NOT EXISTS `wanted` (
  `wantedID` varchar(50) NOT NULL,
  `wantedName` varchar(52) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `base`
--
ALTER TABLE `base`
 ADD PRIMARY KEY (`id`,`pid`);

--
-- Indexes for table `dynmarket`
--
ALTER TABLE `dynmarket`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gangs`
--
ALTER TABLE `gangs`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `goverment`
--
ALTER TABLE `goverment`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
 ADD PRIMARY KEY (`id`,`pid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `object`
--
ALTER TABLE `object`
 ADD PRIMARY KEY (`id`,`pos`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
 ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `playerid` (`playerid`), ADD KEY `name` (`name`), ADD KEY `blacklist` (`blacklist`);

--
-- Indexes for table `realbase`
--
ALTER TABLE `realbase`
 ADD PRIMARY KEY (`id`,`pos`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
 ADD PRIMARY KEY (`id`), ADD KEY `side` (`side`), ADD KEY `pid` (`pid`), ADD KEY `type` (`type`);

--
-- Indexes for table `wanted`
--
ALTER TABLE `wanted`
 ADD PRIMARY KEY (`wantedID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `base`
--
ALTER TABLE `base`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gangs`
--
ALTER TABLE `gangs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `uid` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
MODIFY `uid` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `realbase`
--
ALTER TABLE `realbase`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
