-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 03:52 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xdb_belajar_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL COMMENT 'id table',
  `nama` varchar(100) NOT NULL COMMENT 'nama karyawan',
  `alamat` varchar(500) NOT NULL COMMENT 'alamat tempat tinggal karyawan',
  `no_telepon` varchar(15) DEFAULT NULL COMMENT 'nomor telepon',
  `gol_darah` varchar(2) DEFAULT NULL COMMENT 'golongan darah',
  `jenis_kelamin` char(1) NOT NULL COMMENT 'jenis kelamin',
  `departemen_id` int(11) DEFAULT NULL,
  `jabatan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `alamat`, `no_telepon`, `gol_darah`, `jenis_kelamin`, `departemen_id`, `jabatan_id`) VALUES
(1, 'Aji ', 'Bedahulu No. 15 no 14', '081802164109', 'A', 'L', 3, 1),
(2, 'Ronaldo', '', NULL, 'B', 'L', 1, 3),
(4, 'Haji Aming', 'Argentina', NULL, '', 'L', NULL, NULL),
(6, 'Ami', 'Jakarta Selatan', '0219807657', 'AB', 'P', 2, NULL),
(7, 'Prabowo', 'Jalan Cendana', NULL, 'B', 'L', NULL, NULL),
(8, 'gibran', 'Jalan Cendana', NULL, 'O', 'L', NULL, NULL),
(9, 'Ronaldinho', 'Ciwaruga', NULL, 'A', 'L', NULL, NULL),
(10, 'Flavio', 'Corintians', NULL, 'A', 'L', NULL, NULL),
(11, 'golang', 'califirnia', NULL, 'B', 'L', NULL, NULL),
(12, 'fdg', 'gfdg', NULL, 'A', 'L', NULL, NULL),
(13, '', '', NULL, '', '', NULL, NULL),
(14, 'Elang', 'Jakarta', NULL, 'A', 'L', NULL, NULL),
(15, 'Berisik', 'Kebon Jeruk', NULL, 'A', 'L', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_departemen`
--

CREATE TABLE `master_departemen` (
  `id` int(11) NOT NULL,
  `kode` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_departemen`
--

INSERT INTO `master_departemen` (`id`, `kode`, `nama`) VALUES
(1, 'HR', 'Haman Resources'),
(2, 'FIN', 'Finance'),
(3, 'IT', 'Information Technology'),
(4, 'MAR', 'Marketing'),
(5, 'PUR', 'Purchasing'),
(6, 'GA', 'General Affair');

-- --------------------------------------------------------

--
-- Table structure for table `master_jabatan`
--

CREATE TABLE `master_jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `deskripsi` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_jabatan`
--

INSERT INTO `master_jabatan` (`id`, `nama`, `role`, `deskripsi`) VALUES
(1, 'Manager ICT', '', 'Manager yang melakukan pengaturan ICT di Perusahaan PT Lumbung Abadi'),
(2, 'Asisstant Manager Operasional  ICT', '', 'Membantu operasional terkait aplikasi bisnis perusahaan '),
(3, 'Assistant Manager Jaringan ICT', '', 'Bertanggung jawab untuk melakukan pengistalan perangkat lunak atau jaringan'),
(4, 'Asisstant Manager Software', '', 'Bertanggung jawab untuk melakukan penginstalan software perusahaan'),
(5, 'Officer', 'Programmer', 'Programmer bertugas mengembangkan aplikasi atau software perusahaan'),
(6, 'Officer', 'System Analyst', 'Bertugas menganalisis kebutuhan pengembangan aplikasi'),
(7, 'Officer', 'Admin', 'BErtugas menagani kebutuhhan administrasi departemen ');

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori`
--

CREATE TABLE `master_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_kategori`
--

INSERT INTO `master_kategori` (`id`, `nama`, `deskripsi`) VALUES
(1, 'Makanan Instan', 'Makan instan dalam bentuk sachet atau kaleng'),
(2, 'Cemilan', 'Cemilan adalah makanan ringan dalam bentuk sachet atau bungkusan yang memmiliki porsi kecil dan tidak membuat kenyang'),
(3, 'Minuman', 'Minuman kemasan, baik dalam bentuk botol, kaleng atau kotak');

-- --------------------------------------------------------

--
-- Table structure for table `master_produk`
--

CREATE TABLE `master_produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `dibuat_kapan` datetime NOT NULL,
  `diperbaharui_oleh` int(11) DEFAULT NULL,
  `diperbaharui_kapan` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_produk`
--

INSERT INTO `master_produk` (`id`, `kode`, `nama`, `deskripsi`, `id_kategori`, `dibuat_oleh`, `dibuat_kapan`, `diperbaharui_oleh`, `diperbaharui_kapan`) VALUES
(2, 'SP-BBR', 'Super Bubur', 'Bubur instan tinggal seduh dengan air panas', 1, 0, '2024-07-02 14:21:16', 0, '2024-07-02 14:21:16'),
(3, ' ', 'Basreng', 'Makanan kampung baso goreng', 2, 1, '2024-07-08 19:42:14', NULL, NULL),
(4, 'BTG', 'Baso Tusuk Gemoy', 'Basok mengenyangkan', 2, 1, '2024-07-02 22:19:44', NULL, NULL),
(11, 'Teh', 'Teh Seduh', 'Teh Seduh yang disediakan kantor', 3, 1, '2024-07-08 17:06:47', NULL, NULL),
(12, 'Kopi', 'Kopi', 'Kopi yang disediakan kantor', 3, 1, '2024-07-08 17:07:10', NULL, NULL),
(13, 'Cappucino', 'Cappucino', 'Cappucino ambil sendiri', 3, 1, '2024-07-08 17:07:35', NULL, NULL),
(14, 'Lemper', 'Lemper Stasiun Gambir', 'Lemper Stasiun Gambir lantai 2', 2, 1, '2024-07-08 17:08:16', NULL, NULL),
(15, 'Gudeg', 'Gudeg', 'Gudeg yu Djum', 1, 1, '2024-07-08 17:08:46', NULL, NULL),
(16, 'Bakso', 'Bakso Mesjid Matraman', 'Bakso', 1, 1, '2024-07-08 17:09:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id` int(11) NOT NULL,
  `kode_produk` varchar(10) NOT NULL,
  `stok_masuk` int(11) NOT NULL,
  `stok_keluar` int(11) NOT NULL,
  `stok_sisa` int(11) NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `dibuat_kapan` datetime NOT NULL,
  `diperbarui_oleh` int(11) NOT NULL,
  `diperbarui_kapan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'gagan_suryanagara', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Gagan Suryanagara'),
(2, 'jokowi', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Joko Widodo'),
(3, 'persib', '$2a$10$67Tz5y6/ayxh/CbteSd85OBvJB0K8HqD0j7zBszssQN3gaAyNQLi.', 'persib juara'),
(4, 'anis.bw', '$2a$10$9g8I5zHHuuKbDy4O.GQBPevHI3V9DaFwKWXmgmbB.wGMz6/geR/2K', 'Jakarta hebat'),
(5, 'david', '$2a$10$1w2AdreiQcxzRsmTvnn1ne2iSaDz.k./36uArqq/QjdGGJKPwjObq', 'david da silva'),
(6, 'sesuatu', '$2a$10$newye/BBXWNj/jS6KfoJ0OcgQkR7gU.GcnqxrPL1ZMX.oEUrYsuGa', 'sesuatu yang indah'),
(7, 'samsudin', '$2a$10$kx3aAm6.G8ihNeZ2kxkRMuigJYiqpRzyw85opkASxVRPBaycltsHm', 'samsudin umar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_departemen`
--
ALTER TABLE `master_departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_kategori`
--
ALTER TABLE `master_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
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
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id table', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `master_departemen`
--
ALTER TABLE `master_departemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `master_kategori`
--
ALTER TABLE `master_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
