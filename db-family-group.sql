-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Des 2020 pada 17.11
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-family-group`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'family01', 1, 1, 0, '1', 1),
(2, 2, 'family02', 1, 1, 0, '1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(128) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `no_hp_customer` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_customer`
--

INSERT INTO `tb_customer` (`id_customer`, `nama_customer`, `alamat`, `no_hp_customer`) VALUES
(1, 'Budi Bambang', 'Singasari, Malang', '085607655433'),
(3, 'Pak Poer', 'Malang', '085456654454'),
(4, 'Noto Lian Utomo', 'Singosari, Malang', '085789987789'),
(6, 'Agus Temon', 'Turen, Malang', '08575357753'),
(7, 'Rizky Setiawan', 'Pendem, Batu', '085159951159'),
(8, 'Rizal Fuad', 'Kepanjen, Malang', '085741147741'),
(9, 'Fugaku Rendra', 'Gadang, Malang', '085963369963'),
(10, 'Agung Irawan', 'Merjosari, Malang', '085123456789'),
(11, 'Ridho Mamik', 'Pakishaj, Malangi', '085456123999');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_operator`
--

CREATE TABLE `tb_operator` (
  `id_operator` int(11) NOT NULL,
  `nama_operator` varchar(128) NOT NULL,
  `no_hp_operator` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_operator`
--

INSERT INTO `tb_operator` (`id_operator`, `nama_operator`, `no_hp_operator`) VALUES
(1, 'Moch. Abbas Al Munyawi', '085655887299'),
(3, 'Adi AU', '085645963369'),
(4, 'Ridho', '085456123789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sound`
--

CREATE TABLE `tb_sound` (
  `id_sound` int(11) NOT NULL,
  `paket_acara` varchar(128) NOT NULL,
  `daya` int(11) NOT NULL,
  `status` varchar(128) NOT NULL,
  `tarif` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_sound`
--

INSERT INTO `tb_sound` (`id_sound`, `paket_acara`, `daya`, `status`, `tarif`) VALUES
(1, 'Lain-Lain', 10000, 'Tidak Ada Kerusakan', 5000000),
(10, 'Pengajian', 1000, 'Tersedia', 10000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaction`
--

CREATE TABLE `tb_transaction` (
  `id_transaction` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `sound_id` int(11) NOT NULL,
  `tanggal_pemakaian` date NOT NULL,
  `lama_pemakaian` int(11) NOT NULL,
  `lokasi_pemakaian` varchar(128) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `dibayar` int(11) DEFAULT NULL,
  `status_pembayaran` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_transaction`
--

INSERT INTO `tb_transaction` (`id_transaction`, `customer_id`, `operator_id`, `sound_id`, `tanggal_pemakaian`, `lama_pemakaian`, `lokasi_pemakaian`, `harga`, `dibayar`, `status_pembayaran`) VALUES
(2, 3, 1, 1, '2020-12-15', 6, 'Singosari, Malang', 30000000, NULL, 'Belum Lunas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `tb_operator`
--
ALTER TABLE `tb_operator`
  ADD PRIMARY KEY (`id_operator`);

--
-- Indeks untuk tabel `tb_sound`
--
ALTER TABLE `tb_sound`
  ADD PRIMARY KEY (`id_sound`);

--
-- Indeks untuk tabel `tb_transaction`
--
ALTER TABLE `tb_transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `operator_id` (`operator_id`),
  ADD KEY `sound_id` (`sound_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_operator`
--
ALTER TABLE `tb_operator`
  MODIFY `id_operator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_sound`
--
ALTER TABLE `tb_sound`
  MODIFY `id_sound` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_transaction`
--
ALTER TABLE `tb_transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_transaction`
--
ALTER TABLE `tb_transaction`
  ADD CONSTRAINT `tb_transaction_ibfk_1` FOREIGN KEY (`sound_id`) REFERENCES `tb_sound` (`id_sound`),
  ADD CONSTRAINT `tb_transaction_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`id_customer`),
  ADD CONSTRAINT `tb_transaction_ibfk_3` FOREIGN KEY (`operator_id`) REFERENCES `tb_operator` (`id_operator`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
