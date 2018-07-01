-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2018 at 06:37 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bipin`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_order`
--

CREATE TABLE `bill_order` (
  `inventory_order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inventory_order_total` double(10,2) NOT NULL,
  `inventory_order_date` date NOT NULL,
  `inventory_order_name` varchar(255) NOT NULL,
  `inventory_order_address` text NOT NULL,
  `payment_status` enum('cash','credit') NOT NULL,
  `inventory_order_status` varchar(100) NOT NULL,
  `inventory_order_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_order`
--

INSERT INTO `bill_order` (`inventory_order_id`, `user_id`, `inventory_order_total`, `inventory_order_date`, `inventory_order_name`, `inventory_order_address`, `payment_status`, `inventory_order_status`, `inventory_order_created_date`) VALUES
(1, 1, 1200.00, '2018-06-28', 'RAHUL GOTI', '203, Shidhhshila Apt., Nilambaug Soc., Hirabaug, Varachha road., Surat', 'cash', 'active', '2018-06-30'),
(2, 1, 1200.00, '2018-07-01', 'RAHUL GOTI', '203, Shidhhshila Apt., Nilambaug Soc., Hirabaug, Varachha road., Surat', 'credit', 'active', '2018-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `bill_order_product`
--

CREATE TABLE `bill_order_product` (
  `inventory_order_product_id` int(11) NOT NULL,
  `inventory_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `tax` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_order_product`
--

INSERT INTO `bill_order_product` (`inventory_order_product_id`, `inventory_order_id`, `product_id`, `quantity`, `price`, `tax`) VALUES
(1, 1, 1, 10, 120.00, 18.00),
(2, 2, 1, 10, 120.00, 18.00);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_name` varchar(250) NOT NULL,
  `brand_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `category_id`, `brand_name`, `brand_status`) VALUES
(1, 1, 'Finibus', 'active'),
(2, 1, 'Lorem', 'active'),
(3, 1, 'Ipsum', 'active'),
(4, 8, 'Dolor', 'active'),
(5, 8, 'Amet', 'active'),
(6, 6, 'Aliquam', 'active'),
(7, 6, 'Maximus', 'active'),
(8, 10, 'Venenatis', 'active'),
(9, 10, 'Ligula', 'active'),
(10, 3, 'Vitae', 'active'),
(11, 3, 'Auctor', 'active'),
(12, 5, 'Luctus', 'active'),
(13, 5, 'Justo', 'active'),
(14, 2, 'Phasellus', 'active'),
(15, 2, 'Viverra', 'active'),
(16, 4, 'Elementum', 'active'),
(17, 4, 'Odio', 'active'),
(18, 7, 'Tellus', 'active'),
(19, 7, 'Curabitur', 'active'),
(20, 9, 'Commodo', 'active'),
(21, 9, 'Nullam', 'active'),
(22, 11, 'Quisques', 'active'),
(24, 11, 'XYZ', 'active'),
(25, 15, 'Rahul Door New', 'active'),
(26, 16, 'Rajkot pvt', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `category_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`) VALUES
(1, 'LED Bulb', 'active'),
(2, 'LED Lights', 'active'),
(3, 'LED Down Lights', 'active'),
(4, 'LED Panel Light', 'active'),
(5, 'LED Lamp', 'active'),
(6, 'LED Concealed Light', 'active'),
(7, 'LED Spot Light', 'active'),
(8, 'LED Ceiling Light', 'active'),
(9, 'LED Tube Light', 'active'),
(10, 'LED Driver', 'active'),
(11, 'Led Floods Light', 'active'),
(13, 'LED Outdoor Lighting', 'active'),
(14, 'LED Indoor Lights', 'active'),
(15, 'Door Furniture', 'active'),
(16, 'NutBolt', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order`
--

CREATE TABLE `inventory_order` (
  `inventory_order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inventory_order_total` double(10,2) NOT NULL,
  `inventory_order_date` date NOT NULL,
  `inventory_order_name` varchar(255) NOT NULL,
  `inventory_order_address` text NOT NULL,
  `payment_status` enum('cash','credit') NOT NULL,
  `inventory_order_status` varchar(100) NOT NULL,
  `inventory_order_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_order`
--

INSERT INTO `inventory_order` (`inventory_order_id`, `user_id`, `inventory_order_total`, `inventory_order_date`, `inventory_order_name`, `inventory_order_address`, `payment_status`, `inventory_order_status`, `inventory_order_created_date`) VALUES
(1, 1, 1298.00, '2018-06-30', 'RAHUL GOTI', '203, Shidhhshila Apt., Nilambaug Soc., Hirabaug, Varachha road., Surat', 'cash', 'active', '2018-06-30'),
(2, 1, 1298.00, '2018-07-01', 'RAHUL GOTI', '203, Shidhhshila Apt., Nilambaug Soc., Hirabaug, Varachha road., Surat', 'credit', 'active', '2018-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order_product`
--

CREATE TABLE `inventory_order_product` (
  `inventory_order_product_id` int(11) NOT NULL,
  `inventory_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `tax` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_order_product`
--

INSERT INTO `inventory_order_product` (`inventory_order_product_id`, `inventory_order_id`, `product_id`, `quantity`, `price`, `tax`) VALUES
(1, 1, 1, 10, 129.80, 18.00),
(2, 2, 1, 10, 129.80, 18.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_code_other` varchar(255) NOT NULL,
  `is_gst` varchar(1) NOT NULL,
  `product_name` varchar(300) NOT NULL,
  `product_description` text NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_unit` varchar(150) NOT NULL,
  `bill_base_price` double(10,2) NOT NULL,
  `bill_net_price` int(11) NOT NULL,
  `product_base_price` double(10,2) NOT NULL,
  `product_tax` decimal(4,2) NOT NULL,
  `product_net_price` double(10,2) NOT NULL,
  `product_minimum_order` double(10,2) NOT NULL,
  `product_enter_by` int(11) NOT NULL,
  `product_status` enum('active','inactive') NOT NULL,
  `product_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `brand_id`, `product_code`, `product_code_other`, `is_gst`, `product_name`, `product_description`, `product_quantity`, `product_unit`, `bill_base_price`, `bill_net_price`, `product_base_price`, `product_tax`, `product_net_price`, `product_minimum_order`, `product_enter_by`, `product_status`, `product_date`) VALUES
(1, 6, 6, 'ABC', 'ABC', '1', 'ABC', 'ABC', 100, 'Nos', 100.00, 120, 110.00, '18.00', 129.80, 0.00, 1, 'active', '2018-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_type` enum('master','user') NOT NULL,
  `user_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_email`, `user_password`, `user_name`, `user_type`, `user_status`) VALUES
(1, 'john_smith@gmail.com', '$2y$10$0Yo2F.EetL3yhB8l6MNvcOH8AYNS0SuXLOoAQr1qXJa3uPASWV0NC', 'John Smith', 'master', 'Active'),
(2, 'donahuber@gmail.com', '$2y$10$Ex.JTn6Cu7lCHgaJoCBVeu0qer0cFp2X1qTIpPg2qfIkkuj3LjjMK', 'Dona L. Huber', 'user', 'Active'),
(3, 'roy_hise@gmail.com', '$2y$10$XlyVI9an5B6rHW3SS9vQpesJssKJxzMQYPbSaR7dnpWjDI5fpxJSS', 'Roy Hise', 'user', 'Active'),
(4, 'peter_goad@gmail.com', '$2y$10$n1B.FdHNwufTkmzp/pNqc.EiwjB8quQ1tBCEC7nkaldI5pS.et04e', 'Peter Goad', 'user', 'Active'),
(5, 'sarah_thomas@gmail.com', '$2y$10$s57SErOPlgkIZf1lxzlX3.hMt8LSSKaYig5rusxghDm7LW8RtQc/W', 'Sarah Thomas', 'user', 'Active'),
(6, 'edna_william@gmail.com', '$2y$10$mfMXnH.TCmg5tlYRhqjxu.ILly8s9.qsLKOpyxgUl6h1fZt6x/B5C', 'Edna William', 'user', 'Active'),
(8, 'john_parks@gmail.com', '$2y$10$WtsZUxIIz/N4NoIW0Db.pu0VfLWcPs6TyQ8SkpVHLDLGhdNOfALC.', 'John Park', 'user', 'Active'),
(10, 'peter_parker@gmail.com', '$2y$10$GoQvEZNTWEibo0FPK7h57eA5UsNkXfIdex1deGsW/CFIY8zqxyu2S', 'Mark Parker', 'user', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_order`
--
ALTER TABLE `bill_order`
  ADD PRIMARY KEY (`inventory_order_id`);

--
-- Indexes for table `bill_order_product`
--
ALTER TABLE `bill_order_product`
  ADD PRIMARY KEY (`inventory_order_product_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `inventory_order`
--
ALTER TABLE `inventory_order`
  ADD PRIMARY KEY (`inventory_order_id`);

--
-- Indexes for table `inventory_order_product`
--
ALTER TABLE `inventory_order_product`
  ADD PRIMARY KEY (`inventory_order_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `unique_index` (`product_code`,`product_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_order`
--
ALTER TABLE `bill_order`
  MODIFY `inventory_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bill_order_product`
--
ALTER TABLE `bill_order_product`
  MODIFY `inventory_order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `inventory_order`
--
ALTER TABLE `inventory_order`
  MODIFY `inventory_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `inventory_order_product`
--
ALTER TABLE `inventory_order_product`
  MODIFY `inventory_order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
