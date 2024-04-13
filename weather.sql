-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 13. dub 2024, 08:47
-- Verze serveru: 10.4.28-MariaDB
-- Verze PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `weather`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `weather`
--

CREATE TABLE `weather` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `temp` int(11) NOT NULL,
  `pres` int(11) NOT NULL,
  `hum` int(11) NOT NULL,
  `insert_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `weather`
--

INSERT INTO `weather` (`id`, `city_id`, `temp`, `pres`, `hum`, `insert_time`) VALUES
(2, 1, 7, 1009, 73, '2024-02-21'),
(3, 1, 6, 1001, 71, '2024-02-27'),
(4, 1, 6, 1002, 69, '2024-02-27'),
(5, 1, 6, 995, 74, '2024-03-01'),
(6, 1, 24, 994, 41, '2024-04-09');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `weather`
--
ALTER TABLE `weather`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
