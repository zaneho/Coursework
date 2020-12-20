-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2016 at 01:38 PM
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
  `itemid` int(11) NOT NULL,
  `userid` varchar(24) NOT NULL,
  `itembrand` varchar(30) NOT NULL,
  `itemname` varchar(80) NOT NULL,
  `description` mediumtext NOT NULL,
  `pettype` varchar(30) NOT NULL,
  `category` varchar(24) NOT NULL,
  `imagefile` varchar(80) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemid`, `userid`, `itembrand`, `itemname`, `description`, `pettype`, `category`, `imagefile`, `price`) VALUES
(1, 'mary', 'PEDIGREE', '5 Kinds Of Meat', 'Pedigree home style recipe gives your dog an excellent meal everyday.\r\nProduced from quality meat and selected vegetables that are caerfully cooked to preserve the essential nutrients needed by your pet.\r\nEnriched with Vitamin E and omega 6 for healthy skin and shiny coat.\r\n										\r\nAlert eyes and reflexes. Energy and proper digestion. Healthy skin and shiny coat. Strong muscles, teeth and bones\r\n\r\nINGREDIENTS: \r\nMeats including chicken, lamb and beef, liver and veal, gelling agent,cereal protein, vitamins and minerals, vegetable fibers, sunflower seed oil, coloring agent and flavor.', 'dog', 'Food', 'dogfood_predigree.png', '2.50'),
(2, 'pat', 'DIVINE', 'Beef & Veal', 'Divine Classic Gold Selection is an exquisite menu developed for your dog by our experts.\r\nThe menu was carefully formulated with the highest quality, sumptuous and tender meat ingredients - cooked to perfection in their own succulent juices.\r\nThis delicious recipe guarantees your dog a nutritionally complete meal, full of great taste.\r\nDivine Class Gold Selection will give your dog the ultimate satisfaction in every meal. Succulent Beef & Veal, fine flavours and tantalizing textures from the best ingredients, is a truly exquisite menu.\r\n\r\nINGREDIENTS:\r\nSelected meats (Beef, Chicken, Lamb, Turkey, Veal) and meat by-products, flour, gelling agents, food colouring, essential vitamins and minerals. \r\nNo Preservatives\r\n\r\n', 'dog', 'food', 'dogfood_divine.png', '3.25'),
(3, 'pat', 'PAMPERED', 'T-Shirt Pluto (Small)', '95% cotton and 5% elastance\r\nMachine washable\r\nPluto screen printing\r\n\r\nSIZE:\r\nSmall\r\n20 cm', 'dog', 'clothing', 'dogclothes_pampered.png', '14.90'),
(4, 'jack', 'DRESS A PET', 'Blue Penguin Costume', 'Made from super soft material tailored into a penguin. \r\nMachine washable. \r\nDetailed embroidery of a penguin and your pooch will be ready for a costume party!\r\n\r\nCOLOUR:\r\nBlue\r\n\r\nSIZE: Large \r\nNeck (cm)   Chest (cm)   Length (cm)\r\n31 - 35       49 - 55         34', 'dog', 'clothing', 'dogclothes_dressapet.png', '19.90');

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
  `dateofbirth` varchar(20) NOT NULL,
  `typesofpetsown` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`, `name`, `gender`, `address`, `dateofbirth`, `typesofpetsown`) VALUES
('jack', 'beanstalk', 'Jack Lee', 'Male', '1 Tampines Ave 2', '12/12/1999', 'dog, hamster'),
('jon', 'sad', 'Jon Jerry', 'Male', 'Tampines Street 11 Block 110', '01/10/1997', 'dog'),
('mary', 'lamb', 'Mary Tan', 'Female', '3 Bedok North Ave 10', '03/06/1989', 'dog'),
('pat', 'happy', 'Pat Lim', 'Male', '10 Simei Street 2', '02/03/1995', 'dog');

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
