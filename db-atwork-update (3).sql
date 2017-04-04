-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 04 Apr 2017 pada 21.10
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-atwork-update`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agenda`
--

CREATE TABLE `agenda` (
  `id` int(20) NOT NULL,
  `nama_keg` varchar(255) NOT NULL,
  `tgl_keg` datetime NOT NULL,
  `deks_keg` text NOT NULL,
  `path_file` varchar(250) NOT NULL,
  `panitia` int(5) NOT NULL,
  `waktu_buat` datetime NOT NULL,
  `pembuat_agen` int(20) NOT NULL,
  `dep_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen_grup`
--

CREATE TABLE `departemen_grup` (
  `id` int(20) NOT NULL,
  `nama_dep` varchar(100) NOT NULL,
  `role_dep` int(5) NOT NULL,
  `user_id` int(20) NOT NULL,
  `role_user` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskusi`
--

CREATE TABLE `diskusi` (
  `id` int(20) NOT NULL,
  `topik` varchar(250) NOT NULL,
  `waktu_buat` datetime NOT NULL,
  `status` int(5) NOT NULL,
  `member_user` int(20) NOT NULL,
  `role` int(5) NOT NULL,
  `dep_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(20) NOT NULL,
  `nama_dokumen` varchar(250) NOT NULL,
  `keterangan_dokumen` text NOT NULL,
  `path_dokumen` varchar(250) NOT NULL,
  `waktu_upload` datetime NOT NULL,
  `pembuat` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `forum_diskusi`
--

CREATE TABLE `forum_diskusi` (
  `id` int(20) NOT NULL,
  `isi_chat` varchar(255) NOT NULL,
  `waktu_chat` datetime NOT NULL,
  `diskusi_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(20) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `dep_id` int(20) NOT NULL,
  `dok_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keyword`
--

CREATE TABLE `keyword` (
  `id` int(20) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `dok_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(20) NOT NULL,
  `isi_komentar` text NOT NULL,
  `dok_id` int(20) NOT NULL,
  `pembuat` int(20) NOT NULL,
  `waktu_komen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lihat_agenda`
--

CREATE TABLE `lihat_agenda` (
  `id` int(20) NOT NULL,
  `agenda_id` int(20) NOT NULL,
  `dep_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lihat_dokumen`
--

CREATE TABLE `lihat_dokumen` (
  `id` int(11) NOT NULL,
  `dokumen_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id` int(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `status` int(5) NOT NULL,
  `waktu` datetime NOT NULL,
  `pengirim` int(20) NOT NULL,
  `penerima` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(5) NOT NULL,
  `pic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `pic`) VALUES
(13, 'ks', 'kelvin', 0, '../profile/ks.jpg'),
(74, 'tings', '123', 1, '../profile/tings.png'),
(75, 'eka', '123', 1, '../profile/eka.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembuat_agen` (`pembuat_agen`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `departemen_grup`
--
ALTER TABLE `departemen_grup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diskusi`
--
ALTER TABLE `diskusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_user` (`member_user`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembuat` (`pembuat`);

--
-- Indexes for table `forum_diskusi`
--
ALTER TABLE `forum_diskusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diskusi_id` (`diskusi_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `dok_id` (`dok_id`);

--
-- Indexes for table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dok_id` (`dok_id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dok_id` (`dok_id`),
  ADD KEY `pembuat` (`pembuat`);

--
-- Indexes for table `lihat_agenda`
--
ALTER TABLE `lihat_agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agenda_id` (`agenda_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `lihat_dokumen`
--
ALTER TABLE `lihat_dokumen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dokumen_id` (`dokumen_id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengirim` (`pengirim`),
  ADD KEY `penerima` (`penerima`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departemen_grup`
--
ALTER TABLE `departemen_grup`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diskusi`
--
ALTER TABLE `diskusi`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_diskusi`
--
ALTER TABLE `forum_diskusi`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lihat_agenda`
--
ALTER TABLE `lihat_agenda`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lihat_dokumen`
--
ALTER TABLE `lihat_dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`pembuat_agen`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `departemen_grup` (`id`);

--
-- Ketidakleluasaan untuk tabel `departemen_grup`
--
ALTER TABLE `departemen_grup`
  ADD CONSTRAINT `departemen_grup_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `diskusi`
--
ALTER TABLE `diskusi`
  ADD CONSTRAINT `diskusi_ibfk_1` FOREIGN KEY (`member_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `diskusi_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `departemen_grup` (`id`);

--
-- Ketidakleluasaan untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `dokumen_ibfk_1` FOREIGN KEY (`pembuat`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `forum_diskusi`
--
ALTER TABLE `forum_diskusi`
  ADD CONSTRAINT `forum_diskusi_ibfk_1` FOREIGN KEY (`diskusi_id`) REFERENCES `diskusi` (`id`),
  ADD CONSTRAINT `forum_diskusi_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departemen_grup` (`id`),
  ADD CONSTRAINT `kategori_ibfk_2` FOREIGN KEY (`dok_id`) REFERENCES `dokumen` (`id`);

--
-- Ketidakleluasaan untuk tabel `keyword`
--
ALTER TABLE `keyword`
  ADD CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`dok_id`) REFERENCES `dokumen` (`id`);

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`dok_id`) REFERENCES `dokumen` (`id`),
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`pembuat`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `lihat_agenda`
--
ALTER TABLE `lihat_agenda`
  ADD CONSTRAINT `lihat_agenda_ibfk_1` FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`id`),
  ADD CONSTRAINT `lihat_agenda_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `departemen_grup` (`id`);

--
-- Ketidakleluasaan untuk tabel `lihat_dokumen`
--
ALTER TABLE `lihat_dokumen`
  ADD CONSTRAINT `lihat_dokumen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `lihat_dokumen_ibfk_2` FOREIGN KEY (`dokumen_id`) REFERENCES `dokumen` (`id`);

--
-- Ketidakleluasaan untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `pesan_ibfk_1` FOREIGN KEY (`pengirim`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `pesan_ibfk_2` FOREIGN KEY (`penerima`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
