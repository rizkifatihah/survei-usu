-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 22 Apr 2022 pada 18.20
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survei-usu`
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
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'superadmin', '889a3a791b3875cfae413574b53da4bb8a90d53e', 'm.rizkifatihah@gmail.com', '', 'superadmin', NULL, 'Superadmin', NULL, '', '0000-00-00', '', '2022-04-22 20:29:44', '2022-04-22 20:28:05', NULL, NULL, '2022-03-05 03:49:06', NULL, '2022-04-03 09:48:11', 1, '1'),
(3, 'biroakademik', '2b0804a2d8d8151d96239cd78b6636f32c9440f5', '', '', 'admin', 'BIRO AKADEMIK', 'Biro Akademik', NULL, '', '0000-00-00', '', '2022-04-14 09:17:18', '2022-04-14 09:18:20', NULL, NULL, '2022-04-11 10:19:53', 1, '2022-04-11 10:25:29', 1, '1'),
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
  MODIFY `id_daftar_survei` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `survei_detail_survei`
--
ALTER TABLE `survei_detail_survei`
  MODIFY `id_detail_survei` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `survei_hak_akses`
--
ALTER TABLE `survei_hak_akses`
  MODIFY `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `survei_jawaban`
--
ALTER TABLE `survei_jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

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
