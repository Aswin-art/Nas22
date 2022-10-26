-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2022 at 09:23 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_actions`
--

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(8, 'action_scheduler/migration_hook', 'complete', '2022-10-11 03:01:54', '2022-10-11 03:01:54', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1665457314;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1665457314;}', 1, 1, '2022-10-11 03:01:57', '2022-10-11 03:01:57', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_claims`
--

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_groups`
--

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration');

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_logs`
--

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 8, 'action created', '2022-10-11 03:00:54', '2022-10-11 03:00:54'),
(2, 8, 'action started via WP Cron', '2022-10-11 03:01:57', '2022-10-11 03:01:57'),
(3, 8, 'action complete via WP Cron', '2022-10-11 03:01:57', '2022-10-11 03:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `wp_aiowps_debug_log`
--

CREATE TABLE `wp_aiowps_debug_log` (
  `id` bigint(20) NOT NULL,
  `level` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '1000-10-10 10:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_aiowps_events`
--

CREATE TABLE `wp_aiowps_events` (
  `id` bigint(20) NOT NULL,
  `event_type` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `event_date` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `ip_or_host` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `referer_info` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country_code` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `event_data` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_aiowps_failed_logins`
--

CREATE TABLE `wp_aiowps_failed_logins` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_login` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `failed_login_date` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `login_attempt_ip` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_aiowps_global_meta`
--

CREATE TABLE `wp_aiowps_global_meta` (
  `meta_id` bigint(20) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `meta_key1` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_key2` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_key3` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_key4` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_key5` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_value1` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_value2` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_value3` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_value4` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_value5` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_aiowps_login_activity`
--

CREATE TABLE `wp_aiowps_login_activity` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_login` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `login_date` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `logout_date` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `login_ip` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `login_country` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `browser_type` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_aiowps_login_activity`
--

INSERT INTO `wp_aiowps_login_activity` (`id`, `user_id`, `user_login`, `login_date`, `logout_date`, `login_ip`, `login_country`, `browser_type`) VALUES
(1, 1, 'smkn1surabaya', '2022-10-11 03:39:03', '1000-10-10 10:00:00', '125.164.146.114', '', ''),
(2, 1, 'smkn1surabaya', '2022-10-11 06:49:18', '1000-10-10 10:00:00', '125.164.146.114', '', ''),
(3, 1, 'smkn1surabaya', '2022-10-26 00:03:24', '2022-10-26 04:43:24', '36.81.147.19', '', ''),
(4, 1, 'smkn1surabaya', '2022-10-26 04:44:16', '2022-10-26 04:44:59', '36.81.147.19', '', ''),
(5, 1, 'smkn1surabaya', '2022-10-26 04:45:29', '1000-10-10 10:00:00', '36.81.147.19', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_aiowps_login_lockdown`
--

CREATE TABLE `wp_aiowps_login_lockdown` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_login` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lockdown_date` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `release_date` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `failed_login_ip` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `lock_reason` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `unlock_key` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `is_lockout_email_sent` tinyint(1) NOT NULL DEFAULT 1,
  `backtrace_log` text COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_aiowps_permanent_block`
--

CREATE TABLE `wp_aiowps_permanent_block` (
  `id` bigint(20) NOT NULL,
  `blocked_ip` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `block_reason` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `country_origin` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `blocked_date` datetime NOT NULL DEFAULT '1000-10-10 10:00:00',
  `unblock` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Seorang Komentator WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2022-10-11 02:26:43', '2022-10-11 02:26:43', 'Hai, ini merupakan sebuah komentar.\nUntuk mulai memoderasi, mengedit, dan menghapus komentar, silakan kunjungi layar Komentar di dasbor.\nAvatar komentator diambil dari <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_nextend2_image_storage`
--

CREATE TABLE `wp_nextend2_image_storage` (
  `id` int(11) NOT NULL,
  `hash` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_nextend2_section_storage`
--

CREATE TABLE `wp_nextend2_section_storage` (
  `id` int(11) NOT NULL,
  `application` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `section` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `referencekey` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `system` int(11) NOT NULL DEFAULT 0,
  `editable` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_nextend2_section_storage`
--

INSERT INTO `wp_nextend2_section_storage` (`id`, `application`, `section`, `referencekey`, `value`, `system`, `editable`) VALUES
(10000, 'smartslider', 'settings', '', '{\"n2_ss3_version\":\"3.5.1.11\\/b:release-3.5.1.11\\/r:f0b633e7a94052a70133276e2ed8de7715ca6ecb\"}', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_nextend2_smartslider3_generators`
--

CREATE TABLE `wp_nextend2_smartslider3_generators` (
  `id` int(11) NOT NULL,
  `group` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_nextend2_smartslider3_sliders`
--

CREATE TABLE `wp_nextend2_smartslider3_sliders` (
  `id` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'published',
  `time` datetime NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_nextend2_smartslider3_sliders`
--

INSERT INTO `wp_nextend2_smartslider3_sliders` (`id`, `alias`, `title`, `type`, `params`, `status`, `time`, `thumbnail`, `ordering`) VALUES
(1, NULL, 'Tutorial Slider', 'simple', '{\"aria-label\":\"Slider\",\"alias-id\":\"\",\"alias-smoothscroll\":\"\",\"alias-slideswitch\":\"\",\"background\":\"\",\"background-fixed\":\"0\",\"background-size\":\"cover\",\"background-color\":\"FFFFFF00\",\"backgroundVideoMp4\":\"\",\"backgroundVideoMuted\":\"1\",\"backgroundVideoLoop\":\"1\",\"backgroundVideoMode\":\"fill\",\"align\":\"normal\",\"margin\":\"0|*|0|*|0|*|0\",\"padding\":\"0|*|0|*|0|*|0\",\"perspective\":\"1000\",\"border-width\":\"0\",\"border-color\":\"3E3E3Eff\",\"border-radius\":\"0\",\"slider-preset\":\"\",\"slider-css\":\"\",\"width\":\"1200\",\"height\":\"600\",\"mobileportrait\":\"1\",\"mobilelandscape\":\"1\",\"tabletportrait\":\"1\",\"tabletlandscape\":\"1\",\"desktopportrait\":\"1\",\"desktoplandscape\":\"1\",\"responsiveLimitSlideWidth\":\"1\",\"responsiveSlideWidthDesktopLandscape\":\"0\",\"responsiveSlideWidthMaxDesktopLandscape\":\"1600\",\"responsiveSlideWidth\":\"0\",\"responsiveSlideWidthMax\":\"3000\",\"responsiveSlideWidthTabletLandscape\":\"0\",\"responsiveSlideWidthMaxTabletLandscape\":\"1200\",\"responsiveSlideWidthTablet\":\"0\",\"responsiveSlideWidthMaxTablet\":\"3000\",\"responsiveSlideWidthMobileLandscape\":\"0\",\"responsiveSlideWidthMaxMobileLandscape\":\"740\",\"responsiveSlideWidthMobile\":\"0\",\"responsiveSlideWidthMaxMobile\":\"480\",\"responsive-breakpoint-desktop-portrait\":\"1440\",\"responsive-breakpoint-desktop-portrait-landscape\":\"1440\",\"responsive-breakpoint-tablet-landscape\":\"1300\",\"responsive-breakpoint-tablet-landscape-landscape\":\"1300\",\"responsive-breakpoint-tablet-portrait\":\"1199\",\"responsive-breakpoint-tablet-portrait-landscape\":\"1199\",\"responsive-breakpoint-mobile-landscape\":\"900\",\"responsive-breakpoint-mobile-landscape-landscape\":\"1050\",\"responsive-breakpoint-mobile-portrait\":\"700\",\"responsive-breakpoint-mobile-portrait-landscape\":\"900\",\"responsive-breakpoint-desktop-landscape-enabled\":\"0\",\"responsive-breakpoint-tablet-landscape-enabled\":\"0\",\"responsive-breakpoint-tablet-portrait-enabled\":\"1\",\"responsive-breakpoint-mobile-landscape-enabled\":\"0\",\"responsive-breakpoint-mobile-portrait-enabled\":\"1\",\"responsive-breakpoint-global\":\"0\",\"breakpoints-orientation\":\"portrait\",\"responsive-mode\":\"fullwidth\",\"responsiveSliderHeightMin\":\"0\",\"responsiveForceFull\":\"1\",\"responsiveForceFullOverflowX\":\"body\",\"responsiveForceFullHorizontalSelector\":\"body\",\"slider-size-override\":\"0\",\"slider-size-override-mobile-portrait\":\"0\",\"mobile-portrait-width\":\"320\",\"mobile-portrait-height\":\"568\",\"slider-size-override-mobile-landscape\":\"0\",\"mobile-landscape-width\":\"568\",\"mobile-landscape-height\":\"320\",\"slider-size-override-tablet-portrait\":\"0\",\"tablet-portrait-width\":\"768\",\"tablet-portrait-height\":\"1024\",\"slider-size-override-tablet-landscape\":\"0\",\"tablet-landscape-width\":\"1024\",\"tablet-landscape-height\":\"768\",\"slider-size-override-desktop-landscape\":\"0\",\"desktop-landscape-width\":\"1440\",\"desktop-landscape-height\":\"900\",\"controlsTouch\":\"horizontal\",\"controlsScroll\":\"0\",\"controlsKeyboard\":\"1\",\"widget-arrow-enabled\":\"0\",\"widgetarrow\":\"imageEmpty\",\"widget-arrow-previous\":\"thin-horizontal.svg\",\"widget-arrow-previous-image\":\"\",\"widget-arrow-previous-color\":\"ffffffcc\",\"widget-arrow-previous-hover\":\"1\",\"widget-arrow-previous-hover-color\":\"ffffffff\",\"widget-arrow-mirror\":\"1\",\"widget-arrow-next\":\"thin-horizontal.svg\",\"widget-arrow-next-image\":\"\",\"widget-arrow-next-color\":\"ffffffcc\",\"widget-arrow-next-hover\":\"0\",\"widget-arrow-next-hover-color\":\"ffffffcc\",\"widget-arrow-style\":\"\",\"widget-arrow-previous-position-mode\":\"simple\",\"widget-arrow-previous-position-area\":\"6\",\"widget-arrow-previous-position-stack\":\"1\",\"widget-arrow-previous-position-offset\":\"15\",\"widget-arrow-previous-position-horizontal\":\"left\",\"widget-arrow-previous-position-horizontal-position\":\"0\",\"widget-arrow-previous-position-horizontal-unit\":\"px\",\"widget-arrow-previous-position-vertical\":\"top\",\"widget-arrow-previous-position-vertical-position\":\"0\",\"widget-arrow-previous-position-vertical-unit\":\"px\",\"widget-arrow-next-position-mode\":\"simple\",\"widget-arrow-next-position-area\":\"7\",\"widget-arrow-next-position-stack\":\"1\",\"widget-arrow-next-position-offset\":\"15\",\"widget-arrow-next-position-horizontal\":\"left\",\"widget-arrow-next-position-horizontal-position\":\"0\",\"widget-arrow-next-position-horizontal-unit\":\"px\",\"widget-arrow-next-position-vertical\":\"top\",\"widget-arrow-next-position-vertical-position\":\"0\",\"widget-arrow-next-position-vertical-unit\":\"px\",\"widget-arrow-animation\":\"fade\",\"widget-arrow-previous-alt\":\"previous arrow\",\"widget-arrow-next-alt\":\"next arrow\",\"widget-arrow-base64\":\"1\",\"widget-arrow-display-hover\":\"0\",\"widget-arrow-display-mobileportrait\":\"0\",\"widget-arrow-display-mobilelandscape\":\"0\",\"widget-arrow-display-tabletportrait\":\"1\",\"widget-arrow-display-tabletlandscape\":\"1\",\"widget-arrow-display-desktopportrait\":\"1\",\"widget-arrow-display-desktoplandscape\":\"1\",\"widget-arrow-exclude-slides\":\"\",\"widget-bullet-enabled\":\"1\",\"widgetbullet\":\"transition\",\"widget-bullet-position-mode\":\"simple\",\"widget-bullet-position-area\":\"10\",\"widget-bullet-position-stack\":\"1\",\"widget-bullet-position-offset\":\"5\",\"widget-bullet-position-horizontal\":\"left\",\"widget-bullet-position-horizontal-position\":\"0\",\"widget-bullet-position-horizontal-unit\":\"px\",\"widget-bullet-position-vertical\":\"top\",\"widget-bullet-position-vertical-position\":\"0\",\"widget-bullet-position-vertical-unit\":\"px\",\"widget-bullet-action\":\"click\",\"widget-bullet-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"00000000\\\",\\\"opacity\\\":100,\\\"padding\\\":\\\"5|*|5|*|5|*|5|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"2|*|solid|*|ffffffcc\\\",\\\"borderradius\\\":\\\"50\\\",\\\"extra\\\":\\\"margin: 4px;\\\"},{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"ffffffcc\\\",\\\"border\\\":\\\"2|*|solid|*|ffffffcc\\\"}]}\",\"widget-bullet-bar\":\"\",\"widget-bullet-bar-full-size\":\"0\",\"widget-bullet-align\":\"center\",\"widget-bullet-orientation\":\"auto\",\"widget-bullet-thumbnail-show-image\":\"0\",\"widget-bullet-thumbnail-width\":\"60\",\"widget-bullet-thumbnail-height\":\"60\",\"widget-bullet-thumbnail-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"00000080\\\",\\\"padding\\\":\\\"3|*|3|*|3|*|3|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"3\\\",\\\"extra\\\":\\\"margin: 5px;\\\"}]}\",\"widget-bullet-thumbnail-side\":\"before\",\"widget-bullet-display-hover\":\"0\",\"widget-bullet-display-mobileportrait\":\"1\",\"widget-bullet-display-mobilelandscape\":\"1\",\"widget-bullet-display-tabletportrait\":\"1\",\"widget-bullet-display-tabletlandscape\":\"1\",\"widget-bullet-display-desktopportrait\":\"1\",\"widget-bullet-display-desktoplandscape\":\"1\",\"widget-bullet-exclude-slides\":\"\",\"widget-bar-enabled\":\"0\",\"widgetbar\":\"horizontal\",\"widget-bar-position-mode\":\"simple\",\"widget-bar-position-area\":\"10\",\"widget-bar-position-stack\":\"1\",\"widget-bar-position-offset\":\"30\",\"widget-bar-position-horizontal\":\"left\",\"widget-bar-position-horizontal-position\":\"0\",\"widget-bar-position-horizontal-unit\":\"px\",\"widget-bar-position-vertical\":\"top\",\"widget-bar-position-vertical-position\":\"0\",\"widget-bar-position-vertical-unit\":\"px\",\"widget-bar-animate\":\"0\",\"widget-bar-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"5|*|20|*|5|*|20|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"40\\\",\\\"extra\\\":\\\"\\\"}]}\",\"widget-bar-show-title\":\"1\",\"widget-bar-font-title\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000c7\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"extra\\\":\\\"vertical-align: middle;\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"google(@import url(http://fonts.googleapis.com/css?family=Raleway);),Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-bar-show-description\":\"1\",\"widget-bar-font-description\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000c7\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":1,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"extra\\\":\\\"vertical-align: middle;\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"Raleway,Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-bar-slide-count\":\"0\",\"widget-bar-width\":\"100%\",\"widget-bar-full-width\":\"0\",\"widget-bar-separator\":\" - \",\"widget-bar-align\":\"center\",\"widget-bar-display-hover\":\"0\",\"widget-bar-display-mobileportrait\":\"1\",\"widget-bar-display-mobilelandscape\":\"1\",\"widget-bar-display-tabletportrait\":\"1\",\"widget-bar-display-tabletlandscape\":\"1\",\"widget-bar-display-desktopportrait\":\"1\",\"widget-bar-display-desktoplandscape\":\"1\",\"widget-bar-exclude-slides\":\"\",\"widget-thumbnail-enabled\":\"0\",\"widgetthumbnail\":\"default\",\"widget-thumbnail-show-image\":\"1\",\"widget-thumbnail-width\":\"100\",\"widget-thumbnail-height\":\"60\",\"widget-thumbnail-position-mode\":\"simple\",\"widget-thumbnail-position-area\":\"12\",\"widget-thumbnail-position-stack\":\"1\",\"widget-thumbnail-position-offset\":\"0\",\"widget-thumbnail-position-horizontal\":\"left\",\"widget-thumbnail-position-horizontal-position\":\"0\",\"widget-thumbnail-position-horizontal-unit\":\"px\",\"widget-thumbnail-position-vertical\":\"top\",\"widget-thumbnail-position-vertical-position\":\"0\",\"widget-thumbnail-position-vertical-unit\":\"px\",\"widget-thumbnail-action\":\"click\",\"widget-thumbnail-align-content\":\"start\",\"widget-thumbnail-style-bar\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"242424ff\\\",\\\"padding\\\":\\\"3|*|3|*|3|*|3|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"0\\\",\\\"extra\\\":\\\"\\\"}]}\",\"widget-thumbnail-style-slides\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"00000000\\\",\\\"padding\\\":\\\"0|*|0|*|0|*|0|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|ffffff00\\\",\\\"borderradius\\\":\\\"0\\\",\\\"opacity\\\":\\\"40\\\",\\\"extra\\\":\\\"margin: 3px;\\ntransition: all 0.4s;\\nbackground-size: cover;\\\"},{\\\"border\\\":\\\"0|*|solid|*|ffffffcc\\\",\\\"opacity\\\":\\\"100\\\",\\\"extra\\\":\\\"\\\"}]}\",\"widget-thumbnail-title-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"3|*|10|*|3|*|10|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"0\\\",\\\"extra\\\":\\\"bottom: 0;\\nleft: 0;\\\"}]}\",\"widget-thumbnail-title\":\"0\",\"widget-thumbnail-title-font\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"12||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ab\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"google(@import url(http://fonts.googleapis.com/css?family=Raleway);),Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-thumbnail-description\":\"0\",\"widget-thumbnail-description-font\":\"{\\\"data\\\":[{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"12||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ab\\\",\\\"afont\\\":\\\"Montserrat\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\"},{\\\"color\\\":\\\"fc2828ff\\\",\\\"afont\\\":\\\"google(@import url(http://fonts.googleapis.com/css?family=Raleway);),Arial\\\",\\\"size\\\":\\\"25||px\\\"},{}]}\",\"widget-thumbnail-caption-placement\":\"overlay\",\"widget-thumbnail-caption-size\":\"100\",\"widget-thumbnail-arrow\":\"1\",\"widget-thumbnail-arrow-width\":\"26\",\"widget-thumbnail-arrow-offset\":\"0\",\"widget-thumbnail-arrow-prev-alt\":\"previous arrow\",\"widget-thumbnail-arrow-next-alt\":\"next arrow\",\"widget-thumbnail-arrow-image\":\"\",\"widget-thumbnail-group\":\"1\",\"widget-thumbnail-invert-group-direction\":\"0\",\"widget-thumbnail-orientation\":\"auto\",\"widget-thumbnail-size\":\"100%\",\"widget-thumbnail-display-hover\":\"0\",\"widget-thumbnail-display-mobileportrait\":\"1\",\"widget-thumbnail-display-mobilelandscape\":\"1\",\"widget-thumbnail-display-tabletportrait\":\"1\",\"widget-thumbnail-display-tabletlandscape\":\"1\",\"widget-thumbnail-display-desktopportrait\":\"1\",\"widget-thumbnail-display-desktoplandscape\":\"1\",\"widget-thumbnail-exclude-slides\":\"\",\"widget-shadow-enabled\":\"0\",\"widgetshadow\":\"shadow\",\"widget-shadow-shadow\":\"dark.png\",\"widget-shadow-shadow-image\":\"\",\"widget-shadow-width\":\"100%\",\"widget-shadow-display-mobileportrait\":\"1\",\"widget-shadow-display-mobilelandscape\":\"1\",\"widget-shadow-display-tabletportrait\":\"1\",\"widget-shadow-display-tabletlandscape\":\"1\",\"widget-shadow-display-desktopportrait\":\"1\",\"widget-shadow-display-desktoplandscape\":\"1\",\"widget-shadow-exclude-slides\":\"\",\"widget-fullscreen-enabled\":\"0\",\"widgetfullscreen\":\"image\",\"widget-fullscreen-tonormal\":\"full1.svg\",\"widget-fullscreen-tonormal-image\":\"\",\"widget-fullscreen-tonormal-color\":\"ffffffcc\",\"widget-fullscreen-mirror\":\"1\",\"widget-fullscreen-tofull\":\"full1.svg\",\"widget-fullscreen-tofull-image\":\"\",\"widget-fullscreen-tofull-color\":\"ffffffcc\",\"widget-fullscreen-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"10|*|10|*|10|*|10|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"3\\\",\\\"extra\\\":\\\"\\\"},{\\\"backgroundcolor\\\":\\\"000000ab\\\"}]}\",\"widget-fullscreen-position-mode\":\"simple\",\"widget-fullscreen-position-area\":\"4\",\"widget-fullscreen-position-stack\":\"1\",\"widget-fullscreen-position-offset\":\"15\",\"widget-fullscreen-position-horizontal\":\"left\",\"widget-fullscreen-position-horizontal-position\":\"0\",\"widget-fullscreen-position-horizontal-unit\":\"px\",\"widget-fullscreen-position-vertical\":\"top\",\"widget-fullscreen-position-vertical-position\":\"0\",\"widget-fullscreen-position-vertical-unit\":\"px\",\"widget-fullscreen-responsive-desktop\":\"1\",\"widget-fullscreen-responsive-tablet\":\"0.7\",\"widget-fullscreen-responsive-mobile\":\"0.5\",\"widget-fullscreen-display-hover\":\"0\",\"widget-fullscreen-display-mobileportrait\":\"1\",\"widget-fullscreen-display-mobilelandscape\":\"1\",\"widget-fullscreen-display-tabletportrait\":\"1\",\"widget-fullscreen-display-tabletlandscape\":\"1\",\"widget-fullscreen-display-desktopportrait\":\"1\",\"widget-fullscreen-display-desktoplandscape\":\"1\",\"widget-fullscreen-exclude-slides\":\"\",\"widget-html-enabled\":\"0\",\"widgethtml\":\"html\",\"widget-html-position-mode\":\"simple\",\"widget-html-position-area\":\"2\",\"widget-html-position-stack\":\"1\",\"widget-html-position-offset\":\"0\",\"widget-html-position-horizontal\":\"left\",\"widget-html-position-horizontal-position\":\"0\",\"widget-html-position-horizontal-unit\":\"px\",\"widget-html-position-vertical\":\"top\",\"widget-html-position-vertical-position\":\"0\",\"widget-html-position-vertical-unit\":\"px\",\"widget-html-code\":\"\",\"widget-html-display-hover\":\"0\",\"widget-html-display-mobileportrait\":\"1\",\"widget-html-display-mobilelandscape\":\"1\",\"widget-html-display-tabletportrait\":\"1\",\"widget-html-display-tabletlandscape\":\"1\",\"widget-html-display-desktopportrait\":\"1\",\"widget-html-display-desktoplandscape\":\"1\",\"widget-html-exclude-slides\":\"\",\"animation\":\"fade\",\"animation-duration\":\"500\",\"animation-delay\":\"0\",\"animation-easing\":\"easeOutQuad\",\"carousel\":\"1\",\"background-animation\":\"\",\"background-animation-color\":\"333333ff\",\"background-animation-speed\":\"normal\",\"animation-shifted-background-animation\":\"auto\",\"kenburns-animation\":\"50|*|50|*|\",\"kenburns-animation-speed\":\"default\",\"kenburns-animation-strength\":\"default\",\"shape-divider\":\"\",\"particle\":\"\",\"playfirstlayer\":\"1\",\"playonce\":\"0\",\"layer-animation-play-in\":\"end\",\"layer-animation-play-mode\":\"skippable\",\"parallax-enabled\":\"1\",\"parallax-enabled-mobile\":\"0\",\"parallax-3d\":\"0\",\"parallax-animate\":\"1\",\"parallax-horizontal\":\"mouse\",\"parallax-vertical\":\"mouse\",\"parallax-mouse-origin\":\"slider\",\"parallax-scroll-move\":\"both\",\"autoplay\":\"0\",\"autoplayDuration\":\"8000\",\"autoplayStart\":\"1\",\"autoplayAllowReStart\":\"0\",\"autoplayLoop\":\"1\",\"autoplayfinish\":\"1|*|loop|*|current\",\"loop-single-slide\":\"0\",\"autoplayStopClick\":\"1\",\"autoplayStopMouse\":\"0\",\"autoplayStopMedia\":\"1\",\"autoplayResumeClick\":\"0\",\"autoplayResumeMouse\":\"0\",\"autoplayResumeMedia\":\"1\",\"widget-autoplay-enabled\":\"0\",\"widgetautoplay\":\"image\",\"widget-autoplay-play\":\"small-light.svg\",\"widget-autoplay-play-image\":\"\",\"widget-autoplay-play-color\":\"ffffffcc\",\"widget-autoplay-style\":\"{\\\"data\\\":[{\\\"backgroundcolor\\\":\\\"000000ab\\\",\\\"padding\\\":\\\"10|*|10|*|10|*|10|*|px\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"3\\\",\\\"extra\\\":\\\"\\\"},{\\\"backgroundcolor\\\":\\\"000000ab\\\"}]}\",\"widget-autoplay-mirror\":\"1\",\"widget-autoplay-pause\":\"small-light.svg\",\"widget-autoplay-pause-image\":\"\",\"widget-autoplay-pause-color\":\"ffffffcc\",\"widget-autoplay-responsive-desktop\":\"1\",\"widget-autoplay-responsive-tablet\":\"0.7\",\"widget-autoplay-responsive-mobile\":\"0.5\",\"widget-autoplay-position-mode\":\"simple\",\"widget-autoplay-position-area\":\"4\",\"widget-autoplay-position-stack\":\"1\",\"widget-autoplay-position-offset\":\"15\",\"widget-autoplay-position-horizontal\":\"left\",\"widget-autoplay-position-horizontal-position\":\"0\",\"widget-autoplay-position-horizontal-unit\":\"px\",\"widget-autoplay-position-vertical\":\"top\",\"widget-autoplay-position-vertical-position\":\"0\",\"widget-autoplay-position-vertical-unit\":\"px\",\"widget-autoplay-display-hover\":\"0\",\"widget-autoplay-display-mobileportrait\":\"1\",\"widget-autoplay-display-mobilelandscape\":\"1\",\"widget-autoplay-display-tabletportrait\":\"1\",\"widget-autoplay-display-tabletlandscape\":\"1\",\"widget-autoplay-display-desktopportrait\":\"1\",\"widget-autoplay-display-desktoplandscape\":\"1\",\"widget-autoplay-exclude-slides\":\"\",\"widget-indicator-enabled\":\"0\",\"widgetindicator\":\"pie\",\"widget-indicator-position-mode\":\"simple\",\"widget-indicator-position-area\":\"4\",\"widget-indicator-position-stack\":\"1\",\"widget-indicator-position-offset\":\"15\",\"widget-indicator-position-horizontal\":\"left\",\"widget-indicator-position-horizontal-position\":\"0\",\"widget-indicator-position-horizontal-unit\":\"px\",\"widget-indicator-position-vertical\":\"top\",\"widget-indicator-position-vertical-position\":\"0\",\"widget-indicator-position-vertical-unit\":\"px\",\"widget-indicator-size\":\"25\",\"widget-indicator-thickness\":\"30\",\"widget-indicator-track\":\"000000ab\",\"widget-indicator-bar\":\"ffffffff\",\"widget-indicator-style\":\"\",\"widget-indicator-display-hover\":\"0\",\"widget-indicator-display-mobileportrait\":\"1\",\"widget-indicator-display-mobilelandscape\":\"1\",\"widget-indicator-display-tabletportrait\":\"1\",\"widget-indicator-display-tabletlandscape\":\"1\",\"widget-indicator-display-desktopportrait\":\"1\",\"widget-indicator-display-desktoplandscape\":\"1\",\"widget-indicator-exclude-slides\":\"\",\"imageload\":\"0\",\"imageloadNeighborSlides\":\"0\",\"optimize-scale\":\"0\",\"optimize-quality\":\"70\",\"optimize-thumbnail-scale\":\"0\",\"optimize-thumbnail-quality\":\"70\",\"optimize-slide-width-normal\":\"1920\",\"optimizeThumbnailWidth\":\"100\",\"optimizeThumbnailHeight\":\"60\",\"layer-image-optimize\":\"0\",\"layer-image-width-tablet\":\"800\",\"layer-image-width-mobile\":\"425\",\"layer-image-base64\":\"0\",\"layer-image-base64-size\":\"50\",\"slides-background-video-mobile\":\"1\",\"playWhenVisible\":\"1\",\"playWhenVisibleAt\":\"50\",\"dependency\":\"\",\"delay\":\"0\",\"is-delayed\":\"0\",\"backgroundMode\":\"fill\",\"slide-css\":\"\",\"randomize\":\"0\",\"randomizeFirst\":\"0\",\"randomize-cache\":\"1\",\"variations\":\"5\",\"reverse-slides\":\"0\",\"maximumslidecount\":\"1000\",\"maintain-session\":\"0\",\"global-lightbox\":\"0\",\"global-lightbox-label\":\"0\",\"slide-background-parallax\":\"0\",\"slide-background-parallax-strength\":\"50\",\"bg-parallax-tablet\":\"0\",\"bg-parallax-mobile\":\"0\",\"blockrightclick\":\"0\",\"controlsBlockCarouselInteraction\":\"1\",\"clear-both\":\"1\",\"clear-both-after\":\"1\",\"overflow-hidden-page\":\"0\",\"responsiveFocusUser\":\"1\",\"responsiveFocusEdge\":\"auto\",\"classes\":\"\",\"custom-css-codes\":\"\",\"callbacks\":\"\",\"related-posts\":\"\"}', 'published', '2020-02-25 13:53:41', 'https://smartslider3.com/wp-content/uploads/slider404/tutorialsliderthumbnail-1.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_nextend2_smartslider3_sliders_xref`
--

CREATE TABLE `wp_nextend2_smartslider3_sliders_xref` (
  `group_id` int(11) NOT NULL,
  `slider_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_nextend2_smartslider3_slides`
--

CREATE TABLE `wp_nextend2_smartslider3_slides` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `slider` int(11) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `published` tinyint(1) NOT NULL,
  `first` int(11) NOT NULL,
  `slide` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `generator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_nextend2_smartslider3_slides`
--

INSERT INTO `wp_nextend2_smartslider3_slides` (`id`, `title`, `slider`, `publish_up`, `publish_down`, `published`, `first`, `slide`, `description`, `thumbnail`, `params`, `ordering`, `generator_id`) VALUES
(1, 'Slide Background', 1, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 0, '[{\"type\":\"content\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":1120,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitselfalign\":\"center\",\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-IbNOabpfT5aE\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"layers\":[{\"type\":\"row\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"desktopportraitgutter\":0,\"desktopportraitwrapafter\":0,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"tabletportraitgutter\":20,\"mobileportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"mobileportraitgutter\":20,\"mobileportraitwrapafter\":1,\"mobileportraitmaxwidth\":400,\"mobilelandscapewrapafter\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-dtwtw9DVCwgQ\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"_self\",\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"ffffff00\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"borderwidth\":\"1|*|1|*|1|*|1\",\"borderstyle\":\"none\",\"bordercolor\":\"FFFFFFFF\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"fullwidth\":1,\"stretch\":0,\"name\":\"Row\",\"namesynced\":1,\"cols\":[{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"10|*|10|*|10|*|10|*|px\",\"desktopportraitorder\":0,\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitinneralign\":\"left\",\"mobileportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitorder\":2,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-Fjvyu081qJeK\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"2/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":60,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Jeans Store Interior\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"36||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"01. Slide Background\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Lorem ipsum dolor sit amet, consect\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"24||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"weight\\\":300,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Every slide includes a background, which can be a picture or solid color.\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 1\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"To change the background click on the label bar and in the layer window select the style tab.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 2\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"Choose a source from the background top tab then upload an image or pick a background color.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Read More\",\"namesynced\":1,\"item\":{\"type\":\"button\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"0568f6ff\\\"}]}\",\"style\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"0568f6ff\\\",\\\"opacity\\\":100,\\\"padding\\\":\\\"1|*|2|*|1|*|2|*|em\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"5\\\"},{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"ffffffff\\\"}]}\",\"content\":\"Next Slide\",\"nowrap\":\"1\",\"fullwidth\":\"0\",\"href\":\"NextSlide[]\",\"href-target\":\"_self\",\"href-rel\":\"\",\"class\":\"\",\"icon\":\"\",\"iconsize\":\"100\",\"iconspacing\":\"30\",\"iconplacement\":\"left\"}}}]},{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitorder\":0,\"mobileportraitinneralign\":\"center\",\"mobileportraitorder\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-LnImbm1HgUAv\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"3/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"mobileportraitmaxwidth\":300,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Image\",\"namesynced\":1,\"item\":{\"type\":\"image\",\"values\":{\"image\":\"https://smartslider3.com/wp-content/uploads/slider424/background.png\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"size\":\"auto|*|auto\",\"alt\":\"\",\"title\":\"\",\"href-class\":\"\"}}}]}]}]}]', '', 'https://smartslider3.com/wp-content/uploads/slider424/slidebackground.jpg', '{\"type\":\"slide\",\"desktopportraitfontsize\":100,\"desktopportraitpadding\":\"10|*|60|*|10|*|60\",\"tabletportraitpadding\":\"10|*|50|*|10|*|50\",\"mobileportraitpadding\":\"10|*|10|*|35|*|10\",\"record-slides\":0,\"thumbnailType\":\"default\",\"static-slide\":0,\"slide-duration\":0,\"ligthboxImage\":\"\",\"background-animation\":\"\",\"background-animation-color\":\"333333ff\",\"background-animation-speed\":\"default\",\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"\",\"background-type\":\"image\",\"backgroundColor\":\"ffffff00\",\"backgroundGradient\":\"off\",\"backgroundColorEnd\":\"ffffff00\",\"backgroundColorOverlay\":0,\"backgroundImage\":\"https://smartslider3.com/wp-content/uploads/slider424/slide1.png\",\"backgroundFocusX\":50,\"backgroundFocusY\":50,\"backgroundImageOpacity\":100,\"backgroundImageBlur\":0,\"backgroundAlt\":\"\",\"backgroundTitle\":\"\",\"backgroundMode\":\"default\",\"guides\":\"eyJob3Jpem9udGFsIjpbXSwidmVydGljYWwiOltdfQ==\",\"version\":\"3.4.0\"}', 1, 0),
(2, 'Build & Design', 1, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 0, '[{\"type\":\"content\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":1120,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitselfalign\":\"center\",\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-TPnUuKlAWVoC\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"layers\":[{\"type\":\"row\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitinneralign\":\"inherit\",\"desktopportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"desktopportraitgutter\":0,\"desktopportraitwrapafter\":0,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"tabletportraitgutter\":20,\"mobileportraitinneralign\":\"inherit\",\"mobileportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"mobileportraitgutter\":20,\"mobileportraitwrapafter\":1,\"mobileportraitmaxwidth\":400,\"mobileportraitselfalign\":\"inherit\",\"mobilelandscapewrapafter\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-NmnNQvKK01kO\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"_self\",\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"ffffff00\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"borderwidth\":\"1|*|1|*|1|*|1\",\"borderstyle\":\"none\",\"bordercolor\":\"FFFFFFFF\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"fullwidth\":1,\"stretch\":0,\"name\":\"Row\",\"namesynced\":1,\"cols\":[{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"10|*|10|*|10|*|10|*|px\",\"desktopportraitorder\":0,\"tabletportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitmaxwidth\":0,\"mobileportraitinneralign\":\"left\",\"mobileportraitpadding\":\"10|*|0|*|10|*|0|*|px\",\"mobileportraitorder\":2,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-R5Jkk06Nmzr4\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"2/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":60,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Jeans Store Interior\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"36||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"02. Build & Design\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Lorem ipsum dolor sit amet, consect\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"24||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"weight\\\":300,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Build any layout with layers and customize your designs limitlessly.\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 1\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"To add a layer, click the green plus button in the left sidebar and select the type of layer.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":100,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Latest Project\",\"namesynced\":1,\"item\":{\"type\":\"heading\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffdb\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"uppercase\\\"},{\\\"extra\\\":\\\"\\\"}]}\",\"style\":\"\",\"priority\":\"div\",\"fullwidth\":\"1\",\"nowrap\":\"0\",\"heading\":\"Step 2\",\"title\":\"\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"split-text-transform-origin\":\"50|*|50|*|0\",\"split-text-backface-visibility\":\"1\",\"split-text-animation-in\":\"\",\"split-text-delay-in\":\"0\",\"split-text-animation-out\":\"\",\"split-text-delay-out\":\"0\",\"class\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":90,\"mobileportraitfontsize\":70,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Text\",\"namesynced\":1,\"item\":{\"type\":\"text\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffb0\\\",\\\"size\\\":\\\"18||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.6\\\",\\\"weight\\\":400,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"inherit\\\",\\\"letterspacing\\\":\\\"normal\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"1890d7ff\\\"}]}\",\"style\":\"\",\"content\":\"Select any layer and you can edit its content and style properties in the layer window.\",\"content-tablet-enabled\":\"0\",\"contenttablet\":\"\",\"content-mobile-enabled\":\"0\",\"contentmobile\":\"\"}}},{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"20|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"tabletportraitfontsize\":80,\"mobileportraitfontsize\":80,\"mobileportraitmargin\":\"10|*|0|*|0|*|0|*|px\",\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Read More\",\"namesynced\":1,\"item\":{\"type\":\"button\",\"values\":{\"font\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"14||px\\\",\\\"tshadow\\\":\\\"0|*|0|*|0|*|000000ff\\\",\\\"afont\\\":\\\"Roboto\\\",\\\"lineheight\\\":\\\"1.5\\\",\\\"weight\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"letterspacing\\\":\\\"1px\\\",\\\"wordspacing\\\":\\\"normal\\\",\\\"texttransform\\\":\\\"none\\\"},{\\\"extra\\\":\\\"\\\",\\\"color\\\":\\\"0568f6ff\\\"}]}\",\"style\":\"{\\\"data\\\":[{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"0568f6ff\\\",\\\"opacity\\\":100,\\\"padding\\\":\\\"1|*|2|*|1|*|2|*|em\\\",\\\"boxshadow\\\":\\\"0|*|0|*|0|*|0|*|000000ff\\\",\\\"border\\\":\\\"0|*|solid|*|000000ff\\\",\\\"borderradius\\\":\\\"5\\\"},{\\\"extra\\\":\\\"\\\",\\\"backgroundcolor\\\":\\\"ffffffff\\\"}]}\",\"content\":\"Next Slide\",\"nowrap\":\"1\",\"fullwidth\":\"0\",\"href\":\"NextSlide[]\",\"href-target\":\"_self\",\"href-rel\":\"\",\"class\":\"\",\"icon\":\"\",\"iconsize\":\"100\",\"iconspacing\":\"30\",\"iconplacement\":\"left\"}}}]},{\"type\":\"col\",\"pm\":\"default\",\"desktopportraitfontsize\":100,\"desktopportraitmaxwidth\":0,\"desktopportraitinneralign\":\"left\",\"desktopportraitpadding\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitorder\":0,\"mobileportraitinneralign\":\"center\",\"mobileportraitorder\":1,\"opened\":1,\"id\":\"\",\"uniqueclass\":\"n-uc-iYi6ZKk8yeVp\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"bgimage\":\"\",\"bgimagex\":50,\"bgimagey\":50,\"bgcolor\":\"00000000\",\"bgcolorgradient\":\"off\",\"bgcolorgradientend\":\"00000000\",\"verticalalign\":\"center\",\"colwidth\":\"3/5\",\"href\":\"\",\"href-target\":\"_self\",\"borderradius\":0,\"boxshadow\":\"0|*|0|*|0|*|0|*|00000080\",\"borderwidth\":\"0|*|0|*|0|*|0\",\"borderstyle\":\"solid\",\"bordercolor\":\"ffffffff\",\"name\":\"Column\",\"namesynced\":1,\"layers\":[{\"type\":\"layer\",\"pm\":\"normal\",\"desktopportraitfontsize\":100,\"desktopportraitmargin\":\"0|*|0|*|0|*|0|*|px\",\"desktopportraitheight\":0,\"desktopportraitmaxwidth\":0,\"desktopportraitselfalign\":\"inherit\",\"mobileportraitmaxwidth\":300,\"id\":\"\",\"uniqueclass\":\"\",\"generatorvisible\":\"\",\"zindex\":2,\"class\":\"\",\"crop\":\"visible\",\"rotation\":0,\"parallax\":0,\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"name\":\"Image\",\"namesynced\":1,\"item\":{\"type\":\"image\",\"values\":{\"image\":\"https://smartslider3.com/wp-content/uploads/slider424/buildanddesign.png\",\"href\":\"#\",\"href-target\":\"_self\",\"href-rel\":\"\",\"size\":\"auto|*|auto\",\"alt\":\"\",\"title\":\"\",\"href-class\":\"\"}}}]}]}]}]', '', 'https://smartslider3.com/wp-content/uploads/slider424/buildanddesign.jpg', '{\"type\":\"slide\",\"desktopportraitfontsize\":100,\"desktopportraitpadding\":\"10|*|60|*|10|*|60\",\"tabletportraitpadding\":\"10|*|50|*|10|*|50\",\"mobileportraitpadding\":\"10|*|10|*|35|*|10\",\"record-slides\":0,\"thumbnailType\":\"default\",\"static-slide\":0,\"slide-duration\":0,\"ligthboxImage\":\"\",\"background-animation\":\"\",\"background-animation-color\":\"333333ff\",\"background-animation-speed\":\"default\",\"desktopportrait\":1,\"desktoplandscape\":1,\"tabletportrait\":1,\"tabletlandscape\":1,\"mobileportrait\":1,\"mobilelandscape\":1,\"href\":\"\",\"href-target\":\"\",\"background-type\":\"image\",\"backgroundColor\":\"ffffff00\",\"backgroundGradient\":\"off\",\"backgroundColorEnd\":\"ffffff00\",\"backgroundColorOverlay\":0,\"backgroundImage\":\"https://smartslider3.com/wp-content/uploads/slider424/slide2.png\",\"backgroundFocusX\":50,\"backgroundFocusY\":50,\"backgroundImageOpacity\":100,\"backgroundImageBlur\":0,\"backgroundAlt\":\"\",\"backgroundTitle\":\"\",\"backgroundMode\":\"default\",\"guides\":\"eyJob3Jpem9udGFsIjpbXSwidmVydGljYWwiOltdfQ==\",\"version\":\"3.4.0\"}', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'SMKN1SURABAYA', 'yes'),
(4, 'blogdescription', 'Moto situs Anda bisa diletakkan di sini', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'aswinarung1@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:165:{s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:39:\"index.php?yoast-sitemap-xsl=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:13:\"anime-list/?$\";s:26:\"index.php?post_type=animes\";s:43:\"anime-list/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=animes&feed=$matches[1]\";s:38:\"anime-list/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=animes&feed=$matches[1]\";s:30:\"anime-list/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=animes&paged=$matches[1]\";s:11:\"articles/?$\";s:28:\"index.php?post_type=articles\";s:41:\"articles/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=articles&feed=$matches[1]\";s:36:\"articles/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=articles&feed=$matches[1]\";s:28:\"articles/page/([0-9]{1,})/?$\";s:46:\"index.php?post_type=articles&paged=$matches[1]\";s:55:\"(tak-berkategori)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:38:\"(tak-berkategori)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:20:\"(tak-berkategori)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:14:\"category/(.+)$\";s:45:\"index.php?wpseo_category_redirect=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:33:\"anime/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"anime/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"anime/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"anime/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"anime/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"anime/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"anime/([^/]+)/embed/?$\";s:39:\"index.php?animes=$matches[1]&embed=true\";s:26:\"anime/([^/]+)/trackback/?$\";s:33:\"index.php?animes=$matches[1]&tb=1\";s:46:\"anime/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?animes=$matches[1]&feed=$matches[2]\";s:41:\"anime/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?animes=$matches[1]&feed=$matches[2]\";s:34:\"anime/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?animes=$matches[1]&paged=$matches[2]\";s:41:\"anime/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?animes=$matches[1]&cpage=$matches[2]\";s:30:\"anime/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?animes=$matches[1]&page=$matches[2]\";s:22:\"anime/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"anime/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"anime/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"anime/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"anime/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"anime/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:40:\"post/article/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"post/article/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"post/article/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"post/article/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"post/article/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"post/article/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"post/article/([^/]+)/embed/?$\";s:41:\"index.php?articles=$matches[1]&embed=true\";s:33:\"post/article/([^/]+)/trackback/?$\";s:35:\"index.php?articles=$matches[1]&tb=1\";s:53:\"post/article/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?articles=$matches[1]&feed=$matches[2]\";s:48:\"post/article/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?articles=$matches[1]&feed=$matches[2]\";s:41:\"post/article/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?articles=$matches[1]&paged=$matches[2]\";s:48:\"post/article/([^/]+)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?articles=$matches[1]&cpage=$matches[2]\";s:37:\"post/article/([^/]+)(?:/([0-9]+))?/?$\";s:47:\"index.php?articles=$matches[1]&page=$matches[2]\";s:29:\"post/article/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"post/article/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"post/article/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"post/article/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"post/article/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"post/article/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:47:\"genres/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?genres=$matches[1]&feed=$matches[2]\";s:42:\"genres/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?genres=$matches[1]&feed=$matches[2]\";s:23:\"genres/([^/]+)/embed/?$\";s:39:\"index.php?genres=$matches[1]&embed=true\";s:35:\"genres/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?genres=$matches[1]&paged=$matches[2]\";s:17:\"genres/([^/]+)/?$\";s:28:\"index.php?genres=$matches[1]\";s:35:\"article/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"article/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"article/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"article/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"article/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"article/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"article/([^/]+)/embed/?$\";s:40:\"index.php?article=$matches[1]&embed=true\";s:28:\"article/([^/]+)/trackback/?$\";s:34:\"index.php?article=$matches[1]&tb=1\";s:36:\"article/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?article=$matches[1]&paged=$matches[2]\";s:43:\"article/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?article=$matches[1]&cpage=$matches[2]\";s:32:\"article/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?article=$matches[1]&page=$matches[2]\";s:24:\"article/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"article/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"article/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"article/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"article/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"article/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=19&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:7:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:51:\"all-in-one-wp-security-and-firewall/wp-security.php\";i:4;s:36:\"contact-form-7/wp-contact-form-7.php\";i:5;s:63:\"elegant-responsive-content-slider/responsive-content-slider.php\";i:6;s:19:\"jetpack/jetpack.php\";i:7;s:33:\"smart-slider-3/smart-slider-3.php\";i:8;s:24:\"wordpress-seo/wp-seo.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'blankslate', 'yes'),
(41, 'stylesheet', 'child', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '53496', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:0:{}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:2:{s:51:\"all-in-one-wp-security-and-firewall/wp-security.php\";a:2:{i:0;s:15:\"AIO_WP_Security\";i:1;s:17:\"uninstall_handler\";}s:24:\"wordpress-seo/wp-seo.php\";s:14:\"__return_false\";}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '19', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1681007203', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '53496', 'yes'),
(100, 'wp_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:86:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;s:23:\"rank_math_edit_htaccess\";b:1;s:16:\"rank_math_titles\";b:1;s:17:\"rank_math_general\";b:1;s:17:\"rank_math_sitemap\";b:1;s:21:\"rank_math_404_monitor\";b:1;s:22:\"rank_math_link_builder\";b:1;s:22:\"rank_math_redirections\";b:1;s:22:\"rank_math_role_manager\";b:1;s:19:\"rank_math_analytics\";b:1;s:23:\"rank_math_site_analysis\";b:1;s:25:\"rank_math_onpage_analysis\";b:1;s:24:\"rank_math_onpage_general\";b:1;s:25:\"rank_math_onpage_advanced\";b:1;s:24:\"rank_math_onpage_snippet\";b:1;s:23:\"rank_math_onpage_social\";b:1;s:20:\"rank_math_content_ai\";b:1;s:19:\"rank_math_admin_bar\";b:1;s:23:\"wf2fa_activate_2fa_self\";b:1;s:25:\"wf2fa_activate_2fa_others\";b:1;s:21:\"wf2fa_manage_settings\";b:1;s:11:\"smartslider\";b:1;s:18:\"smartslider_config\";b:1;s:16:\"smartslider_edit\";b:1;s:18:\"smartslider_delete\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:41:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:23:\"rank_math_site_analysis\";b:1;s:25:\"rank_math_onpage_analysis\";b:1;s:24:\"rank_math_onpage_general\";b:1;s:24:\"rank_math_onpage_snippet\";b:1;s:23:\"rank_math_onpage_social\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:14:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:25:\"rank_math_onpage_analysis\";b:1;s:24:\"rank_math_onpage_general\";b:1;s:24:\"rank_math_onpage_snippet\";b:1;s:23:\"rank_math_onpage_social\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"wpseo_manager\";a:2:{s:4:\"name\";s:11:\"SEO Manager\";s:12:\"capabilities\";a:38:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:20:\"wpseo_manage_options\";b:1;s:23:\"view_site_health_checks\";b:1;}}s:12:\"wpseo_editor\";a:2:{s:4:\"name\";s:10:\"SEO Editor\";s:12:\"capabilities\";a:36:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', '', 'yes'),
(103, 'user_count', '6', 'no'),
(104, 'widget_block', 'a:9:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:157:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Pos-pos Terbaru</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:228:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Komentar Terbaru</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:143:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Arsip</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:148:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Kategori</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}i:7;a:1:{s:7:\"content\";s:319:\"<!-- wp:social-links -->\n<ul class=\"wp-block-social-links\"><!-- wp:social-link {\"url\":\"http://instagram.com\",\"service\":\"instagram\"} /-->\n\n<!-- wp:social-link {\"url\":\"http://twitter.com\",\"service\":\"twitter\"} /-->\n\n<!-- wp:social-link {\"url\":\"http://facebook.com\",\"service\":\"facebook\"} /--></ul>\n<!-- /wp:social-links -->\";}i:8;a:1:{s:7:\"content\";s:298:\"<!-- wp:social-links -->\n<ul class=\"wp-block-social-links\"><!-- wp:social-link {\"url\":\"facebook.com\",\"service\":\"facebook\"} /-->\n\n<!-- wp:social-link {\"url\":\"instagram.com\",\"service\":\"instagram\"} /-->\n\n<!-- wp:social-link {\"url\":\"twitter.com\",\"service\":\"twitter\"} /--></ul>\n<!-- /wp:social-links -->\";}i:9;a:1:{s:7:\"content\";s:298:\"<!-- wp:social-links -->\n<ul class=\"wp-block-social-links\"><!-- wp:social-link {\"url\":\"facebook.com\",\"service\":\"facebook\"} /-->\n\n<!-- wp:social-link {\"url\":\"instagram.com\",\"service\":\"instagram\"} /-->\n\n<!-- wp:social-link {\"url\":\"twitter.com\",\"service\":\"twitter\"} /--></ul>\n<!-- /wp:social-links -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:3:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";i:2;s:7:\"block-8\";}s:6:\"social\";a:1:{i:0;s:7:\"block-9\";}s:19:\"primary-widget-area\";a:4:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-7\";}s:18:\"smartslider_area_1\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(106, 'cron', 'a:14:{i:1666769204;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1666769405;a:1:{s:26:\"aios_15_minutes_cron_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:21:\"aios-every-15-minutes\";s:4:\"args\";a:0:{}s:8:\"interval\";i:900;}}}i:1666771205;a:1:{s:24:\"aiowps_hourly_cron_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1666771217;a:1:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1666794404;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1666794423;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1666837604;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1666837623;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1666837625;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1666839605;a:1:{s:23:\"aiowps_daily_cron_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1666839617;a:1:{s:20:\"jetpack_v2_heartbeat\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1666839627;a:2:{s:13:\"wpseo-reindex\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:31:\"wpseo_permalink_structure_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1667356004;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'recovery_keys', 'a:1:{s:22:\"xoEQ7QUdbGmYsbJyYTtec2\";a:2:{s:10:\"hashed_key\";s:34:\"$P$BUFACskmkmU8J72nKIDlqERH4/hfSG.\";s:10:\"created_at\";i:1666758914;}}', 'yes'),
(123, 'theme_mods_twentytwentytwo', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1665458054;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(126, 'https_detection_errors', 'a:2:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}s:19:\"bad_response_source\";a:1:{i:0;s:55:\"It looks like the response did not come from this site.\";}}', 'yes'),
(144, 'can_compress_scripts', '1', 'no'),
(159, 'finished_updating_comment_type', '1', 'yes'),
(186, 'recently_activated', 'a:0:{}', 'yes'),
(190, 'aio_wp_security_configs', 'a:101:{s:19:\"aiowps_enable_debug\";s:0:\"\";s:36:\"aiowps_enable_php_backtrace_in_email\";s:0:\"\";s:36:\"aiowps_remove_wp_generator_meta_info\";s:0:\"\";s:25:\"aiowps_prevent_hotlinking\";s:0:\"\";s:28:\"aiowps_enable_login_lockdown\";s:0:\"\";s:28:\"aiowps_allow_unlock_requests\";s:1:\"1\";s:25:\"aiowps_max_login_attempts\";s:1:\"3\";s:24:\"aiowps_retry_time_period\";s:1:\"5\";s:26:\"aiowps_lockout_time_length\";s:1:\"5\";s:30:\"aiowps_max_lockout_time_length\";s:2:\"60\";s:28:\"aiowps_set_generic_login_msg\";s:0:\"\";s:26:\"aiowps_enable_email_notify\";s:0:\"\";s:20:\"aiowps_email_address\";s:21:\"aswinarung1@gmail.com\";s:27:\"aiowps_enable_forced_logout\";s:0:\"\";s:25:\"aiowps_logout_time_period\";s:2:\"60\";s:39:\"aiowps_enable_invalid_username_lockdown\";s:0:\"\";s:43:\"aiowps_instantly_lockout_specific_usernames\";a:0:{}s:32:\"aiowps_unlock_request_secret_key\";s:20:\"9gt3osdf5y1kx3m9xgek\";s:35:\"aiowps_lockdown_enable_whitelisting\";s:0:\"\";s:36:\"aiowps_lockdown_allowed_ip_addresses\";s:0:\"\";s:26:\"aiowps_enable_whitelisting\";s:0:\"\";s:27:\"aiowps_allowed_ip_addresses\";s:0:\"\";s:27:\"aiowps_enable_login_captcha\";s:0:\"\";s:34:\"aiowps_enable_custom_login_captcha\";s:0:\"\";s:31:\"aiowps_enable_woo_login_captcha\";s:0:\"\";s:34:\"aiowps_enable_woo_register_captcha\";s:0:\"\";s:38:\"aiowps_enable_woo_lostpassword_captcha\";s:0:\"\";s:25:\"aiowps_captcha_secret_key\";s:20:\"e159jpr8cshio0ofksfw\";s:42:\"aiowps_enable_manual_registration_approval\";s:0:\"\";s:39:\"aiowps_enable_registration_page_captcha\";s:0:\"\";s:35:\"aiowps_enable_registration_honeypot\";s:0:\"\";s:27:\"aiowps_enable_random_prefix\";s:0:\"\";s:31:\"aiowps_enable_automated_backups\";s:0:\"\";s:26:\"aiowps_db_backup_frequency\";s:1:\"4\";s:25:\"aiowps_db_backup_interval\";s:1:\"2\";s:26:\"aiowps_backup_files_stored\";s:1:\"2\";s:32:\"aiowps_send_backup_email_address\";s:0:\"\";s:27:\"aiowps_backup_email_address\";s:21:\"aswinarung1@gmail.com\";s:27:\"aiowps_disable_file_editing\";s:0:\"\";s:37:\"aiowps_prevent_default_wp_file_access\";s:0:\"\";s:22:\"aiowps_system_log_file\";s:9:\"error_log\";s:26:\"aiowps_enable_blacklisting\";s:0:\"\";s:26:\"aiowps_banned_ip_addresses\";s:0:\"\";s:28:\"aiowps_enable_basic_firewall\";s:0:\"\";s:27:\"aiowps_max_file_upload_size\";s:2:\"10\";s:31:\"aiowps_enable_pingback_firewall\";s:0:\"\";s:38:\"aiowps_disable_xmlrpc_pingback_methods\";s:0:\"\";s:34:\"aiowps_block_debug_log_file_access\";s:0:\"\";s:26:\"aiowps_disable_index_views\";s:0:\"\";s:30:\"aiowps_disable_trace_and_track\";s:0:\"\";s:28:\"aiowps_forbid_proxy_comments\";s:0:\"\";s:29:\"aiowps_deny_bad_query_strings\";s:0:\"\";s:34:\"aiowps_advanced_char_string_filter\";s:0:\"\";s:25:\"aiowps_enable_5g_firewall\";s:0:\"\";s:25:\"aiowps_enable_6g_firewall\";s:0:\"\";s:26:\"aiowps_enable_custom_rules\";s:0:\"\";s:32:\"aiowps_place_custom_rules_at_top\";s:0:\"\";s:19:\"aiowps_custom_rules\";s:0:\"\";s:25:\"aiowps_enable_404_logging\";s:0:\"\";s:28:\"aiowps_enable_404_IP_lockout\";s:0:\"\";s:30:\"aiowps_404_lockout_time_length\";s:2:\"60\";s:28:\"aiowps_404_lock_redirect_url\";s:16:\"http://127.0.0.1\";s:31:\"aiowps_enable_rename_login_page\";s:1:\"1\";s:28:\"aiowps_enable_login_honeypot\";s:0:\"\";s:35:\"aiowps_disable_application_password\";s:1:\"1\";s:43:\"aiowps_enable_brute_force_attack_prevention\";s:0:\"\";s:30:\"aiowps_brute_force_secret_word\";s:0:\"\";s:24:\"aiowps_cookie_brute_test\";s:0:\"\";s:44:\"aiowps_cookie_based_brute_force_redirect_url\";s:16:\"http://127.0.0.1\";s:59:\"aiowps_brute_force_attack_prevention_pw_protected_exception\";s:0:\"\";s:51:\"aiowps_brute_force_attack_prevention_ajax_exception\";s:0:\"\";s:19:\"aiowps_site_lockout\";s:0:\"\";s:23:\"aiowps_site_lockout_msg\";s:0:\"\";s:30:\"aiowps_enable_spambot_blocking\";s:0:\"\";s:29:\"aiowps_enable_comment_captcha\";s:0:\"\";s:31:\"aiowps_enable_autoblock_spam_ip\";s:0:\"\";s:33:\"aiowps_spam_ip_min_comments_block\";s:0:\"\";s:33:\"aiowps_enable_bp_register_captcha\";s:0:\"\";s:35:\"aiowps_enable_bbp_new_topic_captcha\";s:0:\"\";s:33:\"aiowps_enable_trash_spam_comments\";s:0:\"\";s:37:\"aiowps_trash_spam_comments_after_days\";s:2:\"14\";s:32:\"aiowps_enable_automated_fcd_scan\";s:0:\"\";s:25:\"aiowps_fcd_scan_frequency\";s:1:\"4\";s:24:\"aiowps_fcd_scan_interval\";s:1:\"2\";s:28:\"aiowps_fcd_exclude_filetypes\";s:0:\"\";s:24:\"aiowps_fcd_exclude_files\";s:0:\"\";s:26:\"aiowps_send_fcd_scan_email\";s:0:\"\";s:29:\"aiowps_fcd_scan_email_address\";s:21:\"aswinarung1@gmail.com\";s:27:\"aiowps_fcds_change_detected\";b:0;s:22:\"aiowps_copy_protection\";s:0:\"\";s:40:\"aiowps_prevent_site_display_inside_frame\";s:0:\"\";s:32:\"aiowps_prevent_users_enumeration\";s:0:\"\";s:42:\"aiowps_disallow_unauthorized_rest_requests\";s:0:\"\";s:25:\"aiowps_recaptcha_site_key\";s:0:\"\";s:27:\"aiowps_recaptcha_secret_key\";s:0:\"\";s:24:\"aiowps_default_recaptcha\";s:0:\"\";s:36:\"aiowps_on_uninstall_delete_db_tables\";s:1:\"1\";s:34:\"aiowps_on_uninstall_delete_configs\";s:1:\"1\";s:12:\"installed-at\";i:1665457205;s:25:\"aiowps_ip_retrieve_method\";i:0;s:22:\"aiowps_login_page_slug\";s:6:\"admeen\";}', 'yes'),
(191, 'aiowpsec_db_version', '1.9.6', 'yes'),
(195, 'updraft_lock_aios_15_minutes_cron_event', '0', 'no'),
(196, 'simba_tfa_priv_key_format', '1', 'no'),
(197, 'jetpack_activated', '1', 'yes'),
(200, 'jetpack_activation_source', 'a:2:{i:0;s:4:\"list\";i:1;N;}', 'yes'),
(201, 'jetpack_sync_settings_disable', '0', 'yes'),
(202, 'jetpack_options', 'a:5:{s:7:\"version\";s:15:\"11.4:1665457217\";s:11:\"old_version\";s:15:\"11.4:1665457217\";s:28:\"fallback_no_verify_ssl_certs\";i:0;s:9:\"time_diff\";i:0;s:14:\"last_heartbeat\";i:1666742600;}', 'yes'),
(203, '_transient_timeout_jetpack_file_data_11.4', '1667962817', 'no'),
(204, '_transient_jetpack_file_data_11.4', 'a:1:{s:32:\"3fd340ad52927afb3bbb9e98575eccfd\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:24:\"requires_user_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}}', 'no'),
(205, 'jetpack_available_modules', 'a:1:{s:4:\"11.4\";a:46:{s:10:\"action-bar\";s:4:\"11.4\";s:8:\"carousel\";s:3:\"1.5\";s:13:\"comment-likes\";s:3:\"5.1\";s:8:\"comments\";s:3:\"1.4\";s:12:\"contact-form\";s:3:\"1.3\";s:9:\"copy-post\";s:3:\"7.0\";s:20:\"custom-content-types\";s:3:\"3.1\";s:10:\"custom-css\";s:3:\"1.7\";s:21:\"enhanced-distribution\";s:3:\"1.2\";s:16:\"google-analytics\";s:3:\"4.5\";s:12:\"google-fonts\";s:6:\"10.8.0\";s:19:\"gravatar-hovercards\";s:3:\"1.1\";s:15:\"infinite-scroll\";s:3:\"2.0\";s:8:\"json-api\";s:3:\"1.9\";s:5:\"latex\";s:3:\"1.1\";s:11:\"lazy-images\";s:5:\"5.6.0\";s:5:\"likes\";s:3:\"2.2\";s:8:\"markdown\";s:3:\"2.8\";s:9:\"masterbar\";s:3:\"4.8\";s:7:\"monitor\";s:3:\"2.6\";s:5:\"notes\";s:3:\"1.9\";s:10:\"photon-cdn\";s:3:\"6.6\";s:6:\"photon\";s:3:\"2.0\";s:13:\"post-by-email\";s:3:\"2.0\";s:9:\"post-list\";s:4:\"11.3\";s:7:\"protect\";s:3:\"3.4\";s:9:\"publicize\";s:3:\"2.0\";s:13:\"related-posts\";s:3:\"2.9\";s:6:\"search\";s:3:\"5.0\";s:9:\"seo-tools\";s:3:\"4.4\";s:10:\"sharedaddy\";s:3:\"1.1\";s:10:\"shortcodes\";s:3:\"1.1\";s:10:\"shortlinks\";s:3:\"1.1\";s:8:\"sitemaps\";s:3:\"3.9\";s:3:\"sso\";s:3:\"2.6\";s:5:\"stats\";s:3:\"1.1\";s:13:\"subscriptions\";s:3:\"1.2\";s:13:\"tiled-gallery\";s:3:\"2.1\";s:10:\"vaultpress\";s:5:\"0:1.2\";s:18:\"verification-tools\";s:3:\"3.0\";s:10:\"videopress\";s:3:\"2.5\";s:3:\"waf\";s:4:\"10.9\";s:17:\"widget-visibility\";s:3:\"2.4\";s:7:\"widgets\";s:3:\"1.2\";s:21:\"woocommerce-analytics\";s:3:\"8.4\";s:7:\"wordads\";s:5:\"4.5.0\";}}', 'yes'),
(206, '_transient_jetpack_autoloader_plugin_paths', 'a:1:{i:0;s:25:\"{{WP_PLUGIN_DIR}}/jetpack\";}', 'yes'),
(207, 'jetpack_connection_active_plugins', 'a:1:{s:7:\"jetpack\";a:1:{s:4:\"name\";s:7:\"Jetpack\";}}', 'yes'),
(208, 'jetpack_testimonial', '0', 'yes'),
(210, 'do_activate', '0', 'yes'),
(215, 'yoast_migrations_free', 'a:1:{s:7:\"version\";s:6:\"19.7.2\";}', 'yes'),
(216, 'wpseo', 'a:96:{s:8:\"tracking\";b:0;s:22:\"license_server_version\";b:0;s:15:\"ms_defaults_set\";b:0;s:40:\"ignore_search_engines_discouraged_notice\";b:0;s:19:\"indexing_first_time\";b:1;s:16:\"indexing_started\";b:0;s:15:\"indexing_reason\";s:21:\"category_base_changed\";s:29:\"indexables_indexing_completed\";b:1;s:13:\"index_now_key\";s:0:\"\";s:7:\"version\";s:6:\"19.7.2\";s:16:\"previous_version\";s:0:\"\";s:20:\"disableadvanced_meta\";b:1;s:30:\"enable_headless_rest_endpoints\";b:1;s:17:\"ryte_indexability\";b:0;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:34:\"inclusive_language_analysis_active\";b:0;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:16:\"enable_index_now\";b:1;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1665457228;s:13:\"myyoast-oauth\";b:0;s:26:\"semrush_integration_active\";b:1;s:14:\"semrush_tokens\";a:0:{}s:20:\"semrush_country_code\";s:2:\"us\";s:19:\"permalink_structure\";s:36:\"/%year%/%monthnum%/%day%/%postname%/\";s:8:\"home_url\";s:26:\"http://localhost/wordpress\";s:18:\"dynamic_permalinks\";b:0;s:17:\"category_base_url\";s:0:\"\";s:12:\"tag_base_url\";s:0:\"\";s:21:\"custom_taxonomy_slugs\";a:0:{}s:29:\"enable_enhanced_slack_sharing\";b:1;s:25:\"zapier_integration_active\";b:0;s:19:\"zapier_subscription\";a:0:{}s:14:\"zapier_api_key\";s:0:\"\";s:23:\"enable_metabox_insights\";b:1;s:23:\"enable_link_suggestions\";b:1;s:26:\"algolia_integration_active\";b:0;s:14:\"import_cursors\";a:0:{}s:13:\"workouts_data\";a:1:{s:13:\"configuration\";a:1:{s:13:\"finishedSteps\";a:0:{}}}s:28:\"configuration_finished_steps\";a:0:{}s:36:\"dismiss_configuration_workout_notice\";b:0;s:34:\"dismiss_premium_deactivated_notice\";b:0;s:19:\"importing_completed\";a:0:{}s:26:\"wincher_integration_active\";b:1;s:14:\"wincher_tokens\";a:0:{}s:36:\"wincher_automatically_add_keyphrases\";b:0;s:18:\"wincher_website_id\";s:0:\"\";s:28:\"wordproof_integration_active\";b:0;s:29:\"wordproof_integration_changed\";b:0;s:18:\"first_time_install\";b:1;s:34:\"should_redirect_after_install_free\";b:0;s:34:\"activation_redirect_timestamp_free\";i:1665457230;s:18:\"remove_feed_global\";b:0;s:27:\"remove_feed_global_comments\";b:0;s:25:\"remove_feed_post_comments\";b:0;s:19:\"remove_feed_authors\";b:0;s:22:\"remove_feed_categories\";b:0;s:16:\"remove_feed_tags\";b:0;s:29:\"remove_feed_custom_taxonomies\";b:0;s:22:\"remove_feed_post_types\";b:0;s:18:\"remove_feed_search\";b:0;s:21:\"remove_atom_rdf_feeds\";b:0;s:17:\"remove_shortlinks\";b:0;s:21:\"remove_rest_api_links\";b:0;s:20:\"remove_rsd_wlw_links\";b:0;s:19:\"remove_oembed_links\";b:0;s:16:\"remove_generator\";b:0;s:20:\"remove_emoji_scripts\";b:0;s:24:\"remove_powered_by_header\";b:0;s:22:\"remove_pingback_header\";b:0;s:28:\"clean_campaign_tracking_urls\";b:0;s:16:\"clean_permalinks\";b:0;s:32:\"clean_permalinks_extra_variables\";s:0:\"\";s:14:\"search_cleanup\";b:0;s:20:\"search_cleanup_emoji\";b:0;s:23:\"search_cleanup_patterns\";b:0;s:22:\"search_character_limit\";i:50;s:20:\"deny_search_crawling\";b:0;s:21:\"deny_wp_json_crawling\";b:0;s:29:\"least_readability_ignore_list\";a:0:{}s:27:\"least_seo_score_ignore_list\";a:0:{}s:23:\"most_linked_ignore_list\";a:0:{}s:24:\"least_linked_ignore_list\";a:0:{}s:28:\"indexables_page_reading_list\";a:5:{i:0;b:0;i:1;b:0;i:2;b:0;i:3;b:0;i:4;b:0;}s:25:\"indexables_overview_state\";s:21:\"dashboard-not-visited\";}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(217, 'wpseo_titles', 'a:135:{s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:44:\"%%name%%, Pengarang di %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:59:\"Anda mencari %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:42:\"Laman tidak ditemukan %%sep%% %%sitename%%\";s:25:\"social-title-author-wpseo\";s:8:\"%%name%%\";s:26:\"social-title-archive-wpseo\";s:8:\"%%date%%\";s:31:\"social-description-author-wpseo\";s:0:\"\";s:32:\"social-description-archive-wpseo\";s:0:\"\";s:29:\"social-image-url-author-wpseo\";s:0:\"\";s:30:\"social-image-url-archive-wpseo\";s:0:\"\";s:28:\"social-image-id-author-wpseo\";i:0;s:29:\"social-image-id-archive-wpseo\";i:0;s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:59:\"Artikel %%POSTLINK%% pertama kali tampil pada %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:20:\"breadcrumbs-404crumb\";s:32:\"Galat 404: Laman tidak ditemukan\";s:29:\"breadcrumbs-display-blog-page\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:11:\"Arsip untuk\";s:18:\"breadcrumbs-enable\";b:1;s:16:\"breadcrumbs-home\";s:7:\"Beranda\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:12:\"Anda mencari\";s:15:\"breadcrumbs-sep\";s:2:\"»\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:11:\"person_logo\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:7:\"company\";s:25:\"company_or_person_user_id\";b:0;s:17:\"stripcategorybase\";b:1;s:26:\"open_graph_frontpage_title\";s:12:\"%%sitename%%\";s:25:\"open_graph_frontpage_desc\";s:0:\"\";s:26:\"open_graph_frontpage_image\";s:0:\"\";s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:23:\"post_types-post-maintax\";i:0;s:21:\"schema-page-type-post\";s:7:\"WebPage\";s:24:\"schema-article-type-post\";s:7:\"Article\";s:17:\"social-title-post\";s:9:\"%%title%%\";s:23:\"social-description-post\";s:0:\"\";s:21:\"social-image-url-post\";s:0:\"\";s:20:\"social-image-id-post\";i:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:23:\"post_types-page-maintax\";s:1:\"0\";s:21:\"schema-page-type-page\";s:7:\"WebPage\";s:24:\"schema-article-type-page\";s:4:\"None\";s:17:\"social-title-page\";s:9:\"%%title%%\";s:23:\"social-description-page\";s:0:\"\";s:21:\"social-image-url-page\";s:0:\"\";s:20:\"social-image-id-page\";i:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:29:\"post_types-attachment-maintax\";s:1:\"0\";s:27:\"schema-page-type-attachment\";s:7:\"WebPage\";s:30:\"schema-article-type-attachment\";s:4:\"None\";s:18:\"title-tax-category\";s:50:\"%%term_title%% Arsip %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:25:\"social-title-tax-category\";s:20:\"%%term_title%% Arsip\";s:31:\"social-description-tax-category\";s:0:\"\";s:29:\"social-image-url-tax-category\";s:0:\"\";s:28:\"social-image-id-tax-category\";i:0;s:18:\"title-tax-post_tag\";s:50:\"%%term_title%% Arsip %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:25:\"social-title-tax-post_tag\";s:20:\"%%term_title%% Arsip\";s:31:\"social-description-tax-post_tag\";s:0:\"\";s:29:\"social-image-url-tax-post_tag\";s:0:\"\";s:28:\"social-image-id-tax-post_tag\";i:0;s:21:\"title-tax-post_format\";s:50:\"%%term_title%% Arsip %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:0;s:23:\"noindex-tax-post_format\";b:1;s:28:\"social-title-tax-post_format\";s:20:\"%%term_title%% Arsip\";s:34:\"social-description-tax-post_format\";s:0:\"\";s:32:\"social-image-url-tax-post_format\";s:0:\"\";s:31:\"social-image-id-tax-post_format\";i:0;s:10:\"title-news\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-news\";s:0:\"\";s:12:\"noindex-news\";b:0;s:23:\"display-metabox-pt-news\";b:1;s:23:\"post_types-news-maintax\";i:0;s:21:\"schema-page-type-news\";s:7:\"WebPage\";s:24:\"schema-article-type-news\";s:4:\"None\";s:17:\"social-title-news\";s:9:\"%%title%%\";s:23:\"social-description-news\";s:0:\"\";s:21:\"social-image-url-news\";s:0:\"\";s:20:\"social-image-id-news\";i:0;s:20:\"title-ptarchive-news\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:23:\"metadesc-ptarchive-news\";s:0:\"\";s:22:\"bctitle-ptarchive-news\";s:0:\"\";s:22:\"noindex-ptarchive-news\";b:0;s:27:\"social-title-ptarchive-news\";s:21:\"%%pt_plural%% Archive\";s:33:\"social-description-ptarchive-news\";s:0:\"\";s:31:\"social-image-url-ptarchive-news\";s:0:\"\";s:30:\"social-image-id-ptarchive-news\";i:0;s:23:\"title-tax-news-category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:26:\"metadesc-tax-news-category\";s:0:\"\";s:33:\"display-metabox-tax-news-category\";b:1;s:25:\"noindex-tax-news-category\";b:0;s:30:\"social-title-tax-news-category\";s:23:\"%%term_title%% Archives\";s:36:\"social-description-tax-news-category\";s:0:\"\";s:34:\"social-image-url-tax-news-category\";s:0:\"\";s:33:\"social-image-id-tax-news-category\";i:0;s:31:\"taxonomy-news-category-ptparent\";i:0;s:14:\"person_logo_id\";i:0;s:15:\"company_logo_id\";i:0;s:29:\"open_graph_frontpage_image_id\";i:0;s:26:\"taxonomy-category-ptparent\";s:1:\"0\";s:26:\"taxonomy-post_tag-ptparent\";s:1:\"0\";s:29:\"taxonomy-post_format-ptparent\";s:1:\"0\";}', 'yes'),
(218, 'wpseo_social', 'a:19:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:13:\"wikipedia_url\";s:0:\"\";s:17:\"other_social_urls\";a:0:{}}', 'yes'),
(246, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.6.3\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1665457243;s:7:\"version\";s:5:\"5.6.3\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(247, 'action_scheduler_hybrid_store_demarkation', '7', 'yes'),
(248, 'schema-ActionScheduler_StoreSchema', '6.0.1665457252', 'yes'),
(249, 'schema-ActionScheduler_LoggerSchema', '3.0.1665457252', 'yes'),
(250, 'rank_math_known_post_types', 'a:3:{s:4:\"post\";s:4:\"post\";s:4:\"page\";s:4:\"page\";s:10:\"attachment\";s:10:\"attachment\";}', 'yes'),
(251, 'rank_math_modules', 'a:13:{i:0;s:12:\"link-counter\";i:1;s:9:\"analytics\";i:2;s:12:\"seo-analysis\";i:3;s:7:\"sitemap\";i:4;s:12:\"rich-snippet\";i:5;s:11:\"woocommerce\";i:6;s:10:\"buddypress\";i:7;s:7:\"bbpress\";i:8;s:3:\"acf\";i:9;s:11:\"web-stories\";i:10;s:10:\"content-ai\";i:11;s:16:\"instant-indexing\";i:12;s:12:\"role-manager\";}', 'yes'),
(252, 'rank-math-options-general', 'a:42:{s:19:\"strip_category_base\";s:3:\"off\";s:24:\"attachment_redirect_urls\";s:2:\"on\";s:27:\"attachment_redirect_default\";s:26:\"http://localhost/wordpress\";s:23:\"nofollow_external_links\";s:3:\"off\";s:20:\"nofollow_image_links\";s:3:\"off\";s:25:\"new_window_external_links\";s:2:\"on\";s:11:\"add_img_alt\";s:3:\"off\";s:14:\"img_alt_format\";s:11:\" %filename%\";s:13:\"add_img_title\";s:3:\"off\";s:16:\"img_title_format\";s:22:\"%title% %count(title)%\";s:11:\"breadcrumbs\";s:3:\"off\";s:21:\"breadcrumbs_separator\";s:1:\"-\";s:16:\"breadcrumbs_home\";s:2:\"on\";s:22:\"breadcrumbs_home_label\";s:4:\"Home\";s:26:\"breadcrumbs_archive_format\";s:15:\"Archives for %s\";s:25:\"breadcrumbs_search_format\";s:14:\"Results for %s\";s:21:\"breadcrumbs_404_label\";s:25:\"404 Error: page not found\";s:31:\"breadcrumbs_ancestor_categories\";s:3:\"off\";s:21:\"breadcrumbs_blog_page\";s:3:\"off\";s:16:\"404_monitor_mode\";s:6:\"simple\";s:17:\"404_monitor_limit\";i:100;s:35:\"404_monitor_ignore_query_parameters\";s:2:\"on\";s:24:\"redirections_header_code\";s:3:\"301\";s:18:\"redirections_debug\";s:3:\"off\";s:23:\"console_caching_control\";s:2:\"90\";s:21:\"console_email_reports\";s:2:\"on\";s:23:\"console_email_frequency\";s:7:\"monthly\";s:27:\"link_builder_links_per_page\";s:1:\"7\";s:29:\"link_builder_links_per_target\";s:1:\"1\";s:22:\"wc_remove_product_base\";s:3:\"off\";s:23:\"wc_remove_category_base\";s:3:\"off\";s:31:\"wc_remove_category_parent_slugs\";s:3:\"off\";s:18:\"rss_before_content\";s:0:\"\";s:17:\"rss_after_content\";s:0:\"\";s:19:\"wc_remove_generator\";s:2:\"on\";s:24:\"remove_shop_snippet_data\";s:2:\"on\";s:18:\"frontend_seo_score\";s:3:\"off\";s:29:\"frontend_seo_score_post_types\";a:1:{i:0;s:4:\"post\";}s:27:\"frontend_seo_score_position\";s:3:\"top\";s:10:\"setup_mode\";s:8:\"advanced\";s:21:\"content_ai_post_types\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:15:\"analytics_stats\";s:2:\"on\";}', 'yes'),
(253, 'rank-math-options-titles', 'a:104:{s:24:\"noindex_empty_taxonomies\";s:2:\"on\";s:15:\"title_separator\";s:1:\"-\";s:17:\"capitalize_titles\";s:3:\"off\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:19:\"knowledgegraph_type\";s:6:\"person\";s:19:\"knowledgegraph_name\";s:13:\"SMKN1SURABAYA\";s:19:\"local_business_type\";s:12:\"Organization\";s:20:\"local_address_format\";s:43:\"{address} {locality}, {region} {postalcode}\";s:13:\"opening_hours\";a:7:{i:0;a:2:{s:3:\"day\";s:6:\"Monday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:1;a:2:{s:3:\"day\";s:7:\"Tuesday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:2;a:2:{s:3:\"day\";s:9:\"Wednesday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:3;a:2:{s:3:\"day\";s:8:\"Thursday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:4;a:2:{s:3:\"day\";s:6:\"Friday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:5;a:2:{s:3:\"day\";s:8:\"Saturday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:6;a:2:{s:3:\"day\";s:6:\"Sunday\";s:4:\"time\";s:11:\"09:00-17:00\";}}s:20:\"opening_hours_format\";s:3:\"off\";s:14:\"homepage_title\";s:34:\"%sitename% %page% %sep% %sitedesc%\";s:20:\"homepage_description\";s:0:\"\";s:22:\"homepage_custom_robots\";s:3:\"off\";s:23:\"disable_author_archives\";s:3:\"off\";s:15:\"url_author_base\";s:6:\"author\";s:20:\"author_custom_robots\";s:2:\"on\";s:13:\"author_robots\";a:1:{i:0;s:7:\"noindex\";}s:20:\"author_archive_title\";s:30:\"%name% %sep% %sitename% %page%\";s:19:\"author_add_meta_box\";s:2:\"on\";s:21:\"disable_date_archives\";s:2:\"on\";s:18:\"date_archive_title\";s:30:\"%date% %page% %sep% %sitename%\";s:12:\"search_title\";s:38:\"%search_query% %page% %sep% %sitename%\";s:9:\"404_title\";s:31:\"Page Not Found %sep% %sitename%\";s:19:\"date_archive_robots\";a:1:{i:0;s:7:\"noindex\";}s:14:\"noindex_search\";s:2:\"on\";s:24:\"noindex_archive_subpages\";s:3:\"off\";s:26:\"noindex_password_protected\";s:3:\"off\";s:32:\"pt_download_default_rich_snippet\";s:7:\"product\";s:29:\"author_slack_enhanced_sharing\";s:2:\"on\";s:13:\"pt_post_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_post_description\";s:9:\"%excerpt%\";s:14:\"pt_post_robots\";a:0:{}s:21:\"pt_post_custom_robots\";s:3:\"off\";s:28:\"pt_post_default_rich_snippet\";s:7:\"article\";s:28:\"pt_post_default_article_type\";s:11:\"BlogPosting\";s:28:\"pt_post_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_post_default_snippet_desc\";s:17:\"%seo_description%\";s:30:\"pt_post_slack_enhanced_sharing\";s:2:\"on\";s:17:\"pt_post_ls_use_fk\";s:6:\"titles\";s:20:\"pt_post_add_meta_box\";s:2:\"on\";s:20:\"pt_post_bulk_editing\";s:7:\"editing\";s:24:\"pt_post_link_suggestions\";s:2:\"on\";s:24:\"pt_post_primary_taxonomy\";s:8:\"category\";s:13:\"pt_page_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_page_description\";s:9:\"%excerpt%\";s:14:\"pt_page_robots\";a:0:{}s:21:\"pt_page_custom_robots\";s:3:\"off\";s:28:\"pt_page_default_rich_snippet\";s:7:\"article\";s:28:\"pt_page_default_article_type\";s:7:\"Article\";s:28:\"pt_page_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_page_default_snippet_desc\";s:17:\"%seo_description%\";s:30:\"pt_page_slack_enhanced_sharing\";s:2:\"on\";s:17:\"pt_page_ls_use_fk\";s:6:\"titles\";s:20:\"pt_page_add_meta_box\";s:2:\"on\";s:20:\"pt_page_bulk_editing\";s:7:\"editing\";s:24:\"pt_page_link_suggestions\";s:2:\"on\";s:19:\"pt_attachment_title\";s:24:\"%title% %sep% %sitename%\";s:25:\"pt_attachment_description\";s:9:\"%excerpt%\";s:20:\"pt_attachment_robots\";a:1:{i:0;s:7:\"noindex\";}s:27:\"pt_attachment_custom_robots\";s:2:\"on\";s:34:\"pt_attachment_default_rich_snippet\";s:3:\"off\";s:34:\"pt_attachment_default_article_type\";s:7:\"Article\";s:34:\"pt_attachment_default_snippet_name\";s:11:\"%seo_title%\";s:34:\"pt_attachment_default_snippet_desc\";s:17:\"%seo_description%\";s:36:\"pt_attachment_slack_enhanced_sharing\";s:3:\"off\";s:26:\"pt_attachment_add_meta_box\";s:3:\"off\";s:16:\"pt_product_title\";s:24:\"%title% %sep% %sitename%\";s:22:\"pt_product_description\";s:9:\"%excerpt%\";s:17:\"pt_product_robots\";a:0:{}s:24:\"pt_product_custom_robots\";s:3:\"off\";s:31:\"pt_product_default_rich_snippet\";s:7:\"product\";s:31:\"pt_product_default_article_type\";s:7:\"Article\";s:31:\"pt_product_default_snippet_name\";s:11:\"%seo_title%\";s:31:\"pt_product_default_snippet_desc\";s:17:\"%seo_description%\";s:33:\"pt_product_slack_enhanced_sharing\";s:2:\"on\";s:20:\"pt_product_ls_use_fk\";s:6:\"titles\";s:23:\"pt_product_add_meta_box\";s:2:\"on\";s:23:\"pt_product_bulk_editing\";s:7:\"editing\";s:27:\"pt_product_link_suggestions\";s:2:\"on\";s:27:\"pt_product_primary_taxonomy\";s:11:\"product_cat\";s:18:\"pt_web-story_title\";s:24:\"%title% %sep% %sitename%\";s:24:\"pt_web-story_description\";s:9:\"%excerpt%\";s:19:\"pt_web-story_robots\";a:0:{}s:26:\"pt_web-story_custom_robots\";s:3:\"off\";s:33:\"pt_web-story_default_rich_snippet\";s:7:\"article\";s:33:\"pt_web-story_default_article_type\";s:7:\"Article\";s:33:\"pt_web-story_default_snippet_name\";s:11:\"%seo_title%\";s:33:\"pt_web-story_default_snippet_desc\";s:17:\"%seo_description%\";s:35:\"pt_web-story_slack_enhanced_sharing\";s:3:\"off\";s:25:\"pt_web-story_add_meta_box\";s:3:\"off\";s:18:\"tax_category_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_category_robots\";a:0:{}s:25:\"tax_category_add_meta_box\";s:2:\"on\";s:26:\"tax_category_custom_robots\";s:3:\"off\";s:24:\"tax_category_description\";s:18:\"%term_description%\";s:35:\"tax_category_slack_enhanced_sharing\";s:2:\"on\";s:18:\"tax_post_tag_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_post_tag_robots\";a:1:{i:0;s:7:\"noindex\";}s:25:\"tax_post_tag_add_meta_box\";s:3:\"off\";s:26:\"tax_post_tag_custom_robots\";s:2:\"on\";s:24:\"tax_post_tag_description\";s:18:\"%term_description%\";s:35:\"tax_post_tag_slack_enhanced_sharing\";s:2:\"on\";s:31:\"remove_product_cat_snippet_data\";s:2:\"on\";s:31:\"remove_product_tag_snippet_data\";s:2:\"on\";}', 'yes'),
(254, 'rank-math-options-sitemap', 'a:12:{s:14:\"items_per_page\";i:200;s:14:\"include_images\";s:2:\"on\";s:22:\"include_featured_image\";s:3:\"off\";s:19:\"ping_search_engines\";s:2:\"on\";s:13:\"exclude_roles\";a:4:{s:11:\"contributor\";s:11:\"Contributor\";s:10:\"subscriber\";s:10:\"Subscriber\";s:13:\"wpseo_manager\";s:11:\"SEO Manager\";s:12:\"wpseo_editor\";s:10:\"SEO Editor\";}s:15:\"pt_post_sitemap\";s:2:\"on\";s:15:\"pt_page_sitemap\";s:2:\"on\";s:21:\"pt_attachment_sitemap\";s:3:\"off\";s:18:\"pt_product_sitemap\";s:2:\"on\";s:20:\"pt_web-story_sitemap\";s:3:\"off\";s:20:\"tax_category_sitemap\";s:2:\"on\";s:20:\"tax_post_tag_sitemap\";s:3:\"off\";}', 'yes'),
(255, 'rank-math-options-instant-indexing', 'a:2:{s:15:\"bing_post_types\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:16:\"indexnow_api_key\";s:32:\"dc85e7bc6205495e8573afb7d64eb403\";}', 'yes'),
(258, 'rank_math_version', '1.0.99', 'yes'),
(259, 'rank_math_db_version', '1', 'yes'),
(260, 'rank_math_install_date', '1665457252', 'yes'),
(262, 'action_scheduler_lock_async-request-runner', '1665457663', 'yes'),
(263, 'rank_math_notifications', 'a:1:{i:0;a:2:{s:7:\"message\";s:161:\"Please keep only one SEO plugin active, otherwise, you might lose your rankings and traffic. <a href=\"###DEACTIVATE_SEO_PLUGINS###\">Click here to Deactivate</a>.\";s:7:\"options\";a:5:{s:2:\"id\";s:23:\"conflicting_seo_plugins\";s:7:\"classes\";s:31:\"is-dismissible rank-math-notice\";s:4:\"type\";s:5:\"error\";s:6:\"screen\";s:3:\"any\";s:10:\"capability\";s:0:\"\";}}}', 'yes'),
(267, 'rank_math_registration_skip', '1', 'yes'),
(268, 'rank_math_review_notice_date', '1666666861', 'no'),
(269, 'rank_math_pro_notice_date', '1666321261', 'no'),
(270, 'rank_math_review_posts_converted', '1', 'yes'),
(271, '_transient_rank_math_first_submenu_id', 'rank-math', 'yes'),
(272, 'rank_math_content_ai_viewed', '1', 'yes'),
(273, 'rank_math_wizard_completed', '1', 'yes'),
(274, '_transient__rank_math_conflicting_plugins', 'a:1:{i:0;s:24:\"wordpress-seo/wp-seo.php\";}', 'yes'),
(277, 'rank_math_yoast_block_posts', 'a:2:{s:5:\"posts\";a:0:{}s:5:\"count\";i:0;}', 'yes'),
(278, 'rank_math_old_schema_data', 'a:0:{}', 'yes'),
(283, 'acf_version', '6.0.2', 'yes'),
(285, 'wfls_last_role_change', '1665457370', 'no'),
(286, 'wordfence_version', '7.7.1', 'yes'),
(287, 'wordfence_case', '1', 'yes'),
(288, 'wordfence_installed', '1', 'yes'),
(289, 'wordfenceActivated', '0', 'yes'),
(290, 'wf_plugin_act_error', '', 'yes'),
(297, 'autodescription-updates-cache', 'a:2:{s:26:\"check_seo_plugin_conflicts\";i:0;s:18:\"persistent_notices\";a:0:{}}', 'yes'),
(299, 'the_seo_framework_initial_db_version', '4200', 'no'),
(300, 'autodescription-site-settings', 'a:124:{s:18:\"alter_search_query\";i:1;s:19:\"alter_archive_query\";i:1;s:24:\"alter_archive_query_type\";s:8:\"in_query\";s:23:\"alter_search_query_type\";s:8:\"in_query\";s:13:\"cache_sitemap\";i:1;s:22:\"display_seo_bar_tables\";i:1;s:23:\"display_seo_bar_metabox\";i:0;s:15:\"seo_bar_symbols\";i:0;s:21:\"display_pixel_counter\";i:1;s:25:\"display_character_counter\";i:1;s:16:\"canonical_scheme\";s:9:\"automatic\";s:17:\"timestamps_format\";s:1:\"1\";s:19:\"disabled_post_types\";a:0:{}s:19:\"disabled_taxonomies\";a:0:{}s:10:\"site_title\";s:0:\"\";s:15:\"title_separator\";s:6:\"hyphen\";s:14:\"title_location\";s:5:\"right\";s:19:\"title_rem_additions\";i:0;s:18:\"title_rem_prefixes\";i:0;s:16:\"title_strip_tags\";i:1;s:16:\"auto_description\";i:1;s:14:\"author_noindex\";i:0;s:12:\"date_noindex\";i:1;s:14:\"search_noindex\";i:1;s:12:\"site_noindex\";i:0;s:18:\"noindex_post_types\";a:1:{s:10:\"attachment\";i:1;}s:18:\"noindex_taxonomies\";a:1:{s:11:\"post_format\";i:1;}s:15:\"author_nofollow\";i:0;s:13:\"date_nofollow\";i:0;s:15:\"search_nofollow\";i:0;s:13:\"site_nofollow\";i:0;s:19:\"nofollow_post_types\";a:0:{}s:19:\"nofollow_taxonomies\";a:0:{}s:16:\"author_noarchive\";i:0;s:14:\"date_noarchive\";i:0;s:16:\"search_noarchive\";i:0;s:14:\"site_noarchive\";i:0;s:20:\"noarchive_post_types\";a:0:{}s:20:\"noarchive_taxonomies\";a:0:{}s:25:\"advanced_query_protection\";i:1;s:13:\"paged_noindex\";i:0;s:18:\"home_paged_noindex\";i:0;s:24:\"set_copyright_directives\";i:1;s:18:\"max_snippet_length\";i:-1;s:17:\"max_image_preview\";s:5:\"large\";s:17:\"max_video_preview\";i:-1;s:16:\"homepage_noindex\";i:0;s:17:\"homepage_nofollow\";i:0;s:18:\"homepage_noarchive\";i:0;s:14:\"homepage_title\";s:0:\"\";s:16:\"homepage_tagline\";i:1;s:20:\"homepage_description\";s:0:\"\";s:22:\"homepage_title_tagline\";s:0:\"\";s:19:\"home_title_location\";s:5:\"right\";s:17:\"homepage_og_title\";s:0:\"\";s:23:\"homepage_og_description\";s:0:\"\";s:22:\"homepage_twitter_title\";s:0:\"\";s:28:\"homepage_twitter_description\";s:0:\"\";s:25:\"homepage_social_image_url\";s:0:\"\";s:24:\"homepage_social_image_id\";i:0;s:3:\"pta\";a:0:{}s:13:\"shortlink_tag\";i:0;s:15:\"prev_next_posts\";i:1;s:18:\"prev_next_archives\";i:1;s:19:\"prev_next_frontpage\";i:1;s:18:\"facebook_publisher\";s:0:\"\";s:15:\"facebook_author\";s:0:\"\";s:14:\"facebook_appid\";s:0:\"\";s:17:\"post_publish_time\";i:1;s:16:\"post_modify_time\";i:1;s:12:\"twitter_card\";s:19:\"summary_large_image\";s:12:\"twitter_site\";s:0:\"\";s:15:\"twitter_creator\";s:0:\"\";s:19:\"oembed_use_og_title\";i:0;s:23:\"oembed_use_social_image\";i:1;s:20:\"oembed_remove_author\";i:1;s:7:\"og_tags\";i:1;s:13:\"facebook_tags\";i:1;s:12:\"twitter_tags\";i:1;s:14:\"oembed_scripts\";i:1;s:26:\"social_title_rem_additions\";i:1;s:14:\"multi_og_image\";i:0;s:11:\"theme_color\";s:0:\"\";s:19:\"social_image_fb_url\";s:0:\"\";s:18:\"social_image_fb_id\";i:0;s:19:\"google_verification\";s:0:\"\";s:17:\"bing_verification\";s:0:\"\";s:19:\"yandex_verification\";s:0:\"\";s:18:\"baidu_verification\";s:0:\"\";s:17:\"pint_verification\";s:0:\"\";s:16:\"knowledge_output\";i:1;s:14:\"knowledge_type\";s:12:\"organization\";s:14:\"knowledge_logo\";i:1;s:14:\"knowledge_name\";s:0:\"\";s:18:\"knowledge_logo_url\";s:0:\"\";s:17:\"knowledge_logo_id\";i:0;s:18:\"knowledge_facebook\";s:0:\"\";s:17:\"knowledge_twitter\";s:0:\"\";s:15:\"knowledge_gplus\";s:0:\"\";s:19:\"knowledge_instagram\";s:0:\"\";s:17:\"knowledge_youtube\";s:0:\"\";s:18:\"knowledge_linkedin\";s:0:\"\";s:19:\"knowledge_pinterest\";s:0:\"\";s:20:\"knowledge_soundcloud\";s:0:\"\";s:16:\"knowledge_tumblr\";s:0:\"\";s:15:\"sitemaps_output\";i:1;s:19:\"sitemap_query_limit\";i:1000;s:17:\"sitemaps_modified\";i:1;s:15:\"sitemaps_robots\";i:1;s:13:\"ping_use_cron\";i:1;s:11:\"ping_google\";i:1;s:9:\"ping_bing\";i:1;s:23:\"ping_use_cron_prerender\";i:0;s:14:\"sitemap_styles\";i:1;s:12:\"sitemap_logo\";i:1;s:16:\"sitemap_logo_url\";s:0:\"\";s:15:\"sitemap_logo_id\";i:0;s:18:\"sitemap_color_main\";s:6:\"222222\";s:20:\"sitemap_color_accent\";s:6:\"00a0d2\";s:16:\"excerpt_the_feed\";i:1;s:15:\"source_the_feed\";i:1;s:14:\"index_the_feed\";i:0;s:17:\"ld_json_searchbox\";i:1;s:19:\"ld_json_breadcrumbs\";i:1;}', 'no'),
(301, 'the_seo_framework_upgraded_db_version', '4200', 'yes'),
(303, '_transient_tsf_exclude_1_1_id_id', 'a:2:{s:7:\"archive\";a:0:{}s:6:\"search\";a:0:{}}', 'yes'),
(304, 'n2_ss3_version', '3.5.1.11/b:release-3.5.1.11/r:f0b633e7a94052a70133276e2ed8de7715ca6ecb', 'yes'),
(305, 'widget_smartslider3', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(316, 'new_admin_email', 'aswinarung1@gmail.com', 'yes'),
(327, 'current_theme', 'AnimerV1', 'yes'),
(328, 'theme_mods_blankslate', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:9:\"main-menu\";i:4;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1666759126;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:19:\"primary-widget-area\";a:4:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-7\";}s:18:\"smartslider_area_1\";a:0:{}s:12:\"social-icons\";a:1:{i:0;s:7:\"block-8\";}}}}', 'yes'),
(329, 'theme_switched', '', 'yes'),
(333, 'recovery_mode_email_last_sent', '1666758914', 'yes'),
(351, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(368, 'news-category_children', 'a:0:{}', 'yes'),
(542, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.0.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.0.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.0.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.0.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.0.3\";s:7:\"version\";s:5:\"6.0.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.9\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1666758320;s:15:\"version_checked\";s:5:\"6.0.3\";s:12:\"translations\";a:0:{}}', 'no'),
(545, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:21:\"aswinarung1@gmail.com\";s:7:\"version\";s:5:\"6.0.3\";s:9:\"timestamp\";i:1666742594;}', 'no'),
(546, '_site_transient_timeout_php_check_53fa02513e93f8d5b695fa686a20e650', '1667347395', 'no'),
(547, '_site_transient_php_check_53fa02513e93f8d5b695fa686a20e650', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(548, '_transient_health-check-site-status-result', '{\"good\":14,\"recommended\":5,\"critical\":0}', 'yes'),
(551, '_transient_timeout_jetpack_https_test', '1666829006', 'no'),
(552, '_transient_jetpack_https_test', '1', 'no'),
(553, '_transient_timeout_jetpack_https_test_message', '1666829006', 'no'),
(554, '_transient_jetpack_https_test_message', '', 'no'),
(561, '_transient_timeout_wpseo_total_unindexed_general_items', '1666844707', 'no'),
(562, '_transient_wpseo_total_unindexed_general_items', '0', 'no'),
(563, '_transient_timeout_wpseo_unindexed_post_link_count', '1666829007', 'no'),
(564, '_transient_wpseo_unindexed_post_link_count', '0', 'no'),
(565, '_transient_timeout_wpseo_unindexed_term_link_count', '1666829007', 'no'),
(566, '_transient_wpseo_unindexed_term_link_count', '0', 'no'),
(571, '_site_transient_timeout_browser_acff52a1652901ae7e446fb41b9189b7', '1667347408', 'no'),
(572, '_site_transient_browser_acff52a1652901ae7e446fb41b9189b7', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"106.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(581, '_transient_timeout_jetpack_a8c_data', '1667347458', 'no'),
(582, '_transient_jetpack_a8c_data', 'a:4:{s:4:\"a12s\";i:2049;s:9:\"countries\";i:99;s:9:\"languages\";i:122;s:16:\"featured_plugins\";a:4:{i:0;s:11:\"woocommerce\";i:1;s:14:\"wp-super-cache\";i:2;s:14:\"wp-job-manager\";i:3;s:15:\"co-authors-plus\";}}', 'no'),
(585, '_transient_timeout_wpseo_total_unindexed_post_type_archives', '1666829060', 'no'),
(586, '_transient_wpseo_total_unindexed_post_type_archives', '0', 'no'),
(588, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1666758329;s:7:\"checked\";a:5:{s:10:\"blankslate\";s:6:\"2022.4\";s:5:\"child\";s:0:\"\";s:12:\"twentytwenty\";s:3:\"2.0\";s:15:\"twentytwentyone\";s:3:\"1.6\";s:15:\"twentytwentytwo\";s:3:\"1.2\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:4:{s:10:\"blankslate\";a:6:{s:5:\"theme\";s:10:\"blankslate\";s:11:\"new_version\";s:6:\"2022.4\";s:3:\"url\";s:40:\"https://wordpress.org/themes/blankslate/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/blankslate.2022.4.zip\";s:8:\"requires\";s:3:\"5.2\";s:12:\"requires_php\";s:3:\"7.0\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.2.0.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.6.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.2.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(599, '_transient_timeout_wpseo_total_unindexed_posts', '1666830517', 'no'),
(600, '_transient_wpseo_total_unindexed_posts', '0', 'no'),
(604, 'theme_mods_child', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:9:\"main-menu\";i:4;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1666759114;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:3:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";i:2;s:7:\"block-8\";}s:19:\"primary-widget-area\";a:4:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-7\";}s:18:\"smartslider_area_1\";a:0:{}}}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(606, '_transient_timeout_users_online', '1666770511', 'no'),
(607, '_transient_users_online', 'a:2:{i:0;a:4:{s:7:\"user_id\";i:1;s:13:\"last_activity\";i:1666758300;s:10:\"ip_address\";s:7:\"0.0.0.0\";s:7:\"blog_id\";b:0;}i:1;a:4:{s:7:\"user_id\";i:1;s:13:\"last_activity\";i:1666768711;s:10:\"ip_address\";s:12:\"36.81.147.19\";s:7:\"blog_id\";b:0;}}', 'no'),
(614, '_site_transient_timeout_theme_roots', '1666760122', 'no'),
(615, '_site_transient_theme_roots', 'a:5:{s:10:\"blankslate\";s:7:\"/themes\";s:5:\"child\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'no'),
(616, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1666768780;s:8:\"response\";a:5:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"6.0.3\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.6.0.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.7\";s:6:\"tested\";s:5:\"6.0.3\";s:12:\"requires_php\";s:3:\"5.6\";}s:51:\"all-in-one-wp-security-and-firewall/wp-security.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:49:\"w.org/plugins/all-in-one-wp-security-and-firewall\";s:4:\"slug\";s:35:\"all-in-one-wp-security-and-firewall\";s:6:\"plugin\";s:51:\"all-in-one-wp-security-and-firewall/wp-security.php\";s:11:\"new_version\";s:5:\"5.1.0\";s:3:\"url\";s:66:\"https://wordpress.org/plugins/all-in-one-wp-security-and-firewall/\";s:7:\"package\";s:84:\"https://downloads.wordpress.org/plugin/all-in-one-wp-security-and-firewall.5.1.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:88:\"https://ps.w.org/all-in-one-wp-security-and-firewall/assets/icon-256x256.png?rev=2798307\";s:2:\"1x\";s:88:\"https://ps.w.org/all-in-one-wp-security-and-firewall/assets/icon-128x128.png?rev=2798307\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:91:\"https://ps.w.org/all-in-one-wp-security-and-firewall/assets/banner-1544x500.png?rev=2798307\";s:2:\"1x\";s:90:\"https://ps.w.org/all-in-one-wp-security-and-firewall/assets/banner-772x250.png?rev=2798307\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";s:6:\"tested\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.6.4\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.6.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696\";s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";s:6:\"tested\";s:3:\"6.1\";s:12:\"requires_php\";b:0;}s:30:\"seo-by-rank-math/rank-math.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:30:\"w.org/plugins/seo-by-rank-math\";s:4:\"slug\";s:16:\"seo-by-rank-math\";s:6:\"plugin\";s:30:\"seo-by-rank-math/rank-math.php\";s:11:\"new_version\";s:9:\"1.0.100.1\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/seo-by-rank-math/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/seo-by-rank-math.1.0.100.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:69:\"https://ps.w.org/seo-by-rank-math/assets/icon-256x256.png?rev=2654292\";s:2:\"1x\";s:61:\"https://ps.w.org/seo-by-rank-math/assets/icon.svg?rev=2654292\";s:3:\"svg\";s:61:\"https://ps.w.org/seo-by-rank-math/assets/icon.svg?rev=2654292\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/seo-by-rank-math/assets/banner-1544x500.png?rev=2639678\";s:2:\"1x\";s:71:\"https://ps.w.org/seo-by-rank-math/assets/banner-772x250.png?rev=2639678\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.6\";s:6:\"tested\";s:5:\"6.0.3\";s:12:\"requires_php\";s:3:\"7.4\";}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:4:\"19.9\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wordpress-seo.19.9.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=2643727\";s:2:\"1x\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=2643727\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=2643727\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=2643727\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=2643727\";}s:8:\"requires\";s:3:\"5.9\";s:6:\"tested\";s:5:\"6.0.3\";s:12:\"requires_php\";s:6:\"5.6.20\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:4:{s:63:\"elegant-responsive-content-slider/responsive-content-slider.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:47:\"w.org/plugins/elegant-responsive-content-slider\";s:4:\"slug\";s:33:\"elegant-responsive-content-slider\";s:6:\"plugin\";s:63:\"elegant-responsive-content-slider/responsive-content-slider.php\";s:11:\"new_version\";s:5:\"1.0.2\";s:3:\"url\";s:64:\"https://wordpress.org/plugins/elegant-responsive-content-slider/\";s:7:\"package\";s:82:\"https://downloads.wordpress.org/plugin/elegant-responsive-content-slider.1.0.2.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:86:\"https://ps.w.org/elegant-responsive-content-slider/assets/icon-128x128.png?rev=1665730\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:88:\"https://ps.w.org/elegant-responsive-content-slider/assets/banner-772x250.png?rev=1665730\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.5\";}s:19:\"jetpack/jetpack.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/jetpack\";s:4:\"slug\";s:7:\"jetpack\";s:6:\"plugin\";s:19:\"jetpack/jetpack.php\";s:11:\"new_version\";s:4:\"11.4\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/jetpack/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/jetpack.11.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/jetpack/assets/icon-256x256.png?rev=2638128\";s:2:\"1x\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=2638128\";s:3:\"svg\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=2638128\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/jetpack/assets/banner-1544x500.png?rev=2653649\";s:2:\"1x\";s:62:\"https://ps.w.org/jetpack/assets/banner-772x250.png?rev=2653649\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";}s:33:\"smart-slider-3/smart-slider-3.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/smart-slider-3\";s:4:\"slug\";s:14:\"smart-slider-3\";s:6:\"plugin\";s:33:\"smart-slider-3/smart-slider-3.php\";s:11:\"new_version\";s:8:\"3.5.1.11\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/smart-slider-3/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/smart-slider-3.3.5.1.11.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/smart-slider-3/assets/icon-256x256.png?rev=2307688\";s:2:\"1x\";s:59:\"https://ps.w.org/smart-slider-3/assets/icon.svg?rev=2307688\";s:3:\"svg\";s:59:\"https://ps.w.org/smart-slider-3/assets/icon.svg?rev=2307688\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/smart-slider-3/assets/banner-1544x500.png?rev=2632650\";s:2:\"1x\";s:69:\"https://ps.w.org/smart-slider-3/assets/banner-772x250.png?rev=2632650\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}s:23:\"wordfence/wordfence.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:23:\"w.org/plugins/wordfence\";s:4:\"slug\";s:9:\"wordfence\";s:6:\"plugin\";s:23:\"wordfence/wordfence.php\";s:11:\"new_version\";s:5:\"7.7.1\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/wordfence/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/wordfence.7.7.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:62:\"https://ps.w.org/wordfence/assets/icon-256x256.png?rev=2070855\";s:2:\"1x\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";s:3:\"svg\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wordfence/assets/banner-1544x500.jpg?rev=2124102\";s:2:\"1x\";s:64:\"https://ps.w.org/wordfence/assets/banner-772x250.jpg?rev=2124102\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.9\";}}s:7:\"checked\";a:9:{s:30:\"advanced-custom-fields/acf.php\";s:5:\"6.0.2\";s:51:\"all-in-one-wp-security-and-firewall/wp-security.php\";s:5:\"5.0.9\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.6.3\";s:63:\"elegant-responsive-content-slider/responsive-content-slider.php\";s:5:\"1.0.2\";s:19:\"jetpack/jetpack.php\";s:4:\"11.4\";s:30:\"seo-by-rank-math/rank-math.php\";s:6:\"1.0.99\";s:33:\"smart-slider-3/smart-slider-3.php\";s:8:\"3.5.1.11\";s:23:\"wordfence/wordfence.php\";s:5:\"7.7.1\";s:24:\"wordpress-seo/wp-seo.php\";s:6:\"19.7.2\";}}', 'no'),
(619, '_site_transient_timeout_available_translations', '1666769161', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(620, '_site_transient_available_translations', 'a:129:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-05-13 15:59:22\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/5.8-beta/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"am\";a:8:{s:8:\"language\";s:2:\"am\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-29 20:43:49\";s:12:\"english_name\";s:7:\"Amharic\";s:11:\"native_name\";s:12:\"አማርኛ\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/am.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"am\";i:2;s:3:\"amh\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"ቀጥል\";}}s:3:\"arg\";a:8:{s:8:\"language\";s:3:\"arg\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-22 16:46:56\";s:12:\"english_name\";s:9:\"Aragonese\";s:11:\"native_name\";s:9:\"Aragonés\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/6.0.3/arg.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"an\";i:2;s:3:\"arg\";i:3;s:3:\"arg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continar\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-05-30 20:47:16\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/translation/core/4.8.21/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-09-08 17:57:56\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/5.8.6/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/translation/core/4.9.22/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-29 19:41:58\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-10-31 08:48:37\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/5.4.12/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-10-30 03:24:38\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/5.8-beta/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-08-09 10:47:25\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 05:39:59\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-24 07:14:25\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 08:45:13\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-12 09:36:03\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-03-17 12:58:14\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-05-24 09:00:33\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-05-24 08:57:04\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:72:\"http://downloads.wordpress.org/translation/core/6.0.3/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 11:06:04\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:70:\"http://downloads.wordpress.org/translation/core/6.0.3/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-17 16:35:32\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dsb\";a:8:{s:8:\"language\";s:3:\"dsb\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-16 12:13:09\";s:12:\"english_name\";s:13:\"Lower Sorbian\";s:11:\"native_name\";s:16:\"Dolnoserbšćina\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/6.0.3/dsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"dsb\";i:3;s:3:\"dsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Dalej\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-17 16:52:15\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2021-12-24 12:36:39\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-20 10:54:36\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-04-01 22:35:34\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-08-25 06:38:18\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-12 12:01:12\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-29 20:39:44\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-06 15:13:59\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-07 20:37:41\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-05-17 18:49:06\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-22 14:08:10\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 12:41:12\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-10-04 20:53:18\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/5.8.6/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_DO\";a:8:{s:8:\"language\";s:5:\"es_DO\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-10-08 14:32:50\";s:12:\"english_name\";s:28:\"Spanish (Dominican Republic)\";s:11:\"native_name\";s:33:\"Español de República Dominicana\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/5.8.6/es_DO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-06-14 16:02:22\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:66:\"http://downloads.wordpress.org/translation/core/5.8-beta/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-31 18:33:26\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:66:\"http://downloads.wordpress.org/translation/core/5.8-beta/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/5.4.12/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:6:\"5.2.17\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/5.2.17/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_EC\";a:8:{s:8:\"language\";s:5:\"es_EC\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-08-01 00:22:12\";s:12:\"english_name\";s:17:\"Spanish (Ecuador)\";s:11:\"native_name\";s:19:\"Español de Ecuador\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/es_EC.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-11 00:03:12\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-08-12 08:38:59\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/5.8-beta/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-02 17:59:27\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_AF\";a:8:{s:8:\"language\";s:5:\"fa_AF\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-07 13:34:46\";s:12:\"english_name\";s:21:\"Persian (Afghanistan)\";s:11:\"native_name\";s:31:\"(فارسی (افغانستان\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/fa_AF.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-13 06:47:49\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 17:34:38\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-13 18:56:33\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-19 14:38:47\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-22 13:54:46\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:66:\"http://downloads.wordpress.org/translation/core/5.8-beta/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/translation/core/4.8.21/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-24 11:51:59\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.9.22/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:6:\"4.4.29\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/translation/core/4.4.29/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-10 09:13:56\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-11-06 12:34:38\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/5.4.12/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"जारी रखें\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-21 08:38:14\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-18 19:40:10\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/6.0.3/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-11 07:57:56\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-09 01:29:51\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2018-12-11 10:40:02\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/4.9.22/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-20 10:14:38\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-23 01:52:51\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2019-02-16 23:58:56\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/4.9.22/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-24 08:01:09\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-29 14:49:24\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/6.0.3/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2018-07-10 11:35:44\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.9.22/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:6:\"5.2.17\";s:7:\"updated\";s:19:\"2019-06-10 16:18:28\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/5.2.17/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-30 17:57:15\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರಿಸು\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-25 12:03:54\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-12-07 16:32:30\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/5.8.6/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-23 12:35:40\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:66:\"http://downloads.wordpress.org/translation/core/5.8-beta/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-20 19:18:29\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-01 09:23:52\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2019-11-22 15:32:08\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.9.22/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:6:\"5.5.11\";s:7:\"updated\";s:19:\"2022-03-11 13:52:22\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/5.5.11/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.2.34\";s:7:\"updated\";s:19:\"2017-12-26 11:57:10\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/4.2.34/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 11:20:18\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 16:02:27\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-01 20:37:33\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-06-02 21:03:02\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:70:\"http://downloads.wordpress.org/translation/core/6.0.3/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-21 14:53:28\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-18 10:59:16\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:66:\"http://downloads.wordpress.org/translation/core/5.8-beta/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/translation/core/4.8.21/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:15:\"Panjabi (India)\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-13 09:46:04\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.3.30\";s:7:\"updated\";s:19:\"2015-12-02 21:41:29\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.3.30/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-01 12:16:29\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-08-09 12:26:21\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:68:\"http://downloads.wordpress.org/translation/core/6.0.3/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-17 14:41:40\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-17 14:11:50\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-17 15:14:15\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-17 14:03:37\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-07-07 01:53:37\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/translation/core/5.4.12/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:3:\"snd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-25 11:10:49\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-10 16:01:09\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/6.0.3/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-05 12:27:18\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-16 11:26:37\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-08-01 21:21:06\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/5.8.6/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-17 21:05:38\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:6:\"5.3.14\";s:7:\"updated\";s:19:\"2019-10-13 15:35:35\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/5.3.14/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:5:\"ta_LK\";a:8:{s:8:\"language\";s:5:\"ta_LK\";s:7:\"version\";s:6:\"4.2.34\";s:7:\"updated\";s:19:\"2015-12-03 01:07:44\";s:12:\"english_name\";s:17:\"Tamil (Sri Lanka)\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/4.2.34/ta_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"தொடர்க\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2022-06-08 04:30:30\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/5.8.6/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2017-09-30 09:04:29\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.8.21/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-20 11:51:03\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2021-07-03 18:41:33\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"http://downloads.wordpress.org/translation/core/4.9.22/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-11 15:51:48\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-04-09 11:17:33\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/translation/core/5.4.12/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-28 12:02:22\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:66:\"http://downloads.wordpress.org/translation/core/5.8-beta/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-08-24 07:53:05\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:60:\"http://downloads.wordpress.org/translation/core/6.0.3/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-18 06:25:45\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-07-15 15:25:03\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:12:\"香港中文\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-08-15 08:22:28\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:63:\"http://downloads.wordpress.org/translation/core/6.0.3/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(662, 'genres_children', 'a:0:{}', 'yes'),
(807, '_transient_timeout_wpseo_total_unindexed_posts_limited', '1666769622', 'no'),
(808, '_transient_wpseo_total_unindexed_posts_limited', '0', 'no'),
(809, '_transient_timeout_wpseo_total_unindexed_terms_limited', '1666769622', 'no'),
(810, '_transient_wpseo_total_unindexed_terms_limited', '0', 'no'),
(813, '_transient_timeout_global_styles_child', '1666768983', 'no'),
(814, '_transient_global_styles_child', 'body{--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--duotone--dark-grayscale: url(\'#wp-duotone-dark-grayscale\');--wp--preset--duotone--grayscale: url(\'#wp-duotone-grayscale\');--wp--preset--duotone--purple-yellow: url(\'#wp-duotone-purple-yellow\');--wp--preset--duotone--blue-red: url(\'#wp-duotone-blue-red\');--wp--preset--duotone--midnight: url(\'#wp-duotone-midnight\');--wp--preset--duotone--magenta-yellow: url(\'#wp-duotone-magenta-yellow\');--wp--preset--duotone--purple-green: url(\'#wp-duotone-purple-green\');--wp--preset--duotone--blue-orange: url(\'#wp-duotone-blue-orange\');--wp--preset--font-size--small: 13px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 36px;--wp--preset--font-size--x-large: 42px;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(5, 6, '_form', '<label> Nama Anda\n    [text* your-name] </label>\n\n<label> E-mail anda\n    [email* your-email] </label>\n\n<label> Subjek\n    [text* your-subject] </label>\n\n<label> Pesan Anda (opsional)\n    [textarea your-message] </label>\n\n[submit \"Kirim\"]'),
(6, 6, '_mail', 'a:8:{s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:37:\"[_site_title] <aswinarung1@gmail.com>\";s:4:\"body\";s:161:\"Dari: [your-name] <[your-email]>\nSubjek: [your-subject]\n\nIsi Pesan:\n[your-message]\n\n-- \nE-mail ini dikirim melalui formulir kontak di [_site_title] ([_site_url])\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(7, 6, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:37:\"[_site_title] <aswinarung1@gmail.com>\";s:4:\"body\";s:104:\"Isi Pesan:\n[your-message]\n\n-- \nE-mail ini dikirim melalui formulir kontak di [_site_title] ([_site_url])\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(8, 6, '_messages', 'a:12:{s:12:\"mail_sent_ok\";s:53:\"Terima kasih untuk pesan Anda. Pesan berhasil dikirim\";s:12:\"mail_sent_ng\";s:70:\"Terdapat kesalahan dalam mengirim pesan Anda. Silahkan coba lagi nanti\";s:16:\"validation_error\";s:65:\"Satu atau lebih kolom terdapat eror. Harap periksa dan coba lagi.\";s:4:\"spam\";s:70:\"Terdapat kesalahan dalam mengirim pesan Anda. Silahkan coba lagi nanti\";s:12:\"accept_terms\";s:69:\"Anda harus menerima syarat dan ketentuan sebelum mengirim pesan Anda.\";s:16:\"invalid_required\";s:27:\"Please fill out this field.\";s:16:\"invalid_too_long\";s:32:\"This field has a too long input.\";s:17:\"invalid_too_short\";s:33:\"This field has a too short input.\";s:13:\"upload_failed\";s:58:\"Terdapat kesalahan tidak diketahui saat mengunggah berkas.\";s:24:\"upload_file_type_invalid\";s:66:\"Anda tidak diperbolehkan untuk mengunggah berkas dengan jenis ini.\";s:21:\"upload_file_too_large\";s:31:\"The uploaded file is too large.\";s:23:\"upload_failed_php_error\";s:42:\"Terdapat kesalahan dalam mengunggah berkas\";}'),
(9, 6, '_additional_settings', ''),
(10, 6, '_locale', 'id_ID'),
(13, 8, '_edit_lock', '1665459837:1'),
(14, 8, '_edit_last', '1'),
(15, 9, '_edit_lock', '1665459911:1'),
(16, 9, '_edit_last', '1'),
(17, 10, '_wp_attached_file', '2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg'),
(18, 10, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1371;s:4:\"file\";s:46:\"2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg\";s:8:\"filesize\";i:138407;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"allison-saeng-ETl-TFkPEEs-unsplash-300x214.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:214;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9367;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"allison-saeng-ETl-TFkPEEs-unsplash-1024x731.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:731;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:50536;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"allison-saeng-ETl-TFkPEEs-unsplash-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4834;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(19, 11, '_wp_attached_file', '2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg'),
(20, 11, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1371;s:4:\"file\";s:46:\"2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg\";s:8:\"filesize\";i:104475;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"allison-saeng-GcIXJ1tgoU4-unsplash-300x214.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:214;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6042;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"allison-saeng-GcIXJ1tgoU4-unsplash-1024x731.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:731;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:36306;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"allison-saeng-GcIXJ1tgoU4-unsplash-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3429;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(21, 12, '_wp_attached_file', '2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg'),
(22, 12, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1371;s:4:\"file\";s:46:\"2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg\";s:8:\"filesize\";i:117915;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"allison-saeng-HMvUuZQz4b0-unsplash-300x214.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:214;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5847;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"allison-saeng-HMvUuZQz4b0-unsplash-1024x731.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:731;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:37275;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"allison-saeng-HMvUuZQz4b0-unsplash-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2909;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(23, 13, '_wp_attached_file', '2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg'),
(24, 13, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1344;s:4:\"file\";s:46:\"2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg\";s:8:\"filesize\";i:42002;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"allison-saeng-j-zSNOQU7i0-unsplash-300x210.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:210;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4016;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"allison-saeng-j-zSNOQU7i0-unsplash-1024x717.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:717;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21366;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"allison-saeng-j-zSNOQU7i0-unsplash-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2305;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(25, 14, '_wp_attached_file', '2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg'),
(26, 14, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1344;s:4:\"file\";s:46:\"2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg\";s:8:\"filesize\";i:44143;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"allison-saeng-xnANlVZMViA-unsplash-300x210.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:210;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4282;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"allison-saeng-xnANlVZMViA-unsplash-1024x717.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:717;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22722;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"allison-saeng-xnANlVZMViA-unsplash-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2489;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(27, 16, '_edit_lock', '1665462058:1'),
(28, 16, '_edit_last', '1'),
(29, 16, '_yoast_wpseo_content_score', '60'),
(30, 16, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(31, 16, '_yoast_wpseo_wordproof_timestamp', ''),
(32, 9, '_wp_trash_meta_status', 'draft'),
(33, 9, '_wp_trash_meta_time', '1665460004'),
(34, 9, '_wp_desired_post_slug', ''),
(35, 8, '_wp_trash_meta_status', 'draft'),
(36, 8, '_wp_trash_meta_time', '1665460009'),
(37, 8, '_wp_desired_post_slug', ''),
(47, 18, '_menu_item_type', 'custom'),
(48, 18, '_menu_item_menu_item_parent', '0'),
(49, 18, '_menu_item_object_id', '18'),
(50, 18, '_menu_item_object', 'custom'),
(51, 18, '_menu_item_target', ''),
(52, 18, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(53, 18, '_menu_item_xfn', ''),
(54, 18, '_menu_item_url', 'http://localhost/wordpress/'),
(56, 19, '_edit_lock', '1665460180:1'),
(57, 19, '_edit_last', '1'),
(58, 19, '_yoast_wpseo_estimated-reading-time-minutes', '0'),
(59, 19, '_yoast_wpseo_wordproof_timestamp', ''),
(60, 16, '_thumbnail_id', '10'),
(61, 22, '_edit_lock', '1665461368:1'),
(62, 22, '_edit_last', '1'),
(63, 22, '_thumbnail_id', '12'),
(64, 22, '_yoast_wpseo_primary_news-category', '3'),
(65, 22, '_yoast_wpseo_content_score', '30'),
(66, 22, '_yoast_wpseo_estimated-reading-time-minutes', '2'),
(67, 22, '_yoast_wpseo_wordproof_timestamp', ''),
(68, 23, '_edit_lock', '1665461401:1'),
(69, 23, '_edit_last', '1'),
(70, 23, '_thumbnail_id', '13'),
(71, 23, '_yoast_wpseo_primary_news-category', '3'),
(72, 23, '_yoast_wpseo_content_score', '30'),
(73, 23, '_yoast_wpseo_estimated-reading-time-minutes', '2'),
(74, 23, '_yoast_wpseo_wordproof_timestamp', ''),
(75, 24, '_edit_lock', '1665461537:1'),
(76, 24, '_edit_last', '1'),
(77, 24, '_thumbnail_id', '14'),
(78, 24, '_yoast_wpseo_primary_news-category', '2'),
(79, 24, '_yoast_wpseo_content_score', '30'),
(80, 24, '_yoast_wpseo_estimated-reading-time-minutes', '2'),
(81, 24, '_yoast_wpseo_wordproof_timestamp', ''),
(100, 18, '_wp_old_date', '2022-10-11'),
(102, 29, '_edit_lock', '1666759297:1'),
(103, 30, '_menu_item_type', 'taxonomy'),
(104, 30, '_menu_item_menu_item_parent', '61'),
(105, 30, '_menu_item_object_id', '6'),
(106, 30, '_menu_item_object', 'genres'),
(107, 30, '_menu_item_target', ''),
(108, 30, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(109, 30, '_menu_item_xfn', ''),
(110, 30, '_menu_item_url', ''),
(112, 31, '_menu_item_type', 'taxonomy'),
(113, 31, '_menu_item_menu_item_parent', '61'),
(114, 31, '_menu_item_object_id', '7'),
(115, 31, '_menu_item_object', 'genres'),
(116, 31, '_menu_item_target', ''),
(117, 31, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(118, 31, '_menu_item_xfn', ''),
(119, 31, '_menu_item_url', ''),
(121, 32, '_menu_item_type', 'taxonomy'),
(122, 32, '_menu_item_menu_item_parent', '61'),
(123, 32, '_menu_item_object_id', '9'),
(124, 32, '_menu_item_object', 'genres'),
(125, 32, '_menu_item_target', ''),
(126, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(127, 32, '_menu_item_xfn', ''),
(128, 32, '_menu_item_url', ''),
(130, 33, '_menu_item_type', 'taxonomy'),
(131, 33, '_menu_item_menu_item_parent', '61'),
(132, 33, '_menu_item_object_id', '8'),
(133, 33, '_menu_item_object', 'genres'),
(134, 33, '_menu_item_target', ''),
(135, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(136, 33, '_menu_item_xfn', ''),
(137, 33, '_menu_item_url', ''),
(139, 34, '_wp_attached_file', '2022/10/alternate-world-pharmacy-2.jpg'),
(140, 34, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:38:\"2022/10/alternate-world-pharmacy-2.jpg\";s:8:\"filesize\";i:414494;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:38:\"alternate-world-pharmacy-2-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13667;}s:5:\"large\";a:5:{s:4:\"file\";s:39:\"alternate-world-pharmacy-2-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:78387;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:38:\"alternate-world-pharmacy-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7594;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(141, 35, '_wp_attached_file', '2022/10/alternate-world-pharmacy-3.jpg'),
(142, 35, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:38:\"2022/10/alternate-world-pharmacy-3.jpg\";s:8:\"filesize\";i:357226;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:38:\"alternate-world-pharmacy-3-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13630;}s:5:\"large\";a:5:{s:4:\"file\";s:39:\"alternate-world-pharmacy-3-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:87647;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:38:\"alternate-world-pharmacy-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7076;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(143, 36, '_wp_attached_file', '2022/10/alternate-world-pharmacy-1.jpg'),
(144, 36, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:667;s:6:\"height\";i:1000;s:4:\"file\";s:38:\"2022/10/alternate-world-pharmacy-1.jpg\";s:8:\"filesize\";i:118312;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:38:\"alternate-world-pharmacy-1-200x300.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:20076;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:38:\"alternate-world-pharmacy-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9462;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(145, 37, '_edit_lock', '1666764813:1'),
(146, 37, '_edit_last', '1'),
(147, 53, '_edit_lock', '1666761971:1'),
(148, 53, '_edit_last', '1'),
(149, 53, '_thumbnail_id', '34'),
(150, 53, 'release_date', '20221027'),
(151, 53, '_release_date', 'field_6358bb9a19584'),
(152, 53, 'number_episode', '13'),
(153, 53, '_number_episode', 'field_6358bbbd19585'),
(154, 53, 'episode_link', 'https://www.youtube.com/watch?v=Lj7Oq9CFUVs'),
(155, 53, '_episode_link', 'field_6358bd044b2f7'),
(156, 53, '_yoast_wpseo_content_score', '60'),
(157, 53, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(158, 53, '_yoast_wpseo_wordproof_timestamp', ''),
(159, 54, '_edit_lock', '1666761248:1'),
(160, 54, '_edit_last', '1'),
(161, 55, '_edit_lock', '1666761275:1'),
(162, 54, '_thumbnail_id', '34'),
(163, 54, 'release_date', '20221027'),
(164, 54, '_release_date', 'field_6358bb9a19584'),
(165, 54, 'number_episode', '12'),
(166, 54, '_number_episode', 'field_6358bbbd19585'),
(167, 54, 'episode_link', 'https://www.youtube.com/watch?v=Lj7Oq9CFUVs'),
(168, 54, '_episode_link', 'field_6358bd044b2f7'),
(169, 54, '_yoast_wpseo_primary_genres', '6'),
(170, 54, '_yoast_wpseo_content_score', '90'),
(171, 54, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(172, 54, '_yoast_wpseo_wordproof_timestamp', ''),
(173, 57, '_edit_lock', '1666761434:1'),
(174, 57, '_edit_last', '1'),
(175, 57, 'release_date', '20221029'),
(176, 57, '_release_date', 'field_6358bb9a19584'),
(177, 57, 'number_episode', '14'),
(178, 57, '_number_episode', 'field_6358bbbd19585'),
(179, 57, 'episode_link', 'https://www.youtube.com/watch?v=Lj7Oq9CFUVs'),
(180, 57, '_episode_link', 'field_6358bd044b2f7'),
(181, 57, '_yoast_wpseo_primary_genres', '7'),
(182, 57, '_yoast_wpseo_content_score', '60'),
(183, 57, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(184, 57, '_yoast_wpseo_wordproof_timestamp', ''),
(185, 58, '_edit_lock', '1666761411:1'),
(186, 58, '_edit_last', '1'),
(187, 58, '_thumbnail_id', '35'),
(188, 58, 'release_date', '20221029'),
(189, 58, '_release_date', 'field_6358bb9a19584'),
(190, 58, 'number_episode', '2'),
(191, 58, '_number_episode', 'field_6358bbbd19585'),
(192, 58, 'episode_link', 'https://www.youtube.com/watch?v=Lj7Oq9CFUVs'),
(193, 58, '_episode_link', 'field_6358bd044b2f7'),
(194, 58, '_yoast_wpseo_primary_genres', '6'),
(195, 58, '_yoast_wpseo_content_score', '90'),
(196, 58, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(197, 58, '_yoast_wpseo_wordproof_timestamp', ''),
(198, 57, '_thumbnail_id', '35'),
(199, 60, '_menu_item_type', 'custom'),
(200, 60, '_menu_item_menu_item_parent', '0'),
(201, 60, '_menu_item_object_id', '60'),
(202, 60, '_menu_item_object', 'custom'),
(203, 60, '_menu_item_target', ''),
(204, 60, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(205, 60, '_menu_item_xfn', ''),
(206, 60, '_menu_item_url', 'http://localhost/wordpress/anime-list'),
(208, 61, '_menu_item_type', 'custom'),
(209, 61, '_menu_item_menu_item_parent', '0'),
(210, 61, '_menu_item_object_id', '61'),
(211, 61, '_menu_item_object', 'custom'),
(212, 61, '_menu_item_target', ''),
(213, 61, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(214, 61, '_menu_item_xfn', ''),
(215, 61, '_menu_item_url', ''),
(217, 62, '_menu_item_type', 'custom'),
(218, 62, '_menu_item_menu_item_parent', '0'),
(219, 62, '_menu_item_object_id', '62'),
(220, 62, '_menu_item_object', 'custom'),
(221, 62, '_menu_item_target', ''),
(222, 62, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(223, 62, '_menu_item_xfn', ''),
(224, 62, '_menu_item_url', ''),
(226, 63, '_menu_item_type', 'custom'),
(227, 63, '_menu_item_menu_item_parent', '0'),
(228, 63, '_menu_item_object_id', '63'),
(229, 63, '_menu_item_object', 'custom'),
(230, 63, '_menu_item_target', ''),
(231, 63, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(232, 63, '_menu_item_xfn', ''),
(233, 63, '_menu_item_url', 'http://localhost/wordpress/articles'),
(235, 53, 'view_count', '0'),
(236, 64, '_edit_lock', '1666765062:1'),
(237, 64, '_edit_last', '1'),
(238, 64, '_thumbnail_id', '34'),
(239, 64, 'release_date', '20221029'),
(240, 64, '_release_date', 'field_6358bb9a19584'),
(241, 64, 'number_episode', '15'),
(242, 64, '_number_episode', 'field_6358bbbd19585'),
(243, 64, 'episode_link', 'https://www.youtube.com/watch?v=Lj7Oq9CFUVs'),
(244, 64, '_episode_link', 'field_6358bd044b2f7'),
(245, 64, '_yoast_wpseo_primary_genres', '6'),
(246, 64, '_yoast_wpseo_content_score', '60'),
(247, 64, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(248, 64, '_yoast_wpseo_wordproof_timestamp', ''),
(249, 65, '_edit_lock', '1666765355:1'),
(250, 66, 'view_count', '35'),
(251, 66, '_edit_lock', '1666765602:1'),
(252, 66, '_edit_last', '1'),
(253, 66, '_thumbnail_id', '35'),
(254, 66, 'release_date', '20221022'),
(255, 66, '_release_date', 'field_6358bb9a19584'),
(256, 66, 'number_episode', '123'),
(257, 66, '_number_episode', 'field_6358bbbd19585'),
(258, 66, 'episode_link', 'https://www.youtube.com/watch?v=Lj7Oq9CFUVs'),
(259, 66, '_episode_link', 'field_6358bd044b2f7'),
(260, 66, '_yoast_wpseo_primary_genres', '9'),
(261, 66, '_yoast_wpseo_content_score', '60'),
(262, 66, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(263, 66, '_yoast_wpseo_wordproof_timestamp', ''),
(264, 67, 'view_count', '2'),
(265, 67, '_menu_item_type', 'taxonomy'),
(266, 67, '_menu_item_menu_item_parent', '62'),
(267, 67, '_menu_item_object_id', '13'),
(268, 67, '_menu_item_object', 'seasons'),
(269, 67, '_menu_item_target', ''),
(270, 67, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(271, 67, '_menu_item_xfn', ''),
(272, 67, '_menu_item_url', ''),
(274, 68, 'view_count', '2'),
(275, 68, '_menu_item_type', 'taxonomy'),
(276, 68, '_menu_item_menu_item_parent', '62'),
(277, 68, '_menu_item_object_id', '12'),
(278, 68, '_menu_item_object', 'seasons'),
(279, 68, '_menu_item_target', ''),
(280, 68, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(281, 68, '_menu_item_xfn', ''),
(282, 68, '_menu_item_url', ''),
(284, 69, 'view_count', '2'),
(285, 69, '_menu_item_type', 'taxonomy'),
(286, 69, '_menu_item_menu_item_parent', '62'),
(287, 69, '_menu_item_object_id', '11'),
(288, 69, '_menu_item_object', 'seasons'),
(289, 69, '_menu_item_target', ''),
(290, 69, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(291, 69, '_menu_item_xfn', ''),
(292, 69, '_menu_item_url', ''),
(294, 70, 'view_count', '2'),
(295, 70, '_menu_item_type', 'taxonomy'),
(296, 70, '_menu_item_menu_item_parent', '62'),
(297, 70, '_menu_item_object_id', '10'),
(298, 70, '_menu_item_object', 'seasons'),
(299, 70, '_menu_item_target', ''),
(300, 70, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(301, 70, '_menu_item_xfn', ''),
(302, 70, '_menu_item_url', ''),
(304, 71, 'view_count', '2'),
(305, 71, '_menu_item_type', 'taxonomy'),
(306, 71, '_menu_item_menu_item_parent', '62'),
(307, 71, '_menu_item_object_id', '14'),
(308, 71, '_menu_item_object', 'seasons'),
(309, 71, '_menu_item_target', ''),
(310, 71, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(311, 71, '_menu_item_xfn', ''),
(312, 71, '_menu_item_url', ''),
(314, 18, 'view_count', '1'),
(315, 61, 'view_count', '1'),
(316, 30, 'view_count', '1'),
(317, 31, 'view_count', '1'),
(318, 32, 'view_count', '1'),
(319, 33, 'view_count', '1'),
(320, 60, 'view_count', '1'),
(321, 62, 'view_count', '1'),
(322, 63, 'view_count', '1'),
(324, 66, 'rating', '4');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2022-10-11 02:26:43', '2022-10-11 02:26:43', '<!-- wp:paragraph -->\n<p>Selamt datang di WordPress. Ini adalah pos pertama Anda. Sunting atau hapus, kemudian mulai menulis!</p>\n<!-- /wp:paragraph -->', 'Halo dunia!', '', 'publish', 'open', 'open', '', 'halo-dunia', '', '', '2022-10-11 02:26:43', '2022-10-11 02:26:43', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2022-10-11 02:26:43', '2022-10-11 02:26:43', '<!-- wp:paragraph -->\n<p>Ini adalah laman contoh. Laman ini berbeda dari artikel blog karena akan tetap di satu tempat dan akan muncul di navigasi situs Anda (di sebagian besar tema). Kebanyakan orang memulai dengan laman \"Tentang\" yang bertujuan untuk mengenalkan mereka kepada pengunjung potensial situs. Biasanya berisi seperti ini:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hai yang disana! Saya seorang kurir bersepeda di siang hari, di malam hari bermimpi menjadi seorang aktor, dan ini adalah situs web saya. Saya tinggal di Los Angeles, punya anjing besar bernama Jack, dan saya suka pi&#241;a minuman Colada. (Dan terjebak dalam hujan.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...atau seperti ini:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Perusahaan Doohickey XYZ didirikan pada tahun 1971, dan telah menyediakan doohickey berkualitas untuk masyarakat umum sejak saat itu. Terletak di Kota Gotham, XYZ mempekerjakan lebih dari 2.000 orang dan melakukan segala macam hal luar biasa untuk komunitas Gotham.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Sebagai pengguna baru WordPress, Anda harus membuka <a href=\"http://localhost/wordpress/wp-admin/\">dasbor Anda</a> untuk menghapus laman ini dan membuat laman-laman baru untuk konten Anda. Have fun!</p>\n<!-- /wp:paragraph -->', 'Laman Contoh', '', 'publish', 'closed', 'open', '', 'laman-contoh', '', '', '2022-10-11 02:26:43', '2022-10-11 02:26:43', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2022-10-11 02:26:43', '2022-10-11 02:26:43', '<!-- wp:heading --><h2>Siapa kami</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Alamat situs web kami adalah: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Komentar</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Saat pengunjung meninggalkan komentar pada situs, kita mengumpulkan data yang ditampilkan pada form komentar, alamat IP pengunjung dan user agent browser untuk membantu pendeteksian spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>String anonim yang dibuat dari alamat email Anda (juga disebut hash) dapat diberikan ke layanan Gravatar untuk melihat apakah Anda menggunakannya. Kebijakan privasi layanan Gravatar tersedia di sini: https://automattic.com/privacy/. Setelah persetujuan atas komentar Anda, gambar profil Anda dapat dilihat oleh publik dalam konteks komentar Anda.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda mengunggah gambar ke situs web, Anda harus menghindari mengunggah gambar dengan data lokasi tertanam (GPS EXIF) yang disertakan. Pengunjung ke situs web dapat mengunduh dan mengekstrak data lokasi apa pun dari gambar di situs web.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda meninggalkan komentar di situs kami, Anda dapat memilih untuk menyimpan nama, alamat email, dan situs web Anda dalam cookie. Ini untuk kenyamanan Anda sehingga Anda tidak perlu mengisi detail Anda lagi ketika Anda meninggalkan komentar lain. Cookie ini akan bertahan selama satu tahun.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jika Anda mengunjungi laman login kami, kami akan memasang cookie sementara untuk memastikan apakah browser Anda menerima cookie. Cookie ini tidak mengandung data pribadi dan dibuang ketika Anda menutup browser Anda.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Saat Anda log masuk, kami akan menyiapkan beberapa cookie untuk menyimpan informasi log masuk Anda dan tampilan yang Anda pilih. Cookie log masuk berlaku selama dua hari, dan cookie pengaturan tampilan berlaku selama satu tahun. Jika Anda memilih &quot;Ingatkan Saya&quot;, log masuk anda akan bertahan selama dua minggu. Jika Anda log keluar dari akun, cookie log masuk akan dihapus.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jika Anda menyunting atau menerbitkan artikel, cookie tambahan akan disimpan di browser Anda. Cookie ini tidak menyertakan data pribadi dan hanya menunjukkan ID posting dari artikel yang baru saja Anda sunting. Kadaluwarsa setelah 1 hari.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Konten yang disematkan dari situs web lain</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Artikel-artikel di dalam situs ini dapat menyertakan konten terembed (seperti video, gambar, artikel, dll). Konten terembed dari situs web lain akan berlaku sama dengan pengunjung yang mengunjungi situs web lain.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Situs-situs web ini dapat mengumpulkan data tentang Anda, menggunakan cookies, menanamkan pelacak dari pihak ketiga, dan memonitor interaksi Anda dengan muatan tertanam, termasuk menggunakannya untuk melacak interaksi Anda jika Anda memiliki sebuah akun dan masuk ke dalam situs web tersebut.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dengan siapa kami membagi data Anda</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda meminta pengaturan ulang kata sandi, alamat IP Anda akan dimasukkan dalam email pengaturan ulang.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Berapa lama kami menyimpan data Anda</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda meninggalkan komentar, komentar dan metadatanya dipertahankan tanpa batas. Ini agar kami dapat mengenali dan menyetujui komentar tindak lanjut secara otomatis dan tidak menahannya dalam antrean moderasi.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Untuk pengguna yang mendaftar pada website kami (jika ada), kami juga menyimpan informasi pribadi yang mereka berikan dalam profil pengguna mereka. Semua pengguna dapat melihat, mengedit, atau menghapus informasi pribadi mereka kapan saja (kecuali mereka tidak dapat mengubah nama pengguna mereka). Administrator situs juga dapat melihat dan mengedit informasi tersebut.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Hak apa yang Anda miliki atas data ANda</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika anda mempunyai akun di situs ini, atau telah meninggalkan komentar, anda dapat meminta untuk mendapat data personal dalam file export dari kami, termasuk data yang anda berikan kepada kami. Anda juga dapat meminta kami menghapus data personal mengenai anda. Ini tidak termasuk data yang wajib kami simpan untuk keperluan administratif, hukum, atau keamanan.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Komentar pengunjung dapat diperiksa melalui layanan deteksi spam otomatis.</p><!-- /wp:paragraph -->', 'Kebijakan Privasi', '', 'draft', 'closed', 'open', '', 'kebijakan-privasi', '', '', '2022-10-11 02:26:43', '2022-10-11 02:26:43', '', 0, 'http://localhost/wordpress/?page_id=3', 0, 'page', '', 0),
(6, 1, '2022-10-11 03:00:43', '2022-10-11 03:00:43', '<label> Nama Anda\n    [text* your-name] </label>\n\n<label> E-mail anda\n    [email* your-email] </label>\n\n<label> Subjek\n    [text* your-subject] </label>\n\n<label> Pesan Anda (opsional)\n    [textarea your-message] </label>\n\n[submit \"Kirim\"]\n[_site_title] \"[your-subject]\"\n[_site_title] <aswinarung1@gmail.com>\nDari: [your-name] <[your-email]>\nSubjek: [your-subject]\n\nIsi Pesan:\n[your-message]\n\n-- \nE-mail ini dikirim melalui formulir kontak di [_site_title] ([_site_url])\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\n\n[_site_title] \"[your-subject]\"\n[_site_title] <aswinarung1@gmail.com>\nIsi Pesan:\n[your-message]\n\n-- \nE-mail ini dikirim melalui formulir kontak di [_site_title] ([_site_url])\n[your-email]\nReply-To: [_site_admin_email]\n\n0\n0\nTerima kasih untuk pesan Anda. Pesan berhasil dikirim\nTerdapat kesalahan dalam mengirim pesan Anda. Silahkan coba lagi nanti\nSatu atau lebih kolom terdapat eror. Harap periksa dan coba lagi.\nTerdapat kesalahan dalam mengirim pesan Anda. Silahkan coba lagi nanti\nAnda harus menerima syarat dan ketentuan sebelum mengirim pesan Anda.\nPlease fill out this field.\nThis field has a too long input.\nThis field has a too short input.\nTerdapat kesalahan tidak diketahui saat mengunggah berkas.\nAnda tidak diperbolehkan untuk mengunggah berkas dengan jenis ini.\nThe uploaded file is too large.\nTerdapat kesalahan dalam mengunggah berkas', 'Formulir kontak 1', '', 'publish', 'closed', 'closed', '', 'formulir-kontak-1', '', '', '2022-10-11 03:00:43', '2022-10-11 03:00:43', '', 0, 'http://localhost/wordpress/?post_type=wpcf7_contact_form&p=6', 0, 'wpcf7_contact_form', '', 0),
(8, 1, '2022-10-11 03:46:49', '2022-10-11 03:46:49', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'News1', '', 'trash', 'closed', 'closed', '', '__trashed-2', '', '', '2022-10-11 03:46:49', '2022-10-11 03:46:49', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=8', 0, 'news', '', 0),
(9, 1, '2022-10-11 03:46:44', '2022-10-11 03:46:44', '', 'News1', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2022-10-11 03:46:44', '2022-10-11 03:46:44', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=9', 0, 'news', '', 0),
(10, 1, '2022-10-11 03:44:41', '2022-10-11 03:44:41', '', 'allison-saeng-ETl-TFkPEEs-unsplash', '', 'inherit', 'open', 'closed', '', 'allison-saeng-etl-tfkpees-unsplash', '', '', '2022-10-11 03:44:41', '2022-10-11 03:44:41', '', 9, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg', 0, 'attachment', 'image/jpeg', 0),
(11, 1, '2022-10-11 03:44:43', '2022-10-11 03:44:43', '', 'allison-saeng-GcIXJ1tgoU4-unsplash', '', 'inherit', 'open', 'closed', '', 'allison-saeng-gcixj1tgou4-unsplash', '', '', '2022-10-11 03:44:43', '2022-10-11 03:44:43', '', 9, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg', 0, 'attachment', 'image/jpeg', 0),
(12, 1, '2022-10-11 03:44:46', '2022-10-11 03:44:46', '', 'allison-saeng-HMvUuZQz4b0-unsplash', '', 'inherit', 'open', 'closed', '', 'allison-saeng-hmvuuzqz4b0-unsplash', '', '', '2022-10-11 03:44:46', '2022-10-11 03:44:46', '', 9, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg', 0, 'attachment', 'image/jpeg', 0),
(13, 1, '2022-10-11 03:44:48', '2022-10-11 03:44:48', '', 'allison-saeng-j-zSNOQU7i0-unsplash', '', 'inherit', 'open', 'closed', '', 'allison-saeng-j-zsnoqu7i0-unsplash', '', '', '2022-10-11 03:44:48', '2022-10-11 03:44:48', '', 9, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg', 0, 'attachment', 'image/jpeg', 0),
(14, 1, '2022-10-11 03:44:49', '2022-10-11 03:44:49', '', 'allison-saeng-xnANlVZMViA-unsplash', '', 'inherit', 'open', 'closed', '', 'allison-saeng-xnanlvzmvia-unsplash', '', '', '2022-10-11 03:44:49', '2022-10-11 03:44:49', '', 9, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg', 0, 'attachment', 'image/jpeg', 0),
(16, 1, '2022-10-11 03:46:32', '2022-10-11 03:46:32', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'News1', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia', 'publish', 'closed', 'closed', '', 'news1', '', '', '2022-10-11 04:16:10', '2022-10-11 04:16:10', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=16', 0, 'news', '', 0),
(18, 1, '2022-10-26 06:31:44', '2022-10-11 03:48:49', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=18', 1, 'nav_menu_item', '', 0),
(19, 1, '2022-10-11 03:49:36', '2022-10-11 03:49:36', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2022-10-11 03:49:38', '2022-10-11 03:49:38', '', 0, 'http://localhost/wordpress/?page_id=19', 0, 'page', '', 0),
(20, 1, '2022-10-11 03:49:32', '2022-10-11 03:49:32', '{\"version\": 2, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-blankslate', '', '', '2022-10-11 03:49:32', '2022-10-11 03:49:32', '', 0, 'http://localhost/wordpress/2022/10/11/wp-global-styles-blankslate/', 0, 'wp_global_styles', '', 0),
(21, 1, '2022-10-11 03:49:36', '2022-10-11 03:49:36', '', 'Home', '', 'inherit', 'closed', 'closed', '', '19-revision-v1', '', '', '2022-10-11 03:49:36', '2022-10-11 03:49:36', '', 19, 'http://localhost/wordpress/?p=21', 0, 'revision', '', 0),
(22, 1, '2022-10-11 04:11:45', '2022-10-11 04:11:45', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'News2', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia', 'publish', 'closed', 'closed', '', 'news2', '', '', '2022-10-11 04:11:45', '2022-10-11 04:11:45', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=22', 0, 'news', '', 0),
(23, 1, '2022-10-11 04:12:19', '2022-10-11 04:12:19', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'News3', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia', 'publish', 'closed', 'closed', '', 'news3', '', '', '2022-10-11 04:12:19', '2022-10-11 04:12:19', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=23', 0, 'news', '', 0),
(24, 1, '2022-10-11 04:12:50', '2022-10-11 04:12:50', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'News4', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia', 'publish', 'closed', 'closed', '', 'news4', '', '', '2022-10-11 04:14:26', '2022-10-11 04:14:26', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=24', 0, 'news', '', 0),
(25, 1, '2022-10-11 04:16:01', '2022-10-11 04:16:01', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'News1', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', 'inherit', 'closed', 'closed', '', '16-autosave-v1', '', '', '2022-10-11 04:16:01', '2022-10-11 04:16:01', '', 16, 'http://localhost/wordpress/?p=25', 0, 'revision', '', 0),
(28, 1, '2022-10-26 00:03:28', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2022-10-26 00:03:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=28', 0, 'post', '', 0),
(29, 1, '2022-10-26 04:40:15', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-10-26 04:40:15', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=animes&p=29', 0, 'animes', '', 0),
(30, 1, '2022-10-26 06:31:44', '2022-10-26 04:42:06', ' ', '', '', 'publish', 'closed', 'closed', '', '30', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=30', 3, 'nav_menu_item', '', 0),
(31, 1, '2022-10-26 06:31:44', '2022-10-26 04:42:06', ' ', '', '', 'publish', 'closed', 'closed', '', '31', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=31', 4, 'nav_menu_item', '', 0),
(32, 1, '2022-10-26 06:31:44', '2022-10-26 04:42:06', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=32', 5, 'nav_menu_item', '', 0),
(33, 1, '2022-10-26 06:31:44', '2022-10-26 04:42:06', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=33', 6, 'nav_menu_item', '', 0),
(34, 1, '2022-10-26 04:44:33', '2022-10-26 04:44:33', '', 'alternate-world-pharmacy-2', '', 'inherit', 'open', 'closed', '', 'alternate-world-pharmacy-2', '', '', '2022-10-26 04:44:33', '2022-10-26 04:44:33', '', 0, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(35, 1, '2022-10-26 04:44:35', '2022-10-26 04:44:35', '', 'alternate-world-pharmacy-3', '', 'inherit', 'open', 'closed', '', 'alternate-world-pharmacy-3', '', '', '2022-10-26 04:44:35', '2022-10-26 04:44:35', '', 0, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(36, 1, '2022-10-26 04:44:37', '2022-10-26 04:44:37', '', 'alternate-world-pharmacy-1', '', 'inherit', 'open', 'closed', '', 'alternate-world-pharmacy-1', '', '', '2022-10-26 04:44:37', '2022-10-26 04:44:37', '', 0, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(37, 1, '2022-10-26 04:47:07', '2022-10-26 04:47:07', 'a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"animes\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}', 'anime', 'anime', 'publish', 'closed', 'closed', '', 'group_6358bb7c992b0', '', '', '2022-10-26 05:08:06', '2022-10-26 05:08:06', '', 0, 'http://localhost/wordpress/?post_type=acf-field-group&#038;p=37', 0, 'acf-field-group', '', 0),
(46, 1, '2022-10-26 04:47:11', '2022-10-26 04:47:11', 'a:8:{s:4:\"type\";s:11:\"date_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"display_format\";s:6:\"F j, Y\";s:13:\"return_format\";s:6:\"F j, Y\";s:9:\"first_day\";i:1;}', 'Release Date', 'release_date', 'publish', 'closed', 'closed', '', 'field_6358bb9a19584', '', '', '2022-10-26 04:54:40', '2022-10-26 04:54:40', '', 37, 'http://localhost/wordpress/?post_type=acf-field&#038;p=46', 0, 'acf-field', '', 0),
(47, 1, '2022-10-26 04:47:11', '2022-10-26 04:47:11', 'a:12:{s:4:\"type\";s:6:\"number\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:4:\"step\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}', 'Number Episode', 'number_episode', 'publish', 'closed', 'closed', '', 'field_6358bbbd19585', '', '', '2022-10-26 05:08:05', '2022-10-26 05:08:05', '', 37, 'http://localhost/wordpress/?post_type=acf-field&#038;p=47', 1, 'acf-field', '', 0),
(48, 1, '2022-10-26 04:52:38', '2022-10-26 04:52:38', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}', 'Episode Link', 'episode_link', 'publish', 'closed', 'closed', '', 'field_6358bd044b2f7', '', '', '2022-10-26 05:08:05', '2022-10-26 05:08:05', '', 37, 'http://localhost/wordpress/?post_type=acf-field&#038;p=48', 2, 'acf-field', '', 0),
(52, 1, '2022-10-26 04:53:37', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-10-26 04:53:37', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=animes&p=52', 0, 'animes', '', 0),
(53, 1, '2022-10-26 05:10:21', '2022-10-26 05:10:21', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Test', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took', 'publish', 'closed', 'closed', '', 'test', '', '', '2022-10-26 05:19:58', '2022-10-26 05:19:58', '', 0, 'http://localhost/wordpress/?post_type=animes&#038;p=53', 0, 'animes', '', 0),
(54, 1, '2022-10-26 05:16:10', '2022-10-26 05:16:10', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took', 'Test2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took', 'publish', 'closed', 'closed', '', 'test2', '', '', '2022-10-26 05:16:10', '2022-10-26 05:16:10', '', 0, 'http://localhost/wordpress/?post_type=animes&#038;p=54', 0, 'animes', '', 0),
(55, 1, '2022-10-26 05:14:03', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-10-26 05:14:03', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=animes&p=55', 0, 'animes', '', 0),
(56, 1, '2022-10-26 05:14:37', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-10-26 05:14:37', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=animes&p=56', 0, 'animes', '', 0),
(57, 1, '2022-10-26 05:17:03', '2022-10-26 05:17:03', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Test3', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled', 'publish', 'closed', 'closed', '', 'test3', '', '', '2022-10-26 05:19:31', '2022-10-26 05:19:31', '', 0, 'http://localhost/wordpress/?post_type=animes&#038;p=57', 0, 'animes', '', 0),
(58, 1, '2022-10-26 05:17:35', '2022-10-26 05:17:35', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled', 'Test4', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled', 'publish', 'closed', 'closed', '', 'test4', '', '', '2022-10-26 05:17:35', '2022-10-26 05:17:35', '', 0, 'http://localhost/wordpress/?post_type=animes&#038;p=58', 0, 'animes', '', 0),
(59, 1, '2022-10-26 05:19:14', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-10-26 05:19:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=animes&p=59', 0, 'animes', '', 0),
(60, 1, '2022-10-26 06:31:44', '2022-10-26 05:40:19', '', 'Anime List', '', 'publish', 'closed', 'closed', '', 'anime-list', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=60', 7, 'nav_menu_item', '', 0),
(61, 1, '2022-10-26 06:31:44', '2022-10-26 05:40:19', '', 'Genres', '', 'publish', 'closed', 'closed', '', 'genres', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=61', 2, 'nav_menu_item', '', 0),
(62, 1, '2022-10-26 06:31:44', '2022-10-26 05:40:19', '', 'Seasons', '', 'publish', 'closed', 'closed', '', 'seasons', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=62', 8, 'nav_menu_item', '', 0),
(63, 1, '2022-10-26 06:31:44', '2022-10-26 05:40:19', '', 'Articles', '', 'publish', 'closed', 'closed', '', 'articles', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=63', 14, 'nav_menu_item', '', 0),
(64, 1, '2022-10-26 06:16:41', '2022-10-26 06:16:41', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Test5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley', 'publish', 'closed', 'closed', '', 'test5', '', '', '2022-10-26 06:16:41', '2022-10-26 06:16:41', '', 0, 'http://localhost/wordpress/?post_type=animes&#038;p=64', 0, 'animes', '', 0),
(65, 1, '2022-10-26 06:21:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-10-26 06:21:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=animes&p=65', 0, 'animes', '', 0),
(66, 1, '2022-10-26 06:23:27', '2022-10-26 06:23:27', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Test6', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ', 'publish', 'closed', 'closed', '', 'test6', '', '', '2022-10-26 06:23:27', '2022-10-26 06:23:27', '', 0, 'http://localhost/wordpress/?post_type=animes&#038;p=66', 0, 'animes', '', 0),
(67, 1, '2022-10-26 06:31:44', '2022-10-26 06:30:09', ' ', '', '', 'publish', 'closed', 'closed', '', '67', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=67', 9, 'nav_menu_item', '', 0),
(68, 1, '2022-10-26 06:31:44', '2022-10-26 06:30:09', ' ', '', '', 'publish', 'closed', 'closed', '', '68', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=68', 10, 'nav_menu_item', '', 0),
(69, 1, '2022-10-26 06:31:44', '2022-10-26 06:30:09', ' ', '', '', 'publish', 'closed', 'closed', '', '69', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=69', 11, 'nav_menu_item', '', 0),
(70, 1, '2022-10-26 06:31:44', '2022-10-26 06:30:09', ' ', '', '', 'publish', 'closed', 'closed', '', '70', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=70', 12, 'nav_menu_item', '', 0),
(71, 1, '2022-10-26 06:31:44', '2022-10-26 06:30:09', ' ', '', '', 'publish', 'closed', 'closed', '', '71', '', '', '2022-10-26 06:31:44', '2022-10-26 06:31:44', '', 0, 'http://localhost/wordpress/?p=71', 13, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_404_logs`
--

CREATE TABLE `wp_rank_math_404_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `accessed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `times_accessed` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `referer` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_internal_links`
--

CREATE TABLE `wp_rank_math_internal_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `target_post_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_internal_meta`
--

CREATE TABLE `wp_rank_math_internal_meta` (
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `internal_link_count` int(10) UNSIGNED DEFAULT 0,
  `external_link_count` int(10) UNSIGNED DEFAULT 0,
  `incoming_link_count` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Tak Berkategori', 'tak-berkategori', 0),
(2, 'News Updates', 'news-updates', 0),
(3, 'COVID-19 Events', 'covid-19-events', 0),
(4, 'Main Menu', 'main-menu', 0),
(5, 'blankslate', 'blankslate', 0),
(6, 'Action', 'action', 0),
(7, 'Comedy', 'comedy', 0),
(8, 'Sport', 'sport', 0),
(9, 'Romance', 'romance', 0),
(10, 'Winter 2022', 'winter-2022', 0),
(11, 'Summer 2022', 'summer-2022', 0),
(12, 'Spring 2022', 'spring-2022', 0),
(13, 'Fall 2022', 'fall-2022', 0),
(14, 'Winter 2023', 'winter-2023', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(16, 2, 0),
(18, 4, 0),
(20, 5, 0),
(22, 3, 0),
(23, 3, 0),
(24, 2, 0),
(30, 4, 0),
(31, 4, 0),
(32, 4, 0),
(33, 4, 0),
(53, 6, 0),
(53, 7, 0),
(54, 6, 0),
(54, 7, 0),
(57, 7, 0),
(57, 9, 0),
(58, 6, 0),
(58, 7, 0),
(58, 8, 0),
(60, 4, 0),
(61, 4, 0),
(62, 4, 0),
(63, 4, 0),
(64, 6, 0),
(64, 7, 0),
(66, 7, 0),
(66, 9, 0),
(66, 10, 0),
(66, 12, 0),
(67, 4, 0),
(68, 4, 0),
(69, 4, 0),
(70, 4, 0),
(71, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'news-category', '', 0, 2),
(3, 3, 'news-category', '', 0, 2),
(4, 4, 'nav_menu', '', 0, 14),
(5, 5, 'wp_theme', '', 0, 1),
(6, 6, 'genres', '', 0, 4),
(7, 7, 'genres', '', 0, 6),
(8, 8, 'genres', '', 0, 1),
(9, 9, 'genres', '', 0, 2),
(10, 10, 'seasons', '', 0, 1),
(11, 11, 'seasons', '', 0, 0),
(12, 12, 'seasons', '', 0, 1),
(13, 13, 'seasons', '', 0, 0),
(14, 14, 'seasons', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'smkn1surabaya'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '0'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '28'),
(18, 2, 'nickname', 'admin'),
(19, 2, 'first_name', 'Admin'),
(20, 2, 'last_name', 'Admin'),
(21, 2, 'description', ''),
(22, 2, 'rich_editing', 'true'),
(23, 2, 'syntax_highlighting', 'true'),
(24, 2, 'comment_shortcuts', 'false'),
(25, 2, 'admin_color', 'fresh'),
(26, 2, 'use_ssl', '0'),
(27, 2, 'show_admin_bar_front', 'true'),
(28, 2, 'locale', 'en_US'),
(29, 2, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(30, 2, 'wp_user_level', '10'),
(31, 2, 'dismissed_wp_pointers', ''),
(32, 3, 'nickname', 'irfan_LKS'),
(33, 3, 'first_name', 'irfan'),
(34, 3, 'last_name', 'LKS'),
(35, 3, 'description', ''),
(36, 3, 'rich_editing', 'true'),
(37, 3, 'syntax_highlighting', 'true'),
(38, 3, 'comment_shortcuts', 'false'),
(39, 3, 'admin_color', 'fresh'),
(40, 3, 'use_ssl', '0'),
(41, 3, 'show_admin_bar_front', 'true'),
(42, 3, 'locale', 'en_US'),
(43, 3, 'wp_capabilities', 'a:1:{s:6:\"editor\";b:1;}'),
(44, 3, 'wp_user_level', '7'),
(45, 3, 'dismissed_wp_pointers', ''),
(47, 1, 'manageedit-postcolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(48, 1, 'manageedit-postcolumnshidden_default', '1'),
(49, 1, 'manageedit-pagecolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(50, 1, 'manageedit-pagecolumnshidden_default', '1'),
(51, 2, '_yoast_wpseo_profile_updated', '1666759127'),
(52, 3, '_yoast_wpseo_profile_updated', '1666759127'),
(53, 1, '_yoast_wpseo_profile_updated', '1666759127'),
(56, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(57, 1, 'metaboxhidden_dashboard', 'a:3:{i:0;s:21:\"dashboard_site_health\";i:1;s:24:\"wpseo-dashboard-overview\";i:2;s:17:\"dashboard_primary\";}'),
(58, 4, 'nickname', 'admin20'),
(59, 4, 'first_name', 'admin'),
(60, 4, 'last_name', '20'),
(61, 4, 'description', ''),
(62, 4, 'rich_editing', 'true'),
(63, 4, 'syntax_highlighting', 'true'),
(64, 4, 'comment_shortcuts', 'false'),
(65, 4, 'admin_color', 'fresh'),
(66, 4, 'use_ssl', '0'),
(67, 4, 'show_admin_bar_front', 'true'),
(68, 4, 'locale', ''),
(69, 4, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(70, 4, 'wp_user_level', '10'),
(71, 4, '_yoast_wpseo_profile_updated', '1666759127'),
(72, 4, 'dismissed_wp_pointers', ''),
(73, 4, 'facebook', ''),
(74, 4, 'instagram', ''),
(75, 4, 'linkedin', ''),
(76, 4, 'myspace', ''),
(77, 4, 'pinterest', ''),
(78, 4, 'soundcloud', ''),
(79, 4, 'tumblr', ''),
(80, 4, 'twitter', ''),
(81, 4, 'youtube', ''),
(82, 4, 'wikipedia', ''),
(83, 5, 'nickname', '20editor'),
(84, 5, 'first_name', '20editor'),
(85, 5, 'last_name', '20editor'),
(86, 5, 'description', ''),
(87, 5, 'rich_editing', 'true'),
(88, 5, 'syntax_highlighting', 'true'),
(89, 5, 'comment_shortcuts', 'false'),
(90, 5, 'admin_color', 'fresh'),
(91, 5, 'use_ssl', '0'),
(92, 5, 'show_admin_bar_front', 'true'),
(93, 5, 'locale', ''),
(94, 5, 'wp_capabilities', 'a:1:{s:6:\"editor\";b:1;}'),
(95, 5, 'wp_user_level', '7'),
(96, 5, '_yoast_wpseo_profile_updated', '1666759127'),
(97, 5, 'dismissed_wp_pointers', ''),
(98, 5, 'facebook', ''),
(99, 5, 'instagram', ''),
(100, 5, 'linkedin', ''),
(101, 5, 'myspace', ''),
(102, 5, 'pinterest', ''),
(103, 5, 'soundcloud', ''),
(104, 5, 'tumblr', ''),
(105, 5, 'twitter', ''),
(106, 5, 'youtube', ''),
(107, 5, 'wikipedia', ''),
(109, 1, 'aiowps_last_login_time', '2022-10-26 04:45:29'),
(110, 1, 'meta-box-order_news', 'a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:44:\"submitdiv,tagsdiv-news-category,postimagediv\";s:6:\"normal\";s:30:\"wpseo_meta,postexcerpt,slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
(111, 1, 'screen_layout_news', '2'),
(112, 1, 'wp_user-settings', 'libraryContent=browse'),
(113, 1, 'wp_user-settings-time', '1665459908'),
(114, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(115, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:18:\"add-post-type-news\";}'),
(116, 1, 'nav_menu_recently_edited', '4'),
(117, 1, 'closedpostboxes_nav-menus', 'a:0:{}'),
(118, 6, 'nickname', 'subscriber'),
(119, 6, 'first_name', ''),
(120, 6, 'last_name', ''),
(121, 6, 'description', ''),
(122, 6, 'rich_editing', 'true'),
(123, 6, 'syntax_highlighting', 'true'),
(124, 6, 'comment_shortcuts', 'false'),
(125, 6, 'admin_color', 'fresh'),
(126, 6, 'use_ssl', '0'),
(127, 6, 'show_admin_bar_front', 'true'),
(128, 6, 'locale', ''),
(129, 6, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(130, 6, 'wp_user_level', '0'),
(131, 6, '_yoast_wpseo_profile_updated', '1666758403'),
(132, 6, 'dismissed_wp_pointers', ''),
(136, 1, 'session_tokens', 'a:1:{s:64:\"94bb1e5abf81120436f5a76bf028623ec7f663c1d3ecc67024eb7204446722f0\";a:4:{s:10:\"expiration\";i:1666932329;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36\";s:5:\"login\";i:1666759529;}}'),
(138, 1, 'wp_yoast_notifications', 'a:1:{i:0;a:2:{s:7:\"message\";s:339:\"<p>We see that you enabled automatic updates for WordPress. We recommend that you do this for Yoast SEO as well. This way we can guarantee that WordPress and Yoast SEO will continue to run smoothly together. <a href=\"http://localhost/wordpress/wp-admin/plugins.php\">Go to your plugins overview to enable auto-updates for Yoast SEO.</a></p>\";s:7:\"options\";a:10:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:17:\"wpseo-auto-update\";s:4:\"user\";O:7:\"WP_User\":8:{s:4:\"data\";O:8:\"stdClass\":10:{s:2:\"ID\";s:1:\"1\";s:10:\"user_login\";s:13:\"smkn1surabaya\";s:9:\"user_pass\";s:34:\"$P$BHQHTuh2hpno1Dw5MDOlpKLyFNOgAl.\";s:13:\"user_nicename\";s:13:\"smkn1surabaya\";s:10:\"user_email\";s:21:\"aswinarung1@gmail.com\";s:8:\"user_url\";s:26:\"http://localhost/wordpress\";s:15:\"user_registered\";s:19:\"2022-10-11 02:26:43\";s:19:\"user_activation_key\";s:0:\"\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:13:\"smkn1surabaya\";}s:2:\"ID\";i:1;s:4:\"caps\";a:1:{s:13:\"administrator\";b:1;}s:7:\"cap_key\";s:15:\"wp_capabilities\";s:5:\"roles\";a:1:{i:0;s:13:\"administrator\";}s:7:\"allcaps\";a:87:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;s:23:\"rank_math_edit_htaccess\";b:1;s:16:\"rank_math_titles\";b:1;s:17:\"rank_math_general\";b:1;s:17:\"rank_math_sitemap\";b:1;s:21:\"rank_math_404_monitor\";b:1;s:22:\"rank_math_link_builder\";b:1;s:22:\"rank_math_redirections\";b:1;s:22:\"rank_math_role_manager\";b:1;s:19:\"rank_math_analytics\";b:1;s:23:\"rank_math_site_analysis\";b:1;s:25:\"rank_math_onpage_analysis\";b:1;s:24:\"rank_math_onpage_general\";b:1;s:25:\"rank_math_onpage_advanced\";b:1;s:24:\"rank_math_onpage_snippet\";b:1;s:23:\"rank_math_onpage_social\";b:1;s:20:\"rank_math_content_ai\";b:1;s:19:\"rank_math_admin_bar\";b:1;s:23:\"wf2fa_activate_2fa_self\";b:1;s:25:\"wf2fa_activate_2fa_others\";b:1;s:21:\"wf2fa_manage_settings\";b:1;s:11:\"smartslider\";b:1;s:18:\"smartslider_config\";b:1;s:16:\"smartslider_edit\";b:1;s:18:\"smartslider_delete\";b:1;s:13:\"administrator\";b:1;}s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;}s:5:\"nonce\";N;s:8:\"priority\";d:0.8;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";s:20:\"wpseo_manage_options\";s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'smkn1surabaya', '$P$BHQHTuh2hpno1Dw5MDOlpKLyFNOgAl.', 'smkn1surabaya', 'aswinarung1@gmail.com', 'http://localhost/wordpress', '2022-10-11 02:26:43', '', 0, 'smkn1surabaya'),
(2, 'admin', '$P$B2i7Sm5F8ciW7gYM30ZWcRimcbCUcu.', 'admin', 'admin@gmail.com', '', '2022-10-11 02:27:50', '1665455270:$P$BhgIa0jeffpWTPBM3V7j2moZai.8nh1', 0, 'Admin Admin'),
(3, 'irfan_LKS', '$P$BRUEAj5dV.mzud/cOa/Jv/V7Eo50Fs/', 'irfan_lks', 'irfan_LKS@gmail.com', '', '2022-10-11 02:28:29', '1665455309:$P$BG7vtzCw9cr1BWvRPhBe7otgbwxsci0', 0, 'irfan LKS'),
(4, 'admin20', '$P$BvXx6iEz1LSzGjs69fucfcWtmfpWur0', 'admin20', 'admin20@gmail.com', '', '2022-10-11 03:35:44', '1665459344:$P$BOnrbo2AU53oxbCioKTux8NMsZWirA0', 0, 'admin 20'),
(5, '20editor', '$P$BRS2rCoJnTTUbSHTCKYuUBormNSAxA/', '20editor', '20editor@gmail.com', '', '2022-10-11 03:36:16', '1665459376:$P$B36x11xGN0qf7YE49.xn6z3o.VgEZB/', 0, '20editor 20editor'),
(6, 'subscriber', '$P$BPNYos3UU.IJ3A1qPmfhe6rkPFWX3R/', 'subscriber', 'subscriber@gmail.com', '', '2022-10-26 04:26:43', '', 0, 'subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfblockediplog`
--

CREATE TABLE `wp_wfblockediplog` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `countryCode` varchar(2) NOT NULL,
  `blockCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unixday` int(10) UNSIGNED NOT NULL,
  `blockType` varchar(50) NOT NULL DEFAULT 'generic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfblocks7`
--

CREATE TABLE `wp_wfblocks7` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `blockedTime` bigint(20) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int(10) UNSIGNED DEFAULT 0,
  `blockedHits` int(10) UNSIGNED DEFAULT 0,
  `expiration` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfconfig`
--

CREATE TABLE `wp_wfconfig` (
  `name` varchar(100) NOT NULL,
  `val` longblob DEFAULT NULL,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_wfconfig`
--

INSERT INTO `wp_wfconfig` (`name`, `val`, `autoload`) VALUES
('activatingIP', 0x3a3a31, 'yes'),
('actUpdateInterval', 0x32, 'yes'),
('addCacheComment', 0x30, 'yes'),
('adminUserList', 0x623a303b, 'yes'),
('advancedCommentScanning', 0x31, 'yes'),
('ajaxWatcherDisabled_admin', 0x30, 'yes'),
('ajaxWatcherDisabled_front', 0x30, 'yes'),
('alertEmails', 0x617377696e6172756e673140676d61696c2e636f6d, 'yes'),
('alertOn_adminLogin', 0x31, 'yes'),
('alertOn_block', 0x31, 'yes'),
('alertOn_breachLogin', 0x31, 'yes'),
('alertOn_firstAdminLoginOnly', 0x30, 'yes'),
('alertOn_firstNonAdminLoginOnly', 0x30, 'yes'),
('alertOn_loginLockout', 0x31, 'yes'),
('alertOn_lostPasswdForm', 0x31, 'yes'),
('alertOn_nonAdminLogin', 0x30, 'yes'),
('alertOn_scanIssues', 0x31, 'yes'),
('alertOn_severityLevel', 0x3235, 'yes'),
('alertOn_throttle', 0x30, 'yes'),
('alertOn_update', 0x30, 'yes'),
('alertOn_wafDeactivated', 0x31, 'yes'),
('alertOn_wordfenceDeactivated', 0x31, 'yes'),
('alert_maxHourly', 0x30, 'yes'),
('allowed404s', 0x2f66617669636f6e2e69636f0a2f6170706c652d746f7563682d69636f6e2a2e706e670a2f2a4032782e706e670a2f62726f77736572636f6e6669672e786d6c, 'yes'),
('allowed404s6116Migration', 0x31, 'yes'),
('allowHTTPSCaching', 0x30, 'yes'),
('allowLegacy2FA', 0x30, 'yes'),
('allowMySQLi', 0x31, 'yes'),
('allScansScheduled', 0x613a303a7b7d, 'yes'),
('apiKey', 0x33326238373861313438313737356139393430643133616431336563343864636333373638396166386365636534333132326539643264376665643061386436353334383365343333663439303136623662333130656336303866303538396333363136366234383064613138623562643065373932323431383537666461623861623838326632373932306339363437353863336565653439356236316334, 'yes'),
('autoBlockScanners', 0x31, 'yes'),
('autoUpdate', 0x31, 'yes'),
('autoUpdateAttempts', 0x30, 'yes'),
('autoUpdateChoice', 0x31, 'yes'),
('bannedURLs', '', 'yes'),
('blockCustomText', '', 'yes'),
('blockedTime', 0x333030, 'yes'),
('blocks702Migration', 0x31, 'yes'),
('cacheType', 0x64697361626c6564, 'yes'),
('cbl_action', 0x626c6f636b, 'yes'),
('cbl_bypassRedirDest', '', 'yes'),
('cbl_bypassRedirURL', '', 'yes'),
('cbl_bypassViewURL', '', 'yes'),
('cbl_cookieVal', 0x36333434646364656363373262, 'yes'),
('cbl_loggedInBlocked', '', 'yes'),
('cbl_redirURL', '', 'yes'),
('cbl_restOfSiteBlocked', 0x31, 'yes'),
('checkSpamIP', 0x31, 'yes'),
('config701Migration', 0x31, 'yes'),
('config720Migration', 0x31, 'yes'),
('currentCronKey', '', 'yes'),
('dashboardData', 0x613a343a7b733a393a2267656e657261746564223b693a313636353435353234313b733a333a22746466223b613a333a7b733a393a22636f6d6d756e697479223b693a353139343b733a373a227072656d69756d223b693a353232323b733a393a22626c61636b6c697374223b693a393534343b7d733a31303a2261747461636b64617461223b613a333a7b733a333a22323468223b613a32343a7b693a303b613a323a7b733a313a2274223b693a313636353336373230303b733a313a2263223b693a31353939393732393b7d693a313b613a323a7b733a313a2274223b693a313636353337303830303b733a313a2263223b693a31383630393534313b7d693a323b613a323a7b733a313a2274223b693a313636353337343430303b733a313a2263223b693a32303636393237353b7d693a333b613a323a7b733a313a2274223b693a313636353337383030303b733a313a2263223b693a32313535303234383b7d693a343b613a323a7b733a313a2274223b693a313636353338313630303b733a313a2263223b693a32303237393634323b7d693a353b613a323a7b733a313a2274223b693a313636353338353230303b733a313a2263223b693a31393433373137333b7d693a363b613a323a7b733a313a2274223b693a313636353338383830303b733a313a2263223b693a31373539303536333b7d693a373b613a323a7b733a313a2274223b693a313636353339323430303b733a313a2263223b693a31353137333632393b7d693a383b613a323a7b733a313a2274223b693a313636353339363030303b733a313a2263223b693a31343732323339373b7d693a393b613a323a7b733a313a2274223b693a313636353339393630303b733a313a2263223b693a31343433333538323b7d693a31303b613a323a7b733a313a2274223b693a313636353430333230303b733a313a2263223b693a31333136363137323b7d693a31313b613a323a7b733a313a2274223b693a313636353430363830303b733a313a2263223b693a31333632343337363b7d693a31323b613a323a7b733a313a2274223b693a313636353431303430303b733a313a2263223b693a31333634313334353b7d693a31333b613a323a7b733a313a2274223b693a313636353431343030303b733a313a2263223b693a31333430393434313b7d693a31343b613a323a7b733a313a2274223b693a313636353431373630303b733a313a2263223b693a31303131333538323b7d693a31353b613a323a7b733a313a2274223b693a313636353432313230303b733a313a2263223b693a31313938363033363b7d693a31363b613a323a7b733a313a2274223b693a313636353432343830303b733a313a2263223b693a31323239353633323b7d693a31373b613a323a7b733a313a2274223b693a313636353432383430303b733a313a2263223b693a31323631363232313b7d693a31383b613a323a7b733a313a2274223b693a313636353433323030303b733a313a2263223b693a31323430373036373b7d693a31393b613a323a7b733a313a2274223b693a313636353433353630303b733a313a2263223b693a31323138323434343b7d693a32303b613a323a7b733a313a2274223b693a313636353433393230303b733a313a2263223b693a31323030393737393b7d693a32313b613a323a7b733a313a2274223b693a313636353434323830303b733a313a2263223b693a31313836303031333b7d693a32323b613a323a7b733a313a2274223b693a313636353434363430303b733a313a2263223b693a31313734343537313b7d693a32333b613a323a7b733a313a2274223b693a313636353435303030303b733a313a2263223b693a31313734373534353b7d7d733a323a223764223b613a373a7b693a303b613a323a7b733a313a2274223b693a313636343834313630303b733a313a2263223b693a3339313238393239363b7d693a313b613a323a7b733a313a2274223b693a313636343932383030303b733a313a2263223b693a3336393638303033303b7d693a323b613a323a7b733a313a2274223b693a313636353031343430303b733a313a2263223b693a3339303630353537383b7d693a333b613a323a7b733a313a2274223b693a313636353130303830303b733a313a2263223b693a3333343235383633323b7d693a343b613a323a7b733a313a2274223b693a313636353138373230303b733a313a2263223b693a3335303636393336323b7d693a353b613a323a7b733a313a2274223b693a313636353237333630303b733a313a2263223b693a3336343536383036353b7d693a363b613a323a7b733a313a2274223b693a313636353336303030303b733a313a2263223b693a3335393730333932373b7d7d733a333a22333064223b613a33303a7b693a303b613a323a7b733a313a2274223b693a313636323835343430303b733a313a2263223b693a3339373231353334373b7d693a313b613a323a7b733a313a2274223b693a313636323934303830303b733a313a2263223b693a3435383132303034393b7d693a323b613a323a7b733a313a2274223b693a313636333032373230303b733a313a2263223b693a3431323330313736343b7d693a333b613a323a7b733a313a2274223b693a313636333131333630303b733a313a2263223b693a3336383432353934373b7d693a343b613a323a7b733a313a2274223b693a313636333230303030303b733a313a2263223b693a3435343233373035353b7d693a353b613a323a7b733a313a2274223b693a313636333238363430303b733a313a2263223b693a3434383539323334343b7d693a363b613a323a7b733a313a2274223b693a313636333337323830303b733a313a2263223b693a3338363337383830343b7d693a373b613a323a7b733a313a2274223b693a313636333435393230303b733a313a2263223b693a3434363937343732313b7d693a383b613a323a7b733a313a2274223b693a313636333534353630303b733a313a2263223b693a3430323537363132353b7d693a393b613a323a7b733a313a2274223b693a313636333633323030303b733a313a2263223b693a3332353634333033383b7d693a31303b613a323a7b733a313a2274223b693a313636333731383430303b733a313a2263223b693a3338343139373130393b7d693a31313b613a323a7b733a313a2274223b693a313636333830343830303b733a313a2263223b693a3338393235373135333b7d693a31323b613a323a7b733a313a2274223b693a313636333839313230303b733a313a2263223b693a3437313937393232303b7d693a31333b613a323a7b733a313a2274223b693a313636333937373630303b733a313a2263223b693a3433303032333434363b7d693a31343b613a323a7b733a313a2274223b693a313636343036343030303b733a313a2263223b693a3432393633303831313b7d693a31353b613a323a7b733a313a2274223b693a313636343135303430303b733a313a2263223b693a3338323832303534313b7d693a31363b613a323a7b733a313a2274223b693a313636343233363830303b733a313a2263223b693a3337363436313936353b7d693a31373b613a323a7b733a313a2274223b693a313636343332333230303b733a313a2263223b693a3336363437363033343b7d693a31383b613a323a7b733a313a2274223b693a313636343430393630303b733a313a2263223b693a3431323238323032353b7d693a31393b613a323a7b733a313a2274223b693a313636343439363030303b733a313a2263223b693a3335343338363238303b7d693a32303b613a323a7b733a313a2274223b693a313636343538323430303b733a313a2263223b693a3432303630303631393b7d693a32313b613a323a7b733a313a2274223b693a313636343636383830303b733a313a2263223b693a3330393633353834353b7d693a32323b613a323a7b733a313a2274223b693a313636343735353230303b733a313a2263223b693a3337373838383930353b7d693a32333b613a323a7b733a313a2274223b693a313636343834313630303b733a313a2263223b693a3339313238393239363b7d693a32343b613a323a7b733a313a2274223b693a313636343932383030303b733a313a2263223b693a3336393638303033303b7d693a32353b613a323a7b733a313a2274223b693a313636353031343430303b733a313a2263223b693a3339303630353537383b7d693a32363b613a323a7b733a313a2274223b693a313636353130303830303b733a313a2263223b693a3333343235383633323b7d693a32373b613a323a7b733a313a2274223b693a313636353138373230303b733a313a2263223b693a3335303636393336323b7d693a32383b613a323a7b733a313a2274223b693a313636353237333630303b733a313a2263223b693a3336343536383036353b7d693a32393b613a323a7b733a313a2274223b693a313636353336303030303b733a313a2263223b693a3335393730333932373b7d7d7d733a393a22636f756e7472696573223b613a313a7b733a323a223764223b613a31303a7b693a303b613a323a7b733a323a226364223b733a323a225553223b733a323a226374223b693a3832363533343337393b7d693a313b613a323a7b733a323a226364223b733a323a224445223b733a323a226374223b693a3232343538393339333b7d693a323b613a323a7b733a323a226364223b733a323a225452223b733a323a226374223b693a3139303939353434303b7d693a333b613a323a7b733a323a226364223b733a323a225347223b733a323a226374223b693a3138333539343030343b7d693a343b613a323a7b733a323a226364223b733a323a224742223b733a323a226374223b693a3135373534383837313b7d693a353b613a323a7b733a323a226364223b733a323a224652223b733a323a226374223b693a3135313534363137363b7d693a363b613a323a7b733a323a226364223b733a323a22494e223b733a323a226374223b693a3132353832363435313b7d693a373b613a323a7b733a323a226364223b733a323a224e4c223b733a323a226374223b693a39363838373038323b7d693a383b613a323a7b733a323a226364223b733a323a22434e223b733a323a226374223b693a39363632363833393b7d693a393b613a323a7b733a323a226364223b733a323a22564e223b733a323a226374223b693a39313633313631313b7d7d7d7d, 'yes'),
('dbTest', 0x613a313a7b733a353a226e6f6e6365223b733a36343a2230616134353362633436396364613162343732326465626536663064356339306432366566643833376263373533326462326230323466653436306233383137223b7d, 'no'),
('dbVersion', 0x31302e342e32342d4d617269614442, 'yes'),
('debugOn', 0x30, 'yes'),
('deleteTablesOnDeact', 0x30, 'yes'),
('detectProxyNextCheck', 0x31363636303632313733, 'no'),
('detectProxyNonce', 0x34626631353666653663343133623331613634646236663534343436313937396333623866386635353133313564326332366431316337623835636231316561, 'no'),
('detectProxyRecommendation', '', 'no'),
('diagnosticsWflogsRemovalHistory', 0x5b5d, 'no'),
('disableCodeExecutionUploads', 0x30, 'yes'),
('disableConfigCaching', 0x30, 'yes'),
('disableWAFIPBlocking', 0x30, 'yes'),
('disclosureStates', 0x613a313a7b733a32323a227761662d6f7074696f6e732d6272757465666f726365223b623a313b7d, 'yes'),
('dismissAutoPrependNotice', 0x30, 'yes'),
('displayAutomaticBlocks', 0x31, 'yes'),
('displayTopLevelBlocking', 0x30, 'yes'),
('displayTopLevelLiveTraffic', 0x30, 'yes'),
('displayTopLevelOptions', 0x31, 'yes'),
('email_summary_dashboard_widget_enabled', 0x31, 'yes'),
('email_summary_enabled', 0x31, 'yes'),
('email_summary_excluded_directories', 0x77702d636f6e74656e742f63616368652c77702d636f6e74656e742f77666c6f6773, 'yes'),
('email_summary_interval', 0x7765656b6c79, 'yes'),
('enableRemoteIpLookup', 0x31, 'yes'),
('encKey', 0x65656666633338323531663161373133, 'yes'),
('fileContentsGSB6315Migration', 0x31, 'yes'),
('firewallEnabled', 0x31, 'yes'),
('hasKeyConflict', 0x30, 'yes'),
('howGetIPs', '', 'yes'),
('howGetIPs_trusted_proxies', '', 'yes'),
('isPaid', '', 'yes'),
('keyType', 0x66726565, 'yes'),
('lastBlockAggregation', 0x31363635343537333732, 'yes'),
('lastDailyCron', 0x31363635343537343334, 'yes'),
('lastDashboardCheck', 0x31363635343537343336, 'yes'),
('lastEmailHash', 0x313636353435373830383a3163663462383333393638633930363830613861373964353861313431396565, 'yes'),
('lastPermissionsTemplateCheck', 0x31363635343537343730, 'yes'),
('lastScanCompleted', 0x6f6b, 'yes'),
('lastScanFailureType', '', 'yes'),
('liveActivityPauseEnabled', 0x31, 'yes'),
('liveTrafficEnabled', 0x30, 'yes'),
('liveTraf_displayExpandedRecords', 0x30, 'no'),
('liveTraf_ignoreIPs', '', 'yes'),
('liveTraf_ignorePublishers', 0x31, 'yes'),
('liveTraf_ignoreUA', '', 'yes'),
('liveTraf_ignoreUsers', '', 'yes'),
('liveTraf_maxAge', 0x3330, 'yes'),
('liveTraf_maxRows', 0x32303030, 'yes'),
('loginSecurityEnabled', 0x31, 'yes'),
('loginSec_blockAdminReg', 0x31, 'yes'),
('loginSec_breachPasswds', 0x61646d696e73, 'yes'),
('loginSec_breachPasswds_enabled', 0x31, 'yes'),
('loginSec_countFailMins', 0x323430, 'yes'),
('loginSec_disableApplicationPasswords', 0x31, 'yes'),
('loginSec_disableAuthorScan', 0x31, 'yes'),
('loginSec_disableOEmbedAuthor', 0x30, 'yes'),
('loginSec_enableSeparateTwoFactor', '', 'yes'),
('loginSec_lockInvalidUsers', 0x30, 'yes'),
('loginSec_lockoutMins', 0x323430, 'yes'),
('loginSec_maskLoginErrors', 0x31, 'yes'),
('loginSec_maxFailures', 0x3230, 'yes'),
('loginSec_maxForgotPasswd', 0x3230, 'yes'),
('loginSec_requireAdminTwoFactor', 0x30, 'yes'),
('loginSec_strongPasswds', 0x70756273, 'yes'),
('loginSec_strongPasswds_enabled', 0x31, 'yes'),
('loginSec_userBlacklist', '', 'yes'),
('longEncKey', 0x61366432326431623166656363346162343763663939323033356334373533613539303664366535343061383838313234633633383662393738653532666432, 'yes'),
('lowResourceScansEnabled', 0x30, 'yes'),
('lowResourceScanWaitStep', '', 'yes'),
('manualScanType', 0x6f6e63654461696c79, 'yes'),
('max404Crawlers', 0x44495341424c4544, 'yes'),
('max404Crawlers_action', 0x7468726f74746c65, 'yes'),
('max404Humans', 0x44495341424c4544, 'yes'),
('max404Humans_action', 0x7468726f74746c65, 'yes'),
('maxExecutionTime', 0x30, 'yes'),
('maxGlobalRequests', 0x44495341424c4544, 'yes'),
('maxGlobalRequests_action', 0x7468726f74746c65, 'yes'),
('maxMem', 0x323536, 'yes'),
('maxRequestsCrawlers', 0x44495341424c4544, 'yes'),
('maxRequestsCrawlers_action', 0x7468726f74746c65, 'yes'),
('maxRequestsHumans', 0x44495341424c4544, 'yes'),
('maxRequestsHumans_action', 0x7468726f74746c65, 'yes'),
('migration636_email_summary_excluded_directories', 0x31, 'no'),
('needsNewTour_blocking', 0x31, 'yes'),
('needsNewTour_dashboard', 0x31, 'yes'),
('needsNewTour_firewall', 0x31, 'yes'),
('needsNewTour_livetraffic', 0x31, 'yes'),
('needsNewTour_loginsecurity', 0x31, 'yes'),
('needsNewTour_scan', 0x31, 'yes'),
('needsUpgradeTour_blocking', 0x30, 'yes'),
('needsUpgradeTour_dashboard', 0x30, 'yes'),
('needsUpgradeTour_firewall', 0x30, 'yes'),
('needsUpgradeTour_livetraffic', 0x30, 'yes'),
('needsUpgradeTour_loginsecurity', 0x30, 'yes'),
('needsUpgradeTour_scan', 0x30, 'yes'),
('neverBlockBG', 0x6e65766572426c6f636b5665726966696564, 'yes'),
('noc1ScanSchedule', 0x613a333a7b693a303b693a313636353538343430303b693a313b693a313636353834333630303b693a323b693a313636363130323830303b7d, 'yes'),
('notification_blogHighlights', 0x31, 'yes'),
('notification_productUpdates', 0x31, 'yes'),
('notification_promotions', 0x31, 'yes'),
('notification_scanStatus', 0x31, 'yes'),
('notification_securityAlerts', 0x31, 'yes'),
('notification_updatesNeeded', 0x31, 'yes'),
('onboardingAttempt1', 0x736b6970706564, 'yes'),
('onboardingAttempt2', 0x6c6963656e7365, 'yes'),
('onboardingAttempt3', '', 'no'),
('onboardingAttempt3Initial', 0x30, 'yes'),
('other_blockBadPOST', 0x30, 'yes'),
('other_bypassLitespeedNoabort', 0x30, 'yes'),
('other_hideWPVersion', 0x30, 'yes'),
('other_pwStrengthOnUpdate', 0x31, 'yes'),
('other_scanComments', 0x31, 'yes'),
('other_scanOutside', 0x30, 'yes'),
('other_WFNet', 0x31, 'yes'),
('previousWflogsFileList', 0x5b222e6874616363657373222c2261747461636b2d646174612e706870222c22636f6e6669672d6c6976657761662e706870222c22636f6e6669672d73796e6365642e706870222c22636f6e6669672d7472616e7369656e742e706870222c22636f6e6669672e706870222c2247656f4c697465322d436f756e7472792e6d6d6462222c226970732e706870222c2272756c65732e706870222c2274656d706c6174652e706870225d, 'yes'),
('scanAjaxTestSuccessful', 0x31, 'yes'),
('scanMonitorLastAttempt', 0x31363635343537343338, 'yes'),
('scanMonitorLastAttemptMode', 0x717569636b, 'yes'),
('scanMonitorLastAttemptWasFork', '', 'yes'),
('scanMonitorLastSuccess', 0x31363635343537343433, 'yes'),
('scanMonitorRemainingResumeAttempts', 0x32, 'yes'),
('scansEnabled_checkGSB', 0x31, 'yes'),
('scansEnabled_checkHowGetIPs', 0x31, 'yes'),
('scansEnabled_checkReadableConfig', 0x31, 'yes'),
('scansEnabled_comments', 0x31, 'yes'),
('scansEnabled_core', 0x31, 'yes'),
('scansEnabled_coreUnknown', 0x31, 'yes'),
('scansEnabled_diskSpace', 0x31, 'yes'),
('scansEnabled_fileContents', 0x31, 'yes'),
('scansEnabled_fileContentsGSB', 0x31, 'yes'),
('scansEnabled_geoipSupport', 0x31, 'yes'),
('scansEnabled_highSense', 0x30, 'yes'),
('scansEnabled_malware', 0x31, 'yes'),
('scansEnabled_oldVersions', 0x31, 'yes'),
('scansEnabled_options', 0x31, 'yes'),
('scansEnabled_passwds', 0x31, 'yes'),
('scansEnabled_plugins', 0x30, 'yes'),
('scansEnabled_posts', 0x31, 'yes'),
('scansEnabled_scanImages', 0x30, 'yes'),
('scansEnabled_suspectedFiles', 0x31, 'yes'),
('scansEnabled_suspiciousAdminUsers', 0x31, 'yes'),
('scansEnabled_suspiciousOptions', 0x31, 'yes'),
('scansEnabled_themes', 0x30, 'yes'),
('scansEnabled_wafStatus', 0x31, 'yes'),
('scansEnabled_wpscan_directoryListingEnabled', 0x31, 'yes'),
('scansEnabled_wpscan_fullPathDisclosure', 0x31, 'yes'),
('scanTime', 0x313636353435373434332e31373031, 'yes'),
('scanType', 0x7374616e64617264, 'yes'),
('scan_exclude', '', 'yes'),
('scan_force_ipv4_start', 0x30, 'yes'),
('scan_include_extra', '', 'yes'),
('scan_maxDuration', '', 'yes'),
('scan_maxIssues', 0x31303030, 'yes'),
('scan_max_resume_attempts', 0x32, 'yes'),
('schedMode', 0x6175746f, 'yes'),
('schedStartHour', 0x33, 'yes'),
('scheduledScansEnabled', 0x31, 'yes'),
('serverIP', 0x313636353435373337343b3132352e3136342e3134362e313134, 'yes'),
('showAdminBarMenu', 0x31, 'yes'),
('showWfCentralUI', 0x31, 'yes'),
('spamvertizeCheck', 0x31, 'yes'),
('ssl_verify', 0x31, 'yes'),
('startScansRemotely', 0x30, 'yes'),
('supportContent', 0x7b22746f70223a5b7b227469746c65223a22426c6f636b696e672054726f75626c6573686f6f74696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f626c6f636b696e675c2f74726f75626c6573686f6f74696e675c2f222c226f72646572223a307d2c7b227469746c65223a224f7074696d697a696e6720546865204669726577616c6c222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f6f7074696d697a696e672d7468652d6669726577616c6c5c2f222c226f72646572223a317d2c7b227469746c65223a22576f726466656e636520576562204170706c69636174696f6e204669726577616c6c202857414629222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f222c226f72646572223a327d2c7b227469746c65223a225363616e2054726f75626c6573686f6f74696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f7363616e5c2f74726f75626c6573686f6f74696e675c2f222c226f72646572223a337d2c7b227469746c65223a22576f726466656e636520616e64204c6974655370656564222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f73797374656d2d726571756972656d656e74735c2f6c69746573706565645c2f222c226f72646572223a347d2c7b227469746c65223a2254776f2d466163746f722041757468656e7469636174696f6e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f74776f2d666163746f722d61757468656e7469636174696f6e5c2f222c226f72646572223a357d2c7b227469746c65223a224669726577616c6c204c6561726e696e67204d6f6465222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f6c6561726e696e672d6d6f64655c2f222c226f72646572223a367d2c7b227469746c65223a225363616e20526573756c7473222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f7363616e5c2f7363616e2d726573756c74735c2f222c226f72646572223a377d2c7b227469746c65223a224920616d206c6f636b6564206f7574206f66206d792073697465222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f626c6f636b696e675c2f23692d616d2d6c6f636b65642d6f75742d6f662d6d792d73697465222c226f72646572223a387d2c7b227469746c65223a2250485020466174616c206572726f723a204661696c6564206f70656e696e6720726571756972656420776f726466656e63652d7761662e706870222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f237068702d666174616c2d6572726f722d6661696c65642d6f70656e696e672d72657175697265642d776f726466656e63652d7761662d706870222c226f72646572223a397d5d2c22616c6c223a5b7b227469746c65223a22576f726466656e63652046726565222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f776f726466656e63652d667265655c2f222c2265786365727074223a22576f726466656e6365204672656520697320616e20616c6c2d696e2d6f6e6520736563757269747920736f6c7574696f6e20666f7220576f72645072657373207765627369746573207468617420696e636c7564657320616e20656e64706f696e74206669726577616c6c2c207365637572697479207363616e6e65722c206c6f67696e2073656375726974792c20616c657274732c2063656e7472616c697a6564206d616e6167656d656e742c20616e64206d6f72652e222c226f72646572223a307d2c7b227469746c65223a22576f726466656e6365205072656d69756d222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f776f726466656e63652d7072656d69756d5c2f222c2265786365727074223a22576f726466656e6365205072656d69756d20636f6d65732077697468207265616c2d74696d65206669726577616c6c2070726f74656374696f6e2c207265616c2d74696d65207363616e207369676e6174757265732c20616e204950206164647265737320626c6f636b6c6973742c20636f756e74727920626c6f636b696e672c20616e64205072656d69756d20737570706f72742e222c226f72646572223a317d2c7b227469746c65223a22576f726466656e63652043617265222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f776f726466656e63652d636172655c2f222c2265786365727074223a22576f726466656e6365204361726520697320666f7220627573696e657373206f776e6572732077686f20706c6163652061207072656d69756d206f6e2074686569722074696d652e204f7572207465616d20696e7374616c6c732c20636f6e666967757265732c206f7074696d697a65732c20616e64206d61696e7461696e7320796f757220576f7264507265737320736974652073656375726974792e222c226f72646572223a327d2c7b227469746c65223a22576f726466656e636520526573706f6e7365222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f776f726466656e63652d726573706f6e73655c2f222c2265786365727074223a22576f726466656e636520526573706f6e736520697320666f72206d697373696f6e2d637269746963616c20576f72645072657373207765627369746573207468617420726571756972652032345c2f375c2f333635207365637572697479206d6f6e69746f72696e672077697468206120312d686f757220726573706f6e73652074696d6520616e642032342d686f75722072656d6564696174696f6e2e222c226f72646572223a337d2c7b227469746c65223a22496e636964656e7420526573706f6e7365205365727669636573222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f696e636964656e742d726573706f6e73652d73657276696365735c2f222c2265786365727074223a224c6574206f6e65206f66206f757220536563757269747920416e616c797374732068656c7020796f7520636c65616e20796f757220696e6665637465642073697465206f7220696e737065637420697420666f722076756c6e65726162696c69746965732e222c226f72646572223a347d2c7b227469746c65223a224c6963656e7365204b6579222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6170692d6b65795c2f222c2265786365727074223a22416c6c20576f726466656e636520696e7374616c6c6174696f6e73206e6565642061206c6963656e7365206b65792c20616c736f206b6e6f776e20617320616e204150492d6b65792e20546865206b65792063616e20626520612066726565206b6579206f722061205072656d69756d206b65792e20222c226f72646572223a357d2c7b227469746c65223a224163636f756e7420616e642042696c6c696e6720486973746f7279222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6163636f756e745c2f222c2265786365727074223a22486f7720746f206e6176696761746520616e642075736520796f757220576f726466656e6365206163636f756e742e222c226f72646572223a367d2c7b227469746c65223a22576f726466656e63652043656e7472616c222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f222c2265786365727074223a22576f726466656e63652043656e7472616c2070726f7669646573206120706f77657266756c20616e6420656666696369656e742077617920746f206d616e61676520746865207365637572697479206f66206d616e7920576f726450726573732073697465732076696120612073696e676c6520696e746572666163652e222c226368696c6472656e223a5b7b227469746c65223a22436f6e6e656374696e6720796f757220736974657320746f20576f726466656e63652043656e7472616c222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f636f6e6e6563745c2f222c226f72646572223a307d2c7b227469746c65223a2253657474696e672075702074776f2d666163746f722061757468656e7469636174696f6e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f3266615c2f222c226f72646572223a317d2c7b227469746c65223a225573696e67207468652044617368626f6172642070616765222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f63656e7472616c5c2f222c226f72646572223a327d2c7b227469746c65223a225573696e672074686520436f6e66696775726174696f6e2070616765222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f636f6e66696775726174696f6e5c2f222c226f72646572223a337d2c7b227469746c65223a225573696e6720576f726466656e636520706c7567696e206f7074696f6e732054656d706c61746573222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f74656d706c617465735c2f222c226f72646572223a347d2c7b227469746c65223a225573696e67207468652053657474696e67732070616765222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f73657474696e67735c2f222c226f72646572223a357d2c7b227469746c65223a225573696e6720576f726466656e63652043656e7472616c205465616d73222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f7465616d735c2f222c226f72646572223a367d2c7b227469746c65223a2256696577696e67207363616e2046696e64696e6773222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f63656e7472616c5c2f66696e64696e67735c2f222c226f72646572223a377d5d2c226f72646572223a377d2c7b227469746c65223a2244617368626f617264222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f64617368626f6172645c2f222c2265786365727074223a2254686520576f726466656e63652044617368626f6172642070726f766964657320696e736967687420696e746f207468652063757272656e74207374617465206f6620796f75722073697465e28099732073656375726974792e222c226368696c6472656e223a5b7b227469746c65223a224f7074696f6e73222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f64617368626f6172645c2f6f7074696f6e735c2f222c226f72646572223a307d2c7b227469746c65223a22416c65727473222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f64617368626f6172645c2f616c657274735c2f222c226f72646572223a317d5d2c226f72646572223a387d2c7b227469746c65223a224669726577616c6c222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f222c2265786365727074223a2254686520576f726466656e636520576562204170706c69636174696f6e204669726577616c6c2069732061205048502062617365642c206170706c69636174696f6e206c6576656c206669726577616c6c20746861742066696c74657273206f7574206d616c6963696f757320726571756573747320746f20796f757220736974652e20222c226368696c6472656e223a5b7b227469746c65223a224f7074696d697a696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f6f7074696d697a696e672d7468652d6669726577616c6c5c2f222c226f72646572223a307d2c7b227469746c65223a224c6561726e696e67204d6f6465222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f6c6561726e696e672d6d6f64655c2f222c226f72646572223a317d2c7b227469746c65223a2253746174697374696373222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f737461746973746963735c2f222c226f72646572223a327d2c7b227469746c65223a224f7074696f6e73222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f6f7074696f6e735c2f222c226f72646572223a337d2c7b227469746c65223a224d7953514c692073746f7261676520656e67696e65222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f6d7973716c692d73746f726167652d656e67696e655c2f222c226f72646572223a347d2c7b227469746c65223a22427275746520466f7263652050726f74656374696f6e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f62727574652d666f7263655c2f222c226f72646572223a357d2c7b227469746c65223a2252617465204c696d6974696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f726174652d6c696d6974696e675c2f222c226f72646572223a367d2c7b227469746c65223a2254726f75626c6573686f6f74696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6669726577616c6c5c2f74726f75626c6573686f6f74696e675c2f222c226f72646572223a377d5d2c226f72646572223a397d2c7b227469746c65223a22426c6f636b696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f626c6f636b696e675c2f222c2265786365727074223a2241736964652066726f6d20746865206669726577616c6c2072756c657320746861742070726f7465637420616761696e737420766172696f75732061747461636b732c20576f726466656e636520616c736f2068617320637573746f6d20666561747572657320666f72206164646974696f6e616c20626c6f636b696e672e20222c226368696c6472656e223a5b7b227469746c65223a22436f756e74727920426c6f636b696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f626c6f636b696e675c2f636f756e7472792d626c6f636b696e675c2f222c226f72646572223a307d2c7b227469746c65223a22426c6f636b696e672054726f75626c6573686f6f74696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f626c6f636b696e675c2f74726f75626c6573686f6f74696e675c2f222c226f72646572223a317d5d2c226f72646572223a31307d2c7b227469746c65223a225363616e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f7363616e5c2f222c2265786365727074223a224120576f726466656e6365207363616e206578616d696e657320616c6c2066696c6573206f6e20796f757220576f726450726573732077656273697465206c6f6f6b696e6720666f72206d616c6963696f757320636f64652c206261636b646f6f72732c20616e64207368656c6c732074686174206861636b657273206861766520696e7374616c6c65642e20497420616c736f207363616e7320666f72206b6e6f776e206d616c6963696f75732055524c7320616e64206b6e6f776e207061747465726e73206f6620696e66656374696f6e732e222c226368696c6472656e223a5b7b227469746c65223a224f7074696f6e73222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f7363616e5c2f6f7074696f6e735c2f222c226f72646572223a307d2c7b227469746c65223a22526573756c7473222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f7363616e5c2f7363616e2d726573756c74735c2f222c226f72646572223a317d2c7b227469746c65223a225363686564756c696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f7363616e5c2f7363686564756c696e675c2f222c226f72646572223a327d2c7b227469746c65223a2254726f75626c6573686f6f74696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f7363616e5c2f74726f75626c6573686f6f74696e675c2f222c226f72646572223a337d5d2c226f72646572223a31317d2c7b227469746c65223a22546f6f6c73222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f222c2265786365727074223a22576f726466656e636520546f6f6c7320696e636c756465204c697665205472616666696320616e616c797369732c2057484f4953204c6f6f6b75702c20496d706f72745c2f4578706f7274204f7074696f6e732c20616e6420446961676e6f73746963732e222c226368696c6472656e223a5b7b227469746c65223a224c6976652054726166666963222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f6c6976652d747261666669635c2f222c226f72646572223a307d2c7b227469746c65223a2257484f4953204c6f6f6b7570222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f77686f69732d6c6f6f6b75705c2f222c226f72646572223a317d2c7b227469746c65223a22496d706f72745c2f4578706f7274222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f696d706f72742d6578706f72745c2f222c226f72646572223a327d2c7b227469746c65223a22446961676e6f7374696373222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f646961676e6f73746963735c2f222c226f72646572223a337d2c7b227469746c65223a224c65676163792054776f2d466163746f722041757468656e7469636174696f6e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f6c65676163792d74776f2d666163746f722d61757468656e7469636174696f6e5c2f222c226f72646572223a347d2c7b227469746c65223a2254776f2d466163746f722041757468656e7469636174696f6e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f746f6f6c735c2f74776f2d666163746f722d61757468656e7469636174696f6e5c2f222c226f72646572223a357d5d2c226f72646572223a31327d2c7b227469746c65223a224c6f67696e205365637572697479222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6c6f67696e2d73656375726974795c2f222c2265786365727074223a22546865204c6f67696e20536563757269747920706167652063757272656e746c7920636f6e7461696e732073657474696e677320666f722074776f2d666163746f722061757468656e7469636174696f6e20283246412920616e64207265434150544348412e20496e20612066757475726520576f726466656e63652076657273696f6e2c206578697374696e67206c6f67696e2d72656c617465642066656174757265732077696c6c20616c736f206d6f766520746f207468652073616d6520706167652e222c226f72646572223a31337d2c7b227469746c65223a22416476616e636564222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f222c2265786365727074223a22496620796f752077616e7420746f206b6e6f77206d6f72652061626f75742074686520746563686e6963616c2064657461696c73206f6620576f726466656e63652c20796f752077696c6c2066696e642074686520616e737765727320696e20746869732073656374696f6e2e222c226368696c6472656e223a5b7b227469746c65223a2253797374656d20726571756972656d656e7473222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f73797374656d2d726571756972656d656e74735c2f222c226f72646572223a307d2c7b227469746c65223a224368616e67656c6f67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f6368616e67656c6f675c2f222c226f72646572223a317d2c7b227469746c65223a2252656d6f7665206f72205265736574222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f72656d6f76652d6f722d72657365745c2f222c226f72646572223a327d2c7b227469746c65223a22546563686e6963616c2044657461696c73222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f746563686e6963616c2d64657461696c735c2f222c226f72646572223a337d2c7b227469746c65223a22436f6e7374616e7473222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f636f6e7374616e74735c2f222c226f72646572223a347d2c7b227469746c65223a22576f726466656e636520415049222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f776f726466656e63652d6170695c2f222c226f72646572223a357d2c7b227469746c65223a2254726f75626c6573686f6f74696e67222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f74726f75626c6573686f6f74696e675c2f222c226f72646572223a367d2c7b227469746c65223a22506c7567696e205c2f205468656d6520436f6e666c69637473222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f616476616e6365645c2f706c7567696e2d7468656d652d636f6e666c696374735c2f222c226f72646572223a377d5d2c226f72646572223a31347d2c7b227469746c65223a22576f726466656e636520616e642047445052202d2047656e6572616c20446174612050726f74656374696f6e20526567756c6174696f6e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f67656e6572616c2d646174612d70726f74656374696f6e2d726567756c6174696f6e5c2f222c2265786365727074223a2244656669616e742c2074686520636f6d70616e7920626568696e6420576f726466656e63652c20686173207570646174656420697473207465726d73206f66207573652c207072697661637920706f6c696369657320616e6420736f6674776172652c2061732077656c6c206173206d61646520617661696c61626c65207374616e6461726420636f6e747261637475616c20636c617573657320746f206d656574204744505220636f6d706c69616e63652e20437573746f6d657273206d7573742072657669657720616e6420616772656520746f2075706461746564207465726d7320696e206f7264657220746f20636f6e74696e7565207573696e67206f75722070726f647563747320616e642073657276696365732e222c226368696c6472656e223a5b7b227469746c65223a225375622d50726f636573736f7273204c697374222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f67656e6572616c2d646174612d70726f74656374696f6e2d726567756c6174696f6e5c2f7375622d70726f636573736f72732d6c6973745c2f222c226f72646572223a307d5d2c226f72646572223a31357d2c7b227469746c65223a224c6f67696e20536563757269747920506c7567696e222c227065726d616c696e6b223a2268747470733a5c2f5c2f7777772e776f726466656e63652e636f6d5c2f68656c705c2f6c6f67696e2d73656375726974792d706c7567696e5c2f222c2265786365727074223a2254686520576f726466656e6365204c6f67696e20536563757269747920706c7567696e20636f6e7461696e73206120737562736574206f662074686520666561747572657320666f756e6420696e207468652066756c6c20576f726466656e636520706c7567696e3a2054776f2d666163746f722041757468656e7469636174696f6e2c20584d4c2d5250432050726f74656374696f6e20616e64204c6f67696e205061676520434150544348412e20497420697320696465616c20666f722073697465732074686174206e656564206c6f67696e2073656375726974792066756e6374696f6e616c69747920627574206569746865722063616ee2809974206f7220646f6ee28099742077616e7420746f2072756e207468652066756c6c20576f726466656e636520706c7567696e2e222c226f72646572223a31367d5d7d, 'yes'),
('supportHash', 0x62396135653332373063373637613164313739303762393930383265633039333237646333383232393634353730656163616538303333643834363434366434, 'yes'),
('timeoffset_wf', 0x31, 'yes'),
('timeoffset_wf_updated', 0x31363635343537333732, 'yes');
INSERT INTO `wp_wfconfig` (`name`, `val`, `autoload`) VALUES
('tldlist', 0x7c636f6d7c6f72677c6e65747c6564757c6161617c6162627c6162637c61636f7c6164737c6165677c61666c7c6169677c616e7a7c616f6c7c6170707c6172747c6177737c6178617c6261727c6262637c6262747c6263677c62636e7c6265747c6269647c62696f7c62697a7c626d737c626d777c626f6d7c626f6f7c626f747c626f787c6275797c627a687c6361627c63616c7c63616d7c6361727c6361747c6362617c63626e7c6362737c63656f7c6366617c6366647c6370617c6372737c6461647c6461797c6464737c6465767c64686c7c6469797c646e707c646f677c646f747c6474767c6476727c6561747c65636f7c6573717c6575737c66616e7c6669747c666c797c666f6f7c666f787c66726c7c6674727c66756e7c6679697c67616c7c6761707c6761797c67646e7c6765617c676c657c676d6f7c676d787c676f6f7c676f707c676f747c676f767c68626f7c6869767c686b747c686f747c686f777c69626d7c6963657c6963757c69666d7c696e637c696e677c696e6b7c696e747c6973747c6974767c6a63627c6a696f7c6a6c6c7c6a6d707c6a6e6a7c6a6f747c6a6f797c6b66687c6b69617c6b696d7c6b706e7c6b72647c6c61747c6c61777c6c64737c6c6c637c6c6c707c6c6f6c7c6c706c7c6c74647c6d616e7c6d61707c6d62617c6d65647c6d656e7c6d696c7c6d69747c6d6c627c6d6c737c6d6d617c6d6f657c6d6f697c6d6f6d7c6d6f767c6d73647c6d746e7c6d74727c6e61627c6e62617c6e65637c6e65777c6e666c7c6e676f7c6e686b7c6e6f777c6e72617c6e72777c6e74747c6e79637c6f62697c6f6e657c6f6e677c6f6e6c7c6f6f6f7c6f74747c6f76687c7061797c7065747c7068647c7069647c70696e7c706e637c70726f7c7072757c7075627c7077637c7265647c72656e7c72696c7c72696f7c7269707c72756e7c7277657c7361707c7361737c7362697c7362737c7363617c7363627c7365737c7365777c7365787c7366727c736b697c736b797c736f797c7370617c73726c7c7374637c7461627c7461787c7463697c74646b7c74656c7c7468647c746a787c746f707c7472767c7475697c7476737c7562737c756e6f7c756f6c7c7570737c7665747c7669677c76696e7c7669707c7765647c77696e7c776d657c776f777c7774637c7774667c78696e7c7878787c78797a7c796f757c79756e7c7a69707c61637c61647c61657c61667c61677c61697c616c7c616d7c616f7c61717c61727c61737c61747c61757c61777c61787c617a7c62617c62627c62647c62657c62667c62677c62687c62697c626a7c626d7c626e7c626f7c62727c62737c62747c62767c62777c62797c627a7c63617c63637c63647c63667c63677c63687c63697c636b7c636c7c636d7c636e7c636f7c63727c63757c63767c63777c63787c63797c637a7c64657c646a7c646b7c646d7c646f7c647a7c65637c65657c65677c65727c65737c65747c65757c66697c666a7c666b7c666d7c666f7c66727c67617c67627c67647c67657c67667c67677c67687c67697c676c7c676d7c676e7c67707c67717c67727c67737c67747c67757c67777c67797c686b7c686d7c686e7c68727c68747c68757c69647c69657c696c7c696d7c696e7c696f7c69717c69727c69737c69747c6a657c6a6d7c6a6f7c6a707c6b657c6b677c6b687c6b697c6b6d7c6b6e7c6b707c6b727c6b777c6b797c6b7a7c6c617c6c627c6c637c6c697c6c6b7c6c727c6c737c6c747c6c757c6c767c6c797c6d617c6d637c6d647c6d657c6d677c6d687c6d6b7c6d6c7c6d6d7c6d6e7c6d6f7c6d707c6d717c6d727c6d737c6d747c6d757c6d767c6d777c6d787c6d797c6d7a7c6e617c6e637c6e657c6e667c6e677c6e697c6e6c7c6e6f7c6e707c6e727c6e757c6e7a7c6f6d7c70617c70657c70667c70677c70687c706b7c706c7c706d7c706e7c70727c70737c70747c70777c70797c71617c72657c726f7c72737c72757c72777c73617c73627c73637c73647c73657c73677c73687c73697c736a7c736b7c736c7c736d7c736e7c736f7c73727c73737c73747c73757c73767c73787c73797c737a7c74637c74647c74667c74677c74687c746a7c746b7c746c7c746d7c746e7c746f7c74727c74747c74767c74777c747a7c75617c75677c756b7c75737c75797c757a7c76617c76637c76657c76677c76697c766e7c76757c77667c77737c79657c79747c7a617c7a6d7c7a777c616172707c61626c657c616461637c6165726f7c616b646e7c616c6c797c616d65787c617261627c61726d797c617270617c617274657c617364617c617369617c617564697c6175746f7c626162797c62616e647c62616e6b7c626276617c626565727c626573747c62696b657c62696e677c626c6f677c626c75657c626f66617c626f6e647c626f6f6b7c63616c6c7c63616d707c636172657c636172737c636173617c636173657c636173687c636272657c636f6f6c7c63726f776e7c6465616c737c646573697c63616e6f6e7c64656c6c7c64656c74617c626f656872696e6765727c63617264737c646f63737c626f6f6b696e677c62757a7a7c636166657c636c75627c636f6f707c626f7374696b7c626f73746f6e7c6365726e7c636861747c636974697c636974797c63796f757c646174617c646174657c64636c6b7c6465616c7c646965747c646973687c626f7363687c66616e737c6661726d7c64616275727c647661677c65726e697c6275696c647c666167657c6661696c7c63796d72757c64616e63657c666173747c6669646f7c66696c6d7c666c69727c666f6f647c666f72647c66756e647c6a6176617c6a6565707c6a6f62737c6b7265647c6c696b657c6c696d6f7c6c696e6b7c636973636f7c6b706d677c636c6f75647c666961747c697461757c6a7072737c636f6163687c666972657c666973687c667265657c67616d657c6b6464697c6b6964737c6b6977697c6c616e647c6c65676f7c6c6762747c636f6465737c6c6976657c6c7464617c6c7578657c63697469637c626c6f636b6275737465727c6c6f616e7c626c61636b6672696461797c6c6f66747c6c6f76657c726f6f6d7c727568727c73686f707c626f7574697175657c727376707c73616c657c7361726c7c7361786f7c736e63667c626c6f6f6d626572677c73636f747c736561747c7365656b7c626f6174737c626e70706172696261737c736166657c736176657c736869617c73696e617c736974657c736b696e7c63686173657c736578797c73686f777c63686561707c736861777c73696c6b7c67616d65737c627261646573636f7c677572757c6361726565727c676f6c647c676f6c667c676f6f677c677567657c636173696e6f7c636172656572737c686774767c6368696e7461697c6361746572696e677c636174686f6c69637c63656e7465727c6368616e656c7c6368616e6e656c7c636861726974797c686169727c68656c707c686572657c686f73747c6368726973746d61737c676d62687c686175737c636c65616e696e677c6762697a7c636c61696d737c63697479656174737c67656e747c676765657c676966747c686466637c696565657c696d6d6f7c696e666f7c6c69646c7c6368726f6d657c636972636c657c6369746164656c7c6369707269616e697c696362637c6368757263687c687362637c696d64627c6c6966657c62726964676573746f6e657c6275696c646572737c627573696e6573737c63616c76696e6b6c65696e7c6c696c6c797c6e69636f7c6e696b657c6272757373656c737c67617264656e7c62726f746865727c6f6c6c6f7c706172737c706363777c706c61797c706c75737c62726f6b65727c6f70656e7c706963737c70696e677c70696e6b7c706f686c7c706f726e7c706f73747c62726f61647761797c706167657c70726f647c63616d6572617c70726f667c6c6f6375737c71706f6e7c6361726176616e7c6c6f7474657c726561647c6c6f74746f7c726569747c6c697073797c6361706974616c7c6361706974616c6f6e657c6c696e64657c72656e747c726573747c726963687c63617065746f776e7c6c6f616e737c736f68757c626c61636b7c6169726275737c616972666f7263657c62616964757c61697274656c7c616c6661726f6d656f7c616c69626162617c617a7572657c616c697061797c6175746f737c616c6c66696e616e7a7c616c6c73746174657c616c736163657c616c73746f6d7c616d617a6f6e7c617564696f7c616d65726963616e657870726573737c616d65726963616e66616d696c797c616d66616d7c616d6963617c616d7374657264616d7c616e616c79746963737c616e64726f69647c616e7175616e7c61706172746d656e74737c6170706c657c6171756172656c6c657c61726368697c747562657c6167656e63797c76616e617c61626f6761646f7c616363656e747572657c62656174737c61636164656d797c796f67617c61627564686162697c7a6172617c6162627669657c7a65726f7c6162626f74747c6269626c657c62696e676f7c6162617274687c7a6f6e657c6163636f756e74616e747c6163636f756e74616e74737c766973617c766f746f7c6167616b68616e7c766976617c7669766f7c766f74657c77616e677c6166726963617c77696e657c78626f787c6165746e617c7769656e7c776f726b7c6163746f727c6164756c747c776569727c77696b697c636c69636b7c6172616d636f7c64726976657c64756261697c656d61696c7c666f72756d7c67696674737c67697665737c617574686f727c666f7265787c636c696e69637c736f6e677c62616e616d65787c736f6e797c65617274687c62617965726e7c6564656b617c617669616e63617c67616c6c6f7c73706f747c626175686175737c676c6173737c677265656e7c6b6f656c6e7c6b796f746f7c6c656173657c6c6567616c7c6268617274697c6c616d65727c6265726c696e7c6174686c6574617c617573706f73747c6174746f726e65797c61756374696f6e7c62656e746c65797c626573746275797c676d61696c7c6265617574797c676c6f626f7c61756469626c657c67726970657c626172636c6179737c67726f75707c746178697c66616974687c68796174747c696b616e6f7c737461727c6c657875737c6173736f6369617465737c66696e616c7c686f6e64617c686f7273657c737572667c686f6d65737c69726973687c74616c6b7c62617265666f6f747c7465616d7c6570736f6e7c66656465787c67756363697c67756964657c6261726761696e737c746f79737c6261736562616c6c7c746f776e7c6261736b657462616c6c7c686f7573657c746563687c62617263656c6f6e617c626172636c6179636172647c62616e616e6172657075626c69637c746576617c746961617c746970737c6a65747a747c6d616379737c636c696e697175657c636f6d7365637c636f6e646f737c636f75706f6e7c6d6565747c6e657875737c636f666665657c6465616c65727c6465677265657c6d6169667c64617473756e7c6d616e676f7c7374796c657c7375636b737c6372656469747c73776973737c74617461727c74697265737c6372756973657c7469726f6c7c746d616c6c7c746f6461797c746f6f6c737c746f7261797c746f74616c7c746f7572737c74726164657c74727573747c74756e65737c74757368757c7562616e6b7c646174696e677c746f6b796f7c64656e74616c7c73747564797c6469726563747c736d6172747c646f63746f727c736d696c657c64756e6c6f707c736f6c61727c6475706f6e747c64757262616e7c656475636174696f6e7c73706163657c64657369676e7c73706f72747c73746164617c656d6572636b7c656e657267797c6573746174657c6576656e74737c6578706572747c66616d696c797c666c69636b727c667574626f6c7c67656f7267657c6661726d6572737c676976696e677c66617368696f6e7c656e67696e6565727c656e67696e656572696e677c67656e74696e677c73746f72657c67616c6c75707c666565646261636b7c676c6f62616c7c666572726172697c6772617469737c666964656c6974797c676f6f676c657c6865616c74687c66696e616e63657c6865726d65737c686970686f707c686f636b65797c686f74656c737c696e737572657c6a61677561727c6a6f627572677c67616c6c6572797c696d616d61747c6665727265726f7c6875676865737c696e747569747c6a7565676f737c6b696e6465727c676f64616464797c6c61777965727c686974616368697c6b617566656e7c6b696e646c657c6c616e6369617c6c6174696e6f7c6c656672616b7c6d656469617c65717569706d656e747c6572696373736f6e7c65746973616c61747c6575726f766973696f6e7c6d617474656c7c65786368616e67657c6c6976696e677c6c6f636b65727c6c6f6e646f6e7c6578706f7365647c657870726573737c6c75787572797c6d61726b65747c66697368696e677c6669746e6573737c666f7273616c657c6d616b6575707c666c69676874737c6d6169736f6e7c666c6f726973747c666c6f776572737c66726f67616e737c656e7465727072697365737c6661697277696e64737c66756a697473757c67726f636572797c677569746172737c6d61647269647c68616d627572677c657874726173706163657c68616e676f75747c686f6c696461797c6d696e697c6d696e747c6d757369637c676f6c64706f696e747c6d6f62697c6d757365756d7c666f6f7462616c6c7c6e616d657c6d757475616c7c6e6176797c6d6f6e65797c6f6d6567617c6f6e6c696e657c666f756e646174696f6e7c6f6c6179616e7c706c6163657c6f7261636c657c70686f746f7c6f72616e67657c70617274797c676f6f64796561727c6d656d657c6d69616d697c666f6f646e6574776f726b7c6d656e757c6d6f64617c6a6577656c72797c6d6f746f7c6d6f7669657c6e6577737c6e6578747c6e696b6f6e7c6e696e6a617c6e6f6b69617c6e6f7774767c6f73616b617c6f7473756b617c70617269737c70617274737c70686f6e657c70697a7a617c706f6b65727c66726573656e6975737c66726f6e746965727c6b69746368656e7c6b6f6d617473757c6e697373616e7c6e69737361797c6675726e69747572657c6e6f72746f6e7c6e6f7772757a7c6b6572727970726f706572746965737c70726178697c70726573737c7072696d657c70726f6d6f7c6f66666963657c6b65727279686f74656c737c6b657272796c6f676973746963737c6e61747572617c6a756e697065727c697374616e62756c7c6e61676f79617c66726f6e74646f6f727c71756573747c6a706d6f7267616e7c726164696f7c736c696e677c677261696e6765727c677561726469616e7c6864666362616e6b7c68656c73696e6b697c686f6c64696e67737c76656761737c766964656f7c6669726d64616c657c6879756e6461697c766f646b617c66696e616e6369616c7c6b6f736865727c686f74656c65737c686f746d61696c7c7175656265637c6669726573746f6e657c686f7374696e677c686973616d697473757c686f6d656465706f747c686f73706974616c7c686f6d65676f6f64737c686f6d6573656e73657c6865616c7468636172657c696d6d6f62696c69656e7c726163696e677c67726170686963737c696e64757374726965737c766f6c766f7c696e766573746d656e74737c6d6f62696c657c6d6f6e6173687c69736d61696c697c776569626f7c6d6f73636f777c7066697a65727c776f726b737c6d6f726d6f6e7c77617463687c69706972616e67617c776f726c647c70686f746f737c696e7465726e6174696f6e616c7c7961686f6f7c70687973696f7c696e737469747574657c696e737572616e63657c7069637465747c696e66696e6974697c77616c65737c77656265727c7865726f787c7265616c74797c636c75626d65647c636f6c6c6567657c736b7970657c636f6c6f676e657c636f6d636173747c636f6e746163747c636f6d6d62616e6b7c636f6d6d756e6974797c636f6d70616e797c636f6d706172657c636f6d70757465727c636f6e737472756374696f6e7c636f6e73756c74696e677c636f6e74726163746f72737c72656861627c756e69636f6d7c7669616a65737c76696b696e677c76696c6c61737c76697267696e7c766973696f6e7c766f74696e677c766f796167657c7675656c6f737c77616c7465727c77656263616d7c78696875616e7c7961636874737c636f6f6b696e677c636f72736963617c636f756e7472797c636c6f7468696e677c636f75706f6e737c636f75727365737c637269636b65747c637275697365737c6469676974616c7c646973636f756e747c646973636f7665727c6c616e786573737c6c65636c6572637c6d61726b6574696e677c637265646974636172647c637265646974756e696f6e7c64656e746973747c646f6d61696e737c6c6163616978617c6c6173616c6c657c6c6174726f62657c6c696d697465647c6c696e636f6c6e7c6c756e646265636b7c6b756f6b67726f75707c6d61726b6574737c6d61727368616c6c737c6d6f6e737465727c6e657462616e6b7c6e6574666c69787c6e6574776f726b7c6e6575737461727c6f6b696e6177617c6f6c646e6176797c6f7267616e69637c6d617365726174697c7068696c6970737c6d636b696e7365797c6f726967696e737c70696f6e6565727c706f6c697469657c706c756d62696e677c70726f70657274797c7265616c746f727c726563697065737c6d617272696f74747c76656e74757265737c6d656c626f75726e657c6d656d6f7269616c7c6e6578746469726563747c776174636865737c6d6572636b6d73647c77616e67676f757c63756973696e656c6c617c77616c6d6172747c6d6963726f736f66747c6f627365727665727c76616e67756172647c6d6974737562697368697c766572697369676e7c776561746865727c64656c69766572797c786e2d2d6e6f64657c796f6b6f68616d617c6c6966657374796c657c79616e6465787c7866696e6974797c6469616d6f6e64737c6469726563746f72797c646f776e6c6f61647c786e2d2d393061657c6c616e6361737465727c636f6f6b696e676368616e6e656c7c6c616e64726f7665727c6c69676874696e677c6d6f746f726379636c65737c786e2d2d703161697c786e2d2d7178616d7c6f6c6179616e67726f75707c79616d6178756e7c64656c6f697474657c64656d6f637261747c6d6f7274676167657c796f75747562657c6e6f7274687765737465726e6d757475616c7c77656464696e677c776f6f64736964657c70616e61736f6e69637c77696e6e6572737c70696374757265737c77696e646f77737c706172746e6572737c77686f7377686f7c7a6170706f737c7a7565726963687c706861726d6163797c776562736974657c72656473746f6e657c706173736167656e737c72656973657c7265766965777c6c696665696e737572616e63657c72656973656e7c7269636f687c726f636b737c726f636865727c726576696577737c726578726f74687c726f64656f7c6c616d626f726768696e697c7265706169727c7265706f72747c726f676572737c72756762797c7279756b79757c7361666574797c73616b7572617c73616c6f6e7c7363686f6f6c7c73686f65737c73656c6563747c736576656e7c736368756c657c73656e65727c73686f756a697c73616d73756e677c7363686d6964747c7365617263687c73616e6476696b7c73616e6f66697c736369656e63657c73656375726974797c73696e676c65737c73657276696365737c73686172707c7368656c6c7c7365637572657c736f636365727c72656e74616c737c7363687761727a7c7368616e6772696c617c7368696b7368617c73686f7070696e677c73686f7774696d657c736f6369616c7c736f6674776172657c7379646e65797c736f667462616e6b7c737461706c65737c736f6c7574696f6e737c73797374656d737c7461697065697c74616f62616f7c7461726765747c737461746562616e6b7c73746174656661726d7c73746367726f75707c73746f636b686f6c6d7c73747265616d7c73757a756b697c7377617463687c73746f726167657c73747564696f7c737570706c797c737570706f72747c737572676572797c737570706c6965737c746174746f6f7c74656d6173656b7c72656c69616e63657c6d616e6167656d656e747c73616d73636c75627c74726164696e677c747261696e696e677c7072616d65726963617c70726f706572746965737c7661636174696f6e737c70726f74656374696f6e7c70727564656e7469616c7c7265616c6573746174657c72657374617572616e747c726963686172646c697c736161726c616e647c72657075626c6963616e7c786e2d2d6431616c667c736368616566666c65727c746f73686962617c74726176656c7c746174616d6f746f72737c74656e6e69737c7469656e64617c746865617472657c746a6d6178787c746b6d6178787c746f796f74617c746865617465727c7469636b6574737c74696666616e797c786e2d2d63316176677c746563686e6f6c6f67797c74726176656c6572737c756e69766572736974797c786e2d2d39306169737c766c61616e646572656e7c766f6c6b73776167656e7c786e2d2d3330727237797c786e2d2d33707875386b7c786e2d2d65316134637c74726176656c657273696e737572616e63657c786e2d2d3435713131637c786e2d2d34676272696d7c786e2d2d35747a6d35677c786e2d2d6a316165667c786e2d2d6a31616d687c77696c6c69616d68696c6c7c786e2d2d3535717835647c786e2d2d3830617377677c786e2d2d3930613361637c786e2d2d3964627132617c786e2d2d3965743532757c786e2d2d6332627237677c74726176656c6368616e6e656c7c766572736963686572756e677c786e2d2d636734626b697c786e2d2d637a727330747c786e2d2d637a727532647c796f646f62617368697c786e2d2d637a72363934627c786e2d2d643161636a33627c786e2d2d696f306137697c786e2d2d7767626c36617c786e2d2d336473343433677c786e2d2d7073737932757c70726f64756374696f6e737c786e2d2d7137636536617c786e2d2d71786136617c70686f746f6772617068797c706c617973746174696f6e7c70726f67726573736976657c726564756d6272656c6c617c786e2d2d313162346333647c786e2d2d31636b326531627c786e2d2d317171773233617c786e2d2d327363726a39637c786e2d2d3362737430306d7c786e2d2d336863726a39637c786e2d2d343263326439617c786e2d2d74636b77657c786e2d2d343562726a39637c786e2d2d756e757034797c786e2d2d76687175767c786e2d2d353571773432677c786e2d2d3666727a3832677c786e2d2d7767626831637c786e2d2d3830616f3231617c786e2d2d7939613361717c786e2d2d396b72743030617c786e2d2d63636b326233627c786e2d2d656676793838687c786e2d2d6663743432396b7c786e2d2d66686265697c786e2d2d666c77333531657c786e2d2d687874383134657c7363686f6c617273686970737c786e2d2d6669713634627c786e2d2d6669717338737c6c706c66696e616e6369616c7c786e2d2d6669717a39737c786e2d2d666a71373230617c786e2d2d33653062373037657c776561746865726368616e6e656c7c786e2d2d383061716563647231617c786e2d2d673278783438637c776f6c746572736b6c757765727c786e2d2d676563726a39637c786e2d2d676b33617431657c786e2d2d6a3677313933677c786e2d2d343562723563796c7c786e2d2d683262726a39637c786e2d2d696d723531336e7c786e2d2d346462726b3063657c786e2d2d353462376674613063637c786e2d2d3671713938366233786c7c786e2d2d3830616478686b737c786e2d2d706762733064687c786e2d2d683262726a396338637c786e2d2d736573353534677c786e2d2d67636b72336630667c786e2d2d683262726567336576657c786e2d2d6a6c713438306e3272677c786e2d2d71396a796234637c786e2d2d71636b6131706d637c786e2d2d667063726a396333647c786e2d2d667a633263396532637c786e2d2d726871763936677c786e2d2d726f76753838627c786e2d2d733962726a39637c786e2d2d743630623536617c786e2d2d63636b7763786574647c786e2d2d65636b7664746339647c786e2d2d7967626932616d6d787c786e2d2d666971323238633568737c786e2d2d74697134397871796a7c786e2d2d767571383631627c786e2d2d7734727334306c7c786e2d2d38793061303633617c786e2d2d623477363035666572647c786e2d2d786871353231627c786e2d2d38306173656864627c786e2d2d7966726f346936376f7c786e2d2d7a6672313634627c786e2d2d6a6c71363175397737627c786e2d2d70316163667c786e2d2d6d676261336133656a747c73616e6476696b636f726f6d616e747c786e2d2d6d6762626831617c786e2d2d6d676261623262647c786e2d2d6d6762617968376770617c786e2d2d69316236623161366132657c786e2d2d6a76723138396d7c786e2d2d6b637278373764317834617c786e2d2d6b7072773133647c786e2d2d6b7072793537647c786e2d2d6b70757433697c786e2d2d6c316163637c786e2d2d6d676261616d376138687c786e2d2d6c6762626174316164386a7c786e2d2d6d676239617762667c786e2d2d6d676261336134663136617c786e2d2d6d67626137633062626e30617c786e2d2d6d676261616b63376476667c786e2d2d6d676263306139617a63677c786e2d2d667a7973386436397576676d7c786e2d2d35737533346a393336626773677c786e2d2d62636b316239613564726534637c786e2d2d6d67626168316133686a6b72647c786e2d2d6d6762616939617a677170366a7c786e2d2d6d6762626831613731657c786e2d2d6d6762636137647a646f7c786e2d2d6d787471316d7c786e2d2d6f33637734687c786e2d2d6e7971793236617c786e2d2d6f7475373936647c786e2d2d6d676267753832617c786e2d2d6f6762706638666c7c786e2d2d6d6762693465636578707c786e2d2d6e717637667c786e2d2d6d6762706c3266687c786e2d2d6d676274336468647c786e2d2d6e676272787c786e2d2d6d6762747832627c786e2d2d6e67626335617a647c786e2d2d6e676265396530617c786e2d2d6d6762783463643061627c786e2d2d6d6978383931667c786e2d2d6d6b3162753434637c786e2d2d727663316530616d33657c786e2d2d6e71763766733030656d617c786e2d2d6d67626370713667706131617c786e2d2d6d6762657270346135643461727c786e2d2d786b6332646c336135656530687c786e2d2d7665726d67656e73626572617465722d6374627c786e2d2d7665726d67656e736265726174756e672d7077627c786e2d2d7734723835656c3866687535646e72617c786e2d2d786b6332616c3368796532617c786e2d2d636c636863306561306232673261396763647c, 'yes'),
('tldlistHash', 0x64383262313262303139336536343132363066383064663230316463383863383533636135313366663765323133303339363463633530646139343039623964, 'yes'),
('totalAlertsSent', 0x31, 'yes'),
('totalScansRun', 0x31, 'yes'),
('touppBypassNextCheck', 0x30, 'yes'),
('touppPromptNeeded', 0x30, 'yes'),
('vulnerabilities_plugin', 0x613a31343a7b693a303b613a343a7b733a343a22736c7567223b733a32323a22616476616e6365642d637573746f6d2d6669656c6473223b733a31313a2266726f6d56657273696f6e223b733a353a22362e302e32223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a313b613a343a7b733a343a22736c7567223b733a373a22616b69736d6574223b733a31313a2266726f6d56657273696f6e223b733a353a22352e302e31223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a323b613a343a7b733a343a22736c7567223b733a33353a22616c6c2d696e2d6f6e652d77702d73656375726974792d616e642d6669726577616c6c223b733a31313a2266726f6d56657273696f6e223b733a353a22352e302e39223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a333b613a343a7b733a343a22736c7567223b733a31343a22636f6e746163742d666f726d2d37223b733a31313a2266726f6d56657273696f6e223b733a353a22352e362e33223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a343b613a343a7b733a343a22736c7567223b733a33333a22656c6567616e742d726573706f6e736976652d636f6e74656e742d736c69646572223b733a31313a2266726f6d56657273696f6e223b733a353a22312e302e32223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a353b613a343a7b733a343a22736c7567223b733a31303a22666c75656e74666f726d223b733a31313a2266726f6d56657273696f6e223b733a363a22342e332e3135223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a363b613a343a7b733a343a22736c7567223b733a31313a2268656c6c6f2d646f6c6c79223b733a31313a2266726f6d56657273696f6e223b733a353a22312e372e32223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a373b613a343a7b733a343a22736c7567223b733a373a226a65747061636b223b733a31313a2266726f6d56657273696f6e223b733a343a2231312e34223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a383b613a343a7b733a343a22736c7567223b733a31363a2273656f2d62792d72616e6b2d6d617468223b733a31313a2266726f6d56657273696f6e223b733a363a22312e302e3939223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a393b613a343a7b733a343a22736c7567223b733a31343a22736d6172742d736c696465722d33223b733a31313a2266726f6d56657273696f6e223b733a383a22332e352e312e3131223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a31303b613a343a7b733a343a22736c7567223b733a31353a226175746f6465736372697074696f6e223b733a31313a2266726f6d56657273696f6e223b733a353a22342e322e35223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a31313b613a343a7b733a343a22736c7567223b733a393a22776f726466656e6365223b733a31313a2266726f6d56657273696f6e223b733a353a22372e372e31223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a31323b613a343a7b733a343a22736c7567223b733a33323a2277702d726573706f6e736976652d726563656e742d706f73742d736c69646572223b733a31313a2266726f6d56657273696f6e223b733a333a22332e31223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d693a31333b613a343a7b733a343a22736c7567223b733a31333a22776f726470726573732d73656f223b733a31313a2266726f6d56657273696f6e223b733a363a2231392e372e32223b733a31303a2276756c6e657261626c65223b623a303b733a343a226c696e6b223b623a303b7d7d, 'yes'),
('wafAlertInterval', 0x363030, 'yes'),
('wafAlertOnAttacks', 0x31, 'yes'),
('wafAlertThreshold', 0x313030, 'yes'),
('wafAlertWhitelist', '', 'yes'),
('waf_status', 0x6c6561726e696e672d6d6f6465, 'yes'),
('wfKillRequested', 0x30, 'no'),
('wfPeakMemory', 0x3934333731383430, 'no'),
('wfScanStartVersion', 0x362e302e32, 'yes'),
('wfStatusStartMsgs', 0x613a323a7b693a303b733a303a22223b693a313b733a303a22223b7d, 'yes'),
('wf_scanLastStatusTime', 0x30, 'yes'),
('wf_scanRunning', '', 'yes'),
('wf_summaryItems', 0x613a383a7b733a31323a227363616e6e6564506f737473223b693a303b733a31353a227363616e6e6564436f6d6d656e7473223b693a303b733a31323a227363616e6e656446696c6573223b693a303b733a31343a227363616e6e6564506c7567696e73223b693a303b733a31333a227363616e6e65645468656d6573223b693a303b733a31323a227363616e6e65645573657273223b693a303b733a31313a227363616e6e656455524c73223b693a303b733a31303a226c617374557064617465223b693a313636353435373434333b7d, 'yes'),
('whitelisted', '', 'yes'),
('whitelistedServices', 0x7b7d, 'yes'),
('whitelistHash', 0x62663364373664633035636166383632336362336665303163316663396533303865326632656133376238323639333764383530666465333631636465666434, 'yes'),
('whitelistPresets', 0x7b22776f726466656e6365223a7b226e223a22576f726466656e6365222c2268223a747275652c2264223a747275652c2266223a747275652c2272223a5b2235342e36382e33322e323437222c2236392e34362e33362e305c2f3237222c22323630353a323430303a303130343a303130303a3a5c2f3536225d7d2c22737563757269223a7b226e223a22537563757269222c2264223a747275652c2272223a5b2239372e37342e3132372e313731222c2236392e3136342e3230332e313732222c223137332e3233302e3132382e313335222c2236362e3232382e33342e3439222c2236362e3232382e34302e313835222c2235302e3131362e33362e3932222c2235302e3131362e33362e3933222c2235302e3131362e332e313731222c223139382e35382e39362e323132222c2235302e3131362e36332e323231222c223139322e3135352e39322e313132222c223139322e38312e3132382e3331222c223139382e35382e3130362e323434222c223139322e3135352e39352e313339222c2232332e3233392e392e323237222c223139382e35382e3131322e313033222c223139322e3135352e39342e3433222c223136322e3231362e31362e3333222c223137332e3235352e3233332e313234222c223137332e3235352e3233332e313234222c223139322e3135352e39302e313739222c2235302e3131362e34312e323137222c223139322e38312e3132392e323237222c223139382e35382e3131312e3830222c223136322e3231362e31392e313833225d7d2c2266616365626f6f6b223a7b226e223a2246616365626f6f6b222c2264223a747275652c2272223a5b2236392e36332e3137362e305c2f3230222c2236362e3232302e3134342e305c2f3230222c2236362e3232302e3134342e305c2f3231222c2236392e36332e3138342e305c2f3231222c2236392e36332e3137362e305c2f3231222c2237342e3131392e37362e305c2f3232222c2236392e3137312e3235352e305c2f3234222c223137332e3235322e36342e305c2f3138222c2236392e3137312e3232342e305c2f3139222c2236392e3137312e3232342e305c2f3230222c223130332e342e39362e305c2f3232222c2236392e36332e3137362e305c2f3234222c223137332e3235322e36342e305c2f3139222c223137332e3235322e37302e305c2f3234222c2233312e31332e36342e305c2f3138222c2233312e31332e32342e305c2f3231222c2236362e3232302e3135322e305c2f3231222c2236362e3232302e3135392e305c2f3234222c2236392e3137312e3233392e305c2f3234222c2236392e3137312e3234302e305c2f3230222c2233312e31332e36342e305c2f3139222c2233312e31332e36342e305c2f3234222c2233312e31332e36352e305c2f3234222c2233312e31332e36372e305c2f3234222c2233312e31332e36382e305c2f3234222c2233312e31332e36392e305c2f3234222c2233312e31332e37302e305c2f3234222c2233312e31332e37312e305c2f3234222c2233312e31332e37322e305c2f3234222c2233312e31332e37332e305c2f3234222c2233312e31332e37342e305c2f3234222c2233312e31332e37352e305c2f3234222c2233312e31332e37362e305c2f3234222c2233312e31332e37372e305c2f3234222c2233312e31332e39362e305c2f3139222c2233312e31332e36362e305c2f3234222c223137332e3235322e39362e305c2f3139222c2236392e36332e3137382e305c2f3234222c2233312e31332e37382e305c2f3234222c2233312e31332e37392e305c2f3234222c2233312e31332e38302e305c2f3234222c2233312e31332e38322e305c2f3234222c2233312e31332e38332e305c2f3234222c2233312e31332e38342e305c2f3234222c2233312e31332e38352e305c2f3234222c2233312e31332e38362e305c2f3234222c2233312e31332e38372e305c2f3234222c2233312e31332e38382e305c2f3234222c2233312e31332e38392e305c2f3234222c2233312e31332e39302e305c2f3234222c2233312e31332e39312e305c2f3234222c2233312e31332e39322e305c2f3234222c2233312e31332e39332e305c2f3234222c2233312e31332e39342e305c2f3234222c2233312e31332e39352e305c2f3234222c2236392e3137312e3235332e305c2f3234222c2236392e36332e3138362e305c2f3234222c2233312e31332e38312e305c2f3234222c223137392e36302e3139322e305c2f3232222c223137392e36302e3139322e305c2f3234222c223137392e36302e3139332e305c2f3234222c223137392e36302e3139342e305c2f3234222c223137392e36302e3139352e305c2f3234222c223138352e36302e3231362e305c2f3232222c2234352e36342e34302e305c2f3232222c223138352e36302e3231362e305c2f3234222c223138352e36302e3231372e305c2f3234222c223138352e36302e3231382e305c2f3234222c223138352e36302e3231392e305c2f3234222c223132392e3133342e302e305c2f3136222c223135372e3234302e302e305c2f3136222c223135372e3234302e382e305c2f3234222c223135372e3234302e302e305c2f3234222c223135372e3234302e312e305c2f3234222c223135372e3234302e322e305c2f3234222c223135372e3234302e332e305c2f3234222c223135372e3234302e342e305c2f3234222c223135372e3234302e352e305c2f3234222c223135372e3234302e362e305c2f3234222c223135372e3234302e372e305c2f3234222c223135372e3234302e392e305c2f3234222c223135372e3234302e31302e305c2f3234222c223135372e3234302e31362e305c2f3234222c223135372e3234302e31392e305c2f3234222c223135372e3234302e31312e305c2f3234222c223135372e3234302e31322e305c2f3234222c223135372e3234302e31332e305c2f3234222c223135372e3234302e31342e305c2f3234222c223135372e3234302e31352e305c2f3234222c223135372e3234302e31372e305c2f3234222c223135372e3234302e31382e305c2f3234222c223135372e3234302e32302e305c2f3234222c223135372e3234302e32312e305c2f3234222c223135372e3234302e32322e305c2f3234222c223135372e3234302e32332e305c2f3234222c223135372e3234302e302e305c2f3137222c2236392e3137312e3235302e305c2f3234222c223135372e3234302e32342e305c2f3234222c223135372e3234302e32352e305c2f3234222c223139392e3230312e36342e305c2f3234222c223139392e3230312e36352e305c2f3234222c223139392e3230312e36342e305c2f3232222c223230342e31352e32302e305c2f3232222c223135372e3234302e3139322e305c2f3234222c223132392e3133342e302e305c2f3137222c223230342e31352e32302e305c2f3232222c2236392e36332e3137362e305c2f3230222c2236392e36332e3137362e305c2f3231222c2236392e36332e3138342e305c2f3231222c2236362e3232302e3134342e305c2f3230222c2236392e36332e3137362e305c2f3230222c22323632303a303a316330303a3a5c2f3430222c22326130333a323838303a3a5c2f3332222c22326130333a323838303a666666653a3a5c2f3438222c22326130333a323838303a666666663a3a5c2f3438222c22323632303a303a316366663a3a5c2f3438222c22326130333a323838303a663030303a3a5c2f3438222c22326130333a323838303a663030313a3a5c2f3438222c22326130333a323838303a663030323a3a5c2f3438222c22326130333a323838303a663030333a3a5c2f3438222c22326130333a323838303a663030343a3a5c2f3438222c22326130333a323838303a663030353a3a5c2f3438222c22326130333a323838303a663030363a3a5c2f3438222c22326130333a323838303a663030373a3a5c2f3438222c22326130333a323838303a663030383a3a5c2f3438222c22326130333a323838303a663030393a3a5c2f3438222c22326130333a323838303a663030613a3a5c2f3438222c22326130333a323838303a663030623a3a5c2f3438222c22326130333a323838303a663030633a3a5c2f3438222c22326130333a323838303a663030643a3a5c2f3438222c22326130333a323838303a663030653a3a5c2f3438222c22326130333a323838303a663030663a3a5c2f3438222c22326130333a323838303a663031303a3a5c2f3438222c22326130333a323838303a663031313a3a5c2f3438222c22326130333a323838303a663031323a3a5c2f3438222c22326130333a323838303a663031333a3a5c2f3438222c22326130333a323838303a663031343a3a5c2f3438222c22326130333a323838303a663031353a3a5c2f3438222c22326130333a323838303a663031363a3a5c2f3438222c22326130333a323838303a663031373a3a5c2f3438222c22326130333a323838303a663031383a3a5c2f3438222c22326130333a323838303a663031393a3a5c2f3438222c22326130333a323838303a663031613a3a5c2f3438222c22326130333a323838303a663031623a3a5c2f3438222c22326130333a323838303a663031633a3a5c2f3438222c22326130333a323838303a663031643a3a5c2f3438222c22326130333a323838303a663031653a3a5c2f3438222c22326130333a323838303a663031663a3a5c2f3438222c22326130333a323838303a313030303a3a5c2f3336222c22326130333a323838303a323030303a3a5c2f3336222c22326130333a323838303a333030303a3a5c2f3336222c22326130333a323838303a343030303a3a5c2f3336222c22326130333a323838303a353030303a3a5c2f3336222c22326130333a323838303a363030303a3a5c2f3336222c22326130333a323838303a373030303a3a5c2f3336222c22326130333a323838303a663032303a3a5c2f3438222c22326130333a323838303a663032313a3a5c2f3438222c22326130333a323838303a663032323a3a5c2f3438222c22326130333a323838303a663032333a3a5c2f3438222c22326130333a323838303a663032343a3a5c2f3438222c22326130333a323838303a663032353a3a5c2f3438222c22326130333a323838303a663032363a3a5c2f3438222c22326130333a323838303a663032373a3a5c2f3438222c22326130333a323838303a663032383a3a5c2f3438222c22326130333a323838303a663032393a3a5c2f3438222c22326130333a323838303a663032623a3a5c2f3438222c22326130333a323838303a663032633a3a5c2f3438222c22326130333a323838303a663032643a3a5c2f3438222c22326130333a323838303a663032653a3a5c2f3438222c22326130333a323838303a663032663a3a5c2f3438222c22326130333a323838303a663033303a3a5c2f3438222c22326130333a323838303a663033313a3a5c2f3438222c22326130333a323838303a663033323a3a5c2f3438222c22326130333a323838303a663033333a3a5c2f3438222c22326130333a323838303a663033343a3a5c2f3438222c22326130333a323838303a663033353a3a5c2f3438222c22326130333a323838303a663033363a3a5c2f3438222c22326130333a323838303a663033373a3a5c2f3438222c22326130333a323838303a663033383a3a5c2f3438222c22326130333a323838303a663033393a3a5c2f3438222c22326130333a323838303a663033613a3a5c2f3438222c22326130333a323838303a663033623a3a5c2f3438222c22326130333a323838303a663033633a3a5c2f3438222c22326130333a323838303a663033643a3a5c2f3438222c22326130333a323838303a663033653a3a5c2f3438222c22326130333a323838303a663033663a3a5c2f3438222c22323430313a646230303a3a5c2f3332222c22326130333a323838303a3a5c2f3336222c22323830333a363038303a3a5c2f3332222c22326130333a323838303a663130303a3a5c2f3438222c22326130333a323838303a663230303a3a5c2f3438222c22326130333a323838303a663130313a3a5c2f3438222c22326130333a323838303a663230313a3a5c2f3438222c22326130333a323838303a663130323a3a5c2f3438222c22326130333a323838303a663230323a3a5c2f3438222c22326130333a323838303a663130333a3a5c2f3438222c22326130333a323838303a663230333a3a5c2f3438222c22326130333a323838303a663130343a3a5c2f3438222c22326130333a323838303a663230343a3a5c2f3438222c22326130333a323838303a663130373a3a5c2f3438222c22326130333a323838303a663230373a3a5c2f3438222c22326130333a323838303a663130383a3a5c2f3438222c22326130333a323838303a663230383a3a5c2f3438222c22326130333a323838303a663130393a3a5c2f3438222c22326130333a323838303a663230393a3a5c2f3438222c22326130333a323838303a663130613a3a5c2f3438222c22326130333a323838303a663230613a3a5c2f3438222c22326130333a323838303a663130623a3a5c2f3438222c22326130333a323838303a663230623a3a5c2f3438222c22326130333a323838303a663130643a3a5c2f3438222c22326130333a323838303a663230643a3a5c2f3438222c22326130333a323838303a663130653a3a5c2f3438222c22326130333a323838303a663230653a3a5c2f3438222c22326130333a323838303a663130663a3a5c2f3438222c22326130333a323838303a663230663a3a5c2f3438222c22326130333a323838303a663131303a3a5c2f3438222c22326130333a323838303a663231303a3a5c2f3438222c22326130333a323838303a663131313a3a5c2f3438222c22326130333a323838303a663231313a3a5c2f3438222c22326130333a323838303a663131323a3a5c2f3438222c22326130333a323838303a663231323a3a5c2f3438222c22326130333a323838303a663131343a3a5c2f3438222c22326130333a323838303a663231343a3a5c2f3438222c22326130333a323838303a663131353a3a5c2f3438222c22326130333a323838303a663231353a3a5c2f3438222c22326130333a323838303a663131363a3a5c2f3438222c22326130333a323838303a663231363a3a5c2f3438222c22326130333a323838303a663131373a3a5c2f3438222c22326130333a323838303a663231373a3a5c2f3438222c22326130333a323838303a663131383a3a5c2f3438222c22326130333a323838303a663231383a3a5c2f3438222c22326130333a323838303a663131393a3a5c2f3438222c22326130333a323838303a663231393a3a5c2f3438222c22326130333a323838303a663131613a3a5c2f3438222c22326130333a323838303a663231613a3a5c2f3438222c22326130333a323838303a663131663a3a5c2f3438222c22326130333a323838303a663231663a3a5c2f3438222c22326130333a323838303a663132313a3a5c2f3438222c22326130333a323838303a663232313a3a5c2f3438222c22326130333a323838303a663132323a3a5c2f3438222c22326130333a323838303a663232323a3a5c2f3438222c22326130333a323838303a663132333a3a5c2f3438222c22326130333a323838303a663232333a3a5c2f3438222c22326130333a323838303a663130633a3a5c2f3438222c22326130333a323838303a663230633a3a5c2f3438222c22326130333a323838303a663132363a3a5c2f3438222c22326130333a323838303a663232363a3a5c2f3438222c22326130333a323838303a663130353a3a5c2f3438222c22326130333a323838303a663230353a3a5c2f3438222c22326130333a323838303a663132353a3a5c2f3438222c22326130333a323838303a663232353a3a5c2f3438222c22326130333a323838303a663130363a3a5c2f3438222c22326130333a323838303a663230363a3a5c2f3438222c22326130333a323838303a663131623a3a5c2f3438222c22326130333a323838303a663231623a3a5c2f3438222c22326130333a323838303a663131333a3a5c2f3438222c22326130333a323838303a663231333a3a5c2f3438222c22326130333a323838303a663131633a3a5c2f3438222c22326130333a323838303a663231633a3a5c2f3438222c22326130333a323838303a663132383a3a5c2f3438222c22326130333a323838303a663232383a3a5c2f3438222c22326130333a323838303a663032613a3a5c2f3438222c22326130333a323838303a663132613a3a5c2f3438222c22326130333a323838303a663232613a3a5c2f3438222c22326130333a323838303a663132663a3a5c2f3438222c22326130333a323838303a663232663a3a5c2f3438222c22326130333a323838303a663131643a3a5c2f3438222c22326130333a323838303a663131653a3a5c2f3438222c22326130333a323838303a663132303a3a5c2f3438222c22326130333a323838303a663132343a3a5c2f3438222c22326130333a323838303a663132373a3a5c2f3438222c22326130333a323838303a663132393a3a5c2f3438222c22326130333a323838303a663132623a3a5c2f3438222c22326130333a323838303a663132633a3a5c2f3438222c22326130333a323838303a663132643a3a5c2f3438222c22326130333a323838303a663132653a3a5c2f3438222c22326130333a323838303a663133303a3a5c2f3438222c22326130333a323838303a663133313a3a5c2f3438222c22326130333a323838303a663133323a3a5c2f3438222c22326130333a323838303a663133333a3a5c2f3438222c22326130333a323838303a663133343a3a5c2f3438222c22326130333a323838303a663133353a3a5c2f3438222c22326130333a323838303a663133363a3a5c2f3438222c22326130333a323838303a663133373a3a5c2f3438222c22326130333a323838303a663133383a3a5c2f3438222c22326130333a323838303a663133393a3a5c2f3438222c22326130333a323838303a663133613a3a5c2f3438222c22326130333a323838303a663133623a3a5c2f3438222c22326130333a323838303a663133633a3a5c2f3438222c22326130333a323838303a663133643a3a5c2f3438222c22326130333a323838303a663133653a3a5c2f3438222c22326130333a323838303a663133663a3a5c2f3438222c22326130333a323838303a663231643a3a5c2f3438222c22326130333a323838303a663231653a3a5c2f3438222c22326130333a323838303a663232303a3a5c2f3438222c22326130333a323838303a663232343a3a5c2f3438222c22326130333a323838303a663232373a3a5c2f3438222c22326130333a323838303a663232393a3a5c2f3438222c22326130333a323838303a663232623a3a5c2f3438222c22326130333a323838303a663232633a3a5c2f3438222c22326130333a323838303a663232643a3a5c2f3438222c22326130333a323838303a663232653a3a5c2f3438222c22326130333a323838303a663233303a3a5c2f3438222c22326130333a323838303a663233313a3a5c2f3438222c22326130333a323838303a663233323a3a5c2f3438222c22326130333a323838303a663233333a3a5c2f3438222c22326130333a323838303a663233343a3a5c2f3438222c22326130333a323838303a663233353a3a5c2f3438222c22326130333a323838303a663233363a3a5c2f3438222c22326130333a323838303a663233373a3a5c2f3438222c22326130333a323838303a663233383a3a5c2f3438222c22326130333a323838303a663233393a3a5c2f3438222c22326130333a323838303a663233613a3a5c2f3438222c22326130333a323838303a663233623a3a5c2f3438222c22326130333a323838303a663233633a3a5c2f3438222c22326130333a323838303a663233643a3a5c2f3438222c22326130333a323838303a663233653a3a5c2f3438222c22326130333a323838303a663233663a3a5c2f3438222c22326130333a323838303a663066663a3a5c2f3438222c22326130333a323838303a663166663a3a5c2f3438222c22326130333a323838303a663266663a3a5c2f3438222c22326330663a656637383a303030333a3a5c2f3438225d7d2c22757074696d65726f626f74223a7b226e223a22557074696d6520526f626f74222c2264223a747275652c2272223a5b2236392e3136322e3132342e3232345c2f3238222c2236332e3134332e34322e3234305c2f3238225d7d2c2273746174757363616b65223a7b226e223a2253746174757343616b65222c2264223a747275652c2272223a5b223130332e3139342e3131322e3730222c223130342e3133312e3234372e313531222c223130342e3133312e3234382e3635222c223130342e3133312e3234382e3738222c223130342e3135362e3232392e3234222c223130342e3135362e3235352e313834222c223130342e3230362e3136382e3236222c223130342e3233382e3136342e313035222c223130372e3135302e312e313335222c223130372e3135352e3130342e313832222c223130372e3135352e3130382e323334222c223130372e3135352e3132352e3239222c223130372e3136312e32382e323139222c223130372e3137302e3139372e323438222c223130372e3137302e3231392e3436222c223130372e3137302e3232372e3233222c223130372e3137302e3232372e3234222c223130372e3137302e3234302e313431222c223130372e3137302e35332e313931222c223130372e3139312e34372e313331222c223130372e3139312e35372e323337222c223130382e36312e3131392e313533222c223130382e36312e3136322e323134222c223130382e36312e3230352e323031222c223130382e36312e3231322e313431222c223130382e36312e3231352e313739222c223132352e36332e34382e323339222c223132382e3139392e3232322e3635222c223133382e3139372e3133302e323332222c223133382e3139372e3133302e323335222c223133382e3139372e3134302e323433222c223133382e3230342e3137312e313336222c223133382e36382e32342e313135222c223133382e36382e32342e313336222c223133382e36382e32342e323037222c223133382e36382e32342e3630222c223133382e36382e38302e3130222c223133382e36382e38302e313733222c223133392e35392e31352e3739222c223133392e35392e3135352e3236222c223133392e35392e3139302e323431222c223133392e35392e32322e313039222c223133392e35392e32362e3835222c223133392e35392e32392e313637222c223134392e3135342e3135372e3631222c223134392e3235352e35392e313030222c223135312e3233362e31302e323338222c223135312e3233362e31382e3830222c223135312e38302e3137352e323233222c223135312e38302e3137352e323236222c223135342e3132372e36302e3233222c223135342e3132372e36302e3539222c223135382e3235352e3230382e3736222c223135392e3230332e3138322e3232222c223135392e3230332e3138322e3630222c223135392e3230332e3138362e323235222c223135392e3230332e33312e3138222c223136322e3234332e3234372e313633222c223136322e3234332e37312e3536222c223136322e3234382e39372e3732222c223136322e3235332e36342e313034222c223136322e3235332e36342e3837222c223137362e35362e3233302e313130222c223137382e36322e3130312e3537222c223137382e36322e3130342e313337222c223137382e36322e3130362e3834222c223137382e36322e3130392e37222c223137382e36322e34302e323333222c223137382e36322e34312e3434222c223137382e36322e34312e3439222c223137382e36322e34312e3532222c223137382e36322e36352e313632222c223137382e36322e37312e323237222c223137382e36322e37382e313939222c223137382e36322e38302e3933222c223137382e36322e38362e3639222c223137382e37332e3231302e3939222c223138312e34312e3230312e313137222c223138312e34312e3231342e313337222c223138352e3131322e3135372e313835222c223138352e31322e34352e3730222c223138352e34372e3132392e313638222c223138352e36302e3133352e3836222c223138382e3136362e3135382e323234222c223138382e3136362e3235332e313438222c223138382e3232362e3133392e313538222c223138382e3232362e3135382e313630222c223138382e3232362e3136392e323238222c223138382e3232362e3137312e3538222c223138382e3232362e3138342e313532222c223138382e3232362e3138352e313036222c223138382e3232362e3138362e313939222c223138382e3232362e3230332e3834222c223138382e3232362e3234372e313834222c223138382e36382e3233382e3739222c223139322e3234312e3232312e3131222c223139332e3132342e3137382e3534222c223139332e3132342e3137382e3631222c223139332e3138322e3134342e313035222c223139332e3138322e3134342e313437222c223139392e3136372e3132382e3830222c223230392e3232322e33302e323432222c223231332e3138332e35362e313037222c223231372e3134382e34332e313838222c223231372e3134382e34332e323032222c2233312e3232302e372e323337222c2233372e3135372e3234362e313436222c2233372e3233352e34382e3432222c2233372e3233352e35322e3235222c2233372e3233352e35332e323430222c2233372e3233352e35352e323035222c2233372e39372e3138382e313033222c2234352e33322e3132382e3830222c2234352e33322e3134352e3739222c2234352e33322e3135312e3231222c2234352e33322e3136302e313732222c2234352e33322e3136362e313935222c2234352e33322e3137312e3234222c2234352e33322e3139322e313938222c2234352e33322e3139352e313836222c2234352e33322e3139352e3933222c2234352e33322e3231322e3536222c2234352e33322e33362e313538222c2234352e33322e372e3232222c2234352e36332e3132312e313539222c2234352e36332e32362e3738222c2234352e36332e35312e3633222c2234352e36332e36312e323133222c2234352e36332e37362e3638222c2234352e36332e37382e3834222c2234352e36332e38362e313230222c2234352e36332e38382e323133222c2234352e37362e312e3434222c2234352e37362e3139322e3530222c2234352e37362e332e313132222c2234362e3130312e302e3234222c2234362e3130312e3131302e3332222c2234362e3130312e3131302e3433222c2234362e3130312e3131302e3435222c2234362e3130312e32302e3936222c2234362e3130312e3233382e313832222c2234362e3130312e3233382e313839222c2234362e3130312e3234302e323038222c2234362e3130312e32372e313836222c2234362e3130312e36312e3833222c2234362e3130312e37342e323531222c22352e34352e3137392e313033222c2235302e322e3133392e3136222c2238322e3232312e39352e313631222c2239312e3233362e3131362e313633225d7d2c226d616e6167657770223a7b226e223a224d616e6167655750222c2264223a66616c73652c2272223a5b2233342e3231312e3138302e3636222c2235342e37302e36352e313037222c2233342e3231302e3232342e37222c2235322e34312e352e313038222c2235322e33352e37322e313239222c2235342e3139312e3133372e3137222c2233352e3136322e3235342e323533222c2235322e31312e31322e323331222c2235322e31312e32392e3730222c2235322e31312e35342e313631222c2235322e32342e3134322e313539222c2235322e32352e3139312e323535222c2235322e32372e3138312e313236222c2235322e33342e3132362e313137222c2235322e33342e3235342e3437222c2235322e33352e38322e3939222c2235322e33362e32382e3830222c2235322e33382e3130362e3937222c2235322e33392e3137372e313532222c2235322e34312e3233302e313438222c2235322e34312e3233372e3132222c2235322e34322e3132362e313636222c2235322e34332e31332e3731222c2235322e34332e37362e323234222c2235322e38382e39362e313130222c2235322e38392e3135352e3531222c2235342e3134382e37332e313138222c2235342e3138362e33372e313035222c2235342e3138372e39322e3537222c2235342e3139312e33322e3635222c2235342e3139312e36372e3233222c2235342e3139312e38302e313139222c2235342e3139312e3133352e323039222c2235342e3139312e3133362e313736222c2235342e3139312e3134382e3835222c2235342e3139312e3134392e38222c2235322e32362e3132322e3231222c2235322e32342e3138372e3239222c2235322e38392e38352e313037222c2235342e3138362e3132382e313637222c2235342e3139312e34302e313336222c2235322e32342e36322e3131222c2235322e38382e3131392e313232222c2235342e3139312e3134382e323235222c2235342e3139312e3135312e3138222c2235322e38392e39342e313231222c2235322e32352e3131362e313136222c2235322e38382e3231352e323235222c2235342e3138362e3134332e313834222c2235322e38382e3139372e313830222c2235322e32372e3137312e313236225d7d2c2273657a6e616d223a7b226e223a2253657a6e616d2053656172636820456e67696e65222c2264223a747275652c2272223a5b2237372e37352e37342e305c2f3234222c2237372e37352e37362e305c2f3234222c2237372e37352e37372e305c2f3234222c2237372e37352e37382e305c2f3234222c2237372e37352e37392e305c2f3234222c22326130323a3539383a613a3a37383a305c2f313132222c22326130323a3539383a613a3a37393a305c2f313132222c22326130323a3539383a323a3a305c2f3936225d7d7d, 'yes'),
('wordfenceI18n', 0x31, 'yes'),
('wordpressPluginVersions', 0x613a31343a7b733a32323a22616476616e6365642d637573746f6d2d6669656c6473223b733a353a22362e302e32223b733a373a22616b69736d6574223b733a353a22352e302e31223b733a33353a22616c6c2d696e2d6f6e652d77702d73656375726974792d616e642d6669726577616c6c223b733a353a22352e302e39223b733a31343a22636f6e746163742d666f726d2d37223b733a353a22352e362e33223b733a33333a22656c6567616e742d726573706f6e736976652d636f6e74656e742d736c69646572223b733a353a22312e302e32223b733a31303a22666c75656e74666f726d223b733a363a22342e332e3135223b733a353a2268656c6c6f223b733a353a22312e372e32223b733a373a226a65747061636b223b733a343a2231312e34223b733a31363a2273656f2d62792d72616e6b2d6d617468223b733a363a22312e302e3939223b733a31343a22736d6172742d736c696465722d33223b733a383a22332e352e312e3131223b733a31353a226175746f6465736372697074696f6e223b733a353a22342e322e35223b733a393a22776f726466656e6365223b733a353a22372e372e31223b733a33323a2277702d726573706f6e736976652d726563656e742d706f73742d736c69646572223b733a333a22332e31223b733a31333a22776f726470726573732d73656f223b733a363a2231392e372e32223b7d, 'yes'),
('wordpressThemeVersions', 0x613a333a7b733a31323a227477656e74797477656e7479223b733a333a22322e30223b733a31353a227477656e74797477656e74796f6e65223b733a333a22312e36223b733a31353a227477656e74797477656e747974776f223b733a333a22312e32223b7d, 'yes'),
('wordpressVersion', 0x362e302e32, 'yes'),
('wp_home_url', 0x687474703a2f2f6c6f63616c686f73742f776f72647072657373, 'yes'),
('wp_site_url', 0x687474703a2f2f6c6f63616c686f73742f776f72647072657373, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfcrawlers`
--

CREATE TABLE `wp_wfcrawlers` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `patternSig` binary(16) NOT NULL,
  `status` char(8) NOT NULL,
  `lastUpdate` int(10) UNSIGNED NOT NULL,
  `PTR` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wffilechanges`
--

CREATE TABLE `wp_wffilechanges` (
  `filenameHash` char(64) NOT NULL,
  `file` varchar(1000) NOT NULL,
  `md5` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wffilemods`
--

CREATE TABLE `wp_wffilemods` (
  `filenameMD5` binary(16) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `real_path` text NOT NULL,
  `knownFile` tinyint(3) UNSIGNED NOT NULL,
  `oldMD5` binary(16) NOT NULL,
  `newMD5` binary(16) NOT NULL,
  `SHAC` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `stoppedOnSignature` varchar(255) NOT NULL DEFAULT '',
  `stoppedOnPosition` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isSafeFile` varchar(1) NOT NULL DEFAULT '?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfhits`
--

CREATE TABLE `wp_wfhits` (
  `id` int(10) UNSIGNED NOT NULL,
  `attackLogTime` double(17,6) UNSIGNED NOT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `jsRun` tinyint(4) DEFAULT 0,
  `statusCode` int(11) NOT NULL DEFAULT 200,
  `isGoogle` tinyint(4) NOT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `newVisit` tinyint(3) UNSIGNED NOT NULL,
  `URL` text DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `UA` text DEFAULT NULL,
  `action` varchar(64) NOT NULL DEFAULT '',
  `actionDescription` text DEFAULT NULL,
  `actionData` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfhoover`
--

CREATE TABLE `wp_wfhoover` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner` text DEFAULT NULL,
  `host` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `hostKey` varbinary(124) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfissues`
--

CREATE TABLE `wp_wfissues` (
  `id` int(10) UNSIGNED NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `lastUpdated` int(10) UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint(3) UNSIGNED NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text DEFAULT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfknownfilelist`
--

CREATE TABLE `wp_wfknownfilelist` (
  `id` int(11) UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `wordpress_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wflivetraffichuman`
--

CREATE TABLE `wp_wflivetraffichuman` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `identifier` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `expiration` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wflocs`
--

CREATE TABLE `wp_wflocs` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ctime` int(10) UNSIGNED NOT NULL,
  `failed` tinyint(3) UNSIGNED NOT NULL,
  `city` varchar(255) DEFAULT '',
  `region` varchar(255) DEFAULT '',
  `countryName` varchar(255) DEFAULT '',
  `countryCode` char(2) DEFAULT '',
  `lat` float(10,7) DEFAULT 0.0000000,
  `lon` float(10,7) DEFAULT 0.0000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_wflocs`
--

INSERT INTO `wp_wflocs` (`IP`, `ctime`, `failed`, `city`, `region`, `countryName`, `countryCode`, `lat`, `lon`) VALUES
(0x00000000000000000000000000000001, 1665457808, 1, '', '', '', '', 0.0000000, 0.0000000);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wflogins`
--

CREATE TABLE `wp_wflogins` (
  `id` int(10) UNSIGNED NOT NULL,
  `hitID` int(11) DEFAULT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `fail` tinyint(3) UNSIGNED NOT NULL,
  `action` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `UA` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfls_2fa_secrets`
--

CREATE TABLE `wp_wfls_2fa_secrets` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `secret` tinyblob NOT NULL,
  `recovery` blob NOT NULL,
  `ctime` int(10) UNSIGNED NOT NULL,
  `vtime` int(10) UNSIGNED NOT NULL,
  `mode` enum('authenticator') NOT NULL DEFAULT 'authenticator'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfls_settings`
--

CREATE TABLE `wp_wfls_settings` (
  `name` varchar(191) NOT NULL DEFAULT '',
  `value` longblob DEFAULT NULL,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_wfls_settings`
--

INSERT INTO `wp_wfls_settings` (`name`, `value`, `autoload`) VALUES
('2fa-user-grace-period', 0x3130, 'yes'),
('allow-disabling-ntp', 0x31, 'yes'),
('allow-xml-rpc', 0x31, 'yes'),
('captcha-stats', 0x7b22636f756e7473223a5b302c302c302c302c302c302c302c302c302c302c305d2c22617667223a307d, 'yes'),
('delete-deactivation', '', 'yes'),
('enable-auth-captcha', '', 'yes'),
('enable-login-history-columns', 0x31, 'yes'),
('enable-woocommerce-integration', '', 'yes'),
('global-notices', 0x5b5d, 'yes'),
('ip-source', '', 'yes'),
('ip-trusted-proxies', '', 'yes'),
('last-secret-refresh', 0x31363635343537333730, 'yes'),
('recaptcha-threshold', 0x302e35, 'yes'),
('remember-device', '', 'yes'),
('remember-device-duration', 0x32353932303030, 'yes'),
('require-2fa-grace-period-enabled', '', 'yes'),
('require-2fa.administrator', '', 'yes'),
('shared-hash-secret', 0x65353739383365636461303432396566373461303466376232386633636363663963653864366637633332643830356435613939623639663038313432393136, 'yes'),
('shared-symmetric-secret', 0x39393837633239326162666137396162653334363161646265663736666263323065333162346162366139373362393536303130646236386539636162393662, 'yes'),
('whitelisted', '', 'yes'),
('xmlrpc-enabled', 0x31, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfnotifications`
--

CREATE TABLE `wp_wfnotifications` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `new` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `category` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 1000,
  `ctime` int(10) UNSIGNED NOT NULL,
  `html` text NOT NULL,
  `links` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_wfnotifications`
--

INSERT INTO `wp_wfnotifications` (`id`, `new`, `category`, `priority`, `ctime`, `html`, `links`) VALUES
('network-GQ2TGNZW', 1, 'toupp-20220714', 100, 1665457436, '<p><strong>Wordfence Terms of Service and UK IDTA</strong></p>\n<p>Please review the updated Terms of Service with the new UK IDTA.\n</p>\n<p><a href=\"https://www.wordfence.com/terms-of-service/?utm_source=plugin&amp;utm_medium=pluginalert&amp;utm_campaign=toupp20220714\" class=\"wf-btn wf-btn-callout wf-btn-primary\" target=\"_blank\">Terms of Service</a> <a href=\"https://www.wordfence.com/uk-international-data-transfer-addendum/?utm_source=plugin&amp;utm_medium=pluginalert&amp;utm_campaign=toupp20220714\" class=\"wf-btn wf-btn-callout wf-btn-primary\" target=\"_blank\">UK IDTA</a></p>\n', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfpendingissues`
--

CREATE TABLE `wp_wfpendingissues` (
  `id` int(10) UNSIGNED NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `lastUpdated` int(10) UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint(3) UNSIGNED NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text DEFAULT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfreversecache`
--

CREATE TABLE `wp_wfreversecache` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `host` varchar(255) NOT NULL,
  `lastUpdate` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_wfreversecache`
--

INSERT INTO `wp_wfreversecache` (`IP`, `host`, `lastUpdate`) VALUES
(0x00000000000000000000000000000001, 'DESKTOP-TVI98RA', 1665457807);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfsnipcache`
--

CREATE TABLE `wp_wfsnipcache` (
  `id` int(10) UNSIGNED NOT NULL,
  `IP` varchar(45) NOT NULL DEFAULT '',
  `expiration` timestamp NOT NULL DEFAULT current_timestamp(),
  `body` varchar(255) NOT NULL DEFAULT '',
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfstatus`
--

CREATE TABLE `wp_wfstatus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `type` char(5) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_wfstatus`
--

INSERT INTO `wp_wfstatus` (`id`, `ctime`, `level`, `type`, `msg`) VALUES
(1, 1665457443.117090, 10, 'info', 'SUM_PREP:Preparing a new scan.'),
(2, 1665457443.121655, 1, 'info', 'Initiating quick scan'),
(3, 1665457443.126624, 10, 'info', 'SUM_START:Checking Web Application Firewall status'),
(4, 1665457443.130731, 10, 'info', 'SUM_ENDOK:Checking Web Application Firewall status'),
(5, 1665457443.137742, 10, 'info', 'SUM_START:Scanning for old themes, plugins and core files'),
(6, 1665457443.148215, 10, 'info', 'SUM_ENDOK:Scanning for old themes, plugins and core files'),
(7, 1665457443.153180, 1, 'info', '-------------------'),
(8, 1665457443.156245, 2, 'info', 'Wordfence used 0 B of memory for scan. Server peak memory usage was: 90 MB'),
(9, 1665457443.162490, 1, 'info', 'Quick Scan Complete. Scanned in less than 1 second.'),
(10, 1665457443.164324, 10, 'info', 'SUM_FINAL:Scan complete. Congratulations, no new problems found.');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wftrafficrates`
--

CREATE TABLE `wp_wftrafficrates` (
  `eMin` int(10) UNSIGNED NOT NULL,
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `hitType` enum('hit','404') NOT NULL DEFAULT 'hit',
  `hits` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_indexable`
--

CREATE TABLE `wp_yoast_indexable` (
  `id` int(11) UNSIGNED NOT NULL,
  `permalink` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permalink_hash` varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_sub_type` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `post_parent` bigint(20) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `breadcrumb_title` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT 0,
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int(11) UNSIGNED DEFAULT NULL,
  `canonical` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `primary_focus_keyword` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `primary_focus_keyword_score` int(3) DEFAULT NULL,
  `readability_score` int(3) DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT 0,
  `is_robots_noindex` tinyint(1) DEFAULT 0,
  `is_robots_nofollow` tinyint(1) DEFAULT 0,
  `is_robots_noarchive` tinyint(1) DEFAULT 0,
  `is_robots_noimageindex` tinyint(1) DEFAULT 0,
  `is_robots_nosnippet` tinyint(1) DEFAULT 0,
  `twitter_title` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_image` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_description` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_image_source` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_title` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_description` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image_source` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image_meta` mediumtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `link_count` int(11) DEFAULT NULL,
  `incoming_link_count` int(11) DEFAULT NULL,
  `prominent_words_version` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `blog_id` bigint(20) NOT NULL DEFAULT 1,
  `language` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `region` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_page_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_article_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `has_ancestors` tinyint(1) DEFAULT 0,
  `estimated_reading_time_minutes` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT 1,
  `object_last_modified` datetime DEFAULT NULL,
  `object_published_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_yoast_indexable`
--

INSERT INTO `wp_yoast_indexable` (`id`, `permalink`, `permalink_hash`, `object_id`, `object_type`, `object_sub_type`, `author_id`, `post_parent`, `title`, `description`, `breadcrumb_title`, `post_status`, `is_public`, `is_protected`, `has_public_posts`, `number_of_pages`, `canonical`, `primary_focus_keyword`, `primary_focus_keyword_score`, `readability_score`, `is_cornerstone`, `is_robots_noindex`, `is_robots_nofollow`, `is_robots_noarchive`, `is_robots_noimageindex`, `is_robots_nosnippet`, `twitter_title`, `twitter_image`, `twitter_description`, `twitter_image_id`, `twitter_image_source`, `open_graph_title`, `open_graph_description`, `open_graph_image`, `open_graph_image_id`, `open_graph_image_source`, `open_graph_image_meta`, `link_count`, `incoming_link_count`, `prominent_words_version`, `created_at`, `updated_at`, `blog_id`, `language`, `region`, `schema_page_type`, `schema_article_type`, `has_ancestors`, `estimated_reading_time_minutes`, `version`, `object_last_modified`, `object_published_at`) VALUES
(1, 'http://localhost/wordpress/author/smkn1surabaya/', '48:17f70bd9af945d506fef17d752d58604', 1, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://2.gravatar.com/avatar/b2aa64ec158b2d2a7b75698eaf9acae8?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://2.gravatar.com/avatar/b2aa64ec158b2d2a7b75698eaf9acae8?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-11 02:26:43'),
(2, 'http://localhost/wordpress/?page_id=3', '37:8974cd9472d7efb35f574c376af4e91c', 3, 'post', 'page', 1, 0, NULL, NULL, 'Kebijakan Privasi', 'draft', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 02:26:43', '2022-10-11 02:26:43'),
(3, 'http://localhost/wordpress/laman-contoh/', '40:b7a7cad66a2a0e48cdc5a3b22f0b9fb5', 2, 'post', 'page', 1, 0, NULL, NULL, 'Laman Contoh', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 02:26:43', '2022-10-11 02:26:43'),
(4, 'http://localhost/wordpress/2022/10/11/halo-dunia/', '49:307d48c4296cc5253ff54434ad798349', 1, 'post', 'post', 1, 0, NULL, NULL, 'Halo dunia!', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 02:26:43', '2022-10-11 02:26:43'),
(5, 'http://localhost/wordpress/tak-berkategori/', '43:59c4cbaa39a7a1ac2ff06cff8ff8f62b', 1, 'term', 'category', NULL, NULL, NULL, NULL, 'Tak Berkategori', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 21:25:07', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 02:26:43', '2022-10-11 02:26:43'),
(6, NULL, NULL, NULL, 'system-page', '404', NULL, NULL, 'Laman tidak ditemukan %%sep%% %%sitename%%', NULL, 'Galat 404: Laman tidak ditemukan', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 17:03:27', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL),
(7, NULL, NULL, NULL, 'system-page', 'search-result', NULL, NULL, 'Anda mencari %%searchphrase%% %%page%% %%sep%% %%sitename%%', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 17:03:27', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL),
(8, NULL, NULL, NULL, 'date-archive', NULL, NULL, NULL, '%%date%% %%page%% %%sep%% %%sitename%%', '', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 17:03:27', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL),
(9, 'http://localhost/wordpress/', '27:f6ce664b63cd5429c9dfe0e29670b4df', NULL, 'home-page', NULL, NULL, NULL, '%%sitename%% %%page%% %%sep%% %%sitedesc%%', 'Moto situs Anda bisa diletakkan di sini', 'Beranda', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '%%sitename%%', '', '', '0', NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:00:30', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-11 02:26:43'),
(10, NULL, NULL, 6, 'post', 'wpcf7_contact_form', 1, 0, NULL, NULL, 'Formulir kontak 1', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:00:43', '2022-10-26 00:03:20', 1, NULL, NULL, NULL, NULL, 0, NULL, 0, '2022-10-11 03:00:43', '2022-10-11 03:00:43'),
(12, 'http://localhost/wordpress/author/admin20/', '42:844eec69bf0f50bd8df2ca89da9c1bd2', 4, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://0.gravatar.com/avatar/9335cf69e71c16840a0e819b7bbaa939?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://0.gravatar.com/avatar/9335cf69e71c16840a0e819b7bbaa939?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2022-10-11 03:35:44', '2022-10-25 17:03:51', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL),
(13, 'http://localhost/wordpress/author/20editor/', '43:d30d57f216dff0aef60e19f070fef4a8', 5, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://0.gravatar.com/avatar/334b45d359b7fecdac8d44178e6394af?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://0.gravatar.com/avatar/334b45d359b7fecdac8d44178e6394af?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2022-10-11 03:36:16', '2022-10-25 17:03:51', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL),
(14, 'http://localhost/wordpress/?post_type=news&p=8', '46:cbc0f002d4301d0a01eed11e27df0d47', 8, 'post', 'news', 1, 0, NULL, NULL, 'News1', 'trash', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:42:49', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 03:46:49', '2022-10-11 03:46:49'),
(15, 'http://localhost/wordpress/news/news-updates/', '45:0a12c2f3f6c66db29a1435811a5786e3', 2, 'term', 'news-category', NULL, NULL, NULL, NULL, 'News Updates', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:43:21', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 04:16:10', '2022-10-11 03:46:32'),
(16, 'http://localhost/wordpress/news/covid-19-events/', '48:f2b6a0c3059e83599344863546085a59', 3, 'term', 'news-category', NULL, NULL, NULL, NULL, 'COVID-19 Events', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:43:45', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 04:12:19', '2022-10-11 04:11:45'),
(17, 'http://localhost/wordpress/?post_type=news&p=9', '46:56dc9bcb04178127cd9ed2ea1a4c3dc7', 9, 'post', 'news', 1, 0, NULL, NULL, 'News1', 'trash', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:44:09', '2022-10-25 17:03:28', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 03:46:44', '2022-10-11 03:46:44'),
(18, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg', '92:69ceed1507d3ba90f851e4db196bae76', 10, 'post', 'attachment', 1, 9, NULL, NULL, 'allison-saeng-ETl-TFkPEEs-unsplash', 'inherit', NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg', NULL, '10', 'attachment-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg', '10', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1371,\n    \"filesize\": 138407,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 10,\n    \"alt\": \"\",\n    \"pixels\": 2632320,\n    \"type\": \"image/jpeg\"\n}', NULL, NULL, NULL, '2022-10-11 03:44:41', '2022-10-25 17:03:28', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-11 03:44:41', '2022-10-11 03:44:41'),
(19, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg', '92:05a7b2e46b074d29a3824e6cab6469b3', 11, 'post', 'attachment', 1, 9, NULL, NULL, 'allison-saeng-GcIXJ1tgoU4-unsplash', 'inherit', NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg', NULL, '11', 'attachment-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg', '11', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1371,\n    \"filesize\": 104475,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-GcIXJ1tgoU4-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 11,\n    \"alt\": \"\",\n    \"pixels\": 2632320,\n    \"type\": \"image/jpeg\"\n}', NULL, NULL, NULL, '2022-10-11 03:44:44', '2022-10-25 17:03:28', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-11 03:44:43', '2022-10-11 03:44:43'),
(20, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg', '92:d90150c9fa5135411a4fbcf9b2dae28e', 12, 'post', 'attachment', 1, 9, NULL, NULL, 'allison-saeng-HMvUuZQz4b0-unsplash', 'inherit', NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg', NULL, '12', 'attachment-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg', '12', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1371,\n    \"filesize\": 117915,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 12,\n    \"alt\": \"\",\n    \"pixels\": 2632320,\n    \"type\": \"image/jpeg\"\n}', NULL, NULL, NULL, '2022-10-11 03:44:46', '2022-10-25 17:03:28', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-11 03:44:46', '2022-10-11 03:44:46'),
(21, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg', '92:32b0846a3bd187fd7d39842483c9810d', 13, 'post', 'attachment', 1, 9, NULL, NULL, 'allison-saeng-j-zSNOQU7i0-unsplash', 'inherit', NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg', NULL, '13', 'attachment-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg', '13', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1344,\n    \"filesize\": 42002,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 13,\n    \"alt\": \"\",\n    \"pixels\": 2580480,\n    \"type\": \"image/jpeg\"\n}', NULL, NULL, NULL, '2022-10-11 03:44:48', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-11 03:44:48', '2022-10-11 03:44:48'),
(22, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg', '92:bd86dda2b2a172f8d79885164d1b9415', 14, 'post', 'attachment', 1, 9, NULL, NULL, 'allison-saeng-xnANlVZMViA-unsplash', 'inherit', NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg', NULL, '14', 'attachment-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg', '14', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1344,\n    \"filesize\": 44143,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 14,\n    \"alt\": \"\",\n    \"pixels\": 2580480,\n    \"type\": \"image/jpeg\"\n}', NULL, NULL, NULL, '2022-10-11 03:44:49', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-11 03:44:49', '2022-10-11 03:44:49'),
(23, 'http://localhost/wordpress/news/post/news1/', '43:71670ed4d0765a15229612cbf235a881', 16, 'post', 'news', 1, 0, NULL, NULL, 'News1', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg', NULL, '10', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg', '10', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1371,\n    \"filesize\": 138407,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-ETl-TFkPEEs-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 10,\n    \"alt\": \"\",\n    \"pixels\": 2632320,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-11 03:46:23', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-10-11 04:16:10', '2022-10-11 03:46:32'),
(25, 'http://localhost/wordpress/2022/10/26/home/', '43:14e9e2d5be22fd0931ae5cc4e7aebebe', 18, 'post', 'nav_menu_item', 1, 0, NULL, NULL, 'Home', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:48:39', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-11 03:48:49'),
(26, NULL, NULL, 20, 'post', 'wp_global_styles', 1, 0, NULL, NULL, 'Custom Styles', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:49:32', '2022-10-26 00:03:20', 1, NULL, NULL, NULL, NULL, 0, NULL, 0, '2022-10-11 03:49:32', '2022-10-11 03:49:32'),
(27, 'http://localhost/wordpress/', '27:f6ce664b63cd5429c9dfe0e29670b4df', 19, 'post', 'page', 1, 0, NULL, NULL, 'Home', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-11 03:49:36', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, 0, 2, '2022-10-11 03:49:38', '2022-10-11 03:49:36'),
(28, NULL, NULL, NULL, 'post-type-archive', 'news', NULL, NULL, '%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%', '', 'News', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-11 03:50:13', '2022-10-26 00:03:20', 1, NULL, NULL, NULL, NULL, 0, NULL, 0, '2022-10-11 04:16:10', '2022-10-11 03:46:32'),
(29, 'http://localhost/wordpress/news/post/news2/', '43:690de1b88abb93c225a16696d0e752e4', 22, 'post', 'news', 1, 0, NULL, NULL, 'News2', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg', NULL, '12', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg', '12', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1371,\n    \"filesize\": 117915,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-HMvUuZQz4b0-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 12,\n    \"alt\": \"\",\n    \"pixels\": 2632320,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-11 04:11:23', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, 2, 2, '2022-10-11 04:11:45', '2022-10-11 04:11:45'),
(30, 'http://localhost/wordpress/news/post/news3/', '43:b16a4782cc7630b42ece1b2b26576461', 23, 'post', 'news', 1, 0, NULL, NULL, 'News3', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg', NULL, '13', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg', '13', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1344,\n    \"filesize\": 42002,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-j-zSNOQU7i0-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 13,\n    \"alt\": \"\",\n    \"pixels\": 2580480,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-11 04:11:58', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, 2, 2, '2022-10-11 04:12:19', '2022-10-11 04:12:19'),
(31, 'http://localhost/wordpress/news/post/news4/', '43:acc33dae5f0e9d7c72519790432822d1', 24, 'post', 'news', 1, 0, NULL, NULL, 'News4', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg', NULL, '14', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg', '14', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1344,\n    \"filesize\": 44143,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/allison-saeng-xnANlVZMViA-unsplash.jpg\",\n    \"size\": \"full\",\n    \"id\": 14,\n    \"alt\": \"\",\n    \"pixels\": 2580480,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-11 04:12:31', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, 2, 2, '2022-10-11 04:14:26', '2022-10-11 04:12:50'),
(34, 'http://localhost/wordpress/news/', '32:b61fe3bccda5d3d37d5709ffb56b2aba', NULL, 'post-type-archive', 'news', NULL, NULL, '%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%', '', 'News', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-26 00:03:29', '2022-10-25 17:03:29', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-11 04:16:10', '2022-10-11 03:46:32'),
(35, 'http://localhost/wordpress/author/admin/', '40:80a5b4e7a28c2ffb594ad24f91445e34', 2, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://1.gravatar.com/avatar/75d23af433e0cea4c0e45a56dba18b30?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://1.gravatar.com/avatar/75d23af433e0cea4c0e45a56dba18b30?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2022-10-26 00:03:51', '2022-10-25 17:03:51', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL),
(36, 'http://localhost/wordpress/author/irfan_lks/', '44:2da170d8a80b1f5dae047811b30bfd07', 3, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://2.gravatar.com/avatar/b6b89bfd0da2f657beccac4cc77285b6?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://2.gravatar.com/avatar/b6b89bfd0da2f657beccac4cc77285b6?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2022-10-26 00:03:51', '2022-10-25 17:03:51', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL),
(37, 'http://localhost/wordpress/author/subscriber/', '45:81dd608dc090a29a5aea98690360579c', 6, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://2.gravatar.com/avatar/8b447a23facf42c1a8bc0037d1625af9?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://2.gravatar.com/avatar/8b447a23facf42c1a8bc0037d1625af9?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2022-10-26 04:26:43', '2022-10-25 21:26:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 04:26:43', NULL),
(38, 'http://localhost/wordpress/genres/action/', '41:60d77f77543a57d5954546d1e12eb754', 6, 'term', 'genres', NULL, NULL, NULL, NULL, 'Action', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:39:09', '2022-10-25 23:16:42', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:16:41', NULL),
(39, 'http://localhost/wordpress/genres/comedy/', '41:e42ee67361fdfd62c4a060aa4587858a', 7, 'term', 'genres', NULL, NULL, NULL, NULL, 'Comedy', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:39:16', '2022-10-25 23:23:28', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:23:27', NULL),
(40, 'http://localhost/wordpress/genres/sport/', '40:57dbc6371a889e5b3fe1d5963763485a', 8, 'term', 'genres', NULL, NULL, NULL, NULL, 'Sport', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:39:22', '2022-10-25 22:17:36', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 05:17:35', NULL),
(41, 'http://localhost/wordpress/genres/romance/', '42:60126130569dfa8e5baac88ac332d11a', 9, 'term', 'genres', NULL, NULL, NULL, NULL, 'Romance', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:39:27', '2022-10-25 23:23:28', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:23:27', NULL),
(42, 'http://localhost/wordpress/2022/10/26/30/', '41:81ad9d487be1c7c80e80112f5e90c577', 30, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:41:47', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 04:42:06'),
(43, 'http://localhost/wordpress/2022/10/26/31/', '41:6e0b93e954236985b0e37651533f20e6', 31, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:41:47', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 04:42:06'),
(44, 'http://localhost/wordpress/2022/10/26/32/', '41:1fc92020c4239521a037cb458d76df94', 32, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:41:47', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 04:42:06'),
(45, 'http://localhost/wordpress/2022/10/26/33/', '41:940f137171998ac3acea8d3078defb83', 33, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:41:47', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 04:42:06'),
(46, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', '84:def0c5f99ba1c7da28a25c09cafbea7c', 34, 'post', 'attachment', 1, 0, NULL, NULL, 'alternate-world-pharmacy-2', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', NULL, '34', 'attachment-image', NULL, NULL, NULL, '34', 'attachment-image', NULL, NULL, NULL, NULL, '2022-10-26 04:44:33', '2022-10-25 21:44:33', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 04:44:33', '2022-10-26 04:44:33'),
(47, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', '84:c440a2e771365637e917aebc2db53996', 35, 'post', 'attachment', 1, 0, NULL, NULL, 'alternate-world-pharmacy-3', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', NULL, '35', 'attachment-image', NULL, NULL, NULL, '35', 'attachment-image', NULL, NULL, NULL, NULL, '2022-10-26 04:44:35', '2022-10-25 21:44:35', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 04:44:35', '2022-10-26 04:44:35'),
(48, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-1.jpg', '84:cf7a051560954e3f143523c1e0f7062c', 36, 'post', 'attachment', 1, 0, NULL, NULL, 'alternate-world-pharmacy-1', 'inherit', 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-1.jpg', NULL, '36', 'attachment-image', NULL, NULL, NULL, '36', 'attachment-image', NULL, NULL, NULL, NULL, '2022-10-26 04:44:37', '2022-10-25 21:44:37', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 04:44:37', '2022-10-26 04:44:37'),
(49, 'http://localhost/wordpress/?post_type=acf-field-group&p=37', '58:e632d3d75bd98ca648e4c358ab5dfb34', 37, 'post', 'acf-field-group', 1, 0, NULL, NULL, 'anime', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:47:06', '2022-10-25 22:08:06', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 05:08:06', '2022-10-26 04:47:07'),
(58, 'http://localhost/wordpress/?post_type=acf-field&p=46', '52:31a87211195ad1af5b68de6f093e964f', 46, 'post', 'acf-field', 1, 37, NULL, NULL, 'Release Date', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:47:11', '2022-10-25 21:54:40', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-26 04:54:40', '2022-10-26 04:47:11'),
(59, 'http://localhost/wordpress/?post_type=acf-field&p=47', '52:da569eef8b9e5ee3c27e8fe5114e7ba8', 47, 'post', 'acf-field', 1, 37, NULL, NULL, 'Number Episode', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:47:12', '2022-10-25 22:08:05', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-26 05:08:05', '2022-10-26 04:47:11'),
(60, 'http://localhost/wordpress/?post_type=acf-field&p=48', '52:a8dd1e4abb62afa4902c2e8540e9eb1c', 48, 'post', 'acf-field', 1, 37, NULL, NULL, 'Episode Link', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 04:52:38', '2022-10-25 22:08:06', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-10-26 05:08:05', '2022-10-26 04:52:38'),
(64, 'http://localhost/wordpress/anime/test/', '38:548692f5d25f8bbef33ee5522aa8de9c', 53, 'post', 'animes', 1, 0, NULL, NULL, 'Test', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', NULL, '34', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', '34', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"filesize\": 414494,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg\",\n    \"size\": \"full\",\n    \"id\": 34,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-26 05:07:18', '2022-10-25 22:19:58', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-10-26 05:19:58', '2022-10-26 05:10:21'),
(65, 'http://localhost/wordpress/anime/test2/', '39:f4ddba478f5baf25f20b2523e6e96391', 54, 'post', 'animes', 1, 0, NULL, NULL, 'Test2', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 90, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', NULL, '34', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', '34', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"filesize\": 414494,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg\",\n    \"size\": \"full\",\n    \"id\": 34,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-26 05:13:12', '2022-10-25 22:16:10', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-10-26 05:16:10', '2022-10-26 05:16:10'),
(66, 'http://localhost/wordpress/anime/test3/', '39:0610a11920b8df180c893cb6ce39a572', 57, 'post', 'animes', 1, 0, NULL, NULL, 'Test3', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', NULL, '35', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', '35', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"filesize\": 357226,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg\",\n    \"size\": \"full\",\n    \"id\": 35,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-26 05:16:37', '2022-10-25 22:19:31', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-10-26 05:19:31', '2022-10-26 05:17:03'),
(67, 'http://localhost/wordpress/anime/test4/', '39:ac466af9da4a6a50c71e70c4e301b5a7', 58, 'post', 'animes', 1, 0, NULL, NULL, 'Test4', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 90, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', NULL, '35', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', '35', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"filesize\": 357226,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg\",\n    \"size\": \"full\",\n    \"id\": 35,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-26 05:17:15', '2022-10-25 22:17:36', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-10-26 05:17:35', '2022-10-26 05:17:35'),
(68, 'http://localhost/wordpress/2022/10/26/anime-list/', '49:69006a6836c666ed57780873f15df0ad', 60, 'post', 'nav_menu_item', 1, 0, NULL, NULL, 'Anime List', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 05:38:47', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 05:40:19'),
(69, 'http://localhost/wordpress/2022/10/26/genres/', '45:6ec1942fc17cd5c63a7dd663275af587', 61, 'post', 'nav_menu_item', 1, 0, NULL, NULL, 'Genres', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 05:38:56', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 05:40:19'),
(70, 'http://localhost/wordpress/2022/10/26/seasons/', '46:c64e5014ce70c025ff9ad7260cc5dfcc', 62, 'post', 'nav_menu_item', 1, 0, NULL, NULL, 'Seasons', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 05:39:05', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 05:40:19'),
(71, 'http://localhost/wordpress/2022/10/26/articles/', '47:8827a7d4e6c0b57ee709c1d99f0e8c9f', 63, 'post', 'nav_menu_item', 1, 0, NULL, NULL, 'Articles', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 05:39:27', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 05:40:19'),
(72, 'http://localhost/wordpress/anime-list/', '38:d0c77fdf93edd2e65562afa41115027d', NULL, 'post-type-archive', 'animes', NULL, NULL, '%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%', '', 'Anime', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-26 05:50:23', '2022-10-25 23:23:28', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:23:27', '2022-10-26 05:10:21'),
(73, 'http://localhost/wordpress/anime/test5/', '39:48984b9aab26dc277fda68f66d154b0c', 64, 'post', 'animes', 1, 0, NULL, NULL, 'Test5', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', NULL, '34', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg', '34', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"filesize\": 414494,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-2.jpg\",\n    \"size\": \"full\",\n    \"id\": 34,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-26 06:16:15', '2022-10-25 23:16:42', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-10-26 06:16:41', '2022-10-26 06:16:41'),
(74, 'http://localhost/wordpress/seasons/winter-2022/', '47:9562b94fd0a51bd6bacf979192493005', 10, 'term', 'seasons', NULL, NULL, NULL, NULL, 'Winter 2022', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:20:21', '2022-10-25 23:23:28', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:23:27', NULL),
(75, 'http://localhost/wordpress/seasons/summer-2022/', '47:744996dad43f002cc7b3352c6cac7b52', 11, 'term', 'seasons', NULL, NULL, NULL, NULL, 'Summer 2022', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:20:30', '2022-10-25 23:20:30', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:20:30', NULL),
(76, 'http://localhost/wordpress/seasons/spring-2022/', '47:ef060e1a37af8695d60dacb3cf2c5c8a', 12, 'term', 'seasons', NULL, NULL, NULL, NULL, 'Spring 2022', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:20:35', '2022-10-25 23:23:28', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:23:27', NULL),
(77, 'http://localhost/wordpress/seasons/fall-2022/', '45:dcbdf5d9c66637ce44c81eb82dd87220', 13, 'term', 'seasons', NULL, NULL, NULL, NULL, 'Fall 2022', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:20:39', '2022-10-25 23:20:39', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:20:39', NULL),
(78, 'http://localhost/wordpress/seasons/winter-2023/', '47:ea3f383ca74245a621086ff67c340ffe', 14, 'term', 'seasons', NULL, NULL, NULL, NULL, 'Winter 2023', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:20:43', '2022-10-25 23:20:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:20:43', NULL),
(79, 'http://localhost/wordpress/anime/test6/', '39:81c007c8d93ba6c0c3b34ef50747d013', 66, 'post', 'animes', 1, 0, NULL, NULL, 'Test6', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', NULL, '35', 'featured-image', NULL, NULL, 'http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg', '35', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"filesize\": 357226,\n    \"url\": \"http://localhost/wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg\",\n    \"path\": \"C:\\\\xampp\\\\htdocs\\\\wordpress/wp-content/uploads/2022/10/alternate-world-pharmacy-3.jpg\",\n    \"size\": \"full\",\n    \"id\": 35,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-10-26 06:22:42', '2022-10-25 23:23:28', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-10-26 06:23:27', '2022-10-26 06:23:27'),
(80, 'http://localhost/wordpress/2022/10/26/67/', '41:fd62e4e163b150f80c469a37b716e6b1', 67, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:29:42', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 06:30:09'),
(81, 'http://localhost/wordpress/2022/10/26/68/', '41:daf4db31664effe4b76391ad78f3732e', 68, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:29:42', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 06:30:09'),
(82, 'http://localhost/wordpress/2022/10/26/69/', '41:e4d76f1b29771c44c2591691c0d043d0', 69, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:29:42', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 06:30:09'),
(83, 'http://localhost/wordpress/2022/10/26/70/', '41:a3a489c38553031d39e4f5d35e75416b', 70, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:29:42', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 06:30:09'),
(84, 'http://localhost/wordpress/2022/10/26/71/', '41:b2c31c0f54e011953c4b339c642132f6', 71, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '...', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-26 06:29:42', '2022-10-25 23:31:44', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-10-26 06:31:44', '2022-10-26 06:30:09'),
(85, 'http://localhost/wordpress/articles/', '36:4aba49680eebc6afb9fbfac1a3a3fcb0', NULL, 'post-type-archive', 'articles', NULL, NULL, '%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%', '', 'Article', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-26 06:38:21', '2022-10-25 23:38:21', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_indexable_hierarchy`
--

CREATE TABLE `wp_yoast_indexable_hierarchy` (
  `indexable_id` int(11) UNSIGNED NOT NULL,
  `ancestor_id` int(11) UNSIGNED NOT NULL,
  `depth` int(11) UNSIGNED DEFAULT NULL,
  `blog_id` bigint(20) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_yoast_indexable_hierarchy`
--

INSERT INTO `wp_yoast_indexable_hierarchy` (`indexable_id`, `ancestor_id`, `depth`, `blog_id`) VALUES
(1, 0, 0, 1),
(4, 0, 0, 1),
(5, 0, 0, 1),
(9, 0, 0, 1),
(12, 0, 0, 1),
(13, 0, 0, 1),
(14, 0, 0, 1),
(15, 0, 0, 1),
(16, 0, 0, 1),
(17, 0, 0, 1),
(23, 0, 0, 1),
(25, 0, 0, 1),
(27, 0, 0, 1),
(28, 0, 0, 1),
(29, 0, 0, 1),
(30, 0, 0, 1),
(31, 0, 0, 1),
(35, 0, 0, 1),
(36, 0, 0, 1),
(38, 0, 0, 1),
(39, 0, 0, 1),
(41, 0, 0, 1),
(42, 0, 0, 1),
(43, 0, 0, 1),
(44, 0, 0, 1),
(45, 0, 0, 1),
(49, 0, 0, 1),
(58, 49, 1, 1),
(59, 49, 1, 1),
(60, 49, 1, 1),
(64, 0, 0, 1),
(65, 0, 0, 1),
(66, 0, 0, 1),
(67, 0, 0, 1),
(68, 0, 0, 1),
(69, 0, 0, 1),
(70, 0, 0, 1),
(71, 0, 0, 1),
(72, 0, 0, 1),
(73, 0, 0, 1),
(79, 0, 0, 1),
(80, 0, 0, 1),
(81, 0, 0, 1),
(82, 0, 0, 1),
(83, 0, 0, 1),
(84, 0, 0, 1),
(85, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_migrations`
--

CREATE TABLE `wp_yoast_migrations` (
  `id` int(11) UNSIGNED NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_yoast_migrations`
--

INSERT INTO `wp_yoast_migrations` (`id`, `version`) VALUES
(1, '20171228151840'),
(2, '20171228151841'),
(3, '20190529075038'),
(4, '20191011111109'),
(5, '20200408101900'),
(6, '20200420073606'),
(7, '20200428123747'),
(8, '20200428194858'),
(9, '20200429105310'),
(10, '20200430075614'),
(11, '20200430150130'),
(12, '20200507054848'),
(13, '20200513133401'),
(14, '20200609154515'),
(15, '20200616130143'),
(16, '20200617122511'),
(17, '20200702141921'),
(18, '20200728095334'),
(19, '20201202144329'),
(20, '20201216124002'),
(21, '20201216141134'),
(22, '20210817092415'),
(23, '20211020091404');

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_primary_term`
--

CREATE TABLE `wp_yoast_primary_term` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `term_id` bigint(20) DEFAULT NULL,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `blog_id` bigint(20) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_yoast_primary_term`
--

INSERT INTO `wp_yoast_primary_term` (`id`, `post_id`, `term_id`, `taxonomy`, `created_at`, `updated_at`, `blog_id`) VALUES
(1, 22, 3, 'news-category', '2022-10-11 04:11:45', '2022-10-25 17:03:29', 1),
(2, 23, 3, 'news-category', '2022-10-11 04:12:19', '2022-10-25 17:03:29', 1),
(3, 24, 2, 'news-category', '2022-10-11 04:12:51', '2022-10-25 17:03:29', 1),
(4, 54, 6, 'genres', '2022-10-26 05:16:10', '2022-10-25 22:16:10', 1),
(5, 57, 7, 'genres', '2022-10-26 05:17:03', '2022-10-25 22:19:31', 1),
(6, 58, 6, 'genres', '2022-10-26 05:17:36', '2022-10-25 22:17:36', 1),
(7, 64, 6, 'genres', '2022-10-26 06:16:42', '2022-10-25 23:16:42', 1),
(8, 66, 9, 'genres', '2022-10-26 06:23:28', '2022-10-25 23:23:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_yoast_seo_links`
--

CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `target_post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `indexable_id` int(11) UNSIGNED DEFAULT NULL,
  `target_indexable_id` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `width` int(11) UNSIGNED DEFAULT NULL,
  `size` int(11) UNSIGNED DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_yoast_seo_links`
--

INSERT INTO `wp_yoast_seo_links` (`id`, `url`, `post_id`, `target_post_id`, `type`, `indexable_id`, `target_indexable_id`, `height`, `width`, `size`, `language`, `region`) VALUES
(1, 'http://localhost/wordpress/wp-admin/', 2, NULL, 'internal', 3, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`);

--
-- Indexes for table `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Indexes for table `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Indexes for table `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Indexes for table `wp_aiowps_debug_log`
--
ALTER TABLE `wp_aiowps_debug_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_aiowps_events`
--
ALTER TABLE `wp_aiowps_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_aiowps_failed_logins`
--
ALTER TABLE `wp_aiowps_failed_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_login_date` (`failed_login_date`),
  ADD KEY `login_attempt_ip` (`login_attempt_ip`),
  ADD KEY `failed_login_date_and_login_attempt_ip` (`failed_login_date`,`login_attempt_ip`);

--
-- Indexes for table `wp_aiowps_global_meta`
--
ALTER TABLE `wp_aiowps_global_meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `wp_aiowps_login_activity`
--
ALTER TABLE `wp_aiowps_login_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_aiowps_login_lockdown`
--
ALTER TABLE `wp_aiowps_login_lockdown`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_login_ip` (`failed_login_ip`),
  ADD KEY `is_lockout_email_sent` (`is_lockout_email_sent`),
  ADD KEY `unlock_key` (`unlock_key`);

--
-- Indexes for table `wp_aiowps_permanent_block`
--
ALTER TABLE `wp_aiowps_permanent_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocked_ip` (`blocked_ip`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_nextend2_image_storage`
--
ALTER TABLE `wp_nextend2_image_storage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Indexes for table `wp_nextend2_section_storage`
--
ALTER TABLE `wp_nextend2_section_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system` (`system`),
  ADD KEY `editable` (`editable`),
  ADD KEY `application` (`application`,`section`(50),`referencekey`(50)),
  ADD KEY `application_2` (`application`,`section`(50));

--
-- Indexes for table `wp_nextend2_smartslider3_generators`
--
ALTER TABLE `wp_nextend2_smartslider3_generators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_nextend2_smartslider3_sliders`
--
ALTER TABLE `wp_nextend2_smartslider3_sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `wp_nextend2_smartslider3_sliders_xref`
--
ALTER TABLE `wp_nextend2_smartslider3_sliders_xref`
  ADD PRIMARY KEY (`group_id`,`slider_id`),
  ADD KEY `ordering` (`ordering`);

--
-- Indexes for table `wp_nextend2_smartslider3_slides`
--
ALTER TABLE `wp_nextend2_smartslider3_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`),
  ADD KEY `publish_up` (`publish_up`),
  ADD KEY `publish_down` (`publish_down`),
  ADD KEY `generator_id` (`generator_id`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `slider` (`slider`),
  ADD KEY `thumbnail` (`thumbnail`(100));

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_rank_math_404_logs`
--
ALTER TABLE `wp_rank_math_404_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uri` (`uri`(191));

--
-- Indexes for table `wp_rank_math_internal_links`
--
ALTER TABLE `wp_rank_math_internal_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`);

--
-- Indexes for table `wp_rank_math_internal_meta`
--
ALTER TABLE `wp_rank_math_internal_meta`
  ADD PRIMARY KEY (`object_id`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_wfblockediplog`
--
ALTER TABLE `wp_wfblockediplog`
  ADD PRIMARY KEY (`IP`,`unixday`,`blockType`);

--
-- Indexes for table `wp_wfblocks7`
--
ALTER TABLE `wp_wfblocks7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `IP` (`IP`),
  ADD KEY `expiration` (`expiration`);

--
-- Indexes for table `wp_wfconfig`
--
ALTER TABLE `wp_wfconfig`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `wp_wfcrawlers`
--
ALTER TABLE `wp_wfcrawlers`
  ADD PRIMARY KEY (`IP`,`patternSig`);

--
-- Indexes for table `wp_wffilechanges`
--
ALTER TABLE `wp_wffilechanges`
  ADD PRIMARY KEY (`filenameHash`);

--
-- Indexes for table `wp_wffilemods`
--
ALTER TABLE `wp_wffilemods`
  ADD PRIMARY KEY (`filenameMD5`);

--
-- Indexes for table `wp_wfhits`
--
ALTER TABLE `wp_wfhits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`ctime`),
  ADD KEY `k2` (`IP`,`ctime`),
  ADD KEY `attackLogTime` (`attackLogTime`);

--
-- Indexes for table `wp_wfhoover`
--
ALTER TABLE `wp_wfhoover`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k2` (`hostKey`);

--
-- Indexes for table `wp_wfissues`
--
ALTER TABLE `wp_wfissues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastUpdated` (`lastUpdated`),
  ADD KEY `status` (`status`),
  ADD KEY `ignoreP` (`ignoreP`),
  ADD KEY `ignoreC` (`ignoreC`);

--
-- Indexes for table `wp_wfknownfilelist`
--
ALTER TABLE `wp_wfknownfilelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wflivetraffichuman`
--
ALTER TABLE `wp_wflivetraffichuman`
  ADD PRIMARY KEY (`IP`,`identifier`),
  ADD KEY `expiration` (`expiration`);

--
-- Indexes for table `wp_wflocs`
--
ALTER TABLE `wp_wflocs`
  ADD PRIMARY KEY (`IP`);

--
-- Indexes for table `wp_wflogins`
--
ALTER TABLE `wp_wflogins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`IP`,`fail`),
  ADD KEY `hitID` (`hitID`);

--
-- Indexes for table `wp_wfls_2fa_secrets`
--
ALTER TABLE `wp_wfls_2fa_secrets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_wfls_settings`
--
ALTER TABLE `wp_wfls_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `wp_wfnotifications`
--
ALTER TABLE `wp_wfnotifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wfpendingissues`
--
ALTER TABLE `wp_wfpendingissues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastUpdated` (`lastUpdated`),
  ADD KEY `status` (`status`),
  ADD KEY `ignoreP` (`ignoreP`),
  ADD KEY `ignoreC` (`ignoreC`);

--
-- Indexes for table `wp_wfreversecache`
--
ALTER TABLE `wp_wfreversecache`
  ADD PRIMARY KEY (`IP`);

--
-- Indexes for table `wp_wfsnipcache`
--
ALTER TABLE `wp_wfsnipcache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expiration` (`expiration`),
  ADD KEY `IP` (`IP`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wp_wfstatus`
--
ALTER TABLE `wp_wfstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`ctime`),
  ADD KEY `k2` (`type`);

--
-- Indexes for table `wp_wftrafficrates`
--
ALTER TABLE `wp_wftrafficrates`
  ADD PRIMARY KEY (`eMin`,`IP`,`hitType`);

--
-- Indexes for table `wp_yoast_indexable`
--
ALTER TABLE `wp_yoast_indexable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_type_and_sub_type` (`object_type`,`object_sub_type`),
  ADD KEY `object_id_and_type` (`object_id`,`object_type`),
  ADD KEY `permalink_hash_and_object_type` (`permalink_hash`,`object_type`),
  ADD KEY `subpages` (`post_parent`,`object_type`,`post_status`,`object_id`),
  ADD KEY `prominent_words` (`prominent_words_version`,`object_type`,`object_sub_type`,`post_status`),
  ADD KEY `published_sitemap_index` (`object_published_at`,`is_robots_noindex`,`object_type`,`object_sub_type`);

--
-- Indexes for table `wp_yoast_indexable_hierarchy`
--
ALTER TABLE `wp_yoast_indexable_hierarchy`
  ADD PRIMARY KEY (`indexable_id`,`ancestor_id`),
  ADD KEY `indexable_id` (`indexable_id`),
  ADD KEY `ancestor_id` (`ancestor_id`),
  ADD KEY `depth` (`depth`);

--
-- Indexes for table `wp_yoast_migrations`
--
ALTER TABLE `wp_yoast_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wp_yoast_migrations_version` (`version`);

--
-- Indexes for table `wp_yoast_primary_term`
--
ALTER TABLE `wp_yoast_primary_term`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_taxonomy` (`post_id`,`taxonomy`),
  ADD KEY `post_term` (`post_id`,`term_id`);

--
-- Indexes for table `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`),
  ADD KEY `indexable_link_direction` (`indexable_id`,`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_aiowps_debug_log`
--
ALTER TABLE `wp_aiowps_debug_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_aiowps_events`
--
ALTER TABLE `wp_aiowps_events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_aiowps_failed_logins`
--
ALTER TABLE `wp_aiowps_failed_logins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_aiowps_global_meta`
--
ALTER TABLE `wp_aiowps_global_meta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_aiowps_login_activity`
--
ALTER TABLE `wp_aiowps_login_activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wp_aiowps_login_lockdown`
--
ALTER TABLE `wp_aiowps_login_lockdown`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_aiowps_permanent_block`
--
ALTER TABLE `wp_aiowps_permanent_block`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_nextend2_image_storage`
--
ALTER TABLE `wp_nextend2_image_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_nextend2_section_storage`
--
ALTER TABLE `wp_nextend2_section_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;

--
-- AUTO_INCREMENT for table `wp_nextend2_smartslider3_generators`
--
ALTER TABLE `wp_nextend2_smartslider3_generators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_nextend2_smartslider3_sliders`
--
ALTER TABLE `wp_nextend2_smartslider3_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_nextend2_smartslider3_slides`
--
ALTER TABLE `wp_nextend2_smartslider3_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=815;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `wp_rank_math_404_logs`
--
ALTER TABLE `wp_rank_math_404_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_rank_math_internal_links`
--
ALTER TABLE `wp_rank_math_internal_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wp_wfblocks7`
--
ALTER TABLE `wp_wfblocks7`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfhits`
--
ALTER TABLE `wp_wfhits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfhoover`
--
ALTER TABLE `wp_wfhoover`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfissues`
--
ALTER TABLE `wp_wfissues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfknownfilelist`
--
ALTER TABLE `wp_wfknownfilelist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wflogins`
--
ALTER TABLE `wp_wflogins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfls_2fa_secrets`
--
ALTER TABLE `wp_wfls_2fa_secrets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfpendingissues`
--
ALTER TABLE `wp_wfpendingissues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfsnipcache`
--
ALTER TABLE `wp_wfsnipcache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfstatus`
--
ALTER TABLE `wp_wfstatus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wp_yoast_indexable`
--
ALTER TABLE `wp_yoast_indexable`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `wp_yoast_migrations`
--
ALTER TABLE `wp_yoast_migrations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wp_yoast_primary_term`
--
ALTER TABLE `wp_yoast_primary_term`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
