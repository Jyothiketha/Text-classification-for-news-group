-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 02, 2019 at 07:28 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `newsgroups`
--
CREATE DATABASE IF NOT EXISTS `newsgroups` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `newsgroups`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add user registration', 7, 'add_userregistration'),
(20, 'Can change user registration', 7, 'change_userregistration'),
(21, 'Can delete user registration', 7, 'delete_userregistration'),
(22, 'Can add docs', 8, 'add_docs'),
(23, 'Can change docs', 8, 'change_docs'),
(24, 'Can delete docs', 8, 'delete_docs'),
(25, 'Can add categories', 9, 'add_categories'),
(26, 'Can change categories', 9, 'change_categories'),
(27, 'Can delete categories', 9, 'delete_categories'),
(28, 'Can add categories', 10, 'add_categories'),
(29, 'Can change categories', 10, 'change_categories'),
(30, 'Can delete categories', 10, 'delete_categories'),
(31, 'Can add docs', 11, 'add_docs'),
(32, 'Can change docs', 11, 'change_docs'),
(33, 'Can delete docs', 11, 'delete_docs'),
(34, 'Can add user registration', 12, 'add_userregistration'),
(35, 'Can change user registration', 12, 'change_userregistration'),
(36, 'Can delete user registration', 12, 'delete_userregistration');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(10, 'user', 'categories'),
(11, 'user', 'docs'),
(12, 'user', 'userregistration'),
(9, 'users', 'categories'),
(8, 'users', 'docs'),
(7, 'users', 'userregistration');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-04-02 11:34:44.278320'),
(2, 'auth', '0001_initial', '2018-04-02 11:35:00.468750'),
(3, 'admin', '0001_initial', '2018-04-02 11:35:03.429687'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-04-02 11:35:03.463867'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-04-02 11:35:05.541992'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-04-02 11:35:06.605468'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-04-02 11:35:07.480468'),
(8, 'auth', '0004_alter_user_username_opts', '2018-04-02 11:35:07.537109'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-04-02 11:35:08.840820'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-04-02 11:35:08.878906'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-04-02 11:35:08.925781'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-04-02 11:35:09.753906'),
(13, 'sessions', '0001_initial', '2018-04-02 11:35:11.404296'),
(14, 'users', '0001_initial', '2018-04-02 11:35:12.417968'),
(15, 'users', '0002_docs', '2018-04-02 13:00:54.962890'),
(16, 'users', '0003_docs_cluster', '2018-04-03 04:50:33.405273'),
(17, 'users', '0004_auto_20180403_1020', '2018-04-03 04:50:33.572265'),
(18, 'users', '0005_categories', '2018-04-04 05:16:24.958984'),
(19, 'users', '0006_docs_improved_cluster', '2018-04-04 14:13:46.845703'),
(20, 'users', '0007_docs_original_cluster', '2018-04-05 05:46:37.836914'),
(21, 'users', '0008_docs_update_original_cluster', '2018-04-05 07:25:33.595703'),
(22, 'users', '0009_auto_20180419_1023', '2018-04-19 04:53:29.359375'),
(23, 'user', '0001_initial', '2019-01-29 09:09:39.519947'),
(24, 'user', '0002_auto_20190129_1132', '2019-01-29 09:09:40.331148');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('81z42tx1bpc8m8y0q86rsdw3kumxpu33', 'OGVmOGJiZmJjMzdlOWJhOGFkZTcyNDVlYWExZTEzYWZiOWI3MjFlMjp7fQ==', '2018-05-04 10:07:02.163085'),
('gmas81arbsg8mk1on7e7mh36xo4mk4rz', 'MTNkMmRkN2Q4MjllMTZjNjI1ZDA4ZWMyZWE4YjJjOTNlMTQ1NzIzYzp7InVzZXJfaWQiOjF9', '2019-02-12 09:21:20.395524'),
('olybwmllvjpkc6z0azir8hc16aejb3ud', 'OGVmOGJiZmJjMzdlOWJhOGFkZTcyNDVlYWExZTEzYWZiOWI3MjFlMjp7fQ==', '2018-05-02 05:30:04.510742'),
('plvjruwmxlpklyv0kexvuyyc3buiwr8d', 'ZmZhZjFhN2YzMDBmNzY3ODc4ZjYxZDkwMDhkYjgxNTJjOTE0MjY2Yzp7InVzZXJfaWQiOjF9', '2018-04-24 05:03:28.969726'),
('qetzl9ju9anro5lmangwhjmvtayqsgtv', 'OGVmOGJiZmJjMzdlOWJhOGFkZTcyNDVlYWExZTEzYWZiOWI3MjFlMjp7fQ==', '2018-04-19 12:11:55.444336'),
('yxyk5pd32qldzxi42snxatyl5xx4tgse', 'ZmZhZjFhN2YzMDBmNzY3ODc4ZjYxZDkwMDhkYjgxNTJjOTE0MjY2Yzp7InVzZXJfaWQiOjF9', '2018-04-25 14:28:41.646484');

-- --------------------------------------------------------

--
-- Table structure for table `users_categories`
--

CREATE TABLE IF NOT EXISTS `users_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL,
  `key_words` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_categories_user_id_b6fa0eb6_fk_users_userregistration_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `users_categories`
--

INSERT INTO `users_categories` (`id`, `category`, `key_words`, `user_id`) VALUES
(1, 'Electronics', 'diode,anode,cathode,electricity,power upply,circuit,cables,chip,chips,ram,rom,capacitor,resister,circuit,circuit board,printed circuit', 1),
(3, 'Foods', 'vegetables,fruits,rice,sambar', 1),
(4, 'Electrics', 'electronics,diode,wire', 1),
(5, 'Food', 'eat,dining,havin,breakfast,lunch,dinner', 2),
(6, 'Fashion', 'Fashion, wear,clothing, footwear, lifestyle products, accessories, makeup, hairstyle,clothing-styles', 1),
(7, 'Cooking', 'cookery,food,ingredients,electric stoves,chefs,restaurants,dish,lime juice,Vegetables, fruits, grains,sugars, proteins', 1),
(8, 'Sports', 'sport,sports,spectators,spectators,contests,champion,participation,participants', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_docs`
--

CREATE TABLE IF NOT EXISTS `users_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `document` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cluster` varchar(200) NOT NULL,
  `improved_cluster` varchar(200) NOT NULL,
  `original_cluster` varchar(200) NOT NULL,
  `update_original_cluster` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_docs_user_id_92d7e67e_fk_users_userregistration_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=203 ;

--
-- Dumping data for table `users_docs`
--

INSERT INTO `users_docs` (`id`, `title`, `document`, `user_id`, `cluster`, `improved_cluster`, `original_cluster`, `update_original_cluster`) VALUES
(2, 'Capacitor', 'doc/sampl.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(3, 'diode', 'doc/sampl1.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(4, 'cathode', 'doc/sampl2.txt', 1, 'Electronics', 'Electronics', 'Books', 'Electronics'),
(5, 'series of pages', 'doc/bok.txt', 1, 'Fashion', 'Foods', 'Foods', 'Foods'),
(6, 'food for humans', 'doc/cok.txt', 1, 'Cooking', 'Foods', 'Foods', 'Foods'),
(7, 'healthy com', 'doc/health.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Foods'),
(8, 'spirit of the game', 'doc/sports.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(9, 'legend arrived', 'doc/sports1.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(10, 'roger is human??', 'doc/sports2.txt', 1, 'Books', 'Electronics', 'Books', 'Books'),
(11, 'tennis the dream for lot', 'doc/sports2.txt', 1, 'Fashion', 'Electronics', 'Fashion', 'Fashion'),
(12, 'cricketers', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Fashion'),
(13, 'read the habbit', 'doc/edu.txt', 1, 'Cooking', 'Electronics', 'Cooking', 'Fashion'),
(14, 'man in learn', 'doc/edu1.txt', 1, 'Cooking', 'Electronics', 'Cooking', 'Cooking'),
(15, 'brand new clothes', 'doc/fashion.txt', 1, 'Healthcare', 'Electronics', 'Healthcare', 'Healthcare'),
(16, 'stylish man', 'doc/fashion1.txt', 1, 'Sports', 'Healthcare', 'Sports', 'Sports'),
(17, 'icon of ornaments', 'doc/fashion2.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(18, 'my guide', 'doc/fashion1.txt', 1, 'Education', 'Electronics', 'Education', 'Education'),
(19, 'vogue the first choice', 'doc/fashion.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(20, 'home made', 'doc/cok.txt', 1, 'Sports', 'Electronics', 'Sports', 'Sports'),
(21, 'health tips', 'doc/health.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(22, 'avoid wastage', 'doc/cok.txt', 1, 'Books', 'Electronics', 'Electronics', 'Electronics'),
(23, 'save stomach', 'doc/health2.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(24, 'cook your way', 'doc/cok.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(25, 'prevention is better', 'doc/health.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(26, 'anode', 'doc/sampl.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(27, 'mobiles and models', 'doc/sampl.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(28, 'evloution of laptops', 'doc/sampl1.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(29, 'series of pages', 'doc/bok.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(30, 'food for humans', 'doc/cok.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(31, 'healthy com', 'doc/health.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(32, 'spirit of the game', 'doc/sports.txt', 1, 'Fashion', 'Sports', 'Fashion', 'Fashion'),
(33, 'legend arrived', 'doc/sports.txt', 1, 'Cooking', 'Electronics', 'Cooking', 'Cooking'),
(34, 'roger is human??', 'doc/sports.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(35, 'tennis the dream for lot', 'doc/sports.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(36, 'cricketers', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(37, 'read the habbit', 'doc/edu.txt', 1, 'Education', 'Electronics', 'Fashion', 'Education'),
(38, 'man in learn', 'doc/edu.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(39, 'brand new clothes', 'doc/fashion.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(40, 'stylish man', 'doc/fashion.txt', 1, 'Education', 'Fashion', 'Sports', 'Education'),
(41, 'icon of ornaments', 'doc/fashion.txt', 1, 'Healthcare', 'Healthcare', 'Sports', 'Healthcare'),
(42, 'my guide', 'doc/fashion.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(43, 'vogue the first choice', 'doc/fashion.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(44, 'home made', 'doc/cok.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(45, 'health tips', 'doc/health.txt', 1, 'Foods', 'Sports', 'Sports', 'Foods'),
(46, 'avoid wastage', 'doc/cok.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(47, 'save stomach', 'doc/health.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(48, 'cook your way', 'doc/cok.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(49, 'prevention is better', 'doc/health.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(50, 'Capacitor', 'doc/sampl.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(51, 'diode', 'doc/sampl.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(52, 'cathode', 'doc/sampl.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(53, 'series of pages', 'doc/bok.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(54, 'food for humans', 'doc/cok.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(55, 'healthy com', 'doc/health.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(56, 'spirit of the game', 'doc/sports.txt', 1, 'Foods', 'Sports', 'Sports', 'Sports'),
(57, 'legend arrived', 'doc/sports.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(58, 'roger is human??', 'doc/sports.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(59, 'tennis the dream for lot', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(60, 'cricketers', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(61, 'read the habbit', 'doc/edu.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(62, 'man in learn', 'doc/edu.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(63, 'brand new clothes', 'doc/fashion.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(64, 'stylish man', 'doc/fashion.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(65, 'icon of ornaments', 'doc/fashion.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(66, 'my guide', 'doc/fashion.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(67, 'vogue the first choice', 'doc/fashion.txt', 1, 'Foods', 'Electronics', 'Foods', 'Foods'),
(68, 'home made', 'doc/cok.txt', 1, 'Fashion', 'Foods', 'Books', 'Books'),
(69, 'health tips', 'doc/health.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(70, 'avoid wastage', 'doc/cok.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(71, 'save stomach', 'doc/health.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(72, 'cook your way', 'doc/cok.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(73, 'prevention is better', 'doc/health.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(74, 'Capacitor', 'doc/sampl.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(75, 'diode', 'doc/sampl.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(76, 'cathode', 'doc/sampl.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(77, 'series of pages', 'doc/bok.txt', 1, 'Healthcare', 'Education', 'Education', 'Education'),
(78, 'food for humans', 'doc/cok.txt', 1, 'Healthcare', 'Education', 'Education', 'Education'),
(79, 'healthy com', 'doc/health.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(80, 'spirit of the game', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(81, 'legend arrived', 'doc/sports.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(82, 'roger is human??', 'doc/sports.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(83, 'tennis the dream for lot', 'doc/sports.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(84, 'cricketers', 'doc/sports.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(85, 'read the habbit', 'doc/edu.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(86, 'man in learn', 'doc/edu.txt', 1, 'Books', 'Foods', 'Foods', 'Foods'),
(87, 'brand new clothes', 'doc/fashion.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(88, 'stylish man', 'doc/fashion.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(89, 'icon of ornaments', 'doc/fashion.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(90, 'my guide', 'doc/fashion.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(91, 'vogue the first choice', 'doc/fashion.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(92, 'home made', 'doc/cok.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(93, 'health tips', 'doc/health.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(94, 'avoid wastage', 'doc/cok.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(95, 'save stomach', 'doc/health.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(96, 'cook your way', 'doc/cok.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(97, 'prevention is better', 'doc/health.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(98, 'Capacitor', 'doc/sampl.txt', 1, 'Foods', 'Education', 'Education', 'Education'),
(99, 'diode', 'doc/sampl.txt', 1, 'Foods', 'Sports', 'Sports', 'Sports'),
(100, 'cathode', 'doc/sampl.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(101, 'series of pages', 'doc/bok.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(102, 'food for humans', 'doc/cok.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(103, 'healthy com', 'doc/health.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(104, 'spirit of the game', 'doc/sports.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(105, 'legend arrived', 'doc/sports.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(106, 'roger is human??', 'doc/sports.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(107, 'tennis the dream for lot', 'doc/sports.txt', 1, 'Fashion', 'Foods', 'Foods', 'Foods'),
(108, 'cricketers', 'doc/sports.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(109, 'read the habbit', 'doc/edu.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(110, 'man in learn', 'doc/edu.txt', 1, 'Foods', 'Books', 'Books', 'Books'),
(111, 'brand new clothes', 'doc/fashion.txt', 1, 'Foods', 'Fashion', 'Fashion', 'Fashion'),
(112, 'stylish man', 'doc/fashion.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(113, 'icon of ornaments', 'doc/fashion.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(114, 'my guide', 'doc/fashion.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(115, 'vogue the first choice', 'doc/fashion.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(116, 'home made', 'doc/cok.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(117, 'health tips', 'doc/health.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(118, 'avoid wastage', 'doc/cok.txt', 1, 'Foods', 'Education', 'Education', 'Education'),
(119, 'save stomach', 'doc/health.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(120, 'cook your way', 'doc/cok.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(121, 'prevention is better', 'doc/health.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(122, 'Capacitor', 'doc/sampl.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(123, 'diode', 'doc/sampl.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(124, 'cathode', 'doc/sampl.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(125, 'series of pages', 'doc/bok.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(126, 'food for humans', 'doc/cok.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(127, 'healthy com', 'doc/health.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(128, 'spirit of the game', 'doc/sports.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(129, 'legend arrived', 'doc/sports.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(130, 'roger is human??', 'doc/sports.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(131, 'tennis the dream for lot', 'doc/sports.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(132, 'cricketers', 'doc/sports.txt', 1, 'Sports', 'Fashion', 'Fashion', 'Fashion'),
(133, 'read the habbit', 'doc/edu.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(134, 'man in learn', 'doc/edu.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(135, 'brand new clothes', 'doc/fashion.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(136, 'stylish man', 'doc/fashion.txt', 1, 'Cooking', 'Sports', 'Sports', 'Sports'),
(137, 'icon of ornaments', 'doc/fashion.txt', 1, 'Education', 'Fashion', 'Education', 'Education'),
(138, 'my guide', 'doc/fashion.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(139, 'vogue the first choice', 'doc/fashion.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(140, 'home made', 'doc/cok.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(141, 'health tips', 'doc/health.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(142, 'avoid wastage', 'doc/cok.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(143, 'save stomach', 'doc/health.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(144, 'cook your way', 'doc/cok.txt', 1, 'Foods', 'Electronics', 'Electronics', 'Electronics'),
(145, 'prevention is better', 'doc/health.txt', 1, 'Healthcare', 'Foods', 'Foods', 'Foods'),
(146, 'Capacitor', 'doc/sampl.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(147, 'diode', 'doc/sampl.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(148, 'cathode', 'doc/sampl.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(149, 'series of pages', 'doc/bok.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(150, 'food for humans', 'doc/cok.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(151, 'healthy com', 'doc/health.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(152, 'spirit of the game', 'doc/sports.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(153, 'legend arrived', 'doc/sports.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(154, 'roger is human??', 'doc/sports.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(155, 'tennis the dream for lot', 'doc/sports.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(156, 'cricketers', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(157, 'read the habbit', 'doc/edu.txt', 1, 'Healthcare', 'Education', 'Education', 'Education'),
(158, 'man in learn', 'doc/edu.txt', 1, 'Sports', 'Education', 'Education', 'Education'),
(159, 'brand new clothes', 'doc/fashion.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(160, 'stylish man', 'doc/fashion.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(161, 'icon of ornaments', 'doc/fashion.txt', 1, 'Electronics', 'Healthcare', 'Healthcare', 'Healthcare'),
(162, 'my guide', 'doc/fashion.txt', 1, 'Healthcare', 'Electronics', 'Electronics', 'Electronics'),
(163, 'vogue the first choice', 'doc/fashion.txt', 1, 'Foods', 'Electronics', 'Electronics', 'Electronics'),
(164, 'home made', 'doc/cok.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(165, 'health tips', 'doc/health.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(166, 'avoid wastage', 'doc/cok.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(167, 'save stomach', 'doc/health.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(168, 'cook your way', 'doc/cok.txt', 1, 'Foods', 'Fashion', 'Books', 'Books'),
(169, 'prevention is better', 'doc/health.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(170, 'Capacitor', 'doc/sampl.txt', 1, 'Foods', 'Fashion', 'Books', 'Books'),
(171, 'diode', 'doc/sampl.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(172, 'cathode', 'doc/sampl.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(173, 'series of pages', 'doc/bok.txt', 1, 'Education', 'Education', 'Cooking', 'Cooking'),
(174, 'food for humans', 'doc/cok.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(175, 'healthy com', 'doc/health.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(176, 'spirit of the game', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(177, 'legend arrived', 'doc/sports.txt', 1, 'Education', 'Sports', 'Education', 'Education'),
(178, 'roger is human??', 'doc/sports.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(179, 'tennis the dream for lot', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(180, 'cricketers', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(181, 'read the habbit', 'doc/edu.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(182, 'man in learn', 'doc/edu.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(183, 'brand new clothes', 'doc/fashion.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(184, 'stylish man', 'doc/fashion.txt', 1, 'Electronics', 'Electronics', 'Electronics', 'Electronics'),
(185, 'icon of ornaments', 'doc/fashion.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(186, 'my guide', 'doc/fashion.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(187, 'vogue the first choice', 'doc/fashion.txt', 1, 'Foods', 'Foods', 'Foods', 'Foods'),
(188, 'home made', 'doc/cok.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(189, 'health tips', 'doc/health.txt', 1, 'Books', 'Books', 'Books', 'Books'),
(190, 'avoid wastage', 'doc/cok.txt', 1, 'Fashion', 'Fashion', 'Books', 'Books'),
(191, 'save stomach', 'doc/health.txt', 1, 'Cooking', 'Cooking', 'Fashion', 'Fashion'),
(192, 'cook your way', 'doc/cok.txt', 1, 'Fashion', 'Fashion', 'Fashion', 'Fashion'),
(193, 'prevention is better', 'doc/health.txt', 1, 'Cooking', 'Cooking', 'Cooking', 'Cooking'),
(194, 'Capacitor', 'doc/sampl.txt', 1, 'Cooking', 'Healthcare', 'Cooking', 'Cooking'),
(195, 'diode', 'doc/sampl.txt', 1, 'Healthcare', 'Cooking', 'Healthcare', 'Healthcare'),
(196, 'cathode', 'doc/sampl.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(197, 'series of pages', 'doc/bok.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(198, 'food for humans', 'doc/cok.txt', 1, 'Education', 'Education', 'Education', 'Education'),
(199, 'healthy com', 'doc/health.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(200, 'spirit of the game', 'doc/sports.txt', 1, 'Sports', 'Sports', 'Sports', 'Sports'),
(201, 'legend arrived', 'doc/sports.txt', 1, 'Healthcare', 'Healthcare', 'Healthcare', 'Healthcare'),
(202, 'food', 'doc/sampl_itpg6DM.txt', 2, 'Electronics', 'Food', 'Foods', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_userregistration`
--

CREATE TABLE IF NOT EXISTS `users_userregistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobilenum` int(11) NOT NULL,
  `emailId` varchar(254) NOT NULL,
  `location` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users_userregistration`
--

INSERT INTO `users_userregistration` (`id`, `firstName`, `lastName`, `userName`, `password`, `mobilenum`, `emailId`, `location`, `dob`) VALUES
(1, 'gokul', 'krishnan', 'admin', 'admin', 2147483647, 'chennaisunday.cs0207@gmail.com', 'chennai', '1994-12-12'),
(2, 'ram', 'kumar', 'ram', 'chennai123', 2147483647, 'chennaisunday.cs0207@gmail.com', 'chennai', '1994-12-12'),
(3, 'dev', 'raj', 'dev', 'chennai123', 2147483647, 'chennaisunday.cs0207@gmail.com', 'chennai', '1994-12-12'),
(4, 'a', 'a', 'a', 'a', 2147483647, 'W@s.x', 'a', '1994-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `user_categories`
--

CREATE TABLE IF NOT EXISTS `user_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL,
  `key_words` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_categories_user_id_7175a3ba_fk_user_userregistration_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_docs`
--

CREATE TABLE IF NOT EXISTS `user_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `original_cluster` varchar(200) NOT NULL,
  `update_original_cluster` varchar(200) NOT NULL,
  `cluster` varchar(200) NOT NULL,
  `improved_cluster` varchar(200) NOT NULL,
  `document` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_docs_user_id_8e2d9f0a_fk_user_userregistration_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_docs`
--

INSERT INTO `user_docs` (`id`, `title`, `original_cluster`, `update_original_cluster`, `cluster`, `improved_cluster`, `document`, `user_id`) VALUES
(1, 'erd', 'gyuj', '', 'pending', 'pending', 'doc/newsgroups.sql', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_userregistration`
--

CREATE TABLE IF NOT EXISTS `user_userregistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobilenum` bigint(20) NOT NULL,
  `emailId` varchar(254) NOT NULL,
  `location` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_userregistration`
--

INSERT INTO `user_userregistration` (`id`, `firstName`, `lastName`, `userName`, `password`, `mobilenum`, `emailId`, `location`, `dob`) VALUES
(1, 'santhosh', 'kumar', 'santhosh', '1998', 9789672189, 'aa@aa.aa', 'chennai', '1994-12-12');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_categories`
--
ALTER TABLE `users_categories`
  ADD CONSTRAINT `users_categories_user_id_b6fa0eb6_fk_users_userregistration_id` FOREIGN KEY (`user_id`) REFERENCES `users_userregistration` (`id`);

--
-- Constraints for table `users_docs`
--
ALTER TABLE `users_docs`
  ADD CONSTRAINT `users_docs_user_id_92d7e67e_fk_users_userregistration_id` FOREIGN KEY (`user_id`) REFERENCES `users_userregistration` (`id`);

--
-- Constraints for table `user_categories`
--
ALTER TABLE `user_categories`
  ADD CONSTRAINT `user_categories_user_id_7175a3ba_fk_user_userregistration_id` FOREIGN KEY (`user_id`) REFERENCES `user_userregistration` (`id`);

--
-- Constraints for table `user_docs`
--
ALTER TABLE `user_docs`
  ADD CONSTRAINT `user_docs_user_id_8e2d9f0a_fk_user_userregistration_id` FOREIGN KEY (`user_id`) REFERENCES `user_userregistration` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
