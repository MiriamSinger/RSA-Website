-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2021 at 10:15 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsa2`
--

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE `institution` (
  `institutionID` int(11) NOT NULL,
  `institutionName` varchar(45) NOT NULL,
  `institutionType` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `stateCode` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`institutionID`, `institutionName`, `institutionType`, `city`, `stateCode`) VALUES
(101, 'Foxman Torah Institute', 'Mesivta/Beis Medrash', 'Cherry Hill', 'NJ'),
(102, 'Missouri Torah Institute', 'Mesivta/Beis Medrash', 'St. Louis', 'MO'),
(103, 'Las Vegas Kollel', 'Shul', 'Las Vegas', 'NV'),
(104, 'Yeshivas Maayan Hatorah', 'Beis Medrash', 'Richmond Hill', 'NY'),
(105, 'Wisconsin Institute for Torah Study', 'Mesivta/Beis Medrash', 'Milwaukee', 'WI'),
(106, 'Torah Academy of Buffalo Grove', 'Day School', 'Buffalo Grove', 'IL'),
(107, 'Orlando Torah Academy', 'Day School', 'Orlando', 'FL'),
(108, 'Yeshiva Toras Chaim Toras Emes', 'Mesivta/Beis Medrash', 'North Miami Beach', 'FL'),
(109, 'Yeshiva Tiferes Torah of Boca Raton', 'Mesivta/Beis Medrash', 'Boca Raton', 'FL'),
(110, 'Yeshiva Ketana of Los Angeles', 'Day School', 'Los Angeles', 'CA'),
(111, 'Yeshiva Day School of Las Vegas', 'Day School', 'Las Vegas', 'NV'),
(112, 'Mesivta of Las Vegas', 'Mesivta/Beis Medrash', 'Las Vegas', 'NV'),
(113, 'Mesivta Chofetz Chaim', 'Mesivta', 'Queens', 'NY'),
(114, 'Kollel Ner Dovid', 'Kollel', 'Queens', 'NY'),
(115, 'Yeshivas Chofetz Chaim', 'Beis Medrash', 'Queens', 'NY');

-- --------------------------------------------------------

--
-- Table structure for table `mailinglist`
--

CREATE TABLE `mailinglist` (
  `mailingListID` int(11) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `Address` varchar(55) NOT NULL,
  `City` varchar(25) NOT NULL,
  `StateCode` varchar(2) NOT NULL,
  `Zip` varchar(5) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `stateCode` varchar(2) NOT NULL,
  `stateName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`stateCode`, `stateName`) VALUES
('AL', 'Alabama'),
('AK', 'Alaska'),
('AZ', 'Arizona'),
('AR', 'Arkansas'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DE', 'Delaware'),
('DC', 'District of Columbia'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('IA', 'Iowa'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('ME', 'Maine'),
('MD', 'Maryland'),
('MA', 'Massachusetts'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MS', 'Mississippi'),
('MO', 'Missouri'),
('MT', 'Montana'),
('NE', 'Nebraska'),
('NV', 'Nevada'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NY', 'New York'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('PR', 'Puerto Rico'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VT', 'Vermont'),
('VA', 'Virginia'),
('WA', 'Washington'),
('WV', 'West Virginia'),
('WI', 'Wisconsin'),
('WY', 'Wyoming');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`institutionID`),
  ADD KEY `fk_institution_state` (`stateCode`);

--
-- Indexes for table `mailinglist`
--
ALTER TABLE `mailinglist`
  ADD PRIMARY KEY (`mailingListID`),
  ADD KEY `StateCode` (`StateCode`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`stateCode`),
  ADD UNIQUE KEY `stateName` (`stateName`),
  ADD UNIQUE KEY `stateName_2` (`stateName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mailinglist`
--
ALTER TABLE `mailinglist`
  MODIFY `mailingListID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `institution`
--
ALTER TABLE `institution`
  ADD CONSTRAINT `fk_institution_state` FOREIGN KEY (`stateCode`) REFERENCES `states` (`stateCode`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
