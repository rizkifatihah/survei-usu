-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Jul 2022 pada 19.51
-- Versi server: 10.3.35-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `njmnrtps_survei`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_daftar_survei`
--

CREATE TABLE `survei_daftar_survei` (
  `id_daftar_survei` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `sub_category` varchar(255) DEFAULT NULL,
  `jumlah_survei` int(11) NOT NULL,
  `status_survei` int(11) NOT NULL DEFAULT 1,
  `mulai_survei` date NOT NULL,
  `selesai_survei` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_daftar_survei`
--

INSERT INTO `survei_daftar_survei` (`id_daftar_survei`, `kategori`, `sub_category`, `jumlah_survei`, `status_survei`, `mulai_survei`, `selesai_survei`, `created_by`, `created_time`, `updated_time`, `updated_by`) VALUES
(1, 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'KEUANGAN', 20, 1, '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL, NULL),
(2, 'BIRO SUMBER DAYA MANUSIA', NULL, 10, 1, '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL, NULL),
(3, 'FAKULTAS FARMASI', NULL, 10, 0, '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', '2022-05-30 13:44:53', 1),
(4, 'BIRO SUMBER DAYA MANUSIA', NULL, 50, 1, '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:31', NULL, NULL),
(5, 'ARSIP', NULL, 10, 0, '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', '2022-05-30 13:42:33', 1),
(6, 'BIRO AKADEMIK', NULL, 20, 0, '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', '2022-05-30 13:44:42', 1),
(7, 'BIRO AKADEMIK', NULL, 100, 1, '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:18', NULL, NULL),
(8, 'BIRO KEMAHASISWAAN', NULL, 100, 1, '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL, NULL),
(9, 'FAKULTAS EKONOMI DAN BISNIS', NULL, 100, 1, '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_detail_survei`
--

CREATE TABLE `survei_detail_survei` (
  `id_detail_survei` int(11) NOT NULL,
  `id_survei` int(11) NOT NULL,
  `kode_survei` varchar(255) NOT NULL,
  `standar_pelayanan` varchar(255) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `status` enum('Digunakan','Belum Digunakan') NOT NULL DEFAULT 'Belum Digunakan',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_detail_survei`
--

INSERT INTO `survei_detail_survei` (`id_detail_survei`, `id_survei`, `kode_survei`, `standar_pelayanan`, `information`, `status`, `start_date`, `end_date`, `created_by`, `created_time`, `updated_time`) VALUES
(1, 1, 'jWINXsJzFhke', 'UMUM', NULL, 'Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', '2022-04-27 14:29:43'),
(2, 1, 'tHlF9gqwc03s', 'UMUM', NULL, 'Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', '2022-04-27 14:32:12'),
(3, 1, 'GDBI9n2iq1jZ', 'UMUM', NULL, 'Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', '2022-04-27 14:34:08'),
(4, 1, '8zalviBkA9JS', 'UMUM', NULL, 'Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', '2022-04-27 15:05:14'),
(5, 1, 'CYJm7LSx5cld', 'UMUM', NULL, 'Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', '2022-04-28 03:48:24'),
(6, 1, 'M4tUqwKjsDP8', 'UMUM', NULL, 'Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', '2022-04-28 04:05:19'),
(7, 1, 'h9raPEztjnpY', 'UMUM', NULL, 'Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', '2022-04-28 04:07:38'),
(8, 1, 'sUP1pDRQ4o6i', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(9, 1, 'vKSGF1eWdqYm', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(10, 1, 'Scj4BIymA5Qg', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(11, 1, 'vmrMa25u8g1t', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(12, 1, '6Q9x8Ny3TkMX', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(13, 1, 'o05MXfysj4ae', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(14, 1, 'CHpUJR0AB6lO', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(15, 1, 'iT3kemu2sVbv', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(16, 1, 'MrLUmAluJIwT', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(17, 1, '9tU5Xw7NvqEc', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(18, 1, 'pXLKBNkgb3Sz', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(19, 1, 'YBCmGXN5xLV6', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(20, 1, 'pZB2iRMUnteC', NULL, NULL, 'Belum Digunakan', '2022-04-24', '2022-05-01', 1, '2022-04-27 14:29:10', NULL),
(21, 2, 'yU5GR68vamjs', 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', NULL, 'Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', '2022-04-28 04:12:58'),
(22, 2, 'ED8ritOy17Wa', 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', NULL, 'Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', '2022-04-28 12:49:22'),
(23, 2, 'cu06W5OEx21y', 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', NULL, 'Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', '2022-04-28 14:34:35'),
(24, 2, '08h3kLvoPXED', NULL, NULL, 'Belum Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL),
(25, 2, 'kOgtH3FAunfI', NULL, NULL, 'Belum Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL),
(26, 2, 'MqGjRtasCTBI', NULL, NULL, 'Belum Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL),
(27, 2, 'ABPeb3507qtI', NULL, NULL, 'Belum Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL),
(28, 2, 'KXzOnPbYxW2u', NULL, NULL, 'Belum Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL),
(29, 2, 'mKv7NtMa2oYO', NULL, NULL, 'Belum Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL),
(30, 2, 'v3kfNcSrzQVn', NULL, NULL, 'Belum Digunakan', '2022-04-27', '2022-04-30', 1, '2022-04-28 04:11:29', NULL),
(31, 3, '8mryEgI6NiRJ', 'REKOMENDASI BEASISWA', NULL, 'Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', '2022-04-28 14:38:36'),
(32, 3, '19wmhurEFC5t', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(33, 3, 'iyPL8zuvs3jH', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(34, 3, '8YFaq2T9WIX6', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(35, 3, 'LwWM0qDg9SpF', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(36, 3, 'ZRVvnXypg20o', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(37, 3, 'Q0JD4SYNKOlu', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(38, 3, 'UcL7CmeINjvd', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(39, 3, 'qWimkEShD7j6', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(40, 3, 'a7dl25eVuMfs', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 14:37:19', NULL),
(41, 4, '1Rax7t9ryeHX', 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', NULL, 'Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:31', '2022-04-28 16:16:21'),
(42, 4, 'HAqvDIaxpGte', 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', NULL, 'Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:31', '2022-04-28 16:22:36'),
(43, 4, 'v8DxLNzKjsBA', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(44, 4, 'gedk7bZYJsMi', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(45, 4, 'sen4xmFl8TJo', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(46, 4, 'Qajum40yesA7', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(47, 4, '3s8gcyjrYQRJ', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(48, 4, 'SpKNT5ztgMP7', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(49, 4, 'utN1jQnPLKvf', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(50, 4, '6JU8pxW0Omls', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(51, 4, 'ilhvq47BDcZw', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(52, 4, '63w9pMZxNPke', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(53, 4, 'cl4QSCfBiwZT', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(54, 4, 'VspPwFXGE09J', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(55, 4, 'O1Bbgpm4AISd', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(56, 4, 'qjB2EFp7sPHZ', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(57, 4, 'KTskp94FybVB', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(58, 4, 'D7Z3x0WeULwl', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(59, 4, 'R5bv1jPQTSwn', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(60, 4, 'plOarjv18DVc', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(61, 4, 'P9e0USpvHMK6', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(62, 4, '1Brdw8iPvXzC', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(63, 4, 'og7xLyQas5bm', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(64, 4, 'OXID5AVqE1QS', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(65, 4, '9L7mq8Meo2Ik', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(66, 4, '3eM2BaktCTh7', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(67, 4, '4kv3CS6ZlWB2', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(68, 4, '4ydKq63gHfus', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(69, 4, 'tkgyKF5Y26DL', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(70, 4, 'XC3R4ycr90uH', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(71, 4, 'L6P3WuiXIzOF', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(72, 4, 'ml1PuBAURctS', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(73, 4, 'PYtE9pvSBmo6', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(74, 4, 'CpfiSITgL0zF', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(75, 4, 'R6cz7ONGAjPW', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(76, 4, 'PWjKU4ez6Bgu', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(77, 4, 'liSUbC3KnGRj', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(78, 4, 'meyIGndXZuN9', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(79, 4, 'DWji7kCYLw25', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(80, 4, '1g7NcXwxq0I5', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(81, 4, 'dIqKPJlj4Wza', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(82, 4, 'kmpU0L1z3s2B', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(83, 4, 'HhdIorpcK4zZ', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(84, 4, 'z3kEgLYhr4n2', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(85, 4, 'ZdetBGRKQiuE', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(86, 4, 'BQ5v1OwuxoJl', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(87, 4, '0LPVIzh8Fv2R', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(88, 4, 'e3FaM42cYuzS', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(89, 4, 'yqgG41fJ5Yx3', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(90, 4, 'b4dAa5jwLrHW', NULL, NULL, 'Belum Digunakan', '2022-04-26', '2022-04-30', 1, '2022-04-28 16:13:32', NULL),
(91, 5, 'cyOIlvLKgkbT', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(92, 5, 'c1uQzGpr7tJe', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(93, 5, 'nqxoadQUeHIg', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(94, 5, 'nhX6TYRHOdmI', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(95, 5, 'DyXKl9RT27aH', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(96, 5, 'B8tTq32x4ihz', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(97, 5, 'lPFKrj5bhRWN', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(98, 5, 'dELrMb0Hsp8m', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(99, 5, 'BCtpglwoJcDV', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(100, 5, 'mvyQYRfIa9J0', NULL, NULL, 'Belum Digunakan', '2022-05-04', '2022-05-31', 1, '2022-05-25 10:16:44', NULL),
(101, 6, 'fHSzs2eAntJD', 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', NULL, 'Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', '2022-05-25 11:18:52'),
(102, 6, 'ec3CyzxvVUfb', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(103, 6, 'QXc2dgKzUuCe', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(104, 6, '8ydt6L2pGSBr', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(105, 6, 'M53wl9XJiTzD', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(106, 6, 'Tm9puJaY1Oqw', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(107, 6, 'kOS1A5qmMlYH', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(108, 6, 'nSeH7BMgjoRh', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(109, 6, 'rZu4twpxXbHW', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(110, 6, 'pCqj1yOxm69r', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(111, 6, 'D6lYEU9Bg4av', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(112, 6, 'TPCnYGm13SUB', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(113, 6, '37YEaZuN4PkI', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(114, 6, 'JYAsN7GXTFyb', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(115, 6, 'BnmtdGWN8gZv', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(116, 6, 'OF2Biyu3EQ5R', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(117, 6, 'YapQJCjzylSq', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(118, 6, 'VfgjmuwzF78x', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(119, 6, 'AfrT8OMKPZQ3', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(120, 6, 'xbj9OlZzp2v0', NULL, NULL, 'Belum Digunakan', '2022-05-01', '2022-05-31', 1, '2022-05-25 10:42:33', NULL),
(121, 7, 'qZEbcw2YjmHB', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:18', NULL),
(122, 7, 'p8SmCr7FTRXa', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(123, 7, 'YUP1erkwVgi3', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(124, 7, 'JP2snd9aZHgu', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(125, 7, 'B1YfaOmJ3oyR', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(126, 7, 'wQj0MAaEqmJt', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(127, 7, 'XymZfsPR8HeS', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(128, 7, 'RZSzHJtOxv9G', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(129, 7, 'ySOEtFj6cnXg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(130, 7, 'Isdpexqyoknb', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(131, 7, 'fcxNTBJzVA8F', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(132, 7, '812V7vfXJTto', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(133, 7, 'wlHyTtSc4n7G', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(134, 7, 'DOZMCzBiITuo', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(135, 7, 'If9DzqN5k4iB', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(136, 7, 'RELC43jsMQ29', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(137, 7, 'DvYRIylZJXo4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(138, 7, '1X2ZjRS9rMFJ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(139, 7, 'q1mGs3kSNFi6', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(140, 7, '5mg3kaX1Do0C', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(141, 7, 'Vk0fN5w1pU97', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(142, 7, 'wmeZWbydOIjs', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(143, 7, 'WRCD7Iyv49Jg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(144, 7, 'qEvhMAo9npdl', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(145, 7, 'p1CP6u25IqJB', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(146, 7, 'FsYh6D0n14d2', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(147, 7, 'Y27HsjW35AJg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(148, 7, 'UscxTH8QeNRC', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(149, 7, 'yDEUCN6lkZYR', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(150, 7, 'OLgXKS8y2aA3', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(151, 7, 'exk8GiL9Cgsj', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(152, 7, '3zAhTMU5N8is', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(153, 7, 'JYQgXhH5zdaO', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(154, 7, 'tQ4m9U0h8JT5', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(155, 7, 'KCnxXE5m1lOJ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(156, 7, '7NUDvQ53HjRq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(157, 7, 'XBYbdrFaxTJv', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(158, 7, '7sDgux3BkiAL', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(159, 7, 'CXPuZ8ItxWrq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(160, 7, 'EKQmCyDS2sLk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(161, 7, 'xjIFV1QJTPBw', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(162, 7, 'ULvqJjaWVIiw', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(163, 7, 'PiDpJZqbh8QV', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(164, 7, 'mL8akp2w16W5', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(165, 7, 'lVwdSWcmC9Zf', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(166, 7, '1I0xwtET7eaU', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(167, 7, 'g2nXyTL0s9jP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(168, 7, 'tdx9uP2SG3EZ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(169, 7, 'CVpgLw42o9jJ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(170, 7, 't8CWmwgA64cp', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(171, 7, 'gx4Lc9mS07TO', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(172, 7, '18CWiINPaxAQ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(173, 7, 'Z9bunH5PMcks', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(174, 7, 'w8aCjeHWmIsE', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(175, 7, 'wYrpvIitsk3B', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(176, 7, '12DF7pnGzYI3', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(177, 7, '58h9Xmnfz7Nk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(178, 7, '1Xl5moW2FVpT', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(179, 7, 'iY68nutj7TUx', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(180, 7, 'NuMCEkln2PWL', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(181, 7, 'gLJC9F4DWhe0', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(182, 7, '0jomxpHQ47Ge', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(183, 7, 'S5KcZHhbpAUk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(184, 7, '5srVAnJMXcuB', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(185, 7, 'f12n5bzNMklQ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(186, 7, '6gTm9Z8Hz1vc', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(187, 7, 'IQg4q9pcY1wf', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(188, 7, 'geHtL1f9Vlk6', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(189, 7, 'HydS1RjJxtgq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(190, 7, 'qoyStW2asgmE', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(191, 7, 'mOQWlf2PZqiN', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(192, 7, 'QuAOcKlqrkJg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(193, 7, '984CKlw3EJUm', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(194, 7, 'REpmCHj2u9qU', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(195, 7, '74kzLhOB93YM', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(196, 7, 'yievbXM0kcDK', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(197, 7, 'uriQO3h57maC', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(198, 7, 'nZWpcsxeUNQS', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(199, 7, 'DdbqgFHpOJCW', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(200, 7, 'zbJ3S4M1aego', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(201, 7, 'kGXB978bfJl0', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(202, 7, 'JBh1frQYGD7e', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(203, 7, 'PBcUeOirGbCk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(204, 7, 't1wDiB3nc6xP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(205, 7, 'LgVNoUtElG2I', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(206, 7, 'WtHVLCiu6eOP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(207, 7, 'w4aoO8tTf0Yx', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(208, 7, 'aOxKPEq3Vm2X', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(209, 7, '3nzxQApB85b7', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(210, 7, 'Es4X8V3aKAki', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(211, 7, '89UygAK1JE0b', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(212, 7, 'wOREByp96Fo2', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(213, 7, 'tNQZa3265cxj', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(214, 7, 'J0wP7d4obNA1', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(215, 7, 'macFS2l6XP0o', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(216, 7, 'JF0i1QMTdc45', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(217, 7, '2TRlXYCqWsS0', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(218, 7, 'J1BI3bXv4dEg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(219, 7, 'ZS6uiKj2Pv3M', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(220, 7, 'wn1upGzogm7H', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-30', 1, '2022-05-29 15:42:19', NULL),
(221, 8, 'W2G4w9sxJchq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(222, 8, 'rKB4eohqWV2l', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(223, 8, '70f9jGtmPyMN', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(224, 8, 'ptOkMw68LTui', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(225, 8, 'OcRolUv8nLhP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(226, 8, 'ecnFdrXaS7j4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(227, 8, 'WP0agG24E6BJ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(228, 8, '7Fi6HTl1UrQR', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(229, 8, 'e9bFAqLJpCyP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(230, 8, 'fNQrWe9q7I8d', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(231, 8, 'qCywdNI0mor6', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(232, 8, 'UnZmpRl5vP6h', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(233, 8, 'zfoTJ2livXtk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(234, 8, 'cyC5w3JZgkpU', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(235, 8, 'lRm48L0ncO6P', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(236, 8, 'GWR09FVYmQgZ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(237, 8, 'D1hvNV7aQ9Ry', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(238, 8, '3jDrNOIGa1Py', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(239, 8, 'WBSxRab3YEJs', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(240, 8, 'GORUx3vCIL5z', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(241, 8, 'VnGpPCsqi63Y', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(242, 8, 'WTV7zaPpM6Ah', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(243, 8, '3g4DR2YuTK9e', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(244, 8, 'bx3K2PB9Al6a', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(245, 8, 'vkO08WiBMQyY', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(246, 8, '6bWexaZ5KkTD', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(247, 8, 'HLySo3a0kNXd', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(248, 8, 'cyPLamSoIul3', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(249, 8, 'Um2iuhAlgBM0', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(250, 8, '1VZTWcrHmyo2', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(251, 8, 'KUoLG5dBWMCH', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(252, 8, '0f3OrzBUPVgG', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(253, 8, 'UXNLzas7co4j', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(254, 8, '6pqSyiuMPAxz', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(255, 8, 'hlTmXKF8CGD9', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(256, 8, 'IXe8rLaWwcMP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(257, 8, 'koaOTvIP2bm4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(258, 8, '0Tkp7VcOAh1B', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(259, 8, 'ZSpnUl3i8Rxg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(260, 8, 'jbpi3O8Zvx2h', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(261, 8, '0iC3DbglmnQf', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(262, 8, '8AIioVpeEsOf', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(263, 8, 'Xc2ridUW5KPf', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(264, 8, 'DdrY2nimfAc5', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(265, 8, 'rXw1fAFb7NeC', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(266, 8, 'GR93UJOVgzis', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(267, 8, 'QhnWSEP2UjDX', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(268, 8, '8aEwvVT9h4PW', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(269, 8, 'e3LS6bH1WcZE', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(270, 8, '0DdxlGErqfke', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(271, 8, 'ZqdTpcrwfvQW', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(272, 8, 'rFPzH9EuGDcI', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(273, 8, 'rJd3klETyY2v', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(274, 8, 'NUDcX0vYVuT3', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(275, 8, '16OvPLImFpEH', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(276, 8, 'E5acCMIHwWB6', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(277, 8, 'JewUT1gXC0hA', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(278, 8, 'mApOwr6S8xh4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(279, 8, 'KAS8YCX3hzm9', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(280, 8, 'jDUiLsfbhouV', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(281, 8, 'hPMwfp5DU9SZ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(282, 8, 'UhEdWCGr5eQK', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(283, 8, 'A07rW9SvHOm4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(284, 8, 'XHK4eOorPi5b', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(285, 8, 'bc0tBEkjHlQe', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(286, 8, 'Ijuo6GyLhBXz', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(287, 8, 'xE8GWtYLdXPk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(288, 8, 'do0VGmzjKUW9', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(289, 8, 'KqueYvIOiP2L', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(290, 8, 'ScxWbZ2Kg0IX', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(291, 8, 'RLaYyXjlsfIQ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(292, 8, 'NshSMzfeyi8w', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(293, 8, 'URni6mcEbX0q', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(294, 8, 'Yyvcukb6aKgU', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(295, 8, 'g6zmaslk84Eq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(296, 8, '0NXvDnJwSyYk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(297, 8, 'avpCYod1gBSy', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(298, 8, 'AVklCs5rLaMd', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(299, 8, 'FiHEKjI1auvS', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(300, 8, 'RWopu2Y5J6Ut', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(301, 8, 'gycRMsTa4tDq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(302, 8, 'tl1QfXGYbNpa', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(303, 8, 'DTBpwL376tYK', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(304, 8, 'jq9EMXhFG7Nv', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(305, 8, '1LD6W274nQbt', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(306, 8, 'CR4zi0XZNYvw', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(307, 8, 'X9CeH3SprD4U', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(308, 8, 'Fr16bkKZsOiy', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(309, 8, '5X2yNcpvZOSI', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(310, 8, 'X5iNmeMSlBLk', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(311, 8, 'pEXLjBUxel6t', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(312, 8, 'x1ywg6uOA2XP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(313, 8, 'JC37tBHWdjK4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(314, 8, 'aUdnorjSvq2W', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(315, 8, 'k0ivd2EQAoLb', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(316, 8, '1SEdCgJheXyM', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(317, 8, '0TKkaqJHwfDP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(318, 8, 'k65CobBjZ2Pe', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(319, 8, 'SNOF1a2IeJRv', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(320, 8, 'ORIHEBTvsCSm', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-05-31', 1, '2022-05-30 14:53:19', NULL),
(321, 9, 'dU1yNruD3Zw7', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(322, 9, 'FqeL7sWUCd86', 'SURAT BUKTI PENYERAHAN SKRIPSI', NULL, 'Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', '2022-05-31 16:59:56'),
(323, 9, 'RenD1sJytTPj', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(324, 9, 'Qur5KXtHh3Gm', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(325, 9, 'dN0V9M7to6af', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(326, 9, 'xcMl7msX5EZR', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(327, 9, 'EPLkrjucZoSq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(328, 9, 'H31yXTDJYwZj', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(329, 9, 'sWt32ScC40U5', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(330, 9, '4hXCcbdan5JS', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(331, 9, 'tBO0UyEnMlYq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(332, 9, '5WybOKupUMZP', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(333, 9, 'xW7XeHdYlPwC', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(334, 9, '3a1cnk0VDZvp', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(335, 9, 'Zmf9X7bDKHQ4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(336, 9, 'ng5lYuhWibJI', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(337, 9, 'KEhXp1z2wM8J', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(338, 9, 'sO13fw489mEb', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(339, 9, 'Bk4PxIfue3nw', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(340, 9, '2hWXg5TaxnGj', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(341, 9, 'R3Azjp6rLDv0', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(342, 9, '4Kfjqg7wpNru', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(343, 9, 'l2F9Z0YpHNVO', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(344, 9, '3lW0T1QtMdEv', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(345, 9, 'm7XUps98MQOJ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(346, 9, 'ysZwonrWDkQL', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(347, 9, 'MT0qvD3UoXbL', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(348, 9, 'eruqJGVlZ4A8', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(349, 9, 'U0adVJCx9owe', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(350, 9, 'jKhzb18CODNd', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(351, 9, 'TnE7wqe9aByh', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(352, 9, 'J2CLeWm4DXnh', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(353, 9, 'f08jvmZAGWqN', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(354, 9, 'tMzJfZKOFcTr', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(355, 9, 'UTBP9Xe40Myg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(356, 9, 'BwG8DTk9HguN', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(357, 9, 'sOeJ4jZNISuT', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(358, 9, 'QX9t2kqBZibw', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(359, 9, 'AfJsMx9BtT3u', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(360, 9, 'fi1GgksEx62C', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(361, 9, 'GRbfNS1anr3K', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(362, 9, 'GxLYnjVotuda', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(363, 9, 'XtrI3L7fKEGN', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(364, 9, 'paSj5ybVR9q7', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(365, 9, 'UHzj9C0NuGck', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(366, 9, 'PbGKo5DxBUyL', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(367, 9, '9fWuNZ8ieo6K', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(368, 9, 'QV1FaqTSLKMr', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(369, 9, 'xC1wcgPjVqXh', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(370, 9, 'XdxvebHSDF87', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(371, 9, 'XPyoTUBfHd1C', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(372, 9, 'bHtcG3e2fOdn', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(373, 9, 'cEnmGhDLfSrt', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(374, 9, 'AwgkzS4T7bxi', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(375, 9, 'a7jXZhHvnF8J', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(376, 9, 'bNTdmh5y2YBS', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(377, 9, 'MTvV5tkKD4pg', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(378, 9, 'wxYpdlrbFKuZ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(379, 9, 'mET8MzOvDQga', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(380, 9, '9hLoia0nwXxN', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(381, 9, '1iZkPnpwAvVT', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(382, 9, '9Pam8wnlb1Ce', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(383, 9, 'n8qWlb2SspDL', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(384, 9, 'jqmdOvs6KDfU', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(385, 9, 'Uga1Rzn69Skt', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(386, 9, 'ErKu57ywjz4D', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(387, 9, 'fuRKkC4Y7HOl', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(388, 9, '5ZvIteyHG7fY', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(389, 9, 'm2ji8G0VTyhr', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(390, 9, 'jgFIB0nA8cCf', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(391, 9, 'LhRxk5DsVtc9', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:26', NULL),
(392, 9, 'ytAb8dTGU7R5', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(393, 9, '6SNfwBHngvYm', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(394, 9, 'bEh7KWGvZf42', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(395, 9, 'kZUGhfNdWpln', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(396, 9, 'WK5tBIjAJTX4', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(397, 9, 'jHqarBdDX6JM', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(398, 9, 'ly4F0P3sU5Rv', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(399, 9, 'qEGSPfeYUQ9J', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(400, 9, 'BmU0p5MVwn83', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(401, 9, 'ga9IZpszJdYi', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(402, 9, 'ind8yo3g7qZm', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(403, 9, 'LtX8sdUhlzHr', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(404, 9, 'yiv2G4h9VWrq', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(405, 9, 'CjcB0X7dThnA', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(406, 9, '7yHxDSr04eJO', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(407, 9, 'ypIrqkPVxeE6', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(408, 9, 'wRdXqonjNQZ5', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(409, 9, 'Ly9Wvjo5KlF2', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(410, 9, 'B2NJqlMKFUYe', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(411, 9, 'V157rmSH2WnO', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(412, 9, 'jdXrWVwkoygJ', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(413, 9, 'sxFd6hyeIblw', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(414, 9, 'hEZri3JgQsqz', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(415, 9, '5STNkVJqHIXF', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(416, 9, 'F4fHV1v9CAwn', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(417, 9, '8jSOEkyg9tFw', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(418, 9, 'vGOyUHRmhq1S', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(419, 9, '14qxmG56McYX', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL),
(420, 9, 'pckD1e7VzWGX', NULL, NULL, 'Belum Digunakan', '2022-05-23', '2022-06-03', 1, '2022-05-31 16:57:27', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_hak_akses`
--

CREATE TABLE `survei_hak_akses` (
  `id_hak_akses` int(11) NOT NULL,
  `nama_hak_akses` varchar(225) NOT NULL,
  `modul_akses` text NOT NULL,
  `parent_modul_akses` text DEFAULT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `survei_hak_akses`
--

INSERT INTO `survei_hak_akses` (`id_hak_akses`, `nama_hak_akses`, `modul_akses`, `parent_modul_akses`, `created_time`) VALUES
(1, 'superadmin', '{\n    \"modul\": [\n        \"pengguna\",\n        \"createPengguna\",\n        \"updatePengguna\",\n        \"deletePengguna\",\n        \"hakAkses\",\n        \"createHakAkses\",\n        \"updateHakAkses\",\n        \"deleteHakAkses\",\n        \"categories\",\n        \"createCategory\",\n        \"updateCategory\",\n        \"deleteCategory\",\n        \"services\",\n        \"createService\",\n        \"updateService\",\n        \"deleteService\",\n        \"question\",\n        \"createQuestion\",\n        \"updateQuestion\",\n        \"deleteQuestion\",\n        \"listSurvey\",\n        \"createSurvey\",\n        \"updateSurvey\",\n        \"deleteSurvey\",\n        \"listReport\",\n        \"identitasAplikasi\",\n        \"daftarModul\"\n    ]\n}', '{\n    \"parent_modul\": [\n        \"Dashboard\",\n        \"MasterData\",\n        \"Survey\",\n        \"Pengaturan\"\n    ]\n}', '2021-06-10 09:21:01'),
(2, 'admin', '{\n    \"modul\": [\n        \"listSurvey\",\n        \"createSurvey\",\n        \"updateSurvey\",\n        \"deleteSurvey\",\n        \"listReport\"\n    ]\n}', '{\n    \"parent_modul\": [\n        \"Dashboard\",\n        \"Survey\",\n        \"Report\"\n    ]\n}', '2021-06-20 19:16:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_identitas`
--

CREATE TABLE `survei_identitas` (
  `id_profile` int(11) NOT NULL,
  `apps_name` varchar(225) NOT NULL,
  `apps_version` varchar(225) NOT NULL,
  `apps_code` varchar(10) DEFAULT NULL,
  `buildnumber` varchar(255) DEFAULT NULL,
  `agency` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `city` varchar(225) DEFAULT NULL,
  `telephon` varchar(225) DEFAULT NULL,
  `fax` varchar(225) DEFAULT NULL,
  `website` varchar(225) DEFAULT NULL,
  `header` varchar(225) DEFAULT NULL,
  `footer` varchar(225) DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `logo` varchar(225) DEFAULT 'NULL',
  `icon` varchar(225) DEFAULT NULL,
  `sidebar_login` varchar(225) DEFAULT NULL,
  `about_us` text DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `facebook` varchar(225) DEFAULT NULL,
  `instagram` varchar(225) DEFAULT NULL,
  `twitter` varchar(225) DEFAULT NULL,
  `location_lat` varchar(255) DEFAULT NULL,
  `location_long` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `survei_identitas`
--

INSERT INTO `survei_identitas` (`id_profile`, `apps_name`, `apps_version`, `apps_code`, `buildnumber`, `agency`, `address`, `city`, `telephon`, `fax`, `website`, `header`, `footer`, `keyword`, `logo`, `icon`, `sidebar_login`, `about_us`, `email`, `facebook`, `instagram`, `twitter`, `location_lat`, `location_long`) VALUES
(1, 'Survey Information System', '1.0', 'SIS', '1', 'Universitas Sumatera Utara', '', '', '', '', '', '', 'Powered By <a href=\"\">Universitas Sumatera Utara</a>', '', 'assets/img/logo_usu.png', 'assets/img/logo_usu.png', 'assets/img/logo_usu.png', '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_jawaban`
--

CREATE TABLE `survei_jawaban` (
  `id_jawaban` int(11) NOT NULL,
  `id_pertanyaan` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL,
  `tambahan_keterangan` text DEFAULT NULL,
  `nama_surveyor` varchar(255) NOT NULL,
  `email_surveyor` varchar(255) NOT NULL,
  `id_detail_survei` int(11) NOT NULL,
  `id_survei` int(11) NOT NULL,
  `standar_pelayanan` varchar(255) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_jawaban`
--

INSERT INTO `survei_jawaban` (`id_jawaban`, `id_pertanyaan`, `jawaban`, `tambahan_keterangan`, `nama_surveyor`, `email_surveyor`, `id_detail_survei`, `id_survei`, `standar_pelayanan`, `created_time`) VALUES
(1, 1, '2', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(2, 2, '2', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(3, 3, '2', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(4, 4, '2', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(5, 5, '2', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(6, 6, '2', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(7, 7, '2', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(8, 8, '2', '', 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(9, 9, 'TIDAK', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(10, 10, 'TIDAK', NULL, 'shifani', 'shifani@mail.com', 1, 1, 'UMUM', '2022-04-27 14:29:43'),
(11, 1, '3', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(12, 2, '3', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(13, 3, '3', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(14, 4, '3', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(15, 5, '3', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(16, 6, '3', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(17, 7, '3', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(18, 8, '3', '', 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(19, 9, 'TIDAK', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(20, 10, 'YA', NULL, 'Shifani Adriani', 'fani@mail.com', 2, 1, 'UMUM', '2022-04-27 14:32:12'),
(21, 1, '4', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(22, 2, '4', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(23, 3, '4', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(24, 4, '3', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(25, 5, '4', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(26, 6, '3', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(27, 7, '3', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(28, 8, '4', '50000, lala', 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(29, 9, 'YA', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(30, 10, 'TIDAK', NULL, 'admin', 'shifani@mail.com', 3, 1, 'UMUM', '2022-04-27 14:34:08'),
(31, 1, '3', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(32, 2, '3', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(33, 3, '3', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(34, 4, '3', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(35, 5, '3', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(36, 6, '3', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(37, 7, '3', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(38, 8, '3', '', 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(39, 9, 'TIDAK', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(40, 10, 'TIDAK', NULL, 'Fani', 'fani@mail.com', 4, 1, 'UMUM', '2022-04-27 15:05:14'),
(41, 1, '3', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(42, 2, '3', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(43, 3, '3', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(44, 4, '3', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(45, 5, '3', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(46, 6, '3', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(47, 7, '3', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(48, 8, '3', '', 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(49, 9, 'TIDAK', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(50, 10, 'TIDAK', NULL, 'Fani', 'fani@mail.com', 5, 1, 'UMUM', '2022-04-28 03:48:24'),
(51, 1, '2', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(52, 2, '1', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(53, 3, '2', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(54, 4, '2', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(55, 5, '2', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(56, 6, '2', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(57, 7, '2', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(58, 8, '2', 'Rp. 500.000 Joni', 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(59, 9, 'YA', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(60, 10, 'YA', NULL, 'Joko', 'joko@usu.ac.id', 6, 1, 'UMUM', '2022-04-28 04:05:19'),
(61, 1, '2', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(62, 2, '1', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(63, 3, '1', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(64, 4, '1', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(65, 5, '1', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(66, 6, '1', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(67, 7, '2', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(68, 8, '2', '', 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(69, 9, 'TIDAK', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(70, 10, 'YA', NULL, 'Akhtar', 'Akhtar@usu.ac.id', 7, 1, 'UMUM', '2022-04-28 04:07:38'),
(71, 1, '3', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(72, 2, '3', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(73, 3, '3', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(74, 4, '4', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(75, 5, '3', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(76, 6, '4', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(77, 7, '3', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(78, 8, '3', '', 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(79, 9, 'TIDAK', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(80, 10, 'YA', NULL, 'Try', 'try@usu.ac.id', 21, 2, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', '2022-04-28 04:12:58'),
(81, 1, '3', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:21'),
(82, 2, '3', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(83, 3, '3', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(84, 4, '3', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(85, 5, '3', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(86, 6, '3', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(87, 7, '3', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(88, 8, '3', '', 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(89, 9, 'TIDAK', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(90, 10, 'TIDAK', NULL, 'fani', 'fani@mail.com', 22, 2, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 12:49:22'),
(91, 1, '3', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(92, 2, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(93, 3, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(94, 4, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(95, 5, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(96, 6, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(97, 7, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(98, 8, '4', '', 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(99, 9, 'TIDAK', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(100, 10, 'YA', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 23, 2, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', '2022-04-28 14:34:35'),
(101, 1, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(102, 2, '4', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(103, 3, '3', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(104, 4, '3', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(105, 5, '3', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(106, 6, '3', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(107, 7, '3', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(108, 8, '3', '', 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(109, 9, 'TIDAK', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(110, 10, 'YA', NULL, 'Imam Bagus Sumantri ', 'imambagus@usu.ac.id', 31, 3, 'REKOMENDASI BEASISWA', '2022-04-28 14:38:36'),
(111, 1, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(112, 2, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(113, 3, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(114, 4, '2', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(115, 5, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(116, 6, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(117, 7, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(118, 8, '3', '', 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(119, 9, 'TIDAK', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(120, 10, 'TIDAK', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 41, 4, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', '2022-04-28 16:16:21'),
(121, 1, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(122, 2, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(123, 3, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(124, 4, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(125, 5, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(126, 6, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(127, 7, '3', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(128, 8, '3', '', 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(129, 9, 'TIDAK', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(130, 10, 'TIDAK', NULL, 'Roza Adelina', 'rozaadelina@gmail.com', 42, 4, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', '2022-04-28 16:22:36'),
(131, 1, '3', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(132, 2, '3', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(133, 3, '3', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(134, 4, '3', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(135, 5, '3', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(136, 6, '3', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(137, 7, '3', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(138, 8, '3', '', 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(139, 9, 'TIDAK', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(140, 10, 'TIDAK', NULL, 'shifani', 'shifani@mail.com', 101, 6, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', '2022-05-25 11:18:52'),
(141, 1, '3', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(142, 2, '3', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(143, 3, '3', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(144, 4, '4', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(145, 5, '4', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(146, 6, '3', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(147, 7, '3', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(148, 8, '3', '', 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(149, 9, 'TIDAK', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56'),
(150, 10, 'YA', NULL, 'Muttaalia', 'ymuttaalia@yahoo.com', 322, 9, 'SURAT BUKTI PENYERAHAN SKRIPSI', '2022-05-31 16:59:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_kategori`
--

CREATE TABLE `survei_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_kategori`
--

INSERT INTO `survei_kategori` (`id_kategori`, `nama_kategori`, `keterangan`, `created_by`, `created_time`, `updated_time`, `updated_by`) VALUES
(1, 'BIRO AKADEMIK', NULL, 1, '2022-04-03 10:05:29', NULL, NULL),
(2, 'BIRO KEMAHASISWAAN', NULL, 1, '2022-04-03 10:05:35', NULL, NULL),
(3, 'BIRO KEUANGAN', NULL, 1, '2022-04-03 10:05:41', NULL, NULL),
(4, 'BIRO SUMBER DAYA MANUSIA', NULL, 1, '2022-04-03 11:17:46', NULL, NULL),
(5, 'BIRO KERJASAMA DAN PENELITIAN', NULL, 1, '2022-04-03 11:17:55', NULL, NULL),
(6, 'BIRO PERENCANAAN DAN PENGEMBANGAN', NULL, 1, '2022-04-03 11:18:04', NULL, NULL),
(7, 'BIRO ASET DAN USAHA', NULL, 1, '2022-04-03 11:18:14', NULL, NULL),
(8, 'TATA USAHA', NULL, 1, '2022-04-03 11:18:21', NULL, NULL),
(9, 'KANTOR URUSAN HUKUM', NULL, 1, '2022-04-03 11:18:32', NULL, NULL),
(10, 'HUMAS', NULL, 1, '2022-04-03 11:18:42', NULL, NULL),
(11, 'ARSIP', NULL, 1, '2022-04-03 11:18:48', NULL, NULL),
(12, 'PUSAT PELAYANAN TERPADU', NULL, 1, '2022-04-03 11:18:56', NULL, NULL),
(13, 'FAKULTAS KEDOKTERAN', 'FAKULTAS', 1, '2022-04-03 11:19:29', NULL, NULL),
(14, 'FAKULTAS HUKUM', 'FAKULTAS', 1, '2022-04-03 11:19:40', NULL, NULL),
(15, 'FAKULTAS PERTANIAN', 'FAKULTAS', 1, '2022-04-03 11:20:04', NULL, NULL),
(16, 'FAKULTAS TEKNIK', 'FAKULTAS', 1, '2022-04-03 11:20:14', NULL, NULL),
(17, 'FAKULTAS EKONOMI DAN BISNIS', 'FAKULTAS', 1, '2022-04-03 11:20:28', NULL, NULL),
(18, 'FAKULTAS KEDOKTERAN GIGI', 'FAKULTAS', 1, '2022-04-03 11:20:38', NULL, NULL),
(19, 'FAKULTAS ILMU BUDAYA ', 'FAKULTAS', 1, '2022-04-03 11:20:53', NULL, NULL),
(20, 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'FAKULTAS', 1, '2022-04-03 11:21:03', NULL, NULL),
(21, 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'FAKULTAS', 1, '2022-04-03 11:21:14', NULL, NULL),
(22, 'FAKULTAS KESEHATAN MASYARAKAT', 'FAKULTAS', 1, '2022-04-03 11:21:26', NULL, NULL),
(23, 'FAKULTAS KEPERAWATAN', 'FAKULTAS', 1, '2022-04-03 11:21:37', NULL, NULL),
(24, 'FAKULTAS PSIKOLOGI', 'FAKULTAS', 1, '2022-04-03 12:06:05', NULL, NULL),
(25, 'FAKULTAS FARMASI', 'FAKULTAS', 1, '2022-04-03 12:06:19', NULL, NULL),
(26, 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'FAKULTAS', 1, '2022-04-03 12:06:29', NULL, NULL),
(27, 'FAKULTAS KEHUTANAN', 'FAKULTAS', 1, '2022-04-03 12:06:41', NULL, NULL),
(29, 'PERPUSTAKAAN ', NULL, 1, '2022-04-03 12:07:19', NULL, NULL),
(30, 'RUMAH SAKIT USU', NULL, 1, '2022-04-03 12:08:00', NULL, NULL),
(31, 'POLIKLINIK', NULL, 1, '2022-04-03 12:08:07', NULL, NULL),
(32, 'RUMAH SAKIT GIGI DAN MULUT', NULL, 1, '2022-04-03 12:08:14', NULL, NULL),
(33, 'PUSAT SISTEM INFORMASI', NULL, 1, '2022-04-03 12:08:23', NULL, NULL),
(34, 'LPPM ', NULL, 1, '2022-04-03 12:08:30', NULL, NULL),
(35, 'LP', NULL, 1, '2022-04-03 12:08:36', NULL, NULL),
(36, 'PUSAT BAHASA ', NULL, 1, '2022-04-03 12:08:43', NULL, NULL),
(37, 'LINKS', NULL, 1, '2022-04-03 12:08:49', NULL, NULL),
(38, 'UMM', NULL, 1, '2022-04-03 12:08:56', NULL, NULL),
(39, 'UNIT PELAYANAN, PENGEMBANGAN DAN PENDIDIKAN', NULL, 1, '2022-04-03 12:09:02', NULL, NULL),
(40, 'LABORATORIUM TERPADU', NULL, 1, '2022-04-03 12:09:08', NULL, NULL),
(89, 'SEKOLAH PASCASARJANA (SPS)', 'SEKOLAH PASCASARJANA ', 1, '2022-04-18 21:53:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_modul`
--

CREATE TABLE `survei_modul` (
  `id_modul` int(11) NOT NULL,
  `controller_modul` varchar(225) NOT NULL,
  `nama_modul` varchar(225) NOT NULL,
  `link_modul` varchar(225) NOT NULL,
  `type_modul` varchar(20) NOT NULL,
  `class_parent_modul` varchar(225) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `tampil_sidebar` enum('Y','N') NOT NULL,
  `child_module` enum('Y','N') NOT NULL DEFAULT 'N',
  `induk_child_modul` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `survei_modul`
--

INSERT INTO `survei_modul` (`id_modul`, `controller_modul`, `nama_modul`, `link_modul`, `type_modul`, `class_parent_modul`, `created_time`, `tampil_sidebar`, `child_module`, `induk_child_modul`) VALUES
(1, 'pengguna', 'List User', 'panel/masterData/pengguna', 'R', 'MasterData', '2021-06-13 16:31:47', 'Y', 'N', NULL),
(2, 'createPengguna', 'Add User', 'panel/masterData/createPengguna', 'C', 'MasterData', '2021-06-13 16:32:25', 'N', 'N', NULL),
(3, 'updatePengguna', 'Update User', 'panel/masterData/updatePengguna', 'U', 'MasterData', '2021-06-13 16:32:49', 'N', 'N', NULL),
(4, 'deletePengguna', 'Delete User', 'panel/masterData/deletePengguna', 'D', 'MasterData', '2021-06-13 16:33:11', 'N', 'N', NULL),
(5, 'hakAkses', 'List of Access', 'panel/masterData/hakAkses', 'R', 'MasterData', '2021-06-13 16:43:47', 'Y', 'N', NULL),
(6, 'createHakAkses', 'Add Access', 'panel/masterData/createHakAkses', 'C', 'MasterData', '2021-06-13 16:44:22', 'N', 'N', NULL),
(7, 'updateHakAkses', 'Update Access', 'panel/masterData/updateHakAkses', 'U', 'MasterData', '2021-06-13 16:44:58', 'N', 'N', NULL),
(8, 'deleteHakAkses', 'Delete Access', 'panel/masterData/deleteHakAkses', 'D', 'MasterData', '2021-06-13 16:45:25', 'N', 'N', NULL),
(9, 'identitasAplikasi', 'Application', 'panel/pengaturan/identitasAplikasi', 'U', 'Pengaturan', '2021-06-13 16:42:36', 'Y', 'N', NULL),
(11, 'daftarModul', 'List Module', 'panel/pengaturan/daftarModul', 'R', 'Pengaturan', '2021-08-21 14:18:12', 'Y', 'N', NULL),
(141, 'categories', 'List Of Categories', 'panel/masterData/categories', 'R', 'MasterData', '2021-06-13 16:31:47', 'Y', 'N', NULL),
(142, 'createCategory', 'Add Category', 'panel/masterData/createCategory', 'C', 'MasterData', '2021-06-13 16:32:25', 'N', 'N', NULL),
(143, 'updateCategory', 'Update Category', 'panel/masterData/updateCategory', 'U', 'MasterData', '2021-06-13 16:32:49', 'N', 'N', NULL),
(144, 'deleteCategory', 'Delete Category', 'panel/masterData/deleteCategory', 'D', 'MasterData', '2021-06-13 16:33:11', 'N', 'N', NULL),
(145, 'services', 'List Of Services', 'panel/masterData/services', 'R', 'MasterData', '2021-06-13 16:31:47', 'Y', 'N', NULL),
(146, 'createService', 'Add Service', 'panel/masterData/createService', 'C', 'MasterData', '2021-06-13 16:32:25', 'N', 'N', NULL),
(147, 'updateService', 'Update Service', 'panel/masterData/updateService', 'U', 'MasterData', '2021-06-13 16:32:49', 'N', 'N', NULL),
(148, 'deleteService', 'Delete Service', 'panel/masterData/deleteService', 'D', 'MasterData', '2021-06-13 16:33:11', 'N', 'N', NULL),
(149, 'question', 'List Of Question', 'panel/masterData/question', 'R', 'MasterData', '2021-06-13 16:31:47', 'Y', 'N', NULL),
(150, 'createQuestion', 'Add Question', 'panel/masterData/createQuestion', 'C', 'MasterData', '2021-06-13 16:32:25', 'N', 'N', NULL),
(151, 'updateQuestion', 'Update Question', 'panel/masterData/updateQuestion', 'U', 'MasterData', '2021-06-13 16:32:49', 'N', 'N', NULL),
(152, 'deleteQuestion', 'Delete Question', 'panel/masterData/deleteQuestion', 'D', 'MasterData', '2021-06-13 16:33:11', 'N', 'N', NULL),
(153, 'listSurvey', 'List Of Survey', 'panel/survey/listSurvey', 'R', 'Survey', '2021-06-13 16:31:47', 'Y', 'N', NULL),
(154, 'createSurvey', 'Add Survey', 'panel/survey/createSurvey', 'C', 'Survey', '2021-06-13 16:32:25', 'N', 'N', NULL),
(155, 'updateSurvey', 'Update Survey', 'panel/survey/updateSurvey', 'U', 'Survey', '2021-06-13 16:32:49', 'N', 'N', NULL),
(156, 'deleteSurvey', 'Delete Survey', 'panel/survey/deleteSurvey', 'D', 'Survey', '2021-06-13 16:33:11', 'N', 'N', NULL),
(157, 'listReport', 'List Of Report', 'panel/report/listReport', 'R', 'Report', '2021-06-13 16:31:47', 'Y', 'N', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_parent_modul`
--

CREATE TABLE `survei_parent_modul` (
  `id_parent_modul` int(11) NOT NULL,
  `class` varchar(225) DEFAULT NULL,
  `nama_parent_modul` varchar(225) NOT NULL,
  `urutan` int(11) NOT NULL,
  `icon` varchar(225) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `child_module` enum('Y','N') NOT NULL,
  `link` varchar(225) NOT NULL,
  `tampil_sidebar_parent` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `survei_parent_modul`
--

INSERT INTO `survei_parent_modul` (`id_parent_modul`, `class`, `nama_parent_modul`, `urutan`, `icon`, `created_time`, `child_module`, `link`, `tampil_sidebar_parent`) VALUES
(1, 'Dashboard', 'Dashboard', 1, 'fa fa-dashboard', '2021-06-13 02:20:51', 'N', 'panel/dashboard', 'Y'),
(2, 'MasterData', 'Master Data', 2, 'fa fa-desktop', '2021-06-13 02:28:46', 'Y', '#', 'Y'),
(3, 'Survey', 'Survey', 3, 'fa fa-bar-chart', '2022-04-07 05:01:10', 'Y', '#', 'Y'),
(4, 'Report', 'Report', 4, 'fa fa-file', '2022-04-11 03:31:57', 'Y', '#', 'Y'),
(5, 'Pengaturan', 'Setting', 5, 'fa fa-cog', '2022-03-05 02:59:25', 'Y', '#', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_pengguna`
--

CREATE TABLE `survei_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `hak_akses` varchar(225) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(250) NOT NULL,
  `foto_pengguna` varchar(250) DEFAULT NULL,
  `jenkel` enum('L','P') DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(250) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `login_token` varchar(50) DEFAULT NULL,
  `resetpass_token` varchar(50) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status_pengguna` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `survei_pengguna`
--

INSERT INTO `survei_pengguna` (`id_pengguna`, `username`, `password`, `email`, `no_hp`, `hak_akses`, `unit`, `nama_lengkap`, `foto_pengguna`, `jenkel`, `tgl_lahir`, `alamat`, `last_login`, `last_logout`, `login_token`, `resetpass_token`, `created_time`, `created_by`, `updated_time`, `updated_by`, `status_pengguna`) VALUES
(1, 'superadmin', '889a3a791b3875cfae413574b53da4bb8a90d53e', 'm.rizkifatihah@gmail.com', '', 'superadmin', NULL, 'Superadmin', NULL, '', '0000-00-00', '', '2022-06-21 18:40:40', '2022-06-20 12:44:10', NULL, NULL, '2022-03-05 03:49:06', NULL, '2022-04-03 09:48:11', 1, '1'),
(3, 'biroakademik', '2b0804a2d8d8151d96239cd78b6636f32c9440f5', '', '', 'admin', 'BIRO AKADEMIK', 'Biro Akademik', NULL, '', '0000-00-00', '', '2022-05-25 10:42:46', '2022-05-25 10:42:01', NULL, NULL, '2022-04-11 10:19:53', 1, '2022-04-11 10:25:29', 1, '1'),
(4, 'kemahasiswaan', '06ae73a1d20112a48492f6b9eae8b5b9ed9cdb27', 'kemahasiswaan@mail.com', '00', 'admin', 'BIRO KEMAHASISWAAN', 'kemahasiswaan', NULL, '', '0000-00-00', '', '2022-04-14 09:39:52', '2022-04-14 09:55:43', NULL, NULL, '2022-04-14 09:39:41', 1, NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_pertanyaan`
--

CREATE TABLE `survei_pertanyaan` (
  `id_pertanyaan` int(11) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `kategori_jawaban` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_pertanyaan`
--

INSERT INTO `survei_pertanyaan` (`id_pertanyaan`, `pertanyaan`, `kategori_jawaban`, `status`, `created_by`, `created_time`, `updated_time`, `updated_by`) VALUES
(1, 'Bagaimana kemudahan mendapatkan informasi persyaratan ', 1, '1', 1, '2022-04-07 11:50:55', '2022-04-07 11:58:52', 1),
(2, 'Bagaimana kemudahan memenuhi persyaratan pelayanan', 1, '1', 1, '2022-04-07 11:51:20', '2022-04-09 12:08:06', 1),
(3, 'Bagaimana kemudahan prosedur pelayanan', 1, '1', 1, '2022-04-07 11:51:41', '2022-04-09 12:08:11', 1),
(4, 'Bagaimana ketepatan waktu dalam penyelesaian pelayanan ', 1, '1', 1, '2022-04-07 11:54:17', '2022-04-09 12:08:21', 1),
(5, 'Bagaimana kesesuaian produk pelayanan antara yang tercantum dalam standar pelayanan dengan hasil yang diberikan ', 1, '1', 1, '2022-04-07 11:55:00', NULL, NULL),
(6, 'Bagaimana kompetensi dan kemampuan petugas dalam memberikan pelayanan', 1, '1', 1, '2022-04-07 11:55:13', NULL, NULL),
(7, 'Bagaimana perilaku petugas terkait kesopanan dan keramahan dalam memberikan pelayanan', 1, '1', 1, '2022-04-07 11:55:24', NULL, NULL),
(8, 'Bagaimana kualitas sarana dan prasarana pendukung pelayanan', 1, '1', 1, '2022-04-07 11:55:37', NULL, NULL),
(9, 'Apakah anda diminta bayaran', 3, '1', 1, '2022-04-07 11:55:48', NULL, NULL),
(10, 'Apakah tersedia tempat pengaduan', 3, '1', 1, '2022-04-07 11:55:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_standar_pelayanan`
--

CREATE TABLE `survei_standar_pelayanan` (
  `id_standar_pelayanan` int(11) NOT NULL,
  `nama_unit_kerja` varchar(255) NOT NULL,
  `kategori_unit` varchar(255) NOT NULL,
  `keterangan_standar_pelayanan` varchar(255) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_standar_pelayanan`
--

INSERT INTO `survei_standar_pelayanan` (`id_standar_pelayanan`, `nama_unit_kerja`, `kategori_unit`, `keterangan_standar_pelayanan`, `created_time`, `created_by`, `updated_by`, `updated_time`) VALUES
(1, 'STANDAR PELAYANAN PENUNDAAN KEGIATAN AKADEMIK', 'BIRO AKADEMIK', '', '2022-04-03 12:50:31', 1, 0, NULL),
(2, 'STANDAR PELAYANAN AKTIF KULIAH KEMBALI', 'BIRO AKADEMIK', '', '2022-04-03 12:50:39', 1, 0, NULL),
(3, 'STANDAR PELAYANAN PERPINDAHAN MAHASISWA USU KE PERGURUAN TINGGI NEGERI (PTN) LAIN', 'BIRO AKADEMIK', '', '2022-04-03 12:50:47', 1, 0, NULL),
(4, 'STANDAR PELAYANAN PERPINDAHAN MAHASISWA PTN LAIN KE USU', 'BIRO AKADEMIK', '', '2022-04-03 12:50:53', 1, 0, NULL),
(5, 'STANDAR PELAYANAN PERPINDAHAN MAHASISWA USU DARI PROGRAM SARJANA (S1) KE PROGRAM DIPLOMA (D3)', 'BIRO AKADEMIK', '', '2022-04-03 12:51:00', 1, 0, NULL),
(6, 'STANDAR PELAYANAN IJAZAH YANG RUSAK', 'BIRO AKADEMIK', '', '2022-04-03 12:51:06', 1, 0, NULL),
(7, 'STANDAR PELAYANAN  SERTIFIKAT AKREDITASI INSTITUSI', 'BIRO AKADEMIK', '', '2022-04-03 12:51:12', 1, 0, NULL),
(8, 'STANDAR PELAYANAN PERBAIKAN DATA MAHASISWA PANGKALAN DATA PENDIDIKAN TINGGI (PD DIKTI)', 'BIRO AKADEMIK', '', '2022-04-03 12:51:18', 1, 0, NULL),
(9, 'STANDAR PELAYANAN PERBAIKAN HOME BASE DOSEN PD DIKTI', 'BIRO AKADEMIK', '', '2022-04-03 12:51:24', 1, 0, NULL),
(10, 'STANDAR PELAYANAN VALIDASI KEALUMNIAN', 'BIRO AKADEMIK', '', '2022-04-03 12:51:30', 1, 0, NULL),
(11, 'STANDAR PELAYANAN BANTUAN KEGIATAN MAHASISWA ', 'BIRO KEMAHASISWAAN', '', '2022-04-03 12:51:45', 1, 0, NULL),
(12, 'STANDAR PELAYANAN  PENGURUSAN BEASISWA ', 'BIRO KEMAHASISWAAN', '', '2022-04-03 12:51:56', 1, 0, NULL),
(13, 'STANDAR PELAYANAN PENYEDIAAN SARANA DAN PRASARANA KEGIATAN UKM', 'BIRO KEMAHASISWAAN', '', '2022-04-03 12:52:01', 1, 0, NULL),
(14, 'STANDAR PELAYANAN ADMINISTRASI TUGAS AKHIR DAN WISUDA MAHASISWA BIDIKMISI/KIP KULIAH DAN AFIRMASI PAPUA ', 'BIRO KEMAHASISWAAN', '', '2022-04-03 12:52:07', 1, 0, NULL),
(15, 'STANDAR PELAYANAN PROGRAM KREATIVITAS MAHASISWA (PKM)', 'BIRO KEMAHASISWAAN', '', '2022-04-03 12:52:13', 1, 0, NULL),
(16, 'STANDAR PELAYANAN PERMINTAAN SURAT KETERANGAN LUNAS PEMBAYARAN UANG KULIAH (SPP) MAHASISWA', 'BIRO KEUANGAN', '', '2022-04-03 12:52:21', 1, 0, NULL),
(17, 'STANDAR PELAYANAN PENDAMPINGAN LEMBAGA/BADAN AUDIT EKSTERNAL', 'BIRO KEUANGAN', '', '2022-04-03 12:52:27', 1, 0, NULL),
(18, 'STANDAR PELAYANAN PELAPORAN PAJAK ORANG PRIBADI (DOSEN DAN TENDIK)', 'BIRO KEUANGAN', '', '2022-04-03 12:52:32', 1, 0, NULL),
(19, 'STANDAR PELAYANAN VERIFIKASI KERINGANAN UANG KULIAH TUNGGAL (UKT) BAGI MAHASISWA USU', 'BIRO KEUANGAN', '', '2022-04-03 12:52:37', 1, 0, NULL),
(20, 'STANDAR PELAYANAN  PENUNDAAN UKT BAGI MAHASISWA USU', 'BIRO KEUANGAN', '', '2022-04-03 12:52:41', 1, 0, NULL),
(21, 'STANDAR PELAYANAN PENYERAHAN BUKTI FAKTUR PAJAK KEPADA ORANG/PRIBADI/PERUSAHAAN', 'BIRO KEUANGAN', '', '2022-04-03 12:52:45', 1, 0, NULL),
(22, 'STANDAR PELAYANAN MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', 'BIRO SUMBER DAYA MANUSIA', '', '2022-04-03 12:52:53', 1, 0, NULL),
(23, 'STANDAR PELAYANAN STUDI LANJUT TUGAS BELAJAR/IZIN BELAJAR DALAM DAN LUAR NEGERI SERTA PENGAKTIFAN KEMBALI SETELAH SELESAI STUDI', 'BIRO SUMBER DAYA MANUSIA', '', '2022-04-03 12:52:58', 1, 0, NULL),
(24, 'STANDAR PELAYANAN PENSIUN KENAIKAN PANGKAT PENGABDIAN DAN PENSIUN JANDA/DUDA BAGI DOSEN DAN TENAGA KEPENDIDIKAN', 'BIRO SUMBER DAYA MANUSIA', '', '2022-04-03 12:53:02', 1, 0, NULL),
(25, 'STANDAR PELAYANAN DOSEN PENERIMA BANTUAN PENDIDIKAN DAN BANTUAN PENELITIAN KUALIFIKASI S2, S3, SP1 DAN SP2', 'BIRO SUMBER DAYA MANUSIA', '', '2022-04-03 12:53:07', 1, 0, NULL),
(26, 'STANDAR PELAYANAN PEMBERIAN CUTI BAGI TENAGA KEPENDIDIKAN PADA TINGKAT UNIVERSITAS DAN UNIT KERJA', 'BIRO SUMBER DAYA MANUSIA', '', '2022-04-03 12:53:11', 1, 0, NULL),
(27, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN PNS', 'BIRO SUMBER DAYA MANUSIA', '', '2022-04-03 12:53:16', 1, 0, NULL),
(28, 'STANDAR PELAYANAN PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON PNS', 'BIRO SUMBER DAYA MANUSIA', '', '2022-04-03 12:53:20', 1, 0, NULL),
(29, 'STANDAR PELAYANAN PENCAIRAN DANA KERJASAMA', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:53:28', 1, 0, NULL),
(30, 'STANDAR PELAYANAN PEMBUATAN NOTA KESEPAHAMAN', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:53:46', 1, 0, NULL),
(31, 'STANDAR PELAYANAN PEMBUATAN PERJANJIAN KERJASAMA', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:53:52', 1, 0, NULL),
(32, 'STANDAR PELAYANAN PENGAJUAN INSENTIF PUBLIKASI DOSEN', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:53:58', 1, 0, NULL),
(33, 'STANDAR PELAYANAN PROSES PENGELOLAAN KONFERENSI', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:54:02', 1, 0, NULL),
(34, 'STANDAR PELAYANAN PROSES PENGELOLAAN JURNAL', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:54:07', 1, 0, NULL),
(35, 'STANDAR PELAYANAN PROSES VERIFIKASI SINTA', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:54:14', 1, 0, NULL),
(36, 'STANDAR PELAYANAN PROSES PENGAJUAN PUSAT UNGGULAN IPTEK/PUSAT KAJIAN', 'BIRO KERJASAMA DAN PENELITIAN', '', '2022-04-03 12:55:26', 1, 0, NULL),
(37, 'STANDAR PELAYANAN PENYUSUNAN RENCANA KERJA ANGGARAN (RKA) DAN RKA PERUBAHAN SATUAN KERJA', 'BIRO PERENCANAAN DAN PENGEMBANGAN', '', '2022-04-03 12:56:44', 1, 0, NULL),
(38, 'STANDAR PELAYANAN PENGELOLAAN AKUN SIM RKA SATUAN KERJA', 'BIRO PERENCANAAN DAN PENGEMBANGAN', '', '2022-04-03 12:56:50', 1, 0, NULL),
(39, 'STANDAR PELAYANAN PENYEDIAAN INFORMASI BERBASIS WEB', 'BIRO PERENCANAAN DAN PENGEMBANGAN', '', '2022-04-03 12:56:55', 1, 0, NULL),
(40, 'STANDAR PELAYANAN PERMOHONAN SEWA MENYEWA BARANG MILIK UNIVERSITAS', 'BIRO ASET DAN USAHA', '', '2022-04-03 12:57:05', 1, 0, NULL),
(41, 'STANDAR PELAYANAN USAHA MIKRO KECIL, DAN MENENGAH MITRA BINAAN', 'BIRO ASET DAN USAHA', '', '2022-04-03 12:57:09', 1, 0, NULL),
(42, 'STANDAR PELAYANAN PEMAKAIAN FASILITAS UMUM (JALAN DAN RUANG TERBUKA)', 'BIRO ASET DAN USAHA', '', '2022-04-03 12:57:14', 1, 0, NULL),
(43, 'STANDAR PELAYANAN TATA PERSURATAN', 'TATA USAHA', '', '2022-04-03 12:57:22', 1, 0, NULL),
(44, 'STANDAR PELAYANAN KONSULTASI NASKAH DINAS TANPA MELALUI SURAT', 'TATA USAHA', '', '2022-04-03 12:57:27', 1, 0, NULL),
(45, 'STANDAR PELAYANAN PELAYANAN PEMBAHASAN RANCANGAN PERATURAN DAN KEPUTUSAN INTERNAL USU', 'KANTOR URUSAN HUKUM', '', '2022-04-03 12:57:35', 1, 0, NULL),
(46, 'STANDAR PELAYANAN PENELAAHAN KASUS DAN MASALAH HUKUM DI LINGKUNGAN USU', 'KANTOR URUSAN HUKUM', '', '2022-04-03 12:57:40', 1, 0, NULL),
(47, 'STANDAR PELAYANAN PENELAAHAN DAN PANILAIAN USULAN NOTA KESEPAHAMAN DAN/ATAU PERJANJIAN KERJA SAMA YANG BERESIKO HUKUM TINGGI DI LINGKUNGAN USU', 'KANTOR URUSAN HUKUM', '', '2022-04-03 12:57:44', 1, 0, NULL),
(48, 'STANDAR PELAYANAN LEGAL AUDIT PADA UNSUR KEGIATAN USAHA DAN SOSIAL DI LINGKUNGAN USU', 'KANTOR URUSAN HUKUM', '', '2022-04-03 12:57:48', 1, 0, NULL),
(49, 'STANDAR PELAYANAN PERMOHONAN INFORMASI PUBLIK', 'HUMAS', '', '2022-04-03 12:57:55', 1, 0, NULL),
(50, 'STANDAR PELAYANAN SISTEM PENGELOLAAN PENGADUAN PELAYANAN PUBLIK NASIONAL (SP4N) LAPOR', 'HUMAS', '', '2022-04-03 12:57:59', 1, 0, NULL),
(51, 'STANDAR PELAYANAN BAHAN WAWANCARA PIMPINAN UNIVERSITAS', 'HUMAS', '', '2022-04-03 12:58:04', 1, 0, NULL),
(52, 'STANDAR PELAYANAN AKUISISI ARSIP', 'ARSIP', '', '2022-04-03 12:58:11', 1, 0, NULL),
(53, 'STANDAR PELAYANAN PENYELAMATAN DAN PELESTARIAN ARSIP', 'ARSIP', '', '2022-04-03 12:58:16', 1, 0, NULL),
(54, 'STANDAR PELAYANAN PEMUSNAHAN ARSIP', 'ARSIP', '', '2022-04-03 12:58:21', 1, 0, NULL),
(55, 'STANDAR PELAYANAN ARSIP PEMINJAMAN', 'ARSIP', '', '2022-04-03 12:58:26', 1, 0, NULL),
(56, 'STANDAR PELAYANAN KONSULTASI ARSIP', 'ARSIP', '', '2022-04-03 12:58:30', 1, 0, NULL),
(57, 'STANDAR PELAYANAN ALIH MEDIA DAN DIGITALISASI ARSIP', 'ARSIP', '', '2022-04-03 12:58:35', 1, 0, NULL),
(58, 'CETAK BUKTI SPP', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:58:44', 1, 1, '2022-04-03 13:12:32'),
(59, 'CETAK SLIP PEMBAYARAN ONLINE', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:58:47', 1, 0, NULL),
(60, 'CETAK KTMS HILANG', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:58:52', 1, 0, NULL),
(61, 'RESET PASSWORD PORTAL MAHASISWA', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:58:56', 1, 0, NULL),
(62, 'RESET PASSWOD SISTEM REGISTRASI/SIREG', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:00', 1, 0, NULL),
(63, 'RESET PASSWORD EMAIL USU MAHASISWA', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:03', 1, 0, NULL),
(64, 'RESET PASSWORD EMAIL USU DOSEN/TENAGA KEPENDIDIKAN', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:09', 1, 0, NULL),
(65, 'PANDUAN REGISTRASI MAHASISWA ONLINE', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:14', 1, 0, NULL),
(66, 'PEMBUATAN EMAIL USU MAHASISWA', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:27', 1, 0, NULL),
(67, 'PEMBUATAN EMAIL USU DOSEN', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:32', 1, 0, NULL),
(68, 'PEMBUATAN EMAIL USU TENAGA KEPENDIDIKAN', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:36', 1, 0, NULL),
(69, 'PERBAIKAN DATA DASAR MAHASISWA', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:40', 1, 0, NULL),
(70, 'SURAT KETERANGAN AKREDITAS UNIVERSITAS', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:45', 1, 0, NULL),
(71, 'SURAT KETERANGAN MAHASISWA BIDIKMISI/KIP', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:49', 1, 0, NULL),
(72, 'SURAT KETERANGAN MAHASISWA AFIRMASI', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:53', 1, 0, NULL),
(73, 'SURAT KETERANGAN TIDAK TERDAFTAR SEBAGAI PENERIMA BEASISWA', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 12:59:57', 1, 0, NULL),
(74, 'PENCETAKAN KTM HILANG/RUSAK', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:01', 1, 0, NULL),
(75, 'PENCETAKAN ID CARD DOSEN BARU/HILANG/RUSAK', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:05', 1, 0, NULL),
(76, 'PENCETAKAN ID CARD TENAGA KEPENDIDIKAN BARU/HILANG/RUSAK', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:09', 1, 0, NULL),
(77, 'MENGIKUTI KEGIATAN TRI DHARMA PERGURUAN TINGGI', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:13', 1, 0, NULL),
(78, 'MUTASI/PINDAH ANTAR INSTANSI BAGI DOSEN DAN TENAGA KEPENDIDIKAN', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:17', 1, 0, NULL),
(79, 'PEMBERIAN CUTI TINGKAT UNIVERSITAS ', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:22', 1, 0, NULL),
(80, 'PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN PNS', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:26', 1, 0, NULL),
(81, 'PENGUNDURAN DIRI BAGI DOSEN DAN TENAGA KEPENDIDIKAN NON-PNS', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:00:30', 1, 0, NULL),
(83, 'PEMAKAIAN FASILITAS UMUM (JALAN DAN RUANG TERBUKA)', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:13:53', 1, 0, NULL),
(84, 'SURAT BUKTI PENYERAHAN SKRIPSI ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:18:15', 1, 0, NULL),
(85, 'SURAT KETERANGAN NILAI ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:18:33', 1, 0, NULL),
(86, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:18:38', 1, 0, NULL),
(87, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:18:43', 1, 0, NULL),
(88, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:18:48', 1, 0, NULL),
(89, 'SURAT PERMOHONAN IZIN PENELITIAN ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:18:52', 1, 0, NULL),
(90, 'SURAT PERMOHONAN IZIN PRAPENELITIAN ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:18:59', 1, 0, NULL),
(91, 'SURAT PERMOHONAN KETERANGAN ALUMNI ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:04', 1, 0, NULL),
(92, 'SURAT PERMOHONAN PENGAJUAN JUDUL  ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:09', 1, 0, NULL),
(93, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL  ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:14', 1, 0, NULL),
(94, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:19', 1, 0, NULL),
(95, 'REKOMENDASI BEASISWA', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:24', 1, 0, NULL),
(96, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:29', 1, 0, NULL),
(97, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:34', 1, 0, NULL),
(98, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:38', 1, 0, NULL),
(99, 'AKREDITASI PROGRAM STUDI ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:43', 1, 0, NULL),
(100, 'SURAT PERMOHONAN KEHILANGAN ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:47', 1, 0, NULL),
(101, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:52', 1, 0, NULL),
(102, 'PEMBIMBING SKRIPSI / TUGAS AKHIR ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:19:56', 1, 0, NULL),
(103, 'PENUNDAAN KEGIATAN AKADEMIK (PKA) ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:20:00', 1, 0, NULL),
(104, 'KETERLAMBATAN PEMBAYARAN SPP ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:20:05', 1, 0, NULL),
(105, 'AKTIF KULIAH KEMBALI (AKK) ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:20:10', 1, 0, NULL),
(106, 'MENGUNDURKAN DIRI ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:20:14', 1, 0, NULL),
(107, 'PRAKTEK KERJA LAPANGAN (PKL) ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:20:18', 1, 0, NULL),
(108, 'UJIAN KHUSUS ', 'FAKULTAS KEDOKTERAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:20:23', 1, 0, NULL),
(109, 'SURAT BUKTI PENYERAHAN SKRIPSI ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:21:42', 1, 0, NULL),
(110, 'SURAT KETERANGAN NILAI ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:21:48', 1, 0, NULL),
(111, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:21:53', 1, 0, NULL),
(112, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:21:57', 1, 0, NULL),
(113, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:01', 1, 0, NULL),
(114, 'SURAT PERMOHONAN IZIN PENELITIAN ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:07', 1, 0, NULL),
(115, 'SURAT PERMOHONAN IZIN PRAPENELITIAN ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:15', 1, 0, NULL),
(116, 'SURAT PERMOHONAN KETERANGAN ALUMNI ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:19', 1, 0, NULL),
(117, 'SURAT PERMOHONAN PENGAJUAN JUDUL  ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:23', 1, 0, NULL),
(118, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL  ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:27', 1, 0, NULL),
(119, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:31', 1, 0, NULL),
(120, 'REKOMENDASI BEASISWA', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:35', 1, 0, NULL),
(121, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:40', 1, 0, NULL),
(122, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:44', 1, 0, NULL),
(123, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:48', 1, 0, NULL),
(124, 'AKREDITASI PROGRAM STUDI ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:54', 1, 0, NULL),
(125, 'SURAT PERMOHONAN KEHILANGAN ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:22:59', 1, 0, NULL),
(126, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:04', 1, 0, NULL),
(127, 'PEMBIMBING SKRIPSI / TUGAS AKHIR ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:08', 1, 0, NULL),
(128, 'PENUNDAAN KEGIATAN AKADEMIK (PKA) ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:12', 1, 0, NULL),
(129, 'KETERLAMBATAN PEMBAYARAN SPP ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:17', 1, 0, NULL),
(130, 'AKTIF KULIAH KEMBALI (AKK) ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:22', 1, 0, NULL),
(131, 'MENGUNDURKAN DIRI ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:26', 1, 0, NULL),
(132, 'PRAKTEK KERJA LAPANGAN (PKL) ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:31', 1, 0, NULL),
(133, 'UJIAN KHUSUS ', 'FAKULTAS HUKUM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:36', 1, 0, NULL),
(134, 'SURAT BUKTI PENYERAHAN SKRIPSI ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:50', 1, 0, NULL),
(135, 'SURAT KETERANGAN NILAI ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:23:55', 1, 0, NULL),
(136, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:00', 1, 0, NULL),
(137, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:04', 1, 0, NULL),
(138, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:09', 1, 0, NULL),
(139, 'SURAT PERMOHONAN IZIN PENELITIAN ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:16', 1, 0, NULL),
(140, 'SURAT PERMOHONAN IZIN PRAPENELITIAN ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:24', 1, 0, NULL),
(141, 'SURAT PERMOHONAN KETERANGAN ALUMNI ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:29', 1, 0, NULL),
(142, 'SURAT PERMOHONAN PENGAJUAN JUDUL  ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:34', 1, 0, NULL),
(143, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL  ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:38', 1, 0, NULL),
(144, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:42', 1, 0, NULL),
(145, 'REKOMENDASI BEASISWA', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:46', 1, 0, NULL),
(146, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:50', 1, 0, NULL),
(147, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:54', 1, 0, NULL),
(148, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:24:59', 1, 0, NULL),
(149, 'AKREDITASI PROGRAM STUDI ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:03', 1, 0, NULL),
(150, 'SURAT PERMOHONAN KEHILANGAN ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:08', 1, 0, NULL),
(151, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:12', 1, 0, NULL),
(152, 'PEMBIMBING SKRIPSI / TUGAS AKHIR ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:16', 1, 0, NULL),
(153, 'PENUNDAAN KEGIATAN AKADEMIK (PKA) ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:20', 1, 0, NULL),
(154, 'KETERLAMBATAN PEMBAYARAN SPP ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:25', 1, 0, NULL),
(155, 'AKTIF KULIAH KEMBALI (AKK) ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:29', 1, 0, NULL),
(156, 'MENGUNDURKAN DIRI ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:33', 1, 0, NULL),
(157, 'PRAKTEK KERJA LAPANGAN (PKL) ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:38', 1, 0, NULL),
(158, 'UJIAN KHUSUS ', 'FAKULTAS PERTANIAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:25:42', 1, 0, NULL),
(159, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(160, 'SURAT KETERANGAN NILAI', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(161, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(162, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(163, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(164, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(165, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(166, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(167, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(168, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(169, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(170, 'REKOMENDASI BEASISWA', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(171, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(172, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(173, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(174, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(175, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(176, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(177, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(178, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(179, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(180, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(181, 'MENGUNDURKAN DIRI', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(182, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(183, 'UJIAN KHUSUS', 'FAKULTAS TEKNIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:40:58', 1, 0, NULL),
(184, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(185, 'SURAT KETERANGAN NILAI', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(186, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(187, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(188, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(189, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(190, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(191, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(192, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(193, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(194, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(195, 'REKOMENDASI BEASISWA', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(196, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(197, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(198, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(199, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(200, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(201, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(202, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(203, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(204, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(205, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(206, 'MENGUNDURKAN DIRI', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(207, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(208, 'UJIAN KHUSUS', 'FAKULTAS EKONOMI DAN BISNIS', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:06', 1, 0, NULL),
(209, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(210, 'SURAT KETERANGAN NILAI', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(211, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(212, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(213, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(214, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(215, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(216, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(217, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(218, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(219, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(220, 'REKOMENDASI BEASISWA', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(221, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(222, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(223, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(224, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(225, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(226, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(227, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(228, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(229, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(230, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(231, 'MENGUNDURKAN DIRI', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(232, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(233, 'UJIAN KHUSUS', 'FAKULTAS KEDOKTERAN GIGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:14', 1, 0, NULL),
(234, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(235, 'SURAT KETERANGAN NILAI', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(236, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(237, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(238, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(239, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(240, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(241, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(242, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(243, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(244, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(245, 'REKOMENDASI BEASISWA', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(246, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(247, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(248, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(249, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(250, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(251, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(252, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(253, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(254, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(255, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(256, 'MENGUNDURKAN DIRI', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(257, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(258, 'UJIAN KHUSUS', 'FAKULTAS ILMU BUDAYA ', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:20', 1, 0, NULL),
(259, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(260, 'SURAT KETERANGAN NILAI', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(261, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(262, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(263, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(264, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(265, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(266, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(267, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(268, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(269, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(270, 'REKOMENDASI BEASISWA', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(271, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(272, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(273, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(274, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(275, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(276, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(277, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(278, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(279, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(280, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(281, 'MENGUNDURKAN DIRI', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(282, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(283, 'UJIAN KHUSUS', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:26', 1, 0, NULL),
(284, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(285, 'SURAT KETERANGAN NILAI', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(286, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(287, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(288, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(289, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(290, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(291, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(292, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(293, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(294, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(295, 'REKOMENDASI BEASISWA', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(296, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(297, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(298, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(299, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(300, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(301, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(302, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(303, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(304, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(305, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(306, 'MENGUNDURKAN DIRI', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(307, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(308, 'UJIAN KHUSUS', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:34', 1, 0, NULL),
(309, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(310, 'SURAT KETERANGAN NILAI', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(311, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(312, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(313, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(314, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(315, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(316, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(317, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(318, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(319, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(320, 'REKOMENDASI BEASISWA', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(321, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(322, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(323, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(324, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(325, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(326, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(327, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(328, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(329, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(330, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(331, 'MENGUNDURKAN DIRI', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(332, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(333, 'UJIAN KHUSUS', 'FAKULTAS KESEHATAN MASYARAKAT', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:41', 1, 0, NULL),
(334, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(335, 'SURAT KETERANGAN NILAI', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(336, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(337, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(338, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(339, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(340, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(341, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(342, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(343, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(344, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(345, 'REKOMENDASI BEASISWA', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(346, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(347, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(348, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(349, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(350, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(351, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(352, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(353, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(354, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(355, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(356, 'MENGUNDURKAN DIRI', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(357, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(358, 'UJIAN KHUSUS', 'FAKULTAS KEPERAWATAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:47', 1, 0, NULL),
(359, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(360, 'SURAT KETERANGAN NILAI', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(361, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(362, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(363, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(364, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(365, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(366, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(367, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(368, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(369, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(370, 'REKOMENDASI BEASISWA', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(371, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(372, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(373, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(374, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(375, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(376, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(377, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(378, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(379, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(380, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(381, 'MENGUNDURKAN DIRI', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(382, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL),
(383, 'UJIAN KHUSUS', 'FAKULTAS PSIKOLOGI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:52', 1, 0, NULL);
INSERT INTO `survei_standar_pelayanan` (`id_standar_pelayanan`, `nama_unit_kerja`, `kategori_unit`, `keterangan_standar_pelayanan`, `created_time`, `created_by`, `updated_by`, `updated_time`) VALUES
(384, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(385, 'SURAT KETERANGAN NILAI', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(386, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(387, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(388, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(389, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(390, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(391, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(392, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(393, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(394, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(395, 'REKOMENDASI BEASISWA', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(396, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(397, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(398, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(399, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(400, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(401, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(402, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(403, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(404, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(405, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(406, 'MENGUNDURKAN DIRI', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(407, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(408, 'UJIAN KHUSUS', 'FAKULTAS FARMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:41:58', 1, 0, NULL),
(409, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(410, 'SURAT KETERANGAN NILAI', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(411, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(412, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(413, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(414, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(415, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(416, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(417, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(418, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(419, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(420, 'REKOMENDASI BEASISWA', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(421, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(422, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(423, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(424, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(425, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(426, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(427, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(428, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(429, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(430, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(431, 'MENGUNDURKAN DIRI', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(432, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(433, 'UJIAN KHUSUS', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:04', 1, 0, NULL),
(434, 'SURAT BUKTI PENYERAHAN SKRIPSI', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(435, 'SURAT KETERANGAN NILAI', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(436, 'SURAT BERHAK MENGIKUTI UJIAN SKRIPSI', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(437, 'SURAT PERMOHONAN MAGANG', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(438, 'SURAT PERMOHONAN PENGAMBILAN IJAZAH', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(439, 'SURAT PERMOHONAN IZIN PENELITIAN', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(440, 'SURAT PERMOHONAN IZIN  PRAPENELITIAN', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(441, 'SURAT PERMOHONAN KETERANGAN ALUMNI', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(442, 'SURAT PERMOHONAN PENGAJUAN JUDUL', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(443, 'SURAT PENERBITAN KARYA ILMIAH / JURNAL', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(444, 'UNDANGAN UJIAN SKRIPSI / TUGAS AKHIR', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(445, 'REKOMENDASI BEASISWA', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(446, 'UNDANGAN SEMINAR PROPOSAL/HASIL PENELITIAN', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(447, 'PERNYATAAN AKTIF KULIAH MAHASISWA UNTUK BIAYA TANGGUNGAN ORANGTUA', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(448, 'SURAT IZIN TIDAK MENGIKUTI PERKULIAHAN', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(449, 'AKREDITASI PROGRAM STUDI', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(450, 'SURAT PERMOHONAN KEHILANGAN', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(451, 'SURAT AKTIF KULIAH MAHASISWA', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(452, 'PEMBIMBING SKRIPSI / TUGAS AKHIR', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(453, 'PENUNDAAN KEGIATAN AKADEMIK (PKA)', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(454, 'KETERLAMBATAN PEMBAYARAN SPP', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(455, 'AKTIF KULIAH KEMBALI (AKK)', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(456, 'MENGUNDURKAN DIRI', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(457, 'PRAKTEK KERJA LAPANGAN (PKL)', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(458, 'UJIAN KHUSUS', 'FAKULTAS KEHUTANAN', 'APLIKASI SATU ATAP (ASA)', '2022-04-18 21:42:10', 1, 0, NULL),
(506, 'UMUM', 'SEKOLAH PASCASARJANA (SPS)', 'AKADEMIK', '2022-04-18 21:54:15', 1, 0, NULL),
(507, 'UMUM', 'PERPUSTAKAAN', '', '2022-04-18 21:54:23', 1, 0, NULL),
(508, 'UMUM', 'RUMAH SAKIT USU', '', '2022-04-18 21:54:32', 1, 0, NULL),
(509, 'UMUM', 'POLIKLINIK', '', '2022-04-18 21:54:40', 1, 0, NULL),
(510, 'UMUM', 'RUMAH SAKIT GIGI DAN MULUT', '', '2022-04-18 21:54:48', 1, 0, NULL),
(511, 'UMUM', 'PUSAT SISTEM INFORMASI', '', '2022-04-18 21:55:18', 1, 0, NULL),
(512, 'UMUM', 'LPPM', '', '2022-04-18 21:55:26', 1, 0, NULL),
(513, 'UMUM', 'LP', '', '2022-04-18 21:55:32', 1, 0, NULL),
(514, 'UMUM', 'PUSAT BAHASA', '', '2022-04-18 21:55:45', 1, 0, NULL),
(515, 'UMUM', 'LINKS', '', '2022-04-18 21:55:51', 1, 0, NULL),
(516, 'UMUM', 'UMM', '', '2022-04-18 21:55:59', 1, 0, NULL),
(517, 'UMUM', 'UNIT PELAYANAN, PENGEMBANGAN DAN PENDIDIKAN', '', '2022-04-18 21:56:05', 1, 0, NULL),
(518, 'UMUM', 'LABORATORIUM TERPADU', '', '2022-04-18 21:56:12', 1, 0, NULL),
(519, 'UMUM', 'FAKULTAS EKONOMI DAN BISNIS', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(520, 'UMUM', 'FAKULTAS FARMASI', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(521, 'UMUM', 'FAKULTAS HUKUM', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(522, 'UMUM', 'FAKULTAS ILMU BUDAYA ', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(523, 'UMUM', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(524, 'UMUM', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(525, 'UMUM', 'FAKULTAS KEDOKTERAN', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(526, 'UMUM', 'FAKULTAS KEDOKTERAN GIGI', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(527, 'UMUM', 'FAKULTAS KEHUTANAN', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(528, 'UMUM', 'FAKULTAS KEPERAWATAN', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(529, 'UMUM', 'FAKULTAS KESEHATAN MASYARAKAT', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(530, 'UMUM', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(531, 'UMUM', 'FAKULTAS PERTANIAN', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(532, 'UMUM', 'FAKULTAS PSIKOLOGI', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(533, 'UMUM', 'FAKULTAS TEKNIK', 'AKADEMIK', '2022-04-22 18:05:39', 1, 1, NULL),
(535, 'UMUM', 'FAKULTAS EKONOMI DAN BISNIS', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(536, 'UMUM', 'FAKULTAS FARMASI', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(537, 'UMUM', 'FAKULTAS HUKUM', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(538, 'UMUM', 'FAKULTAS ILMU BUDAYA ', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(539, 'UMUM', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(540, 'UMUM', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(541, 'UMUM', 'FAKULTAS KEDOKTERAN', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(542, 'UMUM', 'FAKULTAS KEDOKTERAN GIGI', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(543, 'UMUM', 'FAKULTAS KEHUTANAN', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(544, 'UMUM', 'FAKULTAS KEPERAWATAN', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(545, 'UMUM', 'FAKULTAS KESEHATAN MASYARAKAT', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(546, 'UMUM', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(547, 'UMUM', 'FAKULTAS PERTANIAN', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(548, 'UMUM', 'FAKULTAS PSIKOLOGI', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(549, 'UMUM', 'FAKULTAS TEKNIK', 'KEUANGAN', '2022-04-22 18:05:39', 1, 1, NULL),
(550, 'UMUM', 'FAKULTAS EKONOMI DAN BISNIS', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(551, 'UMUM', 'FAKULTAS FARMASI', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(552, 'UMUM', 'FAKULTAS HUKUM', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(553, 'UMUM', 'FAKULTAS ILMU BUDAYA ', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(554, 'UMUM', 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(555, 'UMUM', 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(556, 'UMUM', 'FAKULTAS KEDOKTERAN', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(557, 'UMUM', 'FAKULTAS KEDOKTERAN GIGI', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(558, 'UMUM', 'FAKULTAS KEHUTANAN', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(559, 'UMUM', 'FAKULTAS KEPERAWATAN', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(560, 'UMUM', 'FAKULTAS KESEHATAN MASYARAKAT', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(561, 'UMUM', 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(562, 'UMUM', 'FAKULTAS PERTANIAN', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(563, 'UMUM', 'FAKULTAS PSIKOLOGI', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(564, 'UMUM', 'FAKULTAS TEKNIK', 'KEMAHASISWAAN', '2022-04-22 18:05:39', 1, 1, NULL),
(565, 'UMUM', 'SEKOLAH PASCASARJANA (SPS)', 'KEUANGAN', '2022-04-18 21:54:15', 1, 0, NULL),
(566, 'UMUM', 'SEKOLAH PASCASARJANA (SPS)', 'KEMAHASISWAAN', '2022-04-18 21:54:15', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `survei_sub_kategori`
--

CREATE TABLE `survei_sub_kategori` (
  `id_sub_kategori` int(11) NOT NULL,
  `nama_sub_kategori` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_sub_kategori`
--

INSERT INTO `survei_sub_kategori` (`id_sub_kategori`, `nama_sub_kategori`, `kategori`) VALUES
(1, 'APLIKASI SATU ATAP (ASA)', 'FAKULTAS'),
(2, 'AKADEMIK', 'FAKULTAS'),
(3, 'KEUANGAN', 'FAKULTAS'),
(4, 'KEMAHASISWAAN', 'FAKULTAS'),
(5, 'AKADEMIK', 'SEKOLAH PASCASARJANA '),
(6, 'KEUANGAN', 'SEKOLAH PASCASARJANA '),
(7, 'KEMAHASISWAAN', 'SEKOLAH PASCASARJANA ');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `survei_daftar_survei`
--
ALTER TABLE `survei_daftar_survei`
  ADD PRIMARY KEY (`id_daftar_survei`);

--
-- Indeks untuk tabel `survei_detail_survei`
--
ALTER TABLE `survei_detail_survei`
  ADD PRIMARY KEY (`id_detail_survei`);

--
-- Indeks untuk tabel `survei_hak_akses`
--
ALTER TABLE `survei_hak_akses`
  ADD PRIMARY KEY (`id_hak_akses`),
  ADD UNIQUE KEY `nama_hak_akses` (`nama_hak_akses`);

--
-- Indeks untuk tabel `survei_identitas`
--
ALTER TABLE `survei_identitas`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indeks untuk tabel `survei_jawaban`
--
ALTER TABLE `survei_jawaban`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indeks untuk tabel `survei_kategori`
--
ALTER TABLE `survei_kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `nama_kategori` (`nama_kategori`);

--
-- Indeks untuk tabel `survei_modul`
--
ALTER TABLE `survei_modul`
  ADD PRIMARY KEY (`id_modul`),
  ADD UNIQUE KEY `controller_modul` (`controller_modul`),
  ADD KEY `class_parent_modul` (`class_parent_modul`),
  ADD KEY `induk_child_modul` (`induk_child_modul`);

--
-- Indeks untuk tabel `survei_parent_modul`
--
ALTER TABLE `survei_parent_modul`
  ADD PRIMARY KEY (`id_parent_modul`),
  ADD UNIQUE KEY `class` (`class`);

--
-- Indeks untuk tabel `survei_pengguna`
--
ALTER TABLE `survei_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `FK_hak_akses` (`hak_akses`);

--
-- Indeks untuk tabel `survei_pertanyaan`
--
ALTER TABLE `survei_pertanyaan`
  ADD PRIMARY KEY (`id_pertanyaan`);

--
-- Indeks untuk tabel `survei_standar_pelayanan`
--
ALTER TABLE `survei_standar_pelayanan`
  ADD PRIMARY KEY (`id_standar_pelayanan`),
  ADD KEY `kategori_unit` (`kategori_unit`);

--
-- Indeks untuk tabel `survei_sub_kategori`
--
ALTER TABLE `survei_sub_kategori`
  ADD PRIMARY KEY (`id_sub_kategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `survei_daftar_survei`
--
ALTER TABLE `survei_daftar_survei`
  MODIFY `id_daftar_survei` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `survei_detail_survei`
--
ALTER TABLE `survei_detail_survei`
  MODIFY `id_detail_survei` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT untuk tabel `survei_hak_akses`
--
ALTER TABLE `survei_hak_akses`
  MODIFY `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `survei_jawaban`
--
ALTER TABLE `survei_jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT untuk tabel `survei_kategori`
--
ALTER TABLE `survei_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT untuk tabel `survei_modul`
--
ALTER TABLE `survei_modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT untuk tabel `survei_pengguna`
--
ALTER TABLE `survei_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `survei_pertanyaan`
--
ALTER TABLE `survei_pertanyaan`
  MODIFY `id_pertanyaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `survei_standar_pelayanan`
--
ALTER TABLE `survei_standar_pelayanan`
  MODIFY `id_standar_pelayanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=567;

--
-- AUTO_INCREMENT untuk tabel `survei_sub_kategori`
--
ALTER TABLE `survei_sub_kategori`
  MODIFY `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `survei_modul`
--
ALTER TABLE `survei_modul`
  ADD CONSTRAINT `survei_modul_ibfk_1` FOREIGN KEY (`class_parent_modul`) REFERENCES `survei_parent_modul` (`class`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `survei_pengguna`
--
ALTER TABLE `survei_pengguna`
  ADD CONSTRAINT `survei_pengguna_ibfk_1` FOREIGN KEY (`hak_akses`) REFERENCES `survei_hak_akses` (`nama_hak_akses`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `survei_standar_pelayanan`
--
ALTER TABLE `survei_standar_pelayanan`
  ADD CONSTRAINT `survei_standar_pelayanan_ibfk_1` FOREIGN KEY (`kategori_unit`) REFERENCES `survei_kategori` (`nama_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
