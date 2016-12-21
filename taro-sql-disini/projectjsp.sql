-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2016 at 03:53 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectjsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartstable`
--

CREATE TABLE `cartstable` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cartstable`
--

INSERT INTO `cartstable` (`cid`, `uid`, `pid`, `qty`, `subtotal`) VALUES
(9, 2, 1, 1, 350000);

-- --------------------------------------------------------

--
-- Table structure for table `commentstable`
--

CREATE TABLE `commentstable` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `star` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `commentstable`
--

INSERT INTO `commentstable` (`cid`, `uid`, `pid`, `body`, `star`) VALUES
(2, 2, 1, 'barang uda sampe ', 5);

-- --------------------------------------------------------

--
-- Table structure for table `productstable`
--

CREATE TABLE `productstable` (
  `pid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productstable`
--

INSERT INTO `productstable` (`pid`, `name`, `price`, `weight`, `stock`, `image`, `uid`) VALUES
(1, 'Mouse', 350000, 50, 72, 'mouse.png', 1),
(2, 'Keyboard', 350000, 50, 96, 'keyboard.jpg', 1),
(3, 'Baju', 200000, 50, 72, 'baju.jpg', 1),
(4, 'TV', 3000000, 5, 53, 'tv.jpg', 1),
(5, 'Ikat Pinggang', 50000, 77, 31, 'ikatpinggang.jpg', 1),
(6, 'Headset', 1000000, 100, 21, 'headset.jpg', 1),
(7, 'Tas', 150000, 100, 66, 'tas.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetailstable`
--

CREATE TABLE `transactiondetailstable` (
  `did` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotalprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactiondetailstable`
--

INSERT INTO `transactiondetailstable` (`did`, `tid`, `pid`, `qty`, `subtotalprice`) VALUES
(3, 2, 1, 2, 700000),
(4, 2, 2, 2, 700000),
(5, 3, 2, 1, 350000),
(6, 4, 2, 1, 350000),
(7, 4, 3, 1, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `transactionstable`
--

CREATE TABLE `transactionstable` (
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactionstable`
--

INSERT INTO `transactionstable` (`tid`, `uid`, `totalprice`, `status`, `time`) VALUES
(2, 2, 1400000, 'approved', '2016-12-20 19:38:32'),
(3, 2, 350000, 'waiting', '2016-12-21 07:01:11'),
(4, 2, 550000, 'approved', '2016-12-21 07:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `userstable`
--

CREATE TABLE `userstable` (
  `uid` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userstable`
--

INSERT INTO `userstable` (`uid`, `fullname`, `username`, `phone`, `email`, `password`, `gender`, `dateofbirth`, `address`, `photo`, `role`) VALUES
(1, 'admin admin', 'admin', '09891234', 'email@admin.com', 'admin', 'male', '2016-11-30', 'Street admin ', 'profilepic.jpg', 'admin'),
(2, 'member member', 'member', '0817235123113', 'email@member.com', 'member', 'male', '2016-12-08', 'Street member', 'profilepic.jpg', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartstable`
--
ALTER TABLE `cartstable`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `cid` (`cid`);

--
-- Indexes for table `commentstable`
--
ALTER TABLE `commentstable`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `productstable`
--
ALTER TABLE `productstable`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pid` (`pid`);

--
-- Indexes for table `transactiondetailstable`
--
ALTER TABLE `transactiondetailstable`
  ADD PRIMARY KEY (`did`),
  ADD UNIQUE KEY `did` (`did`);

--
-- Indexes for table `transactionstable`
--
ALTER TABLE `transactionstable`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Indexes for table `userstable`
--
ALTER TABLE `userstable`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartstable`
--
ALTER TABLE `cartstable`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `commentstable`
--
ALTER TABLE `commentstable`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `productstable`
--
ALTER TABLE `productstable`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `transactiondetailstable`
--
ALTER TABLE `transactiondetailstable`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `transactionstable`
--
ALTER TABLE `transactionstable`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `userstable`
--
ALTER TABLE `userstable`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
