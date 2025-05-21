-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 08:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `motorcycle_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `log_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `action` text NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`log_id`, `u_id`, `user_name`, `action`, `log_time`) VALUES
(10, 2, 'test@gmail.com', 'Admin logged in', '2025-05-21 06:00:54'),
(11, 2, 'test@gmail.com', 'Employee logged in', '2025-05-21 06:01:24'),
(12, 2, 'test@gmail.com', 'Admin logged in', '2025-05-21 06:02:11'),
(13, 2, 'test@gmail.com', 'Employee logged in', '2025-05-21 06:02:37'),
(14, 2, 'test@gmail.com', 'Employee logged in', '2025-05-21 06:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `t_id` int(11) NOT NULL,
  `t_firstname` varchar(100) NOT NULL,
  `t_lastname` varchar(100) NOT NULL,
  `t_email` varchar(100) NOT NULL,
  `t_contactnumber` varchar(100) NOT NULL,
  `t_mtype` varchar(100) NOT NULL,
  `t_creationdate` datetime NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`t_id`, `t_firstname`, `t_lastname`, `t_email`, `t_contactnumber`, `t_mtype`, `t_creationdate`, `status`) VALUES
(1, 'clester', 'adlawan', 'adlawan@gmail.com', '09123456789', 'BMW R Nine T', '2025-05-14 16:50:58', 'Approve'),
(2, 'test', 'test', 'test1@gmail.com', '09123456789', 'BMW R Nine T', '2025-05-21 14:01:40', 'Approve');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `u_id` int(20) NOT NULL,
  `u_firstname` varchar(50) NOT NULL,
  `u_lastname` varchar(50) NOT NULL,
  `u_email` varchar(50) NOT NULL,
  `u_contactnumber` varchar(50) NOT NULL,
  `u_password` varchar(50) DEFAULT NULL,
  `u_type` varchar(50) NOT NULL,
  `u_status` varchar(50) NOT NULL,
  `u_hashpw` varchar(255) NOT NULL,
  `u_question` varchar(100) NOT NULL,
  `u_answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`u_id`, `u_firstname`, `u_lastname`, `u_email`, `u_contactnumber`, `u_password`, `u_type`, `u_status`, `u_hashpw`, `u_question`, `u_answer`) VALUES
(1, 'clester', 'adlawan', 'adlawan@gmail.com', '09123456789', NULL, 'Admin', 'Active', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'What is your favorite color?', 'red'),
(2, 'test', 'test', 'test@gmail.com', '09123456789', NULL, 'Employee', 'Active', '6fec2a9601d5b3581c94f2150fc07fa3d6e45808079428354b868e412b76e6bb', 'What is your mother\'s maiden name?', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `u_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD CONSTRAINT `tbl_logs_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
