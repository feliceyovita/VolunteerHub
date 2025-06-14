-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 03:54 PM
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
-- Database: `volunteerhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `benefits` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type_of_volunteer` enum('donate','not donate') NOT NULL,
  `donation_amount` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL  -- UBAH dari longblob ke varchar untuk menyimpan nama file
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity`
(`id`, `title`, `date`, `benefits`, `location`, `contact`, `slot`, `description`, `type_of_volunteer`, `donation_amount`, `image`)
VALUES
-- Aktivitas 1
(2, 'Save Raja Ampat', '2025-06-20',
'Melestarikan keindahan alam Indonesia. Jangan sampai Raja Ampat hancur padahal belum sempat dikunjungi.',
'Raja Ampat', '081234567890', NULL,
'Selamatkan Raja Ampat!\r\nKita sudah kehilangan terlalu banyak, termasuk kekayaan alam dan keanekaragaman hayati akibat industri pertambangan. Kali ini Raja Ampat yang menjadi korbannya.\r\nGreenpeace Indonesia mengajak publik untuk mendesak pemerintah agar mengevaluasi dan mencabut izin pertambangan nikel di Indonesia, khususnya di Raja Ampat!',
'not donate', NULL, 'img1.png'),  -- Hanya nama file

-- Aktivitas 2
(3, 'Bersih-Bersih Pantai Bali', '2025-07-05',
'Membantu menjaga keindahan pantai Bali dari sampah plastik dan limbah wisata.',
'Pantai Kuta, Bali', '082233445566', 50,
'Ayo ikut bergabung dalam kegiatan bersih-bersih pantai bersama komunitas lokal dan relawan dari seluruh Indonesia!\r\nKegiatan ini tidak hanya membersihkan lingkungan, tetapi juga memberi edukasi kepada wisatawan tentang pentingnya tidak membuang sampah sembarangan.',
'not donate', NULL, 'img2.png'),  -- Hanya nama file

-- Aktivitas 3
(4, 'Tanam Seribu Pohon di Bogor', '2025-07-15',
'Berpartisipasi dalam penghijauan kota dan meminimalisir dampak pemanasan global.',
'Gunung Salak, Bogor', '089912345678', 100,
'Bersama relawan dan organisasi lingkungan, mari kita tanam seribu pohon di kawasan Gunung Salak untuk memulihkan ekosistem dan menambah ruang hijau di sekitar kita.\r\nSetiap pohon yang ditanam menjadi kontribusi nyata untuk masa depan bumi.',
'not donate', NULL, 'img3.png');  -- Hanya nama file

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `role` varchar(20) DEFAULT 'volunteer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone_number`, `birth_date`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123', '080808080808', '2015-06-01', 'admin'),
(3, 'dini', 'dinisahfitri@gmail.com', 'dini', NULL, NULL, 'volunteer'),
(4, 'felice', 'felice@gmail.com', '123456', NULL, NULL, 'volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_activity` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `reason_join` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`id`, `id_user`, `id_activity`, `name`, `email`, `phone_number`, `job`, `age`, `address`, `reason_join`) VALUES
(1, 3, 2, 'dini sahfitri', 'dinisahfitri@gmail.com', '081234123412', 'Agent CIA', 17, 'lombok', 'Raja Ampat akan hancur sebelum aku sempat melihat keindahannya? Tidak bisa dibiarkan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_volunteer_user` (`id_user`),
  ADD KEY `fk_volunteer_activity` (`id_activity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `fk_volunteer_activity` FOREIGN KEY (`id_activity`) REFERENCES `activity` (`id`),
  ADD CONSTRAINT `fk_volunteer_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;