-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2015 at 07:46 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dealers`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL,
  `account_id` varchar(100) NOT NULL,
  `model_id` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `terms` varchar(100) NOT NULL,
  `monthly_installment` decimal(10,2) NOT NULL,
  `totalpaid` decimal(10,2) NOT NULL,
  `deposit` decimal(10,2) NOT NULL,
  `rebate` decimal(10,2) NOT NULL,
  `contract_price` decimal(10,2) NOT NULL,
  `months` int(11) NOT NULL,
  `datepayment` date NOT NULL,
  `downpayment` double(10,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_id`, `model_id`, `status`, `terms`, `monthly_installment`, `totalpaid`, `deposit`, `rebate`, `contract_price`, `months`, `datepayment`, `downpayment`) VALUES
(1, 'CUSTOMERID-C4YCBKLWL', '1', 'current', '12', '950.00', '2300.00', '350.00', '0.00', '12400.00', 1, '2015-09-05', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(1, 'honda'),
(2, 'suzuki');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `model_name` text NOT NULL,
  `description` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customerlists`
--

CREATE TABLE IF NOT EXISTS `customerlists` (
  `id` int(11) NOT NULL,
  `customerid` varchar(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `tin` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `profile` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerlists`
--

INSERT INTO `customerlists` (`id`, `customerid`, `firstname`, `middlename`, `lastname`, `tin`, `address`, `contact`, `profile`) VALUES
(1, 'CUSTOMERID-C4YCBKLWL', 'Floramae', 'B', 'Bulfa', 'tin123dasj', 'CASIA,BANKAL ', '092323', '../images/');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `categoryid` varchar(20) NOT NULL,
  `modelid` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `chassis` varchar(50) NOT NULL,
  `enginenumber` varchar(50) NOT NULL,
  `downpayment` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `activityid` int(11) NOT NULL,
  `activity` text NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`activityid`, `activity`, `user_id`, `date`) VALUES
(1, 'ADDING MODEL: XRM 125 ', 'admin', '2015-09-05 03:09:51'),
(2, 'SALES INVOICE CREATED: ENGINE-12312 ', 'admin', '2015-09-05 03:10:43'),
(3, 'ADDING CATEGORIES: SUZUKI ', 'admin', '2015-12-01 04:30:29'),
(4, 'ADDING MODEL: raider 125 ', 'admin', '2015-12-01 04:30:42');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE IF NOT EXISTS `models` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `downpayment` decimal(10,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `category_name`, `model_name`, `price`, `downpayment`) VALUES
(1, 'honda', 'xrm 125', '10000.00', '1000.00'),
(2, 'SUZUKI', 'raider 125', '60000.00', '4000.00');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `penalty_rate` decimal(10,2) NOT NULL,
  `id` int(11) NOT NULL,
  `monthly_rate` decimal(10,2) NOT NULL,
  `addons` decimal(10,2) NOT NULL,
  `rebate_rate` decimal(10,2) NOT NULL,
  `extend_days` int(11) NOT NULL,
  `months_notify` int(11) NOT NULL,
  `lcp_rate` decimal(10,2) NOT NULL,
  `constant_rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`penalty_rate`, `id`, `monthly_rate`, `addons`, `rebate_rate`, `extend_days`, `months_notify`, `lcp_rate`, `constant_rate`) VALUES
('0.05', 1, '0.02', '0.00', '300.00', 0, 0, '0.10', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `sold_items`
--

CREATE TABLE IF NOT EXISTS `sold_items` (
  `id` int(11) NOT NULL,
  `transid` varchar(111) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `engine` varchar(100) NOT NULL,
  `chassis` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `color` varchar(100) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sold_items`
--

INSERT INTO `sold_items` (`id`, `transid`, `customer_id`, `type`, `category_name`, `model_name`, `engine`, `chassis`, `price`, `color`, `note`) VALUES
(1, 'CLT-NF1R0FLWB', 'CUSTOMERID-C4YCBKLWL', 'terms', 'honda', 'xrm 125', 'ENGINE-12312', 'CHASSIS-123123', '0.00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE IF NOT EXISTS `stocks` (
  `model_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `model_name` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `downpayment` decimal(10,2) NOT NULL,
  `color` varchar(100) NOT NULL,
  `engine_number` varchar(30) NOT NULL,
  `chassis` varchar(30) NOT NULL,
  `status` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='stocks';

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`model_id`, `category_name`, `model_name`, `price`, `downpayment`, `color`, `engine_number`, `chassis`, `status`, `branch`) VALUES
(1, 'honda', 'xrm 125', '10000.00', '1000.00', 'RED', 'ENGINE-12312', 'CHASSIS-123123', 'sold', 'Mandaue');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `trans_id` varchar(100) NOT NULL,
  `customerid` varchar(100) NOT NULL,
  `model_id` varchar(100) NOT NULL,
  `datepayment` date NOT NULL,
  `total_paid` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `rebate` double(10,2) NOT NULL,
  `deposit` decimal(10,2) NOT NULL,
  `penalty` decimal(10,2) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `customerid`, `model_id`, `datepayment`, `total_paid`, `amount`, `rebate`, `deposit`, `penalty`, `user_id`, `branch`) VALUES
('CLT-NF1R0FLWB', 'CUSTOMERID-C4YCBKLWL', '1', '2015-09-05', '1000.00', '1000.00', 0.00, '0.00', '0.00', 'admin', 'any'),
('CLT-V66EO', 'CUSTOMERID-C4YCBKLWL', '1', '2015-10-04', '1300.00', '950.00', 0.00, '350.00', '0.00', 'admin', 'any');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `branchid` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `middlename`, `lastname`, `contact`, `picture`, `type`, `status`, `branchid`) VALUES
(1, 'admin', 'admin', 'Fejie', 'Sorono', 'Fariolen', '09322324465', '', 'Administrator', 'active', 'any'),
(2, 'andie', 'andie123', 'Shalou', 'Ragasi', 'Misa', '09322324571', '', 'Accounting', 'active', 'Mandaue');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customerlists`
--
ALTER TABLE `customerlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`activityid`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sold_items`
--
ALTER TABLE `sold_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customerlists`
--
ALTER TABLE `customerlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `activityid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sold_items`
--
ALTER TABLE `sold_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
