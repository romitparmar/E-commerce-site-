-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2025 at 06:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricket`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(42, 1, 22, 2),
(43, 1, 29, 1),
(44, 1, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Processing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `stock`, `image_path`) VALUES
(1, 'MRF Cricket Bat', 'Bat', 4500.00, -2, 'ss7.jpg'),
(2, 'Kookaburra Ball', 'Ball', 850.00, 9, 'DUKES_RED_BALL.webp'),
(3, 'SG Gloves', 'Gloves', 1200.00, 3, 'sg_pant_edition_glows.webp'),
(4, 'Gray-Nicolls Pads', 'Pads', 2500.00, 6, 'sg_pad.webp'),
(5, 'Nike Cricket Shoes', 'Shoes', 3500.00, 12, 'sg_shoes6.webp'),
(6, 'New Balance Bat', 'Bat', 81500.00, 5, 'nb7.jpg'),
(7, 'New Balance Bat', 'Bat', 45000.00, 0, 'nb6.webp'),
(8, 'New Balance Gloves', 'Gloves', 800.00, 10, 'nb_gloves.webp'),
(9, 'New Balance Bat', 'Bat', 800.00, 7, 'ss1.webp'),
(10, 'New Balance Bat', 'Bat', 800.00, 6, 'ss2.webp'),
(11, 'DSC', 'Bat', 9500.00, 9, 'dsc.png'),
(12, 'knee-guard', 'guard', 850.00, 11, 'knee_guard.webp'),
(13, 'india-jercy', 'jercy', 1200.00, 9, 'odi.webp'),
(14, 'sg-bat2', 'Bat', 2500.00, 8, 'sg5.webp'),
(15, 'sg-kl', 'Shoes', 3500.00, 12, 'sg10.webp'),
(16, 'sg-wicketkeeper-gloves', 'gloves', 800.00, 5, 'sg_wicketKeeper_gloves.webp'),
(17, 'srh', 'jercy', 400.00, 5, 'srh.webp'),
(18, 'sg-shoose1', 'Shoes', 800.00, 10, 'sg_shoes2.webp'),
(19, 'sg-shoose1', 'Shoes', 800.00, 7, 'sg_shoes5.webp'),
(20, 'test_team_jercy', 'jercy', 900.00, 9, 'test_team_jercy.webp'),
(21, 'ss_gloves1', 'gloves', 850.00, 11, 'ss_gloves1.webp'),
(22, 'TENIS', 'Ball', 1200.00, 7, 'TENIS_PACK.webp'),
(23, 'NIVIA_TENIS', 'Ball', 2500.00, 7, 'NIVIA_TENIS.webp'),
(24, 'GT', 'jercy', 3500.00, 12, 'gt.webp'),
(25, 'RCB', 'jercy', 800.00, 5, 'rcb.webp'),
(26, 'srh', 'jercy', 400.00, 5, 'srh.webp'),
(27, 'sg-Kl', 'Bat', 800.00, 10, 'sg6.webp'),
(28, 'sg-shoose', 'Shoes', 800.00, 7, 'sg_glows2'),
(29, 'h1', 'Helmet', 9500.00, 6, 'h1.webp');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `purchased_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `product_id`, `quantity`, `price`, `total`, `purchased_at`) VALUES
(1, 1, 1, 1, 4500.00, 4500.00, '2025-09-19 14:08:25'),
(2, 1, 2, 2, 850.00, 1700.00, '2025-09-19 14:10:36'),
(3, 1, 2, 1, 850.00, 850.00, '2025-09-19 14:19:09'),
(4, 1, 2, 1, 850.00, 850.00, '2025-09-19 16:39:05'),
(27, 1, 7, 1, 45000.00, 45000.00, '2025-10-10 07:26:06'),
(28, 1, 7, 1, 45000.00, 45000.00, '2025-10-10 07:28:16'),
(29, 1, 7, 1, 45000.00, 45000.00, '2025-10-10 07:38:45'),
(30, 1, 7, 1, 45000.00, 45000.00, '2025-10-10 07:38:46'),
(32, 1, 4, 1, 2500.00, 2500.00, '2025-10-10 08:55:03'),
(33, 1, 4, 1, 2500.00, 2500.00, '2025-10-10 10:17:22'),
(34, 1, 2, 1, 850.00, 850.00, '2025-10-13 08:56:39'),
(35, 1, 3, 1, 1200.00, 1200.00, '2025-10-15 02:25:02'),
(36, 1, 3, 1, 1200.00, 1200.00, '2025-10-15 02:26:41'),
(37, 1, 3, 1, 1200.00, 1200.00, '2025-10-15 02:26:43'),
(38, 1, 3, 1, 1200.00, 1200.00, '2025-10-15 02:26:44'),
(39, 1, 29, 1, 9500.00, 9500.00, '2025-10-15 14:02:41'),
(40, 1, 29, 1, 9500.00, 9500.00, '2025-10-15 14:03:14'),
(41, 1, 22, 1, 1200.00, 1200.00, '2025-10-15 14:05:34'),
(42, 1, 3, 1, 1200.00, 1200.00, '2025-10-15 14:05:57'),
(43, 1, 3, 1, 1200.00, 1200.00, '2025-10-15 14:06:18'),
(44, 1, 2, 1, 850.00, 850.00, '2025-10-15 14:10:05'),
(45, 1, 22, 1, 1200.00, 1200.00, '2025-10-16 04:39:55'),
(46, 1, 29, 1, 9500.00, 9500.00, '2025-10-16 04:40:23'),
(47, 1, 23, 1, 2500.00, 2500.00, '2025-10-16 04:41:26'),
(48, 1, 10, 1, 800.00, 800.00, '2025-10-16 04:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'romit parmar', 'crazydivy0@gmail.com', '1211', 'user'),
(2, 'Dhyey', 'dhyey123@gmail.com', '1234', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
