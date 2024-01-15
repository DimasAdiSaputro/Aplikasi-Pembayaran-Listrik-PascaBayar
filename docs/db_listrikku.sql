-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2024 at 02:52 PM
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
-- Database: `db_listrikku`
--

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` varchar(128) NOT NULL,
  `level` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `level`) VALUES
('LVL001', 'ADMIN'),
('LVL002', 'PETUGAS');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(128) NOT NULL,
  `nama_pelanggan` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_kwh` varchar(128) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_tarif` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `username`, `password`, `nomor_kwh`, `alamat`, `id_tarif`) VALUES
('PLG2401150001', 'Dimas Adi Saputro', 'dimassaja', '$2y$10$zj9v/Zq6mLpMD84znbZa2eMAHa980aqrASuKvIzgXrMSHqq1ZQh3G', '1209108219829', 'kalibaru', 'TRF20230205002');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(128) NOT NULL,
  `id_tagihan` varchar(128) NOT NULL,
  `id_pelanggan` varchar(128) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `biaya_admin` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `id_user` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_tagihan`, `id_pelanggan`, `tgl_bayar`, `biaya_admin`, `total_bayar`, `id_user`) VALUES
('PAY230210001', 'TG2302100002', 'PLG2302040001', '2023-02-10', 2500, 102500, 'USR0001'),
('PAY230210002', 'TG2302100003', 'PLG2302090001', '2023-02-10', 2500, 202500, 'USR0001'),
('PAY230210003', 'TG2209100005', 'PLG2210100001', '2022-10-01', 2500, 202500, 'USR0001'),
('PAY230210004', 'TG2211100005', 'PLG2210100001', '2022-11-01', 2500, 262500, 'USR0001'),
('PAY230210005', 'TG2302100005', 'PLG2210100001', '2023-01-01', 2500, 242500, 'USR0001'),
('PAY230211001', 'TG2302100006', 'PLG2210100001', '2023-02-01', 2500, 302500, 'USR0001'),
('PAY230211002', 'TG2302110001', 'PLG2209010001', '2023-02-01', 2500, 152500, 'USR0001'),
('PAY230211003', 'TG2302110002', 'PLG2302080001', '2023-02-01', 2500, 102500, 'USR0001'),
('PAY230212001', 'TG2302120001', 'PLG2210060004', '2023-02-01', 2500, 252500, 'ADM0000'),
('PAY230212002', 'TG2302120002', 'PLG2210060004', '2023-01-29', 2500, 552500, 'ADM0000'),
('PAY230212003', 'TG2302120003', 'PLG2210060004', '2023-02-04', 2500, 232500, 'ADM0000'),
('PAY230212004', 'TG2302120004', 'PLG2210060004', '2023-02-05', 2500, 252500, 'ADM0000');

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan`
--

CREATE TABLE `penggunaan` (
  `id_penggunaan` varchar(128) NOT NULL,
  `id_pelanggan` varchar(128) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `meter_awal` int(11) NOT NULL,
  `meter_akhir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penggunaan`
--

INSERT INTO `penggunaan` (`id_penggunaan`, `id_pelanggan`, `bulan`, `tahun`, `meter_awal`, `meter_akhir`) VALUES
('PN220101002', 'PLG2302080001', 1, 2023, 0, 100),
('PN220910005', 'PLG2210100001', 9, 2022, 0, 100),
('PN221012001', 'PLG2210060004', 10, 2022, 0, 125),
('PN221016005', 'PLG2210100001', 10, 2022, 100, 230),
('PN221101001', 'PLG2210060004', 11, 2022, 125, 400),
('PN221201001', 'PLG2210060004', 12, 2022, 400, 515),
('PN230101001', 'PLG2210060004', 1, 2023, 515, 640),
('PN230210002', 'PLG2302040001', 1, 2023, 200, 300),
('PN230210003', 'PLG2302090001', 1, 2023, 0, 100),
('PN230210004', 'PLG2302040001', 2, 2023, 300, 400),
('PN230210005', 'PLG2210100001', 12, 2022, 230, 350),
('PN230210006', 'PLG2210100001', 1, 2023, 350, 500),
('PN230211001', 'PLG2209010001', 1, 2023, 0, 100),
('PN230211002', 'PLG2302080001', 2, 2023, 100, 210),
('PN230211003', 'PLG2210100001', 2, 2023, 500, 700),
('PN230211004', 'PLG2302090001', 2, 2023, 100, 300),
('PN230212001', 'PLG2210060004', 2, 2023, 640, 800);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` varchar(128) NOT NULL,
  `id_penggunaan` varchar(128) NOT NULL,
  `id_pelanggan` varchar(128) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `jumlah_meter` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_penggunaan`, `id_pelanggan`, `bulan`, `tahun`, `jumlah_meter`, `status`) VALUES
('TG2209100005', 'PN220910005', 'PLG2210100001', 9, 2022, 100, 'PAID'),
('TG2211100005', 'PN221016005', 'PLG2210100001', 10, 2022, 130, 'PAID'),
('TG2302100002', 'PN230210002', 'PLG2302040001', 1, 2023, 100, 'PAID'),
('TG2302100003', 'PN230210003', 'PLG2302090001', 1, 2023, 100, 'PAID'),
('TG2302100004', 'PN230210004', 'PLG2302040001', 2, 2023, 100, 'UNPAID'),
('TG2302100005', 'PN230210005', 'PLG2210100001', 12, 2022, 120, 'PAID'),
('TG2302100006', 'PN230210006', 'PLG2210100001', 1, 2023, 150, 'PAID'),
('TG2302110001', 'PN230211001', 'PLG2209010001', 1, 2023, 100, 'PAID'),
('TG2302110002', 'PN220101002', 'PLG2302080001', 1, 2023, 100, 'PAID'),
('TG2302110003', 'PN230211002', 'PLG2302080001', 2, 2023, 110, 'UNPAID'),
('TG2302110004', 'PN230211003', 'PLG2210100001', 2, 2023, 200, 'UNPAID'),
('TG2302110005', 'PN230211004', 'PLG2302090001', 2, 2023, 200, 'UNPAID'),
('TG2302120001', 'PN221012001', 'PLG2210060004', 10, 2022, 125, 'PAID'),
('TG2302120002', 'PN221101001', 'PLG2210060004', 11, 2022, 275, 'PAID'),
('TG2302120003', 'PN221201001', 'PLG2210060004', 12, 2022, 115, 'PAID'),
('TG2302120004', 'PN230101001', 'PLG2210060004', 1, 2023, 125, 'PAID'),
('TG2302120005', 'PN230212001', 'PLG2210060004', 2, 2023, 160, 'UNPAID');

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE `tarif` (
  `id_tarif` varchar(128) NOT NULL,
  `daya` varchar(25) NOT NULL,
  `tarif_perkwh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tarif`
--

INSERT INTO `tarif` (`id_tarif`, `daya`, `tarif_perkwh`) VALUES
('TRF20230205002', '900VA', 1500),
('TRF20230205007', '450VA', 1000),
('TRF20230205009', '1500VA', 2000),
('TRF20230205010', '1300VA', 2700);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_admin` varchar(128) NOT NULL,
  `id_level` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_admin`, `id_level`) VALUES
('ADM0000', 'superadmin', 'superadmin', 'superadmin', 'LVL001'),
('USR0001', 'Admin', '$2y$10$yuL.WbMZOTxtTZRMoi19k.k3okzdhsut81wKd6k0B2.hDWGyHue/y', 'Admin', 'LVL001'),
('USR0002', 'petugas_admin', '$2y$10$r/0R1J98IlE5wFil6gsuZOgAkfDZ.grlfk33r2mR/At9nAuq1iF3y', 'Petugas', 'LVL002'),
('USR0003', 'petugas001', '$2y$10$F0cY/xyS0rBXDObRZNLaYuEjlmbONHamVZPCWiKIDyilKnki3q83G', 'Petugas001 UP', 'LVL002'),
('USR0006', 'admin2', '$2y$10$Ot/q7sj6xqTR8uzIHkl9JO.nDCFHVZxf7.aBw6TriZAf1UVX5fSbK', 'admin2', 'LVL002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD PRIMARY KEY (`id_penggunaan`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indexes for table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id_tarif`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
