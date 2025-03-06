-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2025 at 02:44 AM
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
-- Database: `queue`
--

-- --------------------------------------------------------

--
-- Table structure for table `cashier_history`
--

CREATE TABLE `cashier_history` (
  `history_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `action_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cashier_history`
--

INSERT INTO `cashier_history` (`history_id`, `transaction_id`, `action_date`, `status`) VALUES
(2, 56, '2025-03-06 09:33:04', 'Completed'),
(3, 58, '2025-03-06 09:33:16', 'Completed'),
(4, 63, '2025-03-06 09:36:16', 'Completed'),
(5, 64, '2025-03-06 09:37:59', 'Completed'),
(6, 57, '2025-03-06 09:38:04', 'Completed'),
(7, 62, '2025-03-06 09:39:14', 'Completed'),
(8, 65, '2025-03-06 09:39:17', 'Completed'),
(9, 67, '2025-03-06 09:39:19', 'Completed'),
(10, 56, '2025-03-06 09:43:27', 'Completed'),
(11, 58, '2025-03-06 09:43:32', 'Completed'),
(12, 63, '2025-03-06 09:43:40', 'Completed'),
(13, 64, '2025-03-06 09:43:44', 'Completed'),
(14, 57, '2025-03-06 09:43:49', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `counter_id` int(11) NOT NULL,
  `counter_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`counter_id`, `counter_name`) VALUES
(1, 'cashier1'),
(2, 'cashier2'),
(3, 'cashier3'),
(4, 'cashier4');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `role` varchar(50) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `qr_code` text NOT NULL,
  `profile_pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `first_name`, `last_name`, `address`, `contact_number`, `email`, `date_of_birth`, `department`, `position`, `status`, `role`, `username`, `password`, `qr_code`, `profile_pic`) VALUES
(1, 'Juan', 'Dela Cruz', '123 Main St, Anytown', '09123456789', 'juan.delacruz@example.com', '2002-05-15', 'IT', 'Web Developer', 'Active', 'cashier1', 'cashier1', '$2y$10$dqLUQw6XHsCaied3FkuBvujJ0v8X2wJE8o2DK6DjaWgyLLRmJL/he', '67bc1477ee3a1neil.png', 'man1.jpg'),
(2, 'Maria', 'Santos', '456 Elm Ave, Anytown', '09876543210', 'maria.santos@example.com', '2003-02-20', 'IT', 'Web Developer', 'Active', 'cashier2', 'cashier2', '$2y$10$1z.7AWmRpoh1STIeg.ibOe7L8sseaJasl9aAjaBJoFEes3uqqtama', '67bc1477ee3a1neil.png', 'girl2.jpg'),
(3, 'Jose Neil', 'Buenabiles', '789 Oak St, Anytown', '09998887777', 'jose.rizal@example.com', '2001-11-03', 'IT', 'Web Developer', 'Active', 'admin', 'admin', '$2y$10$r87asD3SXBHHJhMnx4gRBezZU12IYwwOsvP3qgfHH0cwbnbm/y6CW', '67bc1477ee3a1neil.png', 'man2.jpg'),
(4, 'Gabriela', 'Silang', '101 Pine Ln, Anytown', '09112233445', 'gabriela.silang@example.com', '2000-08-25', 'IT', 'Web Developer', 'Active', 'kiosk1', 'kiosk1', '$2y$10$6JgbErG6eBc/gZeSVzikr.nG4w7SBpTs1HwXpaEqq/d5RaWiC/abO', '67bc1477ee3a1neil.png', 'girl1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loginattemp`
--

CREATE TABLE `loginattemp` (
  `ATTEMPID` int(11) NOT NULL,
  `IPADDRESS` varchar(100) DEFAULT NULL,
  `ATTEMPCOUNT` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `loginattemp`
--

INSERT INTO `loginattemp` (`ATTEMPID`, `IPADDRESS`, `ATTEMPCOUNT`) VALUES
(976, '::1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `LOGID` int(11) NOT NULL,
  `USERID` varchar(30) DEFAULT NULL,
  `USER_NAME` varchar(60) DEFAULT NULL,
  `ACTION` text DEFAULT NULL,
  `DATELOG` varchar(30) DEFAULT NULL,
  `TIMELOG` varchar(30) DEFAULT NULL,
  `user_ip_address` text DEFAULT NULL,
  `device_used` text DEFAULT NULL,
  `PORTAL` int(11) DEFAULT NULL,
  `AY` varchar(50) DEFAULT NULL,
  `SEMESTER` varchar(50) DEFAULT NULL,
  `COMPANYID` varchar(60) DEFAULT NULL,
  `CAMPUSID` int(11) DEFAULT NULL,
  `IDENTIFIER` varchar(30) DEFAULT NULL,
  `ACCOUNT_ID` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`LOGID`, `USERID`, `USER_NAME`, `ACTION`, `DATELOG`, `TIMELOG`, `user_ip_address`, `device_used`, `PORTAL`, `AY`, `SEMESTER`, `COMPANYID`, `CAMPUSID`, `IDENTIFIER`, `ACCOUNT_ID`) VALUES
(170116, 'admin', 'White, Adam R.', 'Logout to the system.', '2025-01-04', '09:31:12', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170117, 'admin', 'White, Adam R.', 'Login to the system.n', '2025-01-04', '09:31:20', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170118, 'admin', 'White, Adam R.', 'Logout to the system.', '2025-01-04', '09:43:58', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170119, 'admin', 'White, Adam R.', 'Login to the system.', '2025-01-04', '09:47:20', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170120, 'admin', 'White, Adam R.', 'New User has been created successfully!', '2025-01-04', '10:01:19', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170121, 'admin', 'White, Adam R.', 'New User has been updated successfully!', '2025-01-04', '10:08:58', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170122, 'admin', 'White, Adam R.', 'Login to the system.', '2025-01-04', '10:19:41', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170123, 'admin', 'White, Adam R.', 'Logout to the system.', '2025-01-04', '10:19:49', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170124, 'admin', 'White, Adam R.', 'Login to the system.', '2025-01-04', '10:20:20', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170125, 'admin', 'White, Adam R.', 'Logout to the system.', '2025-01-04', '10:22:41', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170126, 'admin', 'White, Adam R.', 'Login to the system.', '2025-01-04', '10:23:00', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170127, 'admin', 'White, Adam R.', 'User with ID admin has been updated successfully!', '2025-01-04', '10:42:51', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170128, 'admin', 'White, Adam R.', 'User with ID admin has been updated successfully!', '2025-01-04', '10:42:56', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170129, 'admin', 'White, Adam R.', 'User with ID admin has been updated successfully!', '2025-01-04', '10:43:25', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170130, 'admin', 'White, Adam R.', 'User with ID admin has been updated successfully!', '2025-01-04', '10:43:29', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170131, 'admin', 'White, Adam R.', 'User with ID admin has been updated successfully!', '2025-01-04', '10:43:32', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170132, 'admin', 'White, Adam R.', 'Logout to the system.', '2025-01-04', '10:57:32', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170133, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-01-04', '10:57:37', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170134, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:08:49', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170135, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:08:53', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170136, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:10:15', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170137, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:10:50', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170138, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:10:53', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170139, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:10:55', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170140, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:11:43', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170141, 'admin', 'White, Adam Ray', 'New User [EMPID: 1] has been created successfully!', '2025-01-04', '11:12:02', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170142, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:12:04', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170143, 'admin', 'White, Adam Ray', 'New User [EMPID: 1] has been created successfully!', '2025-01-04', '11:17:40', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170144, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-01-04', '11:20:14', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170145, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-01-04', '13:06:14', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170146, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:53:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170147, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:53:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170148, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:55:17', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170149, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:57:43', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170150, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:57:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170151, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:57:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170152, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:58:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170153, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:59:39', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170154, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '10:59:54', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170155, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '11:00:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170156, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '11:07:29', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170157, '', '', 'Login to the system.', '2025-02-20', '11:17:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170158, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '11:19:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170159, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '11:35:55', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170160, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '11:36:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170161, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '11:36:50', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170162, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '11:36:59', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170163, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '11:40:51', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170164, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '12:31:27', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170165, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '12:32:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170166, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '12:34:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170167, '', 'White, Adam Ray ', 'Logout to the system.', '2025-02-20', '12:36:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170168, '', 'White, Adam Ray ', 'Login to the system.', '2025-02-20', '12:36:35', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170169, '', 'White, Adam Ray ', 'Logout to the system.', '2025-02-20', '12:38:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170170, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '12:38:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170171, 'admin', 'White, Adam Ray', 'New User [EMPID: 12] has been created successfully!', '2025-02-20', '12:48:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170172, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '12:48:48', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170173, 'admin', 'White, Adam Ray', 'New User [EMPID: 1] has been created successfully!', '2025-02-20', '12:49:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170174, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '12:49:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170175, 'admin', 'White, Adam Ray', 'New User [EMPID: admin] has been created successfully!', '2025-02-20', '12:50:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170176, 'admin', 'White, Adam Ray', 'New User [EMPID: employee] has been created successfully!', '2025-02-20', '13:22:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170177, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '14:14:49', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170178, 'admin', 'White, Adam Ray', 'New User [EMPID: admin] has been created successfully!', '2025-02-20', '15:28:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170179, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-20', '15:59:00', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170180, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '15:59:03', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170181, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:02:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170182, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:02:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170183, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:02:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170184, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:02:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170185, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:02:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170186, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:03:22', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170187, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:03:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170188, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:03:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170189, 'admin', 'White, Adam Ray', 'User has been removed successfully!', '2025-02-20', '17:03:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170190, 'admin', 'White, Adam Ray', 'Service has been removed successfully!', '2025-02-20', '17:04:43', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170191, 'admin', 'White, Adam Ray', 'Service has been removed successfully!', '2025-02-20', '17:05:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170192, 'admin', 'White, Adam Ray', 'Service has been removed successfully!', '2025-02-20', '17:13:17', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170193, 'admin', 'White, Adam Ray', 'Service has been removed successfully!', '2025-02-20', '17:13:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170194, 'admin', 'White, Adam Ray', 'Service has been removed successfully!', '2025-02-20', '17:13:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170195, 'admin', 'White, Adam Ray', 'Service has been removed successfully!', '2025-02-20', '17:14:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170196, 'admin', 'White, Adam Ray', 'Service has been removed successfully!', '2025-02-20', '17:22:52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'DELETE', NULL),
(170197, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-20', '21:27:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170198, 'admin', 'White, Adam Ray', 'User with ID 2 has been updated successfully!', '2025-02-20', '21:29:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170199, 'admin', 'White, Adam Ray', 'User with ID 2 has been updated successfully!', '2025-02-20', '21:29:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170200, 'admin', 'White, Adam Ray', 'User with ID 2 has been updated successfully!', '2025-02-20', '21:29:52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170201, 'admin', 'White, Adam Ray', 'New Service has been created successfully!', '2025-02-20', '21:43:34', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170202, 'admin', 'White, Adam Ray', 'New Service has been created successfully!', '2025-02-20', '21:45:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170203, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '08:37:50', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170204, 'admin', 'White, Adam Ray', 'New Service has been created successfully!', '2025-02-21', '08:38:09', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170205, 'admin', 'White, Adam Ray', 'New Service has been created successfully!', '2025-02-21', '08:40:12', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170206, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '09:36:34', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170207, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '09:36:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170208, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '09:56:10', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170209, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '09:56:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170210, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '10:00:03', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170211, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '10:00:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170212, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '13:07:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170213, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '13:52:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170214, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '14:02:13', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170215, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '14:02:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170216, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '14:02:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170217, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '14:28:17', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170218, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '14:58:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170219, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '14:58:49', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170220, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '14:59:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170221, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '15:01:11', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170222, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-21', '16:00:25', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170223, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-21', '16:01:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170224, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '16:05:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170225, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '16:05:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170226, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-21', '16:07:28', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170227, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-21', '16:07:42', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170228, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-22', '19:09:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170229, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '18:23:42', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170230, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '19:15:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170231, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '19:15:11', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170232, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '19:15:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170233, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '19:17:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170234, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '19:17:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170235, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '19:26:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170236, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '19:27:01', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170237, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '19:40:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170238, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '19:40:56', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170239, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '19:41:19', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170240, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '19:41:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170241, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '19:41:50', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170242, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '19:41:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170243, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '20:10:17', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170244, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '21:26:29', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170245, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '21:30:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170246, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '21:30:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170247, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '21:40:33', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170248, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '21:40:39', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170249, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-23', '21:48:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170250, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '21:49:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170251, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '21:57:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170252, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-23', '22:00:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170253, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '08:28:50', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170254, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '09:47:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170255, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-24', '09:50:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170256, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-24', '09:55:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170257, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-24', '09:58:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170258, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-24', '10:08:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170259, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-24', '10:10:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170260, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '10:13:08', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170261, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '10:22:48', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170262, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '10:23:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170263, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '11:25:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170264, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '11:25:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170265, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '14:40:25', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170266, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-24', '14:40:56', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170267, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '14:41:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170268, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '14:55:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170269, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '15:29:55', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170270, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '15:30:39', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170271, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '15:35:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170272, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '15:38:03', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170273, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '15:40:05', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170274, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-24', '16:19:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170275, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-24', '16:19:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170276, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-25', '09:10:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170277, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-25', '09:29:44', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170278, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-25', '10:51:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170279, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-25', '11:24:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170280, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-25', '12:54:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170281, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '12:59:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170282, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:13:49', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170283, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:15:33', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170284, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:17:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170285, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:18:29', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170286, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:19:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170287, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:20:56', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170288, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:23:09', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170289, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:39:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170290, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '13:39:35', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170291, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-25', '13:44:39', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170292, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-25', '13:47:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170293, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-25', '13:51:47', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170294, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-25', '14:19:12', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170295, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-25', '14:19:39', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170296, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-25', '15:56:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170297, 'admin', 'White, Adam Ray', 'New Employee has been created successfully!', '2025-02-25', '15:56:33', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170298, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-25', '15:56:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170299, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '09:13:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170300, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '09:13:19', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170301, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '09:13:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170302, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '09:14:21', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170303, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '09:18:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170304, '', '', 'User Attendance with attendacneID 14 has been updated successfully!', '2025-02-26', '11:08:04', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170305, '', '', 'User Attendance with attendacneID 14 has been updated successfully!', '2025-02-26', '11:09:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170306, '', '', 'User Attendance with attendacneID 14 has been updated successfully!', '2025-02-26', '11:11:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170307, '', '', 'User Attendance with attendacneID 14 has been updated successfully!', '2025-02-26', '11:14:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170308, '', '', 'User Attendance with attendacneID 14 has been updated successfully!', '2025-02-26', '11:16:05', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170309, '', '', 'User Attendance with attendacneID 17 has been updated successfully!', '2025-02-26', '11:23:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170310, '', '', 'User Attendance with attendacneID 18 has been updated successfully!', '2025-02-26', '11:29:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170311, '', '', 'User Attendance with attendacneID 19 has been updated successfully!', '2025-02-26', '12:58:59', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170312, '', '', 'User Attendance with attendacneID 19 has been updated successfully!', '2025-02-26', '12:59:04', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170313, '', '', 'User Attendance with attendacneID 19 has been updated successfully!', '2025-02-26', '12:59:09', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170314, '', '', 'User Attendance with attendanceID 21 has been updated successfully!', '2025-02-26', '13:11:21', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL);
INSERT INTO `tbl_logs` (`LOGID`, `USERID`, `USER_NAME`, `ACTION`, `DATELOG`, `TIMELOG`, `user_ip_address`, `device_used`, `PORTAL`, `AY`, `SEMESTER`, `COMPANYID`, `CAMPUSID`, `IDENTIFIER`, `ACCOUNT_ID`) VALUES
(170315, '', '', 'User Attendance with attendanceID 21 has been updated successfully!', '2025-02-26', '13:11:51', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170316, '', '', 'User Attendance with attendanceID 21 has been updated successfully!', '2025-02-26', '13:11:57', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170317, '', '', 'User Attendance with attendanceID 21 has been updated successfully!', '2025-02-26', '13:12:02', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170318, '', '', 'User Attendance with attendanceID 22 has been updated successfully!', '2025-02-26', '13:26:44', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170319, '', '', 'User Attendance with attendanceID 22 has been updated successfully!', '2025-02-26', '13:26:49', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170320, '', '', 'User Attendance with attendanceID 22 has been updated successfully!', '2025-02-26', '13:28:42', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170321, '', '', 'User Attendance with attendanceID 23 has been updated successfully!', '2025-02-26', '13:29:13', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170322, '', '', 'User Attendance with attendanceID 23 has been updated successfully!', '2025-02-26', '13:29:18', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170323, '', '', 'Jose Neil Buenabiles&#039;s afternoon attendance for today (1:39:51 PM) has been created successfully.', '2025-02-26', '13:39:51', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170324, '', '', 'User Attendance with attendanceID 28 has been updated successfully!', '2025-02-26', '13:40:46', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170325, '', '', 'Jose Neil Buenabiles&#039;s afternoon attendance for today (1:47:19 PM) has been created successfully.', '2025-02-26', '13:47:19', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170326, '', '', 'Juan Dela Cruz&#039;s afternoon attendance for today (1:48:58 PM) has been created successfully.', '2025-02-26', '13:48:58', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170327, '', '', 'Juan Dela Cruz&#039;s afternoon attendance for today (1:50:42 PM) has been created successfully.', '2025-02-26', '13:50:42', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170328, '', '', 'Jose Neil Buenabiles&#039;s afternoon attendance for today (1:55:55 PM) has been created successfully.', '2025-02-26', '13:55:55', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170329, '', '', 'Jose Neil Buenabiles&#039;s afternoon attendance for today (1:58:13 PM) has been created successfully.', '2025-02-26', '13:58:13', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170330, '', '', 'Juan Dela Cruz&#039;s afternoon attendance for today (1:58:21 PM) has been created successfully.', '2025-02-26', '13:58:21', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170331, '', '', 'User Attendance with attendanceID 34 has been updated successfully!', '2025-02-26', '14:03:24', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170332, '', '', '&#039;s afternoon time-out for today (2:03:24 PM) has been updated successfully.', '2025-02-26', '14:03:24', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170333, '', '', 'Juan Dela Cruz&#039;s afternoon attendance for today (2:04:38 PM) has been created successfully.', '2025-02-26', '14:04:38', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170334, '', '', 'Jose Neil Buenabiles&#039;s afternoon attendance for today (2:04:45 PM) has been created successfully.', '2025-02-26', '14:04:46', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170335, '', '', 'User Attendance with attendanceID 36 has been updated successfully!', '2025-02-26', '14:16:56', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170336, '', '', 'Jose Neil Buenabiles&#039;s afternoon time-out for today (2:16:56 PM) has been updated successfully.', '2025-02-26', '14:16:56', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170337, '', '', 'User Attendance with attendanceID 35 has been updated successfully!', '2025-02-26', '14:17:33', '', '', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170338, '', '', 'Juan Dela Cruz&#039;s afternoon time-out for today (2:17:33 PM) has been updated successfully.', '2025-02-26', '14:17:33', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170339, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '14:18:44', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170340, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '14:23:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170341, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '14:24:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170342, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '14:25:28', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170343, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '14:25:34', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170344, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '14:28:34', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170345, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '14:29:43', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170346, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '15:01:43', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170347, '', '', 'Jose Neil Buenabiles&#039;s afternoon attendance for today (3:01:52 PM) has been created successfully.', '2025-02-26', '15:01:52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170348, '', '', 'Juan Dela Cruz&#039;s afternoon attendance for today (3:01:57 PM) has been created successfully.', '2025-02-26', '15:01:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170349, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '15:02:10', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170350, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '15:41:29', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170351, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '15:41:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170352, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '16:00:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170353, '', '', 'Juan Dela Cruz&#039;s afternoon attendance for today (4:01:27 PM) has been created successfully.', '2025-02-26', '16:01:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170354, '', '', 'User Attendance with attendanceID 39 has been updated successfully!', '2025-02-26', '16:01:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170355, '', '', 'Juan Dela Cruz&#039;s afternoon time-out for today (4:01:36 PM) has been updated successfully.', '2025-02-26', '16:01:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170356, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-26', '16:01:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170357, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-26', '16:05:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170358, '', '', 'Jose Neil Buenabiles&#039;s morning attendance for today (8:44:43 AM) has been created successfully.', '2025-02-27', '08:44:43', '', '', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170359, 'admin', 'White, Adam Ray', 'Login to the system.', '2025-02-27', '08:45:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170360, 'admin', 'White, Adam Ray', 'Logout to the system.', '2025-02-27', '08:48:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170361, 'admin', 'Buenabiles Jose Neil', 'Login to the system.', '2025-02-27', '09:06:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170362, 'admin', 'Buenabiles Jose Neil', 'Logout to the system.', '2025-02-27', '09:06:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170363, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:06:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170364, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '09:08:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170365, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:08:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170366, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '09:10:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170367, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:10:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170368, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:12:21', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170369, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '09:14:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170370, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:15:03', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170371, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '09:25:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170372, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:31:17', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170373, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '09:31:22', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170374, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:40:19', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170375, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '09:46:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170376, 'admin', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '09:51:33', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170377, 'admin', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '09:51:49', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170378, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '09:55:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170379, 'employee', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '09:55:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170380, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '09:55:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170381, 'employee', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '09:57:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170382, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '09:57:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170383, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '09:57:42', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170384, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '09:57:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170385, 'employee', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '10:09:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170386, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '10:09:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170387, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '10:09:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170388, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '10:09:48', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170389, 'employee', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '10:12:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170390, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-02-27', '10:12:25', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170391, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-02-27', '10:12:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170392, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '10:12:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170393, 'employee', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '10:12:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170394, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '10:13:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170395, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '10:50:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170396, 'employee', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '10:54:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170397, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '10:56:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170398, 'employee', 'Dela Cruz, Juan', 'Logout to the system.', '2025-02-27', '10:58:56', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170399, '', '', 'Juan Dela Cruz&#039;s morning attendance for today (10:59:06 AM) has been created successfully.', '2025-02-27', '10:59:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170400, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-02-27', '10:59:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170401, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-03-03', '10:34:23', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170402, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-03-03', '10:39:53', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170403, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '10:40:44', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170404, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-03-03', '11:11:05', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170405, 'employee', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '11:11:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170406, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '11:22:55', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170407, 'counter1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-03', '11:23:56', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170408, 'counter2', 'Santos, Maria', 'Login to the system.', '2025-03-03', '11:24:03', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170409, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '12:36:10', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170410, 'counter1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-03', '12:36:29', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170411, 'counter2', 'Santos, Maria', 'Login to the system.', '2025-03-03', '12:36:33', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170412, 'counter2', 'Santos, Maria', 'Logout to the system.', '2025-03-03', '12:41:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170413, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '12:41:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170414, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '14:08:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170415, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '15:07:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170416, 'admin', 'Buenabiles, Jose Neil', 'Login to the system.', '2025-03-03', '15:35:56', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170417, 'admin', 'Buenabiles, Jose Neil', 'Logout to the system.', '2025-03-03', '15:36:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170418, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '15:36:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170419, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '16:48:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170420, 'counter1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-03', '16:49:05', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170421, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-03', '16:51:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170422, 'counter1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-04', '08:39:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170423, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-04', '09:22:52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170424, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-04', '13:33:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170425, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-04', '14:44:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170426, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-04', '14:44:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170427, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-04', '15:21:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170428, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-04', '16:33:42', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170429, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-04', '18:51:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170430, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '08:32:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170431, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:00:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170432, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:01:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170433, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:38:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170434, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:45:49', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170435, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:45:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170436, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:46:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170437, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:47:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170438, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:47:33', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170439, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:47:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170440, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '09:55:08', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170441, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '09:55:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170442, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '09:55:48', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170443, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '09:55:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170444, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '09:56:29', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170445, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '10:05:09', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170446, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '10:05:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170447, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '10:05:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170448, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '10:05:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170449, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '10:20:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170450, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '10:20:13', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170451, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '10:20:21', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170452, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '10:20:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170453, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '10:22:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170454, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '10:22:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170455, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '10:22:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170456, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '10:22:44', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170457, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '10:23:13', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170458, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '10:23:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170459, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '10:23:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170460, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '10:34:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170461, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '10:34:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170462, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '11:39:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170463, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-05', '11:39:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170464, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '13:15:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170465, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:35:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170466, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:36:11', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170467, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:36:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170468, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:38:08', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170469, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:42:00', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170470, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:42:47', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170471, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:43:08', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170472, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:43:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170473, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:44:03', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170474, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:44:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170475, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:44:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170476, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:48:04', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170477, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:51:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170478, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:51:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170479, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:55:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170480, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '14:56:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170481, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '15:05:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170482, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-05', '15:06:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170483, 'cashier2', 'Santos, Maria', 'Transaction with ID 22 has been updated successfully!', '2025-03-05', '15:06:10', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170484, 'cashier2', 'Santos, Maria', 'Transaction with ID 19 has been updated successfully!', '2025-03-05', '15:06:19', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170485, 'cashier2', 'Santos, Maria', 'Logout to the system.', '2025-03-05', '15:08:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170486, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '15:09:04', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170487, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '15:09:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170488, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '15:12:10', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170489, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '15:13:33', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170490, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '15:13:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170491, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-05', '15:13:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170492, 'cashier2', 'Santos, Maria', 'Transaction with ID 19 has been updated successfully!', '2025-03-05', '15:24:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170493, 'cashier2', 'Santos, Maria', 'Transaction with ID 18 has been updated successfully!', '2025-03-05', '15:24:12', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170494, 'cashier2', 'Santos, Maria', 'Transaction with ID 17 has been updated successfully!', '2025-03-05', '15:24:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170495, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '16:15:29', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170496, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:16:28', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170497, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:16:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170498, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:16:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170499, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:17:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170500, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:17:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170501, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '16:17:11', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170502, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '16:17:25', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170503, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 27 has been updated successfully!', '2025-03-05', '16:17:37', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170504, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 25 has been updated successfully!', '2025-03-05', '16:17:43', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170505, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 21 has been updated successfully!', '2025-03-05', '16:17:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170506, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 26 has been updated successfully!', '2025-03-05', '16:17:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170507, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '16:18:08', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170508, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-05', '16:18:13', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170509, 'cashier2', 'Santos, Maria', 'Transaction with ID 28 has been updated successfully!', '2025-03-05', '16:18:19', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170510, 'cashier2', 'Santos, Maria', 'Transaction with ID 24 has been updated successfully!', '2025-03-05', '16:18:25', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170511, 'cashier2', 'Santos, Maria', 'Transaction with ID 15 has been updated successfully!', '2025-03-05', '16:20:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170512, 'cashier2', 'Santos, Maria', 'Logout to the system.', '2025-03-05', '16:20:47', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170513, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '16:20:52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170514, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '16:21:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL);
INSERT INTO `tbl_logs` (`LOGID`, `USERID`, `USER_NAME`, `ACTION`, `DATELOG`, `TIMELOG`, `user_ip_address`, `device_used`, `PORTAL`, `AY`, `SEMESTER`, `COMPANYID`, `CAMPUSID`, `IDENTIFIER`, `ACCOUNT_ID`) VALUES
(170515, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '16:21:12', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170516, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 20 has been updated successfully!', '2025-03-05', '16:21:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170517, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '16:21:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170518, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '16:22:03', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170519, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:22:10', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170520, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:22:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170521, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '16:22:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170522, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '16:22:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170523, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '16:30:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170524, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-05', '16:30:25', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170525, 'cashier2', 'Santos, Maria', 'Logout to the system.', '2025-03-05', '16:30:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170526, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '16:30:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170527, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 29 has been updated successfully!', '2025-03-05', '16:30:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170528, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '16:31:05', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170529, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '16:31:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170530, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:32:11', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170531, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:32:21', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170532, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:32:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170533, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:32:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170534, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:32:34', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170535, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:32:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170536, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '16:32:42', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170537, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '16:32:47', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170538, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 36 has been updated successfully!', '2025-03-05', '16:32:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170539, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 32 has been updated successfully!', '2025-03-05', '16:33:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170540, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 31 has been updated successfully!', '2025-03-05', '16:33:12', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170541, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 35 has been updated successfully!', '2025-03-05', '16:33:18', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170542, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 33 has been updated successfully!', '2025-03-05', '16:33:23', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170543, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '16:40:01', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170544, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '16:40:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170545, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:43:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170546, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:43:55', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170547, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:44:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170548, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:44:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170549, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:47:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170550, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:48:22', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170551, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:49:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170552, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:50:21', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170553, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:51:28', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170554, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '16:54:48', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170555, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-05', '16:54:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170556, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-05', '16:55:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170557, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '16:55:08', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170558, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:55:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170559, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:55:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170560, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:55:24', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170561, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:55:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170562, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '16:55:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170563, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '16:55:34', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170564, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-05', '16:55:41', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170565, 'cashier2', 'Santos, Maria', 'Transaction with ID 50 has been updated successfully!', '2025-03-05', '16:55:50', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170566, 'cashier2', 'Santos, Maria', 'Transaction with ID 46 has been updated successfully!', '2025-03-05', '16:55:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170567, 'cashier2', 'Santos, Maria', 'Transaction with ID 34 has been updated successfully!', '2025-03-05', '16:56:05', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170568, 'cashier2', 'Santos, Maria', 'Transaction with ID 30 has been updated successfully!', '2025-03-05', '16:56:11', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170569, 'cashier2', 'Santos, Maria', 'Logout to the system.', '2025-03-05', '17:03:45', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170570, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-05', '17:03:52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170571, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '17:03:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170572, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '17:04:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170573, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '17:04:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170574, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '17:04:10', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170575, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-05', '17:04:13', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170576, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-05', '17:04:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170577, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-05', '17:04:21', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170578, 'cashier2', 'Santos, Maria', 'Transaction with ID 55 has been updated successfully!', '2025-03-05', '17:04:30', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170579, 'cashier2', 'Santos, Maria', 'Transaction with ID 52 has been updated successfully!', '2025-03-05', '17:04:35', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170580, 'cashier2', 'Santos, Maria', 'Transaction with ID 51 has been updated successfully!', '2025-03-05', '17:04:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170581, 'cashier2', 'Santos, Maria', 'Transaction with ID 54 has been updated successfully!', '2025-03-05', '17:04:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170582, 'cashier2', 'Santos, Maria', 'Transaction with ID 53 has been updated successfully!', '2025-03-05', '17:04:42', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170583, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-06', '08:40:52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170584, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-06', '08:56:48', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170585, 'cashier2', 'Santos, Maria', 'Login to the system.', '2025-03-06', '08:56:57', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170586, 'cashier2', 'Santos, Maria', 'Logout to the system.', '2025-03-06', '08:57:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170587, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-06', '08:57:08', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170588, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:26', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170589, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:34', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170590, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:38', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170591, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:42', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170592, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:46', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170593, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:51', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170594, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170595, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:57:58', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170596, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:58:02', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170597, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:58:06', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170598, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:58:15', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170599, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '08:58:22', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170600, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-06', '08:58:31', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170601, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-06', '08:58:36', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170602, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 64 has been updated successfully!', '2025-03-06', '08:58:49', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170603, 'cashier1', 'Dela Cruz, Juan', 'Logout to the system.', '2025-03-06', '09:21:20', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170604, 'kiosk1', 'Silang, Gabriela', 'Login to the system.', '2025-03-06', '09:21:25', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170605, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '09:21:53', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170606, 'kiosk1', 'Silang, Gabriela', 'New Transaction has been created successfully!', '2025-03-06', '09:22:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'INSERT', NULL),
(170607, 'kiosk1', 'Silang, Gabriela', 'Logout to the system.', '2025-03-06', '09:32:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGOUT', NULL),
(170608, 'cashier1', 'Dela Cruz, Juan', 'Login to the system.', '2025-03-06', '09:32:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'LOGIN', NULL),
(170609, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 56 has been updated successfully!', '2025-03-06', '09:33:04', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170610, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 58 has been updated successfully!', '2025-03-06', '09:33:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170611, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 63 has been updated successfully!', '2025-03-06', '09:36:16', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170612, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 64 has been updated successfully!', '2025-03-06', '09:37:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170613, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 57 has been updated successfully!', '2025-03-06', '09:38:04', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170614, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 62 has been updated successfully!', '2025-03-06', '09:39:14', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170615, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 65 has been updated successfully!', '2025-03-06', '09:39:17', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170616, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 67 has been updated successfully!', '2025-03-06', '09:39:19', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170617, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 56 has been updated successfully!', '2025-03-06', '09:43:27', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170618, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 58 has been updated successfully!', '2025-03-06', '09:43:32', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170619, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 63 has been updated successfully!', '2025-03-06', '09:43:40', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170620, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 64 has been updated successfully!', '2025-03-06', '09:43:44', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL),
(170621, 'cashier1', 'Dela Cruz, Juan', 'Transaction with ID 57 has been updated successfully!', '2025-03-06', '09:43:49', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 12, '', '', NULL, NULL, 'UPDATE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `queue_number` varchar(10) NOT NULL,
  `priority` varchar(15) DEFAULT 'No',
  `date_created` datetime DEFAULT current_timestamp(),
  `counter_id` int(11) NOT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `queue_number`, `priority`, `date_created`, `counter_id`, `status`) VALUES
(3, '#0001', 'Yes', '2025-03-03 14:33:16', 2, 'Pending'),
(4, '#0002', 'No', '2025-03-03 14:33:16', 1, 'Pending'),
(5, '#0003', 'Yes', '2025-03-03 14:33:16', 3, 'Pending'),
(6, '#0004', 'No', '2025-03-03 14:33:16', 2, 'Pending'),
(7, '#0005', 'Yes', '2025-03-03 14:33:16', 1, 'Pending'),
(8, '#0006', 'No', '2025-03-04 15:28:08', 3, 'Pending'),
(9, '#0007', 'No', '2025-03-04 15:28:08', 1, 'Pending'),
(10, '#0008', 'Yes', '2025-03-04 15:28:08', 2, 'Pending'),
(11, '#0009', 'Yes', '2025-03-04 15:28:08', 1, 'Pending'),
(12, '#0010', 'No', '2025-03-04 15:28:08', 2, 'Pending'),
(15, '#0001', 'Yes', '2025-03-05 09:38:16', 2, 'Completed'),
(16, '#0002', 'Yes', '2025-03-05 09:45:49', 3, 'Pending'),
(17, '#0003', 'Yes', '2025-03-05 09:45:58', 2, 'Completed'),
(18, '#0004', 'Yes', '2025-03-05 09:46:07', 2, 'Completed'),
(19, '#0005', 'Yes', '2025-03-05 09:47:23', 2, 'Completed'),
(20, '#0006', 'No', '2025-03-05 09:47:33', 1, 'Completed'),
(21, '#0007', 'Yes', '2025-03-05 09:47:41', 1, 'Completed'),
(22, '#0008', 'Yes', '2025-03-05 09:55:48', 2, 'Completed'),
(23, '#0009', 'Yes', '2025-03-05 10:23:38', 3, 'Pending'),
(24, '#0010', 'Yes', '2025-03-05 16:16:28', 2, 'Pending'),
(25, '#0011', 'Yes', '2025-03-05 16:16:38', 1, 'Completed'),
(26, '#0012', 'No', '2025-03-05 16:16:53', 1, 'Completed'),
(27, '#0013', 'Yes', '2025-03-05 16:17:02', 1, 'Completed'),
(28, '#0014', 'Yes', '2025-03-05 16:17:07', 2, 'Completed'),
(29, '#0015', 'Yes', '2025-03-05 16:22:10', 1, 'Completed'),
(30, '#0016', 'Yes', '2025-03-05 16:22:15', 2, 'Completed'),
(31, '#0017', 'Yes', '2025-03-05 16:32:11', 1, 'Completed'),
(32, '#0018', 'Yes', '2025-03-05 16:32:21', 1, 'Completed'),
(33, '#0019', 'No', '2025-03-05 16:32:26', 1, 'Completed'),
(34, '#0020', 'Yes', '2025-03-05 16:32:30', 2, 'Completed'),
(35, '#0021', 'No', '2025-03-05 16:32:34', 1, 'Completed'),
(36, '#0022', 'Yes', '2025-03-05 16:32:38', 1, 'Completed'),
(43, '#0023', 'Yes', '2025-03-05 16:49:40', 4, 'Pending'),
(44, '#0024', 'Yes', '2025-03-05 16:50:21', 4, 'Pending'),
(45, '#0025', 'Yes', '2025-03-05 16:51:28', 4, 'Pending'),
(46, '#0026', 'Yes', '2025-03-05 16:55:16', 2, 'Completed'),
(47, '#0027', 'Yes', '2025-03-05 16:55:20', 1, 'Pending'),
(48, '#0028', 'Yes', '2025-03-05 16:55:24', 1, 'Pending'),
(49, '#0029', 'No', '2025-03-05 16:55:27', 1, 'Pending'),
(50, '#0030', 'Yes', '2025-03-05 16:55:32', 2, 'Pending'),
(51, '#0031', 'Yes', '2025-03-05 17:03:57', 2, 'Pending'),
(52, '#0032', 'Yes', '2025-03-05 17:04:02', 2, 'Pending'),
(53, '#0033', 'No', '2025-03-05 17:04:07', 2, 'Pending'),
(54, '#0034', 'No', '2025-03-05 17:04:10', 2, 'Pending'),
(55, '#0035', 'Yes', '2025-03-05 17:04:13', 2, 'Pending'),
(56, '#0001', 'Yes', '2025-03-06 08:57:26', 1, 'Completed'),
(57, '#0002', 'No', '2025-03-06 08:57:34', 1, 'Completed'),
(58, '#0003', 'Yes', '2025-03-06 08:57:38', 1, 'Completed'),
(59, '#0004', 'Yes', '2025-03-06 08:57:42', 2, 'Pending'),
(60, '#0005', 'No', '2025-03-06 08:57:46', 2, 'Pending'),
(61, '#0006', 'Yes', '2025-03-06 08:57:51', 2, 'Pending'),
(62, '#0007', 'No', '2025-03-06 08:57:54', 1, 'Pending'),
(63, '#0008', 'Yes', '2025-03-06 08:57:58', 1, 'Completed'),
(64, '#0009', 'Yes', '2025-03-06 08:58:02', 1, 'Completed'),
(65, '#0010', 'No', '2025-03-06 08:58:06', 1, 'Pending'),
(66, '#0011', 'Yes', '2025-03-06 08:58:15', 2, 'Pending'),
(67, '#0012', 'No', '2025-03-06 08:58:22', 1, 'Pending'),
(68, '#0013', 'Yes', '2025-03-06 09:21:53', 2, 'Pending'),
(69, '#0014', 'Yes', '2025-03-06 09:22:07', 2, 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cashier_history`
--
ALTER TABLE `cashier_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`counter_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `loginattemp`
--
ALTER TABLE `loginattemp`
  ADD PRIMARY KEY (`ATTEMPID`);

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`LOGID`),
  ADD KEY `USERID` (`USERID`),
  ADD KEY `USER_NAME` (`USER_NAME`),
  ADD KEY `CAMPUSID` (`CAMPUSID`),
  ADD KEY `SEMESTER` (`SEMESTER`),
  ADD KEY `AY` (`AY`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transactions_ibfk_1` (`counter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cashier_history`
--
ALTER TABLE `cashier_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `counter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `loginattemp`
--
ALTER TABLE `loginattemp`
  MODIFY `ATTEMPID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=977;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `LOGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170622;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`counter_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
