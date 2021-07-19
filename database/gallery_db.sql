-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2021 at 08:40 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `photo_id`, `author`, `body`) VALUES
(2, 22, ' leo ', ' This is comment for photo with id 22 '),
(4, 18, ' Faysal ', ' Hi this faysal ..testing comments '),
(5, 18, ' leo ', ' This is leo comment ');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `alternate_text` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `title`, `caption`, `description`, `filename`, `alternate_text`, `type`, `size`) VALUES
(18, ' New car 1 ', 'New some caption', '  This is the new model updated', ' images-1.jpg ', 'car.jpg', ' image/jpeg ', 28947),
(19, ' car 2 ', '', '  ', ' images_2.jpg ', '', ' image/jpeg ', 18578),
(20, ' car 3 ', '', '  ', ' images-3.jpg ', '', ' image/jpeg ', 18096),
(21, ' car 4 ', '', '  ', ' images-4.jpg ', '', ' image/jpeg ', 23270),
(22, ' Fast Car Large ', '  ', '  ', ' _large_image_1.jpg ', '  ', ' image/jpeg ', 479843),
(23, ' Fast Car Large 2 ', '  ', '  ', ' _large_image_2.jpg ', '  ', ' image/jpeg ', 309568),
(24, ' Fast Car Large 3 ', '  ', '  ', ' _large_image_3.jpg ', '  ', ' image/jpeg ', 165053),
(25, ' Fast Car Large 4 ', '  ', '  ', ' _large_image_4.jpg ', '  ', ' image/jpeg ', 554659),
(26, ' testing new image  ', '  ', '  ', ' images-6.jpg ', '  ', ' image/jpeg ', 21886),
(27, ' new pic ', '  ', '  ', ' images-12.jpg ', '  ', ' image/jpeg ', 18540);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `user_image`) VALUES
(1, 'leofaysal', 'faysal', 'leo', 'faysal', 'images-5 copy.jpg'),
(2, 'zuni', '0000', 'Zunairah', 'Faysal', ''),
(3, 'umer', '1234', 'Umer', 'Faisal', ''),
(5, 'abc', '1234', 'abc', 'abc', ''),
(10, 'leo', '1234', 'Faseee', 'Faysal1', ''),
(11, 'ali', '1234', '', 'ali', ''),
(12, 'abcd1 ', ' 1234 ', ' abcd1 ', ' abcd1 ', ''),
(13, 'abc ', ' 1234 ', ' student ', ' abc ', ''),
(18, 'asasa ', ' 1234 ', ' asasa ', ' asasa ', ' clothes.jpg '),
(20, 'new_user ', ' user ', ' student ', ' user ', 'images-40 copy.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
