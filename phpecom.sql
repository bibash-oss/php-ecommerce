-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2024 at 11:02 AM
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
-- Database: `phpecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`) VALUES
(37, 3, 2, 1, '2024-03-06 08:04:52'),
(38, 3, 1, 1, '2024-03-07 00:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`) VALUES
(11, 'Footwear', 'footwear', 'footwear ds lasd lsdkf ', 0, 1, '1708072249.jpg', 'Footwear', 'footwear ds lasd lsdkf ', 'footwear ds lasd lsdkf ', '2024-02-16 08:30:49'),
(12, 'Electronics', 'electronics', 'ElectronicsElectronicsElectronicsElectronics', 0, 1, '1708087055.jpg', 'Electronics', 'ElectronicsElectronicsElectronicsElectronics', 'ElectronicsElectronicsElectronicsElectronics', '2024-02-16 12:37:35'),
(13, 'Fashion', 'fashion', 'fashion kdfj la sdfkl j', 0, 1, '1708087183.jpg', 'Fashion', 'fashion kdfj la sdfkl j', 'fashion kdfj la sdfkl j', '2024-02-16 12:39:43'),
(14, 'Mobiles', 'mobiles', 'all kinds of mobiles', 0, 1, '1708096310.jpg', 'Mobiles', 'all kinds of mobiles', 'all kinds of mobiles', '2024-02-16 15:11:50'),
(15, 'Laptops', 'laptop', 'Laptops Laptops Laptops Laptops', 0, 1, '1708345020.png', 'Laptops', 'Laptops Laptops Laptops Laptops', 'Laptops Laptops Laptops Laptops', '2024-02-19 12:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` mediumtext NOT NULL,
  `pincode` int(191) NOT NULL,
  `total_price` int(191) NOT NULL,
  `payment_mode` varchar(191) NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_no`, `user_id`, `name`, `email`, `phone`, `address`, `pincode`, `total_price`, `payment_mode`, `payment_id`, `token`, `order_status`, `status`, `comments`, `created_at`) VALUES
(1, 'sharmacoder60823343', 1, 'bibash', 'bibash@bibash.com', '123343', 'testing address', 1234, 47997, 'COD', '', '', 0, 1, NULL, '2024-02-22 05:01:11'),
(2, 'sharmacoder14263343', 1, 'Bibash Shrestha', 'bibash@bibash.com', '123343', 'teasd  sadf', 1234, 47997, 'COD', '', '', 0, 1, NULL, '2024-02-22 05:09:05'),
(3, 'sharmacoder48883343', 1, 'Bibash Shrestha', 'bibash@bibash.com', '123343', '12dasdfasfd', 123, 15999, 'COD', '', '', 0, 1, NULL, '2024-02-22 05:24:32'),
(4, 'sharmacoder91523343', 1, 'Bibash Shrestha', 'bibash@bibash.com', '123343', 'asd asdf asd scvv', 123, 47997, 'COD', '', '', 0, 0, NULL, '2024-02-22 05:41:43'),
(5, 'bibash8387dfa', 1, 'sdf', 'bibash@bibash.com', 'addfa', 'asdasd', 0, 1000, 'COD', '', '', 0, 0, NULL, '2024-02-25 05:08:35'),
(6, 'bibash69733343', 1, 'bibash', 'bibash@bibash.com', '123343', 'asdf', 123, 2000, 'Paid by paypal', 'VbGJXy3HXYkfNmq6pxCuG8', '', 0, 0, NULL, '2024-03-05 13:52:14'),
(7, 'bibash66883343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdf', 123, 47997, 'Paid by paypal', '3v7JeEkdfkaGssjVsiJTfY', '', 0, 0, NULL, '2024-03-05 13:56:05'),
(8, 'bibash27953343', 1, 'bibash', 'bibash@bibash.com', '123343', 'asd', 0, 15999, 'Paid by paypal', 'cH3XdiE9rch38tmRRxG4wB', '', 0, 0, NULL, '2024-03-05 14:00:35'),
(9, 'bibash34233343', 1, 'bibash', 'bibash@bibash.com', '123343', 'asdasd', 0, 1000, 'Paid by Khalti', 'SrM4XdaRMSfBv6LP2y9Y7V', '', 0, 0, NULL, '2024-03-05 14:18:08'),
(10, 'bibash86773343', 1, 'bibash', 'bibash@bibash.com', '123343', 'ddfgfdg', 2324, 1000, 'Paid by Khalti', 'qTGLLMV4Lj4RyzEe5rzPG7', '', 0, 0, NULL, '2024-03-05 14:22:34'),
(11, 'bibash53953343', 1, 'bibash', 'bibash@bibash.com', '123343', 'asdfs', 2323, 120000, 'Paid by Khalti', 'SFGJMcMhTfHM9rpMpvQaRi', '', 0, 0, NULL, '2024-03-05 14:23:54'),
(12, 'bibash20313343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sxc', 122, 4500, 'Paid by Khalti', 'xNadtN3rfRJEhZVHW3CEyE', '', 0, 0, NULL, '2024-03-05 14:28:24'),
(13, 'bibash47393343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdfg ', 123, 4500, 'Paid by Khalti', 'SQLvhUT73BFvJ4L99CVyu2', '', 0, 0, NULL, '2024-03-05 14:30:13'),
(14, 'bibash54593343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdf ', 2323, 15999, 'Paid by Khalti', 'LV72onB22UvTjL9saE7jjB', '', 0, 0, NULL, '2024-03-05 14:32:34'),
(15, 'bibash34233343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdf ', 111, 4500, 'Paid by Khalti', 'miZTwpuAh7S7a2Rqw5DTZ8', 'aL2WLQP7stEYNDBUbjwtAd', 0, 0, NULL, '2024-03-05 14:35:25'),
(16, 'bibash6565334', 1, 'bibash', 'bibash@bibash.com', '12334', 'dsf', 23324, 120000, 'Paid by Khalti', 'WADQByu2LQZ6RJzYLrmFRY', 'EMcMRCQsPi6Gcc3BhCC3mA', 0, 0, NULL, '2024-03-05 16:36:34'),
(17, 'bibash12023343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdf', 12, 1000, 'COD', '', '', 0, 0, NULL, '2024-03-05 16:38:23'),
(18, 'bibash47953343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdfsd ', 123, 1000, 'COD', '', '', 0, 0, NULL, '2024-03-05 16:45:19'),
(19, 'bibash33923343', 1, 'bibash', 'bibash@bibash.com', '123343', 'dsfsd ', 234, 1000, 'COD', '', '', 0, 0, NULL, '2024-03-05 16:46:47'),
(20, 'bibash44253343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdf ', 123, 1000, 'COD', '', '', 1, 0, NULL, '2024-03-05 16:49:58'),
(21, 'bibash68953343', 1, 'bibash', 'bibash@bibash.com', '123343', 'afsd fsd ', 123, 15999, 'Paid by Khalti', 'LKvivmmY5JTfZzDAAa9spC', '2JLbvcVUbQo8YpUTVtppyb', 0, 0, NULL, '2024-03-05 16:51:29'),
(22, 'bibash30893343', 1, 'bibash', 'bibash@bibash.com', '123343', 'eresd', 123, 15999, 'Paid by Khalti', 'UdawsMAkt5vDEhnM7XsjuM', 'cLbodhLngozouEEnHQ2add', 0, 0, NULL, '2024-03-05 16:53:35'),
(23, 'bibash63683343', 1, 'bibash', 'bibash@bibash.com', '123343', 'asd', 123343, 4500, 'Paid by Khalti', '7qfWa6kyYbrvGhzqFh6y2m', 'CWjhCS75mtpLBnzLm8c2cJ', 0, 0, NULL, '2024-03-05 16:59:07'),
(24, 'bibash262334', 1, 'bibash', 'bibash@bibash.com', '1234', 'ewrwer', 1234, 1000, 'Paid by Khalti', 'UHAUhweUjdFkhnX2JHLwTH', 'dBeV5xBM6vvyJhfXEYYVkm', 0, 0, NULL, '2024-03-05 17:02:44'),
(25, 'bibash80483', 1, 'bibash', 'bibash@bibash.com', '123', 'zx', 123, 1000, 'Paid by Khalti', 'kbh2bxfrtWq7sMcedZHRxT', 'THSnMHd3pwShM6xsptvfgL', 0, 0, NULL, '2024-03-05 17:04:09'),
(26, 'bibash96333343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdf dfg', 1234, 1000, 'Paid by Khalti', 'fYbYH3U5qZ4qCdob6DNehZ', 'qvGzDLdUBWgDpR3hRFvaEX', 0, 0, NULL, '2024-03-05 17:06:55'),
(27, 'bibash43153343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdg', 123, 4500, 'Paid by Khalti', 'zRMDrK4ykCeZ7QZvDc7jZE', 'ybi966M8FPwMdJP3YgGPoX', 0, 0, NULL, '2024-03-05 17:10:37'),
(28, 'bibash17493343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sdf fsd', 123, 1000, 'Paid by Khalti', 'XqM993cMKNHkFr6KQfnCc4', 'L2BesYmg7BSJfw8zqoLkjd', 0, 0, NULL, '2024-03-05 17:15:59'),
(29, 'bibash99783343', 1, 'bibash', 'bibash@bibash.com', '123343', 'xcv dfg ', 123, 15999, 'Paid by Khalti', 'QjK4WRb45WK8AM2YzCSdaB', 'XMTUJkR6XF2uFmocaTnBYW', 0, 0, NULL, '2024-03-05 17:32:01'),
(30, 'bibash88253343', 1, 'bibash', 'bibash@bibash.com', '123343', 'df sdf ', 123, 1000, 'Paid by Khalti', 'rquj8ptkPSGcf4RdL47QmG', 'm3u5frDCGgPnin8qeEUYFS', 1, 0, NULL, '2024-03-05 17:38:39'),
(31, 'bibash19823343', 1, 'bibash', 'bibash@bibash.com', '123343', 'zxc sdf ', 123, 1000, 'Paid by Khalti', 'N7p5ahgnZVNqErn8yfmYcM', 'PgPk4wjQBPtrimv9cYb4RG', 0, 0, NULL, '2024-03-05 17:41:15'),
(32, 'bibash13593343', 3, 'test', 'test@gmail.com', '123343', 'dfe  sdf', 123, 1000, 'Paid by Khalti', '8vZWprgGsL4ndzALmsNgeS', 'VGLiMwmnsDC2gvAEJQsVn2', 0, 0, NULL, '2024-03-06 05:15:17'),
(33, 'bibash35823343', 3, 'test', 'test@gmail.com', '123343', 'sf ', 12, 15999, 'COD', '', '', 1, 0, NULL, '2024-03-06 05:18:17'),
(34, 'bibash14943343', 1, 'bibash', 'bibash@bibash.com', '123343', 'sd sdf ', 123, 1000, 'Paid by Khalti', 'E2hM4HeAfdKe6fb7bazVNJ', 'Qpsi6iBiepbujfqWe8xHmL', 0, 0, NULL, '2024-03-07 08:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(191) NOT NULL,
  `prod_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` int(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`) VALUES
(1, 1, 1, 3, 15999, '2024-02-22 05:01:11'),
(2, 2, 1, 3, 15999, '2024-02-22 05:09:05'),
(3, 3, 1, 1, 15999, '2024-02-22 05:24:32'),
(4, 4, 1, 3, 15999, '2024-02-22 05:41:43'),
(5, 5, 2, 1, 1000, '2024-02-25 05:08:35'),
(6, 6, 2, 2, 1000, '2024-03-05 13:52:14'),
(7, 7, 1, 3, 15999, '2024-03-05 13:56:05'),
(8, 8, 1, 1, 15999, '2024-03-05 14:00:35'),
(9, 9, 2, 1, 1000, '2024-03-05 14:18:08'),
(10, 10, 2, 1, 1000, '2024-03-05 14:22:34'),
(11, 11, 7, 1, 120000, '2024-03-05 14:23:54'),
(12, 12, 8, 1, 4500, '2024-03-05 14:28:24'),
(13, 13, 8, 1, 4500, '2024-03-05 14:30:13'),
(14, 14, 1, 1, 15999, '2024-03-05 14:32:34'),
(15, 15, 8, 1, 4500, '2024-03-05 14:35:25'),
(16, 16, 7, 1, 120000, '2024-03-05 16:36:34'),
(17, 17, 2, 1, 1000, '2024-03-05 16:38:23'),
(18, 18, 2, 1, 1000, '2024-03-05 16:45:19'),
(19, 19, 2, 1, 1000, '2024-03-05 16:46:47'),
(20, 20, 2, 1, 1000, '2024-03-05 16:49:58'),
(21, 21, 1, 1, 15999, '2024-03-05 16:51:29'),
(22, 22, 1, 1, 15999, '2024-03-05 16:53:35'),
(23, 23, 8, 1, 4500, '2024-03-05 16:59:07'),
(24, 24, 2, 1, 1000, '2024-03-05 17:02:44'),
(25, 25, 2, 1, 1000, '2024-03-05 17:04:09'),
(26, 26, 2, 1, 1000, '2024-03-05 17:06:56'),
(27, 27, 8, 1, 4500, '2024-03-05 17:10:37'),
(28, 28, 2, 1, 1000, '2024-03-05 17:15:59'),
(29, 29, 1, 1, 15999, '2024-03-05 17:32:01'),
(30, 30, 2, 1, 1000, '2024-03-05 17:38:39'),
(31, 31, 2, 1, 1000, '2024-03-05 17:41:15'),
(32, 32, 2, 1, 1000, '2024-03-06 05:15:17'),
(33, 33, 1, 1, 15999, '2024-03-06 05:18:17'),
(34, 34, 2, 1, 1000, '2024-03-07 08:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `small_description` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`) VALUES
(1, 14, 'Redmi note 7', 'redmi note 7', 'redmi note 7 is a  good phoine', 'redmi note 7 is a  good phoineredmi note 7 is a  good phoineredmi note 7 is a  good phoine', 17999, 15999, '1708085275.jpg', 8, 0, 1, 'Redmi note 7', 'Redmi note 7', 'Redmi note 7', '2024-02-16 12:07:55'),
(2, 13, 'Shirt black men', 'Shirt black men', 'Shirt black men Shirt black men Shirt black men', 'Shirt black men Shirt black men Shirt black men', 1500, 1000, '1708087288.jpg', 8, 0, 1, 'Shirt black men', 'Shirt black men Shirt black men Shirt black men', 'Shirt black men Shirt black men Shirt black men', '2024-02-16 12:41:28'),
(7, 15, 'MSI GF63', 'msi gf63', 'MSI GF63 MSI GF63', 'MSI GF63 MSI GF63 MSI GF63 MSI GF63', 150000, 120000, '1708743889.jpg', 13, 0, 1, 'MSI GF63', 'MSI GF63 MSI GF63 MSI GF63 MSI GF63', 'MSI GF63 MSI GF63 MSI GF63 MSI GF63', '2024-02-24 03:04:49'),
(8, 12, 'Hard Drive', 'hard drive', 'Hard Drive Hard Drive', 'Hard Drive Hard Drive Hard Drive Hard Drive Hard Drive Hard Drive ', 5000, 4500, '1708744000.jpg', 15, 0, 1, 'Hard Drive', 'Hard Drive Hard Drive Hard Drive Hard Drive Hard Drive Hard Drive ', 'Hard Drive Hard Drive Hard Drive Hard Drive Hard Drive Hard Drive ', '2024-02-24 03:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` int(10) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role_as`, `created_at`) VALUES
(1, 'bibaah', 'bibash@bibash.com', 2147483647, '1234', 1, '2024-02-09 06:30:57'),
(3, 'test', 'test@gmail.com', 123455676, '1234', 0, '2024-02-11 13:30:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
