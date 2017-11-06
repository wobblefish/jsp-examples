-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 15, 2011 at 02:02 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `servlet_db1`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `fname` varchar(72) NOT NULL,
  `lname` varchar(72) NOT NULL,
  `street1` varchar(192) NOT NULL,
  `street2` varchar(192) NOT NULL,
  `street3` varchar(192) NOT NULL,
  `city` varchar(128) NOT NULL,
  `province` varchar(72) NOT NULL,
  `country` varchar(72) NOT NULL,
  `postalcode` varchar(10) NOT NULL,
  `phone` varchar(24) NOT NULL,
  `email` varchar(56) NOT NULL,
  `password` varchar(24) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;
