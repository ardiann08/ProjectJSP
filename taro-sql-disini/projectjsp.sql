-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2016 at 06:19 PM
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
(1, 'Mouse', 350000, 50, 80, 'mouse.png', 1),
(2, 'Keyboard', 350000, 50, 80, 'keyboard.jpg', 1),
(3, 'Baju', 200000, 50, 80, 'baju.jpg', 1),
(4, 'TV', 2500000, 50, 80, 'tv.jpg', 1);

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
  `dateofbrith` date NOT NULL,
  `address` text NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `userstable`
--

INSERT INTO `userstable` (`uid`, `fullname`, `username`, `phone`, `email`, `password`, `gender`, `dateofbrith`, `address`, `role`) VALUES
(1, 'admin admin', 'admin', '09891234', 'null', 'admin', 'male', '2016-11-30', 'Street admin ', 'admin'),
(2, 'member member', 'member', '0817235123113', 'null', 'member', 'male', '2016-12-08', 'Street member', 'member');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
