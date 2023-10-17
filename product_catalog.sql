-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 01:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_catalog`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `type_id`) VALUES
(1, 'Oversized short sleeve T-shirt', 10.99, NULL, 1),
(2, 'Eye of Providence print T-Shirt', 19.99, NULL, 1),
(3, 'Oversized Blue T-Shirt', 5.00, NULL, 1),
(4, 'Oversized short sleeve T-Shirt', 12.00, NULL, 1),
(5, 'Dark green short sleeve T-Shirt', 9.99, NULL, 1),
(6, 'Yellow short sleeve with print T-Shirt', 9.99, NULL, 1),
(7, 'Light green short sleeve T-Shirt', 12.00, NULL, 1),
(8, 'Light purple short sleeve T-Shirt', 3.50, NULL, 1),
(9, 'Purple short sleeve T-Shirt', 10.99, NULL, 1),
(10, 'Red short sleeve T-Shirt', 6.99, NULL, 1),
(11, 'White short sleeve with print T-Shirt', 15.00, NULL, 1),
(12, 'White short sleeve T-Shirt', 10.00, NULL, 1),
(13, 'Yellow hoodie with print', 35.99, NULL, 2),
(14, 'White hoodie', 25.00, NULL, 2),
(15, 'Black & Yellow hoodie with print', 40.99, NULL, 2),
(16, 'Lite Coffe hoodie', 15.00, NULL, 2),
(17, 'Blue cyan gradient sweatshirt with print', 28.99, NULL, 2),
(18, '\"Simple\" cyan bucket hat with print', 20.00, NULL, 3),
(19, 'Blue baseball cap with print', 12.99, NULL, 3),
(20, 'Green & White cap', 7.99, NULL, 3),
(21, '\"Simple\" White cap', 4.99, NULL, 3),
(22, '\"Simple\" Pink skateboarding sneakers', 180.00, NULL, 4),
(23, 'Bold Winter sneakers', 85.99, NULL, 4),
(24, 'Classic Slip On CHECKERS sneakers', 190.00, NULL, 4),
(25, 'White sports sneakers', 90.99, NULL, 4),
(26, '\"OLYMPIC\" Black sports sneakers', 120.00, NULL, 4),
(27, 'Black running sneakers with print', 70.99, NULL, 4),
(28, 'White running sneakers with print', 50.00, NULL, 4),
(29, 'Black & RED - FAZe running shoes', 110.99, NULL, 4),
(30, 'White classic sneakers', 65.90, NULL, 4),
(31, 'Red classic sneakers', 70.00, NULL, 4),
(32, 'Purple DALL·E sports sneakers', 250.00, NULL, 4),
(33, 'Brown leather shoes', 12.00, NULL, 4),
(34, 'Mix Color sport sneakers', 69.99, NULL, 4),
(35, 'Black shoes', 40.00, NULL, 4),
(36, 'White sports sneakers', 75.00, NULL, 4),
(37, 'Blue sports trainers', 55.99, NULL, 4),
(38, 'Orange Blue mix city backpack', 34.99, NULL, 5),
(39, 'Orange leather strap bag', 220.00, NULL, 5),
(40, 'Dark green city Minimal backpack', 56.99, NULL, 5),
(41, 'Minimalistic school backpack', 22.99, NULL, 5),
(42, 'Grey backpack', 20.00, NULL, 5),
(43, 'Linen sports bag with print', 15.00, NULL, 5),
(44, 'Linen Tote bag with print', 12.99, NULL, 5),
(45, 'Linen small wallet bag with print', 10.00, NULL, 5),
(46, 'Linen small herbal bag with print', 4.99, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`) VALUES
(1, 1, 'tshirt1_image1_cd490c10-69fa-11ee-8c99-0242ac120002.png'),
(2, 2, 'tshirt2_image1_cd4907ce-69fa-11ee-8c99-0242ac120002.png'),
(3, 3, 'tshirt3_image1_cd490486-69fa-11ee-8c99-0242ac120002.png'),
(4, 4, 'tshirt4_image1_cd490620-69fa-11ee-8c99-0242ac120002.png'),
(5, 5, 'tshirt5_image1_cd49094a-69fa-11ee-8c99-0242ac120002.png'),
(6, 6, 'tshirt6_image1_cd48fefa-69fa-11ee-8c99-0242ac120002.png'),
(7, 7, 'tshirt7_image1_cd491804-69fa-11ee-8c99-0242ac120002.png'),
(8, 8, 'tshirt8_image1_cd491930-69fa-11ee-8c99-0242ac120002.png'),
(9, 9, 'tshirt9_image1_cd48f1f8-69fa-11ee-8c99-0242ac120002.png'),
(10, 10, 'tshirt10_image1_cd490ad0-69fa-11ee-8c99-0242ac120002.png'),
(11, 11, 'tshirt10_image1_cd490f62-69fa-11ee-8c99-0242ac120002.png'),
(12, 12, 'tshirt11_image1_cd491642-69fa-11ee-8c99-0242ac120002.png'),
(13, 13, 'hoodie1_image1_1b66813a-6a68-11ee-8c99-0242ac120002.png'),
(14, 14, 'hoodie2_image1_1b66840a-6a68-11ee-8c99-0242ac120002.png'),
(15, 15, 'hoodie3_image1_1b668536-6a68-11ee-8c99-0242ac120002.png'),
(16, 16, 'hoodie4_image1_1b668644-6a68-11ee-8c99-0242ac120002.png'),
(17, 17, 'sweatshirt1_image1_2edae238-6a68-11ee-8c99-0242ac120002.png'),
(20, 18, 'cap1_image1_83f26b42-6a6d-11ee-8c99-0242ac120002.png'),
(21, 19, 'cap2_image1_83f26fe8-6a6d-11ee-8c99-0242ac120002.png'),
(22, 19, 'cap2_image2_83f27128-6a6d-11ee-8c99-0242ac120002.png'),
(23, 19, 'cap2_image3_83f27240-6a6d-11ee-8c99-0242ac120002.png'),
(24, 20, 'cap3_image1_83f268fe-6a6d-11ee-8c99-0242ac120002.png'),
(25, 21, 'cap4_image1_83f27344-6a6d-11ee-8c99-0242ac120002.png'),
(26, 22, 'footwear1-image1_f634494e-6a88-11ee-8c99-0242ac120002.png'),
(27, 22, 'footwear1-image2_f6344d18-6a88-11ee-8c99-0242ac120002.png'),
(28, 22, 'footwear1-image3_f6344ea8-6a88-11ee-8c99-0242ac120002.png'),
(29, 23, 'footwear2-image1_f63451c8-6a88-11ee-8c99-0242ac120002.png'),
(30, 23, 'footwear2-image2_f6345510-6a88-11ee-8c99-0242ac120002.png'),
(31, 24, 'footwear3_image1_f6345772-6a88-11ee-8c99-0242ac120002.png'),
(32, 24, 'footwear3_image2_f6345984-6a88-11ee-8c99-0242ac120002.png'),
(33, 24, 'footwear3_image3_f6345b82-6a88-11ee-8c99-0242ac120002.png'),
(34, 24, 'footwear3_image4_f6345d62-6a88-11ee-8c99-0242ac120002.png'),
(35, 25, 'footwear4-image1_f63460c8-6a88-11ee-8c99-0242ac120002.png'),
(36, 25, 'footwear4_image2_f63464ba-6a88-11ee-8c99-0242ac120002.png'),
(37, 26, 'footwear6_image1_f63467b2-6a88-11ee-8c99-0242ac120002.png'),
(38, 26, 'footwear7_image1_f6346a50-6a88-11ee-8c99-0242ac120002.png'),
(39, 27, 'footwear8_image1_f6346d66-6a88-11ee-8c99-0242ac120002.png'),
(40, 28, 'footwear9_image1_6ae3adec-6a8a-11ee-8c99-0242ac120002.png'),
(41, 29, 'footwear10_image1_6ae3b260-6a8a-11ee-8c99-0242ac120002.png'),
(42, 30, 'footwear11_image1_6ae3ba58-6a8a-11ee-8c99-0242ac120002.png'),
(43, 31, 'footwear12_image1_6ae3bc9c-6a8a-11ee-8c99-0242ac120002.png'),
(44, 32, 'footwear13_imagge1_6ae3bed6-6a8a-11ee-8c99-0242ac120002.png'),
(45, 33, 'footwear14-image1_c9c9ae34-6b74-11ee-b962-0242ac120002.png'),
(46, 34, 'footwear15-image1_c9c9b0e6-6b74-11ee-b962-0242ac120002.png'),
(47, 35, 'footwear16-image1_c9c9b230-6b74-11ee-b962-0242ac120002.png'),
(48, 36, 'footwear17-image1_c9c9b366-6b74-11ee-b962-0242ac120002.png'),
(49, 37, 'footwear19-image1_c9c9b4b0-6b74-11ee-b962-0242ac120002.png'),
(50, 37, 'footwear19-image2_c9c9b9e2-6b74-11ee-b962-0242ac120002.png'),
(51, 38, 'backpack1_image1_2dbc4e0e-6a8c-11ee-8c99-0242ac120002.png'),
(52, 39, 'backpack2_image1_2dbc5278-6a8c-11ee-8c99-0242ac120002.png'),
(53, 40, 'backpack3_image1_2dbc5688-6a8c-11ee-8c99-0242ac120002.png'),
(54, 41, 'backpack4_image1_2dbc585e-6a8c-11ee-8c99-0242ac120002.png'),
(55, 42, 'backpack5_image1_2dbc59e4-6a8c-11ee-8c99-0242ac120002.png'),
(56, 43, 'bag1_image1_2dbc5c14-6a8c-11ee-8c99-0242ac120002.png'),
(57, 44, 'bag2_image1_2dbc5dfe-6a8c-11ee-8c99-0242ac120002.png'),
(58, 45, 'bag3_image1_2dbc6010-6a8c-11ee-8c99-0242ac120002.png'),
(59, 46, 'bag4_image1_2dbc636c-6a8c-11ee-8c99-0242ac120002.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`id`, `name`) VALUES
(1, 'T-shirts'),
(2, 'Sweatshirts and hoodies'),
(3, 'Caps and hats'),
(4, 'Footwear'),
(5, 'Bags and backpacks');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `product_types` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
