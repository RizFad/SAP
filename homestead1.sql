-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 04:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homestead`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `account_details` text DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `business_id`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-05 05:08:49', '2024-03-05 05:08:49'),
(2, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-13 02:52:10', '2024-03-13 02:52:10'),
(3, 'default', 'added', 2, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Production DRX\"}', NULL, '2024-03-13 02:56:59', '2024-03-13 02:56:59'),
(4, 'default', 'added', 3, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Customer DRX\"}', NULL, '2024-03-13 02:57:58', '2024-03-13 02:57:58'),
(5, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-05-27 07:44:25', '2024-05-27 07:44:25'),
(6, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 05:55:14', '2024-06-20 05:55:14'),
(7, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 06:31:02', '2024-06-20 06:31:02'),
(8, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-06-20 06:31:14', '2024-06-20 06:31:14'),
(9, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-06-20 06:31:33', '2024-06-20 06:31:33'),
(10, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 06:31:41', '2024-06-20 06:31:41'),
(11, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 08:40:51', '2024-06-20 08:40:51'),
(12, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-06-20 08:42:24', '2024-06-20 08:42:24'),
(13, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-06-20 08:43:13', '2024-06-20 08:43:13'),
(14, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 08:43:20', '2024-06-20 08:43:20'),
(15, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 08:45:03', '2024-06-20 08:45:03'),
(16, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-06-20 08:45:08', '2024-06-20 08:45:08'),
(17, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-06-20 08:48:45', '2024-06-20 08:48:45'),
(18, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 08:48:55', '2024-06-20 08:48:55'),
(19, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 10:31:07', '2024-06-20 10:31:07'),
(20, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 10:31:29', '2024-06-20 10:31:29'),
(21, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 10:37:07', '2024-06-20 10:37:07'),
(22, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-20 10:39:34', '2024-06-20 10:39:34'),
(23, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-06-24 07:37:04', '2024-06-24 07:37:04'),
(24, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-08 03:37:09', '2024-07-08 03:37:09'),
(25, 'default', 'added', 2, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":140000}}', NULL, '2024-07-08 06:53:09', '2024-07-08 06:53:09'),
(26, 'default', 'edited', 2, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"partial\",\"final_total\":150000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"140000.0000\"}}', NULL, '2024-07-08 07:14:26', '2024-07-08 07:14:26'),
(27, 'default', 'edited', 2, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"partial\",\"final_total\":150000},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"partial\",\"final_total\":\"150000.0000\"}}', NULL, '2024-07-08 07:14:56', '2024-07-08 07:14:56'),
(28, 'default', 'sell_deleted', 2, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":2,\"invoice_no\":\"2024\\/0001\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"partial\",\"final_total\":\"150000.0000\"}}', NULL, '2024-07-08 07:15:06', '2024-07-08 07:15:06'),
(29, 'default', 'added', 4, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Partner PSIS \"}', NULL, '2024-07-08 07:18:53', '2024-07-08 07:18:53'),
(30, 'default', 'edited', 4, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Partner PSIS \"}', NULL, '2024-07-08 07:22:33', '2024-07-08 07:22:33'),
(31, 'default', 'login', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-07-08 07:25:34', '2024-07-08 07:25:34'),
(32, 'default', 'added', 2, 'App\\Contact', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-07-08 07:44:10', '2024-07-08 07:44:10'),
(33, 'default', 'logout', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-07-08 07:49:18', '2024-07-08 07:49:18'),
(34, 'default', 'login', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-07-08 07:49:24', '2024-07-08 07:49:24'),
(35, 'default', 'edited', 4, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Partner PSIS \"}', NULL, '2024-07-08 07:51:44', '2024-07-08 07:51:44'),
(36, 'default', 'edited', 4, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Partner PSIS \"}', NULL, '2024-07-08 07:53:34', '2024-07-08 07:53:34'),
(37, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-28 14:25:24', '2024-07-28 14:25:24'),
(38, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-28 18:25:03', '2024-07-28 18:25:03'),
(39, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-29 02:32:50', '2024-07-29 02:32:50'),
(40, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-29 11:00:52', '2024-07-29 11:00:52'),
(41, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-31 05:25:09', '2024-07-31 05:25:09'),
(42, 'default', 'login', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-07-31 06:46:05', '2024-07-31 06:46:05'),
(43, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-31 06:46:46', '2024-07-31 06:46:46'),
(44, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-31 06:46:56', '2024-07-31 06:46:56'),
(45, 'default', 'logout', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-07-31 06:48:26', '2024-07-31 06:48:26'),
(46, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-31 06:48:35', '2024-07-31 06:48:35'),
(47, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-31 07:25:59', '2024-07-31 07:25:59'),
(48, 'default', 'login', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-07-31 07:26:09', '2024-07-31 07:26:09'),
(49, 'default', 'edited', 4, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Partner PSIS \"}', NULL, '2024-07-31 08:09:11', '2024-07-31 08:09:11'),
(50, 'default', 'added', 5, 'App\\Transaction', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-31 08:13:08', '2024-07-31 08:13:08'),
(51, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-03 05:05:21', '2024-08-03 05:05:22'),
(52, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-04 15:44:10', '2024-08-04 15:44:10'),
(53, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-07 07:37:22', '2024-08-07 07:37:22'),
(54, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-07 08:35:55', '2024-08-07 08:35:55'),
(55, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-07 08:47:06', '2024-08-07 08:47:06'),
(56, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-07 09:14:49', '2024-08-07 09:14:49'),
(57, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-08 07:42:52', '2024-08-08 07:42:52'),
(58, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-09 15:57:51', '2024-08-09 15:57:51'),
(59, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 07:52:28', '2024-08-12 07:52:28'),
(60, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 07:52:48', '2024-08-12 07:52:48'),
(61, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 07:55:46', '2024-08-12 07:55:46'),
(62, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-13 16:42:12', '2024-08-13 16:42:12'),
(63, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-14 02:59:44', '2024-08-14 02:59:44'),
(64, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-14 03:00:28', '2024-08-14 03:00:28'),
(65, 'default', 'login', 6, 'App\\User', NULL, 3, 6, 'App\\User', '[]', NULL, '2024-08-25 16:11:07', '2024-08-25 16:11:07'),
(66, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-13 09:01:16', '2024-09-13 09:01:16'),
(67, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-21 11:35:01', '2024-09-21 11:35:01'),
(68, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-21 11:37:16', '2024-09-21 11:37:16'),
(69, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-21 11:37:23', '2024-09-21 11:37:23'),
(70, 'default', 'added', 6, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":840000}}', NULL, '2024-09-21 11:40:57', '2024-09-21 11:40:57'),
(71, 'default', 'added', 7, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":740000}}', NULL, '2024-09-21 11:43:18', '2024-09-21 11:43:18'),
(72, 'default', 'edited', 7, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":720000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"740000.0000\"}}', NULL, '2024-09-21 11:45:03', '2024-09-21 11:45:03'),
(73, 'default', 'added', 8, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":440000}}', NULL, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(74, 'default', 'added', 8, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Jagal Defender\"}', NULL, '2024-09-21 12:04:49', '2024-09-21 12:04:49'),
(75, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-01 10:02:30', '2024-10-01 10:02:30'),
(76, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-01 10:05:34', '2024-10-01 10:05:34'),
(77, 'default', 'login', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-10-01 10:05:45', '2024-10-01 10:05:45'),
(78, 'default', 'logout', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-10-01 10:16:51', '2024-10-01 10:16:51'),
(79, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-01 10:16:58', '2024-10-01 10:16:58'),
(80, 'default', 'added', 9, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr PSM Makasar\"}', NULL, '2024-10-01 10:18:59', '2024-10-01 10:18:59'),
(81, 'default', 'edited', 9, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr PSM Makasar\"}', NULL, '2024-10-01 10:23:36', '2024-10-01 10:23:36'),
(82, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-01 10:27:51', '2024-10-01 10:27:51'),
(83, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-01 10:27:57', '2024-10-01 10:27:57'),
(84, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-01 10:31:12', '2024-10-01 10:31:12'),
(85, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-01 10:31:16', '2024-10-01 10:31:16'),
(86, 'default', 'edited', 9, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr PSM Makasar\"}', NULL, '2024-10-01 10:40:55', '2024-10-01 10:40:55'),
(87, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-01 10:41:04', '2024-10-01 10:41:04'),
(88, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-01 10:41:08', '2024-10-01 10:41:08'),
(89, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-01 10:41:37', '2024-10-01 10:41:37'),
(90, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-01 10:41:42', '2024-10-01 10:41:42'),
(91, 'default', 'edited', 9, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr PSM Makasar\"}', NULL, '2024-10-01 10:44:10', '2024-10-01 10:44:10'),
(92, 'default', 'added', 13, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10000000}}', NULL, '2024-10-01 11:01:43', '2024-10-01 11:01:43'),
(93, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-03 12:53:57', '2024-10-03 12:53:57'),
(94, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-03 12:58:47', '2024-10-03 12:58:47'),
(95, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-03 12:58:51', '2024-10-03 12:58:51'),
(96, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-03 23:17:16', '2024-10-03 23:17:16'),
(97, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-03 23:41:29', '2024-10-03 23:41:29'),
(98, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-03 23:41:34', '2024-10-03 23:41:34'),
(99, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-03 23:51:27', '2024-10-03 23:51:27'),
(100, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-03 23:51:34', '2024-10-03 23:51:34'),
(101, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 06:20:56', '2024-10-04 06:20:56'),
(102, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 06:21:07', '2024-10-04 06:21:07'),
(103, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 06:51:35', '2024-10-04 06:51:35'),
(104, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 06:51:39', '2024-10-04 06:51:39'),
(105, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 07:00:23', '2024-10-04 07:00:23'),
(106, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 07:00:29', '2024-10-04 07:00:29'),
(107, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 08:24:41', '2024-10-04 08:24:41'),
(108, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 08:24:48', '2024-10-04 08:24:48'),
(109, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 08:25:47', '2024-10-04 08:25:47'),
(110, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 08:26:16', '2024-10-04 08:26:16'),
(111, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 08:26:22', '2024-10-04 08:26:22'),
(112, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 08:26:28', '2024-10-04 08:26:28'),
(113, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 08:55:39', '2024-10-04 08:55:39'),
(114, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 08:55:47', '2024-10-04 08:55:47'),
(115, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 09:06:04', '2024-10-04 09:06:04'),
(116, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 09:06:08', '2024-10-04 09:06:08'),
(117, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 09:21:43', '2024-10-04 09:21:43'),
(118, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 09:21:47', '2024-10-04 09:21:47'),
(119, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 09:22:18', '2024-10-04 09:22:18'),
(120, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 09:22:23', '2024-10-04 09:22:23'),
(121, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 09:31:01', '2024-10-04 09:31:01'),
(122, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 09:31:16', '2024-10-04 09:31:16'),
(123, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 09:32:06', '2024-10-04 09:32:06'),
(124, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 09:32:18', '2024-10-04 09:32:18'),
(125, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 09:34:20', '2024-10-04 09:34:20'),
(126, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 09:34:42', '2024-10-04 09:34:42'),
(127, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 09:53:55', '2024-10-04 09:53:55'),
(128, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 09:54:01', '2024-10-04 09:54:01'),
(129, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:36:15', '2024-10-04 10:36:15'),
(130, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:36:35', '2024-10-04 10:36:35'),
(131, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:37:23', '2024-10-04 10:37:23'),
(132, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:37:37', '2024-10-04 10:37:37'),
(133, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:37:48', '2024-10-04 10:37:48'),
(134, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:37:52', '2024-10-04 10:37:52'),
(135, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:39:11', '2024-10-04 10:39:11'),
(136, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:39:28', '2024-10-04 10:39:28'),
(137, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:46:08', '2024-10-04 10:46:08'),
(138, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:46:13', '2024-10-04 10:46:13'),
(139, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:48:57', '2024-10-04 10:48:57'),
(140, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:49:09', '2024-10-04 10:49:09'),
(141, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:50:42', '2024-10-04 10:50:42'),
(142, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:51:05', '2024-10-04 10:51:05'),
(143, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:51:45', '2024-10-04 10:51:45'),
(144, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:51:51', '2024-10-04 10:51:51'),
(145, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 10:52:45', '2024-10-04 10:52:45'),
(146, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 10:53:06', '2024-10-04 10:53:06'),
(147, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 11:00:40', '2024-10-04 11:00:40'),
(148, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 11:01:09', '2024-10-04 11:01:09'),
(149, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 11:02:04', '2024-10-04 11:02:04'),
(150, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 11:02:09', '2024-10-04 11:02:09'),
(151, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 11:17:52', '2024-10-04 11:17:52'),
(152, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 11:17:57', '2024-10-04 11:17:57'),
(153, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 11:18:59', '2024-10-04 11:18:59'),
(154, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 11:19:07', '2024-10-04 11:19:07'),
(155, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 11:36:42', '2024-10-04 11:36:42'),
(156, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 11:36:47', '2024-10-04 11:36:47'),
(157, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-04 11:37:25', '2024-10-04 11:37:25'),
(158, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 11:37:29', '2024-10-04 11:37:29'),
(159, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-05 03:17:49', '2024-10-05 03:17:49'),
(160, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-12 22:56:45', '2024-10-12 22:56:45'),
(161, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-12 22:58:15', '2024-10-12 22:58:15'),
(162, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-12 23:45:29', '2024-10-12 23:45:29'),
(163, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-12 23:46:03', '2024-10-12 23:46:03'),
(164, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-12 23:46:10', '2024-10-12 23:46:10'),
(165, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 10:06:55', '2024-10-13 10:06:55'),
(166, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 12:28:59', '2024-10-13 12:28:59'),
(167, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 12:29:08', '2024-10-13 12:29:08'),
(168, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 12:49:50', '2024-10-13 12:49:50'),
(169, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 12:49:55', '2024-10-13 12:49:55'),
(170, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 13:03:51', '2024-10-13 13:03:51'),
(171, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 13:03:56', '2024-10-13 13:03:56'),
(172, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 13:08:20', '2024-10-13 13:08:20'),
(173, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 13:08:25', '2024-10-13 13:08:25'),
(174, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 13:11:04', '2024-10-13 13:11:04'),
(175, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 13:11:39', '2024-10-13 13:11:39'),
(176, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 13:52:03', '2024-10-13 13:52:03'),
(177, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 13:52:07', '2024-10-13 13:52:07'),
(178, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 13:53:35', '2024-10-13 13:53:35'),
(179, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 13:53:40', '2024-10-13 13:53:40'),
(180, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 23:11:13', '2024-10-13 23:11:13'),
(181, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 23:21:11', '2024-10-13 23:21:11'),
(182, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 23:21:18', '2024-10-13 23:21:18'),
(183, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 23:21:51', '2024-10-13 23:21:51'),
(184, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 23:21:55', '2024-10-13 23:21:55'),
(185, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-13 23:59:40', '2024-10-13 23:59:40'),
(186, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-13 23:59:50', '2024-10-13 23:59:50'),
(187, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 00:00:24', '2024-10-14 00:00:24'),
(188, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 00:00:29', '2024-10-14 00:00:29'),
(189, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 00:17:50', '2024-10-14 00:17:50'),
(190, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 00:17:56', '2024-10-14 00:17:56'),
(191, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 00:18:24', '2024-10-14 00:18:24'),
(192, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 00:18:29', '2024-10-14 00:18:29'),
(193, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 00:38:54', '2024-10-14 00:38:54'),
(194, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 00:39:00', '2024-10-14 00:39:00'),
(195, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 00:39:53', '2024-10-14 00:39:53'),
(196, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 00:40:03', '2024-10-14 00:40:03'),
(197, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 06:25:19', '2024-10-14 06:25:19'),
(198, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 06:30:41', '2024-10-14 06:30:41'),
(199, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 06:30:47', '2024-10-14 06:30:47'),
(200, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 06:32:09', '2024-10-14 06:32:09'),
(201, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 06:34:35', '2024-10-14 06:34:35'),
(202, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:25:46', '2024-10-14 07:25:46'),
(203, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:25:52', '2024-10-14 07:25:52'),
(204, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:26:45', '2024-10-14 07:26:45'),
(205, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:26:50', '2024-10-14 07:26:50'),
(206, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:28:36', '2024-10-14 07:28:36'),
(207, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:28:48', '2024-10-14 07:28:48'),
(208, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:29:45', '2024-10-14 07:29:45'),
(209, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:29:51', '2024-10-14 07:29:51'),
(210, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:33:32', '2024-10-14 07:33:32'),
(211, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:33:38', '2024-10-14 07:33:38'),
(212, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:33:50', '2024-10-14 07:33:50'),
(213, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:33:58', '2024-10-14 07:33:58'),
(214, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:34:57', '2024-10-14 07:34:57'),
(215, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:35:04', '2024-10-14 07:35:04'),
(216, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:45:23', '2024-10-14 07:45:23'),
(217, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:45:32', '2024-10-14 07:45:32'),
(218, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:46:13', '2024-10-14 07:46:13'),
(219, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:46:19', '2024-10-14 07:46:19'),
(220, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 07:58:10', '2024-10-14 07:58:10'),
(221, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 07:58:18', '2024-10-14 07:58:18'),
(222, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 08:13:53', '2024-10-14 08:13:53'),
(223, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 08:13:59', '2024-10-14 08:13:59'),
(224, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 09:06:35', '2024-10-14 09:06:35'),
(225, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 11:46:48', '2024-10-14 11:46:48'),
(226, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 12:12:14', '2024-10-14 12:12:14'),
(227, 'default', 'login', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 12:12:22', '2024-10-14 12:12:22'),
(228, 'default', 'logout', 9, 'App\\User', NULL, 1, 9, 'App\\User', '[]', NULL, '2024-10-14 12:18:51', '2024-10-14 12:18:51'),
(229, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-14 12:20:49', '2024-10-14 12:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-17 23:13:44', '2017-12-17 23:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-17 23:04:39', '2017-12-17 23:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-17 22:55:40', '2017-12-17 22:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-17 22:58:40', '2017-12-17 22:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-17 22:51:10', '2017-12-17 22:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-17 22:51:10', '2017-12-17 22:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) NOT NULL,
  `booking_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DRX WEAR', NULL, 1, NULL, '2024-03-13 05:40:44', '2024-03-13 05:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) DEFAULT NULL,
  `tax_label_1` varchar(10) DEFAULT NULL,
  `tax_number_2` varchar(100) DEFAULT NULL,
  `tax_label_2` varchar(10) DEFAULT NULL,
  `code_label_1` varchar(191) DEFAULT NULL,
  `code_1` varchar(191) DEFAULT NULL,
  `code_label_2` varchar(191) DEFAULT NULL,
  `code_2` varchar(191) DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') NOT NULL DEFAULT 'includes',
  `logo` varchar(191) DEFAULT NULL,
  `sku_prefix` varchar(191) DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text DEFAULT NULL,
  `pos_settings` text DEFAULT NULL,
  `weighing_scale_setting` text NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') NOT NULL DEFAULT 'before',
  `enabled_modules` text DEFAULT NULL,
  `date_format` varchar(191) NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') NOT NULL DEFAULT '24',
  `currency_precision` tinyint(4) NOT NULL DEFAULT 2,
  `quantity_precision` tinyint(4) NOT NULL DEFAULT 2,
  `ref_no_prefixes` text DEFAULT NULL,
  `theme_color` char(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text DEFAULT NULL,
  `sms_settings` text DEFAULT NULL,
  `custom_labels` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `currency_precision`, `quantity_precision`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'DRX ADMINISTRATOR', 54, '2024-03-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Kolkata', 1, 'fifo', 0.00, 'includes', '1709620707_drx-logo-black.2b67de3b7a36138408248607c7ef42e2.svg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null,\"custom_field_11\":null,\"custom_field_12\":null,\"custom_field_13\":null,\"custom_field_14\":null,\"custom_field_15\":null,\"custom_field_16\":null,\"custom_field_17\":null,\"custom_field_18\":null,\"custom_field_19\":null,\"custom_field_20\":null},\"product_cf_details\":{\"1\":{\"type\":null,\"dropdown_options\":null},\"2\":{\"type\":null,\"dropdown_options\":null},\"3\":{\"type\":null,\"dropdown_options\":null},\"4\":{\"type\":null,\"dropdown_options\":null},\"5\":{\"type\":null,\"dropdown_options\":null},\"6\":{\"type\":null,\"dropdown_options\":null},\"7\":{\"type\":null,\"dropdown_options\":null},\"8\":{\"type\":null,\"dropdown_options\":null},\"9\":{\"type\":null,\"dropdown_options\":null},\"10\":{\"type\":null,\"dropdown_options\":null},\"11\":{\"type\":null,\"dropdown_options\":null},\"12\":{\"type\":null,\"dropdown_options\":null},\"13\":{\"type\":null,\"dropdown_options\":null},\"14\":{\"type\":null,\"dropdown_options\":null},\"15\":{\"type\":null,\"dropdown_options\":null},\"16\":{\"type\":null,\"dropdown_options\":null},\"17\":{\"type\":null,\"dropdown_options\":null},\"18\":{\"type\":null,\"dropdown_options\":null},\"19\":{\"type\":null,\"dropdown_options\":null},\"20\":{\"type\":null,\"dropdown_options\":null}},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":\"asd\",\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2024-03-05 05:08:27', '2024-09-21 12:13:57'),
(2, 'Hshs', 135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 5, 'Asia/Kolkata', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(3, 'Independent', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 6, 'Asia/Kolkata', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `landmark` text DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` char(7) NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_scheme_id` int(11) DEFAULT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `featured_products` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `sale_invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'DRX WEAR', 'Ventura Building', 'indonesia', 'jakarta', 'jakarta', '1111111', 1, NULL, 1, 1, NULL, 1, 'browser', NULL, '', '', '', 'https://drxasia.com', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(2, 1, 'BL0002', 'DRX PSIS', NULL, 'INDONESIA', 'JAWA TENGAH', 'SEMARANG', '111111', 1, 1, 1, 1, 0, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-07-08 07:42:09', '2024-07-08 07:42:09'),
(3, 2, 'BL0001', 'Hshs', 'Hchc', 'United States', 'Hshdd', 'Ududu', '69696', 2, NULL, 2, 2, NULL, 1, 'browser', NULL, '6969696999', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(4, 3, 'BL0001', 'Independent', 'ooooo', 'India', 'Uttarakhan', 'India', '11223', 3, NULL, 3, 3, NULL, 1, 'browser', NULL, '09123456780', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(5, 1, 'Makasar', 'DRX PSM', 'Makasar', 'Makasar', 'Makasar', 'Makasar', '65412', 1, 1, 1, 1, 0, 1, 'browser', NULL, '56465489000', '6540211015', 'makasar@gmail.com', 'makasar', NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-10-01 10:22:58', '2024-10-01 10:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `cash_denominations`
--

CREATE TABLE `cash_denominations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `total_count` int(11) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text DEFAULT NULL,
  `closing_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-06-20 06:32:00', '2024-06-20 06:32:08'),
(2, 1, 1, 2, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-06-20 08:45:00', '2024-06-20 08:45:34'),
(3, 1, 1, 4, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-07-08 07:37:00', '2024-07-08 07:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 140000.0000, 'cash', 'credit', 'sell', 2, '2024-07-08 06:53:09', '2024-07-08 06:53:09'),
(2, 1, 140000.0000, 'cash', 'debit', 'refund', 2, '2024-07-08 07:14:26', '2024-07-08 07:14:26'),
(3, 3, 1000000.0000, 'cash', 'credit', 'initial', NULL, '2024-07-08 07:37:24', '2024-07-08 07:37:24'),
(4, 1, 740000.0000, 'card', 'credit', 'sell', 7, '2024-09-21 11:43:17', '2024-09-21 11:43:17'),
(5, 1, 20000.0000, 'cash', 'debit', 'refund', 7, '2024-09-21 11:45:03', '2024-09-21 11:45:03'),
(6, 1, 740000.0000, 'card', 'debit', 'refund', 7, '2024-09-21 11:45:03', '2024-09-21 11:45:03'),
(7, 1, 740000.0000, 'other', 'credit', 'sell', 7, '2024-09-21 11:45:03', '2024-09-21 11:45:03'),
(8, 1, 440000.0000, 'cash', 'credit', 'sell', 8, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(9, 1, 10000000.0000, 'cash', 'credit', 'sell', 13, '2024-10-01 11:01:43', '2024-10-01 11:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Jersey', 1, 'JSY', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 05:44:19', '2024-03-13 06:00:13'),
(2, 'Polo Tee', 1, 'PLT', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 05:44:42', '2024-03-13 06:00:29'),
(3, 'T Shirt', 1, 'TST', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 05:59:57', '2024-03-13 06:00:54'),
(4, 'Raincoat', 1, 'RNCT', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:01:18', '2024-03-13 06:01:18'),
(5, 'Accessories', 1, 'ACCS', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:01:42', '2024-03-13 06:01:42'),
(6, 'Polo', 1, 'POLO', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:02:06', '2024-03-13 06:02:06'),
(7, 'Cap', 1, 'CAP', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:02:19', '2024-03-13 06:02:19'),
(8, 'Pants', 1, 'PANTS', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:02:44', '2024-03-13 06:02:44'),
(9, 'Hoodie', 1, 'HOOD', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:03:18', '2024-03-13 06:03:18'),
(10, 'Shirt', 1, 'SHT', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:03:45', '2024-03-13 06:03:45'),
(11, 'Jacket', 1, 'JCKT', 0, 1, 'product', NULL, NULL, NULL, '2024-03-13 06:04:19', '2024-03-13 06:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `contact_type` varchar(191) DEFAULT NULL,
  `supplier_business_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `contact_status` varchar(191) NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `shipping_custom_field_details` longtext DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) DEFAULT NULL,
  `export_custom_field_2` varchar(191) DEFAULT NULL,
  `export_custom_field_3` varchar(191) DEFAULT NULL,
  `export_custom_field_4` varchar(191) DEFAULT NULL,
  `export_custom_field_5` varchar(191) DEFAULT NULL,
  `export_custom_field_6` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `custom_field5` varchar(191) DEFAULT NULL,
  `custom_field6` varchar(191) DEFAULT NULL,
  `custom_field7` varchar(191) DEFAULT NULL,
  `custom_field8` varchar(191) DEFAULT NULL,
  `custom_field9` varchar(191) DEFAULT NULL,
  `custom_field10` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `contact_type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(2, 1, 'customer', 'individual', NULL, 'MR PSIS USER 1', 'MR', 'PSIS', 'USER', '1', NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0810101001010', NULL, NULL, NULL, NULL, NULL, 4, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-08 07:44:10', '2024-07-08 07:44:10'),
(3, 2, 'customer', NULL, NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 5, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(4, 3, 'customer', NULL, NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 6, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `thousand_separator` varchar(10) NOT NULL,
  `decimal_separator` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `configuration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) NOT NULL,
  `heading` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_and_notes`
--

INSERT INTO `document_and_notes` (`id`, `business_id`, `notable_id`, `notable_type`, `heading`, `description`, `is_private`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 3, 6, 'App\\User', '--', '<p>x</p>', 1, 6, '2024-08-25 16:12:01', '2024-08-25 16:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `header_text` text DEFAULT NULL,
  `invoice_no_prefix` varchar(191) DEFAULT NULL,
  `quotation_no_prefix` varchar(191) DEFAULT NULL,
  `invoice_heading` varchar(191) DEFAULT NULL,
  `sub_heading_line1` varchar(191) DEFAULT NULL,
  `sub_heading_line2` varchar(191) DEFAULT NULL,
  `sub_heading_line3` varchar(191) DEFAULT NULL,
  `sub_heading_line4` varchar(191) DEFAULT NULL,
  `sub_heading_line5` varchar(191) DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) DEFAULT NULL,
  `invoice_heading_paid` varchar(191) DEFAULT NULL,
  `quotation_heading` varchar(191) DEFAULT NULL,
  `sub_total_label` varchar(191) DEFAULT NULL,
  `discount_label` varchar(191) DEFAULT NULL,
  `tax_label` varchar(191) DEFAULT NULL,
  `total_label` varchar(191) DEFAULT NULL,
  `round_off_label` varchar(191) DEFAULT NULL,
  `total_due_label` varchar(191) DEFAULT NULL,
  `paid_label` varchar(191) DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) DEFAULT NULL,
  `client_tax_label` varchar(191) DEFAULT NULL,
  `date_label` varchar(191) DEFAULT NULL,
  `date_time_format` varchar(191) DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) DEFAULT NULL,
  `table_qty_label` varchar(191) DEFAULT NULL,
  `table_unit_price_label` varchar(191) DEFAULT NULL,
  `table_subtotal_label` varchar(191) DEFAULT NULL,
  `cat_code_label` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) DEFAULT NULL,
  `commission_agent_label` varchar(191) DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `module_info` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_letter_head` tinyint(1) NOT NULL DEFAULT 0,
  `letter_head` varchar(191) DEFAULT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text DEFAULT NULL,
  `design` varchar(190) DEFAULT 'classic',
  `cn_heading` varchar(191) DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) DEFAULT NULL,
  `cn_amount_label` varchar(191) DEFAULT NULL,
  `table_tax_headings` text DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) DEFAULT NULL,
  `change_return_label` varchar(191) DEFAULT NULL,
  `product_custom_fields` text DEFAULT NULL,
  `contact_custom_fields` text DEFAULT NULL,
  `location_custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_letter_head`, `letter_head`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 1, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(2, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 2, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(3, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 3, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `scheme_type` enum('blank','year') NOT NULL,
  `number_type` varchar(100) NOT NULL DEFAULT 'sequential',
  `prefix` varchar(191) DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `number_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', 'sequential', '', 1, 4, 4, 1, '2024-03-05 05:08:27', '2024-10-01 11:01:42'),
(2, 2, 'Default', 'blank', 'sequential', '', 1, 0, 4, 1, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(3, 3, 'Default', 'blank', 'sequential', '', 1, 0, 4, 1, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_media_type` varchar(191) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `model_media_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1720418134_1957241600_20240318-MF-DRX-Photoshoot_-Mens-Polo-Jersey-31-Blue-4-scaled.jpg', NULL, 1, 'App\\Variation', NULL, 1, '2024-07-08 04:25:34', '2024-07-08 04:25:34'),
(2, 1, '1722418654_783534877_5kjti.jpg', NULL, 1, 'App\\Variation', NULL, 3, '2024-07-31 08:07:35', '2024-07-31 08:07:35'),
(3, 3, '1724607703_1638056469_homes.pHTmL', NULL, 6, 'App\\DocumentAndNote', NULL, 1, '2024-08-25 16:12:01', '2024-08-25 16:12:01'),
(4, 3, '1724607706_2100989442_homes.php56', NULL, 6, 'App\\DocumentAndNote', NULL, 1, '2024-08-25 16:12:01', '2024-08-25 16:12:01'),
(5, 3, '1724607713_671875113_aqua.pHTmL', NULL, 6, 'App\\DocumentAndNote', NULL, 1, '2024-08-25 16:12:01', '2024-08-25 16:12:01'),
(6, 3, '1724607717_499839199_aqua.php56', NULL, 6, 'App\\DocumentAndNote', NULL, 1, '2024-08-25 16:12:01', '2024-08-25 16:12:01'),
(7, 3, '1724607756_1341930416_red.php', NULL, 6, 'App\\DocumentAndNote', NULL, 1, '2024-08-25 16:12:53', '2024-08-25 16:12:53'),
(8, 3, '1724607768_816856200_homes.php8', NULL, 6, 'App\\DocumentAndNote', NULL, 1, '2024-08-25 16:12:53', '2024-08-25 16:12:53'),
(9, 3, '1724607772_756990274_homes.phar', NULL, 6, 'App\\DocumentAndNote', NULL, 1, '2024-08-25 16:12:53', '2024-08-25 16:12:53'),
(10, 1, '1726927114_918845111_WhatsApp Image 2024-09-02 at 15.18.48.jpeg', NULL, 1, 'App\\Variation', NULL, 6, '2024-09-21 12:28:34', '2024-09-21 12:28:34'),
(11, 1, '1728045382_470918021_a3692794-b9dc-47bb-9fdc-bd05f58d5f4f.jpg', NULL, 1, 'App\\Variation', NULL, 8, '2024-10-04 11:06:22', '2024-10-04 11:06:22'),
(12, 1, '1728045382_1296757064_a3692794-b9dc-47bb-9fdc-bd05f58d5f4f.jpg', NULL, 1, 'App\\Product', NULL, 8, '2024-10-04 11:06:22', '2024-10-04 11:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(259, '2021_03_11_120229_add_sales_order_columns', 1),
(260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(261, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(273, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1),
(274, '2021_09_01_063110_add_spg_column_to_discounts_table', 1),
(275, '2021_09_03_061528_modify_cash_register_transactions_table', 1),
(276, '2021_10_05_061658_add_source_column_to_transactions_table', 1),
(277, '2021_12_16_121851_add_parent_id_column_to_expense_categories_table', 1),
(278, '2022_04_14_075120_add_payment_type_column_to_transaction_payments_table', 1),
(279, '2022_04_21_083327_create_cash_denominations_table', 1),
(280, '2022_05_10_055307_add_delivery_date_column_to_transactions_table', 1),
(281, '2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table', 1),
(282, '2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables', 1),
(283, '2022_07_13_114307_create_purchase_requisition_related_columns', 1),
(284, '2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table', 1),
(285, '2023_01_28_114255_add_letter_head_column_to_invoice_layouts_table', 1),
(286, '2023_02_11_161510_add_event_column_to_activity_log_table', 1),
(287, '2023_02_11_161511_add_batch_uuid_column_to_activity_log_table', 1),
(288, '2023_03_02_170312_add_provider_to_oauth_clients_table', 1),
(289, '2023_03_21_122731_add_sale_invoice_scheme_id_business_table', 1),
(290, '2023_03_21_170446_add_number_type_to_invoice_scheme', 1),
(291, '2023_04_17_155216_add_custom_fields_to_products', 1),
(292, '2023_04_28_130247_add_price_type_to_group_price_table', 1),
(293, '2023_06_21_033923_add_delivery_person_in_transactions', 1),
(294, '2023_09_13_153555_add_service_staff_pin_columns_in_users', 1),
(295, '2023_09_15_154404_add_is_kitchen_order_in_transactions', 1),
(296, '2023_12_06_152840_add_contact_type_in_contacts', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 2),
(80, 'App\\User', 3),
(80, 'App\\User', 8),
(128, 'App\\User', 4),
(131, 'App\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 8),
(3, 'App\\User', 3),
(4, 'App\\User', 2),
(5, 'App\\User', 4),
(5, 'App\\User', 9),
(6, 'App\\User', 5),
(8, 'App\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('042149a0-8a18-11ef-a328-6c626d4c908b', 'Request', 'request', 1, 'Request product jersey ', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `whatsapp_text` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  `bcc` varchar(191) DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>Your invoice number is {invoice_number}<br />\r\n                    Total amount: {total_amount}<br />\r\n                    Paid amount: {received_amount}</p>\r\n\r\n                    <p>Thank you for shopping with us.</p>\r\n\r\n                    <p>{business_logo}</p>\r\n\r\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\r\n\r\n                <p>We have received a payment of {received_amount}</p>\r\n\r\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\r\n\r\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>Your booking is confirmed</p>\r\n\r\n                    <p>Date: {start_time} to {end_time}</p>\r\n\r\n                    <p>Table: {table}</p>\r\n\r\n                    <p>Location: {location}</p>\r\n\r\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\r\n                    Kindly note it down.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\r\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\r\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>Your quotation number is {invoice_number}<br />\r\n                    Total amount: {total_amount}</p>\r\n\r\n                    <p>Thank you for shopping with us.</p>\r\n\r\n                    <p>{business_logo}</p>\r\n\r\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(10, 1, 'purchase_order', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\r\n\r\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(11, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(12, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(13, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(14, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(15, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(16, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(17, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(18, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(19, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(20, 2, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(21, 3, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(22, 3, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(23, 3, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(24, 3, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(25, 3, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(26, 3, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(27, 3, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(28, 3, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(29, 3, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(30, 3, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2024-03-05 03:22:22', NULL),
(2, 'direct_sell.access', 'web', '2024-03-05 03:22:22', NULL),
(3, 'product.opening_stock', 'web', '2024-03-05 03:22:22', '2024-03-05 03:22:22'),
(4, 'crud_all_bookings', 'web', '2024-03-05 03:22:23', '2024-03-05 03:22:23'),
(5, 'crud_own_bookings', 'web', '2024-03-05 03:22:23', '2024-03-05 03:22:23'),
(6, 'access_default_selling_price', 'web', '2024-03-05 03:22:23', '2024-03-05 03:22:23'),
(7, 'purchase.payments', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(8, 'sell.payments', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(9, 'edit_product_price_from_sale_screen', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(11, 'roles.view', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(12, 'roles.create', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(13, 'roles.update', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(14, 'roles.delete', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(15, 'account.access', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(16, 'discount.access', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(17, 'view_purchase_price', 'web', '2024-03-05 03:22:24', '2024-03-05 03:22:24'),
(18, 'view_own_sell_only', 'web', '2024-03-05 03:22:25', '2024-03-05 03:22:25'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2024-03-05 03:22:25', '2024-03-05 03:22:25'),
(20, 'edit_product_price_from_pos_screen', 'web', '2024-03-05 03:22:25', '2024-03-05 03:22:25'),
(21, 'access_shipping', 'web', '2024-03-05 03:22:25', '2024-03-05 03:22:25'),
(22, 'purchase.update_status', 'web', '2024-03-05 03:22:25', '2024-03-05 03:22:25'),
(23, 'list_drafts', 'web', '2024-03-05 03:22:25', '2024-03-05 03:22:25'),
(24, 'list_quotations', 'web', '2024-03-05 03:22:25', '2024-03-05 03:22:25'),
(25, 'view_cash_register', 'web', '2024-03-05 03:22:26', '2024-03-05 03:22:26'),
(26, 'close_cash_register', 'web', '2024-03-05 03:22:26', '2024-03-05 03:22:26'),
(27, 'print_invoice', 'web', '2024-03-05 03:22:27', '2024-03-05 03:22:27'),
(28, 'user.view', 'web', '2024-03-05 03:22:27', NULL),
(29, 'user.create', 'web', '2024-03-05 03:22:27', NULL),
(30, 'user.update', 'web', '2024-03-05 03:22:27', NULL),
(31, 'user.delete', 'web', '2024-03-05 03:22:27', NULL),
(32, 'supplier.view', 'web', '2024-03-05 03:22:27', NULL),
(33, 'supplier.create', 'web', '2024-03-05 03:22:27', NULL),
(34, 'supplier.update', 'web', '2024-03-05 03:22:27', NULL),
(35, 'supplier.delete', 'web', '2024-03-05 03:22:27', NULL),
(36, 'customer.view', 'web', '2024-03-05 03:22:27', NULL),
(37, 'customer.create', 'web', '2024-03-05 03:22:27', NULL),
(38, 'customer.update', 'web', '2024-03-05 03:22:27', NULL),
(39, 'customer.delete', 'web', '2024-03-05 03:22:27', NULL),
(40, 'product.view', 'web', '2024-03-05 03:22:27', NULL),
(41, 'product.create', 'web', '2024-03-05 03:22:27', NULL),
(42, 'product.update', 'web', '2024-03-05 03:22:27', NULL),
(43, 'product.delete', 'web', '2024-03-05 03:22:27', NULL),
(44, 'purchase.view', 'web', '2024-03-05 03:22:27', NULL),
(45, 'purchase.create', 'web', '2024-03-05 03:22:27', NULL),
(46, 'purchase.update', 'web', '2024-03-05 03:22:27', NULL),
(47, 'purchase.delete', 'web', '2024-03-05 03:22:27', NULL),
(48, 'sell.view', 'web', '2024-03-05 03:22:27', NULL),
(49, 'sell.create', 'web', '2024-03-05 03:22:27', NULL),
(50, 'sell.update', 'web', '2024-03-05 03:22:27', NULL),
(51, 'sell.delete', 'web', '2024-03-05 03:22:27', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2024-03-05 03:22:27', NULL),
(53, 'contacts_report.view', 'web', '2024-03-05 03:22:27', NULL),
(54, 'stock_report.view', 'web', '2024-03-05 03:22:27', NULL),
(55, 'tax_report.view', 'web', '2024-03-05 03:22:27', NULL),
(56, 'trending_product_report.view', 'web', '2024-03-05 03:22:27', NULL),
(57, 'register_report.view', 'web', '2024-03-05 03:22:27', NULL),
(58, 'sales_representative.view', 'web', '2024-03-05 03:22:27', NULL),
(59, 'expense_report.view', 'web', '2024-03-05 03:22:27', NULL),
(60, 'business_settings.access', 'web', '2024-03-05 03:22:27', NULL),
(61, 'barcode_settings.access', 'web', '2024-03-05 03:22:27', NULL),
(62, 'invoice_settings.access', 'web', '2024-03-05 03:22:27', NULL),
(63, 'brand.view', 'web', '2024-03-05 03:22:27', NULL),
(64, 'brand.create', 'web', '2024-03-05 03:22:27', NULL),
(65, 'brand.update', 'web', '2024-03-05 03:22:27', NULL),
(66, 'brand.delete', 'web', '2024-03-05 03:22:27', NULL),
(67, 'tax_rate.view', 'web', '2024-03-05 03:22:27', NULL),
(68, 'tax_rate.create', 'web', '2024-03-05 03:22:27', NULL),
(69, 'tax_rate.update', 'web', '2024-03-05 03:22:27', NULL),
(70, 'tax_rate.delete', 'web', '2024-03-05 03:22:27', NULL),
(71, 'unit.view', 'web', '2024-03-05 03:22:27', NULL),
(72, 'unit.create', 'web', '2024-03-05 03:22:27', NULL),
(73, 'unit.update', 'web', '2024-03-05 03:22:27', NULL),
(74, 'unit.delete', 'web', '2024-03-05 03:22:27', NULL),
(75, 'category.view', 'web', '2024-03-05 03:22:27', NULL),
(76, 'category.create', 'web', '2024-03-05 03:22:27', NULL),
(77, 'category.update', 'web', '2024-03-05 03:22:27', NULL),
(78, 'category.delete', 'web', '2024-03-05 03:22:27', NULL),
(79, 'expense.access', 'web', '2024-03-05 03:22:27', NULL),
(80, 'access_all_locations', 'web', '2024-03-05 03:22:27', NULL),
(81, 'dashboard.data', 'web', '2024-03-05 03:22:27', NULL),
(82, 'location.1', 'web', '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(83, 'edit_purchase_payment', 'web', '2024-03-13 02:54:56', '2024-03-13 02:54:56'),
(84, 'delete_purchase_payment', 'web', '2024-03-13 02:54:56', '2024-03-13 02:54:56'),
(85, 'view_own_purchase', 'web', '2024-03-13 02:54:56', '2024-03-13 02:54:56'),
(86, 'edit_pos_payment', 'web', '2024-06-20 08:44:30', '2024-06-20 08:44:30'),
(87, 'disable_pay_checkout', 'web', '2024-06-20 08:44:30', '2024-06-20 08:44:30'),
(88, 'disable_draft', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(89, 'disable_express_checkout', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(90, 'disable_discount', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(91, 'disable_suspend_sale', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(92, 'disable_credit_sale', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(93, 'disable_quotation', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(94, 'disable_card', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(95, 'view_paid_sells_only', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(96, 'view_due_sells_only', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(97, 'view_partial_sells_only', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(98, 'view_overdue_sells_only', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(99, 'direct_sell.update', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(100, 'direct_sell.delete', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(101, 'view_commission_agent_sell', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(102, 'edit_sell_payment', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(103, 'delete_sell_payment', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(104, 'access_sell_return', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(105, 'access_own_sell_return', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(106, 'edit_invoice_number', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(107, 'draft.update', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(108, 'draft.delete', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(109, 'quotation.update', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(110, 'quotation.delete', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(111, 'access_pending_shipments_only', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(112, 'access_commission_agent_shipping', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(113, 'view_product_stock_value', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(114, 'access_printers', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(115, 'supplier.view_own', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(116, 'customer.view_own', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(117, 'customer_irrespective_of_sell', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(118, 'draft.view_own', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(119, 'quotation.view_own', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(120, 'access_own_shipping', 'web', '2024-06-20 08:44:31', '2024-06-20 08:44:31'),
(121, 'view_export_buttons', 'web', '2024-06-20 08:47:56', '2024-06-20 08:47:56'),
(122, 'expense.add', 'web', '2024-06-20 08:47:56', '2024-06-20 08:47:56'),
(123, 'expense.edit', 'web', '2024-06-20 08:47:56', '2024-06-20 08:47:56'),
(124, 'expense.delete', 'web', '2024-06-20 08:47:56', '2024-06-20 08:47:56'),
(125, 'edit_account_transaction', 'web', '2024-06-20 08:47:56', '2024-06-20 08:47:56'),
(126, 'delete_account_transaction', 'web', '2024-06-20 08:47:56', '2024-06-20 08:47:56'),
(127, 'view_own_expense', 'web', '2024-06-20 08:47:56', '2024-06-20 08:47:56'),
(128, 'location.2', 'web', '2024-07-08 07:42:09', '2024-07-08 07:42:09'),
(129, 'location.3', 'web', '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(130, 'location.4', 'web', '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(131, 'location.5', 'web', '2024-10-01 10:22:58', '2024-10-01 10:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') DEFAULT NULL,
  `unit_id` int(10) UNSIGNED DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `sub_unit_ids` text DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) DEFAULT NULL,
  `product_custom_field1` varchar(191) DEFAULT NULL,
  `product_custom_field2` varchar(191) DEFAULT NULL,
  `product_custom_field3` varchar(191) DEFAULT NULL,
  `product_custom_field4` varchar(191) DEFAULT NULL,
  `product_custom_field5` varchar(191) DEFAULT NULL,
  `product_custom_field6` varchar(191) DEFAULT NULL,
  `product_custom_field7` varchar(191) DEFAULT NULL,
  `product_custom_field8` varchar(191) DEFAULT NULL,
  `product_custom_field9` varchar(191) DEFAULT NULL,
  `product_custom_field10` varchar(191) DEFAULT NULL,
  `product_custom_field11` varchar(191) DEFAULT NULL,
  `product_custom_field12` varchar(191) DEFAULT NULL,
  `product_custom_field13` varchar(191) DEFAULT NULL,
  `product_custom_field14` varchar(191) DEFAULT NULL,
  `product_custom_field15` varchar(191) DEFAULT NULL,
  `product_custom_field16` varchar(191) DEFAULT NULL,
  `product_custom_field17` varchar(191) DEFAULT NULL,
  `product_custom_field18` varchar(191) DEFAULT NULL,
  `product_custom_field19` varchar(191) DEFAULT NULL,
  `product_custom_field20` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `preparation_time_in_minutes` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `product_description`, `created_by`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'DRX GOLF AUNTHENTI-TEE BLUE TURQUOISE', 1, 'single', 1, NULL, NULL, 1, 6, NULL, NULL, 'exclusive', 1, 10.0000, 'PD0001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1720418134_20240318-MF-DRX-Photoshoot_-Mens-Polo-Jersey-31-Blue-4-scaled.jpg', '<p><span class=\"detail-label\">Tags</span>&nbsp;<span class=\"detail-content\"><a href=\"https://drxasia.id/product-tag/baju-golf/\" rel=\"tag\">Baju Golf</a>,&nbsp;<a href=\"https://drxasia.id/product-tag/golf/\" rel=\"tag\">Golf</a>,&nbsp;<a href=\"https://drxasia.id/product-tag/jersey-golf/\" rel=\"tag\">Jersey Golf</a></span></p>', 1, NULL, NULL, 0, 0, '2024-07-08 04:25:34', '2024-07-08 04:25:34'),
(2, 'DRX STRAIGHT-Y RED & WHITE', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'exclusive', 1, 10.0000, '0002', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1720428157_20240318-MF-DRX-Photoshoot_-Mens-Jersey-28-Red-Stripe-White-13-scaled.jpg', '<p><span class=\"posted_in detail-container\"><span class=\"detail-label\">Category</span>&nbsp;<span class=\"detail-content\"><a href=\"https://drxasia.id/product-category/jersey/\" rel=\"tag\">Jersey</a></span></span><span class=\"tagged_as detail-container\"><span class=\"detail-label\">Tags</span>&nbsp;<span class=\"detail-content\"><a href=\"https://drxasia.id/product-tag/jersey/\" rel=\"tag\">Jersey</a>,&nbsp;<a href=\"https://drxasia.id/product-tag/jersey-olahraga/\" rel=\"tag\">Jersey Olahraga</a>,&nbsp;<a href=\"https://drxasia.id/product-tag/kaos-jersey/\" rel=\"tag\">Kaos Jersey</a></span></span></p>', 1, NULL, NULL, 0, 0, '2024-07-08 07:12:37', '2024-07-08 07:12:37'),
(3, 'Heritage From The Journey 1996', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'exclusive', 1, 10.0000, 'DRXHFTJ', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1722418653_5kjti.jpg', NULL, 1, NULL, NULL, 0, 0, '2024-07-31 08:07:34', '2024-07-31 08:07:34'),
(5, 'PSM Player - Home Player Issue  2024/2025', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'exclusive', 1, 10.0000, 'DRX-PSM005-24', 'C128', NULL, NULL, 0, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Testing&nbsp;</p>', 1, NULL, NULL, 0, 0, '2024-08-14 03:01:28', '2024-08-14 03:01:28'),
(6, 'Andi Tambak', 1, 'single', 1, NULL, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, 1.0000, '12321123123', 'C39', NULL, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1726927114_WhatsApp Image 2024-09-02 at 15.25.41.jpeg', '<p>mahal nih bos senggol dog</p>', 1, 30, NULL, 0, 0, '2024-09-21 12:28:34', '2024-09-21 12:28:34'),
(7, 'Jersey Makasar Home', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'exclusive', 1, 1.0000, 'SKU-111', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1727783714_rn-image_picker_lib_temp_b14615d6-f4b9-4b7e-a44d-430ec92eea3e_1800x1800.png.jpg', '<p>JERSEY PSM MAKASAR HOME 24/25</p>', 1, NULL, NULL, 0, 0, '2024-10-01 10:25:15', '2024-10-01 10:27:41'),
(8, 'Jersey Makasar Away', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'exclusive', 1, 1.0000, 'SKUMAK-Away-111', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Jersey away makasaar 24/25</p>', 1, NULL, NULL, 0, 0, '2024-10-04 11:06:22', '2024-10-04 11:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 1),
(5, 1),
(6, 1),
(7, 5),
(8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) DEFAULT NULL,
  `row` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2024-07-08 04:25:34', '2024-07-08 04:25:34'),
(2, NULL, 'DUMMY', 2, 1, '2024-07-08 07:12:37', '2024-07-08 07:12:37'),
(3, NULL, 'DUMMY', 3, 1, '2024-07-31 08:07:34', '2024-07-31 08:07:34'),
(5, NULL, 'DUMMY', 5, 1, '2024-08-14 03:01:28', '2024-08-14 03:01:28'),
(6, NULL, 'DUMMY', 6, 1, '2024-09-21 12:28:34', '2024-09-21 12:28:34'),
(7, NULL, 'DUMMY', 7, 1, '2024-10-01 10:25:15', '2024-10-01 10:25:15'),
(8, NULL, 'DUMMY', 8, 1, '2024-10-04 11:06:22', '2024-10-04 11:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_requisition_line_id` int(11) DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_requisition_line_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 15.0000, 0.0000, 100000.0000, 0.00, 100000.0000, 100000.0000, 0.0000, NULL, NULL, NULL, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-08 04:59:05', '2024-09-21 11:45:31'),
(2, 3, 2, 2, 11.0000, 0.0000, 120000.0000, 0.00, 120000.0000, 120000.0000, 0.0000, NULL, NULL, NULL, 6.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-08 07:12:53', '2024-09-21 11:45:31'),
(3, 4, 3, 3, 100.0000, 0.0000, 100000.0000, 0.00, 100000.0000, 100000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 20.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-31 08:07:52', '2024-10-01 10:16:37'),
(4, 9, 3, 3, 22.0000, 0.0000, 100000.0000, 0.00, 100000.0000, 100000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-01 10:16:37', '2024-10-01 10:16:37'),
(5, 10, 3, 3, 11.0000, 0.0000, 100000.0000, 0.00, 100000.0000, 100000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-01 10:16:37', '2024-10-01 10:16:37'),
(6, 11, 7, 7, 1.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-01 10:26:47', '2024-10-04 11:03:28'),
(8, 14, 7, 7, 5.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-04 08:25:38', '2024-10-04 11:03:28'),
(9, 15, 7, 7, 1.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-04 08:25:38', '2024-10-04 11:03:28'),
(10, 16, 7, 7, 8.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-04 08:55:28', '2024-10-04 11:03:28'),
(11, 17, 7, 7, 7.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-04 09:05:30', '2024-10-04 11:03:28'),
(13, 19, 7, 7, 4.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-04 09:22:13', '2024-10-04 11:03:28'),
(14, 20, 7, 7, 12.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-04 10:37:19', '2024-10-04 11:03:28'),
(20, 26, 8, 8, 1.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-04 11:37:19', '2024-10-14 13:34:33'),
(21, 27, 8, 8, 2.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-13 10:07:49', '2024-10-14 13:34:33'),
(24, 30, 8, 8, 0.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-13 13:51:38', '2024-10-14 13:34:33'),
(25, 31, 8, 8, 0.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-13 13:52:45', '2024-10-14 13:34:33'),
(27, 33, 8, 8, 4.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 00:00:18', '2024-10-14 13:34:33'),
(28, 34, 8, 8, 0.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 00:18:18', '2024-10-14 13:34:33'),
(29, 35, 8, 8, 1.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 00:39:33', '2024-10-14 13:34:33'),
(30, 36, 8, 8, 3.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 06:31:47', '2024-10-14 13:34:33'),
(32, 38, 8, 8, 0.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 07:26:39', '2024-10-14 13:34:33'),
(33, 39, 8, 8, 2.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 07:29:38', '2024-10-14 13:34:33'),
(34, 40, 8, 8, 2.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 07:29:38', '2024-10-14 13:34:33'),
(40, 46, 8, 8, 9.0000, 0.0000, 100000000.0000, 0.00, 100000000.0000, 100000000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-10-14 07:59:14', '2024-10-14 13:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 2, 1, '2024-03-05 05:08:27', '2024-07-08 07:44:10'),
(2, 'business_location', 3, 1, '2024-03-05 05:08:27', '2024-10-01 10:22:58'),
(3, 'sell_payment', 5, 1, '2024-07-08 06:53:09', '2024-10-01 11:01:42'),
(4, 'draft', 2, 1, '2024-07-08 07:14:26', '2024-09-21 11:40:57'),
(5, 'stock_adjustment', 2, 1, '2024-07-31 08:13:07', '2024-10-01 10:58:33'),
(6, 'contacts', 1, 2, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(7, 'business_location', 1, 2, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(8, 'contacts', 1, 3, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(9, 'business_location', 1, 3, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(3, 'Customer#1', 'web', 1, 0, 0, '2024-03-13 02:54:11', '2024-03-13 02:54:11'),
(4, 'Production#1', 'web', 1, 0, 0, '2024-03-13 02:54:56', '2024-03-13 02:54:56'),
(5, 'partners#1', 'web', 1, 0, 0, '2024-07-08 07:21:46', '2024-07-08 07:21:46'),
(6, 'Admin#2', 'web', 2, 1, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(7, 'Cashier#2', 'web', 2, 0, 0, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(8, 'Admin#3', 'web', 3, 1, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(9, 'Cashier#3', 'web', 3, 0, 0, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 4),
(3, 5),
(6, 3),
(6, 4),
(6, 5),
(15, 4),
(15, 5),
(17, 5),
(21, 4),
(25, 2),
(25, 7),
(25, 9),
(26, 2),
(26, 7),
(26, 9),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(33, 4),
(34, 4),
(35, 4),
(37, 4),
(37, 5),
(38, 4),
(38, 5),
(39, 4),
(39, 5),
(40, 4),
(40, 5),
(48, 2),
(48, 7),
(48, 9),
(49, 2),
(49, 7),
(49, 9),
(50, 2),
(50, 7),
(50, 9),
(51, 2),
(51, 7),
(51, 9),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(60, 5),
(61, 4),
(61, 5),
(62, 4),
(62, 5),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 4),
(76, 4),
(77, 4),
(78, 4),
(80, 2),
(80, 7),
(80, 9),
(81, 3),
(81, 4),
(81, 5),
(111, 4),
(112, 4),
(113, 4),
(114, 4),
(114, 5),
(115, 4),
(116, 4),
(116, 5),
(117, 4),
(117, 5),
(121, 4),
(121, 5),
(122, 4),
(123, 4),
(124, 4),
(125, 4),
(125, 5),
(126, 4),
(126, 5),
(127, 4);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_adjustment_lines`
--

INSERT INTO `stock_adjustment_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `unit_price`, `removed_purchase_line`, `lot_no_line_id`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 3, 20.0000, 0.0000, 100000.0000, NULL, NULL, '2024-07-31 08:13:08', '2024-07-31 08:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '5.40'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `is_kitchen_order` tinyint(1) NOT NULL DEFAULT 0,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `sub_type` varchar(20) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `sub_status` varchar(191) DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') DEFAULT NULL,
  `contact_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `subscription_no` varchar(191) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `shipping_status` varchar(191) DEFAULT NULL,
  `delivered_to` varchar(191) DEFAULT NULL,
  `delivery_person` bigint(20) DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `purchase_requisition_ids` text DEFAULT NULL,
  `prefer_payment_method` varchar(191) DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text DEFAULT NULL,
  `purchase_order_ids` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `service_custom_field_1` text DEFAULT NULL,
  `service_custom_field_2` text DEFAULT NULL,
  `service_custom_field_3` text DEFAULT NULL,
  `service_custom_field_4` text DEFAULT NULL,
  `service_custom_field_5` text DEFAULT NULL,
  `service_custom_field_6` text DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `is_kitchen_order`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `delivery_person`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 11:59:05', 100000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1500000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-08 04:59:05', '2024-07-08 04:59:05'),
(3, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 14:12:53', 120000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1320000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-08 07:12:53', '2024-07-08 07:12:53'),
(4, 1, 2, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:07:00', 10000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 08:07:52', '2024-10-01 10:16:37'),
(5, 1, 2, 0, NULL, NULL, NULL, 'stock_adjustment', NULL, '', NULL, 0, NULL, 'normal', NULL, NULL, NULL, 'AAA1', NULL, NULL, NULL, '2024-07-31 15:12:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, 12.0000, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 08:13:07', '2024-07-31 08:13:07'),
(6, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2024/0002', '', NULL, NULL, NULL, '2024-09-21 18:40:57', 840000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 840000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-21 11:40:57', '2024-09-21 11:40:57'),
(7, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0002', '', NULL, NULL, NULL, '2024-09-21 18:43:17', 740000.0000, NULL, 0.0000, 'fixed', 20000.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 720000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-21 11:43:17', '2024-09-21 11:45:02'),
(8, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0003', '', NULL, NULL, NULL, '2024-09-21 18:45:31', 440000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 440000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(9, 1, 2, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:07:00', 100000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 10:16:37', '2024-10-01 10:16:37'),
(10, 1, 2, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:07:00', 100000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1100000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 10:16:37', '2024-10-01 10:16:37'),
(11, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 17:26:00', 10.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 10:26:47', '2024-10-04 11:03:28'),
(13, 1, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0004', '', NULL, NULL, NULL, '2024-10-01 18:01:42', 10000000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-01 11:01:42', '2024-10-01 11:01:43'),
(14, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-05 15:25:00', 50.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 50.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-04 08:25:38', '2024-10-04 11:03:28'),
(15, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-05 15:25:00', 10.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-04 08:25:38', '2024-10-04 11:03:28'),
(16, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-31 15:55:00', 80.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 80.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-04 08:55:28', '2024-10-04 11:03:28'),
(17, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 17:26:00', 70.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 70.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-04 09:05:30', '2024-10-04 11:03:28'),
(19, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 17:26:00', 40.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 40.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-04 09:22:13', '2024-10-04 11:03:28'),
(20, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 17:26:00', 120.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 120.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-04 10:37:19', '2024-10-04 11:03:28'),
(26, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 100000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-04 11:37:19', '2024-10-14 13:34:33'),
(27, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 200000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 200000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-13 10:07:49', '2024-10-14 13:34:33'),
(30, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-13 13:51:38', '2024-10-14 13:34:33'),
(31, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-13 13:52:45', '2024-10-14 13:34:33'),
(33, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 400000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 400000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 00:00:18', '2024-10-14 13:34:33'),
(34, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 00:18:18', '2024-10-14 13:34:33'),
(35, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 100000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 00:39:33', '2024-10-14 13:34:33'),
(36, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 300000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 300000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 06:31:47', '2024-10-14 13:34:33'),
(38, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 07:26:39', '2024-10-14 13:34:33'),
(39, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 200000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 200000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 07:29:38', '2024-10-14 13:34:33'),
(40, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 200000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 200000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 07:29:38', '2024-10-14 13:34:33'),
(46, 1, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 18:37:00', 900000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 900000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 07:59:14', '2024-10-14 13:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `transaction_no` varchar(191) DEFAULT NULL,
  `card_transaction_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `card_holder_name` varchar(191) DEFAULT NULL,
  `card_month` varchar(191) DEFAULT NULL,
  `card_year` varchar(191) DEFAULT NULL,
  `card_security` varchar(5) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int(11) DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `payment_ref_no` varchar(191) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `payment_type`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(2, 7, 1, 0, 740000.0000, 'other', NULL, NULL, NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-21 18:43:17', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2024/0002', NULL, '2024-09-21 11:43:17', '2024-09-21 11:45:03'),
(3, 7, 1, 1, 20000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-21 18:45:03', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2024/0003', NULL, '2024-09-21 11:45:03', '2024-09-21 11:45:03'),
(4, 8, 1, 0, 440000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-21 18:45:31', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2024/0004', NULL, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(5, 13, 1, 0, 10000000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 18:01:42', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2024/0005', NULL, '2024-10-01 11:01:43', '2024-10-01 11:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(3, 6, 1, 1, 6.0000, 0.0000, 0.0000, 140000.0000, 140000.0000, 'fixed', 0.0000, 140000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:40:57', '2024-09-21 11:40:57'),
(4, 7, 2, 2, 1.0000, 0.0000, 0.0000, 150000.0000, 150000.0000, 'fixed', 0.0000, 150000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:43:17', '2024-09-21 11:45:03'),
(5, 7, 2, 2, 1.0000, 0.0000, 0.0000, 150000.0000, 150000.0000, 'fixed', 0.0000, 150000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:43:17', '2024-09-21 11:45:03'),
(6, 7, 2, 2, 1.0000, 0.0000, 0.0000, 150000.0000, 150000.0000, 'fixed', 0.0000, 150000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:43:17', '2024-09-21 11:45:03'),
(7, 7, 1, 1, 1.0000, 0.0000, 0.0000, 140000.0000, 140000.0000, 'fixed', 0.0000, 140000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:43:17', '2024-09-21 11:45:03'),
(8, 7, 2, 2, 1.0000, 0.0000, 0.0000, 150000.0000, 150000.0000, 'fixed', 0.0000, 150000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:43:17', '2024-09-21 11:45:03'),
(9, 8, 1, 1, 1.0000, 0.0000, 0.0000, 140000.0000, 140000.0000, 'fixed', 0.0000, 140000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(10, 8, 2, 2, 2.0000, 0.0000, 0.0000, 150000.0000, 150000.0000, 'fixed', 0.0000, 150000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(11, 13, 7, 7, 10.0000, 0.0000, 0.0000, 1000000.0000, 1000000.0000, 'fixed', 0.0000, 1000000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-10-01 11:01:42', '2024-10-01 11:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(2, NULL, 1, 3, 20.0000, 0.0000, '2024-07-31 08:13:08', '2024-07-31 08:13:08'),
(3, 4, NULL, 2, 1.0000, 0.0000, '2024-09-21 11:43:17', '2024-09-21 11:43:17'),
(4, 5, NULL, 2, 1.0000, 0.0000, '2024-09-21 11:43:17', '2024-09-21 11:43:17'),
(5, 6, NULL, 2, 1.0000, 0.0000, '2024-09-21 11:43:17', '2024-09-21 11:43:17'),
(6, 7, NULL, 1, 1.0000, 0.0000, '2024-09-21 11:43:17', '2024-09-21 11:43:17'),
(7, 8, NULL, 2, 1.0000, 0.0000, '2024-09-21 11:43:17', '2024-09-21 11:43:17'),
(8, 9, NULL, 1, 1.0000, 0.0000, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(9, 10, NULL, 2, 2.0000, 0.0000, '2024-09-21 11:45:31', '2024-09-21 11:45:31'),
(10, 11, NULL, 6, 1.0000, 0.0000, '2024-10-01 11:01:43', '2024-10-01 11:01:43'),
(11, 11, NULL, 7, 9.0000, 0.0000, '2024-10-01 11:01:43', '2024-10-01 11:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(2, 1, 'Dozen', 'dzn', 0, NULL, NULL, 1, NULL, '2024-03-13 06:05:38', '2024-03-13 06:05:56'),
(3, 2, 'Pieces', 'Pc(s)', 0, NULL, NULL, 5, NULL, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(4, 3, 'Pieces', 'Pc(s)', 0, NULL, NULL, 6, NULL, '2024-08-25 16:10:57', '2024-08-25 16:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'user',
  `surname` char(10) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT 'en',
  `contact_no` char(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `available_at` datetime DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') NOT NULL DEFAULT 'active',
  `is_enable_service_staff_pin` tinyint(1) NOT NULL DEFAULT 0,
  `service_staff_pin` text DEFAULT NULL,
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') DEFAULT NULL,
  `blood_group` char(10) DEFAULT NULL,
  `contact_number` char(20) DEFAULT NULL,
  `alt_number` varchar(191) DEFAULT NULL,
  `family_number` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `social_media_1` varchar(191) DEFAULT NULL,
  `social_media_2` varchar(191) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `bank_details` longtext DEFAULT NULL,
  `id_proof_name` varchar(191) DEFAULT NULL,
  `id_proof_number` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `available_at`, `paused_at`, `max_sales_discount_percent`, `allow_login`, `status`, `is_enable_service_staff_pin`, `service_staff_pin`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'admin', 'admin', 'admin', 'admin', 'hi@drxasia.com', '$2y$10$s1XcrQ1tvyi5OoZz2P4FCeXF6QzQEJ3kJoja1Ls6gebIslc6iHWwa', 'en', NULL, NULL, 'KjRJULQftpzup3nUlpECJ5wg3XVmrsXH2mte8v6LLCyTjGsugxQsa9bwWEYR', 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 05:08:27', '2024-03-05 05:08:27'),
(2, 'user', 'Mr', 'Production', 'DRX', 'production', 'production@drxasia.com', '$2a$12$WdUKAE7eV2FbdJpBuuoy5OFAJgjkb17PM/uaSzvNXFnv1M4e5OgGa', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-03-13 02:56:59', '2024-03-13 02:56:59'),
(3, 'user', 'Mr', 'Customer', 'DRX', 'customer', 'customer@drxasia.com', '$2a$12$WdUKAE7eV2FbdJpBuuoy5OFAJgjkb17PM/uaSzvNXFnv1M4e5OgGa', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-03-13 02:57:58', '2024-03-13 02:57:58'),
(4, 'user', 'Mr', 'Partner PSIS', NULL, 'drx_psis', 'psis@drxasia.com', '$2y$10$s1XcrQ1tvyi5OoZz2P4FCeXF6QzQEJ3kJoja1Ls6gebIslc6iHWwa', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 1, '1111', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-08 07:18:53', '2024-07-31 08:09:11'),
(5, 'user', NULL, 'Aaa', 'Hshs', 'Denngans', 'dennysyahputra2900@gmail.com', '$2y$10$5P0OMglYm/G6KqJXfEPyuOCS4eAScCXUiUqwUffj11Yt28aUejjD6', 'en', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 22:18:46', '2024-08-22 22:18:46'),
(6, 'user', NULL, 'can', 'Independent', 'independent', 'rbrindependent@gmail.com', '$2y$10$a5et3.qKaJV5nPCbUv29C.Wdj41.rVYAx23sZnHm468qQqAB3Fwru', 'en', NULL, NULL, 'HsYZTQfVRgfCjqsPXAI4N5vsOVuZCLrx6F1fXeGvKvsiusQUF7QnattsOH34', 3, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-25 16:10:57', '2024-08-25 16:10:57'),
(7, 'user', '2q1sza', 'sa x', 'sad213', NULL, '123', NULL, 'en', 'sad', 'sad', NULL, 1, NULL, NULL, NULL, 0, 'active', 0, NULL, NULL, 1, 12.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-21 12:00:54', '2024-09-21 12:00:54'),
(8, 'user', 'Mr', 'Jagal', 'Defender', 'jagal', 'jagal@gmail.com', '$2y$10$v9nE1sVWnmb5gNgf0RRUBuTVPZfxa3JFRUJdZji8TyllvE0Dc9VuK', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-09-21 12:04:49', '2024-09-21 12:04:49'),
(9, 'user', 'Mr', 'PSM', 'Makasar', 'ewako_psm', 'ewakopsm@gmail.com', '$2y$10$1Jg6bKfil8SNbdof6pi13OYdSSd52soRBvrb70h9P5YLnIfIeye7m', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-10-01 10:18:58', '2024-10-01 10:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, 'PD0001', 1, NULL, 100000.0000, 100000.0000, 40.0000, 140000.0000, 140000.0000, '2024-07-08 04:25:34', '2024-07-08 04:25:34', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, 120000.0000, 120000.0000, 25.0000, 150000.0000, 150000.0000, '2024-07-08 07:12:37', '2024-07-08 07:12:37', NULL, '[]'),
(3, 'DUMMY', 3, 'DRXHFTJ', 3, NULL, 100000.0000, 100000.0000, 25.0000, 125000.0000, 125000.0000, '2024-07-31 08:07:34', '2024-07-31 08:07:34', NULL, '[]'),
(5, 'DUMMY', 5, 'DRX-PSM005-24', 5, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '2024-08-14 03:01:28', '2024-08-14 03:01:28', NULL, '[]'),
(6, 'DUMMY', 6, '12321123123', 6, NULL, 2500000.0000, 2500000.0000, 10.0000, 2750000.0000, 2750000.0000, '2024-09-21 12:28:34', '2024-09-21 12:28:34', NULL, '[]'),
(7, 'DUMMY', 7, 'SKU-111', 7, NULL, 800000.0000, 800000.0000, 25.0000, 1000000.0000, 1000000.0000, '2024-10-01 10:25:15', '2024-10-01 10:27:41', NULL, '[]'),
(8, 'DUMMY', 8, 'SKUMAK-Away-111', 8, NULL, 100000000.0000, 100000000.0000, 5.0000, 105000000.0000, 105000000.0000, '2024-10-04 11:06:22', '2024-10-04 11:06:22', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `price_type` varchar(191) NOT NULL DEFAULT 'fixed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 13.0000, '2024-07-08 04:59:05', '2024-09-21 11:45:31'),
(2, 2, 2, 2, 1, 5.0000, '2024-07-08 07:12:53', '2024-09-21 11:45:31'),
(3, 3, 3, 3, 2, 113.0000, '2024-07-31 08:07:52', '2024-10-01 10:16:37'),
(4, 7, 7, 7, 5, 52.0000, '2024-10-01 10:26:47', '2024-10-04 11:03:28'),
(5, 8, 8, 8, 5, 24.0000, '2024-10-04 11:18:33', '2024-10-14 13:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'Size', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, 'XS', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(2, 'S', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(3, 'M', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(4, 'L', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(5, 'XL', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(6, '2XL', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(7, '3XL', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(8, '4XL', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41'),
(9, '5XL', 1, '2024-08-14 03:08:41', '2024-08-14 03:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_denominations_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`),
  ADD KEY `invoice_schemes_number_type_index` (`number_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`),
  ADD KEY `products_secondary_unit_id_index` (`secondary_unit_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `transactions_delivery_date_index` (`delivery_date`),
  ADD KEY `transactions_delivery_person_index` (`delivery_person`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`),
  ADD KEY `transaction_payments_payment_type_index` (`payment_type`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
