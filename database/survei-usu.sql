-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 17 Apr 2022 pada 07.17
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
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `survei_kategori`
--

INSERT INTO `survei_kategori` (`id_kategori`, `nama_kategori`, `created_by`, `created_time`, `updated_time`, `updated_by`) VALUES
(1, 'BIRO AKADEMIK', 1, '2022-04-03 10:05:29', NULL, NULL),
(2, 'BIRO KEMAHASISWAAN', 1, '2022-04-03 10:05:35', NULL, NULL),
(3, 'BIRO KEUANGAN', 1, '2022-04-03 10:05:41', NULL, NULL),
(4, 'BIRO SUMBER DAYA MANUSIA', 1, '2022-04-03 11:17:46', NULL, NULL),
(5, 'BIRO KERJASAMA DAN PENELITIAN', 1, '2022-04-03 11:17:55', NULL, NULL),
(6, 'BIRO PERENCANAAN DAN PENGEMBANGAN', 1, '2022-04-03 11:18:04', NULL, NULL),
(7, 'BIRO ASET DAN USAHA', 1, '2022-04-03 11:18:14', NULL, NULL),
(8, 'TATA USAHA', 1, '2022-04-03 11:18:21', NULL, NULL),
(9, 'KANTOR URUSAN HUKUM', 1, '2022-04-03 11:18:32', NULL, NULL),
(10, 'HUMAS', 1, '2022-04-03 11:18:42', NULL, NULL),
(11, 'ARSIP', 1, '2022-04-03 11:18:48', NULL, NULL),
(12, 'PUSAT PELAYANAN TERPADU', 1, '2022-04-03 11:18:56', NULL, NULL),
(13, 'FAKULTAS KEDOKTERAN', 1, '2022-04-03 11:19:29', NULL, NULL),
(14, 'FAKULTAS HUKUM', 1, '2022-04-03 11:19:40', NULL, NULL),
(15, 'FAKULTAS PERTANIAN', 1, '2022-04-03 11:20:04', NULL, NULL),
(16, 'FAKULTAS TEKNIK', 1, '2022-04-03 11:20:14', NULL, NULL),
(17, 'FAKULTAS EKONOMI DAN BISNIS', 1, '2022-04-03 11:20:28', NULL, NULL),
(18, 'FAKULTAS KEDOKTERAN GIGI', 1, '2022-04-03 11:20:38', NULL, NULL),
(19, 'FAKULTAS ILMU BUDAYA', 1, '2022-04-03 11:20:53', NULL, NULL),
(20, 'FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM', 1, '2022-04-03 11:21:03', NULL, NULL),
(21, 'FAKULTAS ILMU SOSIAL DAN ILMU POLITIK', 1, '2022-04-03 11:21:14', NULL, NULL),
(22, 'FAKULTAS KESEHATAN MASYARAKAT', 1, '2022-04-03 11:21:26', NULL, NULL),
(23, 'FAKULTAS KEPERAWATAN', 1, '2022-04-03 11:21:37', NULL, NULL),
(24, 'FAKULTAS PSIKOLOGI', 1, '2022-04-03 12:06:05', NULL, NULL),
(25, 'FAKULTAS FARMASI', 1, '2022-04-03 12:06:19', NULL, NULL),
(26, 'FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI', 1, '2022-04-03 12:06:29', NULL, NULL),
(27, 'FAKULTAS KEHUTANAN', 1, '2022-04-03 12:06:41', NULL, NULL),
(28, 'SEKOLAH PASCASARJANA (SPS)', 1, '2022-04-03 12:07:12', NULL, NULL),
(29, 'PERPUSTAKAAN ', 1, '2022-04-03 12:07:19', NULL, NULL),
(30, 'RUMAH SAKIT USU', 1, '2022-04-03 12:08:00', NULL, NULL),
(31, 'POLIKLINIK', 1, '2022-04-03 12:08:07', NULL, NULL),
(32, 'RUMAH SAKIT GIGI DAN MULUT', 1, '2022-04-03 12:08:14', NULL, NULL),
(33, 'PUSAT SISITEM INFORMASI ', 1, '2022-04-03 12:08:23', NULL, NULL),
(34, 'LPPM ', 1, '2022-04-03 12:08:30', NULL, NULL),
(35, 'LP', 1, '2022-04-03 12:08:36', NULL, NULL),
(36, 'PUSAT BAHASA ', 1, '2022-04-03 12:08:43', NULL, NULL),
(37, 'LINKS', 1, '2022-04-03 12:08:49', NULL, NULL),
(38, 'UMM', 1, '2022-04-03 12:08:56', NULL, NULL),
(39, 'UNIT PELAYANAN, PENGEMBANGAN DAN PENDIDIKAN', 1, '2022-04-03 12:09:02', NULL, NULL),
(40, 'LABORATORIUM TERPADU', 1, '2022-04-03 12:09:08', NULL, NULL);

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
(1, 'superadmin', '889a3a791b3875cfae413574b53da4bb8a90d53e', 'm.rizkifatihah@gmail.com', '', 'superadmin', NULL, 'Superadmin', NULL, '', '0000-00-00', '', '2022-04-17 11:59:51', '2022-04-17 11:59:21', NULL, NULL, '2022-03-05 03:49:06', NULL, '2022-04-03 09:48:11', 1, '1'),
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
(1, 'BAGAIMANA KEMUDAHAN MENDAPATKAN INFORMASI PERSYARATAN', 1, '1', 1, '2022-04-07 11:50:55', '2022-04-07 11:58:52', 1),
(2, 'BAGAIMANA KEMUDAHAN MEMENUHI PERSYARATAN PELAYANAN', 1, '1', 1, '2022-04-07 11:51:20', '2022-04-09 12:08:06', 1),
(3, 'BAGAIMANA KEMUDAHAN PROSEDUR PELAYANAN', 1, '1', 1, '2022-04-07 11:51:41', '2022-04-09 12:08:11', 1),
(4, 'BAGAIMANA KETEPATAN WAKTU DALAM PENYELESAIAN PELAYANAN', 1, '1', 1, '2022-04-07 11:54:17', '2022-04-09 12:08:21', 1),
(5, 'BAGAIMANA KESESUAIAN PRODUK PELAYANAN ANTARA YANG TERCANTUM DALAM STANDAR PELAYANAN DENGAN HASIL YANG DIBERIKAN', 1, '1', 1, '2022-04-07 11:55:00', NULL, NULL),
(6, 'BAGAIMANA KOMPETENSI DAN KEMAMPUAN PETUGAS DALAM MEMBERIKAN PELAYANAN ', 1, '1', 1, '2022-04-07 11:55:13', NULL, NULL),
(7, 'BAGAIMANA PERILAKU PETUGAS TERKAIT KESOPANAN DAN KERAMAHAN DALAM MEMBERIKAN PELAYANAN ', 1, '1', 1, '2022-04-07 11:55:24', NULL, NULL),
(8, 'BAGAIMANA KUALITAS SARANA DAN PRASARANA PENDUKUNG PELAYANAN ', 1, '1', 1, '2022-04-07 11:55:37', NULL, NULL),
(9, 'APAKAH ANDA DIMINTA BAYARAN  ', 3, '1', 1, '2022-04-07 11:55:48', NULL, NULL),
(10, 'APAKAH TERSEDIA TEMPAT PENGADUAN ', 3, '1', 1, '2022-04-07 11:55:58', NULL, NULL);

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
(83, 'PEMAKAIAN FASILITAS UMUM (JALAN DAN RUANG TERBUKA)', 'PUSAT PELAYANAN TERPADU', '', '2022-04-03 13:13:53', 1, 0, NULL);

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
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id_standar_pelayanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
