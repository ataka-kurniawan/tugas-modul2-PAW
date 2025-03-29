-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 29, 2025 at 07:43 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web-crunchybite`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'kue basah'),
(7, 'kue kering');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `shipping_service` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `total_price` int NOT NULL,
  `order_status` enum('pending','processed','shipped') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `user_id`, `address`, `payment_method`, `shipping_service`, `quantity`, `total_price`, `order_status`, `created_at`) VALUES
(1, 26, '1', 'sdsdg', 'COD', 'JNE', 2, 100000, 'shipped', '2025-03-13 10:16:54'),
(2, 27, '1', 'ajansakd', 'E-Wallet', 'TIKI', 3, 60000, 'processed', '2025-03-13 10:17:27'),
(3, 31, '1', 'sad', 'Kartu Kredit', 'JNE', 3, 270000, 'processed', '2025-03-13 10:37:12'),
(4, 26, '1', 'sokaraja', 'Transfer Bank', 'JNE', 3, 150000, 'shipped', '2025-03-13 10:49:17'),
(5, 26, '1', 'sokaraja', 'E-Wallet', 'POS', 3, 150000, 'pending', '2025-03-13 11:29:33'),
(6, 40, '1', 'sokaraja', 'E-Wallet', 'POS', 3, 165000, 'pending', '2025-03-14 08:15:12'),
(7, 40, '1', 'karangnanas', 'E-Wallet', 'TIKI', 2, 110000, 'pending', '2025-03-14 16:17:35'),
(8, 40, '1', 'sokaraja', 'Transfer Bank', 'JNE', 2, 110000, 'pending', '2025-03-15 13:35:32');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `description` text,
  `category_id` int DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `stock`, `description`, `category_id`, `image`) VALUES
(39, 'Kastengel', 50000, 18, 'Kue kering gurih dengan rasa keju yang kaya, dipanggang hingga renyah dan ditaburi keju parut di atasnya.', 2, '67d30dc43274a.jpg'),
(40, 'nastar', 55000, 7, 'Kue isi selai nanas dengan tekstur lembut dan lumer di mulut. Memiliki rasa manis dan sedikit asam yang khas.', 7, '67d30dea6a118.jpg'),
(41, 'putri salju', 50000, 10, 'Kue kering berbentuk bulan sabit yang dilapisi gula halus, memberikan sensasi dingin saat digigit.', 7, '67d30e1343dee.jpg'),
(42, 'Kaastengels Keju Premium ', 60000, 6, 'Versi premium dari kastengel dengan keju yang lebih banyak dan tekstur lebih renyah. Cocok untuk pecinta keju!', 7, '67d30e3289848.jpg'),
(43, 'lapis legit', 75000, 12, 'Kue khas Indonesia dengan tekstur berlapis-lapis, aroma rempah yang kuat, dan rasa manis yang lezat.', 2, '67d311ab97d9e.jpg'),
(44, 'klepon', 15000, 9, 'Bola-bola ketan hijau berisi gula merah cair dan dilapisi kelapa parut. Meledak di mulut saat digigit!', 2, '67d311e17cc12.jpg'),
(45, 'dadar gulung', 20000, 7, 'Kue dadar berwarna hijau dengan isian parutan kelapa dan gula merah. Memiliki tekstur lembut dan manis.', 2, '67d312004d2a2.jpg'),
(46, 'Serabi Pandan', 25000, 6, 'Kue tradisional berbentuk bulat dengan rasa pandan yang harum, sering disajikan dengan saus gula merah.', 2, '67d3121d732f0.jpg'),
(47, 'bolu kukus', 30000, 8, 'Kue bolu yang dikukus hingga mengembang sempurna dengan tekstur lembut dan rasa manis yang pas.', 2, '67d3125aad147.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'ataka', 'ataka@gmail.com', '$2y$10$tB1hi3HgNlcTi06QTTsI7.EksuOQM/8t70zUBAGWIN59xSDugUB.S', 'customer', '2025-03-11 10:57:21'),
(2, 'admin', 'admin@gmail.com', '$2y$10$PV.1tN1YDse8Df1PCjRy0.C3YiblWwdhoBU4LKsJPY6SYffyczGaC', 'admin', '2025-03-11 10:58:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
