-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2016 at 05:06 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `petshopdb`
--
CREATE DATABASE IF NOT EXISTS `petshopdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `petshopdb`;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `itemid` varchar(12) NOT NULL,
  `itemname` varchar(80) NOT NULL,
  `description` mediumtext NOT NULL,
  `category` varchar(24) NOT NULL,
  `imagefile` varchar(80) NOT NULL,
  `userid` varchar(24) NOT NULL,
  `itembrand` varchar(30) NOT NULL,
  `pettype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemid`, `itemname`, `description`, `category`, `imagefile`, `userid`, `itembrand`, `pettype`) VALUES
('1', 'Bed (Red)', 'Made with 100% cotton canvas fabric - extremely durable/heavy-weight canvas.\r\n\r\nSoft inner pillow for added comfort pet''s just love to curl up and snuggle in these cozy lounger beds!\r\n\r\nMachine washable', 'bed', 'dogbed.jpg', 'mary', 'DOGGYDOLLY', 'dog, cat'),
('2', 'K9 Natural Freeze Dried Venison', 'Ingredients:\r\nFresh venison (derived from animals deemed fit for human consumption), ground bone, blood, fresh broccoli, cauliflower, carrot, silver beet, cabbage, other seasonal vegetables, fresh whole eggs with shell, fruit (apples, pears and other seasonal fruit), green tripe, heart, liver, kidney, garlic, cod liver oil (natural preservative).\r\n\r\n\r\n\r\n', 'food', 'k9FreezeDriedVenison.jpg', 'pat', 'PEDIGREE', 'dog'),
('3', 'Rabbit Cage (Pink)', 'Features:\r\nChange the bedding without taking out the pet, as the whole cage can be lifted up separately. The specialized plastic clips fasten the meshes by holding its edge tightly. Pet name card can be inserted next to the front door.\r\n\r\nColor:\r\nPink\r\n\r\nSize:\r\nL 72.8 x W 49.5 x H 53cm', 'cage', 'rabbitCage.jpg', 'pat', 'AFP', 'rabbit'),
('4', 'Dog Harness', 'Features:\r\nKarlie is a German made product derived from pure leather.  We''ve developed special skills and abilities in the field of production of high-quality leather goods. The combination of innovative ideas following fashionable trends and the use of high-quality  materials make the KARLIE leather products unique. \r\n\r\nThis Strass harness is made from pure buffalo leather, water- repellent, and sewn.  Super soft. Chrome-plated fittings. Crafted to last long with 5 years guarantee!\r\n\r\nColor:\r\nBlack\r\n\r\nSize:\r\nSmall (12 mm X 35-42 cm) ', 'harness', 'harness.jpg', 'jack', 'LOVING PETS', 'dog');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL,
  `name` varchar(80) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(80) NOT NULL,
  `dateOfBirth` varchar(20) NOT NULL,
  `typesOfPetsOwn` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`, `name`, `gender`, `address`, `dateOfBirth`, `typesOfPetsOwn`) VALUES
('jack', 'beanstalk', 'Jack Lee', 'Male', '1 Tampines Ave 2', '12/12/1999', 'dog, hamster'),
('mary', 'lamb', 'Mary Tan', 'Female', '3 Bedok North Ave 10', '03/06/1989', 'cat'),
('pat', 'happy', 'Pat Lim', 'Male', '10 Simei Street 2', '02/03/1995', 'dog, rabbit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
