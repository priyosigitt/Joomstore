-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2020 at 04:18 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joomstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(4, 'mouse-gaming', 'Mouse Gaming'),
(5, 'keyboard-gaming', 'Keyboard Gaming'),
(6, 'headset-gaming', 'Headset Gaming'),
(7, 'mousepad', 'Mousepad');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(1, 2, '2020-04-30', '220200430104254', 9000000, 'Indana Rishi', 'Jl. Tentara Pelajar No 4 GedangAsri Ungaran Timur', '082235022323', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 1, 'Indana', '01010100110', 10000000, '-', '220200430104254-20200430104414.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 1, 4000000),
(2, 1, 5, 1, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(7, 4, 'steelseries-rival-600-gaming-mouse', 'Steelseries Rival 600 Gaming Mouse', 'Dikembangkan dengan tiga prinsip dasar kinerja revolusioner, ketahanan yang tidak nyata, dan fleksibilitas yang kuat, Rival 600 memberikan saat para profesional membutuhkannya, dalam pertempuran.\r\n60-Juta Klik Saklar Mekanik.\r\n\r\nKiri / kanan klik fitur re', 1175000, 1, 'steelseries-rival-600-gaming-mouse-20200507210137.jpg'),
(8, 4, 'logitech-g300s-gaming-mouse', 'Logitech G300S Gaming Mouse', 'Specifications:\r\n- 9 PROGRAMMABLE CONTROLS\r\n- ONBOARD MEMORY PROFILES\r\n- EASY-TO-USE CONFIGURATION SOFTWARE\r\n\r\nTECHNICAL SPECIFICATIONS\r\nTracking\r\nResolution: 250 2,500 dpi\r\nMax. acceleration: >20G*\r\nMax Speed: 60 ips (1.5m/s)', 209000, 1, 'logitech-g300s-gaming-mouse-20200507210327.png'),
(9, 4, 'steelseries-rival-310-black-with-truemove3-costom-sensor', 'Steelseries Rival 310 Black With TrueMove3 Costom Sensor', 'Pertama di Dunia Benar 1 sampai 1 Esports Sensor\r\n\r\nTeknologi sensor TrueSove3 milik SteelSeries memiliki 1 sampai 1 pelacakan untuk latensi ultra-rendah dan akurasi yang tepat.\r\nTombol Split-Trigger Eksklusif\r\n\r\nDengan menawarkan switch mekanik 50 juta k', 790000, 1, 'steelseries-rival-310-black-with-truemove3-costom-sensor-20200507210429.jpg'),
(10, 5, 'steelseries-apex-m750-mechanical-rgb-with-led', 'Steelseries Apex M750 (Mechanical RGB with LED)', 'Bahan Atas: Paduan Aluminium Seri 5000\r\nN-Key Roll Over: 104-Key (Semua)\r\nAnti-Ghosting\r\nIluminasi: RGB per-kunci yang dapat dikontrol secara individual, termasuk pola keyboard keseluruhan, dan efek pengetikan reaktif.\r\nBerat: 1 kg / 2,2 lbs\r\nTinggi: 153,', 2080000, 1, 'steelseries-apex-m750-mechanical-rgb-with-led-20200507210615.png'),
(11, 5, 'steelseries-apex-7-fullsize-mechanical-keyboard-gaming-rgb-red-switch', 'Steelseries Apex 7 Fullsize - Mechanical Keyboard Gaming RGB - Red Switch', 'Top Material : Aircraft Grade Aluminum Alloy Frame\r\nN-Key Roll Over : 104-Key\r\nAnti-Ghosting :100%\r\nIllumination :Dynamic Per Key RGB Illumination\r\nLifetime : 50 Million Keypresses\r\nComopatibility\r\nOS : Windows and Mac OS X. USB port required', 2499000, 1, 'steelseries-apex-7-fullsize-mechanical-keyboard-gaming-rgb-red-switch-20200507210757.jpg'),
(12, 5, 'steelseries-apex-pro-tkl', 'Steelseries Apex Pro TKL', 'Type & Name\r\nOmniPoint Adjustable Mechanical Switch (Analog Hall Effect Magnetic Sensor)\r\nActuation Point : 0.4mm to 3.6mm (More info)\r\nForce : 45cN\r\nResponse Time : 0.7ms (More info)\r\nLifetime : 100 Million Keypresses', 2750000, 1, 'steelseries-apex-pro-tkl-20200507210919.jpg'),
(13, 7, 'steelseries-qck-mini', 'Steelseries Qck mini', 'Perfect Mouse Tracking\r\nTested by the top mouse sensor manufacturer, the high thread count and surface variation optimize tracking accuracy for both optical and laser sensors with minimal friction.\r\nRubber Base\r\nLike many SteelSeries mousepads, the QcK Mi', 170000, 1, 'steelseries-qck-mini-20200507211037.jpg'),
(14, 7, 'steelseries-qck-prism', 'Steelseries Qck Prism', 'Deskripsi Produk\r\n360-degree 12 zone Prism RGB Illumination\r\nDual-Textured Surface\r\nGameSense Lighting Support\r\nPrismSync Support', 980000, 1, 'steelseries-qck-prism-20200507211144.jpg'),
(15, 6, 'steelseries-arctis-3-black-with-71-surround-putih', 'Steelseries Arctis 3 Black with 7.1 Surround - Putih', 'Features :\r\n- Arctis perfectly contours to your head while evenly distributing the weight of the headset across the entire Ski Goggle band.\r\n- The ClearCast microphone uses a proprietary bidirectional design delivering unmatched sound clarity and backgrou', 1000000, 1, 'steelseries-arctis-3-black-with-71-surround-putih-20200507211250.jpg'),
(16, 6, 'headphone-steelseries-arctis3', 'Headphone Steelseries Arctis3', 'The best headset for everywhere you game.\r\n- Discord certified clear cast noise canceling microphones for clear, natural sounding voice comm on all platforms\r\n- Artis signature soundscape emphasizes critical sounds tibhive you an audio advantage\r\n- Play a', 1430000, 1, 'headphone-steelseries-arctis3-20200507211402.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(3, 'admin', 'admin@joomstore.local', '$2y$10$0IdqKeGW2nauMX/83U8fUuCCgVcWR90Gts35Ya2JxvBfmy5S8dQJa', 'admin', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
