-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 18. Juli 2019 jam 15:15
-- Versi Server: 5.5.16
-- Versi PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tiketbus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
  `ID_BUS` varchar(50) NOT NULL,
  `BUS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_BUS`),
  UNIQUE KEY `BUS` (`BUS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bus`
--

INSERT INTO `bus` (`ID_BUS`, `BUS`) VALUES
('BUS02', 'RELA'),
('BUS01', 'SAFARI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal1`
--

CREATE TABLE IF NOT EXISTS `jadwal1` (
  `ID_JADWAL` varchar(10) NOT NULL,
  `BUS` varchar(100) NOT NULL,
  `KOTA_AWAL` varchar(50) NOT NULL,
  `KOTA_TUJUAN` varchar(50) NOT NULL,
  `KEBERANGKATAN` varchar(25) NOT NULL,
  `KEDATANGAN` varchar(25) NOT NULL,
  `HARGA` int(25) NOT NULL,
  PRIMARY KEY (`ID_JADWAL`),
  KEY `BUS` (`BUS`),
  KEY `KOTA_AWAL` (`KOTA_AWAL`),
  KEY `KOTA_TUJUAN` (`KOTA_TUJUAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal1`
--

INSERT INTO `jadwal1` (`ID_JADWAL`, `BUS`, `KOTA_AWAL`, `KOTA_TUJUAN`, `KEBERANGKATAN`, `KEDATANGAN`, `HARGA`) VALUES
('J001', 'SAFARI', 'Boyolali', 'Semarang', '8.00', '17.00', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `ID_KOTA` varchar(50) NOT NULL,
  `KOTA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_KOTA`),
  KEY `KOTA` (`KOTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`ID_KOTA`, `KOTA`) VALUES
('K01', 'Boyolali'),
('K02', 'Semarang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', 'admin'),
('novanto', 'novanto');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE IF NOT EXISTS `pemesanan` (
  `KODE_PEMBELIAN` varchar(10) NOT NULL,
  `ID_JADWAL` varchar(10) DEFAULT NULL,
  `BUS` varchar(16) DEFAULT NULL,
  `KOTA_AWAL` varchar(50) NOT NULL,
  `KOTA_TUJUAN` varchar(50) NOT NULL,
  `HARGA` int(25) NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `JUMLAH_TIKET` int(20) DEFAULT NULL,
  `TOTAL` int(20) DEFAULT NULL,
  PRIMARY KEY (`KODE_PEMBELIAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`KODE_PEMBELIAN`, `ID_JADWAL`, `BUS`, `KOTA_AWAL`, `KOTA_TUJUAN`, `HARGA`, `NAMA`, `JUMLAH_TIKET`, `TOTAL`) VALUES
('P001', 'SAFARI', 'J001', 'Boyolali', 'Semarang', 25000, 'VIKA', 2, 50000);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal1`
--
ALTER TABLE `jadwal1`
  ADD CONSTRAINT `jadwal1_ibfk_1` FOREIGN KEY (`BUS`) REFERENCES `bus` (`BUS`),
  ADD CONSTRAINT `jadwal1_ibfk_2` FOREIGN KEY (`KOTA_AWAL`) REFERENCES `kota` (`KOTA`),
  ADD CONSTRAINT `jadwal1_ibfk_3` FOREIGN KEY (`KOTA_TUJUAN`) REFERENCES `kota` (`KOTA`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
