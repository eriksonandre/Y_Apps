-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Agu 2024 pada 06.45
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_y`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id_msg` int(4) NOT NULL,
  `id_sender` int(4) NOT NULL,
  `id_reciever` int(4) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `messages`
--

INSERT INTO `messages` (`id_msg`, `id_sender`, `id_reciever`, `msg`, `msg_time`) VALUES
(1, 2, 3, 'Halo mas', '2024-07-28 17:00:00'),
(2, 3, 2, 'Iya, kenapa mas?', '2024-07-29 03:57:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile`
--

CREATE TABLE `profile` (
  `id_user` int(4) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT 'Nama Belum Diset',
  `bio` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `photo` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profile`
--

INSERT INTO `profile` (`id_user`, `name`, `bio`, `birth_date`, `photo`, `username`) VALUES
(2, 'Nama Belum Diset', 'Ini Admin', '2024-07-29', '', 'admin'),
(3, 'Nama Belum Diset', 'Ini admin kedua', '2024-07-28', '', 'admin2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `thread`
--

CREATE TABLE `thread` (
  `id_thread` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `text` varchar(250) NOT NULL,
  `thread_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `thread`
--

INSERT INTO `thread` (`id_thread`, `id_user`, `text`, `thread_date`) VALUES
(1, 2, 'Ini postingan pertama', '2024-07-29 03:32:20'),
(2, 2, 'Ini postingan kedua saya', '2024-07-29 03:33:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `registered_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `gender`, `registered_date`) VALUES
('admin', 'c93ccd78b2076528346216b3b2f701e6', 'Male', '2024-07-29 03:30:00'),
('admin2', 'c93ccd78b2076528346216b3b2f701e6', 'Male', '2024-07-29 03:46:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_msg`),
  ADD KEY `id_sender` (`id_sender`),
  ADD KEY `id_reciever` (`id_reciever`);

--
-- Indeks untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `username` (`username`);

--
-- Indeks untuk tabel `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`id_thread`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id_msg` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `profile`
--
ALTER TABLE `profile`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `thread`
--
ALTER TABLE `thread`
  MODIFY `id_thread` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_sender`) REFERENCES `profile` (`id_user`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`id_reciever`) REFERENCES `profile` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Ketidakleluasaan untuk tabel `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `profile` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
