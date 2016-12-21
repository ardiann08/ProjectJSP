-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2016 at 09:19 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projectjsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartstable`
--

CREATE TABLE IF NOT EXISTS `cartstable` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `productstable`
--

CREATE TABLE IF NOT EXISTS `productstable` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `productstable`
--

INSERT INTO `productstable` (`pid`, `name`, `price`, `weight`, `stock`, `image`, `uid`) VALUES
(1, 'Mouse', 350000, 50, 76, 'mouse.png', 1),
(2, 'Keyboarda', 350000, 50, 76, 'mouse.png', 1),
(3, 'Baju', 200000, 50, 76, 'baju.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetailstable`
--

CREATE TABLE IF NOT EXISTS `transactiondetailstable` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotalprice` int(11) NOT NULL,
  PRIMARY KEY (`did`),
  UNIQUE KEY `did` (`did`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `transactiondetailstable`
--

INSERT INTO `transactiondetailstable` (`did`, `tid`, `pid`, `qty`, `subtotalprice`) VALUES
(3, 2, 1, 2, 700000),
(4, 2, 2, 2, 700000);

-- --------------------------------------------------------

--
-- Table structure for table `transactionstable`
--

CREATE TABLE IF NOT EXISTS `transactionstable` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `tid` (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `transactionstable`
--

INSERT INTO `transactionstable` (`tid`, `uid`, `totalprice`, `status`, `time`) VALUES
(2, 2, 1400000, 'approved', '2016-12-20 19:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `userstable`
--

CREATE TABLE IF NOT EXISTS `userstable` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `userstable`
--

INSERT INTO `userstable` (`uid`, `fullname`, `username`, `phone`, `email`, `password`, `gender`, `dateofbirth`, `address`, `photo`, `role`) VALUES
(1, 'admin admin', 'admin', '09891234', 'email@admin.com', 'admin', 'male', '2016-11-30', 'Street admin ', 'profilepic.jpg', 'admin'),
(2, 'member member', 'member', '0817235123113', 'email@member.com', 'member', 'male', '2016-12-08', 'Street member', 'profilepic.jpg', 'member');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
