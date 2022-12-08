-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2019 at 11:52 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `samaj`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_activity_log`
--

CREATE TABLE `tbl_activity_log` (
  `activity_log_id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `user_browser` varchar(255) NOT NULL,
  `user_platform` varchar(255) NOT NULL,
  `user_ip` varchar(255) NOT NULL,
  `samaj_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `banner_id` int(11) NOT NULL,
  `samaj_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_banner`
--

INSERT INTO `tbl_banner` (`banner_id`, `samaj_id`, `is_active`, `created_at`, `start_date`, `end_date`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, '2019-04-19 11:29:04', '2019-04-19', '2019-04-22', 1, '2019-04-19 11:29:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner_description`
--

CREATE TABLE `tbl_banner_description` (
  `banner_description_id` int(11) NOT NULL,
  `banner_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `banner_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `short_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `long_description` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_banner_description`
--

INSERT INTO `tbl_banner_description` (`banner_description_id`, `banner_id`, `language_id`, `banner_name`, `short_description`, `long_description`) VALUES
(1, 1, 1, 'Banner Data', ' Banner Data', '<p>Banner Data</p>\n'),
(2, 1, 3, 'Banner Data', ' Banner Data', '<p>Banner Data</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner_file`
--

CREATE TABLE `tbl_banner_file` (
  `banner_file_id` int(11) NOT NULL,
  `banner_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_banner_file`
--

INSERT INTO `tbl_banner_file` (`banner_file_id`, `banner_id`, `language_id`, `filename`) VALUES
(1, 1, 1, '8e2f33822e6376a4820072b8f9d1c401.docx'),
(2, 1, 1, '3156294478c6d739bf67e8e945f3d225.pdf'),
(3, 1, 3, 'a4c553106f1341f8545e9de95bed2953.pdf'),
(4, 1, 3, 'faa5a8acfc5c7e6853f0db34838caea2.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blood_groups`
--

CREATE TABLE `tbl_blood_groups` (
  `blood_group_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `blood_group` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_blood_groups`
--

INSERT INTO `tbl_blood_groups` (`blood_group_id`, `member_id`, `blood_group`) VALUES
(1, 1, 'A+'),
(2, 0, 'O+'),
(3, 0, 'B+'),
(4, 0, 'AB+'),
(5, 0, 'A+'),
(6, 0, 'O-'),
(7, 0, 'B-'),
(8, 0, 'AB-');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_branch`
--

CREATE TABLE `tbl_branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_branch`
--

INSERT INTO `tbl_branch` (`branch_id`, `branch_name`, `branch_code`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(5, 'Mumbai', 'MUMBAI001', 1, '2018-06-08 19:14:29', 1, '2018-08-01 17:25:28', 1),
(7, 'Dubai', 'DUBAI001', 1, '2018-06-25 16:21:40', 1, '2018-08-01 17:25:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business`
--

CREATE TABLE `tbl_business` (
  `business_id` int(11) NOT NULL,
  `business_type_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `business_pincode` varchar(10) NOT NULL,
  `address_geo` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_business`
--

INSERT INTO `tbl_business` (`business_id`, `business_type_id`, `member_id`, `samaj_id`, `state_id`, `city_id`, `business_pincode`, `address_geo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `lat`, `lng`) VALUES
(1, 3, 1, 1, 738, 3399, '395006', 'Adajan, Surat, Gujarat, India', '2019-04-09 12:09:20', 1, '2019-04-09 12:09:20', 1, '21.1925707', '72.79973559999996'),
(2, 2, 4, 1, 738, 3399, '394210', 'Shop No. 23,First floor,Karuna sager society ,Aai Mata to moel town circles road, Parvat Patiya, Surat, Gujarat 394210, India', '2019-04-09 12:13:46', 1, '2019-04-09 12:13:46', 1, '21.190085', '72.8607816'),
(3, 4, 2, 1, 738, 6179, '394601', 'Baben, Bardoli, Gujarat 394601, India', '2019-04-09 12:21:09', 1, '2019-04-09 12:21:09', 1, '21.1378786', '73.0966019'),
(4, 4, 6, 0, 745, 3486, '009966', 'Andheri west', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(5, 1, 5, 1, 738, 3399, '395007', 'Inside Golden Square Dumas Rd, Meghdoot Society, Athwa, Surat, Gujarat 395007, India', '2019-04-09 12:57:44', 1, '2019-04-09 12:57:44', 1, '21.1712762', '72.78931620000003'),
(6, 1, 6, 0, 738, 3398, '123456', 'Sector 10 ', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(8, 5, 1, 1, 738, 3399, '395009', 'FP29, Dumas Rd, Magdalla, Gujarat 395007, India', '2019-04-09 16:12:37', 1, '2019-04-09 16:18:35', 1, '21.1446688', '72.75755980000008'),
(9, 5, 6, 0, 745, 3491, '123454', 'A-1701-1702, Lotus Corporate Park, Off Western Highway, 400 063, State, India, Shri Ram Mandir Rd, Goregaon East, Mumbai, Maharashtra 400063', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(11, 3, 6, 0, 738, 3399, '123456', 'નોક્સ ચેમ્બર નનપુરા', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(14, 2, 6, 0, 745, 3486, '336699', 'નવી મુંબઈ', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(15, 5, 1, 0, 414, 2287, '359801', 'We\n', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(16, 3, 7, 1, 738, 3399, '395006', 'Railway Station Area, Varachha, Surat, Gujarat, India', '2019-04-15 12:21:11', 1, '2019-04-15 12:21:11', 1, '21.2033749', '72.840101'),
(17, 2, 8, 0, 738, 3399, '345603', 'Swagat Complex,Kadodara,Surat', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(18, 1, 8, 0, 738, 3399, '395006', 'Adajan,Surat', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '21.19606228794206', '72.79875081058958'),
(19, 4, 8, 0, 738, 3399, '937846', 'Station Road, Bardoli', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '19.15810610570554', '72.8517093333739'),
(20, 4, 23, 0, 738, 3399, '395001', 'Siddha sila', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '00.00000000000000', '00.00000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_description`
--

CREATE TABLE `tbl_business_description` (
  `business_description_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_business_description`
--

INSERT INTO `tbl_business_description` (`business_description_id`, `business_id`, `language_id`, `business_name`, `owner_name`, `address`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Delicious Passra Hub', 'Akki detroja', 'Adajan,Surat', '<p>Owners will have noticed that, if you provide them with food and water and shelter and affection, they will think you are god. Whereas owners of cats are compelled to realize that, if you provide them with food and water and shelter and affection, they draw the conclusion that <i>they</i> are gods.</p>\n', '2019-04-09 12:09:20', 1, '2019-04-09 12:09:20', 1),
(2, 1, 3, 'સ્વાદિષ્ટ પાસરા હબ', 'અક્કી ડેટ્રોજા', 'આદજન, સુરત, ગુજરાત, ભારત', '<p>માલિકોએ જોયું હશે કે, જો તમે તેઓને ખોરાક, પાણી અને આશ્રય અને સ્નેહ આપો છો, તો તેઓ વિચારે છે કે તમે ભગવાન છો. જ્યારે બિલાડીઓના માલિકોને એ સમજવા માટે ફરજ પાડવામાં આવે છે કે, જો તમે તેઓને ખોરાક, પાણી અને આશ્રય અને સ્નેહ આપો છો, તો તેઓ નિષ્કર્ષ દોરે છે કે તેઓ દેવતાઓ છે.</p>\n', '2019-04-09 12:09:20', 1, '2019-04-09 12:09:20', 1),
(3, 2, 1, 'Cricles Studio', 'Parth Kumar Detroja', 'First floor,Karuna sager society ,Aai Mata to moel town circles road, Parvat Patiya, Surat, Gujarat 394210', 'Most things in life are moments of pleasure and a lifetime of embarrassment; photography is a moment of embarrassment and a lifetime of pleasure.” “It is more important to click with people than to click the shutter.”', '2019-04-09 12:13:46', 1, '2019-04-09 12:13:46', 1),
(4, 2, 3, 'ક્રિક્સ સ્ટુડિયો', 'પાર્થ કુમાર ડેટ્રોજા', 'ફર્સ્ટ ફ્લોર, કરુણા સેર સોસાયટી, એ માતા, ટાઉન સર્કલ્સ રોડને મૌલ કરવી, પાર્વત પાટિયા, સુરત, ગુજરાત 394210\nસફળતા', '<p>જીવનમાં મોટાભાગની વસ્તુઓ આનંદની ક્ષણો અને જીવનભર શરમજનક ક્ષણો છે; ફોટોગ્રાફી એ શરમજનક ક્ષણ અને જીવનભર આનંદનો એક ક્ષણ છે. \"શટર પર ક્લિક કરતાં લોકો સાથે ક્લિક કરવું વધુ મહત્વપૂર્ણ છે.\" \"હું જાણું છું તે પહેલાં તેઓ કોઈને પણ ફોટોગ્રાફ કરવા માંગે છે કે તેઓ શ્રેષ્ઠ કોણ છે.</p>\n', '2019-04-09 12:13:46', 1, '2019-04-09 12:13:46', 1),
(5, 3, 1, 'Zemon Juice Center', 'Rutuj Bhai Tailor', 'Baben, Bardoli, Gujarat 394601\n', '<p>I normally don&#39;t love green juices, but Body & Eden makes theirs tasty by blending ingredients like avocado and banana with the usual suspects like kale and spinach. Delicious as they are, they&#39;re low calorie, and the drink names are catchy: I Have Balance, I Have Energy, and my favorite, I Have Calm.</p>\n', '2019-04-09 12:21:09', 1, '2019-04-09 12:21:09', 1),
(6, 3, 3, 'ઝેમોન જ્યુસ સેન્ટર', 'રૂટુજ ભાઈ ટેઇલર', 'બાબેન, બારડોલી, ગુજરાત 394601', '<p>હું સામાન્ય રીતે લીલા રસને પસંદ કરતો નથી, પરંતુ બોડી એન્ડ એડન એવૉકાડો અને બનાના જેવા ઘટકોને કાલે અને સ્પિનચ જેવા સામાન્ય સંવેદના સાથે મિશ્રણ કરીને સ્વાદિષ્ટ બનાવે છે. તેઓ જેટલા સ્વાદિષ્ટ હોય છે, તેઓ ઓછી કેલરી હોય છે, અને પીણાના નામ આકર્ષક હોય છે: મારી પાસે બેલેન્સ છે, મારી પાસે ઊર્જા છે, અને મારા પ્રિય, હું શાંત છું.</p>\n', '2019-04-09 12:21:09', 1, '2019-04-09 12:21:09', 1),
(7, 4, 1, 'Fresh Juices', 'Dinesh bhai ', 'Andheri west', 'It\'s all about fresh juice and visit it .... ', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(8, 5, 1, 'Delicious Cafe Coffee', 'Naitik Shah', 'Inside Golden Square Dumas Rd, Meghdoot Society, Athwa, Surat, Gujarat 395007', '<p>Coffee is a way of stealing time which should by rights belong to your older self.No one can understand the truth until he drinks of coffee’s frothy goodness.To an old man a cup of coffee is like the door post of an old house — it sustains and strengthens him</p>\n', '2019-04-09 12:57:44', 1, '2019-04-09 12:57:44', 1),
(9, 5, 3, 'સ્વાદિષ્ટ કાફે કોફી', 'નૈતિક શાહ', 'ગોલ્ડન સ્ક્વેર ડુમાસ આરડી, મેઘદૂટ સોસાયટી, અથવા, સુરત, ગુજરાત 395007 ની અંદર', '<p>કોફી એ સમયને ચોરી કરવાનો એક રસ્તો છે જે અધિકારો દ્વારા તમારા જૂના સ્વયંની હોવી જોઈએ. કોઈ પણ વ્યક્તિ સત્યની સમજી શકશે નહીં ત્યાં સુધી તે કૉફીની ભીષણતાને પીતા નહી. વૃદ્ધ વ્યક્તિ માટે એક કપ કોફી જૂના ઘરના બારણાની જગ્યા જેવી છે - તે તેને ટકાવી રાખે છે અને મજબૂત બનાવે છે</p>\n', '2019-04-09 12:57:44', 1, '2019-04-09 12:57:44', 1),
(10, 6, 1, 'Cake shop 12', 'Dinesh limbani', '402, Knox Chambers, Opp Rishikesh Triveni Apt, Timaliawad, Nanpura, Surat, Gujarat', 'New cake shop get awesome cake and get discount ', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(12, 8, 1, 'Cookie Business', 'Akki Rasik Bhai', 'FP29, Dumas Rd, Magdalla, Gujarat 395007, India', '<p>I met Wally Amos who made a blockbuster success out of famous Amos cookies, which he launched after a career as a Hollywood talent agent. Wally eventually lost control of his company to outside investors. However, he came back again with still another cookie line. Everyone loves a fancy cookie and it’s an easy food to both differentiate and to charge a premium for.</p>\n', '2019-04-09 04:18:35', 1, '2019-04-09 04:18:35', 1),
(13, 8, 3, 'કૂકી વ્યવસાય', 'અકી રસીક ભાઈ', 'ગ્રાઉન્ડ ફ્લોર, વી.આર. મોલ, ડુમાસ, સુરત', '<p>મેં વોલી એમોસને મળ્યા, જેમણે હોલીવૂડ પ્રતિભા એજન્ટ તરીકે કારકિર્દી પછી લોન્ચ કરેલી પ્રસિદ્ધ એમોસ કૂકીઝમાંથી બ્લોકબસ્ટર સફળતા મળી. વોલીએ આખરે તેની કંપનીના બહારના રોકાણકારોને નિયંત્રણ ગુમાવ્યું. જો કે, તે ફરીથી બીજી કૂકી લાઇન સાથે ફરી પાછો આવ્યો. દરેક વ્યક્તિને ફેન્સી કૂકી પસંદ છે અને તે બંને માટે ભિન્ન અને પ્રીમિયમ ચાર્જ કરવા માટેનો એક સરળ ખોરાક છે.</p>\n', '2019-04-09 04:18:35', 1, '2019-04-09 04:18:35', 1),
(14, 9, 1, 'Tea stoll ;)', 'Harish bhai ', 'A-1701-1702, Lotus Corporate Park, Off Western Highway, 400 063, State, India, Shri Ram Mandir Rd, Goregaon East, Mumbai, Maharashtra\n', 'New tea stoll', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(16, 11, 3, 'ખાદ્યપદાર્થો હબ', 'જિજ્ઞેશ ભાઇ', 'નોક્સ ચેમ્બર નનપુરા ', 'સ્વાદિષ્ટ ખોરાક મેળવો', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(19, 14, 3, 'ફોટોગ્રાફી', 'ડિશંક ભાઈ', 'નવી મુંબઈ', 'અમને ખૂબ પ્રશિક્ષિત ફોટોગ્રાફરોની જરૂર છે', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(20, 15, 1, 'We', 'We', 'We\n', 'We\n', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(21, 16, 1, 'Khush restaurant', 'Akki Detroja', 'Surat, Railway Station Area, Varachha, Surat, Gujarat, India', '<h1>KHUSH The Restaurant in Varachha , Surat</h1>\n\n<p><strong>KHUSH </strong>The Restaurant in Surat. North Indian Restaurants with Address, Contact Number, Photos, Maps. View <strong>KHUSH </strong>The Restaurant, Surat on Justdial.</p>\n\n<p>Making way for a hearty meal is <strong>KHUSH </strong>The Restaurant in Surat. Established in the year 2004, this place is synonymous with delicious food that can satiate all food cravings. It is home to some of the most appreciated cuisines which include North Indian,South Indian. So as to be able to cater to a large number of diners, it occupies a favourable location at Udhna. Near South Zone Office,1st Floor, Tulsi Plaza Complex,Udhana Navsari Main Road,Udhna-394210 is where one can visit the venue. Courtesy to this strategic location, foodies in and around the neighborhood can walk in to this eating house conveniently without facing any hassles related to commuting to this part of the city. It is one of the most sought after Restaurants in Udhna. This is a one of the renowned Restaurants in Surat.\n', '2019-04-15 12:21:11', 1, '2019-04-15 12:21:11', 1),
(22, 16, 3, 'ખુશ રેસ્ટોરાં', 'અક્કી ડેટ્રોજા', 'સુરત, રેલવે સ્ટેશન વિસ્તાર, વરછ, સુરત, ગુજરાત, ભારત', '<p><strong>ખુશ, વરછહા, સુરતનો રેસ્ટોરન્ટ</strong><br>\nસુરતમાં <strong>ખુશ </strong>રેસ્ટોરેન્ટ. સરનામાં, સંપર્ક નંબર, ફોટા, નકશાવાળા ઉત્તર ભારતીય રેસ્ટોરાં. જસ્ટિસિયલ પર <strong>ખુશ </strong>રેસ્ટોરન્ટ, સુરત જુઓ.</p>\n\n<p>હ્રદય ભોજન માટે માર્ગ બનાવવો એ સુરતનો રેસ્ટોરન્ટ છે. વર્ષ 2004 માં સ્થપાયેલી, આ સ્થળ સ્વાદિષ્ટ ભોજનનો પર્યાય છે જે બધી જ ખોરાકની ઉપાસનાને સંતોષી શકે છે. તે સૌથી વધુ પ્રશંસા કરાયેલ વાનગીઓમાંનું ઘર છે જેમાં ઉત્તર ભારતીય, દક્ષિણ ભારતીયનો સમાવેશ થાય છે. તેથી મોટી સંખ્યામાં ડાઇનર્સને પૂરા પાડવા માટે, તે ઉધનામાં અનુકૂળ સ્થાન ધરાવે છે. દક્ષિણ ઝોન ઑફિસની નજીક, ફર્સ્ટ ફ્લોર, તુલસી પ્લાઝા કૉમ્પ્લેક્સ, ઉધના નવસારી મેઇન રોડ, ઉધાના -394210 એ કોઈ સ્થળે જઈ શકે છે. આ વ્યૂહાત્મક સ્થાનની સૌજન્ય, પડોશમાં અને તેની આસપાસના ખાદ્યપદાર્થો આ ખાવાના મકાનમાં સરળતાથી શહેરના આ ભાગમાં જવા માટે સંબંધિત કોઈપણ મુશ્કેલીઓનો સામનો કર્યા વગર ચાલે છે. ઉધાના રેસ્ટોરન્ટ્સ પછી તે સૌથી વધુ ઇચ્છિત છે. સુરતમાં પ્રખ્યાત રેસ્ટોરન્ટ્સમાંની એક આ છે.</p>\n', '2019-04-15 12:21:11', 1, '2019-04-15 12:21:11', 1),
(23, 17, 1, '29 Tattoos', 'Harsh Bhai', 'Swagat Complex,Kadodara,Surat', 'Draw each and every types of tattoos.', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(24, 18, 1, 'De Villa Pizza and Passta', 'Harsh Bhai', 'Adajan,Surat', 'Made a diffrent type of Pizza', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(25, 18, 3, 'De Villa Pizza and Passta', 'Harsh Bhai', 'Adajan,Surat', 'Made a diffrent type of Pizza', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(26, 19, 1, 'Zemon Juice', 'Harsh', 'Station Road, Bardoli', 'Juice center ', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(27, 20, 1, 'Digitattva technolabs', 'Naitik shah', 'Siddha sila', 'Ok', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(28, 20, 3, 'We ok', 'Naitik shah', 'Siddha sila', 'Ok test Gujarat', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_email`
--

CREATE TABLE `tbl_business_email` (
  `business_email_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_business_email`
--

INSERT INTO `tbl_business_email` (`business_email_id`, `business_id`, `email`) VALUES
(1, 1, 'ankit.detroja@digitattva.com'),
(3, 3, 'rutuj.tailor@digitattva.com'),
(4, 4, 'Freshjuice@gmail.com'),
(5, 5, 'naitik.shah@digitattva.com'),
(8, 8, 'cookiesbakers@gmail.com'),
(23, 2, 'harsh.lad@digitattva.com'),
(25, 6, 'Dinesh@gmail.com'),
(26, 9, 'Harish@gmail.com'),
(27, 11, 'Jignesh@gmail.com'),
(30, 14, 'Dishank@gmail.com'),
(31, 15, 'naitik@digitattva.in'),
(33, 17, '29tattots@gmail.com'),
(34, 18, 'devillapizza@gmail.com'),
(40, 19, 'zemonjuice@gmail.com'),
(41, 16, 'khush@gmail.com'),
(44, 20, 'shah.naitik.23825@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_file`
--

CREATE TABLE `tbl_business_file` (
  `business_file_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_real_name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_business_file`
--

INSERT INTO `tbl_business_file` (`business_file_id`, `business_id`, `filename`, `file_real_name`) VALUES
(1, 1, '21bea3fc66d95e23126787c7dac0e05e.jpg', 'paneer-butter-masala-or-cheese-cottage-curry--popular-indian-lunch-dinner-menu-in-weddings-or-parties--selective-focus-669329084-5acac5acc67335003764a3bc.jpg'),
(2, 2, '1bd840a8ace808fe59ab901d8b4a8649.jpg', 'Chris-Gampat-The-Phoblographer-Sony-a6500-review-45mm-f2.8-ISO-400-1-25s45SONYILCA-99M2-Zeiss-Vario-Sonnar-T-24-70-mm-F2.8-ZA-SSM-SAL2470Z-1-770x513.jpg'),
(3, 3, '4ab61ac1a140c6bef61f826b1ef5f187.jpg', 'download (1).jpg'),
(4, 4, 'f15dfb9089e977bf08bc265a40947083.jpg', 'community.jpg'),
(5, 5, '40cfafe1daddb013edef46143e167012.png', 'Screen-Shot-2015-12-03-at-8.23.43-AM-1.png'),
(6, 6, '99010d49a44a6de9fd9856b72963145d.jpg', 'community.jpg'),
(9, 8, 'd49390338a8d58453f114a62d28ebd61.jpg', 'GSCookies_Lead.jpg'),
(10, 9, '8c6e4c31e59cb0e5e1f42df484d7b217.jpg', 'community.jpg'),
(12, 11, '858cd290d8c5003d03da7ebed86212d1.jpg', 'community.jpg'),
(14, 14, '440eb2f69fb7a81b45bfec2826bfe5cd.jpg', 'community.jpg'),
(15, 15, '97ec80008ed3ec7c7c869a0dab0c32f6.jpg', 'community.jpg'),
(17, 17, '06a3ce5fc78a85935ff6a3f9d2c37f44.jpeg', 'community.jpeg'),
(18, 18, 'aa7608049f4a48931184b1f6261addcf.jpg', 'paneer-butter-masala-or-cheese-cottage-curry--popular-indian-lunch-dinner-menu-in-weddings-or-parties--selective-focus-669329084-5acac5acc67335003764a3bc.jpg'),
(19, 19, '110b610c375246a5cbf0e8e166aea140.jpg', 'community.jpg'),
(20, 20, '370be9cee1b75dc61b871704bea1d66d.jpg', 'community.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_mobile`
--

CREATE TABLE `tbl_business_mobile` (
  `business_mobile_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `mobile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_business_mobile`
--

INSERT INTO `tbl_business_mobile` (`business_mobile_id`, `business_id`, `mobile`) VALUES
(1, 1, '9714154356'),
(3, 3, '9638076983'),
(4, 4, '9869999888'),
(5, 5, '8976677224'),
(8, 8, '9428277181'),
(23, 2, '9726071397'),
(25, 6, '9696747481'),
(26, 9, '8764847679'),
(27, 11, '9696963636'),
(30, 14, '6468986868'),
(31, 15, '8976677226'),
(33, 17, '9726071397'),
(34, 18, '1234567899'),
(40, 19, '9438455434'),
(41, 16, '5487426548'),
(44, 20, '8976677224');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_telephone`
--

CREATE TABLE `tbl_business_telephone` (
  `business_telephone_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_business_telephone`
--

INSERT INTO `tbl_business_telephone` (`business_telephone_id`, `business_id`, `telephone`) VALUES
(1, 1, '971415435663'),
(3, 3, '023654789131'),
(4, 4, '025649649464'),
(5, 5, '897667722402'),
(8, 8, '023659871313'),
(23, 2, '026222729632'),
(25, 6, '987546978464'),
(26, 9, '976494767979'),
(27, 11, '264684348434'),
(30, 14, '964956894564'),
(31, 15, '312345698752'),
(33, 17, '642846695486'),
(34, 18, '789456123037'),
(40, 19, '946428434884'),
(41, 16, '456987459865'),
(44, 20, '123456789239');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_types`
--

CREATE TABLE `tbl_business_types` (
  `business_type_id` int(11) NOT NULL,
  `parent_business_type_id` int(11) NOT NULL,
  `business_type_name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `samaj_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_business_types`
--

INSERT INTO `tbl_business_types` (`business_type_id`, `parent_business_type_id`, `business_type_name`, `sort_order`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`, `samaj_id`) VALUES
(1, 0, 'Cafe Coffee Day', 1, 1, '2019-04-09 12:01:34', 1, '2019-04-09 12:01:34', 1, 1),
(2, 0, 'Pre-Wedding Photography', 2, 1, '2019-04-09 12:03:00', 1, '2019-04-09 12:03:00', 1, 1),
(3, 0, 'Chinese Food Business', 3, 1, '2019-04-09 12:04:15', 1, '2019-04-09 12:04:15', 1, 1),
(4, 0, 'Juice & Soda Hub', 4, 1, '2019-04-09 12:20:08', 1, '2019-04-09 12:20:08', 1, 1),
(5, 0, 'Chocolate Chip Cookie', 5, 1, '2019-04-09 04:11:14', 1, '2019-04-09 16:11:14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_type_description`
--

CREATE TABLE `tbl_business_type_description` (
  `business_type_description_id` int(11) NOT NULL,
  `business_type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `business_type_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_business_type_description`
--

INSERT INTO `tbl_business_type_description` (`business_type_description_id`, `business_type_id`, `language_id`, `business_type_name`, `sort_order`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Cafe Coffee Day', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(2, 1, 3, 'કાફે કૉફી ડે', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(3, 2, 1, 'Pre-Wedding Photography', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(4, 2, 3, 'પૂર્વ વેડિંગ ફોટોગ્રાફી', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(5, 3, 1, 'Chinese Food Business', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(6, 3, 3, 'ચિની ફૂડ બિઝનેસ', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(7, 4, 1, 'Juice & Soda Hub', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(8, 4, 3, 'જ્યૂસ અને સોડા હબ', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(9, 5, 1, 'Chocolate Chip Cookie', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(10, 5, 3, 'ચોકલેટ ચિપ કૂકી', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `samaj_id`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 0, 1, '2019-03-12 12:24:10', 1, '2019-03-12 12:43:48', 1),
(2, 0, 1, '2019-03-12 12:53:25', 1, '2019-03-12 12:53:25', 1),
(3, 1, 1, '2019-04-09 10:53:15', 1, '2019-04-09 10:53:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_description`
--

CREATE TABLE `tbl_category_description` (
  `category_description_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category_description`
--

INSERT INTO `tbl_category_description` (`category_description_id`, `category_id`, `language_id`, `category_name`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Pooja ', '2019-03-12 12:24:11', 1, '2019-03-12 12:43:49', 1),
(2, 1, 3, 'પૂજા', '2019-03-12 12:24:11', 1, '2019-03-12 12:43:49', 1),
(3, 2, 1, 'Roja ', '2019-03-12 12:53:25', 1, '2019-03-12 12:53:25', 1),
(4, 2, 3, 'રોજા', '2019-03-12 12:53:25', 1, '2019-03-12 12:53:25', 1),
(5, 3, 1, 'Sports', '2019-04-09 10:53:15', 1, '2019-04-09 10:53:15', 1),
(6, 3, 3, 'રમતો', '2019-04-09 10:53:15', 1, '2019-04-09 10:53:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(1652, 'South Hill', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1653, 'The Valley', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1654, 'Oranjestad', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1655, 'Douglas', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1656, 'Gibraltar', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1657, 'Tamuning', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1658, 'AgaÃ±a', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1659, 'Flying Fish Cove', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1660, 'Monte-Carlo', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1661, 'Monaco-Ville', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1662, 'Yangor', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1663, 'Yaren', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1664, 'Alofi', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1665, 'Kingston', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1666, 'Adamstown', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1667, 'Singapore', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1668, 'NoumÃ©a', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1669, 'CittÃ  del Vaticano', 240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1670, 'Mazar-e-Sharif', 241, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1671, 'Herat', 242, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1672, 'Kabul', 243, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1673, 'Qandahar', 244, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1674, 'Lobito', 245, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1675, 'Benguela', 245, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1676, 'Huambo', 246, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1677, 'Luanda', 247, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1678, 'Namibe', 248, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1679, 'South Hill', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1680, 'The Valley', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1681, 'Oranjestad', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1682, 'Douglas', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1683, 'Gibraltar', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1684, 'Tamuning', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1685, 'AgaÃ±a', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1686, 'Flying Fish Cove', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1687, 'Monte-Carlo', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1688, 'Monaco-Ville', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1689, 'Yangor', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1690, 'Yaren', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1691, 'Alofi', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1692, 'Kingston', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1693, 'Adamstown', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1694, 'Singapore', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1695, 'NoumÃ©a', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1696, 'CittÃ  del Vaticano', 249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1697, 'Tirana', 250, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1698, 'Andorra la Vella', 251, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1699, 'Willemstad', 252, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1700, 'Abu Dhabi', 253, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1701, 'al-Ayn', 253, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1702, 'Ajman', 254, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1703, 'Dubai', 255, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1704, 'Sharja', 256, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1705, 'La Matanza', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1706, 'Lomas de Zamora', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1707, 'Quilmes', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1708, 'Almirante Brown', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1709, 'La Plata', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1710, 'Mar del Plata', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1711, 'LanÃºs', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1712, 'Merlo', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1713, 'General San MartÃ­n', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1714, 'Moreno', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1715, 'Avellaneda', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1716, 'Tres de Febrero', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1717, 'MorÃ³n', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1718, 'Florencio Varela', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1719, 'San Isidro', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1720, 'Tigre', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1721, 'Malvinas Argentinas', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1722, 'Vicente LÃ³pez', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1723, 'Berazategui', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1724, 'San Miguel', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1725, 'BahÃ­a Blanca', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1726, 'Esteban EcheverrÃ­a', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1727, 'JosÃ© C. Paz', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1728, 'Hurlingham', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1729, 'ItuzaingÃ³', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1730, 'San Fernando', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1731, 'San NicolÃ¡s de los Arroyos', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1732, 'Escobar', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1733, 'Pilar', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1734, 'Ezeiza', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1735, 'Tandil', 257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1736, 'San Fernando del Valle de Cata', 258, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1737, 'CÃ³rdoba', 259, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1738, 'RÃ­o Cuarto', 259, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1739, 'MonterÃ­a', 259, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1740, 'Resistencia', 260, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1741, 'Comodoro Rivadavia', 261, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1742, 'Corrientes', 262, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1743, 'Buenos Aires', 263, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1744, 'BrasÃ­lia', 263, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1745, 'Ciudad de MÃ©xico', 263, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1746, 'Caracas', 263, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1747, 'Catia La Mar', 263, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1748, 'ParanÃ¡', 264, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1749, 'Concordia', 264, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1750, 'Formosa', 265, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1751, 'San Salvador de Jujuy', 266, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1752, 'La Rioja', 267, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1753, 'LogroÃ±o', 267, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1754, 'Godoy Cruz', 268, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1755, 'GuaymallÃ©n', 268, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1756, 'Las Heras', 268, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1757, 'Mendoza', 268, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1758, 'San Rafael', 268, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1759, 'Posadas', 269, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1760, 'NeuquÃ©n', 270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1761, 'Salta', 271, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1762, 'San Juan', 272, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1763, 'San Juan', 272, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1764, 'San Luis', 273, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1765, 'Rosario', 274, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1766, 'Santa FÃ©', 274, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1767, 'Santiago del Estero', 275, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1768, 'San Miguel de TucumÃ¡n', 276, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1769, 'Vanadzor', 277, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1770, 'Yerevan', 278, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1771, 'Gjumri', 279, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1772, 'Tafuna', 280, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1773, 'Fagatogo', 280, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1774, 'Saint JohnÂ´s', 281, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1775, 'Canberra', 282, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1776, 'Sydney', 283, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1777, 'Newcastle', 283, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1778, 'Central Coast', 283, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1779, 'Wollongong', 283, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1780, 'Brisbane', 284, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1781, 'Gold Coast', 284, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1782, 'Townsville', 284, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1783, 'Cairns', 284, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1784, 'Adelaide', 285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1785, 'Hobart', 286, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1786, 'Melbourne', 287, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1787, 'Geelong', 287, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1788, 'Perth', 288, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1789, 'Klagenfurt', 289, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1790, 'Linz', 290, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1791, 'Salzburg', 291, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1792, 'Graz', 292, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1793, 'Innsbruck', 293, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1794, 'Wien', 294, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1795, 'Baku', 295, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1796, 'GÃ¤ncÃ¤', 296, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1797, 'MingÃ¤Ã§evir', 297, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1798, 'Sumqayit', 298, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1799, 'Bujumbura', 299, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1800, 'Antwerpen', 300, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1801, 'Bruxelles [Brussel]', 301, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1802, 'Schaerbeek', 301, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1803, 'Gent', 302, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1804, 'Charleroi', 303, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1805, 'Mons', 303, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1806, 'LiÃ¨ge', 304, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1807, 'Namur', 305, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1808, 'Brugge', 306, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1809, 'Djougou', 307, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1810, 'Cotonou', 308, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1811, 'Parakou', 309, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1812, 'Porto-Novo', 310, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1813, 'Koudougou', 311, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1814, 'Bobo-Dioulasso', 312, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1815, 'Ouagadougou', 313, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1816, 'Barisal', 314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1817, 'Chittagong', 315, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1818, 'Comilla', 315, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1819, 'Brahmanbaria', 315, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1820, 'Dhaka', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1821, 'Narayanganj', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1822, 'Mymensingh', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1823, 'Tungi', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1824, 'Tangail', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1825, 'Jamalpur', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1826, 'Narsinghdi', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1827, 'Gazipur', 316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1828, 'Khulna', 317, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1829, 'Jessore', 317, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1830, 'Rajshahi', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1831, 'Rangpur', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1832, 'Nawabganj', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1833, 'Dinajpur', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1834, 'Bogra', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1835, 'Pabna', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1836, 'Naogaon', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1837, 'Sirajganj', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1838, 'Saidpur', 318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1839, 'Sylhet', 319, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1840, 'Burgas', 320, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1841, 'Sliven', 320, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1842, 'Sofija', 321, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1843, 'Stara Zagora', 322, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1844, 'Pleven', 323, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1845, 'Plovdiv', 324, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1846, 'Ruse', 325, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1847, 'Varna', 326, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1848, 'Dobric', 326, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1849, 'Å umen', 326, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1850, 'al-Manama', 327, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1851, 'Nassau', 328, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1852, 'Sarajevo', 329, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1853, 'Zenica', 329, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1854, 'Banja Luka', 330, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1855, 'Brest', 331, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1856, 'BaranovitÅ¡i', 331, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1857, 'Pinsk', 331, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1858, 'Gomel', 332, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1859, 'Mozyr', 332, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1860, 'Grodno', 333, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1861, 'Lida', 333, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1862, 'Minsk', 334, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1863, 'Borisov', 335, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1864, 'Soligorsk', 335, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1865, 'MolodetÅ¡no', 335, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1866, 'Mogiljov', 336, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1867, 'Bobruisk', 336, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1868, 'Vitebsk', 337, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1869, 'OrÅ¡a', 337, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1870, 'Novopolotsk', 337, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1871, 'Belize City', 338, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1872, 'Belmopan', 339, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1873, 'Hamilton', 340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1874, 'Hamilton', 340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1875, 'Saint George', 341, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1876, 'Sucre', 342, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1877, 'Cochabamba', 343, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1878, 'La Paz', 344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1879, 'El Alto', 344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1880, 'Oruro', 345, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1881, 'PotosÃ­', 346, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1882, 'Santa Cruz de la Sierra', 347, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1883, 'Tarija', 348, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1884, 'Rio Branco', 349, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1885, 'MaceiÃ³', 350, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1886, 'Arapiraca', 350, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1887, 'MacapÃ¡', 351, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1888, 'Manaus', 352, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1889, 'Salvador', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1890, 'Feira de Santana', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1891, 'IlhÃ©us', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1892, 'VitÃ³ria da Conquista', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1893, 'Juazeiro', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1894, 'Itabuna', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1895, 'JequiÃ©', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1896, 'CamaÃ§ari', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1897, 'Barreiras', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1898, 'Alagoinhas', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1899, 'Lauro de Freitas', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1900, 'Teixeira de Freitas', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1901, 'Paulo Afonso', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1902, 'EunÃ¡polis', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1903, 'Jacobina', 353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1904, 'Fortaleza', 354, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1905, 'Caucaia', 354, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1906, 'Juazeiro do Norte', 354, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1907, 'MaracanaÃº', 354, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1908, 'Sobral', 354, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1909, 'Crato', 354, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1910, 'Buenos Aires', 355, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1911, 'BrasÃ­lia', 355, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1912, 'Ciudad de MÃ©xico', 355, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1913, 'Caracas', 355, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1914, 'Catia La Mar', 355, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1915, 'Cariacica', 356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1916, 'Vila Velha', 356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1917, 'Serra', 356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1918, 'VitÃ³ria', 356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1919, 'Cachoeiro de Itapemirim', 356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1920, 'Colatina', 356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1921, 'Linhares', 356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1922, 'GoiÃ¢nia', 357, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1923, 'Aparecida de GoiÃ¢nia', 357, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1924, 'AnÃ¡polis', 357, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1925, 'LuziÃ¢nia', 357, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1926, 'Rio Verde', 357, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1927, 'Ãguas Lindas de GoiÃ¡s', 357, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1928, 'SÃ£o LuÃ­s', 358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1929, 'Imperatriz', 358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1930, 'Caxias', 358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1931, 'Timon', 358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1932, 'CodÃ³', 358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1933, 'SÃ£o JosÃ© de Ribamar', 358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1934, 'Bacabal', 358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1935, 'CuiabÃ¡', 359, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1936, 'VÃ¡rzea Grande', 359, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1937, 'RondonÃ³polis', 359, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1938, 'Campo Grande', 360, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1939, 'Dourados', 360, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1940, 'CorumbÃ¡', 360, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1941, 'Belo Horizonte', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1942, 'Contagem', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1943, 'UberlÃ¢ndia', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1944, 'Juiz de Fora', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1945, 'Betim', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1946, 'Montes Claros', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1947, 'Uberaba', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1948, 'RibeirÃ£o das Neves', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1949, 'Governador Valadares', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1950, 'Ipatinga', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1951, 'DivinÃ³polis', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1952, 'Sete Lagoas', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1953, 'Santa Luzia', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1954, 'PoÃ§os de Caldas', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1955, 'IbiritÃ©', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1956, 'TeÃ³filo Otoni', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1957, 'Patos de Minas', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1958, 'Barbacena', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1959, 'Varginha', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1960, 'SabarÃ¡', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1961, 'Itabira', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1962, 'Pouso Alegre', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1963, 'Passos', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1964, 'Araguari', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1965, 'Conselheiro Lafaiete', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1966, 'Coronel Fabriciano', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1967, 'Ituiutaba', 361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1968, 'JoÃ£o Pessoa', 362, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1969, 'Campina Grande', 362, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1970, 'Santa Rita', 362, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1971, 'Patos', 362, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1972, 'Curitiba', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1973, 'Londrina', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1974, 'MaringÃ¡', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1975, 'Ponta Grossa', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1976, 'Foz do IguaÃ§u', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1977, 'Cascavel', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1978, 'SÃ£o JosÃ© dos Pinhais', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1979, 'Colombo', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1980, 'Guarapuava', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1981, 'ParanaguÃ¡', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1982, 'Apucarana', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1983, 'Toledo', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1984, 'Pinhais', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1985, 'Campo Largo', 363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1986, 'BelÃ©m', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1987, 'Ananindeua', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1988, 'SantarÃ©m', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1989, 'MarabÃ¡', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1990, 'Castanhal', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1991, 'Abaetetuba', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1992, 'Itaituba', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1993, 'CametÃ¡', 364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1994, 'Recife', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1995, 'JaboatÃ£o dos Guararapes', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1996, 'Olinda', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1997, 'Paulista', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1998, 'Caruaru', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(1999, 'Petrolina', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2000, 'Cabo de Santo Agostinho', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2001, 'Camaragibe', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2002, 'Garanhuns', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2003, 'VitÃ³ria de Santo AntÃ£o', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2004, 'SÃ£o LourenÃ§o da Mata', 365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2005, 'Teresina', 366, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2006, 'ParnaÃ­ba', 366, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2007, 'Rio de Janeiro', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2008, 'SÃ£o GonÃ§alo', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2009, 'Nova IguaÃ§u', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2010, 'Duque de Caxias', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2011, 'NiterÃ³i', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2012, 'SÃ£o JoÃ£o de Meriti', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2013, 'Belford Roxo', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2014, 'Campos dos Goytacazes', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2015, 'PetrÃ³polis', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2016, 'Volta Redonda', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2017, 'MagÃ©', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2018, 'ItaboraÃ­', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2019, 'Nova Friburgo', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2020, 'Barra Mansa', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2021, 'NilÃ³polis', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2022, 'TeresÃ³polis', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2023, 'MacaÃ©', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2024, 'Cabo Frio', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2025, 'Queimados', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2026, 'Resende', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2027, 'Angra dos Reis', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2028, 'Barra do PiraÃ­', 367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2029, 'Natal', 368, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2030, 'MossorÃ³', 368, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2031, 'Parnamirim', 368, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2032, 'Porto Alegre', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2033, 'Caxias do Sul', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2034, 'Pelotas', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2035, 'Canoas', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2036, 'Novo Hamburgo', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2037, 'Santa Maria', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2038, 'GravataÃ­', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2039, 'ViamÃ£o', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2040, 'SÃ£o Leopoldo', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2041, 'Rio Grande', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2042, 'Alvorada', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2043, 'Passo Fundo', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2044, 'Uruguaiana', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2045, 'BagÃ©', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2046, 'Sapucaia do Sul', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2047, 'Santa Cruz do Sul', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2048, 'Cachoeirinha', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2049, 'GuaÃ­ba', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2050, 'Santana do Livramento', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2051, 'Bento GonÃ§alves', 369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2052, 'Porto Velho', 370, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2053, 'Ji-ParanÃ¡', 370, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2054, 'Boa Vista', 371, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2055, 'Joinville', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2056, 'FlorianÃ³polis', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2057, 'Blumenau', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2058, 'CriciÃºma', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2059, 'SÃ£o JosÃ©', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2060, 'ItajaÃ­', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2061, 'ChapecÃ³', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2062, 'Lages', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2063, 'JaraguÃ¡ do Sul', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2064, 'PalhoÃ§a', 372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2065, 'SÃ£o Paulo', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2066, 'Guarulhos', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2067, 'Campinas', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2068, 'SÃ£o Bernardo do Campo', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2069, 'Osasco', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2070, 'Santo AndrÃ©', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2071, 'SÃ£o JosÃ© dos Campos', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2072, 'RibeirÃ£o Preto', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2073, 'Sorocaba', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2074, 'Santos', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2075, 'MauÃ¡', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2076, 'CarapicuÃ­ba', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2077, 'SÃ£o JosÃ© do Rio Preto', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2078, 'Moji das Cruzes', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2079, 'Diadema', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2080, 'Piracicaba', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2081, 'Bauru', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2082, 'JundÃ­aÃ­', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2083, 'Franca', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2084, 'SÃ£o Vicente', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2085, 'Itaquaquecetuba', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2086, 'Limeira', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2087, 'GuarujÃ¡', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2088, 'TaubatÃ©', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2089, 'Embu', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2090, 'Barueri', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2091, 'TaboÃ£o da Serra', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2092, 'Suzano', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2093, 'MarÃ­lia', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2094, 'SÃ£o Carlos', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2095, 'SumarÃ©', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2096, 'Presidente Prudente', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2097, 'Americana', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2098, 'Araraquara', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2099, 'Santa BÃ¡rbara dÂ´Oeste', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2100, 'JacareÃ­', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2101, 'AraÃ§atuba', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2102, 'Praia Grande', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2103, 'Rio Claro', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2104, 'Itapevi', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2105, 'Cotia', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2106, 'Ferraz de Vasconcelos', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2107, 'Indaiatuba', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2108, 'HortolÃ¢ndia', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2109, 'SÃ£o Caetano do Sul', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2110, 'Itu', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2111, 'Itapecerica da Serra', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2112, 'Moji-GuaÃ§u', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2113, 'Pindamonhangaba', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2114, 'Francisco Morato', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2115, 'Itapetininga', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2116, 'BraganÃ§a Paulista', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2117, 'JaÃº', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2118, 'Franco da Rocha', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2119, 'RibeirÃ£o Pires', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2120, 'Catanduva', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2121, 'Botucatu', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2122, 'Barretos', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2123, 'GuaratinguetÃ¡', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2124, 'CubatÃ£o', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2125, 'Araras', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2126, 'Atibaia', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2127, 'SertÃ£ozinho', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2128, 'Salto', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2129, 'Ourinhos', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2130, 'Birigui', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2131, 'TatuÃ­', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2132, 'Votorantim', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2133, 'PoÃ¡', 373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2134, 'Aracaju', 374, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2135, 'Nossa Senhora do Socorro', 374, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2136, 'Palmas', 375, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2137, 'AraguaÃ­na', 375, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2138, 'Bridgetown', 376, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2139, 'Bandar Seri Begawan', 377, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2140, 'Thimphu', 378, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2141, 'Francistown', 379, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2142, 'Gaborone', 380, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2143, 'Bangui', 381, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2144, 'Calgary', 382, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2145, 'Edmonton', 382, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2146, 'Vancouver', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2147, 'Surrey', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2148, 'Burnaby', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2149, 'Richmond', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2150, 'Abbotsford', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2151, 'Coquitlam', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2152, 'Saanich', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2153, 'Delta', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2154, 'Kelowna', 383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2155, 'Winnipeg', 384, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2156, 'Saint JohnÂ´s', 385, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2157, 'Cape Breton', 386, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2158, 'Halifax', 386, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2159, 'Toronto', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2160, 'North York', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2161, 'Mississauga', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2162, 'Scarborough', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2163, 'Etobicoke', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2164, 'London', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2165, 'Hamilton', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2166, 'Ottawa', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2167, 'Brampton', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2168, 'Windsor', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2169, 'Kitchener', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2170, 'Markham', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2171, 'York', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2172, 'Vaughan', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2173, 'Burlington', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2174, 'Oshawa', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2175, 'Oakville', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2176, 'Saint Catharines', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2177, 'Richmond Hill', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2178, 'Thunder Bay', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2179, 'Nepean', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2180, 'East York', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2181, 'Cambridge', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2182, 'Gloucester', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2183, 'Guelph', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2184, 'Sudbury', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2185, 'Barrie', 387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2186, 'MontrÃ©al', 388, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2187, 'Laval', 388, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2188, 'QuÃ©bec', 388, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2189, 'Longueuil', 388, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2190, 'Gatineau', 388, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2191, 'Saskatoon', 389, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2192, 'Regina', 389, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2193, 'Bantam', 390, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2194, 'West Island', 391, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2195, 'Basel', 392, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2196, 'Bern', 393, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2197, 'Geneve', 394, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2198, 'Lausanne', 395, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2199, 'ZÃ¼rich', 396, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2200, 'Antofagasta', 397, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2201, 'Calama', 397, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2202, 'CopiapÃ³', 398, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2203, 'Talcahuano', 399, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2204, 'ConcepciÃ³n', 399, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2205, 'ChillÃ¡n', 399, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2206, 'Los Angeles', 399, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2207, 'Coronel', 399, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2208, 'San Pedro de la Paz', 399, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2209, 'Coquimbo', 400, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2210, 'La Serena', 400, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2211, 'Ovalle', 400, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2212, 'Temuco', 401, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2213, 'Puerto Montt', 402, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2214, 'Osorno', 402, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2215, 'Valdivia', 402, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2216, 'Punta Arenas', 403, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2217, 'Talca', 404, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2218, 'CuricÃ³', 404, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2219, 'Rancagua', 405, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2220, 'Santiago de Chile', 406, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2221, 'Puente Alto', 406, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2222, 'San Bernardo', 406, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2223, 'Melipilla', 406, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2224, 'Santiago de los Caballeros', 406, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2225, 'Arica', 407, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2226, 'Iquique', 407, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2227, 'ViÃ±a del Mar', 408, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2228, 'ValparaÃ­so', 408, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2229, 'QuilpuÃ©', 408, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2230, 'Hefei', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2231, 'Huainan', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2232, 'Bengbu', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2233, 'Wuhu', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2234, 'Huaibei', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2235, 'MaÂ´anshan', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2236, 'Anqing', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2237, 'Tongling', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2238, 'Fuyang', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2239, 'Suzhou', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2240, 'LiuÂ´an', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2241, 'Chuzhou', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2242, 'Chaohu', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2243, 'Xuangzhou', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2244, 'Bozhou', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2245, 'Huangshan', 409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2246, 'Chongqing', 410, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2247, 'Fuzhou', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2248, 'Amoy [Xiamen]', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2249, 'Nanping', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2250, 'Quanzhou', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2251, 'Zhangzhou', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2252, 'Sanming', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2253, 'Longyan', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2254, 'YongÂ´an', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2255, 'FuÂ´an', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2256, 'Fuqing', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2257, 'Putian', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2258, 'Shaowu', 411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2259, 'Lanzhou', 412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2260, 'Tianshui', 412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2261, 'Baiyin', 412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2262, 'Wuwei', 412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2263, 'Yumen', 412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2264, 'Jinchang', 412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2265, 'Pingliang', 412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2266, 'Kanton [Guangzhou]', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2267, 'Shenzhen', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2268, 'Shantou', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2269, 'Zhangjiang', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2270, 'Shaoguan', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2271, 'Chaozhou', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2272, 'Dongwan', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2273, 'Foshan', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2274, 'Zhongshan', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2275, 'Jiangmen', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2276, 'Yangjiang', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2277, 'Zhaoqing', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2278, 'Maoming', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1);
INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(2279, 'Zhuhai', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2280, 'Qingyuan', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2281, 'Huizhou', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2282, 'Meixian', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2283, 'Heyuan', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2284, 'Shanwei', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2285, 'Jieyang', 413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2286, 'Nanning', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2287, 'Liuzhou', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2288, 'Guilin', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2289, 'Wuzhou', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2290, 'Yulin', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2291, 'Qinzhou', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2292, 'Guigang', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2293, 'Beihai', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2294, 'Bose', 414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2295, 'Guiyang', 415, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2296, 'Liupanshui', 415, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2297, 'Zunyi', 415, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2298, 'Anshun', 415, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2299, 'Duyun', 415, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2300, 'Kaili', 415, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2301, 'Haikou', 416, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2302, 'Sanya', 416, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2303, 'Shijiazhuang', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2304, 'Tangshan', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2305, 'Handan', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2306, 'Zhangjiakou', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2307, 'Baoding', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2308, 'Qinhuangdao', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2309, 'Xingtai', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2310, 'Chengde', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2311, 'Cangzhou', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2312, 'Langfang', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2313, 'Renqiu', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2314, 'Hengshui', 417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2315, 'Harbin', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2316, 'Qiqihar', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2317, 'Yichun', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2318, 'Jixi', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2319, 'Daqing', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2320, 'Mudanjiang', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2321, 'Hegang', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2322, 'Jiamusi', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2323, 'Shuangyashan', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2324, 'Tieli', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2325, 'Suihua', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2326, 'Shangzi', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2327, 'Qitaihe', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2328, 'BeiÂ´an', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2329, 'Acheng', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2330, 'Zhaodong', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2331, 'Shuangcheng', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2332, 'Anda', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2333, 'Hailun', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2334, 'Mishan', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2335, 'Fujin', 418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2336, 'Zhengzhou', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2337, 'Luoyang', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2338, 'Kaifeng', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2339, 'Xinxiang', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2340, 'Anyang', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2341, 'Pingdingshan', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2342, 'Jiaozuo', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2343, 'Nanyang', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2344, 'Hebi', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2345, 'Xuchang', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2346, 'Xinyang', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2347, 'Puyang', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2348, 'Shangqiu', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2349, 'Zhoukou', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2350, 'Luohe', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2351, 'Zhumadian', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2352, 'Sanmenxia', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2353, 'Yuzhou', 419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2354, 'Wuhan', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2355, 'Huangshi', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2356, 'Xiangfan', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2357, 'Yichang', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2358, 'Shashi', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2359, 'Shiyan', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2360, 'Xiantao', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2361, 'Qianjiang', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2362, 'Honghu', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2363, 'Ezhou', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2364, 'Tianmen', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2365, 'Xiaogan', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2366, 'Zaoyang', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2367, 'Jinmen', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2368, 'Suizhou', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2369, 'Xianning', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2370, 'Laohekou', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2371, 'Puqi', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2372, 'Shishou', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2373, 'Danjiangkou', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2374, 'Guangshui', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2375, 'Enshi', 420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2376, 'Changsha', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2377, 'Hengyang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2378, 'Xiangtan', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2379, 'Zhuzhou', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2380, 'Yueyang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2381, 'Changde', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2382, 'Shaoyang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2383, 'Yiyang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2384, 'Chenzhou', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2385, 'Lengshuijiang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2386, 'Leiyang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2387, 'Loudi', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2388, 'Huaihua', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2389, 'Lianyuan', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2390, 'Hongjiang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2391, 'Zixing', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2392, 'Liling', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2393, 'Yuanjiang', 421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2394, 'Baotou', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2395, 'Hohhot', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2396, 'Yakeshi', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2397, 'Chifeng', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2398, 'Wuhai', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2399, 'Tongliao', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2400, 'Hailar', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2401, 'Jining', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2402, 'Ulanhot', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2403, 'Linhe', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2404, 'Zalantun', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2405, 'Manzhouli', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2406, 'Xilin Hot', 422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2407, 'Nanking [Nanjing]', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2408, 'Wuxi', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2409, 'Xuzhou', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2410, 'Suzhou', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2411, 'Changzhou', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2412, 'Zhenjiang', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2413, 'Lianyungang', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2414, 'Nantong', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2415, 'Yangzhou', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2416, 'Yancheng', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2417, 'Huaiyin', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2418, 'Jiangyin', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2419, 'Yixing', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2420, 'Dongtai', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2421, 'Changshu', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2422, 'Danyang', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2423, 'Xinghua', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2424, 'Taizhou', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2425, 'HuaiÂ´an', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2426, 'Qidong', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2427, 'Liyang', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2428, 'Yizheng', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2429, 'Suqian', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2430, 'Kunshan', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2431, 'Zhangjiagang', 423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2432, 'Nanchang', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2433, 'Pingxiang', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2434, 'Jiujiang', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2435, 'Jingdezhen', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2436, 'Ganzhou', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2437, 'Fengcheng', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2438, 'Xinyu', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2439, 'Yichun', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2440, 'JiÂ´an', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2441, 'Shangrao', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2442, 'Linchuan', 424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2443, 'Changchun', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2444, 'Jilin', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2445, 'Hunjiang', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2446, 'Liaoyuan', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2447, 'Tonghua', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2448, 'Siping', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2449, 'Dunhua', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2450, 'Yanji', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2451, 'Gongziling', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2452, 'Baicheng', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2453, 'Meihekou', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2454, 'Fuyu', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2455, 'Jiutai', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2456, 'Jiaohe', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2457, 'Huadian', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2458, 'Taonan', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2459, 'Longjing', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2460, 'DaÂ´an', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2461, 'Yushu', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2462, 'Tumen', 425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2463, 'Shenyang', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2464, 'Dalian', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2465, 'Anshan', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2466, 'Fushun', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2467, 'Benxi', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2468, 'Fuxin', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2469, 'Jinzhou', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2470, 'Dandong', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2471, 'Liaoyang', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2472, 'Yingkou', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2473, 'Panjin', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2474, 'Jinxi', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2475, 'Tieling', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2476, 'Wafangdian', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2477, 'Chaoyang', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2478, 'Haicheng', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2479, 'Beipiao', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2480, 'Tiefa', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2481, 'Kaiyuan', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2482, 'Xingcheng', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2483, 'Jinzhou', 426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2484, 'Yinchuan', 427, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2485, 'Shizuishan', 427, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2486, 'Peking', 428, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2487, 'Tong Xian', 428, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2488, 'Xining', 429, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2489, 'XiÂ´an', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2490, 'Xianyang', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2491, 'Baoji', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2492, 'Tongchuan', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2493, 'Hanzhong', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2494, 'Ankang', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2495, 'Weinan', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2496, 'YanÂ´an', 430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2497, 'Qingdao', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2498, 'Jinan', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2499, 'Zibo', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2500, 'Yantai', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2501, 'Weifang', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2502, 'Zaozhuang', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2503, 'TaiÂ´an', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2504, 'Linyi', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2505, 'Tengzhou', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2506, 'Dongying', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2507, 'Xintai', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2508, 'Jining', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2509, 'Laiwu', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2510, 'Liaocheng', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2511, 'Laizhou', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2512, 'Dezhou', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2513, 'Heze', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2514, 'Rizhao', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2515, 'Liangcheng', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2516, 'Jiaozhou', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2517, 'Pingdu', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2518, 'Longkou', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2519, 'Laiyang', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2520, 'Wendeng', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2521, 'Binzhou', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2522, 'Weihai', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2523, 'Qingzhou', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2524, 'Linqing', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2525, 'Jiaonan', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2526, 'Zhucheng', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2527, 'Junan', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2528, 'Pingyi', 431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2529, 'Shanghai', 432, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2530, 'Taiyuan', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2531, 'Datong', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2532, 'Yangquan', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2533, 'Changzhi', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2534, 'Yuci', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2535, 'Linfen', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2536, 'Jincheng', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2537, 'Yuncheng', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2538, 'Xinzhou', 433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2539, 'Chengdu', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2540, 'Panzhihua', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2541, 'Zigong', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2542, 'Leshan', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2543, 'Mianyang', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2544, 'Luzhou', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2545, 'Neijiang', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2546, 'Yibin', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2547, 'Daxian', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2548, 'Deyang', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2549, 'Guangyuan', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2550, 'Nanchong', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2551, 'Jiangyou', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2552, 'Fuling', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2553, 'Wanxian', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2554, 'Suining', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2555, 'Xichang', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2556, 'Dujiangyan', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2557, 'YaÂ´an', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2558, 'Emeishan', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2559, 'Huaying', 434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2560, 'Tianjin', 435, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2561, 'Lhasa', 436, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2562, 'UrumtÅ¡i [ÃœrÃ¼mqi]', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2563, 'Shihezi', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2564, 'Qaramay', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2565, 'Ghulja', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2566, 'Qashqar', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2567, 'Aqsu', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2568, 'Hami', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2569, 'Korla', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2570, 'Changji', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2571, 'Kuytun', 437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2572, 'Kunming', 438, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2573, 'Gejiu', 438, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2574, 'Qujing', 438, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2575, 'Dali', 438, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2576, 'Kaiyuan', 438, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2577, 'Hangzhou', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2578, 'Ningbo', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2579, 'Wenzhou', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2580, 'Huzhou', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2581, 'Jiaxing', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2582, 'Shaoxing', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2583, 'Xiaoshan', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2584, 'RuiÂ´an', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2585, 'Zhoushan', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2586, 'Jinhua', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2587, 'Yuyao', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2588, 'Quzhou', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2589, 'Cixi', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2590, 'Haining', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2591, 'Linhai', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2592, 'Huangyan', 439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2593, 'Abidjan', 440, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2594, 'BouakÃ©', 441, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2595, 'Daloa', 442, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2596, 'Korhogo', 443, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2597, 'Yamoussoukro', 444, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2598, 'YaoundÃ©', 445, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2599, 'Tours', 445, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2600, 'OrlÃ©ans', 445, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2601, 'Maroua', 446, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2602, 'Douala', 447, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2603, 'Nkongsamba', 447, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2604, 'Le-Cap-HaÃ¯tien', 448, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2605, 'Garoua', 448, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2606, 'Bamenda', 449, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2607, 'Port-au-Prince', 450, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2608, 'Carrefour', 450, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2609, 'Delmas', 450, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2610, 'Bafoussam', 450, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2611, 'Kikwit', 451, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2612, 'Matadi', 452, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2613, 'Boma', 452, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2614, 'Mbuji-Mayi', 453, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2615, 'Mwene-Ditu', 453, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2616, 'Mbandaka', 454, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2617, 'Kisangani', 455, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2618, 'Kinshasa', 456, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2619, 'Butembo', 457, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2620, 'Goma', 457, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2621, 'Lubumbashi', 458, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2622, 'Kolwezi', 458, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2623, 'Likasi', 458, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2624, 'Kalemie', 458, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2625, 'Bukavu', 459, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2626, 'Uvira', 459, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2627, 'Kananga', 460, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2628, 'Tshikapa', 460, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2629, 'Brazzaville', 461, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2630, 'Pointe-Noire', 462, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2631, 'Avarua', 463, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2632, 'MedellÃ­n', 464, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2633, 'Bello', 464, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2634, 'ItagÃ¼Ã­', 464, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2635, 'Envigado', 464, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2636, 'Barranquilla', 465, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2637, 'Soledad', 465, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2638, 'Cartagena', 466, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2639, 'Ciudad Guayana', 466, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2640, 'Ciudad BolÃ­var', 466, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2641, 'Tunja', 467, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2642, 'Sogamoso', 467, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2643, 'Manizales', 468, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2644, 'Florencia', 469, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2645, 'PopayÃ¡n', 470, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2646, 'CÃ³rdoba', 471, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2647, 'RÃ­o Cuarto', 471, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2648, 'MonterÃ­a', 471, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2649, 'Valledupar', 472, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2650, 'Soacha', 473, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2651, 'Girardot', 473, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2652, 'Neiva', 474, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2653, 'Maicao', 475, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2654, 'Santa Marta', 476, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2655, 'Villavicencio', 477, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2656, 'Pasto', 478, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2657, 'CÃºcuta', 479, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2658, 'Armenia', 480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2659, 'Pereira', 481, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2660, 'Dos Quebradas', 481, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2661, 'SantafÃ© de BogotÃ¡', 482, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2662, 'Bucaramanga', 483, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2663, 'Floridablanca', 483, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2664, 'Barrancabermeja', 483, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2665, 'Giron', 483, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2666, 'Sincelejo', 484, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2667, 'CumanÃ¡', 484, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2668, 'CarÃºpano', 484, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2669, 'IbaguÃ©', 485, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2670, 'Cali', 486, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2671, 'Palmira', 486, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2672, 'Buenaventura', 486, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2673, 'TuluÃ¡', 486, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2674, 'Cartago', 486, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2675, 'Buga', 486, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2676, 'Moroni', 487, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2677, 'Praia', 488, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2678, 'San JosÃ©', 489, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2679, 'CamagÃ¼ey', 490, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2680, 'Ciego de Ãvila', 491, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2681, 'Cienfuegos', 492, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2682, 'Bayamo', 493, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2683, 'Manzanillo', 493, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2684, 'GuantÃ¡namo', 494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2685, 'HolguÃ­n', 495, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2686, 'La Habana', 496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2687, 'Victoria de las Tunas', 497, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2688, 'Matanzas', 498, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2689, 'Pinar del RÃ­o', 499, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2690, 'Sancti-SpÃ­ritus', 500, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2691, 'Santiago de Cuba', 501, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2692, 'Santa Clara', 502, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2693, 'South Hill', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2694, 'The Valley', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2695, 'Oranjestad', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2696, 'Douglas', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2697, 'Gibraltar', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2698, 'Tamuning', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2699, 'AgaÃ±a', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2700, 'Flying Fish Cove', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2701, 'Monte-Carlo', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2702, 'Monaco-Ville', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2703, 'Yangor', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2704, 'Yaren', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2705, 'Alofi', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2706, 'Kingston', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2707, 'Adamstown', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2708, 'Singapore', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2709, 'NoumÃ©a', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2710, 'CittÃ  del Vaticano', 503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2711, 'George Town', 504, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2712, 'Limassol', 505, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2713, 'Nicosia', 506, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2714, 'Praha', 507, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2715, 'CeskÃ© Budejovice', 508, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2716, 'Brno', 509, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2717, 'Liberec', 510, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2718, 'ÃšstÃ­ nad Labem', 510, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2719, 'Ostrava', 511, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2720, 'Olomouc', 511, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2721, 'Hradec KrÃ¡lovÃ©', 512, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2722, 'Pardubice', 512, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2723, 'Plzen', 513, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2724, 'Halle/Saale', 514, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2725, 'Magdeburg', 514, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2726, 'Stuttgart', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2727, 'Mannheim', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2728, 'Karlsruhe', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2729, 'Freiburg im Breisgau', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2730, 'Heidelberg', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2731, 'Heilbronn', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2732, 'Pforzheim', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2733, 'Ulm', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2734, 'Reutlingen', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2735, 'Esslingen am Neckar', 515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2736, 'Munich [MÃ¼nchen]', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2737, 'NÃ¼rnberg', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2738, 'Augsburg', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2739, 'WÃ¼rzburg', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2740, 'Regensburg', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2741, 'Ingolstadt', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2742, 'FÃ¼rth', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2743, 'Erlangen', 516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2744, 'Berlin', 517, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2745, 'Potsdam', 518, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2746, 'Cottbus', 518, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2747, 'Bremen', 519, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2748, 'Bremerhaven', 519, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2749, 'Hamburg', 520, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2750, 'Frankfurt am Main', 521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2751, 'Wiesbaden', 521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2752, 'Kassel', 521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2753, 'Darmstadt', 521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2754, 'Offenbach am Main', 521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2755, 'Rostock', 522, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2756, 'Schwerin', 522, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2757, 'Hannover', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2758, 'Braunschweig', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2759, 'OsnabrÃ¼ck', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2760, 'Oldenburg', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2761, 'GÃ¶ttingen', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2762, 'Wolfsburg', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2763, 'Salzgitter', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2764, 'Hildesheim', 523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2765, 'KÃ¶ln', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2766, 'Essen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2767, 'Dortmund', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2768, 'DÃ¼sseldorf', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2769, 'Duisburg', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2770, 'Bochum', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2771, 'Wuppertal', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2772, 'Bielefeld', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2773, 'Bonn', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2774, 'Gelsenkirchen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2775, 'MÃ¼nster', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2776, 'MÃ¶nchengladbach', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2777, 'Aachen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2778, 'Krefeld', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2779, 'Oberhausen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2780, 'Hagen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2781, 'Hamm', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2782, 'Herne', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2783, 'MÃ¼lheim an der Ruhr', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2784, 'Solingen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2785, 'Leverkusen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2786, 'Neuss', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2787, 'Paderborn', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2788, 'Recklinghausen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2789, 'Bottrop', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2790, 'Remscheid', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2791, 'Siegen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2792, 'Moers', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2793, 'Bergisch Gladbach', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2794, 'Witten', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2795, 'Iserlohn', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2796, 'GÃ¼tersloh', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2797, 'Marl', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2798, 'LÃ¼nen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2799, 'DÃ¼ren', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2800, 'Ratingen', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2801, 'Velbert', 524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2802, 'Mainz', 525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2803, 'Ludwigshafen am Rhein', 525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2804, 'Koblenz', 525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2805, 'Kaiserslautern', 525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2806, 'Trier', 525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2807, 'SaarbrÃ¼cken', 526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2808, 'Leipzig', 527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2809, 'Dresden', 527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2810, 'Chemnitz', 527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2811, 'Zwickau', 527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2812, 'Kiel', 528, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2813, 'LÃ¼beck', 528, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2814, 'Erfurt', 529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2815, 'Gera', 529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2816, 'Jena', 529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2817, 'Djibouti', 530, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2818, 'Roseau', 531, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2819, 'Saint GeorgeÂ´s', 531, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2820, 'Kingstown', 531, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2821, 'Ã…rhus', 532, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2822, 'Frederiksberg', 533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2823, 'Odense', 534, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2824, 'KÃ¸benhavn', 535, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2825, 'Aalborg', 536, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2826, 'Santo Domingo de GuzmÃ¡n', 537, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2827, 'San Francisco de MacorÃ­s', 538, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2828, 'La Romana', 539, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2829, 'San Felipe de Puerto Plata', 540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2830, 'San Pedro de MacorÃ­s', 541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2831, 'Santiago de Chile', 542, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2832, 'Puente Alto', 542, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2833, 'San Bernardo', 542, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2834, 'Melipilla', 542, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2835, 'Santiago de los Caballeros', 542, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2836, 'Alger', 543, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2837, 'Annaba', 544, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2838, 'Batna', 545, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2839, 'BÃ©char', 546, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2840, 'BÃ©jaÃ¯a', 547, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2841, 'Biskra', 548, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2842, 'Blida (el-Boulaida)', 549, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2843, 'Ech-Chleff (el-Asnam)', 550, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2844, 'Constantine', 551, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2845, 'GhardaÃ¯a', 552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2846, 'Mostaganem', 553, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2847, 'Oran', 554, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2848, 'SÃ©tif', 555, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2849, 'Sidi Bel AbbÃ¨s', 556, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2850, 'Skikda', 557, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2851, 'TÃ©bessa', 558, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2852, 'Tiaret', 559, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2853, 'Tlemcen (Tilimsen)', 560, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2854, 'Cuenca', 561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2855, 'RÃ­obamba', 562, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2856, 'Machala', 563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2857, 'Esmeraldas', 564, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2858, 'Guayaquil', 565, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2859, 'Duran [Eloy Alfaro]', 565, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2860, 'Milagro', 565, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2861, 'Ibarra', 566, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2862, 'Loja', 567, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2863, 'Quevedo', 568, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2864, 'Portoviejo', 569, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2865, 'Manta', 569, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2866, 'Quito', 570, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2867, 'Santo Domingo de los Colorados', 570, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2868, 'Ambato', 571, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2869, 'Kafr al-Dawwar', 572, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2870, 'Damanhur', 572, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2871, 'al-Mansura', 573, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2872, 'Mit Ghamr', 573, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2873, 'Talkha', 573, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2874, 'al-Faiyum', 574, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2875, 'al-Mahallat al-Kubra', 575, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2876, 'Tanta', 575, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2877, 'Shibin al-Kawm', 576, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2878, 'al-Minya', 577, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2879, 'Mallawi', 577, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2880, 'Shubra al-Khayma', 578, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2881, 'Bahtim', 578, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2882, 'Banha', 578, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2883, 'Qalyub', 578, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2884, 'Zagazig', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2885, 'Bilbays', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2886, 'al-Dammam', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2887, 'al-Hufuf', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2888, 'al-Mubarraz', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2889, 'al-Khubar', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2890, 'Jubayl', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2891, 'Hafar al-Batin', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2892, 'al-Tuqba', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2893, 'al-Qatif', 579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2894, 'Alexandria', 580, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2895, 'Assuan', 581, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2896, 'Asyut', 582, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2897, 'Bani Suwayf', 583, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2898, 'Giza', 584, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2899, 'Bulaq al-Dakrur', 584, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2900, 'Warraq al-Arab', 584, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2901, 'al-Hawamidiya', 584, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2902, 'Ismailia', 585, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2903, 'Kafr al-Shaykh', 586, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2904, 'Disuq', 586, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2905, 'Cairo', 587, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2906, 'Luxor', 588, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2907, 'Port Said', 589, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2908, 'Qina', 590, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2909, 'Idfu', 590, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2910, 'Sawhaj', 591, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2911, 'Jirja', 591, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2912, 'al-Arish', 592, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2913, 'Suez', 593, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2914, 'Asmara', 594, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2915, 'El-AaiÃºn', 595, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2916, 'Sevilla', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1);
INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(2917, 'MÃ¡laga', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2918, 'CÃ³rdoba', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2919, 'Granada', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2920, 'Jerez de la Frontera', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2921, 'AlmerÃ­a', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2922, 'CÃ¡diz', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2923, 'Huelva', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2924, 'JaÃ©n', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2925, 'Algeciras', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2926, 'Marbella', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2927, 'Dos Hermanas', 596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2928, 'Zaragoza', 597, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2929, 'GijÃ³n', 598, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2930, 'Oviedo', 598, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2931, 'Palma de Mallorca', 599, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2932, 'Bilbao', 600, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2933, 'Vitoria-Gasteiz', 600, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2934, 'Donostia-San SebastiÃ¡n', 600, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2935, 'Barakaldo', 600, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2936, 'Las Palmas de Gran Canaria', 601, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2937, 'Santa Cruz de Tenerife', 601, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2938, '[San CristÃ³bal de] la Laguna', 601, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2939, 'Santander', 602, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2940, 'Valladolid', 603, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2941, 'Burgos', 603, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2942, 'Salamanca', 603, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2943, 'LeÃ³n', 603, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2944, 'Badajoz', 604, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2945, 'Vigo', 605, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2946, 'A CoruÃ±a (La CoruÃ±a)', 605, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2947, 'Ourense (Orense)', 605, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2948, 'Santiago de Compostela', 605, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2949, 'Albacete', 606, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2950, 'Barcelona', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2951, 'LÂ´Hospitalet de Llobregat', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2952, 'Badalona', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2953, 'Sabadell', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2954, 'Terrassa', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2955, 'Santa Coloma de Gramenet', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2956, 'Tarragona', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2957, 'Lleida (LÃ©rida)', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2958, 'MatarÃ³', 607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2959, 'La Rioja', 608, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2960, 'LogroÃ±o', 608, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2961, 'Madrid', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2962, 'MÃ³stoles', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2963, 'LeganÃ©s', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2964, 'Fuenlabrada', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2965, 'AlcalÃ¡ de Henares', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2966, 'Getafe', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2967, 'AlcorcÃ³n', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2968, 'TorrejÃ³n de Ardoz', 609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2969, 'Murcia', 610, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2970, 'Cartagena', 610, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2971, 'Pamplona [IruÃ±a]', 611, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2972, 'Valencia', 612, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2973, 'Alicante [Alacant]', 612, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2974, 'Elche [Elx]', 612, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2975, 'CastellÃ³n de la Plana [Castel', 612, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2976, 'Tallinn', 613, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2977, 'Tartu', 614, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2978, 'Addis Abeba', 615, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2979, 'Gonder', 616, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2980, 'Dese', 616, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2981, 'Bahir Dar', 616, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2982, 'Dire Dawa', 617, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2983, 'Nazret', 618, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2984, 'Mekele', 619, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2985, 'Helsinki [Helsingfors]', 620, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2986, 'Espoo', 620, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2987, 'Vantaa', 620, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2988, 'Lahti', 621, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2989, 'Tampere', 622, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2990, 'Oulu', 623, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2991, 'Turku [Ã…bo]', 624, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2992, 'Suva', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2993, 'Nyeri', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2994, 'Kathmandu', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2995, 'Lalitapur', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2996, 'Birgunj', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2997, 'San Lorenzo', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2998, 'LambarÃ©', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(2999, 'Fernando de la Mora', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3000, 'Kabwe', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3001, 'Kandy', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3002, 'Kampala', 625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3003, 'Stanley', 626, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3004, 'Strasbourg', 627, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3005, 'Mulhouse', 627, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3006, 'Bordeaux', 628, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3007, 'Clermont-Ferrand', 629, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3008, 'Paris', 630, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3009, 'Boulogne-Billancourt', 630, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3010, 'Argenteuil', 630, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3011, 'Montreuil', 630, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3012, 'Caen', 631, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3013, 'Dijon', 632, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3014, 'St-Ã‰tienne', 633, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3015, 'Brest', 633, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3016, 'YaoundÃ©', 634, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3017, 'Tours', 634, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3018, 'OrlÃ©ans', 634, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3019, 'Le Havre', 635, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3020, 'BesanÃ§on', 636, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3021, 'Rennes', 637, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3022, 'Rouen', 637, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3023, 'Montpellier', 638, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3024, 'NÃ®mes', 638, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3025, 'Perpignan', 638, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3026, 'Limoges', 639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3027, 'Metz', 640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3028, 'Nancy', 640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3029, 'Toulouse', 641, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3030, 'Reims', 642, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3031, 'Roubaix', 642, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3032, 'Tourcoing', 642, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3033, 'Nantes', 643, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3034, 'Angers', 643, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3035, 'Le Mans', 643, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3036, 'Amiens', 644, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3037, 'Marseille', 645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3038, 'Nice', 645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3039, 'Toulon', 645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3040, 'Aix-en-Provence', 645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3041, 'Lyon', 646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3042, 'Lille', 646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3043, 'Grenoble', 646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3044, 'Villeurbanne', 646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3045, 'TÃ³rshavn', 647, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3046, 'Weno', 648, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3047, 'Palikir', 649, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3048, 'Libreville', 650, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3049, 'South Hill', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3050, 'The Valley', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3051, 'Oranjestad', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3052, 'Douglas', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3053, 'Gibraltar', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3054, 'Tamuning', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3055, 'AgaÃ±a', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3056, 'Flying Fish Cove', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3057, 'Monte-Carlo', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3058, 'Monaco-Ville', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3059, 'Yangor', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3060, 'Yaren', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3061, 'Alofi', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3062, 'Kingston', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3063, 'Adamstown', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3064, 'Singapore', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3065, 'NoumÃ©a', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3066, 'CittÃ  del Vaticano', 651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3067, 'London', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3068, 'Birmingham', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3069, 'Liverpool', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3070, 'Sheffield', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3071, 'Manchester', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3072, 'Leeds', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3073, 'Bristol', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3074, 'Coventry', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3075, 'Leicester', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3076, 'Bradford', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3077, 'Nottingham', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3078, 'Kingston upon Hull', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3079, 'Plymouth', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3080, 'Stoke-on-Trent', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3081, 'Wolverhampton', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3082, 'Derby', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3083, 'Southampton', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3084, 'Northampton', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3085, 'Dudley', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3086, 'Portsmouth', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3087, 'Newcastle upon Tyne', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3088, 'Sunderland', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3089, 'Luton', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3090, 'Swindon', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3091, 'Southend-on-Sea', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3092, 'Walsall', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3093, 'Bournemouth', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3094, 'Peterborough', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3095, 'Brighton', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3096, 'Blackpool', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3097, 'West Bromwich', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3098, 'Reading', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3099, 'Oldbury/Smethwick (Warley)', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3100, 'Middlesbrough', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3101, 'Huddersfield', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3102, 'Oxford', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3103, 'Poole', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3104, 'Bolton', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3105, 'Blackburn', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3106, 'Preston', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3107, 'Stockport', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3108, 'Norwich', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3109, 'Rotherham', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3110, 'Cambridge', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3111, 'Watford', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3112, 'Ipswich', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3113, 'Slough', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3114, 'Exeter', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3115, 'Cheltenham', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3116, 'Gloucester', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3117, 'Saint Helens', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3118, 'Sutton Coldfield', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3119, 'York', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3120, 'Oldham', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3121, 'Basildon', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3122, 'Worthing', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3123, 'Chelmsford', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3124, 'Colchester', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3125, 'Crawley', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3126, 'Gillingham', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3127, 'Solihull', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3128, 'Rochdale', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3129, 'Birkenhead', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3130, 'Worcester', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3131, 'Hartlepool', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3132, 'Halifax', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3133, 'Woking/Byfleet', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3134, 'Southport', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3135, 'Maidstone', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3136, 'Eastbourne', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3137, 'Grimsby', 652, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3138, 'Saint Helier', 653, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3139, 'Belfast', 654, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3140, 'Glasgow', 655, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3141, 'Edinburgh', 655, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3142, 'Aberdeen', 655, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3143, 'Dundee', 655, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3144, 'Cardiff', 656, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3145, 'Swansea', 656, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3146, 'Newport', 656, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3147, 'Sohumi', 657, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3148, 'Batumi', 658, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3149, 'Kutaisi', 659, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3150, 'Rustavi', 660, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3151, 'Tbilisi', 661, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3152, 'Kumasi', 662, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3153, 'Accra', 663, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3154, 'Tema', 663, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3155, 'Tamale', 664, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3156, 'Jaffna', 664, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3157, 'Sekondi-Takoradi', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3158, 'Pokhara', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3159, 'Freetown', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3160, 'Colombo', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3161, 'Dehiwala', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3162, 'Moratuwa', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3163, 'Sri Jayawardenepura Kotte', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3164, 'Negombo', 665, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3165, 'South Hill', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3166, 'The Valley', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3167, 'Oranjestad', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3168, 'Douglas', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3169, 'Gibraltar', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3170, 'Tamuning', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3171, 'AgaÃ±a', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3172, 'Flying Fish Cove', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3173, 'Monte-Carlo', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3174, 'Monaco-Ville', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3175, 'Yangor', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3176, 'Yaren', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3177, 'Alofi', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3178, 'Kingston', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3179, 'Adamstown', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3180, 'Singapore', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3181, 'NoumÃ©a', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3182, 'CittÃ  del Vaticano', 666, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3183, 'Conakry', 667, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3184, 'Basse-Terre', 668, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3185, 'Les Abymes', 669, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3186, 'Banjul', 670, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3187, 'Serekunda', 671, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3188, 'Bissau', 672, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3189, 'Malabo', 673, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3190, 'Athenai', 674, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3191, 'Pireus', 674, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3192, 'Peristerion', 674, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3193, 'Kallithea', 674, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3194, 'Thessaloniki', 675, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3195, 'Herakleion', 676, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3196, 'Larisa', 677, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3197, 'Patras', 678, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3198, 'Roseau', 679, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3199, 'Saint GeorgeÂ´s', 679, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3200, 'Kingstown', 679, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3201, 'Nuuk', 680, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3202, 'Ciudad de Guatemala', 681, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3203, 'Mixco', 681, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3204, 'Villa Nueva', 681, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3205, 'Quetzaltenango', 682, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3206, 'Cayenne', 683, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3207, 'South Hill', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3208, 'The Valley', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3209, 'Oranjestad', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3210, 'Douglas', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3211, 'Gibraltar', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3212, 'Tamuning', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3213, 'AgaÃ±a', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3214, 'Flying Fish Cove', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3215, 'Monte-Carlo', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3216, 'Monaco-Ville', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3217, 'Yangor', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3218, 'Yaren', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3219, 'Alofi', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3220, 'Kingston', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3221, 'Adamstown', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3222, 'Singapore', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3223, 'NoumÃ©a', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3224, 'CittÃ  del Vaticano', 684, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3225, 'Georgetown', 685, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3226, 'Victoria', 686, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3227, 'Kowloon and New Kowloon', 687, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3228, 'La Ceiba', 688, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3229, 'San Pedro Sula', 689, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3230, 'Tegucigalpa', 690, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3231, 'Zagreb', 691, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3232, 'Osijek', 692, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3233, 'Rijeka', 693, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3234, 'Split', 694, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3235, 'Le-Cap-HaÃ¯tien', 695, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3236, 'Garoua', 695, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3237, 'Port-au-Prince', 696, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3238, 'Carrefour', 696, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3239, 'Delmas', 696, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3240, 'Bafoussam', 696, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3241, 'PÃ©cs', 697, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3242, 'KecskemÃ©t', 698, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3243, 'Miskolc', 699, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3244, 'Budapest', 700, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3245, 'Szeged', 701, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3246, 'SzÃ©kesfehÃ©rvÃ¡r', 702, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3247, 'GyÃ¶r', 703, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3248, 'Debrecen', 704, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3249, 'NyiregyhÃ¡za', 705, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3250, 'Banda Aceh', 706, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3251, 'Lhokseumawe', 706, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3252, 'Denpasar', 707, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3253, 'Bengkulu', 708, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3254, 'Semarang', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3255, 'Surakarta', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3256, 'Pekalongan', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3257, 'Tegal', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3258, 'Cilacap', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3259, 'Purwokerto', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3260, 'Magelang', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3261, 'Pemalang', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3262, 'Klaten', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3263, 'Salatiga', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3264, 'Kudus', 709, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3265, 'Surabaya', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3266, 'Malang', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3267, 'Kediri', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3268, 'Jember', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3269, 'Madiun', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3270, 'Pasuruan', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3271, 'Waru', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3272, 'Blitar', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3273, 'Probolinggo', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3274, 'Taman', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3275, 'Mojokerto', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3276, 'Jombang', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3277, 'Banyuwangi', 710, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3278, 'Jakarta', 711, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3279, 'Jambi', 712, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3280, 'Pontianak', 713, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3281, 'Banjarmasin', 714, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3282, 'Palangka Raya', 715, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3283, 'Samarinda', 716, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3284, 'Balikpapan', 716, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3285, 'Bandar Lampung', 717, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3286, 'Ambon', 718, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3287, 'Mataram', 719, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3288, 'Kupang', 720, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3289, 'Pekan Baru', 721, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3290, 'Batam', 721, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3291, 'Tanjung Pinang', 721, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3292, 'Ujung Pandang', 722, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3293, 'Palu', 723, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3294, 'Kendari', 724, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3295, 'Manado', 725, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3296, 'Gorontalo', 725, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3297, 'Padang', 726, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3298, 'Palembang', 727, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3299, 'Pangkal Pinang', 727, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3300, 'Medan', 728, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3301, 'Pematang Siantar', 728, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3302, 'Tebing Tinggi', 728, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3303, 'Percut Sei Tuan', 728, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3304, 'Binjai', 728, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3305, 'Sunggal', 728, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3306, 'Padang Sidempuan', 728, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3307, 'Jaya Pura', 729, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3308, 'Bandung', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3309, 'Tangerang', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3310, 'Bekasi', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3311, 'Depok', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3312, 'Cimahi', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3313, 'Bogor', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3314, 'Ciputat', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3315, 'Pondokgede', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3316, 'Cirebon', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3317, 'Cimanggis', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3318, 'Ciomas', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3319, 'Tasikmalaya', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3320, 'Karawang', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3321, 'Sukabumi', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3322, 'Serang', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3323, 'Cilegon', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3324, 'Cianjur', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3325, 'Ciparay', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3326, 'Citeureup', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3327, 'Cibinong', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3328, 'Purwakarta', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3329, 'Garut', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3330, 'Majalaya', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3331, 'Pondok Aren', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3332, 'Sawangan', 730, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3333, 'Yogyakarta', 731, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3334, 'Depok', 731, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3335, 'Hyderabad', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3336, 'Vishakhapatnam', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3337, 'Vijayawada', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3338, 'Guntur', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3339, 'Warangal', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3340, 'Rajahmundry', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3341, 'Nellore', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3342, 'Kakinada', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3343, 'Nizamabad', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3344, 'Kurnool', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3345, 'Ramagundam', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3346, 'Eluru', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3347, 'Kukatpalle', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3348, 'Anantapur', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3349, 'Tirupati', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3350, 'Secunderabad', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3351, 'Vizianagaram', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3352, 'Machilipatnam (Masulipatam)', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3353, 'Lalbahadur Nagar', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3354, 'Karimnagar', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3355, 'Tenali', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3356, 'Adoni', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3357, 'Proddatur', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3358, 'Chittoor', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3359, 'Khammam', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3360, 'Malkajgiri', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3361, 'Cuddapah', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3362, 'Bhimavaram', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3363, 'Nandyal', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3364, 'Mahbubnagar', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3365, 'Guntakal', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3366, 'Qutubullapur', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3367, 'Hindupur', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3368, 'Gudivada', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3369, 'Ongole', 732, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3370, 'Guwahati (Gauhati)', 733, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3371, 'Dibrugarh', 733, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3372, 'Silchar', 733, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3373, 'Nagaon', 733, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3374, 'Patna', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3375, 'Gaya', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3376, 'Bhagalpur', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3377, 'Muzaffarpur', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3378, 'Darbhanga', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3379, 'Bihar Sharif', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3380, 'Arrah (Ara)', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3381, 'Katihar', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3382, 'Munger (Monghyr)', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3383, 'Chapra', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3384, 'Sasaram', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3385, 'Dehri', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3386, 'Bettiah', 734, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3387, 'Chandigarh', 735, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3388, 'Raipur', 736, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3389, 'Bhilai', 736, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3390, 'Bilaspur', 736, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3391, 'Durg', 736, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3392, 'Raj Nandgaon', 736, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3393, 'Korba', 736, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3394, 'Raigarh', 736, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3395, 'Delhi', 737, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3396, 'New Delhi', 737, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3397, 'Delhi Cantonment', 737, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3398, 'Ahmedabad', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3399, 'Surat', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3400, 'Vadodara (Baroda)', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3401, 'Rajkot', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3402, 'Bhavnagar', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3403, 'Jamnagar', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3404, 'Nadiad', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3405, 'Bharuch (Broach)', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3406, 'Junagadh', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3407, 'Navsari', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3408, 'Gandhinagar', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3409, 'Veraval', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3410, 'Porbandar', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3411, 'Anand', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3412, 'Surendranagar', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3413, 'Gandhidham', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3414, 'Bhuj', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3415, 'Godhra', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3416, 'Patan', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3417, 'Morvi', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3418, 'Vejalpur', 738, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3419, 'Faridabad', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3420, 'Rohtak', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3421, 'Panipat', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3422, 'Karnal', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3423, 'Hisar (Hissar)', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3424, 'Yamuna Nagar', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3425, 'Sonipat (Sonepat)', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3426, 'Gurgaon', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3427, 'Sirsa', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3428, 'Ambala', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3429, 'Bhiwani', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3430, 'Ambala Sadar', 739, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3431, 'Srinagar', 740, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3432, 'Jammu', 740, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3433, 'Ranchi', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3434, 'Jamshedpur', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3435, 'Bokaro Steel City', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3436, 'Dhanbad', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3437, 'Purnea (Purnia)', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3438, 'Mango', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3439, 'Hazaribag', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3440, 'Purulia', 741, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3441, 'Bangalore', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3442, 'Hubli-Dharwad', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3443, 'Mysore', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3444, 'Belgaum', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3445, 'Gulbarga', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3446, 'Mangalore', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3447, 'Davangere', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3448, 'Bellary', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3449, 'Bijapur', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3450, 'Shimoga', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3451, 'Raichur', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3452, 'Timkur', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3453, 'Gadag Betigeri', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3454, 'Mandya', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3455, 'Bidar', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3456, 'Hospet', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3457, 'Hassan', 742, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3458, 'Cochin (Kochi)', 743, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3459, 'Thiruvananthapuram (Trivandrum', 743, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3460, 'Calicut (Kozhikode)', 743, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3461, 'Allappuzha (Alleppey)', 743, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3462, 'Kollam (Quilon)', 743, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3463, 'Palghat (Palakkad)', 743, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3464, 'Tellicherry (Thalassery)', 743, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3465, 'Indore', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3466, 'Bhopal', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3467, 'Jabalpur', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3468, 'Gwalior', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3469, 'Ujjain', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3470, 'Sagar', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3471, 'Ratlam', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3472, 'Burhanpur', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3473, 'Dewas', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3474, 'Murwara (Katni)', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3475, 'Satna', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3476, 'Morena', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3477, 'Khandwa', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3478, 'Rewa', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3479, 'Bhind', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3480, 'Shivapuri', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3481, 'Guna', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3482, 'Mandasor', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3483, 'Damoh', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3484, 'Chhindwara', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3485, 'Vidisha', 744, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3486, 'Mumbai (Bombay)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3487, 'Nagpur', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3488, 'Pune', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3489, 'Kalyan', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3490, 'Thane (Thana)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3491, 'Nashik (Nasik)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3492, 'Solapur (Sholapur)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3493, 'Shambajinagar (Aurangabad)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3494, 'Pimpri-Chinchwad', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3495, 'Amravati', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3496, 'Kolhapur', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3497, 'Bhiwandi', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3498, 'Ulhasnagar', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3499, 'Malegaon', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3500, 'Akola', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3501, 'New Bombay', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3502, 'Dhule (Dhulia)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3503, 'Nanded (Nander)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3504, 'Jalgaon', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3505, 'Chandrapur', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3506, 'Ichalkaranji', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3507, 'Latur', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3508, 'Sangli', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3509, 'Parbhani', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3510, 'Ahmadnagar', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3511, 'Mira Bhayandar', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3512, 'Jalna', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3513, 'Bhusawal', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3514, 'Miraj', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3515, 'Bhir (Bid)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3516, 'Gondiya', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3517, 'Yeotmal (Yavatmal)', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3518, 'Wardha', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3519, 'Achalpur', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3520, 'Satara', 745, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3521, 'Imphal', 746, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3522, 'Shillong', 747, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3523, 'Aizawl', 748, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3524, 'Bhubaneswar', 749, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3525, 'Kataka (Cuttack)', 749, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3526, 'Raurkela', 749, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3527, 'Brahmapur', 749, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3528, 'Raurkela Civil Township', 749, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3529, 'Sambalpur', 749, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3530, 'Puri', 749, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3531, 'Pondicherry', 750, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3532, 'Ludhiana', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3533, 'Amritsar', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3534, 'Jalandhar (Jullundur)', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3535, 'Patiala', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3536, 'Bhatinda (Bathinda)', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3537, 'Pathankot', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3538, 'Hoshiarpur', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3539, 'Moga', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3540, 'Abohar', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3541, 'Lahore', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3542, 'Faisalabad', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3543, 'Rawalpindi', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3544, 'Multan', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3545, 'Gujranwala', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3546, 'Sargodha', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1);
INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(3547, 'Sialkot', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3548, 'Bahawalpur', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3549, 'Jhang', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3550, 'Sheikhupura', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3551, 'Gujrat', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3552, 'Kasur', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3553, 'Rahim Yar Khan', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3554, 'Sahiwal', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3555, 'Okara', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3556, 'Wah', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3557, 'Dera Ghazi Khan', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3558, 'Chiniot', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3559, 'Kamoke', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3560, 'Mandi Burewala', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3561, 'Jhelum', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3562, 'Sadiqabad', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3563, 'Khanewal', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3564, 'Hafizabad', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3565, 'Muzaffargarh', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3566, 'Khanpur', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3567, 'Gojra', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3568, 'Bahawalnagar', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3569, 'Muridke', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3570, 'Pak Pattan', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3571, 'Jaranwala', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3572, 'Chishtian Mandi', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3573, 'Daska', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3574, 'Mandi Bahauddin', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3575, 'Ahmadpur East', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3576, 'Kamalia', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3577, 'Vihari', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3578, 'Wazirabad', 751, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3579, 'Jaipur', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3580, 'Jodhpur', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3581, 'Kota', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3582, 'Bikaner', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3583, 'Ajmer', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3584, 'Udaipur', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3585, 'Alwar', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3586, 'Bhilwara', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3587, 'Ganganagar', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3588, 'Bharatpur', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3589, 'Sikar', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3590, 'Pali', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3591, 'Beawar', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3592, 'Tonk', 752, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3593, 'Chennai (Madras)', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3594, 'Madurai', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3595, 'Coimbatore', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3596, 'Tiruchirapalli', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3597, 'Salem', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3598, 'Tiruppur (Tirupper)', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3599, 'Ambattur', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3600, 'Thanjavur', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3601, 'Tuticorin', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3602, 'Nagar Coil', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3603, 'Avadi', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3604, 'Dindigul', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3605, 'Vellore', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3606, 'Tiruvottiyur', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3607, 'Erode', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3608, 'Cuddalore', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3609, 'Kanchipuram', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3610, 'Kumbakonam', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3611, 'Tirunelveli', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3612, 'Alandur', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3613, 'Neyveli', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3614, 'Rajapalaiyam', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3615, 'Pallavaram', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3616, 'Tiruvannamalai', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3617, 'Tambaram', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3618, 'Valparai', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3619, 'Pudukkottai', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3620, 'Palayankottai', 753, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3621, 'Agartala', 754, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3622, 'Kanpur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3623, 'Lucknow', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3624, 'Varanasi (Benares)', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3625, 'Agra', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3626, 'Allahabad', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3627, 'Meerut', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3628, 'Bareilly', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3629, 'Gorakhpur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3630, 'Aligarh', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3631, 'Ghaziabad', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3632, 'Moradabad', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3633, 'Saharanpur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3634, 'Jhansi', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3635, 'Rampur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3636, 'Muzaffarnagar', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3637, 'Shahjahanpur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3638, 'Mathura', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3639, 'Firozabad', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3640, 'Farrukhabad-cum-Fatehgarh', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3641, 'Mirzapur-cum-Vindhyachal', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3642, 'Sambhal', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3643, 'Noida', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3644, 'Hapur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3645, 'Amroha', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3646, 'Maunath Bhanjan', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3647, 'Jaunpur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3648, 'Bahraich', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3649, 'Rae Bareli', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3650, 'Bulandshahr', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3651, 'Faizabad', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3652, 'Etawah', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3653, 'Sitapur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3654, 'Fatehpur', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3655, 'Budaun', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3656, 'Hathras', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3657, 'Unnao', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3658, 'Pilibhit', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3659, 'Gonda', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3660, 'Modinagar', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3661, 'Orai', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3662, 'Banda', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3663, 'Meerut Cantonment', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3664, 'Kanpur Cantonment', 755, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3665, 'Dehra Dun', 756, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3666, 'Hardwar (Haridwar)', 756, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3667, 'Haldwani-cum-Kathgodam', 756, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3668, 'Calcutta [Kolkata]', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3669, 'Haora (Howrah)', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3670, 'Durgapur', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3671, 'Bhatpara', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3672, 'Panihati', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3673, 'Kamarhati', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3674, 'Asansol', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3675, 'Barddhaman (Burdwan)', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3676, 'South Dum Dum', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3677, 'Barahanagar (Baranagar)', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3678, 'Siliguri (Shiliguri)', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3679, 'Bally', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3680, 'Kharagpur', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3681, 'Burnpur', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3682, 'Uluberia', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3683, 'Hugli-Chinsurah', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3684, 'Raiganj', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3685, 'North Dum Dum', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3686, 'Dabgram', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3687, 'Ingraj Bazar (English Bazar)', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3688, 'Serampore', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3689, 'Barrackpur', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3690, 'Naihati', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3691, 'Midnapore (Medinipur)', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3692, 'Navadwip', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3693, 'Krishnanagar', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3694, 'Chandannagar', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3695, 'Balurghat', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3696, 'Berhampore (Baharampur)', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3697, 'Bankura', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3698, 'Titagarh', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3699, 'Halisahar', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3700, 'Santipur', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3701, 'Kulti-Barakar', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3702, 'Barasat', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3703, 'Rishra', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3704, 'Basirhat', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3705, 'Uttarpara-Kotrung', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3706, 'North Barrackpur', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3707, 'Haldia', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3708, 'Habra', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3709, 'Kanchrapara', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3710, 'Champdani', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3711, 'Ashoknagar-Kalyangarh', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3712, 'Bansberia', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3713, 'Baidyabati', 757, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3714, 'Dublin', 758, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3715, 'Cork', 759, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3716, 'Ardebil', 760, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3717, 'Bushehr', 761, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3718, 'Shahr-e Kord', 762, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3719, 'Tabriz', 763, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3720, 'Maragheh', 763, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3721, 'Marand', 763, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3722, 'Esfahan', 764, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3723, 'Kashan', 764, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3724, 'Najafabad', 764, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3725, 'Khomeynishahr', 764, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3726, 'Qomsheh', 764, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3727, 'Shiraz', 765, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3728, 'Marv Dasht', 765, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3729, 'Jahrom', 765, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3730, 'Rasht', 766, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3731, 'Bandar-e Anzali', 766, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3732, 'Gorgan', 767, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3733, 'Hamadan', 768, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3734, 'Malayer', 768, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3735, 'Bandar-e-Abbas', 769, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3736, 'Ilam', 770, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3737, 'Kerman', 771, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3738, 'Sirjan', 771, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3739, 'Rafsanjan', 771, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3740, 'Kermanshah', 772, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3741, 'Mashhad', 773, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3742, 'Sabzevar', 773, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3743, 'Neyshabur', 773, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3744, 'Bojnurd', 773, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3745, 'Birjand', 773, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3746, 'Torbat-e Heydariyeh', 773, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3747, 'Ahvaz', 774, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3748, 'Abadan', 774, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3749, 'Dezful', 774, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3750, 'Masjed-e-Soleyman', 774, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3751, 'Andimeshk', 774, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3752, 'Khorramshahr', 774, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3753, 'Sanandaj', 775, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3754, 'Saqqez', 775, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3755, 'Khorramabad', 776, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3756, 'Borujerd', 776, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3757, 'Arak', 777, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3758, 'Sari', 778, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3759, 'Amol', 778, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3760, 'Babol', 778, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3761, 'Qaemshahr', 778, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3762, 'Gonbad-e Qabus', 778, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3763, 'Qazvin', 779, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3764, 'Qom', 780, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3765, 'Saveh', 780, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3766, 'Shahrud', 781, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3767, 'Semnan', 781, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3768, 'Zahedan', 782, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3769, 'Zabol', 782, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3770, 'Teheran', 783, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3771, 'Karaj', 783, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3772, 'Eslamshahr', 783, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3773, 'Qarchak', 783, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3774, 'Qods', 783, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3775, 'Varamin', 783, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3776, 'Urmia', 784, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3777, 'Khoy', 784, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3778, 'Bukan', 784, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3779, 'Mahabad', 784, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3780, 'Miandoab', 784, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3781, 'Yazd', 785, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3782, 'Zanjan', 786, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3783, 'al-Ramadi', 787, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3784, 'al-Najaf', 788, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3785, 'al-Diwaniya', 789, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3786, 'al-Sulaymaniya', 790, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3787, 'Kirkuk', 791, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3788, 'al-Hilla', 792, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3789, 'Baghdad', 793, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3790, 'Basra', 794, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3791, 'al-Nasiriya', 795, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3792, 'Baquba', 796, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3793, 'Irbil', 797, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3794, 'Karbala', 798, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3795, 'al-Amara', 799, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3796, 'Mosul', 800, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3797, 'al-Kut', 801, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3798, 'ReykjavÃ­k', 802, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3799, 'Beerseba', 803, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3800, 'Ashdod', 803, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3801, 'Ashqelon', 803, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3802, 'Rishon Le Ziyyon', 804, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3803, 'Petah Tiqwa', 804, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3804, 'Netanya', 804, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3805, 'Rehovot', 804, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3806, 'Haifa', 805, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3807, 'Jerusalem', 806, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3808, 'Tel Aviv-Jaffa', 807, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3809, 'Holon', 807, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3810, 'Bat Yam', 807, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3811, 'Bene Beraq', 807, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3812, 'Ramat Gan', 807, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3813, 'Pescara', 808, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3814, 'Bari', 809, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3815, 'Taranto', 809, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3816, 'Foggia', 809, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3817, 'Lecce', 809, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3818, 'Andria', 809, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3819, 'Brindisi', 809, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3820, 'Barletta', 809, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3821, 'Reggio di Calabria', 810, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3822, 'Catanzaro', 810, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3823, 'Napoli', 811, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3824, 'Salerno', 811, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3825, 'Torre del Greco', 811, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3826, 'Giugliano in Campania', 811, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3827, 'Bologna', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3828, 'Modena', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3829, 'Parma', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3830, 'Reggio nellÂ´ Emilia', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3831, 'Ravenna', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3832, 'Ferrara', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3833, 'Rimini', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3834, 'ForlÃ¬', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3835, 'Piacenza', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3836, 'Cesena', 812, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3837, 'Trieste', 813, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3838, 'Udine', 813, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3839, 'Roma', 814, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3840, 'Latina', 814, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3841, 'Genova', 815, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3842, 'La Spezia', 815, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3843, 'Milano', 816, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3844, 'Brescia', 816, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3845, 'Monza', 816, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3846, 'Bergamo', 816, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3847, 'Ancona', 817, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3848, 'Pesaro', 817, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3849, 'Torino', 818, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3850, 'Novara', 818, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3851, 'Alessandria', 818, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3852, 'Cagliari', 819, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3853, 'Sassari', 819, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3854, 'Palermo', 820, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3855, 'Catania', 820, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3856, 'Messina', 820, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3857, 'Syrakusa', 820, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3858, 'Firenze', 821, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3859, 'Prato', 821, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3860, 'Livorno', 821, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3861, 'Pisa', 821, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3862, 'Arezzo', 821, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3863, 'Trento', 822, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3864, 'Bolzano', 822, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3865, 'Perugia', 823, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3866, 'Terni', 823, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3867, 'Venezia', 824, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3868, 'Verona', 824, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3869, 'Padova', 824, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3870, 'Vicenza', 824, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3871, 'Kingston', 825, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3872, 'Portmore', 825, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3873, 'Spanish Town', 826, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3874, 'al-Zarqa', 827, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3875, 'al-Rusayfa', 827, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3876, 'Amman', 828, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3877, 'Wadi al-Sir', 828, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3878, 'Irbid', 829, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3879, 'Nagoya', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3880, 'Toyohashi', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3881, 'Toyota', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3882, 'Okazaki', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3883, 'Kasugai', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3884, 'Ichinomiya', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3885, 'Anjo', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3886, 'Komaki', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3887, 'Seto', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3888, 'Kariya', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3889, 'Toyokawa', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3890, 'Handa', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3891, 'Tokai', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3892, 'Inazawa', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3893, 'Konan', 830, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3894, 'Akita', 831, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3895, 'Aomori', 832, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3896, 'Hachinohe', 832, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3897, 'Hirosaki', 832, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3898, 'Chiba', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3899, 'Funabashi', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3900, 'Matsudo', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3901, 'Ichikawa', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3902, 'Kashiwa', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3903, 'Ichihara', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3904, 'Sakura', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3905, 'Yachiyo', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3906, 'Narashino', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3907, 'Nagareyama', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3908, 'Urayasu', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3909, 'Abiko', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3910, 'Kisarazu', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3911, 'Noda', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3912, 'Kamagaya', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3913, 'Nishio', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3914, 'Kimitsu', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3915, 'Mobara', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3916, 'Narita', 833, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3917, 'Matsuyama', 834, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3918, 'Niihama', 834, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3919, 'Imabari', 834, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3920, 'Fukui', 835, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3921, 'Fukuoka', 836, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3922, 'Kitakyushu', 836, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3923, 'Kurume', 836, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3924, 'Omuta', 836, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3925, 'Kasuga', 836, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3926, 'Iwaki', 837, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3927, 'Koriyama', 837, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3928, 'Fukushima', 837, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3929, 'Aizuwakamatsu', 837, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3930, 'Gifu', 838, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3931, 'Ogaki', 838, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3932, 'Kakamigahara', 838, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3933, 'Tajimi', 838, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3934, 'Maebashi', 839, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3935, 'Takasaki', 839, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3936, 'Ota', 839, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3937, 'Isesaki', 839, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3938, 'Kiryu', 839, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3939, 'Hiroshima', 840, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3940, 'Fukuyama', 840, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3941, 'Kure', 840, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3942, 'Higashihiroshima', 840, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3943, 'Onomichi', 840, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3944, 'Sapporo', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3945, 'Asahikawa', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3946, 'Hakodate', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3947, 'Kushiro', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3948, 'Obihiro', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3949, 'Tomakomai', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3950, 'Otaru', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3951, 'Ebetsu', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3952, 'Kitami', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3953, 'Muroran', 841, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3954, 'Kobe', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3955, 'Amagasaki', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3956, 'Himeji', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3957, 'Nishinomiya', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3958, 'Akashi', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3959, 'Kakogawa', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3960, 'Takarazuka', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3961, 'Itami', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3962, 'Kawanishi', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3963, 'Sanda', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3964, 'Takasago', 842, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3965, 'Mito', 843, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3966, 'Hitachi', 843, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3967, 'Tsukuba', 843, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3968, 'Tama', 843, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3969, 'Tsuchiura', 843, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3970, 'Kanazawa', 844, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3971, 'Komatsu', 844, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3972, 'Morioka', 845, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3973, 'Takamatsu', 846, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3974, 'Kagoshima', 847, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3975, 'Jokohama [Yokohama]', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3976, 'Kawasaki', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3977, 'Sagamihara', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3978, 'Yokosuka', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3979, 'Fujisawa', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3980, 'Hiratsuka', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3981, 'Chigasaki', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3982, 'Atsugi', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3983, 'Yamato', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3984, 'Odawara', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3985, 'Kamakura', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3986, 'Hadano', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3987, 'Zama', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3988, 'Ebina', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3989, 'Isehara', 848, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3990, 'Kochi', 849, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3991, 'Kumamoto', 850, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3992, 'Yatsushiro', 850, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3993, 'Kioto', 851, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3994, 'Uji', 851, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3995, 'Maizuru', 851, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3996, 'Kameoka', 851, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3997, 'Yokkaichi', 852, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3998, 'Suzuka', 852, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(3999, 'Tsu', 852, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4000, 'Matsusaka', 852, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4001, 'Kuwana', 852, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4002, 'Ise', 852, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4003, 'Sendai', 853, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4004, 'Ishinomaki', 853, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4005, 'Miyazaki', 854, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4006, 'Miyakonojo', 854, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4007, 'Nobeoka', 854, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4008, 'Nagano', 855, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4009, 'Matsumoto', 855, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4010, 'Ueda', 855, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4011, 'Iida', 855, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4012, 'Nagasaki', 856, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4013, 'Sasebo', 856, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4014, 'Isahaya', 856, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4015, 'Nara', 857, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4016, 'Kashihara', 857, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4017, 'Ikoma', 857, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4018, 'Yamatokoriyama', 857, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4019, 'Niigata', 858, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4020, 'Nagaoka', 858, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4021, 'Joetsu', 858, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4022, 'Kashiwazaki', 858, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4023, 'Oita', 859, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4024, 'Beppu', 859, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4025, 'Okayama', 860, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4026, 'Kurashiki', 860, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4027, 'Tsuyama', 860, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4028, 'Naha', 861, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4029, 'Okinawa', 861, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4030, 'Urasoe', 861, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4031, 'Osaka', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4032, 'Sakai', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4033, 'Higashiosaka', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4034, 'Hirakata', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4035, 'Toyonaka', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4036, 'Takatsuki', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4037, 'Suita', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4038, 'Yao', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4039, 'Ibaraki', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4040, 'Neyagawa', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4041, 'Kishiwada', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4042, 'Izumi', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4043, 'Moriguchi', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4044, 'Kadoma', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4045, 'Matsubara', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4046, 'Daito', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4047, 'Minoo', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4048, 'Tondabayashi', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4049, 'Kawachinagano', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4050, 'Habikino', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4051, 'Ikeda', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4052, 'Izumisano', 862, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4053, 'Saga', 863, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4054, 'Urawa', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4055, 'Kawaguchi', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4056, 'Omiya', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4057, 'Kawagoe', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4058, 'Tokorozawa', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4059, 'Koshigaya', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4060, 'Soka', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4061, 'Ageo', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4062, 'Kasukabe', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4063, 'Sayama', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4064, 'Kumagaya', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4065, 'Niiza', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4066, 'Iruma', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4067, 'Misato', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4068, 'Asaka', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4069, 'Iwatsuki', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4070, 'Toda', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4071, 'Fukaya', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4072, 'Sakado', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4073, 'Fujimi', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4074, 'Higashimatsuyama', 864, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4075, 'Otsu', 865, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4076, 'Kusatsu', 865, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4077, 'Hikone', 865, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4078, 'Matsue', 866, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4079, 'Hamamatsu', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4080, 'Shizuoka', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4081, 'Shimizu', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4082, 'Fuji', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4083, 'Numazu', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4084, 'Fujieda', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4085, 'Fujinomiya', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4086, 'Yaizu', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4087, 'Mishima', 867, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4088, 'Utsunomiya', 868, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4089, 'Ashikaga', 868, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4090, 'Oyama', 868, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4091, 'Kanuma', 868, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4092, 'Tokushima', 869, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4093, 'Tokyo', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4094, 'Hachioji', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4095, 'Machida', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4096, 'Fuchu', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4097, 'Chofu', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4098, 'Kodaira', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4099, 'Mitaka', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4100, 'Hino', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4101, 'Tachikawa', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4102, 'Hitachinaka', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4103, 'Ome', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4104, 'Higashimurayama', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4105, 'Musashino', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4106, 'Higashikurume', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4107, 'Koganei', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4108, 'Kokubunji', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4109, 'Akishima', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4110, 'Hoya', 870, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4111, 'Tottori', 871, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4112, 'Yonago', 871, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4113, 'Toyama', 872, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4114, 'Takaoka', 872, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4115, 'Wakayama', 873, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4116, 'Yamagata', 874, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4117, 'Sakata', 874, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4118, 'Tsuruoka', 874, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4119, 'Yonezawa', 874, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4120, 'Shimonoseki', 875, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4121, 'Ube', 875, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4122, 'Yamaguchi', 875, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4123, 'Hofu', 875, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4124, 'Tokuyama', 875, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4125, 'Iwakuni', 875, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4126, 'Kofu', 876, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4127, 'Taldyqorghan', 877, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4128, 'Almaty', 878, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4129, 'AqtÃ¶be', 879, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4130, 'Astana', 880, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4131, 'Atyrau', 881, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4132, 'Ã–skemen', 882, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4133, 'Semey', 882, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4134, 'Aqtau', 883, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4135, 'Petropavl', 884, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4136, 'KÃ¶kshetau', 884, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4137, 'Pavlodar', 885, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4138, 'Ekibastuz', 885, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4139, 'Qaraghandy', 886, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4140, 'Temirtau', 886, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4141, 'Zhezqazghan', 886, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4142, 'Qostanay', 887, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4143, 'Rudnyy', 887, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4144, 'Qyzylorda', 888, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4145, 'Shymkent', 889, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4146, 'Taraz', 890, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4147, 'Oral', 891, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4148, 'Suva', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4149, 'Nyeri', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4150, 'Kathmandu', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4151, 'Lalitapur', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4152, 'Birgunj', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4153, 'San Lorenzo', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4154, 'LambarÃ©', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4155, 'Fernando de la Mora', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4156, 'Kabwe', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4157, 'Kandy', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4158, 'Kampala', 892, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4159, 'Mombasa', 893, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4160, 'Machakos', 894, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4161, 'Meru', 894, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4162, 'Biratnagar', 894, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4163, 'Nairobi', 895, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4164, 'Kisumu', 896, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4165, 'Nakuru', 897, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4166, 'Eldoret', 897, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4167, 'Bishkek', 898, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4168, 'Osh', 899, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4169, 'Battambang', 900, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4170, 'Phnom Penh', 901, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4171, 'Siem Reap', 902, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4172, 'Bikenibeu', 903, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4173, 'Bairiki', 903, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4174, 'Basseterre', 904, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4175, 'Cheju', 905, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4176, 'Chonju', 906, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4177, 'Iksan', 906, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4178, 'Kunsan', 906, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4179, 'Chong-up', 906, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4180, 'Kimje', 906, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4181, 'Namwon', 906, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4182, 'Sunchon', 907, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4183, 'Mokpo', 907, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4184, 'Yosu', 907, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4185, 'Kwang-yang', 907, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1);
INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(4186, 'Naju', 907, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4187, 'Chongju', 908, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4188, 'Chungju', 908, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4189, 'Chechon', 908, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4190, 'Chonan', 909, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4191, 'Asan', 909, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4192, 'Nonsan', 909, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4193, 'Sosan', 909, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4194, 'Kongju', 909, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4195, 'Poryong', 909, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4196, 'Inchon', 910, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4197, 'Wonju', 911, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4198, 'Chunchon', 911, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4199, 'Kangnung', 911, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4200, 'Tonghae', 911, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4201, 'Kwangju', 912, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4202, 'Songnam', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4203, 'Puchon', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4204, 'Suwon', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4205, 'Anyang', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4206, 'Koyang', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4207, 'Ansan', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4208, 'Kwangmyong', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4209, 'Pyongtaek', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4210, 'Uijongbu', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4211, 'Yong-in', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4212, 'Kunpo', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4213, 'Namyangju', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4214, 'Paju', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4215, 'Ichon', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4216, 'Kuri', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4217, 'Shihung', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4218, 'Hanam', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4219, 'Uiwang', 913, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4220, 'Pohang', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4221, 'Kumi', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4222, 'Kyongju', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4223, 'Andong', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4224, 'Kyongsan', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4225, 'Kimchon', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4226, 'Yongju', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4227, 'Sangju', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4228, 'Yongchon', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4229, 'Mun-gyong', 914, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4230, 'Ulsan', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4231, 'Chang-won', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4232, 'Masan', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4233, 'Chinju', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4234, 'Kimhae', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4235, 'Yangsan', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4236, 'Koje', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4237, 'Tong-yong', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4238, 'Chinhae', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4239, 'Miryang', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4240, 'Sachon', 915, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4241, 'Pusan', 916, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4242, 'Seoul', 917, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4243, 'Taegu', 918, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4244, 'Taejon', 919, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4245, 'Kuwait', 920, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4246, 'al-Salimiya', 921, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4247, 'Jalib al-Shuyukh', 921, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4248, 'Savannakhet', 922, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4249, 'Vientiane', 923, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4250, 'Tripoli', 924, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4251, 'Beirut', 925, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4252, 'Monrovia', 926, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4253, 'al-Zawiya', 927, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4254, 'Bengasi', 928, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4255, 'Misrata', 929, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4256, 'Tripoli', 930, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4257, 'Castries', 931, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4258, 'Schaan', 932, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4259, 'Vaduz', 933, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4260, 'Suva', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4261, 'Nyeri', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4262, 'Kathmandu', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4263, 'Lalitapur', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4264, 'Birgunj', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4265, 'San Lorenzo', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4266, 'LambarÃ©', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4267, 'Fernando de la Mora', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4268, 'Kabwe', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4269, 'Kandy', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4270, 'Kampala', 934, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4271, 'Tamale', 935, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4272, 'Jaffna', 935, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4273, 'Sekondi-Takoradi', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4274, 'Pokhara', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4275, 'Freetown', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4276, 'Colombo', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4277, 'Dehiwala', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4278, 'Moratuwa', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4279, 'Sri Jayawardenepura Kotte', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4280, 'Negombo', 936, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4281, 'Maseru', 937, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4282, 'Kaunas', 938, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4283, 'Klaipeda', 939, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4284, 'Panevezys', 940, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4285, 'Vilnius', 941, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4286, 'Å iauliai', 942, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4287, 'Luxembourg [Luxemburg/LÃ«tzebu', 943, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4288, 'Daugavpils', 944, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4289, 'Liepaja', 945, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4290, 'Riga', 946, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4291, 'Macao', 947, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4292, 'Casablanca', 948, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4293, 'Mohammedia', 948, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4294, 'Khouribga', 949, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4295, 'Settat', 949, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4296, 'Safi', 950, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4297, 'El Jadida', 950, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4298, 'FÃ¨s', 951, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4299, 'KÃ©nitra', 952, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4300, 'Marrakech', 953, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4301, 'MeknÃ¨s', 954, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4302, 'Oujda', 955, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4303, 'Nador', 955, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4304, 'Rabat', 956, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4305, 'SalÃ©', 956, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4306, 'TÃ©mara', 956, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4307, 'Agadir', 957, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4308, 'Beni-Mellal', 958, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4309, 'Tanger', 959, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4310, 'TÃ©touan', 959, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4311, 'Ksar el Kebir', 959, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4312, 'El Araich', 959, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4313, 'Taza', 960, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4314, 'South Hill', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4315, 'The Valley', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4316, 'Oranjestad', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4317, 'Douglas', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4318, 'Gibraltar', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4319, 'Tamuning', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4320, 'AgaÃ±a', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4321, 'Flying Fish Cove', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4322, 'Monte-Carlo', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4323, 'Monaco-Ville', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4324, 'Yangor', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4325, 'Yaren', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4326, 'Alofi', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4327, 'Kingston', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4328, 'Adamstown', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4329, 'Singapore', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4330, 'NoumÃ©a', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4331, 'CittÃ  del Vaticano', 961, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4332, 'Balti', 962, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4333, 'Bender (TÃ®ghina)', 963, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4334, 'Chisinau', 964, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4335, 'Tiraspol', 965, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4336, 'Antananarivo', 966, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4337, 'AntsirabÃ©', 966, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4338, 'Fianarantsoa', 967, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4339, 'Mahajanga', 968, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4340, 'Toamasina', 969, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4341, 'Male', 970, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4342, 'Aguascalientes', 971, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4343, 'Tijuana', 972, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4344, 'Mexicali', 972, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4345, 'Ensenada', 972, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4346, 'La Paz', 973, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4347, 'Los Cabos', 973, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4348, 'Campeche', 974, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4349, 'Carmen', 974, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4350, 'Tuxtla GutiÃ©rrez', 975, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4351, 'Tapachula', 975, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4352, 'Ocosingo', 975, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4353, 'San CristÃ³bal de las Casas', 975, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4354, 'ComitÃ¡n de DomÃ­nguez', 975, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4355, 'Las Margaritas', 975, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4356, 'JuÃ¡rez', 976, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4357, 'Chihuahua', 976, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4358, 'CuauhtÃ©moc', 976, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4359, 'Delicias', 976, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4360, 'Hidalgo del Parral', 976, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4361, 'Saltillo', 977, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4362, 'TorreÃ³n', 977, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4363, 'Monclova', 977, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4364, 'Piedras Negras', 977, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4365, 'AcuÃ±a', 977, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4366, 'Matamoros', 977, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4367, 'Colima', 978, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4368, 'Manzanillo', 978, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4369, 'TecomÃ¡n', 978, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4370, 'Buenos Aires', 979, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4371, 'BrasÃ­lia', 979, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4372, 'Ciudad de MÃ©xico', 979, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4373, 'Caracas', 979, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4374, 'Catia La Mar', 979, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4375, 'Durango', 980, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4376, 'GÃ³mez Palacio', 980, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4377, 'Lerdo', 980, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4378, 'LeÃ³n', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4379, 'Irapuato', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4380, 'Celaya', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4381, 'Salamanca', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4382, 'PÃ©njamo', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4383, 'Guanajuato', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4384, 'Allende', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4385, 'Silao', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4386, 'Valle de Santiago', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4387, 'Dolores Hidalgo', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4388, 'AcÃ¡mbaro', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4389, 'San Francisco del RincÃ³n', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4390, 'San Luis de la Paz', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4391, 'San Felipe', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4392, 'Salvatierra', 981, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4393, 'Acapulco de JuÃ¡rez', 982, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4394, 'Chilpancingo de los Bravo', 982, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4395, 'Iguala de la Independencia', 982, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4396, 'Chilapa de Alvarez', 982, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4397, 'Taxco de AlarcÃ³n', 982, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4398, 'JosÃ© Azueta', 982, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4399, 'Pachuca de Soto', 983, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4400, 'Tulancingo de Bravo', 983, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4401, 'Huejutla de Reyes', 983, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4402, 'Guadalajara', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4403, 'Zapopan', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4404, 'Tlaquepaque', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4405, 'TonalÃ¡', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4406, 'Puerto Vallarta', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4407, 'Lagos de Moreno', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4408, 'Tlajomulco de ZÃºÃ±iga', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4409, 'TepatitlÃ¡n de Morelos', 984, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4410, 'Ecatepec de Morelos', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4411, 'NezahualcÃ³yotl', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4412, 'Naucalpan de JuÃ¡rez', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4413, 'Tlalnepantla de Baz', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4414, 'Toluca', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4415, 'ChimalhuacÃ¡n', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4416, 'AtizapÃ¡n de Zaragoza', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4417, 'CuautitlÃ¡n Izcalli', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4418, 'TultitlÃ¡n', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4419, 'Valle de Chalco Solidaridad', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4420, 'Ixtapaluca', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4421, 'NicolÃ¡s Romero', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4422, 'Coacalco de BerriozÃ¡bal', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4423, 'Chalco', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4424, 'La Paz', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4425, 'Texcoco', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4426, 'Metepec', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4427, 'Huixquilucan', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4428, 'San Felipe del Progreso', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4429, 'TecÃ¡mac', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4430, 'Zinacantepec', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4431, 'Ixtlahuaca', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4432, 'Almoloya de JuÃ¡rez', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4433, 'Zumpango', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4434, 'Lerma', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4435, 'Tejupilco', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4436, 'Tultepec', 985, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4437, 'Morelia', 986, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4438, 'Uruapan', 986, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4439, 'LÃ¡zaro CÃ¡rdenas', 986, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4440, 'Zamora', 986, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4441, 'ZitÃ¡cuaro', 986, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4442, 'ApatzingÃ¡n', 986, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4443, 'Hidalgo', 986, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4444, 'Cuernavaca', 987, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4445, 'Jiutepec', 987, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4446, 'Cuautla', 987, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4447, 'Temixco', 987, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4448, 'Tepic', 988, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4449, 'Santiago Ixcuintla', 988, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4450, 'Monterrey', 989, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4451, 'Guadalupe', 989, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4452, 'San NicolÃ¡s de los Garza', 989, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4453, 'Apodaca', 989, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4454, 'General Escobedo', 989, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4455, 'Santa Catarina', 989, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4456, 'San Pedro Garza GarcÃ­a', 989, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4457, 'Oaxaca de JuÃ¡rez', 990, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4458, 'San Juan Bautista Tuxtepec', 990, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4459, 'Puebla', 991, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4460, 'TehuacÃ¡n', 991, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4461, 'San MartÃ­n Texmelucan', 991, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4462, 'Atlixco', 991, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4463, 'San Pedro Cholula', 991, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4464, 'San Juan del RÃ­o', 992, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4465, 'QuerÃ©taro', 993, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4466, 'Benito JuÃ¡rez', 994, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4467, 'OthÃ³n P. Blanco (Chetumal)', 994, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4468, 'San Luis PotosÃ­', 995, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4469, 'Soledad de Graciano SÃ¡nchez', 995, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4470, 'Ciudad Valles', 995, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4471, 'CuliacÃ¡n', 996, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4472, 'MazatlÃ¡n', 996, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4473, 'Ahome', 996, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4474, 'Guasave', 996, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4475, 'Navolato', 996, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4476, 'El Fuerte', 996, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4477, 'Hermosillo', 997, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4478, 'Cajeme', 997, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4479, 'Nogales', 997, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4480, 'San Luis RÃ­o Colorado', 997, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4481, 'Navojoa', 997, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4482, 'Guaymas', 997, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4483, 'Centro (Villahermosa)', 998, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4484, 'CÃ¡rdenas', 998, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4485, 'Comalcalco', 998, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4486, 'Huimanguillo', 998, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4487, 'Macuspana', 998, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4488, 'CunduacÃ¡n', 998, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4489, 'Reynosa', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4490, 'Matamoros', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4491, 'Nuevo Laredo', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4492, 'Tampico', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4493, 'Victoria', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4494, 'Ciudad Madero', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4495, 'Altamira', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4496, 'El Mante', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4497, 'RÃ­o Bravo', 999, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4498, 'Veracruz', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4499, 'Xalapa', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4500, 'Coatzacoalcos', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4501, 'CÃ³rdoba', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4502, 'Papantla', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4503, 'MinatitlÃ¡n', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4504, 'Poza Rica de Hidalgo', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4505, 'San AndrÃ©s Tuxtla', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4506, 'TÃºxpam', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4507, 'MartÃ­nez de la Torre', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4508, 'Orizaba', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4509, 'Temapache', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4510, 'Cosoleacaque', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4511, 'Tantoyuca', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4512, 'PÃ¡nuco', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4513, 'Tierra Blanca', 1000, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4514, 'Boca del RÃ­o', 1001, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4515, 'MÃ©rida', 1002, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4516, 'Fresnillo', 1003, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4517, 'Zacatecas', 1003, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4518, 'Guadalupe', 1003, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4519, 'Dalap-Uliga-Darrit', 1004, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4520, 'Skopje', 1005, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4521, 'Bamako', 1006, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4522, 'Valletta', 1007, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4523, 'Birkirkara', 1008, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4524, 'Bassein (Pathein)', 1009, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4525, 'Henzada (Hinthada)', 1009, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4526, 'Pagakku (Pakokku)', 1010, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4527, 'Mandalay', 1011, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4528, 'Meikhtila', 1011, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4529, 'Myingyan', 1011, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4530, 'Moulmein (Mawlamyine)', 1012, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4531, 'Pegu (Bago)', 1013, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4532, 'Prome (Pyay)', 1013, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4533, 'Sittwe (Akyab)', 1014, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4534, 'Rangoon (Yangon)', 1015, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4535, 'Monywa', 1016, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4536, 'Taunggyi (Taunggye)', 1017, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4537, 'Lashio (Lasho)', 1017, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4538, 'Mergui (Myeik)', 1018, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4539, 'Tavoy (Dawei)', 1018, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4540, 'Ulan Bator', 1019, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4541, 'Garapan', 1020, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4542, 'Xai-Xai', 1021, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4543, 'Gaza', 1021, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4544, 'Maxixe', 1022, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4545, 'Chimoio', 1023, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4546, 'Maputo', 1024, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4547, 'Matola', 1024, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4548, 'Nampula', 1025, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4549, 'NaÃ§ala-Porto', 1025, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4550, 'Beira', 1026, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4551, 'Tete', 1027, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4552, 'Quelimane', 1028, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4553, 'Mocuba', 1028, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4554, 'Gurue', 1028, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4555, 'NouÃ¢dhibou', 1029, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4556, 'Nouakchott', 1030, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4557, 'Plymouth', 1031, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4558, 'Fort-de-France', 1032, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4559, 'Beau Bassin-Rose Hill', 1033, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4560, 'Vacoas-Phoenix', 1033, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4561, 'Port-Louis', 1034, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4562, 'Blantyre', 1035, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4563, 'Lilongwe', 1036, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4564, 'Johor Baharu', 1037, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4565, 'Alor Setar', 1038, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4566, 'Sungai Petani', 1038, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4567, 'Kota Bharu', 1039, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4568, 'Seremban', 1040, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4569, 'Kuantan', 1041, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4570, 'Ipoh', 1042, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4571, 'Taiping', 1042, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4572, 'Pinang', 1043, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4573, 'Sandakan', 1044, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4574, 'Kuching', 1045, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4575, 'Sibu', 1045, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4576, 'Petaling Jaya', 1046, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4577, 'Kelang', 1046, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4578, 'Selayang Baru', 1046, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4579, 'Shah Alam', 1046, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4580, 'Kuala Terengganu', 1047, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4581, 'Kuala Lumpur', 1048, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4582, 'Mamoutzou', 1049, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4583, 'Windhoek', 1050, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4584, 'South Hill', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4585, 'The Valley', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4586, 'Oranjestad', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4587, 'Douglas', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4588, 'Gibraltar', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4589, 'Tamuning', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4590, 'AgaÃ±a', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4591, 'Flying Fish Cove', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4592, 'Monte-Carlo', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4593, 'Monaco-Ville', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4594, 'Yangor', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4595, 'Yaren', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4596, 'Alofi', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4597, 'Kingston', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4598, 'Adamstown', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4599, 'Singapore', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4600, 'NoumÃ©a', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4601, 'CittÃ  del Vaticano', 1051, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4602, 'Maradi', 1052, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4603, 'Niamey', 1053, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4604, 'Zinder', 1054, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4605, 'South Hill', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4606, 'The Valley', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4607, 'Oranjestad', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4608, 'Douglas', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4609, 'Gibraltar', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4610, 'Tamuning', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4611, 'AgaÃ±a', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4612, 'Flying Fish Cove', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4613, 'Monte-Carlo', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4614, 'Monaco-Ville', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4615, 'Yangor', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4616, 'Yaren', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4617, 'Alofi', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4618, 'Kingston', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4619, 'Adamstown', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4620, 'Singapore', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4621, 'NoumÃ©a', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4622, 'CittÃ  del Vaticano', 1055, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4623, 'Onitsha', 1056, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4624, 'Enugu', 1056, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4625, 'Awka', 1056, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4626, 'Kumo', 1057, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4627, 'Deba Habe', 1057, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4628, 'Gombe', 1057, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4629, 'Makurdi', 1058, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4630, 'Maiduguri', 1059, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4631, 'Calabar', 1060, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4632, 'Ugep', 1060, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4633, 'Benin City', 1061, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4634, 'Sapele', 1061, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4635, 'Warri', 1061, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4636, 'Abuja', 1062, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4637, 'Aba', 1063, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4638, 'Zaria', 1064, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4639, 'Kaduna', 1064, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4640, 'Kano', 1065, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4641, 'Katsina', 1066, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4642, 'Ilorin', 1067, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4643, 'Offa', 1067, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4644, 'Lagos', 1068, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4645, 'Mushin', 1068, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4646, 'Ikorodu', 1068, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4647, 'Shomolu', 1068, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4648, 'Agege', 1068, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4649, 'Epe', 1068, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4650, 'Minna', 1069, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4651, 'Bida', 1069, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4652, 'Abeokuta', 1070, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4653, 'Ijebu-Ode', 1070, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4654, 'Shagamu', 1070, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4655, 'Ado-Ekiti', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4656, 'Ikerre', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4657, 'Ilawe-Ekiti', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4658, 'Owo', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4659, 'Ondo', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4660, 'Akure', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4661, 'Oka-Akoko', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4662, 'Ikare', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4663, 'Ise-Ekiti', 1071, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4664, 'Ibadan', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4665, 'Ogbomosho', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4666, 'Oshogbo', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4667, 'Ilesha', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4668, 'Iwo', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4669, 'Ede', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4670, 'Ife', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4671, 'Ila', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4672, 'Oyo', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4673, 'Iseyin', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4674, 'Ilobu', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4675, 'Ikirun', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4676, 'Shaki', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4677, 'Effon-Alaiye', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4678, 'Ikire', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4679, 'Inisa', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4680, 'Igboho', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4681, 'Ejigbo', 1072, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4682, 'Jos', 1073, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4683, 'Lafia', 1073, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4684, 'Port Harcourt', 1074, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4685, 'Sokoto', 1075, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4686, 'Gusau', 1075, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4687, 'Chinandega', 1076, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4688, 'LeÃ³n', 1077, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4689, 'Managua', 1078, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4690, 'Masaya', 1079, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4691, 'South Hill', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4692, 'The Valley', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4693, 'Oranjestad', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4694, 'Douglas', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4695, 'Gibraltar', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4696, 'Tamuning', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4697, 'AgaÃ±a', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4698, 'Flying Fish Cove', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4699, 'Monte-Carlo', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4700, 'Monaco-Ville', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4701, 'Yangor', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4702, 'Yaren', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4703, 'Alofi', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4704, 'Kingston', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4705, 'Adamstown', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4706, 'Singapore', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4707, 'NoumÃ©a', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4708, 'CittÃ  del Vaticano', 1080, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4709, 'Emmen', 1081, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4710, 'Almere', 1082, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4711, 'Apeldoorn', 1083, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4712, 'Nijmegen', 1083, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4713, 'Arnhem', 1083, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4714, 'Ede', 1083, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4715, 'Groningen', 1084, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4716, 'Maastricht', 1085, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4717, 'Heerlen', 1085, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4718, 'Eindhoven', 1086, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4719, 'Tilburg', 1086, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4720, 'Breda', 1086, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4721, 'Â´s-Hertogenbosch', 1086, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4722, 'Amsterdam', 1087, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4723, 'Haarlem', 1087, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4724, 'Zaanstad', 1087, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4725, 'Haarlemmermeer', 1087, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4726, 'Alkmaar', 1087, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4727, 'Enschede', 1088, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4728, 'Zwolle', 1088, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4729, 'Utrecht', 1089, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4730, 'Amersfoort', 1089, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4731, 'Rotterdam', 1090, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4732, 'Haag', 1090, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4733, 'Dordrecht', 1090, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4734, 'Leiden', 1090, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4735, 'Zoetermeer', 1090, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4736, 'Delft', 1090, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4737, 'BÃ¦rum', 1091, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4738, 'Bergen', 1092, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4739, 'Oslo', 1093, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4740, 'Stavanger', 1094, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4741, 'Trondheim', 1095, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4742, 'Suva', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4743, 'Nyeri', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4744, 'Kathmandu', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4745, 'Lalitapur', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4746, 'Birgunj', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4747, 'San Lorenzo', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4748, 'LambarÃ©', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4749, 'Fernando de la Mora', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4750, 'Kabwe', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4751, 'Kandy', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4752, 'Kampala', 1096, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4753, 'Machakos', 1097, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4754, 'Meru', 1097, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4755, 'Biratnagar', 1097, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4756, 'Sekondi-Takoradi', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4757, 'Pokhara', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4758, 'Freetown', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4759, 'Colombo', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4760, 'Dehiwala', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4761, 'Moratuwa', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4762, 'Sri Jayawardenepura Kotte', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4763, 'Negombo', 1098, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4764, 'South Hill', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4765, 'The Valley', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4766, 'Oranjestad', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4767, 'Douglas', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4768, 'Gibraltar', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4769, 'Tamuning', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4770, 'AgaÃ±a', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4771, 'Flying Fish Cove', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4772, 'Monte-Carlo', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4773, 'Monaco-Ville', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4774, 'Yangor', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4775, 'Yaren', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4776, 'Alofi', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4777, 'Kingston', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4778, 'Adamstown', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4779, 'Singapore', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4780, 'NoumÃ©a', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4781, 'CittÃ  del Vaticano', 1099, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4782, 'Auckland', 1100, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4783, 'Manukau', 1100, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4784, 'North Shore', 1100, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4785, 'Waitakere', 1100, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4786, 'Christchurch', 1101, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4787, 'Dunedin', 1102, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4788, 'Hamilton', 1103, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4789, 'Hamilton', 1103, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4790, 'Wellington', 1104, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4791, 'Lower Hutt', 1104, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4792, 'Suhar', 1105, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4793, 'al-Sib', 1106, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4794, 'Bawshar', 1106, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4795, 'Masqat', 1106, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4796, 'Salala', 1107, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4797, 'Quetta', 1108, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4798, 'Khuzdar', 1108, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4799, 'Islamabad', 1109, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4800, 'Peshawar', 1110, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4801, 'Mardan', 1110, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4802, 'Mingora', 1110, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4803, 'Kohat', 1110, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4804, 'Abottabad', 1110, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4805, 'Dera Ismail Khan', 1110, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4806, 'Nowshera', 1110, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4807, 'Ludhiana', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4808, 'Amritsar', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4809, 'Jalandhar (Jullundur)', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4810, 'Patiala', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1);
INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(4811, 'Bhatinda (Bathinda)', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4812, 'Pathankot', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4813, 'Hoshiarpur', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4814, 'Moga', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4815, 'Abohar', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4816, 'Lahore', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4817, 'Faisalabad', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4818, 'Rawalpindi', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4819, 'Multan', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4820, 'Gujranwala', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4821, 'Sargodha', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4822, 'Sialkot', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4823, 'Bahawalpur', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4824, 'Jhang', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4825, 'Sheikhupura', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4826, 'Gujrat', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4827, 'Kasur', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4828, 'Rahim Yar Khan', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4829, 'Sahiwal', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4830, 'Okara', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4831, 'Wah', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4832, 'Dera Ghazi Khan', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4833, 'Chiniot', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4834, 'Kamoke', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4835, 'Mandi Burewala', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4836, 'Jhelum', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4837, 'Sadiqabad', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4838, 'Khanewal', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4839, 'Hafizabad', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4840, 'Muzaffargarh', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4841, 'Khanpur', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4842, 'Gojra', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4843, 'Bahawalnagar', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4844, 'Muridke', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4845, 'Pak Pattan', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4846, 'Jaranwala', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4847, 'Chishtian Mandi', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4848, 'Daska', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4849, 'Mandi Bahauddin', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4850, 'Ahmadpur East', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4851, 'Kamalia', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4852, 'Vihari', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4853, 'Wazirabad', 1111, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4854, 'Mirpur Khas', 1112, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4855, 'Nawabshah', 1112, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4856, 'Jacobabad', 1112, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4857, 'Shikarpur', 1112, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4858, 'Tando Adam', 1112, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4859, 'Khairpur', 1112, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4860, 'Dadu', 1112, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4861, 'Karachi', 1113, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4862, 'Hyderabad', 1113, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4863, 'Sukkur', 1113, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4864, 'Larkana', 1113, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4865, 'Ciudad de PanamÃ¡', 1114, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4866, 'San Miguelito', 1115, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4867, 'South Hill', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4868, 'The Valley', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4869, 'Oranjestad', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4870, 'Douglas', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4871, 'Gibraltar', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4872, 'Tamuning', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4873, 'AgaÃ±a', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4874, 'Flying Fish Cove', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4875, 'Monte-Carlo', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4876, 'Monaco-Ville', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4877, 'Yangor', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4878, 'Yaren', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4879, 'Alofi', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4880, 'Kingston', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4881, 'Adamstown', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4882, 'Singapore', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4883, 'NoumÃ©a', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4884, 'CittÃ  del Vaticano', 1116, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4885, 'Chimbote', 1117, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4886, 'Arequipa', 1118, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4887, 'Ayacucho', 1119, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4888, 'Cajamarca', 1120, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4889, 'Callao', 1121, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4890, 'Ventanilla', 1121, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4891, 'Cusco', 1122, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4892, 'HuÃ¡nuco', 1123, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4893, 'Ica', 1124, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4894, 'Chincha Alta', 1124, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4895, 'Huancayo', 1125, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4896, 'Nueva San Salvador', 1126, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4897, 'Trujillo', 1126, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4898, 'Chiclayo', 1127, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4899, 'Lima', 1128, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4900, 'Iquitos', 1129, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4901, 'Piura', 1130, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4902, 'Sullana', 1130, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4903, 'Castilla', 1130, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4904, 'Juliaca', 1131, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4905, 'Puno', 1131, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4906, 'Tacna', 1132, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4907, 'Pucallpa', 1133, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4908, 'Sultan Kudarat', 1134, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4909, 'Legazpi', 1135, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4910, 'Naga', 1135, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4911, 'Tabaco', 1135, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4912, 'Daraga (Locsin)', 1135, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4913, 'Sorsogon', 1135, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4914, 'Ligao', 1135, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4915, 'Tuguegarao', 1136, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4916, 'Ilagan', 1136, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4917, 'Santiago', 1136, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4918, 'Cauayan', 1136, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4919, 'Baguio', 1137, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4920, 'Butuan', 1138, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4921, 'Surigao', 1138, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4922, 'Bislig', 1138, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4923, 'Bayugan', 1138, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4924, 'San JosÃ© del Monte', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4925, 'Angeles', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4926, 'Tarlac', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4927, 'Cabanatuan', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4928, 'San Fernando', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4929, 'Olongapo', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4930, 'Malolos', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4931, 'Mabalacat', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4932, 'Meycauayan', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4933, 'Santa Maria', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4934, 'Lubao', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4935, 'San Miguel', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4936, 'Baliuag', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4937, 'Concepcion', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4938, 'Hagonoy', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4939, 'Mexico', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4940, 'San Jose', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4941, 'Arayat', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4942, 'Marilao', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4943, 'Talavera', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4944, 'Guagua', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4945, 'Capas', 1139, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4946, 'Iligan', 1140, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4947, 'Cotabato', 1140, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4948, 'Marawi', 1140, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4949, 'Midsayap', 1140, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4950, 'Kidapawan', 1140, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4951, 'Cebu', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4952, 'Mandaue', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4953, 'Lapu-Lapu', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4954, 'Talisay', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4955, 'Toledo', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4956, 'Dumaguete', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4957, 'Bayawan (Tulong)', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4958, 'Danao', 1141, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4959, 'Tacloban', 1142, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4960, 'Ormoc', 1142, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4961, 'Calbayog', 1142, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4962, 'Baybay', 1142, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4963, 'San Carlos', 1143, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4964, 'Dagupan', 1143, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4965, 'Malasiqui', 1143, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4966, 'Urdaneta', 1143, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4967, 'San Fernando', 1143, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4968, 'Bayambang', 1143, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4969, 'Laoag', 1143, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4970, 'Quezon', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4971, 'Manila', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4972, 'Kalookan', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4973, 'Pasig', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4974, 'Valenzuela', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4975, 'Las PiÃ±as', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4976, 'Taguig', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4977, 'ParaÃ±aque', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4978, 'Makati', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4979, 'Marikina', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4980, 'Muntinlupa', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4981, 'Pasay', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4982, 'Malabon', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4983, 'Mandaluyong', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4984, 'Navotas', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4985, 'San Juan del Monte', 1144, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4986, 'Cagayan de Oro', 1145, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4987, 'Valencia', 1145, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4988, 'Malaybalay', 1145, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4989, 'Ozamis', 1145, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4990, 'Gingoog', 1145, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4991, 'Davao', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4992, 'General Santos', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4993, 'Tagum', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4994, 'Panabo', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4995, 'Koronadal', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4996, 'Digos', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4997, 'Polomolok', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4998, 'Mati', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(4999, 'Malita', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5000, 'Malungon', 1146, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5001, 'Antipolo', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5002, 'DasmariÃ±as', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5003, 'Bacoor', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5004, 'Calamba', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5005, 'Batangas', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5006, 'Cainta', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5007, 'San Pedro', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5008, 'Lipa', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5009, 'San Pablo', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5010, 'BiÃ±an', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5011, 'Taytay', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5012, 'Lucena', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5013, 'Imus', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5014, 'Binangonan', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5015, 'Santa Rosa', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5016, 'Puerto Princesa', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5017, 'Silang', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5018, 'San Mateo', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5019, 'Tanauan', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5020, 'Rodriguez (Montalban)', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5021, 'Sariaya', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5022, 'General Mariano Alvarez', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5023, 'San Jose', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5024, 'Tanza', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5025, 'General Trias', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5026, 'Cabuyao', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5027, 'Calapan', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5028, 'Cavite', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5029, 'Nasugbu', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5030, 'Santa Cruz', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5031, 'Candelaria', 1147, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5032, 'Zamboanga', 1148, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5033, 'Pagadian', 1148, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5034, 'Dipolog', 1148, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5035, 'Bacolod', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5036, 'Iloilo', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5037, 'Kabankalan', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5038, 'Cadiz', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5039, 'Bago', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5040, 'Sagay', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5041, 'Roxas', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5042, 'San Carlos', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5043, 'Silay', 1149, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5044, 'Koror', 1150, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5045, 'Port Moresby', 1151, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5046, 'Wroclaw', 1152, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5047, 'Walbrzych', 1152, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5048, 'Legnica', 1152, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5049, 'Jelenia GÃ³ra', 1152, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5050, 'Bydgoszcz', 1153, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5051, 'Torun', 1153, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5052, 'Wloclawek', 1153, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5053, 'Grudziadz', 1153, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5054, 'LÃ³dz', 1154, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5055, 'Lublin', 1155, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5056, 'GorzÃ³w Wielkopolski', 1156, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5057, 'Zielona GÃ³ra', 1156, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5058, 'KrakÃ³w', 1157, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5059, 'TarnÃ³w', 1157, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5060, 'Warszawa', 1158, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5061, 'Radom', 1158, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5062, 'Plock', 1158, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5063, 'Opole', 1159, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5064, 'RzeszÃ³w', 1160, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5065, 'Bialystok', 1161, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5066, 'Gdansk', 1162, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5067, 'Gdynia', 1162, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5068, 'Slupsk', 1162, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5069, 'Katowice', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5070, 'Czestochowa', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5071, 'Sosnowiec', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5072, 'Gliwice', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5073, 'Bytom', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5074, 'Zabrze', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5075, 'Bielsko-Biala', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5076, 'Ruda Slaska', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5077, 'Rybnik', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5078, 'Tychy', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5079, 'Dabrowa GÃ³rnicza', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5080, 'ChorzÃ³w', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5081, 'Jastrzebie-ZdrÃ³j', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5082, 'Jaworzno', 1163, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5083, 'Kielce', 1164, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5084, 'Olsztyn', 1165, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5085, 'Elblag', 1165, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5086, 'Poznan', 1166, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5087, 'Kalisz', 1166, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5088, 'Szczecin', 1167, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5089, 'Koszalin', 1167, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5090, 'Arecibo', 1168, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5091, 'BayamÃ³n', 1169, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5092, 'Caguas', 1170, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5093, 'Carolina', 1171, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5094, 'Guaynabo', 1172, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5095, 'MayagÃ¼ez', 1173, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5096, 'Ponce', 1174, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5097, 'San Juan', 1175, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5098, 'San Juan', 1175, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5099, 'Toa Baja', 1176, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5100, 'Kanggye', 1177, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5101, 'Hamhung', 1178, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5102, 'Chongjin', 1179, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5103, 'Kimchaek', 1179, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5104, 'Haeju', 1180, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5105, 'Sariwon', 1181, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5106, 'Kaesong', 1182, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5107, 'Wonsan', 1183, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5108, 'Nampo', 1184, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5109, 'Phyongsong', 1185, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5110, 'Sinuiju', 1186, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5111, 'Pyongyang', 1187, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5112, 'Hyesan', 1188, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5113, 'Braga', 1189, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5114, 'CoÃ­mbra', 1190, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5115, 'Lisboa', 1191, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5116, 'Amadora', 1191, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5117, 'Stockholm', 1191, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5118, 'Porto', 1192, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5119, 'Ciudad del Este', 1193, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5120, 'AsunciÃ³n', 1194, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5121, 'Suva', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5122, 'Nyeri', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5123, 'Kathmandu', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5124, 'Lalitapur', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5125, 'Birgunj', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5126, 'San Lorenzo', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5127, 'LambarÃ©', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5128, 'Fernando de la Mora', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5129, 'Kabwe', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5130, 'Kandy', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5131, 'Kampala', 1195, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5132, 'Xai-Xai', 1196, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5133, 'Gaza', 1196, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5134, 'Hebron', 1197, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5135, 'Khan Yunis', 1198, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5136, 'Nablus', 1199, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5137, 'Jabaliya', 1200, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5138, 'Rafah', 1201, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5139, 'Faaa', 1202, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5140, 'Papeete', 1202, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5141, 'Doha', 1203, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5142, 'Saint-Denis', 1204, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5143, 'Arad', 1205, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5144, 'Pitesti', 1206, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5145, 'Bacau', 1207, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5146, 'Oradea', 1208, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5147, 'Botosani', 1209, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5148, 'Braila', 1210, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5149, 'Brasov', 1211, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5150, 'Bucuresti', 1212, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5151, 'Buzau', 1213, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5152, 'Resita', 1214, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5153, 'Cluj-Napoca', 1215, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5154, 'Constanta', 1216, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5155, 'TÃ¢rgoviste', 1217, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5156, 'Craiova', 1218, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5157, 'Galati', 1219, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5158, 'TÃ¢rgu Jiu', 1220, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5159, 'Iasi', 1221, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5160, 'Baia Mare', 1222, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5161, 'Drobeta-Turnu Severin', 1223, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5162, 'TÃ¢rgu Mures', 1224, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5163, 'Piatra Neamt', 1225, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5164, 'Ploiesti', 1226, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5165, 'Satu Mare', 1227, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5166, 'Sibiu', 1228, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5167, 'Suceava', 1229, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5168, 'Timisoara', 1230, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5169, 'Tulcea', 1231, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5170, 'RÃ¢mnicu VÃ¢lcea', 1232, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5171, 'Focsani', 1233, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5172, 'Maikop', 1234, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5173, 'Barnaul', 1235, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5174, 'Bijsk', 1235, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5175, 'Rubtsovsk', 1235, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5176, 'BlagoveÅ¡tÅ¡ensk', 1236, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5177, 'Arkangeli', 1237, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5178, 'Severodvinsk', 1237, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5179, 'Astrahan', 1238, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5180, 'Ufa', 1239, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5181, 'Sterlitamak', 1239, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5182, 'Salavat', 1239, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5183, 'Neftekamsk', 1239, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5184, 'Oktjabrski', 1239, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5185, 'Belgorod', 1240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5186, 'Staryi Oskol', 1240, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5187, 'Brjansk', 1241, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5188, 'Ulan-Ude', 1242, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5189, 'MahatÅ¡kala', 1243, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5190, 'Derbent', 1243, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5191, 'Habarovsk', 1244, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5192, 'Komsomolsk-na-Amure', 1244, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5193, 'Abakan', 1245, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5194, 'Surgut', 1246, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5195, 'Niznevartovsk', 1246, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5196, 'Neftejugansk', 1246, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5197, 'Irkutsk', 1247, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5198, 'Bratsk', 1247, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5199, 'Angarsk', 1247, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5200, 'Ust-Ilimsk', 1247, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5201, 'Usolje-Sibirskoje', 1247, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5202, 'Ivanovo', 1248, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5203, 'KineÅ¡ma', 1248, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5204, 'Jaroslavl', 1249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5205, 'Rybinsk', 1249, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5206, 'NaltÅ¡ik', 1250, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5207, 'Kaliningrad', 1251, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5208, 'Elista', 1252, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5209, 'Kaluga', 1253, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5210, 'Obninsk', 1253, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5211, 'Petropavlovsk-KamtÅ¡atski', 1254, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5212, 'TÅ¡erkessk', 1255, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5213, 'Petroskoi', 1256, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5214, 'Novokuznetsk', 1257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5215, 'Kemerovo', 1257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5216, 'Prokopjevsk', 1257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5217, 'Leninsk-Kuznetski', 1257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5218, 'Kiseljovsk', 1257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5219, 'MezduretÅ¡ensk', 1257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5220, 'Anzero-Sudzensk', 1257, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5221, 'Kirov', 1258, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5222, 'Kirovo-TÅ¡epetsk', 1258, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5223, 'Syktyvkar', 1259, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5224, 'Uhta', 1259, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5225, 'Vorkuta', 1259, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5226, 'Kostroma', 1260, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5227, 'Krasnodar', 1261, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5228, 'SotÅ¡i', 1261, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5229, 'Novorossijsk', 1261, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5230, 'Armavir', 1261, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5231, 'Krasnojarsk', 1262, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5232, 'Norilsk', 1262, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5233, 'AtÅ¡insk', 1262, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5234, 'Kansk', 1262, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5235, 'Zeleznogorsk', 1262, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5236, 'Kurgan', 1263, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5237, 'Kursk', 1264, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5238, 'Zeleznogorsk', 1264, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5239, 'Lipetsk', 1265, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5240, 'Jelets', 1265, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5241, 'Magadan', 1266, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5242, 'JoÅ¡kar-Ola', 1267, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5243, 'Saransk', 1268, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5244, 'Moscow', 1269, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5245, 'Zelenograd', 1269, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5246, 'Podolsk', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5247, 'Ljubertsy', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5248, 'MytiÅ¡tÅ¡i', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5249, 'Kolomna', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5250, 'Elektrostal', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5251, 'Himki', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5252, 'BalaÅ¡iha', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5253, 'Korolev', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5254, 'Serpuhov', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5255, 'Odintsovo', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5256, 'Orehovo-Zujevo', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5257, 'Noginsk', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5258, 'Sergijev Posad', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5259, 'Å tÅ¡olkovo', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5260, 'Zeleznodoroznyi', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5261, 'Zukovski', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5262, 'Krasnogorsk', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5263, 'Klin', 1270, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5264, 'Murmansk', 1271, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5265, 'Nizni Novgorod', 1272, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5266, 'Dzerzinsk', 1272, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5267, 'Arzamas', 1272, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5268, 'Vladikavkaz', 1273, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5269, 'Veliki Novgorod', 1274, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5270, 'Novosibirsk', 1275, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5271, 'Omsk', 1276, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5272, 'Orenburg', 1277, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5273, 'Orsk', 1277, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5274, 'Novotroitsk', 1277, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5275, 'Orjol', 1278, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5276, 'Penza', 1279, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5277, 'Kuznetsk', 1279, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5278, 'Perm', 1280, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5279, 'Berezniki', 1280, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5280, 'Solikamsk', 1280, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5281, 'TÅ¡aikovski', 1280, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5282, 'St Petersburg', 1281, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5283, 'Kolpino', 1281, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5284, 'PuÅ¡kin', 1281, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5285, 'Pihkova', 1282, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5286, 'Velikije Luki', 1282, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5287, 'Vladivostok', 1283, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5288, 'Nahodka', 1283, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5289, 'Ussurijsk', 1283, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5290, 'Rjazan', 1284, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5291, 'Rostov-na-Donu', 1285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5292, 'Taganrog', 1285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5293, 'Å ahty', 1285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5294, 'NovotÅ¡erkassk', 1285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5295, 'Volgodonsk', 1285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5296, 'NovoÅ¡ahtinsk', 1285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5297, 'Bataisk', 1285, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5298, 'Jakutsk', 1286, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5299, 'Juzno-Sahalinsk', 1287, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5300, 'Samara', 1288, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5301, 'Toljatti', 1288, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5302, 'Syzran', 1288, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5303, 'NovokuibyÅ¡evsk', 1288, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5304, 'Saratov', 1289, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5305, 'Balakovo', 1289, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5306, 'Engels', 1289, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5307, 'BalaÅ¡ov', 1289, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5308, 'Smolensk', 1290, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5309, 'Stavropol', 1291, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5310, 'Nevinnomyssk', 1291, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5311, 'Pjatigorsk', 1291, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5312, 'Kislovodsk', 1291, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5313, 'Jessentuki', 1291, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5314, 'Jekaterinburg', 1292, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5315, 'Nizni Tagil', 1292, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5316, 'Kamensk-Uralski', 1292, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5317, 'Pervouralsk', 1292, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5318, 'Serov', 1292, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5319, 'Novouralsk', 1292, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5320, 'Tambov', 1293, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5321, 'MitÅ¡urinsk', 1293, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5322, 'Kazan', 1294, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5323, 'Nabereznyje TÅ¡elny', 1294, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5324, 'Niznekamsk', 1294, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5325, 'Almetjevsk', 1294, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5326, 'Zelenodolsk', 1294, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5327, 'Bugulma', 1294, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5328, 'Tjumen', 1295, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5329, 'Tobolsk', 1295, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5330, 'Tomsk', 1296, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5331, 'Seversk', 1296, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5332, 'Tula', 1297, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5333, 'Novomoskovsk', 1297, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5334, 'Tver', 1298, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5335, 'Kyzyl', 1299, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5336, 'TÅ¡eljabinsk', 1300, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5337, 'Magnitogorsk', 1300, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5338, 'Zlatoust', 1300, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5339, 'Miass', 1300, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5340, 'Grozny', 1301, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5341, 'TÅ¡ita', 1302, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5342, 'TÅ¡eboksary', 1303, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5343, 'NovotÅ¡eboksarsk', 1303, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5344, 'Izevsk', 1304, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5345, 'Glazov', 1304, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5346, 'Sarapul', 1304, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5347, 'Votkinsk', 1304, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5348, 'Uljanovsk', 1305, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5349, 'Dimitrovgrad', 1305, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5350, 'Vladimir', 1306, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5351, 'Kovrov', 1306, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5352, 'Murom', 1306, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5353, 'Volgograd', 1307, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5354, 'Volzski', 1307, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5355, 'KamyÅ¡in', 1307, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5356, 'TÅ¡erepovets', 1308, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5357, 'Vologda', 1308, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5358, 'Voronez', 1309, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5359, 'Nojabrsk', 1310, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5360, 'Novyi Urengoi', 1310, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5361, 'Kigali', 1311, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5362, 'AraÂ´ar', 1312, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5363, 'Burayda', 1313, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5364, 'Zagazig', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5365, 'Bilbays', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5366, 'al-Dammam', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5367, 'al-Hufuf', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5368, 'al-Mubarraz', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5369, 'al-Khubar', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5370, 'Jubayl', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5371, 'Hafar al-Batin', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5372, 'al-Tuqba', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5373, 'al-Qatif', 1314, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5374, 'Khamis Mushayt', 1315, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5375, 'Abha', 1315, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5376, 'Hail', 1316, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5377, 'Medina', 1317, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5378, 'Yanbu', 1317, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5379, 'Jedda', 1318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5380, 'Mekka', 1318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5381, 'al-Taif', 1318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5382, 'al-Hawiya', 1318, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5383, 'Najran', 1319, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5384, 'Unayza', 1320, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5385, 'al-Kharj', 1321, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5386, 'Riyadh', 1322, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5387, 'Tabuk', 1323, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5388, 'Kusti', 1324, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5389, 'Port Sudan', 1325, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5390, 'Wad Madani', 1326, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5391, 'al-Qadarif', 1327, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5392, 'Juba', 1328, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5393, 'Nyala', 1329, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5394, 'al-Fashir', 1330, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5395, 'Kassala', 1331, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5396, 'Omdurman', 1332, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5397, 'Khartum', 1332, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5398, 'Sharq al-Nil', 1332, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5399, 'Obeid', 1333, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5400, 'Pikine', 1334, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5401, 'Dakar', 1334, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5402, 'Rufisque', 1334, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5403, 'Diourbel', 1335, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5404, 'Kaolack', 1336, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5405, 'Saint-Louis', 1337, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5406, 'ThiÃ¨s', 1338, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5407, 'Mbour', 1338, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5408, 'Ziguinchor', 1339, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5409, 'South Hill', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5410, 'The Valley', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5411, 'Oranjestad', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5412, 'Douglas', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5413, 'Gibraltar', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5414, 'Tamuning', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5415, 'AgaÃ±a', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5416, 'Flying Fish Cove', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5417, 'Monte-Carlo', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5418, 'Monaco-Ville', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5419, 'Yangor', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5420, 'Yaren', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5421, 'Alofi', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5422, 'Kingston', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5423, 'Adamstown', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5424, 'Singapore', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5425, 'NoumÃ©a', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5426, 'CittÃ  del Vaticano', 1340, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5427, 'Jamestown', 1341, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5428, 'Longyearbyen', 1342, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5429, 'Honiara', 1343, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5430, 'Sekondi-Takoradi', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5431, 'Pokhara', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5432, 'Freetown', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5433, 'Colombo', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5434, 'Dehiwala', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5435, 'Moratuwa', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5436, 'Sri Jayawardenepura Kotte', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5437, 'Negombo', 1344, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1);
INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(5438, 'Nueva San Salvador', 1345, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5439, 'Trujillo', 1345, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5440, 'San Miguel', 1346, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5441, 'San Salvador', 1347, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5442, 'Mejicanos', 1347, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5443, 'Soyapango', 1347, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5444, 'Apopa', 1347, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5445, 'Santa Ana', 1348, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5446, 'San Marino', 1349, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5447, 'Serravalle', 1350, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5448, 'Mogadishu', 1351, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5449, 'Kismaayo', 1352, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5450, 'Hargeysa', 1353, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5451, 'Saint-Pierre', 1354, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5452, 'SÃ£o TomÃ©', 1355, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5453, 'Paramaribo', 1356, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5454, 'Bratislava', 1357, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5455, 'KoÅ¡ice', 1358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5456, 'PreÅ¡ov', 1358, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5457, 'Ljubljana', 1359, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5458, 'Maribor', 1360, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5459, 'Ã–rebro', 1361, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5460, 'LinkÃ¶ping', 1362, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5461, 'NorrkÃ¶ping', 1362, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5462, 'GÃ¤vle', 1363, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5463, 'JÃ¶nkÃ¶ping', 1364, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5464, 'Lisboa', 1365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5465, 'Amadora', 1365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5466, 'Stockholm', 1365, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5467, 'MalmÃ¶', 1366, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5468, 'Helsingborg', 1366, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5469, 'Lund', 1366, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5470, 'Uppsala', 1367, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5471, 'UmeÃ¥', 1368, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5472, 'Sundsvall', 1369, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5473, 'VÃ¤sterÃ¥s', 1370, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5474, 'Gothenburg [GÃ¶teborg]', 1371, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5475, 'BorÃ¥s', 1371, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5476, 'Mbabane', 1372, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5477, 'Victoria', 1373, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5478, 'al-Qamishliya', 1374, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5479, 'al-Raqqa', 1375, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5480, 'Aleppo', 1376, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5481, 'Damascus', 1377, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5482, 'Jaramana', 1378, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5483, 'Duma', 1378, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5484, 'Dayr al-Zawr', 1379, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5485, 'Hama', 1380, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5486, 'Hims', 1381, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5487, 'Idlib', 1382, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5488, 'Latakia', 1383, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5489, 'Cockburn Town', 1384, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5490, 'NÂ´DjamÃ©na', 1385, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5491, 'Moundou', 1386, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5492, 'LomÃ©', 1387, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5493, 'Bangkok', 1388, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5494, 'Chiang Mai', 1389, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5495, 'Khon Kaen', 1390, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5496, 'Nakhon Pathom', 1391, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5497, 'Nakhon Ratchasima', 1392, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5498, 'Nakhon Sawan', 1393, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5499, 'Nonthaburi', 1394, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5500, 'Pak Kret', 1394, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5501, 'Hat Yai', 1395, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5502, 'Songkhla', 1395, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5503, 'Ubon Ratchathani', 1396, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5504, 'Udon Thani', 1397, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5505, 'Dushanbe', 1398, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5506, 'Khujand', 1399, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5507, 'Fakaofo', 1400, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5508, 'Ashgabat', 1401, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5509, 'Dashhowuz', 1402, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5510, 'ChÃ¤rjew', 1403, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5511, 'Mary', 1404, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5512, 'Dili', 1405, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5513, 'NukuÂ´alofa', 1406, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5514, 'Chaguanas', 1407, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5515, 'Port-of-Spain', 1408, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5516, 'Ariana', 1409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5517, 'Ettadhamen', 1409, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5518, 'Biserta', 1410, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5519, 'GabÃ¨s', 1411, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5520, 'Kairouan', 1412, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5521, 'Sfax', 1413, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5522, 'Sousse', 1414, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5523, 'Tunis', 1415, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5524, 'Adana', 1416, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5525, 'Tarsus', 1416, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5526, 'Ceyhan', 1416, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5527, 'Adiyaman', 1417, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5528, 'Afyon', 1418, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5529, 'Aksaray', 1419, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5530, 'Ankara', 1420, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5531, 'Antalya', 1421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5532, 'Alanya', 1421, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5533, 'Aydin', 1422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5534, 'Nazilli', 1422, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5535, 'Ã‡orum', 1423, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5536, 'Balikesir', 1424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5537, 'Bandirma', 1424, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5538, 'Batman', 1425, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5539, 'Bursa', 1426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5540, 'InegÃ¶l', 1426, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5541, 'Denizli', 1427, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5542, 'Diyarbakir', 1428, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5543, 'Bismil', 1428, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5544, 'Edirne', 1429, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5545, 'ElÃ¢zig', 1430, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5546, 'Erzincan', 1431, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5547, 'Erzurum', 1432, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5548, 'Eskisehir', 1433, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5549, 'Gaziantep', 1434, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5550, 'Iskenderun', 1435, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5551, 'Hatay (Antakya)', 1435, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5552, 'Mersin (IÃ§el)', 1436, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5553, 'Isparta', 1437, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5554, 'Istanbul', 1438, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5555, 'Sultanbeyli', 1438, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5556, 'Izmir', 1439, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5557, 'Kahramanmaras', 1440, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5558, 'KarabÃ¼k', 1441, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5559, 'Karaman', 1442, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5560, 'Kars', 1443, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5561, 'Kayseri', 1444, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5562, 'KÃ¼tahya', 1445, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5563, 'Kilis', 1446, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5564, 'Kirikkale', 1447, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5565, 'Gebze', 1448, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5566, 'Izmit (Kocaeli)', 1448, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5567, 'Konya', 1449, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5568, 'Malatya', 1450, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5569, 'Manisa', 1451, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5570, 'Kiziltepe', 1452, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5571, 'Ordu', 1453, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5572, 'Osmaniye', 1454, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5573, 'Sakarya (Adapazari)', 1455, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5574, 'Samsun', 1456, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5575, 'Sanliurfa', 1457, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5576, 'Viransehir', 1457, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5577, 'Siirt', 1458, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5578, 'Sivas', 1459, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5579, 'Ã‡orlu', 1460, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5580, 'Tekirdag', 1460, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5581, 'Tokat', 1461, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5582, 'Trabzon', 1462, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5583, 'Usak', 1463, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5584, 'Van', 1464, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5585, 'Zonguldak', 1465, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5586, 'Funafuti', 1466, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5587, 'Taiping', 1467, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5588, 'Taliao', 1467, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5589, 'Kueishan', 1467, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5590, 'Ciudad Losada', 1467, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5591, 'Changhwa', 1468, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5592, 'Yuanlin', 1468, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5593, 'Chiayi', 1469, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5594, 'Hsinchu', 1470, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5595, 'Hualien', 1471, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5596, 'Ilan', 1472, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5597, 'Kaohsiung', 1473, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5598, 'Fengshan', 1473, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5599, 'Kangshan', 1473, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5600, 'Keelung (Chilung)', 1474, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5601, 'Miaoli', 1475, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5602, 'Nantou', 1476, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5603, 'Tsaotun', 1476, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5604, 'Pingtung', 1477, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5605, 'Taichung', 1478, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5606, 'Tali', 1478, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5607, 'Fengyuan', 1478, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5608, 'Tainan', 1479, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5609, 'Yungkang', 1479, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5610, 'Taipei', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5611, 'Panchiao', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5612, 'Chungho', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5613, 'Sanchung', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5614, 'Hsinchuang', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5615, 'Hsintien', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5616, 'Yungho', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5617, 'Tucheng', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5618, 'Luchou', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5619, 'Hsichuh', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5620, 'Shulin', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5621, 'Tanshui', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5622, 'Lungtan', 1480, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5623, 'Taitung', 1481, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5624, 'Chungli', 1482, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5625, 'Taoyuan', 1482, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5626, 'Pingchen', 1482, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5627, 'Pate', 1482, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5628, 'Yangmei', 1482, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5629, 'Touliu', 1483, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5630, 'Arusha', 1484, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5631, 'Dar es Salaam', 1485, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5632, 'Dodoma', 1486, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5633, 'Moshi', 1487, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5634, 'Mbeya', 1488, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5635, 'Morogoro', 1489, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5636, 'Mwanza', 1490, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5637, 'Tabora', 1491, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5638, 'Tanga', 1492, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5639, 'Zanzibar', 1493, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5640, 'Suva', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5641, 'Nyeri', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5642, 'Kathmandu', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5643, 'Lalitapur', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5644, 'Birgunj', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5645, 'San Lorenzo', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5646, 'LambarÃ©', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5647, 'Fernando de la Mora', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5648, 'Kabwe', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5649, 'Kandy', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5650, 'Kampala', 1494, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5651, 'Dnipropetrovsk', 1495, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5652, 'Kryvyi Rig', 1495, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5653, 'Dniprodzerzynsk', 1495, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5654, 'Nikopol', 1495, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5655, 'Pavlograd', 1495, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5656, 'Donetsk', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5657, 'Mariupol', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5658, 'Makijivka', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5659, 'Gorlivka', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5660, 'Kramatorsk', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5661, 'Slovjansk', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5662, 'Jenakijeve', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5663, 'Kostjantynivka', 1496, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5664, 'Harkova [Harkiv]', 1497, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5665, 'Herson', 1498, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5666, 'Hmelnytskyi', 1499, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5667, 'Kamjanets-Podilskyi', 1499, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5668, 'Ivano-Frankivsk', 1500, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5669, 'Kyiv', 1501, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5670, 'Bila Tserkva', 1501, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5671, 'Brovary', 1501, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5672, 'Kirovograd', 1502, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5673, 'Oleksandrija', 1502, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5674, 'Sevastopol', 1503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5675, 'Simferopol', 1503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5676, 'KertÅ¡', 1503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5677, 'Jevpatorija', 1503, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5678, 'Lugansk', 1504, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5679, 'Sjeverodonetsk', 1504, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5680, 'AltÅ¡evsk', 1504, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5681, 'LysytÅ¡ansk', 1504, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5682, 'Krasnyi LutÅ¡', 1504, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5683, 'Stahanov', 1504, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5684, 'Lviv', 1505, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5685, 'Mykolajiv', 1506, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5686, 'Odesa', 1507, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5687, 'Izmajil', 1507, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5688, 'Pultava [Poltava]', 1508, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5689, 'KrementÅ¡uk', 1508, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5690, 'Rivne', 1509, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5691, 'Sumy', 1510, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5692, 'Konotop', 1510, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5693, 'Å ostka', 1510, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5694, 'Uzgorod', 1511, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5695, 'MukatÅ¡eve', 1511, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5696, 'Ternopil', 1512, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5697, 'TÅ¡erkasy', 1513, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5698, 'Uman', 1513, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5699, 'TÅ¡ernigiv', 1514, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5700, 'TÅ¡ernivtsi', 1515, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5701, 'Vinnytsja', 1516, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5702, 'Lutsk', 1517, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5703, 'Zaporizzja', 1518, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5704, 'Melitopol', 1518, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5705, 'Berdjansk', 1518, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5706, 'Zytomyr', 1519, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5707, 'BerdytÅ¡iv', 1519, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5708, 'Montevideo', 1520, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5709, 'Birmingham', 1521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5710, 'Montgomery', 1521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5711, 'Mobile', 1521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5712, 'Huntsville', 1521, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5713, 'Anchorage', 1522, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5714, 'Phoenix', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5715, 'Tucson', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5716, 'Mesa', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5717, 'Glendale', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5718, 'Scottsdale', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5719, 'Chandler', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5720, 'Tempe', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5721, 'Gilbert', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5722, 'Peoria', 1523, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5723, 'Little Rock', 1524, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5724, 'Los Angeles', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5725, 'San Diego', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5726, 'San Jose', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5727, 'San Francisco', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5728, 'Long Beach', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5729, 'Fresno', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5730, 'Sacramento', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5731, 'Oakland', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5732, 'Santa Ana', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5733, 'Anaheim', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5734, 'Riverside', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5735, 'Bakersfield', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5736, 'Stockton', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5737, 'Fremont', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5738, 'Glendale', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5739, 'Huntington Beach', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5740, 'Modesto', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5741, 'San Bernardino', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5742, 'Chula Vista', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5743, 'Oxnard', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5744, 'Garden Grove', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5745, 'Oceanside', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5746, 'Ontario', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5747, 'Santa Clarita', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5748, 'Salinas', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5749, 'Pomona', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5750, 'Santa Rosa', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5751, 'Irvine', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5752, 'Moreno Valley', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5753, 'Pasadena', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5754, 'Hayward', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5755, 'Torrance', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5756, 'Escondido', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5757, 'Sunnyvale', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5758, 'Fontana', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5759, 'Orange', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5760, 'Rancho Cucamonga', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5761, 'East Los Angeles', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5762, 'Fullerton', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5763, 'Corona', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5764, 'Concord', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5765, 'Lancaster', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5766, 'Thousand Oaks', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5767, 'Vallejo', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5768, 'Palmdale', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5769, 'El Monte', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5770, 'Inglewood', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5771, 'Simi Valley', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5772, 'Costa Mesa', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5773, 'Downey', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5774, 'West Covina', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5775, 'Daly City', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5776, 'Citrus Heights', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5777, 'Norwalk', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5778, 'Berkeley', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5779, 'Santa Clara', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5780, 'San Buenaventura', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5781, 'Burbank', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5782, 'Mission Viejo', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5783, 'El Cajon', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5784, 'Richmond', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5785, 'Compton', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5786, 'Fairfield', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5787, 'Arden-Arcade', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5788, 'San Mateo', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5789, 'Visalia', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5790, 'Santa Monica', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5791, 'Carson', 1525, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5792, 'Denver', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5793, 'Colorado Springs', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5794, 'Aurora', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5795, 'Lakewood', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5796, 'Fort Collins', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5797, 'Arvada', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5798, 'Pueblo', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5799, 'Westminster', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5800, 'Boulder', 1526, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5801, 'Bridgeport', 1527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5802, 'New Haven', 1527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5803, 'Hartford', 1527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5804, 'Stamford', 1527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5805, 'Waterbury', 1527, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5806, 'Washington', 1528, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5807, 'Jacksonville', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5808, 'Miami', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5809, 'Tampa', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5810, 'Saint Petersburg', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5811, 'Hialeah', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5812, 'Orlando', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5813, 'Fort Lauderdale', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5814, 'Tallahassee', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5815, 'Hollywood', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5816, 'Pembroke Pines', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5817, 'Coral Springs', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5818, 'Cape Coral', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5819, 'Clearwater', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5820, 'Miami Beach', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5821, 'Gainesville', 1529, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5822, 'Atlanta', 1530, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5823, 'Augusta-Richmond County', 1530, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5824, 'Columbus', 1530, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5825, 'Savannah', 1530, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5826, 'Macon', 1530, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5827, 'Athens-Clarke County', 1530, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5828, 'Honolulu', 1531, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5829, 'Boise City', 1532, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5830, 'Chicago', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5831, 'Rockford', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5832, 'Aurora', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5833, 'Naperville', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5834, 'Peoria', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5835, 'Springfield', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5836, 'Joliet', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5837, 'Elgin', 1533, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5838, 'Indianapolis', 1534, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5839, 'Fort Wayne', 1534, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5840, 'Evansville', 1534, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5841, 'South Bend', 1534, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5842, 'Gary', 1534, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5843, 'Des Moines', 1535, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5844, 'Cedar Rapids', 1535, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5845, 'Davenport', 1535, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5846, 'Wichita', 1536, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5847, 'Overland Park', 1536, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5848, 'Kansas City', 1536, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5849, 'Topeka', 1536, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5850, 'Lexington-Fayette', 1537, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5851, 'Louisville', 1537, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5852, 'New Orleans', 1538, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5853, 'Baton Rouge', 1538, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5854, 'Shreveport', 1538, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5855, 'Metairie', 1538, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5856, 'Lafayette', 1538, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5857, 'Baltimore', 1539, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5858, 'Boston', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5859, 'Worcester', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5860, 'Springfield', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5861, 'Lowell', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5862, 'Cambridge', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5863, 'New Bedford', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5864, 'Brockton', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5865, 'Fall River', 1540, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5866, 'Detroit', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5867, 'Grand Rapids', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5868, 'Warren', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5869, 'Flint', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5870, 'Sterling Heights', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5871, 'Lansing', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5872, 'Ann Arbor', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5873, 'Livonia', 1541, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5874, 'Minneapolis', 1542, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5875, 'Saint Paul', 1542, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5876, 'Jackson', 1543, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5877, 'Kansas City', 1544, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5878, 'Saint Louis', 1544, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5879, 'Springfield', 1544, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5880, 'Independence', 1544, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5881, 'Billings', 1545, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5882, 'Omaha', 1546, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5883, 'Lincoln', 1546, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5884, 'Las Vegas', 1547, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5885, 'Reno', 1547, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5886, 'Henderson', 1547, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5887, 'Paradise', 1547, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5888, 'North Las Vegas', 1547, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5889, 'Sunrise Manor', 1547, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5890, 'Manchester', 1548, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5891, 'Newark', 1549, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5892, 'Jersey City', 1549, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5893, 'Paterson', 1549, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5894, 'Elizabeth', 1549, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5895, 'Albuquerque', 1550, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5896, 'New York', 1551, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5897, 'Buffalo', 1551, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5898, 'Rochester', 1551, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5899, 'Yonkers', 1551, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5900, 'Syracuse', 1551, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5901, 'Albany', 1551, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5902, 'Charlotte', 1552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5903, 'Raleigh', 1552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5904, 'Greensboro', 1552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5905, 'Durham', 1552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5906, 'Winston-Salem', 1552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5907, 'Fayetteville', 1552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5908, 'Cary', 1552, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5909, 'Columbus', 1553, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5910, 'Cleveland', 1553, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5911, 'Cincinnati', 1553, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5912, 'Toledo', 1553, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5913, 'Akron', 1553, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5914, 'Dayton', 1553, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5915, 'Oklahoma City', 1554, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5916, 'Tulsa', 1554, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5917, 'Norman', 1554, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5918, 'Portland', 1555, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5919, 'Eugene', 1555, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5920, 'Salem', 1555, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5921, 'Philadelphia', 1556, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5922, 'Pittsburgh', 1556, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5923, 'Allentown', 1556, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5924, 'Erie', 1556, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5925, 'Providence', 1557, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5926, 'Columbia', 1558, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5927, 'Charleston', 1558, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5928, 'Sioux Falls', 1559, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5929, 'Memphis', 1560, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5930, 'Nashville-Davidson', 1560, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5931, 'Knoxville', 1560, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5932, 'Chattanooga', 1560, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5933, 'Clarksville', 1560, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5934, 'Houston', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5935, 'Dallas', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5936, 'San Antonio', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5937, 'Austin', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5938, 'El Paso', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5939, 'Fort Worth', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5940, 'Arlington', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5941, 'Corpus Christi', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5942, 'Plano', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5943, 'Garland', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5944, 'Lubbock', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5945, 'Irving', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5946, 'Laredo', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5947, 'Amarillo', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5948, 'Brownsville', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5949, 'Pasadena', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5950, 'Grand Prairie', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5951, 'Mesquite', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5952, 'Abilene', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5953, 'Beaumont', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5954, 'Waco', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5955, 'Carrollton', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5956, 'McAllen', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5957, 'Wichita Falls', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5958, 'Midland', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5959, 'Odessa', 1561, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5960, 'Salt Lake City', 1562, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5961, 'West Valley City', 1562, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5962, 'Provo', 1562, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5963, 'Sandy', 1562, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5964, 'Virginia Beach', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5965, 'Norfolk', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5966, 'Chesapeake', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5967, 'Richmond', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5968, 'Newport News', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5969, 'Arlington', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5970, 'Hampton', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5971, 'Alexandria', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5972, 'Portsmouth', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5973, 'Roanoke', 1563, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5974, 'Seattle', 1564, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5975, 'Spokane', 1564, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5976, 'Tacoma', 1564, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5977, 'Vancouver', 1564, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5978, 'Bellevue', 1564, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5979, 'Milwaukee', 1565, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5980, 'Madison', 1565, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5981, 'Green Bay', 1565, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5982, 'Kenosha', 1565, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5983, 'Andijon', 1566, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5984, 'Buhoro', 1567, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5985, 'Cizah', 1568, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5986, 'KÃ¼kon', 1569, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5987, 'Fargona', 1569, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5988, 'Margilon', 1569, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5989, 'Nukus', 1570, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5990, 'Ãœrgenc', 1571, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5991, 'Namangan', 1572, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5992, 'Navoi', 1573, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5993, 'Karsi', 1574, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5994, 'Samarkand', 1575, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5995, 'Termiz', 1576, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5996, 'Circik', 1577, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5997, 'Angren', 1577, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5998, 'Olmalik', 1577, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(5999, 'Toskent', 1578, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6000, 'South Hill', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6001, 'The Valley', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6002, 'Oranjestad', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6003, 'Douglas', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6004, 'Gibraltar', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6005, 'Tamuning', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6006, 'AgaÃ±a', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6007, 'Flying Fish Cove', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6008, 'Monte-Carlo', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6009, 'Monaco-Ville', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6010, 'Yangor', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6011, 'Yaren', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6012, 'Alofi', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6013, 'Kingston', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6014, 'Adamstown', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6015, 'Singapore', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6016, 'NoumÃ©a', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6017, 'CittÃ  del Vaticano', 1579, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6018, 'Roseau', 1580, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6019, 'Saint GeorgeÂ´s', 1580, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6020, 'Kingstown', 1580, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6021, 'Taiping', 1581, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6022, 'Taliao', 1581, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6023, 'Kueishan', 1581, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6024, 'Ciudad Losada', 1581, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6025, 'Barcelona', 1582, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6026, 'Puerto La Cruz', 1582, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6027, 'El Tigre', 1582, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6028, 'Pozuelos', 1582, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6029, 'San Fernando de Apure', 1583, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6030, 'Maracay', 1584, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6031, 'Turmero', 1584, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6032, 'El LimÃ³n', 1584, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6033, 'Barinas', 1585, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6034, 'Cartagena', 1586, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6035, 'Ciudad Guayana', 1586, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6036, 'Ciudad BolÃ­var', 1586, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6037, 'Valencia', 1587, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6038, 'Puerto Cabello', 1587, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6039, 'Guacara', 1587, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6040, 'Buenos Aires', 1588, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6041, 'BrasÃ­lia', 1588, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6042, 'Ciudad de MÃ©xico', 1588, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6043, 'Caracas', 1588, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6044, 'Catia La Mar', 1588, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6045, 'Santa Ana de Coro', 1589, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6046, 'Punto Fijo', 1589, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6047, 'Calabozo', 1590, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6048, 'Valle de la Pascua', 1590, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6049, 'Barquisimeto', 1591, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6050, 'MÃ©rida', 1592, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6051, 'Petare', 1593, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6052, 'Baruta', 1593, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6053, 'Los Teques', 1593, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6054, 'Guarenas', 1593, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6055, 'Guatire', 1593, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6056, 'Ocumare del Tuy', 1593, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6057, 'MaturÃ­n', 1594, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6058, 'Acarigua', 1595, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6059, 'Guanare', 1595, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6060, 'Araure', 1595, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6061, 'Sincelejo', 1596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6062, 'CumanÃ¡', 1596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1);
INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(6063, 'CarÃºpano', 1596, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6064, 'San CristÃ³bal', 1597, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6065, 'Valera', 1598, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6066, 'San Felipe', 1599, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6067, 'MaracaÃ­bo', 1600, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6068, 'Cabimas', 1600, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6069, 'Ciudad Ojeda', 1600, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6070, 'Road Town', 1601, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6071, 'Charlotte Amalie', 1602, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6072, 'Long Xuyen', 1603, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6073, 'Vung Tau', 1604, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6074, 'Thai Nguyen', 1605, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6075, 'Quy Nhon', 1606, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6076, 'Phan ThiÃªt', 1607, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6077, 'Can Tho', 1608, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6078, 'Buon Ma Thuot', 1609, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6079, 'BiÃªn Hoa', 1610, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6080, 'Haiphong', 1611, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6081, 'Hanoi', 1612, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6082, 'Ho Chi Minh City', 1613, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6083, 'Nha Trang', 1614, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6084, 'Cam Ranh', 1614, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6085, 'Rach Gia', 1615, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6086, 'Da Lat', 1616, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6087, 'Nam Dinh', 1617, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6088, 'Vinh', 1618, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6089, 'Cam Pha', 1619, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6090, 'Da Nang', 1620, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6091, 'Hong Gai', 1621, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6092, 'Hue', 1622, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6093, 'My Tho', 1623, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6094, 'Port-Vila', 1624, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6095, 'Mata-Utu', 1625, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6096, 'Apia', 1626, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6097, 'Aden', 1627, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6098, 'al-Mukalla', 1628, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6099, 'Hodeida', 1629, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6100, 'Ibb', 1630, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6101, 'Sanaa', 1631, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6102, 'Taizz', 1632, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6103, 'Beograd', 1633, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6104, 'NiÅ¡', 1633, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6105, 'Kragujevac', 1633, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6106, 'PriÅ¡tina', 1634, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6107, 'Prizren', 1634, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6108, 'Podgorica', 1635, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6109, 'Novi Sad', 1636, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6110, 'Subotica', 1636, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6111, 'Port Elizabeth', 1637, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6112, 'East London', 1637, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6113, 'Uitenhage', 1637, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6114, 'Mdantsane', 1637, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6115, 'Bloemfontein', 1638, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6116, 'Welkom', 1638, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6117, 'Botshabelo', 1638, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6118, 'Soweto', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6119, 'Johannesburg', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6120, 'Pretoria', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6121, 'Vanderbijlpark', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6122, 'Kempton Park', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6123, 'Alberton', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6124, 'Benoni', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6125, 'Randburg', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6126, 'Vereeniging', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6127, 'Wonderboom', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6128, 'Roodepoort', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6129, 'Boksburg', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6130, 'Soshanguve', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6131, 'Krugersdorp', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6132, 'Brakpan', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6133, 'Oberholzer', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6134, 'Germiston', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6135, 'Springs', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6136, 'Westonaria', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6137, 'Randfontein', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6138, 'Nigel', 1639, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6139, 'Inanda', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6140, 'Durban', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6141, 'Pinetown', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6142, 'Pietermaritzburg', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6143, 'Umlazi', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6144, 'Newcastle', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6145, 'Chatsworth', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6146, 'Ladysmith', 1640, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6147, 'Witbank', 1641, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6148, 'Klerksdorp', 1642, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6149, 'Potchefstroom', 1642, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6150, 'Rustenburg', 1642, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6151, 'Kimberley', 1643, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6152, 'Cape Town', 1644, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6153, 'Paarl', 1644, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6154, 'George', 1644, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6155, 'Suva', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6156, 'Nyeri', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6157, 'Kathmandu', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6158, 'Lalitapur', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6159, 'Birgunj', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6160, 'San Lorenzo', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6161, 'LambarÃ©', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6162, 'Fernando de la Mora', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6163, 'Kabwe', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6164, 'Kandy', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6165, 'Kampala', 1645, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6166, 'Ndola', 1646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6167, 'Kitwe', 1646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6168, 'Chingola', 1646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6169, 'Mufulira', 1646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6170, 'Luanshya', 1646, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6171, 'Lusaka', 1647, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6172, 'Bulawayo', 1648, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6173, 'Harare', 1649, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6174, 'Chitungwiza', 1649, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6175, 'Mount Darwin', 1649, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6176, 'Mutare', 1650, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6177, 'Gweru', 1651, 1, '2017-10-16 17:24:21', 1, '2017-10-16 17:24:21', 1),
(6178, 'Madhi', 738, 1, '2019-04-01 15:50:42', 1, '2019-04-01 15:50:42', 1),
(6179, 'Bardoli', 738, 1, '2019-04-09 12:17:28', 1, '2019-04-09 12:17:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `abbr` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `letter_head_id` int(11) NOT NULL,
  `holiday_id` int(11) NOT NULL,
  `terms_condition_id` int(11) NOT NULL,
  `tax_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`company_id`, `company_name`, `abbr`, `email`, `phone_no`, `fax`, `currency_id`, `country_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_active`, `letter_head_id`, `holiday_id`, `terms_condition_id`, `tax_id`) VALUES
(3, 'Bitec LLC', 'BITEC', 'bit@cg.com', '8547859658', '0987654321', 5, 100, '2018-06-07 11:45:51', 1, '2018-08-03 16:43:45', 1, 1, 4, 1, 9, 'TRX23422'),
(4, 'Technical Resources L.L.C', 'TRE', 'info@techres-uae.com', '97143476646', '1234567890', 5, 8, '2018-06-07 11:46:46', 1, '2018-08-06 11:25:08', 1, 1, 2, 1, 9, 'UET23245'),
(5, 'Elegance', 'ELEGANCE', 'ele@hre.com', '85698547', '855478665', 1, 32, '2018-06-27 18:49:44', 1, '2018-08-03 16:44:18', 1, 1, 3, 1, 9, 'AST34223'),
(10, 'BItec Bahrain', 'Bitech B', 'BitB@bab.cc', '4535345', '54563456', 4, 6, '2018-06-28 17:09:50', 1, '2018-08-03 20:16:37', 1, 0, 4, 1, 9, 'EXT854789');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contact_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `salutation_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_primary` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`contact_id`, `type_id`, `type`, `salutation_id`, `first_name`, `last_name`, `gender_id`, `phone`, `mobile_no`, `designation_id`, `department_id`, `email_address`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_active`, `is_primary`) VALUES
(3, 1, 'customer', 5, 'Naitik', 'Shah', 1, '02612513212', '73595096297', 4, 5, 'na@gg.cc', '2018-06-22 18:41:00', 1, '2018-08-03 20:20:49', 1, 1, 0),
(7, 6, 'supplier', 6, 'Jessica', 'Alberti', 2, '8976677224', '2612345831', 4, 5, 'Jesica@alb.dc', '2018-07-31 13:03:14', 1, '2018-08-03 15:08:27', 1, 1, 1),
(8, 9, 'supplier', 5, 'John', 'Conrad', 1, '85478596', '7458745289', 7, 6, 'john@hh.cc', '2018-08-02 16:03:48', 1, '2018-08-03 14:59:59', 1, 1, 0),
(10, 5, 'supplier', 5, 'Aiken', 'Clay', 1, '2547856', '8547859621', 3, 5, 'Aiken@hk.com', '2018-08-03 14:55:30', 1, '2018-08-03 14:55:30', 1, 1, 0),
(12, 2, 'customer', 5, 'Partik', 'Patel', 1, '85478596598', '5214588955', 3, 5, 'par@digi.cc', '2018-08-03 20:24:15', 1, '2018-08-03 20:24:15', 1, 1, 0),
(13, 5, 'customer', 5, 'Ahmed', 'Ali', 1, '7986451231', '132465978', 7, 6, 'ahm@cs.cc', '2018-08-03 20:28:37', 1, '2018-08-03 20:28:37', 1, 1, 0),
(14, 6, 'customer', 5, 'Zachary', 'Willson', 1, '7458965852', '8596587456', 6, 5, 'ZachWill@dm.cc', '2018-08-04 10:52:53', 1, '2018-08-04 10:52:53', 1, 1, 0),
(15, 3, 'customer', 5, 'James', 'Allen', 1, '852589654', '8547859658', 7, 6, 'jamal@dn.cc', '2018-08-04 10:54:36', 1, '2018-08-04 10:54:36', 1, 1, 0),
(16, 9, 'customer', 5, 'BOB', 'Wayne', 1, '9517634820', '7865324190', 5, 6, 'bob@digitattva.com', '2018-08-04 14:29:54', 1, '2018-08-04 14:29:54', 1, 1, 1),
(17, 16, 'customer', 5, 'Liam', 'parker', 1, '8756451', '8645645', 5, 6, 'liam@digitattva.com', '2018-08-04 19:33:39', 1, '2018-08-04 19:33:39', 1, 1, 1),
(18, 17, 'customer', 5, 'Contact Person First Name', 'Contact Person Last name', 1, '107948039', '34838282893893', 4, 6, 'contactperson@demo.com', '2018-08-06 12:49:53', 1, '2018-08-06 12:49:53', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`country_id`, `country_name`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Aruba', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(2, 'Afghanistan', 1, '2017-10-16 17:18:29', 1, '2018-08-08 14:26:45', 1),
(3, 'Angola', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(4, 'Anguilla', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(5, 'Albania', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(6, 'Andorra', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(7, 'Netherlands Antilles', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(8, 'United Arab Emirates', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(9, 'Argentina', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(10, 'Armenia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(11, 'American Samoa', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(12, 'Antarctica', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(13, 'French Southern territories', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(14, 'Antigua and Barbuda', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(15, 'Australia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(16, 'Austria', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(17, 'Azerbaijan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(18, 'Burundi', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(19, 'Belgium', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(20, 'Benin', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(21, 'Burkina Faso', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(22, 'Bangladesh', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(23, 'Bulgaria', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(24, 'Bahrain', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(25, 'Bahamas', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(26, 'Bosnia and Herzegovina', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(27, 'Belarus', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(28, 'Belize', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(29, 'Bermuda', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(30, 'Bolivia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(31, 'Brazil', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(32, 'Barbados', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(33, 'Brunei', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(34, 'Bhutan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(35, 'Bouvet Island', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(36, 'Botswana', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(37, 'Central African Republic', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(38, 'Canada', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(39, 'Cocos (Keeling) Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(40, 'Switzerland', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(41, 'Chile', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(42, 'China', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(43, 'CÃ´te dâ€™Ivoire', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(44, 'Cameroon', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(45, 'Congo, The Democratic Republic', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(46, 'Congo', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(47, 'Cook Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(48, 'Colombia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(49, 'Comoros', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(50, 'Cape Verde', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(51, 'Costa Rica', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(52, 'Cuba', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(53, 'Christmas Island', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(54, 'Cayman Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(55, 'Cyprus', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(56, 'Czech Republic', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(57, 'Germany', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(58, 'Djibouti', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(59, 'Dominica', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(60, 'Denmark', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(61, 'Dominican Republic', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(62, 'Algeria', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(63, 'Ecuador', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(64, 'Egypt', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(65, 'Eritrea', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(66, 'Western Sahara', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(67, 'Spain', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(68, 'Estonia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(69, 'Ethiopia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(70, 'Finland', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(71, 'Fiji Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(72, 'Falkland Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(73, 'France', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(74, 'Faroe Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(75, 'Micronesia, Federated States o', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(76, 'Gabon', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(77, 'United Kingdom', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(78, 'Georgia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(79, 'Ghana', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(80, 'Gibraltar', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(81, 'Guinea', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(82, 'Guadeloupe', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(83, 'Gambia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(84, 'Guinea-Bissau', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(85, 'Equatorial Guinea', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(86, 'Greece', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(87, 'Grenada', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(88, 'Greenland', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(89, 'Guatemala', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(90, 'French Guiana', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(91, 'Guam', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(92, 'Guyana', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(93, 'Hong Kong', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(94, 'Heard Island and McDonald Isla', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(95, 'Honduras', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(96, 'Croatia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(97, 'Haiti', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(98, 'Hungary', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(99, 'Indonesia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(100, 'India', 1, '2017-10-16 17:18:29', 1, '2018-06-18 13:06:40', 1),
(101, 'British Indian Ocean Territory', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(102, 'Ireland', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(103, 'Iran', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(104, 'Iraq', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(105, 'Iceland', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(106, 'Israel', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(107, 'Italy', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(108, 'Jamaica', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(109, 'Jordan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(110, 'Japan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(111, 'Kazakstan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(112, 'Kenya', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(113, 'Kyrgyzstan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(114, 'Cambodia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(115, 'Kiribati', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(116, 'Saint Kitts and Nevis', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(117, 'South Korea', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(118, 'Kuwait', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(119, 'Laos', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(120, 'Lebanon', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(121, 'Liberia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(122, 'Libyan Arab Jamahiriya', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(123, 'Saint Lucia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(124, 'Liechtenstein', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(125, 'Sri Lanka', 0, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(126, 'Lesotho', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(127, 'Lithuania', 0, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(128, 'Luxembourg', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(129, 'Latvia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(130, 'Macao', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(131, 'Morocco', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(132, 'Monaco', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(133, 'Moldova', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(134, 'Madagascar', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(135, 'Maldives', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(136, 'Mexico', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(137, 'Marshall Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(138, 'Macedonia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(139, 'Mali', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(140, 'Malta', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(141, 'Myanmar', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(142, 'Mongolia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(143, 'Northern Mariana Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(144, 'Mozambique', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(145, 'Mauritania', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(146, 'Montserrat', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(147, 'Martinique', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(148, 'Mauritius', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(149, 'Malawi', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(150, 'Malaysia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(151, 'Mayotte', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(152, 'Namibia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(153, 'New Caledonia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(154, 'Niger', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(155, 'Norfolk Island', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(156, 'Nigeria', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(157, 'Nicaragua', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(158, 'Niue', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(159, 'Netherlands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(160, 'Norway', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(161, 'Nepal', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(162, 'Nauru', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(163, 'New Zealand', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(164, 'Oman', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(165, 'Pakistan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(166, 'Panama', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(167, 'Pitcairn', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(168, 'Peru', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(169, 'Philippines', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(170, 'Palau', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(171, 'Papua New Guinea', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(172, 'Poland', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(173, 'Puerto Rico', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(174, 'North Korea', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(175, 'Portugal', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(176, 'Paraguay', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(177, 'Palestine', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(178, 'French Polynesia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(179, 'Qatar', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(180, 'RÃ©union', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(181, 'Romania', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(182, 'Russian Federation', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(183, 'Rwanda', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(184, 'Saudi Arabia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(185, 'Sudan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(186, 'Senegal', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(187, 'Singapore', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(188, 'South Georgia and the South Sa', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(189, 'Saint Helena', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(190, 'Svalbard and Jan Mayen', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(191, 'Solomon Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(192, 'Sierra Leone', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(193, 'El Salvador', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(194, 'San Marino', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(195, 'Somalia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(196, 'Saint Pierre and Miquelon', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(197, 'Sao Tome and Principe', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(198, 'Suriname', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(199, 'Slovakia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(200, 'Slovenia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(201, 'Sweden', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(202, 'Swaziland', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(203, 'Seychelles', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(204, 'Syria', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(205, 'Turks and Caicos Islands', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(206, 'Chad', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(207, 'Togo', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(208, 'Thailand', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(209, 'Tajikistan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(210, 'Tokelau', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(211, 'Turkmenistan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(212, 'East Timor', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(213, 'Tonga', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(214, 'Trinidad and Tobago', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(215, 'Tunisia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(216, 'Turkey', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(217, 'Tuvalu', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(218, 'Taiwan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(219, 'Tanzania', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(220, 'Uganda', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(221, 'Ukraine', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(222, 'United States Minor Outlying I', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(223, 'Uruguay', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(224, 'United States', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(225, 'Uzbekistan', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(226, 'Holy See (Vatican City State)', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(227, 'Saint Vincent and the Grenadin', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(228, 'Venezuela', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(229, 'Virgin Islands, British', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(230, 'Virgin Islands, U.S.', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(231, 'Vietnam', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(232, 'Vanuatu', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(233, 'Wallis and Futuna', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(234, 'Samoa', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(235, 'Yemen', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(236, 'Yugoslavia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(237, 'South Africa', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(238, 'Zambia', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(239, 'Zimbabwe', 1, '2017-10-16 17:18:29', 1, '2017-10-16 17:18:29', 1),
(240, 'test', 0, '2018-02-07 15:35:04', 1, '2018-02-07 15:35:04', 1),
(241, 's', 0, '2018-08-08 15:21:46', 1, '2018-08-08 15:23:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(11) NOT NULL,
  `type` enum('individual','company') NOT NULL,
  `full_name` varchar(60) NOT NULL,
  `salutation_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `price_list_id` int(11) NOT NULL,
  `credit_limit` int(11) NOT NULL,
  `bypass_credit_limit_check_at_sales_order` tinyint(1) NOT NULL,
  `payment_term_id` int(11) NOT NULL,
  `customer_details` text NOT NULL,
  `sales_partner_id` int(11) NOT NULL,
  `commission_rate` double(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `type`, `full_name`, `salutation_id`, `gender_id`, `customer_group_id`, `tax_id`, `company_id`, `currency_id`, `lead_id`, `price_list_id`, `credit_limit`, `bypass_credit_limit_check_at_sales_order`, `payment_term_id`, `customer_details`, `sales_partner_id`, `commission_rate`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'individual', 'Naitik S Shah', 5, 1, 4, 0, 3, 1, 16, 3, 15000, 0, 1, '', 2, 10.00, 1, '2018-06-05 15:37:43', 1, '2018-08-03 15:15:34', 1),
(2, 'individual', 'Partik Patel', 5, 1, 4, 0, 4, 2, 16, 3, 22000, 0, 1, '', 1, 5.00, 1, '2018-06-05 16:12:25', 1, '2018-08-03 15:11:41', 1),
(3, 'company', 'James Allen', 0, 0, 3, 0, 3, 1, 15, 1, 20, 1, 1, '', 3, 2.33, 1, '2018-06-19 13:05:40', 1, '2018-08-03 15:14:29', 1),
(5, 'individual', 'Ahmed Ali', 5, 1, 3, 123456, 4, 1, 15, 1, 30, 1, 1, '', 1, 5.00, 1, '2018-08-02 19:21:53', 1, '2018-08-03 15:12:13', 1),
(6, 'individual', 'Zachary Willson', 5, 1, 3, 0, 3, 1, 32, 3, 50, 1, 1, '<p>Acme Corporation</p>', 3, 2.33, 1, '2018-08-03 11:08:40', 1, '2018-08-04 14:22:29', 1),
(7, 'company', 'TREX', 0, 0, 4, 0, 3, 1, 38, 3, 1000, 0, 1, '', 2, 10.00, 0, '2018-08-04 11:41:23', 1, '2018-08-04 11:44:22', 1),
(8, 'individual', 'Allen Ken', 6, 2, 4, 0, 4, 2, 39, 3, 10000, 0, 3, '', 1, 5.00, 0, '2018-08-04 11:42:40', 1, '2018-08-04 11:42:40', 1),
(9, 'individual', 'BOB Joel Wayne', 5, 1, 5, 0, 4, 4, 42, 3, 0, 1, 3, '', 1, 5.00, 1, '2018-08-04 12:00:08', 1, '2018-08-04 14:17:09', 1),
(10, 'individual', 'Naitik Shah', 5, 1, 3, 0, 4, 5, 0, 3, 0, 0, 0, '', 1, 5.00, 0, '2018-08-04 12:29:23', 1, '2018-08-04 12:29:23', 1),
(11, 'individual', 'Hardik Patel', 5, 1, 3, 123456, 3, 1, 43, 3, 5000, 1, 1, '<p>Dummy DAta</p>', 2, 10.00, 0, '2018-08-04 16:00:20', 1, '2018-08-04 16:00:20', 1),
(13, 'individual', 'Digitattva', 5, 1, 4, 0, 3, 1, 16, 3, 0, 1, 1, '', 2, 10.00, 0, '2018-08-04 17:38:04', 1, '2018-08-04 17:38:04', 1),
(14, 'individual', 'Digitattva', 5, 2, 3, 0, 3, 1, 15, 3, 121235, 1, 1, '', 2, 10.00, 0, '2018-08-04 18:35:07', 1, '2018-08-04 18:35:07', 1),
(15, 'individual', 'Digitattva', 5, 2, 3, 0, 3, 1, 46, 3, 121235, 1, 1, '<p>qwrtysdfghwert</p>', 2, 10.00, 1, '2018-08-04 18:36:27', 1, '2018-08-04 18:36:27', 1),
(16, 'individual', 'Liam Scott parker', 5, 1, 3, 0, 4, 2, 44, 3, 500, 1, 3, '', 1, 5.00, 1, '2018-08-04 19:27:28', 1, '2018-08-04 19:27:28', 1),
(17, 'individual', 'SPARE PARTS JOINT', 5, 1, 4, 0, 4, 2, 44, 3, 123, 0, 1, '<p>Dummy Customer Details</p>', 1, 5.00, 1, '2018-08-06 12:38:24', 1, '2018-08-06 12:43:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_group`
--

CREATE TABLE `tbl_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `customer_group_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer_group`
--

INSERT INTO `tbl_customer_group` (`customer_group_id`, `customer_group_name`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(3, 'Goverment', 1, '2018-06-05 11:54:03', 1, '2018-08-01 14:55:12', 1),
(4, 'Commercial', 1, '2018-06-05 11:54:19', 1, '2018-08-01 14:55:49', 1),
(5, 'Non Profit', 1, '2018-06-29 12:35:09', 1, '2018-08-01 14:55:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`designation_id`, `designation_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_active`) VALUES
(3, 'Executive', '2018-05-31 12:26:20', 1, '2018-08-01 17:27:25', 1, 1),
(4, 'Senior Executive', '2018-05-31 12:26:28', 1, '2018-08-01 17:27:54', 1, 1),
(5, 'Maneger', '2018-08-01 17:28:44', 1, '2018-08-01 17:28:44', 1, 1),
(6, 'Accountant', '2018-08-01 17:29:05', 1, '2018-08-01 17:29:05', 1, 1),
(7, 'Supervisor', '2018-08-01 17:29:17', 1, '2018-08-01 17:29:17', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_device_info`
--

CREATE TABLE `tbl_device_info` (
  `device_info_id` int(11) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `device_token` varchar(255) NOT NULL,
  `device_model` varchar(255) NOT NULL,
  `device_version` varchar(30) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `auth_token` varchar(20) NOT NULL,
  `auth_token_validity` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_device_info`
--

INSERT INTO `tbl_device_info` (`device_info_id`, `device_id`, `device_type`, `device_token`, `device_model`, `device_version`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`, `auth_token`, `auth_token_validity`) VALUES
(1, 'be74e7f8f645db6e', 'android', 'cNoNy9TxJOw:APA91bGLWlJcEU1hPWMyE2YVr_ybUOD9Mg2dAWwm5JBAUiU6rTwehzfp-', 'Xiaomi Redmi 5', '25', 29, '2018-10-16 00:00:00', 29, '2018-09-18 00:00:00', 1, 'mWrITyAgJOkjCYKuliHe', '2020-01-15 08:10:09'),
(2, 'f8f645db6ebe74e7', 'ios', 'APA91bGLWlJcEU1hPWMyE2YVr_ybUOD9Mg2dAWwm5JBAUiU6rTwehzfp-cNoNy9TxJOw:', 'Galaxy Note 8', '25', 28, '2018-09-06 00:00:00', 28, '2018-08-22 00:00:00', 1, 'VMkUQg4FibXZ59WhI2qK', '2018-09-20 00:00:00'),
(3, 'f8f645db6ebe74e', 'android', '_ybUOD9Mg2dArTwehzfp-cNoNWwm5JBAUiU6y9TxJOw:APA91bGLWlJcEU1hPWMyE2YVr', 'Galaxy C9 Pro', '25', 27, '2018-07-21 00:00:00', 27, '2018-08-05 00:00:00', 1, '6wF8GvBKosHF2QRGhjkl', '2019-03-13 04:09:10'),
(4, 'db6ebe74ef8f645', 'ios', 'GLWlJcEU1hPWMyEcNoNy9TxJOw:APA91b2YVr_ybUOD9Mg2dAWwm5JBAUiU6rTwehzfp-', 'Iphone X', '25', 20, '2018-06-21 00:00:00', 20, '2018-06-05 00:00:00', 1, 'LTkOGcRd1XJKboOezqpa', '2018-12-13 00:00:00'),
(5, 'd4ef8f645b6ebe7', 'android', 'ybUOD9Mg2dAWwm5JBAUiU6rTwehzfp-cNoNy9TxJOw:APA91bGLWlJcEU1hPWMyE2YVr_', 'Galaxy Note 9', '26', 31, '2018-04-18 00:00:00', 31, '2018-05-02 00:00:00', 1, 'xfmiHORy4lomNU0Vehjk', '0000-00-00 00:00:00'),
(6, 'd4ef8f645b6ebe7', 'android', 'xJOw:APA91b2YVr_ybUOGLWlJcEU1hPWMyEcNoNy9TD9Mg2dAWwm5JBAUiU6rTwehzfp-', 'Galaxy Note 9', '26', 31, '2018-04-18 00:00:00', 31, '2018-05-02 00:00:00', 1, 'vzfBuPO9rdCGkw3xjklz', '0000-00-00 00:00:00'),
(7, 'gp5b6ebe7ef8f64', 'android', 'cEU1hPWMyEcNoNy9TxGLWlJJOw:APA91b2YVr_ybUOD9Mg2dAWwm5JBAUiU6rTwehzfp-', 'Galaxy Note 5', '26', 21, '2018-06-18 00:00:00', 21, '2018-07-02 00:00:00', 1, 'sUTARdb9fjM2W10PF54x', '2018-06-18 00:00:00'),
(8, 'gpe7ef8f645b6eb', 'android', '', 'Galaxy Note 5', '26', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 'DNsS8rZW42L6oe139VFM', '2018-09-05 00:00:00'),
(9, 'gp5b6ebe7ef8f64', 'android', '', 'Galaxy Note 5', '26', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 'joYOnaVJMUQKuAGw91S7', '2018-09-05 00:00:00'),
(10, 'be74e7f8f645db6ed', 'android', '', 'Xiaomi Redmi 5', '25', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 'Sa7ly3mdFU08TpvcG1Xo', '2018-09-05 00:00:00'),
(11, 'be74e7f8f645db6edd', 'android', '', 'Samsung S10', '23', 0, '2019-03-08 00:00:00', 0, '2019-03-08 00:00:00', 1, 'LO2q5RNjhx9Ads1mFQIT', '2019-06-06 00:00:00'),
(12, 'be74e7f8f645db6eddd', 'ios', '', 'Iphone', '12', 0, '2018-11-19 00:00:00', 0, '2018-11-19 00:00:00', 1, 'kmSROVNinMZvcJC4g1yo', '2019-02-17 00:00:00'),
(13, 'be74e7f8f645db6edos', 'ios', '', 'Iphone 4', '4', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 'XSq4nPEUDwxJBYNekbdt', '2018-12-05 00:00:00'),
(14, '45dde74e7f8fdb6edb6', 'ios', '', 'Iphone', '12', 0, '2018-11-19 00:00:00', 0, '2018-11-19 00:00:00', 1, 'MOduJjTzf6I8Altmvk1H', '2019-02-17 00:00:00'),
(15, 'be74e7f8f645db6a', 'ios', '', 'Iphone', '12', 0, '2019-02-19 00:00:00', 0, '2019-02-19 00:00:00', 1, 'kftqe4inazc3vmfwhpbr', '2019-05-20 00:00:00'),
(16, 'be74e7f8f645db6esss', 'ios', '', 'Iphone', '12', 0, '2019-03-08 00:00:00', 0, '2019-03-08 00:00:00', 1, 'wW6CAqJP2RTcj7dXBnaZ', '2019-06-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_document`
--

CREATE TABLE `tbl_document` (
  `document_id` int(11) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `series` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `document_name` mediumtext NOT NULL,
  `document_type` enum('quotation','sales order') NOT NULL,
  `subject_name` mediumtext NOT NULL,
  `email_message` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_document`
--

INSERT INTO `tbl_document` (`document_id`, `prefix`, `series`, `slug`, `document_name`, `document_type`, `subject_name`, `email_message`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(4, 'DOC-', 4, '', 'Offer Letter', 'sales order', 'Employee Offer Letter', '<p>OFFER LETTER</p>', 0, '2018-07-19 15:54:57', 1, '2018-08-03 12:21:30', 1),
(5, 'DOC-', 5, '', 'Greeting Template', 'quotation', 'Greetings From DigiTattva', '<p><strong>Hello  </strong>{customer_fullname},</p>\r\n\r\n<p>Kindly find below quotation details.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Quotation Details :- </strong></p>\r\n\r\n<p>Customer Name :- {customer_fullname} ,</p>\r\n\r\n<p>Quotation Date :- {quotation_date}</p>\r\n\r\n<p>Base Total :- <em>{base_total}</em></p>\r\n\r\n<p>Base Total Discount :- <em>{base_discount_amount}</em></p>\r\n\r\n<p>Base Grand Total :- <em>{base_grand_total}</em></p>\r\n\r\n<p>Quotation Date Created :- {quotation_datecreated}</p>\r\n\r\n<p> </p>', 0, '2018-07-19 16:01:59', 1, '2018-07-19 17:41:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_document_type`
--

CREATE TABLE `tbl_document_type` (
  `document_type_id` int(11) NOT NULL,
  `document_type_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_document_type`
--

INSERT INTO `tbl_document_type` (`document_type_id`, `document_type_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_active`) VALUES
(4, 'PDF', '2018-07-10 10:43:26', 1, '2018-07-10 10:43:26', 1, 1),
(5, 'Word', '2018-07-10 11:22:36', 1, '2018-07-10 11:22:36', 1, 1),
(6, 'Excel', '2018-07-10 11:45:50', 1, '2018-07-10 11:45:50', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_education`
--

CREATE TABLE `tbl_education` (
  `education_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_education`
--

INSERT INTO `tbl_education` (`education_id`, `samaj_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, '2019-03-16 12:36:52', 1, '2019-03-30 16:27:21', 1),
(3, 1, '2019-03-30 16:28:16', 1, '2019-03-30 16:28:16', 1),
(4, 1, '2019-03-30 16:28:40', 1, '2019-03-30 16:28:40', 1),
(5, 1, '2019-04-11 16:20:42', 1, '2019-04-11 16:20:42', 1),
(6, 1, '2019-04-11 16:21:59', 1, '2019-04-11 16:21:59', 1),
(7, 1, '2019-04-11 16:22:42', 1, '2019-04-11 16:22:42', 1),
(8, 1, '2019-04-11 18:20:44', 1, '2019-04-11 18:20:44', 1),
(10, 1, '2019-04-19 12:00:13', 1, '2019-04-19 12:00:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_education_description`
--

CREATE TABLE `tbl_education_description` (
  `education_description_id` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `education_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_education_description`
--

INSERT INTO `tbl_education_description` (`education_description_id`, `education_id`, `language_id`, `education_name`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Master of Computer Application', '2019-03-30 04:27:21', 1, '2019-03-30 04:27:21', 1),
(2, 1, 3, 'માસ્ટર ઓફ કમ્પ્યુટર એપ્લિકેશન', '2019-03-30 04:27:21', 1, '2019-03-30 04:27:21', 1),
(5, 3, 1, 'BSC', '2019-03-30 04:28:16', 1, '2019-03-30 04:28:16', 1),
(6, 3, 3, 'બીએસસી', '2019-03-30 04:28:16', 1, '2019-03-30 04:28:16', 1),
(7, 4, 1, 'MSC', '2019-03-30 04:28:40', 1, '2019-03-30 04:28:40', 1),
(8, 4, 3, 'એમએસસી', '2019-03-30 04:28:40', 1, '2019-03-30 04:28:40', 1),
(9, 5, 1, 'ENGINEERING TECHNOLOGY', '2019-04-11 04:20:43', 1, '2019-04-11 04:20:43', 1),
(10, 5, 3, 'એન્જિનિયરિંગ ટેક્નોલૉજી', '2019-04-11 04:20:43', 1, '2019-04-11 04:20:43', 1),
(11, 6, 1, 'READING EDUCATION', '2019-04-11 04:21:59', 1, '2019-04-11 04:21:59', 1),
(12, 6, 3, 'અધ્યયન વાંચન', '2019-04-11 04:21:59', 1, '2019-04-11 04:21:59', 1),
(13, 7, 1, 'LLB', '2019-04-11 04:22:42', 1, '2019-04-11 04:22:42', 1),
(14, 7, 3, 'એલએલબી', '2019-04-11 04:22:42', 1, '2019-04-11 04:22:42', 1),
(15, 8, 1, 'MBBS', '2019-04-11 06:20:44', 1, '2019-04-11 06:20:44', 1),
(16, 8, 3, 'એમબીબીએસ', '2019-04-11 06:20:44', 1, '2019-04-11 06:20:44', 1),
(19, 10, 1, 'MscIt', '2019-04-19 12:00:13', 1, '2019-04-19 12:00:13', 1),
(20, 10, 3, 'એમએસસીટી', '2019-04-19 12:00:13', 1, '2019-04-19 12:00:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_template`
--

CREATE TABLE `tbl_email_template` (
  `email_template_id` int(11) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `series` int(11) NOT NULL,
  `type` mediumtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  `template_name` mediumtext NOT NULL,
  `subject_name` mediumtext NOT NULL,
  `email_message` text NOT NULL,
  `from_name` mediumtext NOT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `reply_to` varchar(100) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `bcc` varchar(100) NOT NULL,
  `plain_text` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_email_template`
--

INSERT INTO `tbl_email_template` (`email_template_id`, `prefix`, `series`, `type`, `slug`, `template_name`, `subject_name`, `email_message`, `from_name`, `from_email`, `reply_to`, `cc`, `bcc`, `plain_text`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(2, 'EMTE-', 2, 'customer', '', 'Quotation', 'Customer Invitation', '<p>Testing Customer :- {customer_fullname}</p>\r\n\r\n<p>Customer Type : -{customer_type},</p>\r\n\r\n<p> </p>\r\n\r\n<p>Created Date , {customer_datecreated}</p>', 'Digitattva Technolabs', 'digitattva.tre@gmail.com', '', '', '', 0, 0, '2018-07-18 12:52:35', 1, '2018-08-03 17:15:45', 1),
(3, 'EMTE-', 3, 'quotation', '', 'Customer Registration', 'Customer', '<p><strong>Hello  </strong>{customer_fullname},</p>\r\n\r\n<p>Kindly find below quotation details.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Quotation Details :- </strong></p>\r\n\r\n<p>Customer Name :- {customer_fullname} ,</p>\r\n\r\n<p>Quotation Date :- {quotation_date}</p>\r\n\r\n<p>Base Total :- <em>{base_total}</em></p>\r\n\r\n<p>Base Total Discount :- <em>{base_discount_amount}</em></p>\r\n\r\n<p>Base Grand Total :- <em>{base_grand_total}</em></p>\r\n\r\n<p>Quotation Date Created :- {quotation_datecreated}</p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>', 'Digitattva Technolabs', 'digitattva.tre@gmail.com', '', '', '', 1, 0, '2018-07-18 12:54:31', 1, '2018-07-19 18:21:23', 1),
(4, 'EMTE-', 4, 'sales_order', '', 'Purchase', 'Purchase Inquiry', '<p>{company_name}</p>\r\n\r\n<p>{company_id}</p>\r\n\r\n<p>{series}</p>\r\n\r\n<p>{customer_fullname}</p>\r\n\r\n<p>Demo Mail. Demo Message.</p>', 'Inquiry', 'pur@hji.cll', 'juio@mm.dre', 'Siert', 'Ster', 0, 0, '2018-07-25 17:39:21', 1, '2018-08-07 18:08:30', 1),
(6, 'EMTE-', 6, 'sales_invoice', '', 'Dmeo', 'Dmepo', '<p>Series :- {series}</p>\r\n\r\n<p>Company Id :- {company_id}</p>\r\n\r\n<p>Company Name :- {company_name}</p>\r\n\r\n<p>Dempo messgae.</p>', 'demo', 'Demo@digitattva.com', 'demo@digitattva.com', '', '', 0, 0, '2018-08-07 18:50:33', 1, '2018-08-08 12:29:34', 1),
(7, 'EMTE-', 7, 'deliver_notes', '', 'deliver notes demo', 'demo for deliver notes', '<p>Series : - {series}</p>\r\n\r\n<p>Company Id :- {company_id}</p>\r\n\r\n<p>Company Name :- {company_name}</p>\r\n\r\n<p>Demo Message For Deliver Notes Email Tempate</p>', 'kushang', 'digitattva.tre@gmail.com', '', '', '', 0, 0, '2018-08-08 11:08:55', 1, '2018-08-08 11:20:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_type`
--

CREATE TABLE `tbl_employee_type` (
  `employee_type_id` int(11) NOT NULL,
  `employee_type_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_employee_type`
--

INSERT INTO `tbl_employee_type` (`employee_type_id`, `employee_type_name`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Permanent', 1, '2018-06-08 18:27:51', 1, '2018-06-18 18:13:12', 1),
(2, 'Fixed-term', 1, '2018-06-08 18:29:04', 1, '2018-06-08 18:29:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_events`
--

CREATE TABLE `tbl_events` (
  `event_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` text NOT NULL,
  `location_geo` text NOT NULL,
  `location_general` text NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_events`
--

INSERT INTO `tbl_events` (`event_id`, `samaj_id`, `event_name`, `short_description`, `long_description`, `location_geo`, `location_general`, `is_required`, `created_at`, `created_by`, `updated_at`, `updated_by`, `start_time`, `end_time`, `lat`, `lng`, `start_date`, `end_date`) VALUES
(1, 1, '', '', '', 'Near Ritz Square, Meghdoot Society, Athwalines, Athwa, Surat, Gujarat 395001, India', '', 1, '2019-04-09 11:30:00', 1, '2019-04-11 19:02:39', 1, '02:20:40', '03:06:52', '21.1767893', '72.80114049999997', '2019-04-12', '2019-04-13'),
(2, 1, '', '', '', 'Timiliyawad Rd, Near Mahavir Hospitals, Opp. Gandhi Smruti Bhavan, Nanpura, Surat, Gujarat 395001, India', '', 1, '2019-04-09 11:32:31', 1, '2019-04-09 11:32:31', 1, '10:00:00', '11:30:05', '21.1857623', '72.81415279999999', '2019-04-13', '2019-04-15'),
(3, 1, '', '', '', 'Garden City, Gujarat 393001, India', '', 1, '2019-04-09 11:36:12', 1, '2019-04-09 11:36:12', 1, '07:00:00', '14:00:10', '21.5982134', '73.04716880000001', '2019-04-17', '2019-04-17'),
(4, 1, '', '', '', 'Bhatha, Surat, Gujarat 394510, India', '', 1, '2019-04-09 15:58:15', 1, '2019-04-11 10:32:28', 1, '10:00:00', '10:39:50', '21.1782233', '72.76317070000005', '2019-04-11', '2019-04-11'),
(7, 1, '', '', '', 'Timiliyawad Rd, Opp Mahavir Hospital, Timaliawad, Nanpura, Surat, Gujarat 395001, India', '', 1, '2019-04-11 11:49:13', 1, '2019-04-11 11:49:13', 1, '08:00:00', '16:00:00', '21.1847074', '72.81497749999994', '2019-04-13', '2019-04-14'),
(8, 1, '', '', '', 'Shankheshwar Complex Kshetrapal Dada Marg Near, Kailash Nagar, Sagrampura, Surat, Gujarat 395002, India', '', 1, '2019-04-11 12:43:37', 1, '2019-04-11 12:45:59', 1, '06:00:01', '21:05:31', '21.1849341', '72.8208032', '2019-04-20', '2019-04-24'),
(9, 1, '', '', '', '1/568/B-57, Por Mahollo, Opp. State Bank of India, Athughar St, Timaliyawad, Nanpura, Surat, Gujarat 395001, India', '', 1, '2019-04-11 16:47:47', 1, '2019-04-11 16:47:47', 1, '10:40:00', '11:00:10', '21.1877356', '72.81322', '2019-04-12', '2019-04-12'),
(10, 1, '', '', '', 'Near Gajanan Book Stall, A-608, Surat - Dumas Rd, Pitruaashish, Behind Doctor Manshukhial Tower, Athwa Gate, Surat, Gujarat 395001, India', '', 1, '2019-04-15 18:07:55', 1, '2019-04-15 18:07:55', 1, '09:00:16', '20:00:16', '21.1832902', '72.81251339999994', '2019-04-24', '2019-06-20'),
(11, 1, '', '', '', 'Nashik, Maharashtra, India', '', 1, '2019-04-17 16:59:50', 1, '2019-04-17 16:59:50', 1, '10:10:50', '16:42:34', '19.9974533', '73.78980230000002', '2019-04-18', '2019-04-20'),
(12, 1, '', '', '', 'Near Ritz Square, Meghdoot Society, Athwalines, Athwa, Surat, Gujarat 395001, India', '', 1, '2019-04-18 18:36:00', 1, '2019-04-18 18:36:00', 1, '02:00:00', '11:02:36', '21.1767893', '72.80114049999997', '2019-05-05', '2019-05-05'),
(13, 1, '', '', '', 'Near Ritz Square, Meghdoot Society, Athwalines, Athwa, Surat, Gujarat 395001, India', '', 1, '2019-04-22 12:23:13', 1, '2019-04-22 12:23:13', 1, '10:30:00', '12:48:36', '21.1767893', '72.80114049999997', '2019-05-18', '2019-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event_description`
--

CREATE TABLE `tbl_event_description` (
  `event_description_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `event_name` varchar(60) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` text NOT NULL,
  `location_general` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_event_description`
--

INSERT INTO `tbl_event_description` (`event_description_id`, `event_id`, `language_id`, `event_name`, `short_description`, `long_description`, `location_general`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Bounce Back Seminar of Dr. Vivek Bindra', 'We are glad to introduce you to our upcoming seminar on the “Ultra Productivity & Peak Performance” program brought to you by none other than the very charismatic Dr. Vivek Bindra ™ (International Motivational Speaker | Leadership Consultant | CEO Coach)', '<p>This workshop will provide an excellent learning platform for the exchange of ideas amongst a highly interdisciplinary group of participants and Dr. Vivek Bindra.</p>\n\n<p>Featured program Benefits:</p>\n\n<p>1) Identify Your “Limitless Limits” For Path Breaking Success</p>\n\n<p>2) Discover The Key To Identify, Understand, Analyze, and Re-Orient Your Belief System</p>\n\n<p>3) Accelerate Your Peak Performance Productivity Index</p>\n\n<p>4) Develop A Laser Sharp Focus To Achieve Your Goal</p>\n\n<p>5) Explore, Engage & Maximize Your Inner Unlimited Potential</p>\n\n<p>6) How To Build A High-Performance Team</p>\n\n<p>7) How To Remain Ahead Of Your Competitors By Leveraging Your Unique Signature Strength</p>\n', 'Indoor Stadium Lane, Meghdoot Society, Athwalines, Athwa, Near Ritz Square, Surat, Gujarat 395001, India', '2019-04-11 07:02:39', 1, '2019-04-11 07:02:39', 1),
(2, 1, 3, 'ડૉ. વિવેક બિન્દ્રાના સેમિનારને બાઉન્સ', 'ખૂબ જ પ્રભાવશાળી ડૉ. વિવેક બિન્દ્રા ™ (ઇન્ટરનેશનલ મોટિવિવલેશન સ્પીકર | લીડરશીપ કન્સલ્ટન્ટ | સીઇઓ કોચ) સિવાય અન્ય કોઈ દ્વારા તમને લાવ્યા \"અલ્ટ્રા ઉત્પાદકતા અને પીક પર્ફોમન્સ\" પ્રોગ્રામ પરના અમારા આગામી સેમિનાર સાથે તમને રજૂ કરવાથી અમને ખુશી થાય છે.', '<p>આ વર્કશોપ ભાગ લેનારાઓના ઉચ્ચ આંતરશિસ્ત જૂથ અને ડૉ. વિવેક બિન્દ્રા વચ્ચેના વિચારોના વિનિમય માટે ઉત્તમ શિક્ષણ પ્લેટફોર્મ પ્રદાન કરશે.</p>\n\n<p>વૈશિષ્ટિકૃત કાર્યક્રમ લાભો:</p>\n\n<p>1) પાથ બ્રેકિંગ સફળતા માટે તમારી \"મર્યાદિત મર્યાદાઓ\" ઓળખો</p>\n\n<p>2) તમારી માન્યતા સિસ્ટમ ઓળખવા, સમજવા, વિશ્લેષણ કરવા અને ફરીથી ઓરિએન્ટ કરવા માટે કી શોધો</p>\n\n<p>3) તમારા પીક પર્ફોમન્સ ઉત્પાદકતા ઇન્ડેક્સને વેગ આપો</p>\n\n<p>4) તમારું લક્ષ્ય પ્રાપ્ત કરવા માટે લેસર શાર્પ ફોકસનો વિકાસ કરો</p>\n\n<p>5) તમારા ઇનર અનલિમિટેડ પોટેન્શિયલનું અન્વેષણ કરો, જોડો અને મહત્તમ કરો</p>\n\n<p>6) હાઇ-પર્ફોમન્સ ટીમ કેવી રીતે બનાવવી</p>\n\n<p>7) તમારી અનન્ય હસ્તાક્ષર શક્તિને લીવર કરીને તમારા સ્પર્ધકોથી આગળ કેવી રીતે રહેવું</p>\n', 'ઇન્ડોર સ્ટેડિયમ લેન, મેઘદૂટ સોસાયટી, અથવલિન્સ, અથવા, રિટ્ઝ સ્ક્વેર નજીક, સુરત, ગુજરાત 395001, ભારત', '2019-04-11 07:02:39', 1, '2019-04-11 07:02:39', 1),
(3, 2, 1, 'Jaykara', 'The show “Jaykara” is a unique motivational entertainment show conceived by Jay Vasavada, a famous columnist, author and orator with play writer Imtiaz Patel, the show is designed by Pritesh Sodha and will be performed by Jay Vasavada and team.', '<p>The show “Jaykara” is a unique motivational entertainment show conceived by Jay Vasavada, a famous columnist, author and orator with play writer Imtiaz Patel, the show is designed by Pritesh Sodha and will be performed by Jay Vasavada and team. Mr. Jay Vasavada will explain four ‘D’ formula (dream, dare, dedication and do) with audio-visual effects and musical support along with great entertainment value, blended with dramatic skits specially designed set and original music score. The show will motivate the youth and all to enjoy life.</p>\n', 'Near Kanaknidhi Complex, Timiliyawad Road, Surat, Gujarat 395001, India', '2019-04-09 11:32:31', 1, '2019-04-09 11:32:31', 1),
(4, 2, 3, 'જયકારા', 'શો \"જયકારા\" એ એક પ્રખ્યાત કટારલેખક, જે વાસવાડા, નાટક લેખક ઇમ્તિયાઝ પટેલ સાથે વક્તા અને વક્તા દ્વારા કલ્પના કરાયેલ એક અનન્ય પ્રેરણાત્મક મનોરંજન શો છે, આ શો પ્રિતેશ સોધા દ્વારા ડિઝાઇન કરાયો છે અને જે વાસવાડા અને ટીમ દ્વારા કરવામાં આવશે.', '<p>શો \"જયકારા\" એ એક પ્રખ્યાત કટારલેખક, જે વાસવાડા, નાટક લેખક ઇમ્તિયાઝ પટેલ સાથે વક્તા અને વક્તા દ્વારા કલ્પના કરાયેલ એક અનન્ય પ્રેરણાત્મક મનોરંજન શો છે, આ શો પ્રિતેશ સોધા દ્વારા ડિઝાઇન કરાયો છે અને જે વાસવાડા અને ટીમ દ્વારા કરવામાં આવશે. શ્રી જય વાસાવડા, &#39;ડી&#39; ફોર્મ્યુલા (સ્વપ્ન, હિંમત, સમર્પણ અને કરવું) ને ઓડિયો-વિઝ્યુઅલ ઇફેક્ટ્સ અને સંગીતના સપોર્ટ સાથે મહાન મનોરંજન મૂલ્ય સાથે સમજાવશે, ખાસ કરીને ડિઝાઇન કરેલ સેટ અને મૂળ સંગીત સ્કોર સાથે નાટકીય સ્કેટ્સ સાથે મિશ્રિત થશે. આ શો યુવાને અને બધાને જીવનનો આનંદ માણવા પ્રેરણા આપશે.</p>\n', 'કનકનિધિ કૉમ્પ્લેક્સ નજીક, ટિમિલીયાવાડ રોડ, સુરત, ગુજરાત 395001, ભારત', '2019-04-09 11:32:31', 1, '2019-04-09 11:32:31', 1),
(5, 3, 1, 'Salman Ali - Live in Concert', 'Get ready for a memorable musical night with Salman Ali & book your tickets now to be a part of an amazing evening. This is a fundraising event so kindly contribute for a cause.', '<p>Junior Chamber International is a worldwide federation of young leaders & entrepreneurs between the age of 18 & 40 yrs. JCI has active participation in UN system & Co-Operations with many global and national organizations. As a part of JCI Bharuch (Started in 1962), we strive to bring positive change in the country by organizing community development programs, training for youth & opportunity of individual development for members of the society. For executing these social and community development projects for the whole calendar year, JCI Bharuch conducts such cultural programs for raising funds towards good causes every year. This year we are planning to conduct this fundraising event on 17th April 2019.</p>\n', 'Ankleshwar, Garden, City, Ankleshwar, Gujarat 393001, India', '2019-04-09 11:36:12', 1, '2019-04-09 11:36:12', 1),
(6, 3, 3, 'સલમાન અલી - કોન્સર્ટમાં લાઇવ', 'સલમાન અલી સાથે યાદગાર સંગીતમય રાત માટે તૈયાર થઈ જાઓ અને એક સુંદર સાંજે એક ભાગ બનવા માટે હવે તમારી ટિકિટ બુક કરો. આ એક ભંડોળ ઊભુ કરતી ઇવેન્ટ છે તેથી કૃપા કરીને કોઈ કારણસર ફાળો આપો.', '<p>જુનિયર ચેમ્બર ઇન્ટરનેશનલ 18 થી 40 વર્ષની વયના યુવા નેતાઓ અને ઉદ્યોગપતિઓની વિશ્વભરમાં ફેડરેશન છે. યુ.સી. સિસ્ટમ અને સહકારમાં જેસીઆઈની વૈશ્વિક અને રાષ્ટ્રીય સંસ્થાઓ સાથે સક્રિય ભાગીદારી છે. જેસીઆઈ ભરૂચ (1 9 62 માં શરુ) ના ભાગ રૂપે, અમે સમુદાય વિકાસ કાર્યક્રમો, યુવાનો માટે તાલીમ અને સમાજના સભ્યો માટે વ્યક્તિગત વિકાસની તક દ્વારા આ દેશમાં હકારાત્મક ફેરફાર લાવવાનો પ્રયાસ કરીએ છીએ. આ કૅલેન્ડર વર્ષ માટે સામાજિક અને સામુદાયિક વિકાસ યોજનાઓ અમલમાં મૂકવા માટે, જેસીઆઇ ભરૂચ દર વર્ષે સારા કારણોસર ભંડોળ ઊભું કરવા માટે આવા સાંસ્કૃતિક કાર્યક્રમોનું આયોજન કરે છે. આ વર્ષે અમે 17 મી એપ્રિલ, 2019 ના રોજ આ ભંડોળ ઊભું કરવાની ઇવેન્ટ હાથ ધરાવવાની યોજના બનાવી રહ્યા છીએ.</p>\n', 'અંકલેશ્વર, ગાર્ડન, શહેર, અંકલેશ્વર, ગુજરાત 393001, ભારત', '2019-04-09 11:36:12', 1, '2019-04-09 11:36:12', 1),
(7, 4, 1, 'Surat Kids Run 2019', 'Jack N Jeel Surat Kids Run Marathon was started in 2018, and got overwhelming response.SKR is organised and managed by, Jeel Elite Event Management Pvt Ltd, which undertakes the activity of conducting kids Run marathons in Surat, for social cause.', '<p>With every edition of our SKR Marathon, we aspire to reach out to more people and contribute to bringing the change we wish to see, from running for the dreams of underprivileged children to supporting the cause of Tribal Children Education.SKR attracts kids, Parents and runners from Surat, along with citizens from cities and towns of Gujarat.SKR is committed to Run and supports local social and civic causes.SKR enthuses and encourages citizens, to take interest and make their contribution for the Tribal Child welfare.Each registered child receives a T-shirt, Medal, Bag, Cap, Certificate and goody bag. Adults...you receive the satisfaction of sharing a memory with your child that will last a lifetime!SKR had set a prior record of ‘’Most Kids Running Barefoot’’and entered inAsia Book of Records and India Book of Records, and this time SKR had applied to set a New recordof ‘’Largest Run To Promote Education By Children’’</p>\n', 'de villa cricket ground, pal hazira road, adajan, surat, Gujarat, 395009', '2019-04-11 10:32:28', 1, '2019-04-11 10:32:28', 1),
(8, 4, 3, 'સુરત કિડ્સ રન 2019', 'જેક એન જેલ સુરત કિડ્સ રન મેરેથોન 2018 માં શરૂ થયું હતું, અને ભારે પ્રતિસાદ મળ્યો. એસકેઆરનું આયોજન અને મેનેજમેન્ટ જેલ એલિટ ઇવેન્ટ મેનેજમેન્ટ પ્રા. લિ. દ્વારા થાય છે, જે બાળકોને સામાજિક કારણોસર સુરતમાં મેરેથોન ચલાવવાની પ્રવૃત્તિ કરે છે.', '<p>અમારા એસ.કે.આર. મેરેથોનની દરેક આવૃત્તિ સાથે, આપણે વધુ લોકો સુધી પહોંચવાની આશા રાખીએ છીએ અને આપણે જે પરિવર્તન લાવવા માંગીએ છીએ તેમાં પરિવર્તન લાવવું, આદિજાતિ બાળકોના શિક્ષણને ટેકો આપવા માટે અપૂરતા બાળકોના સપનાને ચલાવવાથી. એસ.કે.આર. બાળકો, માતાપિતા અને ગુજરાતનાં શહેરો અને નગરોના નાગરિકો સાથે સુરતના દોડવીરો. એસ.કે.આર. સ્થાનિક સામાજિક અને નાગરિક કારણોને ટેકો આપવા અને સપોર્ટ કરવા માટે પ્રતિબદ્ધ છે. કે.આર.આર. લોકોને ઉત્તેજન આપે છે અને નાગરિકોને પ્રોત્સાહિત કરે છે અને જનજાતિ બાળ કલ્યાણ માટે તેમના યોગદાન આપે છે. દરેક રજિસ્ટર્ડ બાળક પ્રાપ્ત કરે છે. ટી-શર્ટ, મેડલ, બેગ, કેપ, પ્રમાણપત્ર અને ગુડ બેગ. પુખ્ત વયના લોકો ... તમને તમારા બાળક સાથેની યાદશક્તિ વહેંચવાની સંતોષ મળે છે જે જીવનભર રહે છે! એસકેઆરએ &#39;મોસ્ટ કિડ્સ રનિંગ બેરફૂટ&#39; નો અગાઉનો રેકોર્ડ સેટ કર્યો હતો અને તે એશિયા બુક ઑફ રેકોર્ડ્સ અને ઇન્ડિયા બુક ઑફ રેકોર્ડ્સમાં દાખલ થયો હતો, અને આ સમય એસ.કે.આર. દ્વારા &#39;બાળકો દ્વારા શિક્ષણને પ્રોત્સાહન આપવાનું સૌથી મોટું રન&#39; નું નવું રેકોર્ડ સેટ કરવા માટે અરજી કરવામાં આવી હતી.</p>\n', 'ડી વિલા ક્રિકેટ ગ્રાઉન્ડ, પાલ હઝીરા રોડ, આદજન, સુરત, ગુજરાત, 395009', '2019-04-11 10:32:28', 1, '2019-04-11 10:32:28', 1),
(11, 7, 1, ' Hitcon South Gujarat', 'First of its kind event in South Gujarat. Hitcon is a platform where technology meets healthcare. This talks about topics ranging from basics to advance healthcare technology. Doctors from all specialties participate and benefit from this event.', '<p><strong>\"Healthtech Event for Doctors\"</strong><br>\nFirst of its kind event in South Gujarat. Hitcon is a platform where technology meets healthcare. This talks about topics ranging from basics to advance healthcare technology. Doctors from all specialties participate and benefit from this event. All the leading hospitals of South Gujarat will participate in this event.</p>\n', 'Timiliyawad Rd, Opp Mahavir Hospital, Timaliawad, Nanpura, Surat, Gujarat 395001, India', '2019-04-11 11:49:13', 1, '2019-04-11 11:49:13', 1),
(12, 7, 3, 'હિટકોન દક્ષિણ ગુજરાત', 'દક્ષિણ ગુજરાતના આ પ્રકારની પહેલી ઘટના. હિટકોન એ એક પ્લેટફોર્મ છે જ્યાં તકનીકી આરોગ્ય સંભાળ પૂરી પાડે છે. મૂળભૂત બાબતોથી લઇને હેલ્થકેર ટેકનોલોજી સુધીના મુદ્દાઓ વિશેની આ વાટાઘાટો. તમામ વિશેષતાઓના ડૉક્ટરો આ ઇવેન્ટમાંથી ભાગ લે છે અને લાભ મેળવે છે. ', '<p>\"ડૉક્ટર્સ માટે હેલ્થટેચ ઇવેન્ટ\"<br>\nદક્ષિણ ગુજરાતના આ પ્રકારની પહેલી ઘટના. હિટકોન એ એક પ્લેટફોર્મ છે જ્યાં તકનીકી આરોગ્ય સંભાળ પૂરી પાડે છે. મૂળભૂત બાબતોથી લઇને હેલ્થકેર ટેકનોલોજી સુધીના મુદ્દાઓ વિશેની આ વાટાઘાટો. તમામ વિશેષતાઓના ડૉક્ટરો આ ઇવેન્ટમાંથી ભાગ લે છે અને લાભ મેળવે છે. દક્ષિણ ગુજરાતની અગ્રણી હોસ્પિટલો આ ઇવેન્ટમાં ભાગ લેશે.</p>\n', 'ટિમિલિયાવાડ આરડી, ઓપ મહવીર હોસ્પિટલ, તિમાલિયાવાડ, નનપુરા, સુરત, ગુજરાત 395001, ભારત', '2019-04-11 11:49:13', 1, '2019-04-11 11:49:13', 1),
(13, 8, 1, 'BUSINESS ORGANISATION PLANNING FOR ANDROID APPLICATION', 'I STARTED WORKING ON MY ANDROID APPLICATION AND I NEED A SOFTWARE ENGINEER AND SERVER PROVIDER AND SOME STAFF TO MANAGE MY APPLICATION GENTLY. MORE INFORMATION IS WAITING ', '<p>I STARTED WORKING ON MY ANDROID APPLICATION AND I NEED A SOFTWARE ENGINEER AND SERVER PROVIDER AND SOME STAFF TO MANAGE MY APPLICATION GENTLY. MORE INFORMATION IS WAITING </p>\n', 'SHANKHESHWAR COMPLEX, KAILASH NAGAR, KADARSHANI NAL ROAD, GARDEN COLONY, SAGRAMPURA, KSHETRAPAL DADA MARG, SURAT, INDIA', '2019-04-11 12:45:59', 1, '2019-04-11 12:45:59', 1),
(14, 8, 3, 'એન્ડ્રોઇડ એપ્લિકેશન માટે વ્યવસાય ઓર્ગેનીઝેશન પ્લાનિંગ', 'મેં મારા એન્ડ્રોઇડ એપ્લિકેશન પર કામ શરૂ કર્યું અને મને સૉફ્ટવેર એન્જીનિયર અને સર્વર પ્રોવાઇડર અને મારા એપ્લિકેશનને સાવધાનીપૂર્વક સંચાલિત કરવા માટે કેટલાક સ્ટાફની જરૂર છે. વધુ માહિતી રાહ જોઈ રહ્યું છે', '<pre data-fulltext=\"\" data-placeholder=\"Translation\" dir=\"ltr\" id=\"tw-target-text\">\nમેં મારા એન્ડ્રોઇડ એપ્લિકેશન પર કામ શરૂ કર્યું અને મને સૉફ્ટવેર એન્જીનિયર અને સર્વર પ્રોવાઇડર અને મારા એપ્લિકેશનને સાવધાનીપૂર્વક સંચાલિત કરવા માટે કેટલાક સ્ટાફની જરૂર છે. વધુ માહિતી # ડિજિટલ માર્કેટિંગ # android # મોબાઇલ જોવાની છે</pre>\n', 'શંકશેશ્વર કૉલેક્ષ, કૈલાશ નગર, કદરસણી નલ રોડ, ગાર્ડન કોલોની, સાગરરામ, ખેત્રપાલ દડા માર, સુરત, ભારત', '2019-04-11 12:45:59', 1, '2019-04-11 12:45:59', 1),
(15, 9, 1, 'Summer camp in Surat', 'ScienceUtsav have seen a burst of interest in STEM, a curriculum that integrates science, technology, engineering, and mathematics. ScienceUtsav STEM camps are a response to this growing interest.', '<p>ScienceUtsav offers separate modules for kiddos (going to grade 1st to 3rd), Juniors (going to grade 4th and 5th) and seniors (going to grade 6th to 8th. These camps include various multi-modules and experimental programs to keep the participants excited and encourage them to learn, to explore new things.<br>\nThe workshops have been simplistically designed to give the children hands-on science experiments through which they can make, learn and enjoy.<br>\nWhy Attend Our STEM Summer Camp?<br>\nSTEM offers more work prospects for students, a better quality of education, and a capable and competent skilled workforce for the future. As our world becomes more focused on science and technology, it is important to be prepared to keep up with the demands.</p>\n', 'G1, 101 Mazda mention, Opp. SBI Bank, Anand Hospital lane, nr. Kailash sweet, Nanpura, Surat, Gujarat 395001, India', '2019-04-11 04:47:47', 1, '2019-04-11 04:47:47', 1),
(16, 9, 3, 'સુરતમાં સમર કેમ્પ', 'સાયન્સ યુટ્સે એસટીઇએમમાં ​​રસ દાખવ્યો છે, એક અભ્યાસક્રમ જે વિજ્ઞાન, તકનીકી, ઇજનેરી અને ગણિતને સંકલિત કરે છે. સાયન્સ્યુત્સવ એસટીઇએમ કેમ્પ આ વધતી જતી રસનો પ્રતિભાવ છે. આ પ્રવૃત્તિઓ રસ, જ્ઞાન અને તકનીકી બનાવવા માટે રચાયેલ છે', '<p>સાયન્સયુત્સવે કિડ્સ (1 લીથી ત્રીજી ગ્રેડમાં જવાનું), જુનિયર્સ (4 થી 5 અને ગ્રેડ 5 ગ્રેડ) અને સિનિયર્સ (6 થી 8 ગ્રેડ સુધી જઈ રહ્યા છે) માટે અલગ મોડ્યુલો પ્રદાન કરે છે. આ કેમ્પમાં સહભાગીઓને ઉત્સાહિત રાખવા માટે વિવિધ મલ્ટી મોડ્યુલો અને પ્રાયોગિક કાર્યક્રમો શામેલ છે અને નવી વસ્તુઓનું અન્વેષણ કરવા, તેમને શીખવા માટે પ્રોત્સાહિત કરો.<br>\nવર્કશોપને સરળ રીતે ડિઝાઇન કરવામાં આવી છે જેથી બાળકોને વિજ્ઞાન પ્રયોગો હાથ ધરવામાં આવે જેના દ્વારા તેઓ કરી શકે, શીખશે અને આનંદ કરી શકે.<br>\nશા માટે અમારા સ્ટેમ સમર કેમ્પમાં હાજરી આપીએ?<br>\nSTEM વિદ્યાર્થીઓ માટે વધુ કાર્યક્ષમતા, શિક્ષણની બહેતર ગુણવત્તા અને ભવિષ્ય માટે સક્ષમ અને સક્ષમ કુશળ કર્મચારીઓની તક આપે છે. જેમ જેમ આપણું વિશ્વ વિજ્ઞાન અને તકનીક પર વધારે ધ્યાન કેન્દ્રિત કરે છે તેમ, માંગોને જાળવી રાખવા માટે તૈયાર થવું મહત્વપૂર્ણ છે.</p>\n', 'ઇક્વલિયા એજ્યુકેશન હબ, જી -1 મઝદા મંતવ્ય, આણંદ હોસ્પિટલ લેન, એનઆર. કૈલાશ સ્વેટ, નનપુરા, સુરત, ગુજરાત, સુરત, ભારત', '2019-04-11 04:47:47', 1, '2019-04-11 04:47:47', 1),
(17, 10, 1, 'Surat Dreamland Mela', 'This is the mega event to take place in Surat. The best place for enjoying, shopping,entertainment,games,leisure. Enjoy full vacations at this venue.  ', '<p>This is the mega event to take place in Surat. The best place for enjoying, shopping,entertainment,games,leisure. Enjoy full vacations at this venue.  </p>\n', 'Near Gajanan Book Stall, A-608, Surat - Dumas Rd, Pitruaashish, Behind Doctor Manshukhial Tower, Athwa Gate, Surat, Gujarat 395001, India', '2019-04-15 06:07:55', 1, '2019-04-15 06:07:55', 1),
(18, 10, 3, 'સુરત ડ્રીમલેન્ડ મેલા', 'સુરતમાં યોજાયેલી આ મોટી ઘટના છે. આનંદ, ખરીદી, મનોરંજન, રમતો, લેઝર માટે શ્રેષ્ઠ સ્થળ. આ સ્થળે સંપૂર્ણ રજાઓનો આનંદ લો.', '<p>સુરતમાં યોજાયેલી આ મોટી ઘટના છે. આનંદ, ખરીદી, મનોરંજન, રમતો, લેઝર માટે શ્રેષ્ઠ સ્થળ. આ સ્થળે સંપૂર્ણ રજાઓનો આનંદ લો.</p>\n', 'ગજાનન બુક સ્ટોલ નજીક, એ -608, સુરત - દુમાસ આરડી, પિત્રુશિશ, ડોક્ટર મનસુખિયલ ટાવર પાછળ, અથવા ગેટ, સુરત, ગુજરાત 395001, ભારત', '2019-04-15 06:07:55', 1, '2019-04-15 06:07:55', 1),
(19, 11, 1, 'Angular Training Course', 'Want to start or scale up your career in Front End Development? Add Angular to your skill set and stay ahead of market.', '<p>Angular Master Class is a 6 weeks class room training program loaded with lots of practical assignments and real life application development specially designed for  freshers and working professionals who wants to start or scale up their career in Angular.<br>\nWho can join this course -<br>\n1. Beginners to programming <br>\n2. Pass-outs / Freshers - BE, Diploma, ME, BCS, BCA, MCS, MCA<br>\n3. Job Seekers -IT / E&TC<br>\n4. working IT professionals</p>\n', 'Nashik, Maharashtra, India', '2019-04-17 04:59:50', 1, '2019-04-17 04:59:50', 1),
(20, 11, 3, 'કોણીય તાલીમ અભ્યાસક્રમ', 'ફ્રન્ટ એન્ડ ડેવલપમેન્ટમાં તમારી કારકિર્દી શરૂ કરવી કે તેનું કદ વધારવું છે? તમારા કુશળતા સેટ પર ઍંગ્યુલર ઉમેરો અને બજારથી આગળ રહો.', '<p>ફ્રન્ટ એન્ડ ડેવલપમેન્ટમાં તમારી કારકિર્દી શરૂ કરવી કે તેનું કદ વધારવું છે? તમારા કુશળતા સેટ પર એન્જીલર ઉમેરો અને બજારથી આગળ રહો. એન્ગુલર માસ્ટર ક્લાસ 6 અઠવાડિયાના ક્લાસ રૂમ તાલીમ કાર્યક્રમ છે જે ઘણાં વ્યવહારુ સોંપણીઓ અને વાસ્તવિક જીવન એપ્લિકેશન વિકાસ સાથે ભરેલા છે, ખાસ કરીને ફ્રેશર્સ અને કાર્યકારી વ્યાવસાયિકો માટે રચાયેલ જેઓ તેમના કારકિર્દીને પ્રારંભ કરવા અથવા વધારવા માગે છે કોણીયમાં</p>\n\n<p>આ કોર્સમાં કોણ જોડાઈ શકે છે -<br>\n1. પ્રોગ્રામિંગ માટે પ્રારંભિક<br>\n2. પાસ-આઉટ / ફ્રેશર્સ - બીઇ, ડિપ્લોમા, એમઇ, બીસીએસ, બીસીએ, એમસીએસ, એમસીએ<br>\n3. જોબ સીકર્સ -આઈટી / ઇ અને ટીસી<br>\n4. આઇટી વ્યાવસાયિકો કામ કરે છે</p>\n', 'નાસિક, મહારાષ્ટ્ર, ભારત', '2019-04-17 04:59:50', 1, '2019-04-17 04:59:50', 1),
(21, 12, 1, 'How To Be Limitless By Chetan Bhagat', 'We are glad to introduce you to our upcoming seminar brought to you by none other than the very famous & talented Chetan Bhagat himself.', '<p>We are glad to introduce you to our upcoming seminar brought to you by none other than the very famous & talented Chetan Bhagat himself.It will be happening for the very first time in your city of Surat, so book your seats today & be a part of this epic event..!!</p>\n', 'Indoor Stadium Lane, Meghdoot Society, Athwalines, Athwa, Near Ritz Square, Surat, Gujarat 395001, India', '2019-04-18 06:36:00', 1, '2019-04-18 06:36:00', 1),
(22, 12, 3, 'ચેતન ભગત દ્વારા કેવી રીતે નિરંતર રહેવું', 'અમારા પ્રખ્યાત સેમિનાર સાથે તમને પ્રસિદ્ધ કરવાથી અમને ખુશી થાય છે, જે તમને પ્રસિદ્ધ અને પ્રતિભાશાળી ચેતન ભગત સિવાય બીજું કંઈ નથી.', '<p>અમારા પ્રસિદ્ધ સેમિનારને તમે પ્રસિદ્ધ અને પ્રતિભાશાળી ચેતન ભગત સિવાય અન્ય કોઈ પણ વ્યક્તિ દ્વારા તમારી પાસે લાવવા માટે અમને ખુશી થાય છે. તે તમારા સુરત શહેરમાં પ્રથમ વખત બનશે, તેથી તમારી બેઠકો આજે બુક કરો અને ભાગ બનો. આ મહાકાવ્ય ઘટના .. !!</p>\n', 'ઇન્ડોર સ્ટેડિયમ લેન, મેઘદૂટ સોસાયટી, અથવલિન્સ, અથવા, રિટ્ઝ સ્ક્વેર નજીક, સુરત, ગુજરાત 395001, ભારત', '2019-04-18 06:36:00', 1, '2019-04-18 06:36:00', 1),
(23, 13, 1, 'Laxmikant Pyarelal Live in Concert', 'A lifetime opportunity to revisit the magical compositions of legendary Laxmikant Pyarelal, the music composer duo who ruled Bollywood music for more than 35 years. During this period', '<p>A Musical Event</p>\n\n<p>A lifetime opportunity to revisit the magical compositions of legendary Laxmikant Pyarelal, the music composer duo who ruled Bollywood music for more than 35 years. During this period, they did thousands of hit songs of 635 movies working with perhaps, almost all filmmakers. Get ready to be enthralled by performances of a live orchestra by more than fifty instrumentalists, being led by non-other than living legend Pyarelal himself.</p>\n', 'Indoor Stadium Lane, Meghdoot Society, Athwalines, Athwa, Near Ritz Square, Surat, Gujarat 395001, India', '2019-04-22 12:23:13', 1, '2019-04-22 12:23:13', 1),
(24, 13, 3, 'લક્ષ્મીકાંત પ્યારેલાલ લાઇવ ઇન કોન્સર્ટ', '35 વર્ષથી વધુ સમય માટે બોલીવુડ સંગીત પર શાસન કરનાર મ્યુઝિક કંપોઝર ડ્યૂઓ, સુપ્રસિદ્ધ લક્ષ્મીકાંત પ્યારેલાલની જાદુઈ રચનાઓનું સંશોધન કરવાની આજીવન તક. આ સમયગાળા દરમિયાન.', '<p>એક મ્યુઝિકલ ઇવેન્ટ</p>\n\n<p>35 વર્ષથી વધુ સમય માટે બોલીવુડ સંગીત પર શાસન કરનાર મ્યુઝિક કંપોઝર ડ્યૂઓ, સુપ્રસિદ્ધ લક્ષ્મીકાંત પ્યારેલાલની જાદુઈ રચનાઓનું સંશોધન કરવાની આજીવન તક. આ સમયગાળા દરમિયાન, તેઓએ 635 ચલચિત્રોના હજારો હિટ ગીતો સંભવતઃ લગભગ બધા ફિલ્મ નિર્માતાઓ સાથે કામ કર્યું હતું. 50 થી વધુ ઇન્સ્ટ્રુમેન્ટલિસ્ટ્સ દ્વારા જીવંત ઓર્કેસ્ટ્રાના પ્રદર્શન દ્વારા ખુશ થવું માટે તૈયાર થાઓ, જેમાં જીવંત દંતકથા પ્યારેલાલ સિવાય અન્ય કોઈ નહીં હોય.</p>\n', 'ઇન્ડોર સ્ટેડિયમ લેન, મેઘદૂટ સોસાયટી, અથવલિન્સ, અથવા, રિટ્ઝ સ્ક્વેર નજીક, સુરત, ગુજરાત 395001, ભારત', '2019-04-22 12:23:13', 1, '2019-04-22 12:23:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event_file`
--

CREATE TABLE `tbl_event_file` (
  `event_file_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_event_file`
--

INSERT INTO `tbl_event_file` (`event_file_id`, `event_id`, `filename`) VALUES
(1, 1, '5bff96b920e45bdfe06c0426e6833f7e.jpg'),
(2, 1, '2904ce230a97316ac8564da1d7b52be4.jpg'),
(4, 2, '38e2cf7e1aeba7f34583897a4c135d36.jpg'),
(5, 3, '669acd0fcebf2afb20dc48aa5913bd14.jpg'),
(7, 4, '8469064c97f2d174c84f730650134e91.jpg'),
(8, 4, 'c74c22a7115f673609d9ecc7d28574de.jpg'),
(10, 7, '0ecf01f33650e5422eda554c520d83ec.jpg'),
(11, 7, 'c41730217f49b3ffce9a2563878b79fd.jpg'),
(12, 8, 'e54650d0a9789cfc09d38acd6e0f96f7.png'),
(13, 8, '305b285c609239bf1b8c78db2366703d.jpg'),
(14, 9, 'ebda08047de7e00503d73f7a301116cd.jpg'),
(15, 9, '192f39a4e882256bda56b6643de2a378.jpg'),
(16, 10, '19ee03948c46df08d4fed50d296d3f20.jpg'),
(17, 11, '4f2450bc6078f2db86184010210dba0c.jpg'),
(18, 11, '1a67c6ab0fe2c50a878956fe63d3b20a.png'),
(19, 12, 'e2ef9cca1f5144ce546f24e62009e029.jpg'),
(20, 13, '5722d8e867e2f8336c9d9cf6dca23801.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event_rsvp`
--

CREATE TABLE `tbl_event_rsvp` (
  `event_rsvp_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `is_interested` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_event_rsvp`
--

INSERT INTO `tbl_event_rsvp` (`event_rsvp_id`, `event_id`, `member_id`, `is_interested`, `created_at`) VALUES
(1, 8, 1, 1, '2019-04-11 04:35:39'),
(2, 7, 1, 0, '2019-04-11 04:36:52'),
(3, 8, 3, 1, '2019-04-11 04:45:23'),
(4, 7, 3, 0, '2019-04-11 04:45:38'),
(5, 9, 6, 0, '2019-04-11 04:48:51'),
(6, 1, 6, 1, '2019-04-11 05:11:18'),
(7, 7, 6, 0, '2019-04-11 05:11:41'),
(8, 9, 3, 1, '2019-04-11 07:20:16'),
(9, 1, 1, 1, '2019-04-11 07:26:19'),
(10, 1, 3, 1, '2019-04-11 07:31:03'),
(11, 9, 1, 0, '2019-04-12 01:58:10'),
(12, 3, 1, 1, '2019-04-12 01:58:31'),
(13, 9, 5, 1, '2019-04-12 05:46:18'),
(14, 10, 14, 1, '2019-04-15 07:14:54'),
(15, 3, 7, 1, '2019-04-17 04:08:29'),
(16, 10, 20, 1, '2019-04-17 04:55:38'),
(17, 10, 21, 0, '2019-04-17 04:55:42'),
(18, 10, 19, 1, '2019-04-17 04:55:46'),
(19, 8, 20, 0, '2019-04-17 04:57:48'),
(20, 8, 21, 1, '2019-04-17 04:57:48'),
(21, 8, 19, 0, '2019-04-17 04:57:49'),
(22, 11, 18, 1, '2019-04-17 05:04:26'),
(23, 11, 21, 0, '2019-04-17 05:04:27'),
(24, 11, 19, 1, '2019-04-17 05:04:28'),
(25, 11, 20, 1, '2019-04-17 05:04:28'),
(26, 10, 18, 0, '2019-04-17 05:05:13'),
(27, 3, 21, 0, '2019-04-17 06:14:13'),
(28, 12, 23, 0, '2019-04-19 01:07:42'),
(29, 12, 8, 1, '2019-04-19 01:56:14'),
(30, 12, 7, 1, '2019-04-19 05:35:20'),
(31, 10, 7, 0, '2019-04-19 05:35:45'),
(32, 12, 17, 1, '2019-04-20 06:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallerys`
--

CREATE TABLE `tbl_gallerys` (
  `gallery_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_gallerys`
--

INSERT INTO `tbl_gallerys` (`gallery_id`, `samaj_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(5, 1, '2019-03-30 13:47:44', 1, '2019-04-19 13:24:14', 1),
(7, 1, '2019-03-30 13:50:08', 1, '2019-03-30 13:50:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery_description`
--

CREATE TABLE `tbl_gallery_description` (
  `gallery_description_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `parent_gallery_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `gallery_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_gallery_description`
--

INSERT INTO `tbl_gallery_description` (`gallery_description_id`, `gallery_id`, `parent_gallery_id`, `language_id`, `gallery_name`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(9, 5, 0, 1, 'IT TECHNO', '2019-03-30 01:47:44', 1, '2019-04-19 01:24:14', 1),
(10, 5, 0, 3, 'IT TECHNO', '2019-03-30 01:47:44', 1, '2019-04-19 01:24:14', 1),
(13, 7, 0, 1, 'My World', '2019-03-30 01:50:09', 1, '2019-03-30 01:50:09', 1),
(14, 7, 0, 3, 'My World', '2019-03-30 01:50:09', 1, '2019-03-30 01:50:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery_file`
--

CREATE TABLE `tbl_gallery_file` (
  `gallery_file_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_gallery_file`
--

INSERT INTO `tbl_gallery_file` (`gallery_file_id`, `gallery_id`, `filename`) VALUES
(29, 5, 'd58bee4b0e6e1685a6390a39b4c423ce.jpg'),
(30, 5, '60ee70cddf34574bc06fc0ec9dd7c2ea.jpg'),
(31, 5, '3cb8161707447d4a4e5ec53df996e39a.jpg'),
(32, 5, 'f9ce149fb6ba76accf7945881f0ca516.jpg'),
(36, 7, '0c795c255853ec13e3e28b5a3b23f125.png'),
(37, 7, '81aeee79485ba74d4501f3ea6052c4f2.png'),
(38, 7, '45e745a508f38ca00b39625a886a004a.png'),
(39, 5, 'e14625abfcb8767cbcf432c1ae87d0d0.png'),
(40, 5, '8bcee5ca58a8093045ecc5405b0b11c5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gender`
--

CREATE TABLE `tbl_gender` (
  `gender_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_gender`
--

INSERT INTO `tbl_gender` (`gender_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '2019-03-16 12:34:59', 1, '2019-03-16 12:34:59', 1),
(2, '2019-03-16 12:35:18', 1, '2019-03-16 12:35:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gender_description`
--

CREATE TABLE `tbl_gender_description` (
  `gender_description_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `gender_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_gender_description`
--

INSERT INTO `tbl_gender_description` (`gender_description_id`, `gender_id`, `language_id`, `gender_name`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Male', '2019-03-16 12:34:59', 1, '2019-03-16 12:34:59', 1),
(2, 1, 3, 'પુરુષ', '2019-03-16 12:34:59', 1, '2019-03-16 12:34:59', 1),
(3, 2, 1, 'Female', '2019-03-16 12:35:18', 1, '2019-03-16 12:35:18', 1),
(4, 2, 3, 'સ્ત્રી', '2019-03-16 12:35:18', 1, '2019-03-16 12:35:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_groups`
--

CREATE TABLE `tbl_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `see_all_data` tinyint(1) NOT NULL,
  `permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_groups`
--

INSERT INTO `tbl_groups` (`id`, `name`, `description`, `see_all_data`, `permissions`) VALUES
(1, 'admin', 'admin', 0, ''),
(2, 'general', 'general', 0, 'a:44:{i:0;s:13:\"Country|index\";i:1;s:11:\"State|index\";i:2;s:10:\"City|index\";i:3;s:14:\"Category|index\";i:4;s:15:\"Category|manage\";i:5;s:15:\"Category|delete\";i:6;s:10:\"Post|index\";i:7;s:11:\"Post|manage\";i:8;s:11:\"Post|delete\";i:9;s:10:\"Poll|index\";i:10;s:11:\"Poll|manage\";i:11;s:11:\"Poll|delete\";i:12;s:11:\"Samaj|index\";i:13;s:12:\"Samaj|manage\";i:14;s:12:\"Samaj|delete\";i:15;s:13:\"Surname|index\";i:16;s:14:\"Surname|manage\";i:17;s:14:\"Surname|delete\";i:18;s:10:\"Page|index\";i:19;s:11:\"Page|manage\";i:20;s:11:\"Page|delete\";i:21;s:11:\"Event|index\";i:22;s:12:\"Event|manage\";i:23;s:12:\"Event|delete\";i:24;s:13:\"Gallery|index\";i:25;s:14:\"Gallery|manage\";i:26;s:14:\"Gallery|delete\";i:27;s:12:\"Member|index\";i:28;s:13:\"Member|manage\";i:29;s:13:\"Member|delete\";i:30;s:18:\"BusinessType|index\";i:31;s:19:\"BusinessType|manage\";i:32;s:19:\"BusinessType|delete\";i:33;s:14:\"Business|index\";i:34;s:15:\"Business|manage\";i:35;s:15:\"Business|delete\";i:36;s:14:\"Language|index\";i:37;s:13:\"Language|save\";i:38;s:15:\"Language|delete\";i:39;s:21:\"Language|changeActive\";i:40;s:22:\"Language|changeDefault\";i:41;s:12:\"Native|index\";i:42;s:13:\"Native|manage\";i:43;s:13:\"Native|delete\";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_industry_type`
--

CREATE TABLE `tbl_industry_type` (
  `industry_type_id` int(11) NOT NULL,
  `industry_type_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_industry_type`
--

INSERT INTO `tbl_industry_type` (`industry_type_id`, `industry_type_name`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Education', 1, '2018-05-28 14:54:04', 1, '2018-05-31 16:02:37', 1),
(7, 'Construction Industry', 1, '2018-06-04 18:59:25', 1, '2018-08-03 11:48:10', 1),
(8, 'Manufacturing', 1, '2018-08-03 11:49:07', 1, '2018-08-03 11:49:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language_master`
--

CREATE TABLE `tbl_language_master` (
  `language_id` int(11) NOT NULL,
  `language_code` varchar(20) DEFAULT NULL,
  `language_name` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_language_master`
--

INSERT INTO `tbl_language_master` (`language_id`, `language_code`, `language_name`, `is_default`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'en', 'English', 1, 1, '2019-02-12 02:17:16', 1, '2019-09-18 03:05:08', 1),
(3, 'gu', 'ગુજરાતી', 0, 1, '2019-02-13 03:09:18', 1, '2019-02-12 02:13:07', 1),
(4, 'HI', 'Hindi', 0, 0, '2019-04-01 12:17:44', 1, '2019-04-01 12:17:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_attempts`
--

CREATE TABLE `tbl_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `responsetime` int(11) NOT NULL,
  `authorized` varchar(1) NOT NULL,
  `response` text NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `responsetime`, `authorized`, `response`, `response_code`) VALUES
(1, 'Api/SamajWebService/getNotificationList', 'post', '{\"Content-Type\":\"multipart\\/form-data; boundary=29288049-5012-469b-932a-10349636c747\",\"Content-Length\":\"627\",\"Host\":\"192.168.0.128\",\"Connection\":\"Keep-Alive\",\"Accept-Encoding\":\"gzip\",\"User-Agent\":\"okhttp\\/3.12.1\",\"auth_token\":\"5zbgpaa2mm8lgr2l93wx\",\"start\":\"1\",\"search\":\"\",\"language_id\":\"1\",\"member_id\":\"7\"}', '', '192.168.0.110', 1555926738, 0.210887, 1555926738, '1', '{\"status\":true,\"responseCode\":200,\"message\":\"Notification Listing successfully\",\"limit\":10,\"data\":[{\"notification_id\":\"34\",\"notification_title\":\"yjhhghfd\",\"description\":\"ghhhghghg\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"20-04-2019\",\"created_by\":\"1\",\"updated_at\":\"20-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"33\",\"notification_title\":\"sdffsdfsd\",\"description\":\"fsddsffdsfds\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"20-04-2019\",\"created_by\":\"1\",\"updated_at\":\"20-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"32\",\"notification_title\":\"samaj\",\"description\":\"adadada\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"20-04-2019\",\"created_by\":\"1\",\"updated_at\":\"20-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"31\",\"notification_title\":\"samaj\",\"description\":\"samaj\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"20-04-2019\",\"created_by\":\"1\",\"updated_at\":\"20-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"30\",\"notification_title\":\"test\",\"description\":\"test\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"29\",\"notification_title\":\"test\",\"description\":\"test\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"28\",\"notification_title\":\"test\",\"description\":\"testtesttesttesttesttesttesttest\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"27\",\"notification_title\":\"test\",\"description\":\"test\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"24\",\"notification_title\":\"Samaj\",\"description\":\"Samaj\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"5f022eb8fe6d4ca0100e4b82acd181aa.png\",\"notification_image_path\":\"http:\\/\\/192.168.0.128\\/samaj\\/uploads\\/notification_image\\/5f022eb8fe6d4ca0100e4b82acd181aa.png\"},{\"notification_id\":\"22\",\"notification_title\":\"TITLE\",\"description\":\"SEND NOW\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"2cd4750df4ffb1edb9e0f9e9c94d1a07.jpg\",\"notification_image_path\":\"http:\\/\\/192.168.0.128\\/samaj\\/uploads\\/notification_image\\/2cd4750df4ffb1edb9e0f9e9c94d1a07.jpg\"}]}', 200),
(2, 'Api/SamajWebService/getNotificationList', 'post', '{\"Content-Type\":\"multipart\\/form-data; boundary=3ff5c79f-8a04-44e1-9814-53f3b1147a11\",\"Content-Length\":\"627\",\"Host\":\"192.168.0.128\",\"Connection\":\"Keep-Alive\",\"Accept-Encoding\":\"gzip\",\"User-Agent\":\"okhttp\\/3.12.1\",\"auth_token\":\"5zbgpaa2mm8lgr2l93wx\",\"start\":\"2\",\"search\":\"\",\"language_id\":\"1\",\"member_id\":\"7\"}', '', '192.168.0.110', 1555926740, 0.181759, 1555926740, '1', '{\"status\":true,\"responseCode\":200,\"message\":\"Notification Listing successfully\",\"limit\":10,\"data\":[{\"notification_id\":\"20\",\"notification_title\":\"testing of notification crash\",\"description\":\"testing of notification crash\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"19\",\"notification_title\":\"testing of notification crash\",\"description\":\"testing of notification crash\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"18\",\"notification_title\":\"test\",\"description\":\"test\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"17\",\"notification_title\":\"test\",\"description\":\"test\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"16\",\"notification_title\":\"test\",\"description\":\"test\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"15\",\"notification_title\":\"test\",\"description\":\"TEST\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"18-04-2019\",\"created_by\":\"1\",\"updated_at\":\"18-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"14\",\"notification_title\":\"its all about testing\",\"description\":\"its all about testingits all about testingits all about testingits all about testingits all about testingits all about testing\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"17-04-2019\",\"created_by\":\"1\",\"updated_at\":\"17-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"13\",\"notification_title\":\"its all about testing\",\"description\":\"its all about testingits all about testingits all about testingits all about testingits all about testingits all about testingits all about testingits all about testing\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"17-04-2019\",\"created_by\":\"1\",\"updated_at\":\"17-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"\",\"notification_image_path\":null},{\"notification_id\":\"12\",\"notification_title\":\"Outdoor Adventures\",\"description\":\"Choose an adventure really carefully. One that people will easily pay good money for. “Focus group” it. At least informally ask lots of people for their feedback on a suggested adventure before you put any money into marketing it. Then when you do offer your first trip, make it incredible! Research it carefully and surpass people’s expectations. On your first few trips it is more important to build a great experience and a great reputation, then to make a lot of money right out of the gate.\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"17-04-2019\",\"created_by\":\"1\",\"updated_at\":\"17-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"1d7853c8a79fb749c90ba3c1efd7678e.jpg\",\"notification_image_path\":\"http:\\/\\/192.168.0.128\\/samaj\\/uploads\\/notification_image\\/1d7853c8a79fb749c90ba3c1efd7678e.jpg\"},{\"notification_id\":\"11\",\"notification_title\":\"Mobile DJ\",\"description\":\"You should have some decent equipment that makes your audience happy but that could mean different levels of investment for different audiences. Are you going to be playing for large event venues or for junior high school birthday parties? I know a fellow who started a successful mobile DJ business even before he was old enough to have a driver’s license. He would either have a friend give him and his equipment a ride to his gigs, or he would get a taxi.\",\"send_to\":\"Android\",\"send_type\":\"Send_Now\",\"notification_type_id\":\"0\",\"notification_type\":\"general\",\"is_active\":\"1\",\"created_at\":\"17-04-2019\",\"created_by\":\"1\",\"updated_at\":\"17-04-2019\",\"updated_by\":\"1\",\"notification_image\":\"ef679c3b02f7fde75fa0409e84db5f7f.jpeg\",\"notification_image_path\":\"http:\\/\\/192.168.0.128\\/samaj\\/uploads\\/notification_image\\/ef679c3b02f7fde75fa0409e84db5f7f.jpeg\"}]}', 200),
(3, 'Api/SamajWebService/getLanguageList', 'post', '{\"Content-Type\":\"multipart\\/form-data; boundary=82940aaf-4e0f-4c31-b214-9471137959bb\",\"Content-Length\":\"152\",\"Host\":\"192.168.0.128\",\"Connection\":\"Keep-Alive\",\"Accept-Encoding\":\"gzip\",\"User-Agent\":\"okhttp\\/3.12.1\",\"start\":\"1\"}', '', '192.168.0.110', 1555926748, 0.16329, 1555926748, '1', '{\"status\":true,\"responseCode\":200,\"message\":\"Language Listing successfully\",\"limit\":10,\"data\":[{\"language_id\":\"1\",\"language_code\":\"en\",\"language_name\":\"English\",\"is_default\":\"1\",\"is_active\":\"1\",\"created_at\":\"2019-02-12 02:17:16\",\"created_by\":\"1\",\"updated_at\":\"2019-09-18 03:05:08\",\"updated_by\":\"1\"},{\"language_id\":\"3\",\"language_code\":\"gu\",\"language_name\":\"ગુજરાતી\",\"is_default\":\"0\",\"is_active\":\"1\",\"created_at\":\"2019-02-13 03:09:18\",\"created_by\":\"1\",\"updated_at\":\"2019-02-12 02:13:07\",\"updated_by\":\"1\"}]}', 200),
(4, 'Api/SamajWebService/getLanguageList', 'post', '{\"Content-Type\":\"multipart\\/form-data; boundary=1fb85898-8be6-40d2-922b-493b9ac503b9\",\"Content-Length\":\"152\",\"Host\":\"192.168.0.128\",\"Connection\":\"Keep-Alive\",\"Accept-Encoding\":\"gzip\",\"User-Agent\":\"okhttp\\/3.12.1\",\"start\":\"2\"}', '', '192.168.0.110', 1555926749, 0.185499, 1555926749, '1', '{\"status\":false,\"responseCode\":404,\"message\":\"No Data Found\",\"limit\":10,\"data\":[]}', 404);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log_email`
--

CREATE TABLE `tbl_log_email` (
  `log_email_id` int(11) NOT NULL,
  `response` text NOT NULL,
  `request_time` datetime DEFAULT NULL,
  `response_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `email_type` int(11) DEFAULT NULL,
  `email_content` text,
  `is_sent` tinyint(1) DEFAULT '0',
  `contact_name` varchar(100) DEFAULT '0',
  `contact_type` varchar(10) DEFAULT '0',
  `contact` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marital_status`
--

CREATE TABLE `tbl_marital_status` (
  `marital_status_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_marital_status`
--

INSERT INTO `tbl_marital_status` (`marital_status_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '2019-03-18 18:41:52', 1, '2019-03-18 18:41:52', 1),
(2, '2019-03-18 18:42:13', 1, '2019-03-18 18:42:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marital_status_description`
--

CREATE TABLE `tbl_marital_status_description` (
  `marital_status_description_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `marital_status` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_marital_status_description`
--

INSERT INTO `tbl_marital_status_description` (`marital_status_description_id`, `marital_status_id`, `language_id`, `marital_status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Married', '2019-03-18 06:41:52', 1, '2019-03-18 06:41:52', 1),
(2, 1, 3, 'પરણિત', '2019-03-18 06:41:52', 1, '2019-03-18 06:41:52', 1),
(3, 2, 1, 'UnMarried', '2019-03-18 06:42:13', 1, '2019-03-18 06:42:13', 1),
(4, 2, 3, 'અપરિણીત', '2019-03-18 06:42:13', 1, '2019-03-18 06:42:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_market_segment`
--

CREATE TABLE `tbl_market_segment` (
  `market_segment_id` int(11) NOT NULL,
  `market_segment_name` varchar(50) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `is_default` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_market_segment`
--

INSERT INTO `tbl_market_segment` (`market_segment_id`, `market_segment_name`, `sort_order`, `is_default`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Lowwer Income', 1, 0, 1, '2018-05-31 15:19:17', 1, '2018-08-01 14:46:12', 1),
(2, 'Middle Income', 2, 0, 1, '2018-05-31 15:21:20', 1, '2018-08-01 14:46:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_members`
--

CREATE TABLE `tbl_members` (
  `member_id` int(11) NOT NULL,
  `parent_member_id` int(11) NOT NULL,
  `blood_group_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `relationship_master_id` int(11) NOT NULL,
  `marriage_date` date NOT NULL,
  `gender_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `member_number` varchar(50) DEFAULT NULL,
  `surname_id` int(11) NOT NULL,
  `education_id` varchar(255) NOT NULL,
  `native_id` int(11) DEFAULT NULL,
  `current_work` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `member_pincode` varchar(10) NOT NULL,
  `aadhar_card_no` varchar(12) NOT NULL,
  `otp` int(11) NOT NULL,
  `otp_validity` datetime NOT NULL,
  `auth_token` varchar(256) NOT NULL,
  `auth_token_validity` date NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `is_admin` tinyint(4) NOT NULL,
  `created_from` enum('user') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_members`
--

INSERT INTO `tbl_members` (`member_id`, `parent_member_id`, `blood_group_id`, `marital_status_id`, `relationship_master_id`, `marriage_date`, `gender_id`, `samaj_id`, `member_number`, `surname_id`, `education_id`, `native_id`, `current_work`, `email`, `date_of_birth`, `state_id`, `city_id`, `member_pincode`, `aadhar_card_no`, `otp`, `otp_validity`, `auth_token`, `auth_token_validity`, `is_active`, `is_admin`, `created_from`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(7, 0, 1, 1, 0, '0000-00-00', 1, 1, NULL, 4, '1', 1, 'Digitattva Technolabs', 'akki.54874@gmail.com', '1997-07-27', 738, 3399, '395006', '320145698678', 992129, '2019-04-22 13:58:21', '5zbgpaa2mm8lgr2l93wx', '2019-07-22', 1, 1, 'user', '2019-04-15 10:45:55', 1, '2019-04-20 12:24:29', 1),
(8, 0, 1, 2, 0, '0000-00-00', 1, 1, '007', 15, '1', 1, 'Digitattva Technolabs', 'harsh.lad@digitattva.com', '1996-12-27', 738, 3399, '394325', '963021547896', 623956, '2019-04-22 11:01:10', '7dlz2pyen3g7y74l9vcm', '2019-07-22', 1, 1, 'user', '2019-04-15 17:47:31', 1, '2019-04-17 17:53:01', 1),
(15, 8, 1, 2, 0, '0000-00-00', 1, 1, '063', 15, '1', 1, 'IT Solutions', 'upansu.prajapati@gmail.com', '1997-03-13', 738, 3399, '351869', '964581632186', 858973, '2019-04-22 12:35:43', 'oaduqg6xpp32s237jphl', '2019-07-22', 1, 1, 'user', '0000-00-00 00:00:00', 0, '2019-04-19 12:48:52', 1),
(16, 0, 1, 1, 0, '0000-00-00', 1, 1, '450', 1, '1', 1, 'Surat', 'rutuj.tailor@digitattva.com', '1996-02-08', 738, 6179, '456123', '789456321045', 0, '0000-00-00 00:00:00', '', '0000-00-00', 1, 1, 'user', '0000-00-00 00:00:00', 0, '2019-04-19 12:50:47', 1),
(17, 8, 1, 2, 0, '0000-00-00', 1, 1, '078', 7, '1,7', 1, 'Digitattva Technolabs', 'kushangoza@gmail.com', '1997-07-16', 738, 3399, '394325', '936484684854', 882418, '2019-04-20 19:31:58', 'b558c9ogo3xhkyh1b5sw', '2019-07-20', 1, 1, 'user', '2019-04-17 15:28:07', 1, '2019-04-19 12:51:21', 1),
(18, 7, 1, 1, 1, '0000-00-00', 1, 1, '089', 4, '7,8', 1, 'Digitattva Technolabs', 'mahesh@digitattva.com', '1994-08-17', 738, 3399, '394560', '548974651946', 851318, '2019-04-19 13:22:52', 'mjzt22ae21be7715gwwu', '2019-07-19', 1, 1, 'user', '2019-04-17 15:31:47', 1, '2019-04-20 10:53:58', 1),
(19, 8, 1, 2, 0, '0000-00-00', 1, 1, '090', 8, '1,3', 1, 'Digitattva Technolabs', 'ashish.pawar@digitattva.com', '1996-04-05', 738, 3399, '396461', '547894216549', 284626, '2019-04-18 19:47:20', '6611wp8nd3r5kcd9isjn', '2019-07-18', 1, 1, 'user', '2019-04-17 15:34:52', 1, '2019-04-19 12:52:34', 1),
(20, 7, 1, 2, 0, '0000-00-00', 1, 1, '524', 12, '1,4', 1, 'Digitattva Technolabs', 'tanmay.patel@digitattva.com', '1996-05-21', 738, 6179, '546545', '648132165485', 682974, '2019-04-18 13:26:46', 'bgr6byjthizufih7ojm6', '2019-07-18', 1, 1, 'user', '2019-04-17 15:37:48', 1, '2019-04-19 12:53:21', 1),
(21, 7, 1, 2, 0, '0000-00-00', 1, 1, '564', 7, '5,6', 1, 'Digitattva Technolabs', 'anand.varma@digitattva.com', '1997-02-20', 738, 3399, '545454', '354895421484', 397894, '2019-04-19 13:24:32', 'nz4akhq4waf7fkptldeg', '2019-07-19', 1, 1, 'user', '2019-04-17 15:41:33', 1, '2019-04-19 12:53:51', 1),
(22, 8, 1, 1, 2, '0000-00-00', 1, 1, '546', 12, '1', 1, 'Digitattva Technolabs', 'dhruvin.patel@digitattva.com', '1996-09-24', 738, 6179, '656561', '547897894654', 433259, '2019-04-20 12:03:34', 'xu1kmw5bgycoliwkxtng', '2019-07-20', 1, 1, 'user', '2019-04-17 15:53:27', 1, '2019-04-20 12:25:38', 1),
(23, 0, 1, 2, 0, '0000-00-00', 1, 1, NULL, 6, '1,5', 1, 'Digitattva Technolabs', 'naitik.shah@digitattva.com', '1987-04-02', 738, 3399, '564564', '654644654654', 662947, '2019-04-18 19:47:44', 'hvpqsxadkragk65zcw57', '2019-07-18', 1, 1, 'user', '2019-04-17 15:55:55', 1, '2019-04-19 12:55:18', 1),
(33, 7, 2, 2, 0, '0000-00-00', 2, 1, '54874', 3, '1', 1, 'CEO At Amazon', 'Khush@gmail.com', '1997-08-16', 738, 6178, '395006', '451245836987', 919138, '2019-04-19 13:14:47', 'ymlmsgzuo542w82uw657', '2019-07-19', 1, 1, 'user', '2019-04-19 12:14:57', 1, '2019-04-19 13:11:06', 1),
(34, 23, 1, 2, 0, '0000-00-00', 2, 1, '654', 12, '1,3', 1, 'House wife', 'shah.naitik.23825@gmail.com', '1990-04-11', 738, 3399, '395001', '123456789125', 0, '0000-00-00 00:00:00', '', '0000-00-00', 1, 1, 'user', '0000-00-00 00:00:00', 0, '2019-04-19 12:56:39', 1),
(36, 0, 1, 1, 0, '2019-12-12', 1, 1, '45112', 1, '1', NULL, 'Surat', 'rutuj.tailor@digitattva.coms', '1996-02-08', 1, 1, '456123', '789456321048', 0, '0000-00-00 00:00:00', '', '0000-00-00', 1, 0, 'user', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(37, 0, 1, 1, 0, '2019-12-12', 1, 1, '432', 1, '1', 1, 'Surat', 'rutuj.tailoras@digitattva.com', '1996-02-08', 1, 1, '456123', '789456321088', 0, '0000-00-00 00:00:00', '', '0000-00-00', 1, 1, 'user', '0000-00-00 00:00:00', 0, '2019-04-20 16:37:22', 1),
(38, 7, 3, 2, 0, '1970-01-01', 1, 1, NULL, 4, '1,5', NULL, 'Ceo At Snapdeal', 'Ray.parth@gmail.com', '1996-05-01', 738, 3399, '395006', '457865895689', 0, '0000-00-00 00:00:00', '', '0000-00-00', 1, 0, 'user', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member_biodata_file`
--

CREATE TABLE `tbl_member_biodata_file` (
  `member_biodata_file_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_member_biodata_file`
--

INSERT INTO `tbl_member_biodata_file` (`member_biodata_file_id`, `member_id`, `filename`) VALUES
(1, 7, '7f838c30566602e0bbd9855a2c8014fd.jpg'),
(2, 8, '894b69d46808014a08fea523f8d6ae3a.docx'),
(3, 17, 'e8a27e042fd8c8b0f1e4a864350058b1.docx'),
(5, 33, '01eabc5b505cd0371c475fbc334e9d3f.png'),
(6, 38, '25f752ac5f790dfe4711c380107517fd.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member_description`
--

CREATE TABLE `tbl_member_description` (
  `member_description_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `member_address` text CHARACTER SET utf8,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_member_description`
--

INSERT INTO `tbl_member_description` (`member_description_id`, `member_id`, `language_id`, `first_name`, `middle_name`, `member_address`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(13, 7, 1, 'Akki (Ankit)', 'Rasik bhai ', 'E - Suryadev App , Silpapark Soc , Varachha , Surat - 395006', '2019-04-15 10:45:55', 1, '2019-04-22 11:57:13', 1),
(14, 7, 3, 'અક્કી', 'રસિકભાઈ', 'સૂર્યદેવ એપ, સિલપાપરર્ક સોક, એલ. એચ. રોડ, વરછ, સુરત - 395006', '2019-04-15 10:45:55', 1, '2019-04-20 12:24:29', 1),
(15, 8, 1, 'Harsh', 'Shailesh bhai', 'Antroli,Surat,Gujrat', '2019-04-15 05:47:31', 1, '2019-04-17 05:53:01', 1),
(23, 8, 3, 'હર્ષ', 'શૈલેશભાઈ', 'એન્ટ્રોલી, સુરત', '2019-04-15 07:21:58', 1, '2019-04-17 05:53:01', 1),
(24, 15, 1, 'Upansu', 'Yogendra', 'Karcheliya,Surat', '2019-04-16 01:13:40', 0, '2019-04-19 12:48:52', 1),
(25, 15, 3, 'ઉપનસુ', 'યોગન્દ્ર', 'કરચેલિયા, સુરત', '2019-04-16 01:13:40', 0, '2019-04-19 12:48:52', 1),
(26, 16, 1, 'Rutuj', 'Prakash Bhai', 'surat', '2019-04-17 01:48:53', 0, '2019-04-19 12:50:47', 1),
(27, 16, 3, 'રૂટુજ', 'પ્રકાશ ભાઈ', 'સુરત', '2019-04-17 01:48:53', 0, '2019-04-19 12:50:47', 1),
(28, 17, 1, 'Kushang Bhai', 'Ashish Bhai', 'Adajan,Surat', '2019-04-17 03:28:07', 1, '2019-04-19 12:51:21', 1),
(29, 17, 3, 'કુશંગ ભાઈ', 'આશિષ ભાઈ', 'અદાજન, સુરત', '2019-04-17 03:28:07', 1, '2019-04-19 12:51:21', 1),
(30, 18, 1, 'Mahesh Bhai', 'Arvind Bhai', 'Ver Road,Surat', '2019-04-17 03:31:47', 1, '2019-04-20 10:53:58', 1),
(31, 18, 3, 'મહેશ ભાઈ', 'અરવિંદ ભાઈ', 'વેર રોડ, સુરત', '2019-04-17 03:31:47', 1, '2019-04-20 10:53:58', 1),
(32, 19, 1, 'Ashish Kumar', 'Jignesh Bhai', 'Parvat Gam , Surat', '2019-04-17 03:34:52', 1, '2019-04-19 12:52:34', 1),
(33, 19, 3, 'આશિષ કુમાર', 'જિજ્ઞેશ ભાઈ', 'પાર્વત ગામ, સુરત', '2019-04-17 03:34:52', 1, '2019-04-19 12:52:34', 1),
(34, 20, 1, 'Tanmay', 'Kirti bhai', 'Mahuva, Surat', '2019-04-17 03:37:48', 1, '2019-04-19 12:53:21', 1),
(35, 20, 3, 'તનમાઇ', 'કિર્તિભાઈ', 'મહુવા, સુરત', '2019-04-17 03:37:48', 1, '2019-04-19 12:53:21', 1),
(36, 21, 1, 'Anand', 'Om Prakash Bhai', 'Dindoli Surat', '2019-04-17 03:41:33', 1, '2019-04-19 12:53:51', 1),
(37, 21, 3, 'આનંદ', 'ઓમ પ્રકાશ ભાઈ', 'દિંડોળી, સુરત', '2019-04-17 03:41:33', 1, '2019-04-19 12:53:51', 1),
(38, 22, 1, 'Dhruvin', 'Mahesh Bhai', 'Station Road , Bardoli', '2019-04-17 03:53:27', 1, '2019-04-20 12:25:38', 1),
(39, 22, 3, 'ધ્રુવિન', 'મહેશ ભાઈ', 'સ્ટેશન રોડ બારડોલી', '2019-04-17 03:53:27', 1, '2019-04-20 12:25:38', 1),
(40, 23, 1, 'Naitik ', 'Haresh Bhai', 'Nanpura , Surat', '2019-04-17 03:55:55', 1, '2019-04-19 01:07:01', 1),
(41, 23, 3, 'નૈતિક', 'હરેશ ભાઇ', 'નનપુરા, સુરત', '2019-04-17 03:55:55', 1, '2019-04-19 12:55:18', 1),
(60, 33, 1, 'Khush', 'P.', 'Madhi Sugar Staff Soc, Madhi , Gujarat , India - 395006', '2019-04-19 12:14:57', 1, '2019-04-19 01:11:06', 1),
(61, 33, 3, 'ખુશ', 'પી.', 'મધુ સુગર સ્ટાફ સોક, મઢિ, ગુજરાત, ભારત - 395006', '2019-04-19 12:14:57', 1, '2019-04-19 01:11:06', 1),
(62, 34, 1, 'Hetvi', 'Kartik Bhai', '4-g, siddha sila appartment', '2019-04-19 12:51:26', 0, '2019-04-19 12:56:39', 1),
(63, 34, 3, 'હેત્વી', 'કાર્તિક ભાઈ', '4-જી, સિદ્ધ સિલા એપાર્ટમેન્ટ', '2019-04-19 12:51:26', 0, '2019-04-19 12:56:39', 1),
(66, 36, 1, 'Rutuj', 'Prakash Bhai', 'surat', '2019-04-19 06:40:13', 0, '2019-04-19 06:40:13', 0),
(67, 36, 3, 'Rutuj', 'Prakash Bhai', 'surat', '2019-04-19 06:40:13', 0, '2019-04-19 06:40:13', 0),
(68, 37, 1, 'RutujS', 'Prakash BhaiS', 'surat', '2019-04-19 07:00:11', 0, '2019-04-20 04:37:22', 1),
(69, 37, 3, 'RutujS', 'Prakash BhaiS', 'surat', '2019-04-19 07:00:11', 0, '2019-04-20 04:37:22', 1),
(70, 38, 1, 'Parth', 'Akki bhai', 'Sai soc , Dindoli , surat , Gujarat , India - 395010', '2019-04-22 11:56:19', 0, '2019-04-22 11:56:19', 0),
(71, 38, 3, 'Parth', 'Akki bhai', 'Sai soc , Dindoli , surat , Gujarat , India - 395010', '2019-04-22 11:56:19', 0, '2019-04-22 11:56:19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member_file`
--

CREATE TABLE `tbl_member_file` (
  `member_file_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_member_file`
--

INSERT INTO `tbl_member_file` (`member_file_id`, `member_id`, `filename`) VALUES
(5, 8, '326362b63092d4014230f68c7044bdb6.jpg'),
(12, 15, '0e0d229710973360017cd316c11c3999.jpg'),
(13, 17, '4662d51f11a525fb46a7f0004911d0a0.jpg'),
(14, 18, '3f24c01d6329556c67358438664f0091.jpg'),
(15, 19, '74f840b28933914fef10d8144d15ca1e.jpg'),
(16, 20, '37d66a4871ebf8b598e7d5f6ebd6f5fe.jpg'),
(17, 21, '38418a692dfe7d7a3082f0e17922e174.jpg'),
(18, 22, '9aad6832372c7b19c6b37ab02646adf0.jpg'),
(26, 23, 'd7df0a9bda8fcfa8766c919a412574c7.jpg'),
(30, 16, 'c2547d2447b17758e27298d0b5fa3e61.jpg'),
(31, 34, '1c6503ecfd358c88c8a06eeea647dbc1.jpg'),
(32, 33, '106ebca97d2f38045f92534600ef4802.jpg'),
(33, 38, 'a96de59b468d86c7725d629edee55208.jpg'),
(34, 7, '5dae55df145facf22c13d66be39d966a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member_marital_status`
--

CREATE TABLE `tbl_member_marital_status` (
  `marital_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `marital_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member_mobile`
--

CREATE TABLE `tbl_member_mobile` (
  `member_mobile_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `mobile` varchar(256) NOT NULL,
  `mobile_type` varchar(50) DEFAULT NULL,
  `temp_mobile_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_member_mobile`
--

INSERT INTO `tbl_member_mobile` (`member_mobile_id`, `member_id`, `mobile`, `mobile_type`, `temp_mobile_number`) VALUES
(7, 8, '9638076983', 'Mobile', ''),
(15, 15, '9645861385', 'Mobile', ''),
(16, 16, '9638079683', 'Mobile', ''),
(17, 17, '9173790365', 'Mobile', ''),
(18, 18, '7359506297', 'Mobile', ''),
(19, 19, '8511663006', 'Mobile', ''),
(20, 20, '9725190085', 'Mobile', ''),
(21, 21, '8141504653', 'Mobile', ''),
(22, 22, '7874511716', 'Mobile', ''),
(32, 8, '9726071397', 'Work', ''),
(46, 34, '8976677222', 'Mobile', ''),
(47, 33, '9099686969', 'Home', ''),
(49, 23, '8976677224', NULL, ''),
(52, 36, '9638079684', NULL, ''),
(54, 37, '9638079686', 'Mobile', ''),
(56, 38, '8080452565', NULL, ''),
(57, 7, '9714154356', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monk`
--

CREATE TABLE `tbl_monk` (
  `monk_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `diksha_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monk_description`
--

CREATE TABLE `tbl_monk_description` (
  `monk_description_id` int(11) NOT NULL,
  `monk_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `monk_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monk_location`
--

CREATE TABLE `tbl_monk_location` (
  `monk_location_id` int(11) NOT NULL,
  `monk_id` int(11) DEFAULT NULL,
  `location_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_address` text CHARACTER SET utf8,
  `latitude` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `contact_person_mobile` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_native`
--

CREATE TABLE `tbl_native` (
  `native_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_native`
--

INSERT INTO `tbl_native` (`native_id`, `samaj_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, '2019-03-23 18:13:32', 1, '2019-03-23 18:13:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_native_location`
--

CREATE TABLE `tbl_native_location` (
  `native_location_id` int(11) NOT NULL,
  `native_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `native_location` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_native_location`
--

INSERT INTO `tbl_native_location` (`native_location_id`, `native_id`, `language_id`, `native_location`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Surat', '2019-03-23 06:13:32', 1, '2019-03-23 06:13:32', 1),
(2, 1, 3, 'સુરત', '2019-03-23 06:13:32', 1, '2019-03-23 06:13:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification_schedule_mapper`
--

CREATE TABLE `tbl_notification_schedule_mapper` (
  `notification_schedule_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `notification_date` date NOT NULL,
  `notification_time` time NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pachkhan`
--

CREATE TABLE `tbl_pachkhan` (
  `pachkhan_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pachkhan`
--

INSERT INTO `tbl_pachkhan` (`pachkhan_id`, `filename`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '547ec3d89c11ff07f224f1fbf13feb31.mp3', '2019-03-30 12:45:28', 1, '2019-03-30 12:45:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pachkhan_description`
--

CREATE TABLE `tbl_pachkhan_description` (
  `pachkhan_description_id` int(11) NOT NULL,
  `pachkhan_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `pachkhan_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `short_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `long_description` text CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_by` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pachkhan_description`
--

INSERT INTO `tbl_pachkhan_description` (`pachkhan_description_id`, `pachkhan_id`, `language_id`, `pachkhan_name`, `short_description`, `long_description`, `created_at`, `updated_at`, `updated_by`, `created_by`) VALUES
(1, 1, 1, 'Pachkhan', 'Pachkhan', '<p>Pachkhan</p>\n', '2019-03-30 12:45:28', 2019, 1, '0000-00-00 00:00:00'),
(2, 1, 3, 'પંચખન', 'પંચખન', '<p>પંચખન</p>\n', '2019-03-30 12:45:28', 2019, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pages`
--

CREATE TABLE `tbl_pages` (
  `page_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page_description`
--

CREATE TABLE `tbl_page_description` (
  `page_description_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `page_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `short_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `long_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_page_description`
--

INSERT INTO `tbl_page_description` (`page_description_id`, `page_id`, `language_id`, `page_name`, `short_description`, `long_description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 9, 'Wyatt Guerrero', 'Magni magni est amet', '                                                                                                                                    ', '2019-02-18 03:43:20', 1, '2019-02-18 03:43:20', 1),
(2, 1, 11, 'વૉટ ગુરેરો', 'વૉટ ગુરેરો\n', '                                                                                                                                    ', '2019-02-18 03:43:20', 1, '2019-02-18 03:43:20', 1),
(3, 2, 9, 'Paula Hodge', 'Aute asperiores null', '<p>speriores null</p>\n', '2019-02-18 03:50:55', 1, '2019-02-18 03:50:55', 1),
(4, 2, 11, 'હેડવિગ માર્કસ', 'હેડવિગ માર્ક', '<p>હેડવિગ માર્ક</p>\n', '2019-02-18 03:50:55', 1, '2019-02-18 03:50:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_password_reset`
--

CREATE TABLE `tbl_password_reset` (
  `password_reset_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_used` tinyint(4) DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `is_latest` tinyint(4) NOT NULL,
  `type` varchar(100) DEFAULT 'user',
  `send_mail` enum('Forgot_password','Register','login') NOT NULL DEFAULT 'Forgot_password'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_polls`
--

CREATE TABLE `tbl_polls` (
  `poll_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `is_multiple` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `samaj_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_polls`
--

INSERT INTO `tbl_polls` (`poll_id`, `question`, `field_type`, `sort_order`, `is_active`, `is_required`, `is_multiple`, `created_at`, `created_by`, `updated_at`, `updated_by`, `samaj_id`) VALUES
(1, 'Gender', 'text', 8, 0, 1, 1, '2018-08-14 13:21:06', 1, '2018-10-06 11:28:47', 1, 13),
(2, 'DOB', 'textarea', 9, 1, 1, 1, '2018-08-14 13:22:07', 1, '2018-08-14 13:22:07', 1, 13),
(3, 'Who is the best in the world?', 'radio', 5, 1, 0, 1, '2018-10-12 14:33:35', 1, '2018-10-12 14:33:35', 1, 16),
(4, '', 'radio', 1, 1, 1, 1, '2019-02-27 15:14:21', 1, '2019-02-27 15:14:21', 1, 32),
(12, '', 'radio', 1, 1, 1, 1, '2019-03-01 10:58:42', 1, '2019-03-01 10:58:42', 1, 32),
(13, '', 'radio', 1, 1, 1, 1, '2019-03-01 11:02:59', 1, '2019-03-01 11:02:59', 1, 32),
(14, '', 'radio', 1, 1, 1, 1, '2019-03-01 11:07:31', 1, '2019-03-01 11:07:31', 1, 32),
(15, '', 'radio', 1, 1, 1, 1, '2019-03-01 11:08:08', 1, '2019-03-01 11:08:08', 1, 32),
(16, '', 'radio', 1, 1, 1, 1, '2019-03-01 11:09:12', 1, '2019-03-01 11:09:12', 1, 32),
(17, '', 'radio', 1, 1, 1, 0, '2019-04-02 17:01:16', 1, '2019-04-02 17:01:16', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_poll_description`
--

CREATE TABLE `tbl_poll_description` (
  `poll_description_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `question` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_poll_description`
--

INSERT INTO `tbl_poll_description` (`poll_description_id`, `poll_id`, `language_id`, `question`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(5, 4, 1, 'New Dummy Question', '2019-02-27 03:14:21', 1, '2019-02-27 03:14:21', 1),
(11, 12, 1, 'Who is responsible for Pulvama Attack', '2019-03-01 10:58:42', 1, '2019-03-01 10:58:42', 1),
(12, 13, 1, 'Who is responsible for Pulvama Attacks', '2019-03-01 11:02:59', 1, '2019-03-01 11:02:59', 1),
(13, 14, 1, 'Who is responsible for Pulvama Attackss', '2019-03-01 11:07:31', 1, '2019-03-01 11:07:31', 1),
(14, 15, 1, 'Who is responsible for Pulvama Attacksss', '2019-03-01 11:08:08', 1, '2019-03-01 11:08:08', 1),
(15, 16, 1, 'Who is responsible for Pulvama Attackssss', '2019-03-01 11:09:12', 1, '2019-03-01 11:09:12', 1),
(16, 17, 1, 'test', '2019-04-02 05:01:16', 1, '2019-04-02 05:01:16', 1),
(17, 17, 3, 'Test', '2019-04-02 05:01:16', 1, '2019-04-02 05:01:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_poll_value`
--

CREATE TABLE `tbl_poll_value` (
  `poll_value_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `poll_value` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_poll_value`
--

INSERT INTO `tbl_poll_value` (`poll_value_id`, `poll_id`, `sort_order`, `poll_value`) VALUES
(1, 3, 1, 'Ronaldo'),
(2, 3, 2, 'Messi'),
(3, 4, 1, '1st poll'),
(4, 4, 2, '2nd poll'),
(16, 17, 2, 'test 2'),
(15, 17, 1, 'test 1'),
(14, 14, 1, 'Terrior'),
(13, 13, 1, 'Terrior'),
(17, 17, 3, 'test 3'),
(18, 17, 4, 'test 4');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `post_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `tags` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `samaj_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_posts`
--

INSERT INTO `tbl_posts` (`post_id`, `member_id`, `tags`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`, `samaj_id`) VALUES
(4, 4, '#navratricelebration', 1, '2019-04-15 11:08:49', 4, '2019-04-15 11:08:49', 4, 1),
(5, 4, '#navratricelebrationafterParty', 1, '2019-04-15 12:07:28', 4, '2019-04-15 12:07:28', 4, 1),
(17, 4, '#Diwali ', 1, '2019-04-15 12:08:22', 4, '2019-04-15 12:08:22', 4, 1),
(20, 4, '#DiwaliCelebrations', 1, '2019-04-15 12:18:54', 4, '2019-04-15 12:18:54', 4, 1),
(21, 4, '#DiwaliCelebrations', 1, '2019-04-15 01:24:14', 4, '2019-04-15 01:24:14', 4, 1),
(22, 4, '#DiwaliCelebrations', 1, '2019-04-15 12:19:37', 4, '2019-04-15 12:19:37', 4, 1),
(27, 7, 'postr tag', 1, '2019-04-15 04:06:19', 7, '2019-04-18 16:59:45', 1, 1),
(28, 7, 'postr tag', 1, '2019-04-15 04:43:33', 7, '2019-04-15 04:43:33', 7, 1),
(29, 7, 'postr tag', 1, '2019-04-15 04:44:56', 7, '2019-04-15 04:44:56', 7, 1),
(74, 8, 'postr tag', 1, '2019-04-19 01:15:17', 8, '2019-04-19 01:15:17', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_category`
--

CREATE TABLE `tbl_post_category` (
  `post_category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_post_category`
--

INSERT INTO `tbl_post_category` (`post_category_id`, `post_id`, `category_id`) VALUES
(9, 4, 1),
(27, 5, 1),
(28, 17, 1),
(38, 20, 1),
(40, 22, 1),
(56, 21, 1),
(59, 28, 1),
(60, 29, 1),
(128, 27, 1),
(141, 74, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_description`
--

CREATE TABLE `tbl_post_description` (
  `post_description_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_post_description`
--

INSERT INTO `tbl_post_description` (`post_description_id`, `post_id`, `language_id`, `title`, `content`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(7, 4, 1, 'Navratri Celebration', 'Navratri Celebration', '2019-04-15 11:08:49', 4, '2019-04-15 11:08:49', 4),
(8, 4, 3, 'Navratri Celebration', 'Navratri Celebration', '2019-04-15 11:08:49', 4, '2019-04-15 11:08:49', 4),
(9, 5, 1, 'Navratri Celebration After Party', 'Navratri Celebration After Party', '2019-04-15 12:06:57', 4, '2019-04-15 12:06:57', 4),
(10, 5, 3, 'Navratri Celebration After Party', 'Navratri Celebration After Party', '2019-04-15 12:07:28', 4, '2019-04-15 12:07:28', 4),
(33, 17, 1, 'Diwali ', 'Diwali ', '2019-04-15 12:08:22', 4, '2019-04-15 12:08:22', 4),
(34, 17, 3, 'Diwali ', 'Diwali ', '2019-04-15 12:08:22', 4, '2019-04-15 12:08:22', 4),
(39, 20, 1, 'Diwali Celebration', 'Diwali Celebration ', '2019-04-15 12:17:14', 4, '2019-04-15 12:17:14', 4),
(40, 20, 3, 'Diwali Celebration', 'Diwali Celebration ', '2019-04-15 12:17:26', 4, '2019-04-15 12:17:26', 4),
(41, 21, 1, '2019', '2019', '2019-04-15 12:23:09', 3, '2019-04-15 12:23:09', 3),
(42, 21, 3, '2019s', '2019s', '2019-04-15 01:24:14', 4, '2019-04-15 01:24:14', 4),
(43, 22, 1, 'Diwali Celebrations', 'Diwali Celebrations', '2019-04-15 12:18:30', 4, '2019-04-15 12:18:30', 4),
(44, 22, 3, 'Diwali Celebrations', 'Diwali Celebrations', '2019-04-15 12:18:30', 4, '2019-04-15 12:18:30', 4),
(45, 22, 4, '2019', '2019', '2019-04-15 12:19:37', 4, '2019-04-15 12:19:37', 4),
(47, 27, 1, 'New Post', '<p>You know cats make amazing pets for plenty of reasons, but sometimes it can be hard to put into words exactly why they&#39;re so great.</p>\n', '2019-04-15 04:06:19', 7, '2019-04-18 04:59:45', 1),
(48, 28, 1, NULL, 'scroll through these perfect quotes and sayings about cats that prove why they\'re such great creatures.', '2019-04-15 04:43:33', 7, '2019-04-15 04:43:33', 7),
(49, 29, 1, NULL, 'scroll through these perfect quotes and sayings about cats that prove why they\'re such great creatures.', '2019-04-15 04:44:56', 7, '2019-04-15 04:44:56', 7),
(130, 74, 1, NULL, 'Nature Photography', '2019-04-19 01:15:17', 8, '2019-04-19 01:15:17', 8),
(131, 74, 3, NULL, 'Nature Photography', '2019-04-19 01:15:17', 8, '2019-04-19 01:15:17', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_file`
--

CREATE TABLE `tbl_post_file` (
  `post_file_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_post_file`
--

INSERT INTO `tbl_post_file` (`post_file_id`, `post_id`, `filename`) VALUES
(2, 4, 'e1e11656d0ecc39987d0a1087b83bc6c.jpg'),
(3, 4, 'b2e65d974c26163dd45f10c0edf67069.jpg'),
(4, 4, '433a69a56cbbd53bfa6438ef88e564f7.jpg'),
(5, 4, '4e1d9a1b7fad5b8ca9a28435c49d3972.jpg'),
(6, 4, '7a1478416b02b42dabf0a2581d432d09.jpg'),
(7, 4, '719b7f29f013a715850f2247a5f5f18d.jpg'),
(33, 27, 'ea8989beb5aa4f13d56e4c5805181189.jpg'),
(34, 27, '9b42dab85a94f14adc2836a54b5857b2.jpg'),
(35, 27, 'a59a225e9beeab23dd8390a5ea224263.jpg'),
(36, 27, '65c992bfdf8104c31ef32f8a15855543.jpg'),
(37, 27, 'e20e4ed9c1d3bdd3010c0da5163bca88.jpg'),
(38, 28, 'fe23ce88d80f8a0c98c21b281800bd72.jpg'),
(39, 28, '6bacafe0c75f697eb8ded544308cebbe.jpg'),
(40, 28, '9a36ab677009bca4cafe34525c4e6f0a.jpg'),
(41, 29, '781b24f479b825e59a4b19320ec51f8d.jpg'),
(42, 29, '184c525c41c96a250e267cf2a107ca7d.jpg'),
(43, 29, 'a66b52123baf4e2d7adf4703c731cc95.jpg'),
(44, 29, '29cea6331f2ba5f07004637b9948cae9.jpg'),
(86, 27, '3c71ccb8a4da904850d0d30cd3bdc11f.jpg'),
(102, 74, '1a3073d64d93475f416b9b7790568adf.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_likes`
--

CREATE TABLE `tbl_post_likes` (
  `post_likes_id` int(11) NOT NULL,
  `device_id` varchar(30) CHARACTER SET utf8 NOT NULL,
  `post_id` int(11) NOT NULL,
  `is_liked` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_push_notification_master`
--

CREATE TABLE `tbl_push_notification_master` (
  `notification_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `send_to` enum('Android','IOS','Both') NOT NULL,
  `send_type` varchar(255) NOT NULL,
  `notification_image` varchar(255) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_type` enum('general','question') NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_push_notification_master`
--

INSERT INTO `tbl_push_notification_master` (`notification_id`, `samaj_id`, `event_id`, `post_id`, `poll_id`, `notification_title`, `description`, `send_to`, `send_type`, `notification_image`, `notification_type_id`, `notification_type`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 0, 0, 0, 'Art Gallery', 'I see two routes to success in this business: 1) Focus on artists with well- established followings that you are comfortable that you can sell or 2) Take on less well-known artists on a consignment basis, meaning you don’t actually buy the painting from the artist until the day you sell it. This can be a finicky business–people’s tastes can change and a gallery that is successful one year can find itself struggling enough. So, keep your overhead manageable and watch for changing trends.', 'Android', 'Send_Now', '0083e85232d97efa4f937c8300581458.jpeg', 0, 'general', 1, '2019-04-16 10:42:18', 1, '2019-04-16 10:42:18', 1),
(2, 1, 0, 0, 0, 'Clothing Boutique', 'My kids did an upscale sneaker and related goods boutique. This can be a lot of fun but it may be harder than you think to make money. First make absolutely sure your location has great foot traffic—stand there and count heads before you sign a lease! Then develop a distinctive plan for merchandising, and don’t be afraid to mark down what isn’t moving.', 'Android', 'Send_Now', '33b0c6410d6a6c1e42516b96f5eb4ccb.jpg', 0, 'general', 1, '2019-04-16 10:45:42', 1, '2019-04-16 10:45:42', 1),
(3, 1, 0, 0, 0, 'Coffee Bar/Tea Salon', 'Yes, you can compete with the Starbucks and Dunkin Donuts of the world! However, these chains have raised the bar, so your coffee or tea must be not just good, but awesome! Your ambiance better be good too. Your location needs to be good as well. Plus, you need to be distinctive. One way to stand out is to compliment your world class beverages with some fabulous foods. So yes, you can compete, but you’ve gotta be firing on all cylinders in this competitive space!', 'Android', 'Send_Now', '3707a07bd53d4adcfc48bb92ffa0c72f.jpg', 0, 'general', 1, '2019-04-16 10:46:54', 1, '2019-04-16 10:46:54', 1),
(4, 1, 0, 0, 0, 'Creative Arts Day Camp', 'You could run this as a seasonal camp during the summer. But I find it’s tougher to make lots of money at seasonal businesses, so instead I would first consider offering a creative arts day camp after school or on weekends. I suggest doing surveys to find out what age groups of kids and what specific art activities have the most appeal.', 'Android', 'Send_Now', '501fe13a229466e245283dc3a3b1215f.jpg', 0, 'general', 1, '2019-04-16 10:48:42', 1, '2019-04-16 10:48:42', 1),
(5, 1, 0, 0, 0, 'Gift-Basket Design', 'Wouldn’t it be fun to make a gift-basket overflowing with a bunch of carefully selected and really attractive items? Of course, it would! You could have a lot of satisfaction putting together distinctive gift baskets that will delight your customers and bring in sales!', 'Android', 'Send_Now', 'ec9957a58d3666714c6adb85bb16d01e.jpg', 0, 'general', 1, '2019-04-16 10:50:29', 1, '2019-04-16 10:50:29', 1),
(6, 1, 0, 0, 0, 'Hot Air Balloon Rides', 'I’m not going up in one of these balloons–but I know plenty of people who have, and have had a fabulous experience! This is a good vacation area business, but it could also be a good gift for special occasions. Nail down all of the licensing and safety requirements, and this could be fun business that quickly builds by word-of-mouth.', 'Android', 'Send_Now', 'b2a67f039701c5b9528410256fa4abe4.jpg', 0, 'general', 1, '2019-04-16 10:51:40', 1, '2019-04-16 10:51:40', 1),
(7, 1, 0, 0, 0, 'Jewelry Designer', 'So, you start out with some stunning jewelry designs but how do you turn it into a business? One of my friends’ sisters turned her jewelry hobby into a full-time job by selling her products to a few local jewelry stores. Another woman I know built her business into a much larger enterprise…all built around a strong unifying theme. That’s the key here, success will come a lot easier if you build a distinctive overall brand, and ideally have closely matched collections within the brand.', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-16 13:06:56', 1, '2019-04-16 13:06:56', 1),
(8, 1, 0, 0, 0, 'Samaj Application', 'Samaj Application', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-17 16:17:15', 1, '2019-04-17 16:17:15', 1),
(9, 0, 11, 0, 0, 'Angular Training Course', 'Want to start or scale up your career in Front End Development? Add Angular to your skill set and stay ahead of market.', 'Android', 'Send_Now', '', 0, '', 0, '2019-04-17 16:59:50', 1, '2019-04-17 16:59:50', 1),
(10, 1, 0, 0, 0, 'Logo Design', 'There are lots of graphic designers out there but not so many people specializing in logos. Yet in the age of the Internet, a good-looking logo is more important than ever! Most businesses don’t give enough thought to their logo and end up with a weak result. You can help them create a great logo–one that can help define their business and bring them customers!', 'Android', 'Send_Now', 'f6975f65b13367f6191dc6c4c7b2a5e2.jpg', 0, 'general', 1, '2019-04-17 17:06:00', 1, '2019-04-17 17:06:00', 1),
(11, 1, 0, 0, 0, 'Mobile DJ', 'You should have some decent equipment that makes your audience happy but that could mean different levels of investment for different audiences. Are you going to be playing for large event venues or for junior high school birthday parties? I know a fellow who started a successful mobile DJ business even before he was old enough to have a driver’s license. He would either have a friend give him and his equipment a ride to his gigs, or he would get a taxi.', 'Android', 'Send_Now', 'ef679c3b02f7fde75fa0409e84db5f7f.jpeg', 0, 'general', 1, '2019-04-17 17:11:01', 1, '2019-04-17 17:11:01', 1),
(12, 1, 0, 0, 0, 'Outdoor Adventures', 'Choose an adventure really carefully. One that people will easily pay good money for. “Focus group” it. At least informally ask lots of people for their feedback on a suggested adventure before you put any money into marketing it. Then when you do offer your first trip, make it incredible! Research it carefully and surpass people’s expectations. On your first few trips it is more important to build a great experience and a great reputation, then to make a lot of money right out of the gate.', 'Android', 'Send_Now', '1d7853c8a79fb749c90ba3c1efd7678e.jpg', 0, 'general', 1, '2019-04-17 17:15:04', 1, '2019-04-17 17:15:04', 1),
(13, 1, 0, 0, 0, 'its all about testing', 'its all about testingits all about testingits all about testingits all about testingits all about testingits all about testingits all about testingits all about testing', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-17 18:26:17', 1, '2019-04-17 18:26:17', 1),
(14, 1, 0, 0, 0, 'its all about testing', 'its all about testingits all about testingits all about testingits all about testingits all about testingits all about testing', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-17 18:29:21', 1, '2019-04-17 18:29:21', 1),
(15, 1, 0, 0, 0, 'test', 'TEST', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 11:26:42', 1, '2019-04-18 11:26:42', 1),
(16, 1, 0, 0, 0, 'test', 'test', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 11:27:45', 1, '2019-04-18 11:27:45', 1),
(17, 1, 0, 0, 0, 'test', 'test', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 11:29:39', 1, '2019-04-18 11:29:39', 1),
(18, 1, 0, 0, 0, 'test', 'test', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 11:31:22', 1, '2019-04-18 11:31:22', 1),
(19, 1, 0, 0, 0, 'testing of notification crash', 'testing of notification crash', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 11:32:31', 1, '2019-04-18 11:32:31', 1),
(20, 1, 0, 0, 0, 'testing of notification crash', 'testing of notification crash', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 11:33:50', 1, '2019-04-18 11:33:50', 1),
(22, 1, 0, 0, 0, 'TITLE', 'SEND NOW', 'Android', 'Send_Now', '2cd4750df4ffb1edb9e0f9e9c94d1a07.jpg', 0, 'general', 1, '2019-04-18 17:34:08', 1, '2019-04-18 17:34:08', 1),
(24, 1, 0, 0, 0, 'Samaj', 'Samaj', 'Android', 'Send_Now', '5f022eb8fe6d4ca0100e4b82acd181aa.png', 0, 'general', 1, '2019-04-18 17:37:43', 1, '2019-04-18 17:37:43', 1),
(25, 0, 12, 0, 0, 'How To Be Limitless By Chetan Bhagat', 'We are glad to introduce you to our upcoming seminar brought to you by none other than the very famous & talented Chetan Bhagat himself.', 'Android', 'Send_Now', '', 0, '', 0, '2019-04-18 18:36:00', 1, '2019-04-18 18:36:00', 1),
(26, 0, 0, 72, 0, 'Test', '<p>test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test </p>', 'Android', 'Send_Now', '', 0, '', 0, '2019-04-18 19:08:11', 1, '2019-04-18 19:08:11', 1),
(27, 1, 0, 0, 0, 'test', 'test', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 19:35:20', 1, '2019-04-18 19:35:20', 1),
(28, 1, 0, 0, 0, 'test', 'testtesttesttesttesttesttesttest', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 19:35:50', 1, '2019-04-18 19:35:50', 1),
(29, 1, 0, 0, 0, 'test', 'test', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 19:36:29', 1, '2019-04-18 19:36:29', 1),
(30, 1, 0, 0, 0, 'test', 'test', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-18 19:36:31', 1, '2019-04-18 19:36:31', 1),
(31, 1, 0, 0, 0, 'samaj', 'samaj', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-20 16:27:29', 1, '2019-04-20 16:27:29', 1),
(32, 1, 0, 0, 0, 'samaj', 'adadada', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-20 16:27:59', 1, '2019-04-20 16:27:59', 1),
(33, 2, 0, 0, 0, 'sdffsdfsd', 'fsddsffdsfds', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-20 16:31:06', 1, '2019-04-20 16:31:06', 1),
(34, 0, 0, 0, 0, 'yjhhghfd', 'ghhhghghg', 'Android', 'Send_Now', '', 0, 'general', 1, '2019-04-20 16:31:29', 1, '2019-04-20 16:31:29', 1),
(35, 0, 13, 0, 0, 'Laxmikant Pyarelal Live in Concert', 'A lifetime opportunity to revisit the magical compositions of legendary Laxmikant Pyarelal, the music composer duo who ruled Bollywood music for more than 35 years. During this period', 'Android', 'Send_Now', '', 0, '', 0, '2019-04-22 12:23:13', 1, '2019-04-22 12:23:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationship_master`
--

CREATE TABLE `tbl_relationship_master` (
  `relationship_master_id` int(11) NOT NULL,
  `relationship_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_relationship_master`
--

INSERT INTO `tbl_relationship_master` (`relationship_master_id`, `relationship_name`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Father', '2019-04-02 00:00:00', 1, '2019-04-01 00:00:00', 1),
(2, 'Son', '2019-04-02 00:00:00', 1, '2019-04-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_samaj`
--

CREATE TABLE `tbl_samaj` (
  `samaj_id` int(11) NOT NULL,
  `parent_samaj_id` int(11) NOT NULL,
  `samaj_name` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_samaj`
--

INSERT INTO `tbl_samaj` (`samaj_id`, `parent_samaj_id`, `samaj_name`, `short_description`, `long_description`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 0, '', '', '', 1, '2019-03-12 11:00:41', 1, '2019-03-12 11:00:41', 1),
(2, 0, '', '', '', 1, '2019-03-12 11:02:14', 1, '2019-03-12 11:02:14', 1),
(3, 0, '', '', '', 1, '2019-03-12 16:36:21', 1, '2019-03-12 16:36:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_samaj_contact`
--

CREATE TABLE `tbl_samaj_contact` (
  `samaj_contact_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `member_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_samaj_contact`
--

INSERT INTO `tbl_samaj_contact` (`samaj_contact_id`, `samaj_id`, `member_name`, `member_number`) VALUES
(1, 1, 'hindu', '9876542312'),
(2, 2, 'muslim ', '6454258414'),
(3, 3, 'Stave Adam Cobs', '7894561023');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_samaj_description`
--

CREATE TABLE `tbl_samaj_description` (
  `samaj_description_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `samaj_name` varchar(60) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_samaj_description`
--

INSERT INTO `tbl_samaj_description` (`samaj_description_id`, `samaj_id`, `language_id`, `samaj_name`, `short_description`, `long_description`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 1, 'Hindu', 'Hinduism has been variously defined as a religion, a religious tradition, a set of religious beliefs, and \"a way of life\". From a Western lexical standpoint, Hinduism like other faiths is appropriately referred to as a religion. ', '<p>In India the term dharma is preferred, which is broader than the Western term religion. Hinduism has been variously defined as a religion, a religious tradition, a set of religious beliefs, and \"a way of life\". From a Western lexical standpoint, Hinduism like other faiths is appropriately referred to as a religion. </p>\n', 1, '2019-03-12 11:00:41', 1, '2019-03-12 11:00:41'),
(2, 1, 3, ' હિન્દુ', ' હિન્દુ ધર્મને વિવિધ રૂપે ધર્મ, ધાર્મિક પરંપરા, ધાર્મિક માન્યતાઓનો સમૂહ અને \"જીવનનો માર્ગ\" તરીકે વ્યાખ્યાયિત કરવામાં આવ્યો છે. પશ્ચિમી શાબ્દિક દૃષ્ટિકોણથી, ', '<p>હિન્દુ ધર્મને વિવિધ રૂપે ધર્મ, ધાર્મિક પરંપરા, ધાર્મિક માન્યતાઓનો સમૂહ અને \"જીવનનો માર્ગ\" તરીકે વ્યાખ્યાયિત કરવામાં આવ્યો છે. પશ્ચિમી શાબ્દિક દૃષ્ટિકોણથી, અન્ય માન્યતાઓ જેવા હિન્દુ ધર્મને યોગ્ય રીતે ધર્મ તરીકે ઓળખવામાં આવે છે. ભારતમાં &#39;ધર્મ&#39; શબ્દ પ્રાધાન્ય આપવામાં આવે છે, જે પશ્ચિમી શબ્દ ધર્મ કરતાં વ્યાપક છે.</p>\n', 1, '2019-03-12 11:00:41', 1, '2019-03-12 11:00:41'),
(3, 2, 1, 'Muslim', ' Muslims consider the Quran, their holy book, to be the verbatim word of God as revealed to the Islamic prophe.', '<p><b>Muslims</b> consider the Quran, their holy book, to be the verbatim word of God as revealed to the <b>Islamic</b>prophet and messenger Muhammad. The majority of<b>Muslims</b> also follow the teachings and practices of Muhammad (sunnah) as recorded in traditional accounts (hadith).</p>\n', 1, '2019-03-12 11:02:14', 1, '2019-03-12 11:02:14'),
(4, 2, 3, ' મુસ્લિમ', ' મુસ્લિમો ઇસ્લામિક પ્રબોધક અને સંદેશવાહક મોહમ્મદને જાહેર કરેલા કુરઆન, તેમના પવિત્ર પુસ્તક, ભગવાનના શાબ્દિક શબ્દ તરીકે માને છે. મોટાભાગના મુસ્લિમો પરંપરાગત હિસાબ (હદીસ) માં નોંધાયેલા મુહમ્મદ (સનનાહ) ની ઉપદેશો અને પ્રથાઓનું પણ પાલન કરે છે.', '<p>સ્લિમો ઇસ્લામિક પ્રબોધક અને સંદેશવાહક મોહમ્મદને જાહેર કરેલા કુરઆન, તેમના પવિત્ર પુસ્તક, ભગવાનના શાબ્દિક શબ્દ તરીકે માને છે. મોટાભાગના મુસ્લિમો પરંપરાગત હિસાબ (હદીસ) માં નોંધાયેલા મુહમ્મદ (સનનાહ) ની ઉપદેશો અને પ્રથાઓનું પણ પાલન કરે છે.</p>\n', 1, '2019-03-12 11:02:14', 1, '2019-03-12 11:02:14'),
(5, 3, 1, 'Christian', ' Christians (/ˈkrɪstʃən, -tiən) are people who follow or adhere to Christianity, a monotheistic Abrahamic religion based on the life and teachings of Jesus Christ. The words Christ and Christian derive from the Koine Greek title Christós.', '<p>While there are diverse interpretations of Christianity which sometimes conflict, they are united in believing that Jesus has a unique significance.The term \"Christian\" is also used as an adjective to describe anything associated with Christianity, or in a proverbial sense \"all that is noble, and good, and Christ-like.\" According to a 2011 Pew Research Center survey, there were 2.2 billion Christians around the world in 2010, up from about 600 million in 1910.By 2050, the Christian population is expected to exceed 3 billion.According to a 2012 Pew Research Center survey Christianity will remain the world&#39;s largest religion in 2050, if current trends continue.</p>\n', 1, '2019-03-12 04:36:21', 1, '2019-03-12 04:36:21'),
(6, 3, 3, 'ખ્રિસ્તી', ' ખ્રિસ્તીઓ  એવા લોકો છે જે ખ્રિસ્તી ધર્મને અનુસરતા અથવા પાલન કરે છે, એકેશ્વરવાદી અબ્રાહમિક ધર્મ જે ઈસુ ખ્રિસ્તના જીવન અને ઉપદેશો પર આધારિત છે. ક્રિસ્ટ અને ક્રિશ્ચિયન શબ્દો કોઇન ગ્રીક ટાઇટલ ક્રિસ્ટોસ (Χριστός) માંથી ઉતરી આવ્યા છે.', '<p>જ્યારે ખ્રિસ્તી ધર્મના વિવિધ અર્થઘટન છે, જે ક્યારેક સંઘર્ષ કરે છે, તેઓ માને છે કે ઈસુ પાસે એક અનન્ય મહત્વ છે. \"ખ્રિસ્તી\" શબ્દનો ઉપયોગ ખ્રિસ્તી ધર્મ સાથે સંકળાયેલ કોઈપણ વસ્તુનું વર્ણન કરવા માટે એક વિશેષજ્ઞ તરીકે પણ કરવામાં આવે છે, અથવા \"આ બધું\" ઉમદા, અને સારા, અને ખ્રિસ્ત જેવા. \" 2011 ની પ્યુ સંશોધન કેન્દ્રના સર્વે મુજબ, 2010 માં વિશ્વભરમાં 2.2 અબજ ખ્રિસ્તીઓ હતા, જે 1910 માં આશરે 600 મિલિયન હતું. 2050 સુધીમાં, ખ્રિસ્તી વસતી 3 બિલિયનથી વધી જવાની ધારણા છે. 2012 ની પ્યુ સંશોધન કેન્દ્રના આધારે ખ્રિસ્તી ધર્મ સર્વેક્ષણ 2050 માં જો વર્તમાન વલણો ચાલુ રહેશે તો વિશ્વનું સૌથી મોટું ધર્મ રહેશે.</p>\n', 1, '2019-03-12 04:36:21', 1, '2019-03-12 04:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sessions`
--

CREATE TABLE `tbl_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_sessions`
--

INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('038qgf07736algh61usfl3s5k9l1865t', '192.168.0.101', 1555766470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363437303b),
('03go96k9tja8q18prlmh9jv4mr11u4ga', '192.168.0.110', 1555768116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383131353b),
('04a39id5uuqqndptgblbl2lim4mvvtej', '192.168.0.111', 1555916017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363031373b),
('04b27pjd0jqto4oiikc463f5mtvuk2jo', '192.168.0.111', 1555911337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313333373b),
('04gaf6u429uou0b6v48utpqs37k2amut', '192.168.0.110', 1555926124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363132343b),
('04jqmqrqfki5q2o6mkbls4m9crdjojar', '192.168.0.109', 1555766674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363637343b),
('04sfbkkkrlmh82n5bssfup1icfp82kh8', '192.168.0.110', 1555919143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393134333b),
('05klnb1ae6pdfdtqob2joh5miea6grrn', '192.168.0.110', 1555926125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363132353b),
('060mrdqr16pvpj6b6fsbqgcpk71l8eg4', '192.168.0.101', 1555766192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363139323b),
('07je5d9jf12fbdjncgp6psf9bu4935bk', '192.168.0.101', 1555766223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363232333b),
('07lnndu242rhgrja81rqbsotdkpkc8h6', '192.168.0.111', 1555910379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303337393b),
('08lqce0q5dm47tvjua8oo4r2ll6c2hok', '192.168.0.101', 1555765512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353531323b),
('08lshboo5hg021vvrfc8sb01mkkcv6da', '192.168.0.110', 1555919103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393130333b),
('0a04tdhi1a82491thrvrn9iuasv9qc35', '192.168.0.110', 1555912551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323535313b),
('0adegomh9u7i7r9kfod5115a2l73te6i', '192.168.0.119', 1555766908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363930383b),
('0avfl9a0g92avbpqgmo3490kmpkgo325', '192.168.0.110', 1555911725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313732353b),
('0egjuhfhkn47qb3dg63a4lcu772cmf8l', '192.168.0.101', 1555766248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363234383b),
('0g71d52o0fjl1pqv8r7786il4jdvr0ee', '192.168.0.119', 1555765992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353939323b),
('0gg3t1iqdvlfjfp0b3ac5vh5g8rsmtgl', '192.168.0.101', 1555766257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363235373b),
('0gs5hibgjjgb3dhk0d7pllhc4ev02knu', '192.168.0.110', 1555912976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323937363b),
('0h1idltiltpcudpkqhtov4q513pv8hei', '192.168.0.110', 1555910696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303639363b),
('0i3id4ndtubg1okq7ok7el667gstdicd', '192.168.0.110', 1555925993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353939333b),
('0imhe9c3irj3q7l2fojj85lhgpmrk5v5', '192.168.0.110', 1555926092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363039323b),
('0jh4gvqpb3t99hqmqcbo0euc1odthkqr', '192.168.0.110', 1555911831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313833303b),
('0k5lpk4f6k36etrvm4mbjk41sksj1qbe', '192.168.0.110', 1555911825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313832353b),
('0kcj5g5nu2aft9jd1itkuqgq1sg20bji', '192.168.0.111', 1555910651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635313b),
('0m6od0soc6k88r57kmhu4l9udc1lafcq', '192.168.0.110', 1555914111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343131313b),
('0n187ss47u3jhgsg5e8i6q1i6im53g68', '192.168.0.111', 1555911011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031313b),
('0o08me9vpkaketciudg0bu8ap9tpviqk', '192.168.0.119', 1555767002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373030323b),
('0ojuvpkualgnj30tuofomtq5mtnds1ma', '192.168.0.110', 1555912261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323236313b),
('0ve5jbv6mut7ora3t0kgesf5hvqvlf8b', '192.168.0.119', 1555771038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313033383b),
('10s97hvbto5tk13gef2gs4101vntodur', '192.168.0.119', 1555769375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393337343b),
('111askftm1tv4brr7r5jlenfrcvstth3', '192.168.0.111', 1555910446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303434363b),
('12hv3ggthuvc021ojo745hud61b73uc7', '192.168.0.101', 1555765462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353436323b),
('13hu6ll4h3infrqdogt8g52g1tbg4bmh', '192.168.0.110', 1555915921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353932303b),
('14e5dfkc8m2q02itl9h58svcr8q97nv4', '192.168.0.110', 1555768541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383534313b),
('14emedlaqbb59jpntdb298spphellqmt', '192.168.0.110', 1555925937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353933373b),
('15njtqd3oi28kok3sklp4j7uuhc7hjk4', '192.168.0.110', 1555919113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393131323b),
('17aoftu4j0rjvepsriu1308ce0apg5jg', '192.168.0.130', 1555768309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383330393b),
('18dnpk6sp9757vgq4qc99lrghf56dnr9', '192.168.0.110', 1555913590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333539303b),
('18l3h8iavadv0undd9be6u88rrbvhb4b', '192.168.0.111', 1555910390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303339303b),
('191til7tnl52uqp4n67h5lsfg2mpspeh', '192.168.0.110', 1555768847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383834373b),
('19cfe50q8j96tn08mcqg0l7kbvle30td', '192.168.0.110', 1555913614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333631343b),
('1a2julifcrgnnp48u999blri2oj36nj9', '192.168.0.109', 1555765652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353635323b),
('1b78thrr5jlknmk6407dmiq3s6ql506r', '192.168.0.101', 1555766099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363039393b),
('1bk3prprj4npaaup8t31t78co9h8hhon', '192.168.0.110', 1555914217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343231363b),
('1d3d07lrktbjj9oki6r9alidbg8jr6gc', '192.168.0.110', 1555914085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343038343b),
('1gf39f81g10b1bh772258i75ijrfvhsd', '192.168.0.111', 1555910411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303431313b),
('1gt7bdr271hbqs53r3473ef1t83m5det', '192.168.0.111', 1555910467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303436363b),
('1h4ph0911o5kmv4j3ed7o71q54j74o8d', '192.168.0.111', 1555910650, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635303b),
('1if9jhrk391lunva8j1qc13bfr4a05kh', '192.168.0.101', 1555766127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363132373b),
('1iritrpv85knmtuob0gajs63cvvpvuli', '192.168.0.110', 1555911292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313239323b),
('1jsoma1d5oufrhhh20uqoaf79k2sjos2', '192.168.0.119', 1555766978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363937383b),
('1l5ffdlk0j8up1nmbc9q8vmkujlgs6rk', '192.168.0.111', 1555910312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303331313b),
('1ldtao9t5nls2rk975eg5mgbagk8647q', '192.168.0.101', 1555766294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363239343b),
('1ppgq634g07uoggbadblgialqs2r86k8', '192.168.0.119', 1555765296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353239363b),
('1ss2d4uc7udlj6vihf69q1f7svhlt8rv', '192.168.0.110', 1555918390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383339303b),
('1v4hrbhtu85eq2u30o1pf5c6dujl37tl', '192.168.0.130', 1555768210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383231303b),
('1vp6tljejmsjmv2s1rfq30kfjtgb6cmt', '192.168.0.119', 1555765162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353136323b),
('213rk6b8qikmh4sm55fsmo04n79d8r48', '192.168.0.110', 1555918421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383432303b),
('21ar7ssbl8c43d6666omni3su9t1faot', '192.168.0.110', 1555914102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343130313b),
('21b2eh2p5mbugkv3qcq8l7njbqek9b8d', '192.168.0.110', 1555913686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333638363b),
('21t33hivj5ovg38fatjluusotor2a7l2', '192.168.0.111', 1555910667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636363b),
('21vk5dq8funrvbko37tql1d0hsstgibm', '192.168.0.119', 1555770412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303431323b),
('26its6rh1mku1372uavvmceq2agreoel', '192.168.0.111', 1555911033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313033333b),
('271nrf0lb4j8t9qm15huo100t2aavkfv', '192.168.0.110', 1555913695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333639343b),
('2958792pm1hom917ekh3s0q96a9gisgn', '192.168.0.110', 1555910250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303235303b),
('29nt4qgor535s95qaa8dh3p1q2gi6grn', '192.168.0.111', 1555910668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636383b),
('2ambdemove26uqi11qsc7rlv0gkg23f1', '192.168.0.130', 1555768824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383832343b),
('2c8f3flo4pea309b8pdcv2ncq7fl97bk', '192.168.0.101', 1555766333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363333333b),
('2cau4569oi24si9f059damp5r0a6fijc', '192.168.0.110', 1555926555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363535353b),
('2cs5rh6mlsmgtri5s0p3sig8j6kmcibj', '192.168.0.110', 1555911732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313733323b),
('2dgle33gf1kvgivbhe6pf3gevr8al34v', '192.168.0.101', 1555766143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363134323b),
('2e53k96ir7msfraam3qep531si52e046', '192.168.0.111', 1555910362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336323b),
('2eb7a3k4faghtqc76f119av89ddk3hof', '192.168.0.110', 1555911368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313336383b),
('2edodbbtm3grlcnvqrh1h3bk8sfbo1mm', '192.168.0.110', 1555914216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343231363b),
('2etho84sbg7koh8qi14jmo9kmepthdaf', '192.168.0.119', 1555767572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373537323b),
('2f9jcbc1f3s7dji3p3op14gdpa3o96o6', '192.168.0.110', 1555919262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393236323b),
('2fo8pvffmnopsj0tpbrjds3nhhvha4f9', '192.168.0.110', 1555916645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363634353b),
('2h0o9p00m6lbmat2kmfu3i3mdp182dq8', '192.168.0.101', 1555766340, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334303b),
('2jtra6mstue210j446rdb7q94ku73qmc', '192.168.0.110', 1555919262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393236313b),
('2krt67cv62temsfdrijkih8joqvmdt6u', '192.168.0.110', 1555926027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363032373b),
('2luf1ojcbimgqr2bbrol9bao57im7umr', '192.168.0.110', 1555925594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353539343b),
('2md7i9cidbmbjf8lgdro2195hof9fv07', '192.168.0.101', 1555766137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133373b),
('2nfs1jsi55a7sh69q0ivli2711b2kqan', '192.168.0.119', 1555770914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303931333b),
('2pas73l7vt2cr187lu1o7h5rnaltlodk', '192.168.0.110', 1555768037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383033373b),
('2qkdevhto5kigdpv4vuadj36r5m1dml2', '192.168.0.111', 1555910043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303034323b),
('2qs0t2bmqd1novkso01term5chcu6io0', '192.168.0.119', 1555766947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363934373b),
('2rhmimmq8gvpfpqdt0se1ph6opplsfg1', '192.168.0.111', 1555910433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303433333b),
('2shpkqgrgh0ad35on59njeuhfbhl6j1q', '192.168.0.119', 1555770448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303434373b),
('2spe6udtm37sge0lq8p3k34a6a9752pi', '192.168.0.119', 1555765161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353136303b),
('2tcoq2ppigm9j03p3d37jqm4tud25aum', '192.168.0.110', 1555926635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363633353b),
('31ofpmuic47mjrqmg7off61u688s185h', '192.168.0.101', 1555766199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363139393b),
('32qosl1tuaibk0l08tllr6iss82e1j6g', '192.168.0.110', 1555919652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393635323b),
('34nqtpvgi557mk72i3t2jatloog5b8cl', '192.168.0.101', 1555766146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363134353b),
('35afngbk4bk62jbb6kg9nbafcijmprv7', '192.168.0.119', 1555766997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363939363b),
('37fn6ik00l1qdqof7q7bgo8r1hoo90bk', '192.168.0.109', 1555765937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353933373b),
('38tq1npn0kgg6unk0a6vk02p5809nvhs', '192.168.0.119', 1555770562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303536323b),
('39gm3vb137uv28mjo52o51uohs7ohgi2', '192.168.0.119', 1555770319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303331393b),
('3aiveii6hqb0j47mfq3hg0rfrou15svk', '192.168.0.110', 1555914121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343132313b),
('3ascevj9cejvh7foih7m0hbi7c1r8694', '192.168.0.110', 1555912273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323237333b),
('3b6nnm5tti3cufgmhn5l9jk9l5u3emuc', '192.168.0.110', 1555926030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363033303b),
('3ctc2ufi5fm4de7oo4g7196bfc903ugh', '192.168.0.110', 1555911277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313237373b),
('3d5mc5tp47ing5688eqpf24hse2kc8bb', '192.168.0.110', 1555914379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343337393b),
('3dl73pqfsr363mtopa41o1sdkolvuidc', '192.168.0.110', 1555918425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383432353b),
('3dvtf031kddedqhri3bmup7ehbboame9', '192.168.0.111', 1555910663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636333b),
('3ereunpu02vii8uf56h242qbd1n5h9s4', '192.168.0.119', 1555770900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303839393b),
('3f9t9gj3stjhtrr4f4d5bmcla50q7al9', '192.168.0.119', 1555770478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303437383b),
('3gskd7d7apil0d5ccs0njqre71p0v8q4', '192.168.0.125', 1555915846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353831343b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393130343839223b6c6f67696e546f6b656e7c733a33323a223236623461363762663261386639343631356639343637666461613362656630223b73616d616a5f69647c4e3b),
('3ho3vo6bpdflbki7comen97vln0jaqhe', '192.168.0.110', 1555768035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383033353b),
('3idvmplp7suglcdhqdnuif49p3sh557e', '192.168.0.119', 1555766993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363939333b),
('3if2aakt0kk14n17b3epqlt23cql7flq', '192.168.0.110', 1555914246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343234363b),
('3jkgahqimt4dit6u9ir4bddjfdjqiq2j', '192.168.0.110', 1555911796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313739353b),
('3jort2naavfdqh1mmbo3snim5g0t6bia', '192.168.0.111', 1555910671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303637313b),
('3jvbamkb0irbhrq6rrrifhee2753kt4g', '192.168.0.110', 1555925933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353933333b),
('3ltth0gclljvej02sj9rcq3gafi5hi0a', '192.168.0.110', 1555909375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353930393337353b),
('3n7mgkoh7o0fhsjrdv0uifo7ut9uc4ta', '192.168.0.110', 1555926010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363031303b),
('3ogoejjjrjh3i4gg6oihlng2b4jgfaln', '192.168.0.110', 1555911383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313338333b),
('3rq6s41d87rb5m2bb35dci0mh1e3gfpq', '192.168.0.101', 1555766459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363435383b),
('3ruk993lv33h14p8oglm1ktatmg8pqg0', '192.168.0.101', 1555766148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363134373b),
('3sck2rlg6pu83dnq97fo4tv7dhbfcuup', '192.168.0.110', 1555912978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323937383b),
('3t2eta00oohfusi31il69kk1k8875a4u', '192.168.0.110', 1555914226, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343232353b),
('3ubtqva4utfhi578f0es9u3cojao0l10', '192.168.0.125', 1555915857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353835373b),
('3ue0j1bip8193nftinftg5rbcudo6712', '192.168.0.111', 1555916005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363030353b),
('40lgrvte23oeu5d8aa6aqac2avj7e94j', '192.168.0.101', 1555766336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363333363b),
('411q6q8q9g71938aj9avh2ngq51hns7t', '192.168.0.110', 1555916010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363031303b),
('43f2af961r5aq3b5ei7dhkhulnfvqee9', '192.168.0.101', 1555766141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363134313b),
('43hjc4hnf14ivv4ot6c4m671pi2dhh77', '192.168.0.110', 1555926689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363638393b),
('43v2hob1ormno1ecbo94dqmdh3faidmn', '192.168.0.110', 1555926691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363639313b),
('44jiv8esrtmeuakp195m640cv3jgpmsh', '192.168.0.110', 1555919868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393836383b),
('49sun3e5mhe03eq2tl7in9217c5dtvuu', '192.168.0.110', 1555768378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383337383b),
('4a5g01hv5i9pk5lk78dt6to2h40ckahn', '192.168.0.101', 1555766202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230313b),
('4c1gggudsgct1fe99h376ibi3s75918c', '192.168.0.121', 1555916009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363030393b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535373538333838223b6c6f67696e546f6b656e7c733a33323a223332323161333161373861626233643764303333623564386134343834653833223b73616d616a5f69647c4e3b),
('4cp2q3p32uvikicoli33grd218uoarv7', '192.168.0.110', 1555768287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383238363b),
('4dnceo13un9njgjfe18nrlv455perb2m', '192.168.0.111', 1555910653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635333b),
('4ealug2j1lveucdoe1s8o0thc3092d5j', '192.168.0.121', 1555916106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363030393b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535373538333838223b6c6f67696e546f6b656e7c733a33323a223332323161333161373861626233643764303333623564386134343834653833223b73616d616a5f69647c4e3b),
('4fumirnah7hr7gujqlaqat6jdlhop4kc', '192.168.0.130', 1555768401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383430303b),
('4gn8l5nodshmjlm47ddugtj7tsqo10ue', '192.168.0.110', 1555926559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363535393b),
('4hdljo1otm7077cb6q4kvv4mr7qur04u', '192.168.0.101', 1555765548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353534383b),
('4i0joj3biihkl1rphqebgv0diavl0dr3', '192.168.0.119', 1555767166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373136363b),
('4j00t0qfo53ntq381oeggibc15l1pifu', '192.168.0.111', 1555910386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303338363b),
('4jt0mt8fd5rda7befjjvinbo7jenqi0k', '192.168.0.110', 1555925741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353734313b),
('4ko09hisg3o1c2l4ctj51dov9v1am0li', '192.168.0.119', 1555767162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373136323b),
('4lken784e0b5b5mts0sgvboehgbp83ov', '192.168.0.110', 1555926091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363039313b),
('4mk4rndku8uuhvbo3fb1ko9p1janokic', '192.168.0.110', 1555911799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313739393b),
('4nobhke783lld3of5h5unuphidbtud6c', '192.168.0.101', 1555766189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363138393b),
('4r02vrvqg1vo9occ9g8hl7n5m2c349ev', '192.168.0.110', 1555768084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383038343b),
('4r6kbt9didsdfme1n1d5rnsjurdsk0k4', '192.168.0.111', 1555911334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313333343b),
('4tcgcva21ncvof2uatkiied1si9plsjt', '192.168.0.110', 1555914047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343034363b),
('4us5lo75586dqrlt016ag55nij8kttug', '192.168.0.119', 1555766894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363839343b),
('4usm09olar0qv3vd2cfj6venu6h2g5rn', '192.168.0.110', 1555914230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343232393b),
('4vtbqjice6n8bg2kcdedch3rknlc2ua8', '192.168.0.101', 1555765547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353534363b),
('51torb7pl7cmaqut148e2mvvm4dcp87o', '192.168.0.111', 1555910201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303230313b),
('52m6ib5im3livhfir19qhrjj56qdqrqa', '192.168.0.101', 1555765492, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353439323b),
('54ajaanhrkj6sqj201h5hh3siuqpkfas', '192.168.0.110', 1555926544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363534343b),
('54er42896pic8oelluamdksmb3en9qeo', '192.168.0.110', 1555919670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393637303b),
('54fopnn1atgdcid49np7jf57u3p98sqh', '192.168.0.110', 1555914237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343233373b),
('56mrdi11nnlif13gucj9cfrfh9fst9id', '192.168.0.119', 1555765983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353938333b),
('572b9oe403nrtjuposcil4kue3fu6jkq', '192.168.0.119', 1555767598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373539383b),
('573nk50mpg05ioj54g8hspoefsarsojk', '192.168.0.111', 1555910358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303335383b),
('57eiiu01b8f0smhnjm3q6n7orftmhv2q', '192.168.0.130', 1555768388, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383338383b),
('57f9tp1nb9o58bh0s3jk87siqn0nad1i', '192.168.0.110', 1555914124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343132333b),
('58rd26ts5g98tgjpnvft81co7j48intd', '192.168.0.101', 1555766345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334353b),
('591ee515ikmmvgc3v23fmgr6i2ru2225', '192.168.0.110', 1555921192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313139323b),
('597vaa87cmef547fu76poqgu8ah935j6', '192.168.0.111', 1555910441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303434303b),
('5divqnsqkge18tq479kpdf5gaun11v1a', '192.168.0.111', 1555910380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303338303b),
('5fs46lenc5pdanv2e8l08jdlt2rqb5on', '192.168.0.110', 1555919393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393339323b),
('5gijsrraqu1hr3b0titdk0jhqpiffasm', '192.168.0.119', 1555766679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363637393b),
('5gm2d17lncusb897glgsl8a46hoofs96', '192.168.0.111', 1555910363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336333b),
('5hlq3os6s9bvsvtvem92g6baefbn2jh9', '192.168.0.101', 1555765513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353531323b),
('5if7g1k7k5mvlgc5dvoa126hrglgbv05', '192.168.0.130', 1555768859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383835393b),
('5jkb46bh08etd38lqools6a2q4qu0kdo', '192.168.0.110', 1555918188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383138383b),
('5jo8as5621ml71nnsadmlr7j9ovqpetd', '192.168.0.119', 1555766898, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363839383b),
('5mk73j6qmq4l4vjplj783mjm93v1m2b2', '192.168.0.110', 1555913568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333536363b),
('5o6hqoqs2p33ffdrm53l3k9hlrp1d1gu', '192.168.0.111', 1555910199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303139383b),
('5pfvie7gd77tp1uqecpdi767duuvvtrg', '192.168.0.111', 1555910363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336333b),
('5pnlttfo5gnmabofdsl3cs10tg2agbj8', '192.168.0.101', 1555766200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230303b),
('5q0b1nbncbao1uue471h9u3lh1bivcel', '192.168.0.110', 1555914474, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343437343b),
('5qsksvmgo04rkhpq7cnb4g26kqsf0b5i', '192.168.0.101', 1555766145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363134353b),
('5r2vgcv7gn0r0uqccnipot2df4c28q86', '192.168.0.109', 1555765653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353635333b),
('5rlrc1us1bvde0epf2kf3cf0gs9s2846', '192.168.0.110', 1555926122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363132323b),
('5s8db9uhls1g92d4l9ueupvqej3r5b2m', '192.168.0.119', 1555765480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353438303b),
('5t4rpd9k9s0604i3p5hq5dv9bplksi80', '192.168.0.101', 1555766290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363239303b),
('5t57emigq5pbf06mlsokerl9m7b22hd3', '192.168.0.119', 1555770927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303932373b),
('5v06vd9s3bklv11bhv8mb71eikh84ttl', '192.168.0.110', 1555768116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383131353b),
('61p65ke25fj9tpjrisefuk782if9lc7f', '192.168.0.119', 1555767607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373630373b),
('63n6qqj6s88okhfsos193tqosf4fk0u0', '192.168.0.110', 1555926749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363734393b),
('63r20o33n3cfcddvjrkt11is431irhnk', '192.168.0.101', 1555766435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363433353b),
('64a6ds2j2u5qja8r7strs2o69rnoj7js', '192.168.0.109', 1555765778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353737373b),
('66jpp5pfgfd7edvib7eulhvrs7u1b7iu', '192.168.0.110', 1555926090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363039303b),
('682m0iebutjqs9db58l4ltcou9ttbjt7', '192.168.0.110', 1555914225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343232343b),
('68ebse04sr9vpgm7ofep9g4mip11aeoc', '192.168.0.110', 1555912560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323536303b),
('68oe7kll0t44fv4jptn2otrf1jsvfgek', '192.168.0.110', 1555920684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303638343b),
('697mckak7f36v03rga17lghddr7ngnum', '192.168.0.110', 1555918991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383939313b),
('69pgtnffpe5oeku13bm2l6q6rr0112ki', '192.168.0.111', 1555911027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313032363b),
('6gfu0oco2erut69fudffdu8uot5qb4ch', '192.168.0.111', 1555910354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303335343b),
('6inqsjtn1usjo94oe14i51g6pkteg26k', '192.168.0.110', 1555914040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343034303b),
('6jrklghl2mro56kl1ioo2nihnat4raof', '192.168.0.110', 1555917003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931373030333b),
('6l3ipkp915bub11fskden17qebm2uacs', '192.168.0.119', 1555766999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363939393b),
('6m2khfvmm0u359hjk59oks74521qtsa3', '192.168.0.111', 1555910390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303339303b),
('6ngm15etaubret5lo7glbhgecogu07ea', '192.168.0.110', 1555913690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333639303b),
('6ntqqcn1psdnl75q26geefivv0pcjkma', '192.168.0.110', 1555914036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343033363b),
('6pf0vrrvtts0jlfk8vgi36i9o3rgiuku', '192.168.0.119', 1555769371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393337313b),
('6php5d3tcgpm9lliqqu97s7ffvmcs2gd', '192.168.0.119', 1555765211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353231303b),
('6rsr17abe04n1ad15tlt5fni34dbk8n6', '192.168.0.101', 1555766345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334353b),
('70jads0mi8lg1k3k3f1qnpeu1en2lsd7', '192.168.0.110', 1555914047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343034363b),
('71b8l11hh7iri21m20upmcbh517dierp', '192.168.0.119', 1555765483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353438323b),
('723apa3o0nael51pamk8j7r3ovtqd5mf', '192.168.0.110', 1555910698, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303639383b),
('733s3860qtemeusrholtdtk3dmrhu2is', '192.168.0.101', 1555765493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353439333b),
('74lu8ake9jngjmi3291dnsvgdmls61t0', '192.168.0.119', 1555770909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303930383b),
('75dgq1i0duom1q05ji7c24hs3j936auh', '192.168.0.110', 1555920656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303635353b),
('767tjvv00883g2edqdupk0hpr9gvt03s', '192.168.0.119', 1555767001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373030313b),
('76eggjrv1n3814igkr113qr3e7v2fbbd', '192.168.0.111', 1555910670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303637303b),
('76ni7r800ss58a5f2ltg1itbtke3cnhj', '192.168.0.101', 1555766215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363231353b),
('76tmio2dr8n5pur80dep55keg93g9rsc', '192.168.0.110', 1555909387, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353930393338373b),
('7744nlbobsunid3hdomotvc51oqft759', '192.168.0.101', 1555766537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363533363b),
('777ii25pq9mfo6dds4i6kcniebppud9i', '192.168.0.101', 1555765547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353534373b),
('77gnl4ee0pr925q54kcb5faro1j3c6ee', '192.168.0.111', 1555910664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636343b),
('77s7ebo9nac18app10bofmhl57vghfqs', '192.168.0.110', 1555926738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363733383b),
('792qjr8ej1n6fv9uo8r0efpoftd50nrk', '192.168.0.101', 1555765598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353539383b),
('79dubrf6jvododpcjicm4vee75nkrsr6', '192.168.0.110', 1555917152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931373135323b),
('79re4g7k9a0iio18221l1040duanksat', '192.168.0.110', 1555919113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393131333b),
('7a0dgcogchtdfbqtddbs7drigre71vgf', '192.168.0.119', 1555771027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313032373b),
('7ajjo79hff1j17ie8jtgo3n38nq2gpeg', '192.168.0.101', 1555766136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133363b),
('7bohldvkikj7s14amj416qnboo1cps0c', '192.168.0.111', 1555910876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303837363b),
('7cqv2cv93p888cq7hp09a82c6g03shke', '192.168.0.110', 1555914212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343231323b),
('7e0npc35st8s10avta3n2e1ipch9u7e3', '192.168.0.110', 1555912545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323534353b),
('7ee6c1dp21edtvn5crdakqdf6s4ti616', '192.168.0.101', 1555766130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133303b),
('7ej278vsef1ksg1unuqa8pvghggp3snt', '192.168.0.110', 1555926083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363038333b),
('7ek0kosgg3r0qnb1vlph8klg5taj8mbv', '192.168.0.101', 1555766200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230303b),
('7euo02f46o3j0pr2ibc3bltshnqb359u', '192.168.0.119', 1555764000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736343030303b),
('7fne3lv1qhikj7hlmdb95vmacqnrp7nf', '192.168.0.111', 1555911032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313033323b),
('7gvea8rdd681btevjqps828qgbtrp55b', '192.168.0.101', 1555766135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133353b),
('7hm51c54eig4oeqvhmvf25odbk2j4bpf', '192.168.0.110', 1555915933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353933333b),
('7lq1kl54tptg5au2ivctbrlm30fesp2j', '192.168.0.119', 1555767393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373339333b),
('7og55gn60rjganp0g6m8uk0ou5f3bsem', '192.168.0.110', 1555918663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383636333b),
('7qfuqku8jq2uv6vuuaba7ct9c2k57jfb', '192.168.0.110', 1555911723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313732333b),
('7qtrrvgcf78e3h6f8o8j6mapgt0afu0i', '192.168.0.101', 1555766331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363333313b),
('7rvoujq9l3f877j8gpval2smdub1nmai', '192.168.0.119', 1555770913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303931333b),
('7sb8ju8mic7g6am633hosok101msj0jm', '192.168.0.119', 1555767171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373137313b),
('7sq8gb1lbhk6d032l7eta5gbtcjqipl3', '192.168.0.101', 1555766535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363533353b),
('7uleu8bemcmpp1csgfntbc7k53t2ucem', '192.168.0.110', 1555919805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393830343b),
('81cu3bqpnih32i3vbhfn408thfvabon4', '192.168.0.119', 1555765490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353438393b),
('843ke12r9l563285uapo03s9buspirrh', '192.168.0.130', 1555768827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383832373b),
('846mrv9arl3jvmaklbtonhdlfkm0obt4', '192.168.0.110', 1555914392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343339313b),
('847kb3c149stbu6h519it7un9u0aq792', '192.168.0.111', 1555911352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313335323b),
('865fufi5c6no4g5g17n36vu5ttukibfa', '192.168.0.110', 1555912537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323533373b),
('88i0jpc5cdhvr7km7vitads4ajo64etv', '192.168.0.101', 1555766158, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363135383b),
('89k82i36b2m2hsqsee3j19llmtl2rscs', '192.168.0.104', 1555766546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363534363b),
('8bbb9usf2j7985dcl4r74hk0ge3i1stq', '192.168.0.110', 1555920709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303730393b),
('8bbtoidirc4ib54hqhde5ui8aedjmq2e', '192.168.0.119', 1555765211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353231303b),
('8c6vrvm22p7pa93kjdo6b5lrtnu1ndte', '192.168.0.110', 1555926641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363634313b),
('8e413ii95l68sgkhdnct8tuh3kmv7asb', '192.168.0.110', 1555768127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383132373b),
('8ecjc8r124nisiqlmjl1kri2qhfdldju', '192.168.0.119', 1555766889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363838393b),
('8ekhkgc0a9o1q0gk46sq5ftflotrardv', '192.168.0.119', 1555765477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353437373b),
('8f055j5orkpjqtvjhsfljim0jpr4scfq', '192.168.0.110', 1555921197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313139373b),
('8h8acf227hc6m8auuf53ehtkh637o7g1', '192.168.0.119', 1555766977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363937373b),
('8nabh0b001j36jnlh98ge29l2ll9cc9c', '192.168.0.119', 1555771684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313638343b),
('8of64kt8d49oibn7rv26kt8c7pihk7rs', '192.168.0.111', 1555910689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303638393b),
('8ovvdrtcnomotvmamduq53psup17ljrv', '192.168.0.110', 1555916586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363538363b),
('8q9ef2m9kq603v845o7en8pj4qcddb22', '192.168.0.119', 1555766967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363936363b),
('8qvm5n6s9q88mhehfslk7j82hoemaoc6', '192.168.0.101', 1555766310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363331303b),
('8trecqqkm9aif5ma1il0u1e3lojpiur6', '192.168.0.119', 1555766014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363031343b),
('8u59v4i753orfe1m8e0h1iph9j6mk0qn', '192.168.0.110', 1555910277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303237373b),
('8vell0b67aet71k6uab1di576v7h0gb3', '192.168.0.110', 1555926638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363633383b),
('8vmg44u3sa9m75hq9bhu0ufreuhhkbn5', '192.168.0.110', 1555916695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363639353b),
('90nhjl7jb4c3nsp3j4oueggl1oggco4u', '192.168.0.101', 1555766356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363335353b),
('91dviq8cvaihs2f8vbnqd8cfs75nf3uf', '192.168.0.101', 1555766444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363434333b),
('91p8te52pqmbr00fbg6dqh27r20pc3fd', '192.168.0.101', 1555766346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334363b),
('935b0lshqcikmu71kj0ii36dv6saivog', '192.168.0.101', 1555766102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363130313b),
('94t3774uv6m7v41pv3j6lr7eu6drf9rd', '192.168.0.110', 1555914047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343034373b),
('955jbnm7tt6gb56lljtt4ic1e68tv2p3', '192.168.0.110', 1555914221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343232303b),
('95e5si0f1bhqejmiut54jiffkp32q0k0', '192.168.0.110', 1555919683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393638333b),
('974l7afbahvva5pncabee4vn0j2s3qcm', '192.168.0.110', 1555911800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313739393b),
('978dk8t9i6o8j3kps9e598klkhalkau3', '192.168.0.101', 1555765425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353432353b),
('98aaeu4g85orcg932rp1n7a6l7s2j70g', '192.168.0.101', 1555766351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363335313b),
('9affsrkatabssp930e8bk3h7jvc637e8', '192.168.0.110', 1555914411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343431303b),
('9f9t3vr3jil0b8qj3kn5kkcah0fkeet9', '192.168.0.101', 1555766256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363235363b),
('9ffcgkdvnagh7fj5205r2mll79t0mvdc', '192.168.0.110', 1555919795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393739353b),
('9fug9rspo6bavmbbj6hklqddts62v9g8', '192.168.0.110', 1555768059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383035393b),
('9gtfk5deqfe270p93c5cnuk8b63jcrrg', '192.168.0.110', 1555925998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353939383b),
('9hbnuaplpvnjh2chjesvuhhbad6mcrjn', '192.168.0.111', 1555910375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303337353b),
('9hprk40bm95l0b4svn828811qlvr032q', '192.168.0.110', 1555768435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383433353b),
('9hv1ett7n19tlfhjbl07u3c8e23ico7r', '192.168.0.119', 1555771114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313131343b),
('9j4jhbj3s3q6mor1c41t6eb569bv1h8k', '192.168.0.110', 1555768438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383433383b),
('9j5vt466dt42ndlr3lqcj3rsdlcjt45d', '192.168.0.119', 1555767177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373137373b),
('9jj8nr1rsv5g5hvt22t89f6oqft3poo3', '192.168.0.130', 1555768210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383231303b),
('9ka75m48jnl3fbvem0bvp49aboju77lv', '192.168.0.110', 1555916565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363536353b),
('9orkd64862oue9injoqmakges2dne10j', '192.168.0.110', 1555926558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363535383b),
('9p62ms8nvv339h78kqhe632fmstq551a', '192.168.0.110', 1555919683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393638333b),
('9p8ns3gifvrlsp283dd2jh1k0nfbgpe9', '192.168.0.110', 1555768711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383731313b),
('9pqmarnf7ceaimnv5spmjarqutruvv7n', '192.168.0.101', 1555766331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363333313b),
('9rlj66i2903cj375ktso3229f7pi4gai', '192.168.0.110', 1555916486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363438363b),
('9rphc9auln4gdhp6a5thdl66o8l0ig4m', '192.168.0.111', 1555916006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363030363b),
('9u852cv7k77k7som5t97qjgviljb5f04', '192.168.0.119', 1555765265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353236343b),
('a0ar08469ottagqjsps3dlf5a2bo30m7', '192.168.0.130', 1555768721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383732303b),
('a0s23mlq5gaj3784c34u1n0hjpuj1on3', '192.168.0.101', 1555765491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353439313b),
('a2l9n4mvph2mm09f8t93hehlm6ock48v', '192.168.0.110', 1555921194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313139343b),
('a31t0n99tem8als3phl2e33n0vu0fl98', '192.168.0.110', 1555913781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333738313b),
('a3lfc9003k8bhn42jsoi4i1geal5a1tf', '192.168.0.130', 1555768824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383832343b),
('a5i9uom6ve8k99v85k1c5c7gc7rp4rbh', '192.168.0.111', 1555910467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303436373b),
('a67mhr1e1vqkar0n64mp4609sqjcbskp', '192.168.0.110', 1555919069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393036393b),
('a6j9ptninkp6udcvqiqg47c0mcdisj7t', '192.168.0.110', 1555914103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343130333b),
('abp9gmp1ri4mr04la32psc81nsc31ea9', '192.168.0.110', 1555768771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383737313b),
('acjf6647te1k98j0jaod4ql4d47j4anu', '192.168.0.130', 1555768288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383238383b),
('adce0b7uul6d959i87m58ead9vp52eom', '192.168.0.111', 1555910368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336383b),
('adk761igcgjnq36va9uo0grq0abe14d5', '192.168.0.119', 1555769350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393335303b),
('afa7drs86has7hauiq1ikrhnj6aih6sm', '192.168.0.101', 1555766231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363233303b),
('afketmfana2bg3j6nt2of8c4il0j4uib', '192.168.0.110', 1555926748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363734383b),
('ahstnijs4mrq5ijvr0gfb2lnttilp5fh', '192.168.0.111', 1555910390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303339303b),
('ahvk0ac6ghcu3vi6j6uri9vvjp55qlii', '192.168.0.111', 1555910646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303634353b),
('aih9s93egdimtm6nqrjk5kel1tuvfa2e', '192.168.0.119', 1555770415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303431353b),
('aiqfo3sci6evde1gtdaj10keaq1nhqek', '192.168.0.101', 1555766455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363435353b),
('aitf2sgnbl3vqaour2mvlp96u6k97mvr', '192.168.0.111', 1555910435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303433343b),
('aj4n8iu7h9h7c0p0jh8fe6kf45e0blmm', '192.168.0.101', 1555766257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363235373b),
('aj54ntq3lb242hgi4uvdprun5ihh1gd3', '192.168.0.119', 1555765156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353135363b),
('ajub5ku8tldua7itkhsdndjusiqf74v0', '192.168.0.110', 1555919266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393236363b),
('amhecrubcj62gfud7vrpqfblv37ufof4', '192.168.0.110', 1555925741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353734303b),
('aoe5cts67m3abvb2vlurrib931uo5bq6', '192.168.0.110', 1555920707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303730373b),
('apbrsnkgpdejql89con1fe9km23th3tv', '192.168.0.119', 1555767604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373630333b),
('aqadrb6e0ftsosaksd31rmfroemaia1e', '192.168.0.101', 1555766152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363135313b),
('araptlbkh551vqj9em338v77ps8par3k', '192.168.0.110', 1555768245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383234343b),
('arkaad8hldv207afhdpb8mi9o38snput', '192.168.0.119', 1555766970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363937303b),
('arklupn6l82kganr10mru6mln7tst2fo', '192.168.0.130', 1555768498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383439373b),
('arr920gevv82bd2ig5ihpnbmcoca8hhs', '192.168.0.110', 1555926019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363031393b),
('asq2frg2qr4omr6ru1ovlaaomgrp3c5s', '192.168.0.111', 1555911021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313032313b),
('atacmviiaclb9cp40h9kq4pchsoeh9pc', '192.168.0.119', 1555765993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353939323b),
('aunu2c7gpert7kjluhh8b1o32uq3iu89', '192.168.0.101', 1555766090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363039303b),
('avlm1mn9r44d2tsrc374b82e6rf9dlqb', '192.168.0.110', 1555921165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313136353b),
('b227nnfagtjp5p57qofencmgje15284m', '192.168.0.110', 1555925936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353933363b),
('b2idkbfketpe50mri94pbk5g67j0d6ac', '192.168.0.119', 1555771033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313033333b),
('b384i39r8sktvli2ktbpgmie6o9gkje0', '192.168.0.111', 1555911008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313030383b),
('b6iqfei53ugesf8m4sgfog5hvrtu7nr7', '192.168.0.101', 1555766297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363239373b),
('b6n6kk74183c0ikgc53ap1ve126h0kut', '192.168.0.101', 1555765543, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353534333b),
('b6v2gknn9pnsut1gjeptfhbuajltpf5g', '192.168.0.110', 1555919103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393130333b),
('b72busun5qdmm9v1lhdpbjsnfvrnbk7v', '192.168.0.111', 1555910380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303338303b),
('b74kp3hc5v4jbdvpgbj2hkfocqsfsq6t', '192.168.0.110', 1555919397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393339373b),
('badbvav73mg8l2guja8js1f23nf75ljq', '192.168.0.125', 1555915844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353834333b),
('baec8j0id0r8lr11bnpkljolc6j79aji', '192.168.0.110', 1555768205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383230353b),
('bahpce25h5g6cjcce07rsc40pam88cfp', '192.168.0.110', 1555919405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393430353b),
('bb021si5oggau0hqcjfdkbjfs4d2eoh6', '192.168.0.110', 1555925746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353734353b),
('beg66a57jfri16mtmi0f6n069igaj6ql', '192.168.0.119', 1555771098, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313039383b),
('bfe57fgfsc96lknvmso8rsk7o7ff1jn2', '192.168.0.110', 1555918242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383234323b),
('bfndk0826hm10pqaa2a63q9mchnvgdfc', '192.168.0.110', 1555913581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333538303b),
('bftrm9ea7d1mr094f1mtnjgat1qm78ki', '192.168.0.110', 1555919267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393236373b),
('bg7tpcm7gdugpppgu2g5rcelgclsf7in', '192.168.0.110', 1555912284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323238343b),
('bg9sfhuo82s68c6k3n7n92tpflfqs8cl', '192.168.0.110', 1555768022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383031383b),
('bh6inmp21qdfo13f9n8004usir3bdk8j', '192.168.0.110', 1555926632, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363633323b),
('bhv1nojqgnljkt236an0fd2hi32qd8cl', '192.168.0.110', 1555914438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343433373b),
('bi62hktsr900f2j5jineslkrib7hq0s1', '192.168.0.119', 1555766845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363834353b),
('bie9jie3kb1404dpuesr9oc4v5d44drv', '192.168.0.110', 1555919422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393432323b),
('bj4n50vgr171bc1lh0nsren4gfdr7e3n', '192.168.0.119', 1555767750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373735303b),
('bj8qkh5ntbrgdqla9fc2lpfeee2q93th', '192.168.0.110', 1555914051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343035313b),
('bjh9vnkjbjoq5tb6bs546mice08qohhi', '192.168.0.111', 1555911362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313336313b),
('bl37od9n9spifjjaegnihns0nsm94eis', '192.168.0.111', 1555910349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303334393b),
('bl79i1j96b42s80m2q4g1u4q1dnmosmn', '192.168.0.119', 1555765931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353933313b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bllhs35bf9s1j76qcg2qirrju9udmo2p', '192.168.0.101', 1555766322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363332313b),
('bm0lcvbieuphctpgp8cvpn016m4namsc', '192.168.0.101', 1555766251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363235303b),
('bp2v5368ihcsvhoe1mbpns8q5r530juq', '192.168.0.119', 1555766705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363730353b),
('bp8vloh82kqeqhj5aickjcqjbpdcm3uh', '192.168.0.119', 1555770370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303337303b),
('br28r4b1231erdklfji2fmla6lbe0sc2', '192.168.0.110', 1555768693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383639333b),
('brbg974j9kmldu721eaavrv6m4tm73o3', '192.168.0.111', 1555910364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336343b),
('bvu5uerjeb33ola0544quvpda970o9p9', '192.168.0.119', 1555766996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363939363b),
('bvu9jkb86ohlaehei5eid42uh33ksi0h', '192.168.0.110', 1555914111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343131313b),
('c2v89jsmg13eqpeiel4cahehpj9u64iv', '192.168.0.101', 1555766231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363233303b),
('c4db128ufea1k52534q1p3m19pdp6ovo', '192.168.0.131', 1555926234, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363233343b),
('c59p5mi7b5klu2u49k511sithg3kcjg2', '192.168.0.119', 1555766716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363731353b),
('c5qe35hp2aid81u8fmbu7kotobdl3ro3', '192.168.0.119', 1555767588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373538383b),
('c6fd1e0cil9vv8e19id730e27dpt45qg', '192.168.0.110', 1555768052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383035323b),
('c7c072h5asu736oetj4dor9ai0oi5edo', '192.168.0.110', 1555919230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393233303b),
('c7tdt6lfvtlc4jjnv8asujtm3djodgs4', '192.168.0.111', 1555910664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636333b),
('c9ro675edr214i4lm0sgv2lqrbhjqf1j', '192.168.0.101', 1555766310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363331303b),
('cb3f35v9dfcg7lhrom38a613o2hq2d2m', '192.168.0.110', 1555926002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363030313b),
('cc3cm9qgil9p0mpkahlkjnh1q3r4hh4t', '192.168.0.110', 1555926122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363132323b),
('cc6h2hr17ivs1h9dk4uoh5mnvib14amp', '192.168.0.111', 1555910654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635343b),
('ccga5hr6askfpdlaaelqvt5ruubafr5p', '192.168.0.110', 1555925993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353939323b),
('cdf3iqioip42c0ljkohfarkkrvkapuug', '192.168.0.101', 1555766409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363430393b),
('ce2bi23k8qrl5ealmqmppi20iv50psql', '192.168.0.101', 1555766196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363139363b),
('cekuscnohv2gedrkpaovckr99e58i2bj', '192.168.0.119', 1555766767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363736373b),
('cf8795u04j1qkv0nq8qfjj1c6v5esrt7', '192.168.0.101', 1555765538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353533383b),
('cfhgqr7o87neainci10du7g1klb9ucnh', '192.168.0.101', 1555765539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353533393b),
('cg9s2s4qhf3r011sn2adibq7h2mtp8vm', '192.168.0.110', 1555919402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393430313b),
('chstn6o5pb2m9l73t2ktqpig60oneu1f', '192.168.0.119', 1555770408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303430383b),
('cimcnacr5f8mg8d6ga120fqi79fllkhs', '192.168.0.111', 1555910453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303435333b),
('ckp2ja91r27l2gpc4u0j2d15esnpgeqh', '192.168.0.119', 1555766866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363836363b),
('cl319ig1rvd8hfsvqfgpkffovigq84jd', '192.168.0.119', 1555770902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303930313b),
('cqhtnr76t51vukt15fgokoekeisi6cnk', '192.168.0.110', 1555768363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383336333b),
('cqq4jhnrd9vp1o01u36m628637dh14jl', '192.168.0.111', 1555910688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303638383b),
('cstpaenc7giuv7k3lg9pojj96bk187l7', '192.168.0.101', 1555766131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133313b),
('ctei27018gdmktgiuhaicmtc5rikdg3q', '192.168.0.110', 1555768061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383036303b),
('cvge89io8obpq7h1h09nj1vcs0bn6l2q', '192.168.0.119', 1555769110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393130393b),
('d0embuesa462799mq76140rm0spfnk6g', '192.168.0.110', 1555919824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393832343b),
('d29tr394mtbcshdkkmvop5h99rqs69j7', '192.168.0.119', 1555766968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363936383b),
('d3hhsae7kjmpmki1sd96t9en7omt6s4f', '192.168.0.110', 1555919116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393131363b),
('d5mesmh3a883h6v3n1tiot057567m531', '192.168.0.110', 1555768551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383535303b),
('d7hqfh1sq9unuumo3q54q52ne37qqik5', '192.168.0.110', 1555926027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363032373b),
('d7lnasee6j6lr2n24ekv0isuh1tfr59d', '192.168.0.110', 1555918243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383234333b),
('d8jkechvcfo3nmv4if10s7hgmmn9hiu5', '192.168.0.101', 1555766134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133343b),
('d8p5nqp1upc9b8eg12vk7l50c1p3kaq5', '192.168.0.110', 1555919144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393134333b),
('da8u0c1pnarg99u0d6dg5jqld88bleb2', '192.168.0.110', 1555919402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393430313b),
('dbbojhhul0ardp2sv3chakhme1f7j7ar', '192.168.0.101', 1555766204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230333b),
('dbejkk0cjrblq23hdok0akcehvdrqq10', '192.168.0.111', 1555910693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303639333b),
('dbs737pm0mgthcmu3b8aq17l5o303489', '192.168.0.119', 1555765489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353438393b),
('dc40u9fl1ndp5dp41cbclkosbhg0frat', '192.168.0.101', 1555766456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363435353b),
('dc649evl0if86iu95n1v7idls6pa64l7', '192.168.0.119', 1555769534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393533343b),
('dd0p9km3caqkbcmrvht6iekr11srnjqo', '192.168.0.130', 1555768310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383331303b),
('der1l1p8o61k9ucavk38g2m83vv2e35u', '192.168.0.101', 1555766477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363437373b),
('dg809i4389ociijh2ouq03mfh2l2p30t', '192.168.0.119', 1555769646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393634363b),
('dgbejh1teagpfjac9nf9h1anu4icbonf', '192.168.0.110', 1555918991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383939313b),
('dgt9lskfcksv2pskmbkkifeovp9d2ieb', '192.168.0.110', 1555768691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383639313b),
('dh5p032rgv74iludlfkg4av0uq83s2dj', '192.168.0.111', 1555910651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635313b),
('dhh97ao9idjdrq8dp9su346m1757pk3u', '192.168.0.111', 1555910200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303230303b),
('dhu8j4crvgp3nbndjefdoeuno1r8qb5g', '192.168.0.111', 1555910594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303539343b),
('di5em0i6d2ad7rmbcit8jv65athqpjq5', '192.168.0.101', 1555766143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363134333b),
('dj95efhiesp6q51g7pmt5a82uh7bun2q', '192.168.0.110', 1555926186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363138353b),
('djh4glpp67iq3ne8frbtla1miopeb769', '192.168.0.110', 1555918426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383432363b),
('djkdgs91gr9pai8npn74fqur0qv49aee', '192.168.0.109', 1555765725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353732353b),
('dk9usfh2bope1k6230ob5ni8i0lurals', '192.168.0.110', 1555926756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363735363b),
('dl4vtsb4kjorud1scn0ndn490kme3gbq', '192.168.0.110', 1555926003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363030333b),
('dm96lvv4u4ib20bgo2679co2ch2a3al1', '192.168.0.110', 1555914392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343339313b),
('dn2tlukb0kgbbp0agaj54tmgr2qdflu5', '192.168.0.111', 1555911368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313336373b),
('dnrk431b5oaefh9jqajvta3mh80e6727', '192.168.0.110', 1555914117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343131373b),
('dnrsc9q3crmt61ar8gu3iptgme7sinc4', '192.168.0.101', 1555766533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363533333b),
('dob9rgof6p5ds5bb8b6th886s5al93qb', '192.168.0.101', 1555766208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230373b),
('dqc592pr9hmjee4nks51nsriotgtdqce', '192.168.0.110', 1555913590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333539303b),
('dqc5g48665kbrnjqhkmbr0mjdso0e930', '192.168.0.110', 1555925995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353939353b),
('dqfb0ogn1qdu9donjmlfn7t7vvr82fl6', '192.168.0.110', 1555921172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313137323b),
('dqvfckckj0v7mem8jpkpldcll1ei6030', '192.168.0.110', 1555913764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333736343b),
('dsdcifo08cnjv0mo91m6pq9hqbb7ai9e', '192.168.0.110', 1555916790, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363739303b),
('duq33jq8b7rjviv3n8tsi06dn6t9b6qc', '192.168.0.101', 1555766159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363135383b),
('e04c5ggi0a1qipplfn5uqr0oloeh45a2', '192.168.0.111', 1555911351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313335313b),
('e3h99ofhhaa1eeivsfkr81luvtrgjrnk', '192.168.0.119', 1555769407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393430373b),
('e6g9ts68e1b20cootv8vijt49s40dl8q', '192.168.0.130', 1555768209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383230383b),
('e8l044bjgplusnsa4ip3r5uiiaseitos', '192.168.0.110', 1555925747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353734373b),
('e918ehq7aeg84j9jp8efpu1e8jcgclgn', '192.168.0.111', 1555910662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636323b),
('eain1u8033evnq3oientq5snnnupe05o', '192.168.0.119', 1555764001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736343030313b),
('efrb3nhuk0evnm36iffr2mde45va28ot', '192.168.0.101', 1555766342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334323b),
('eg6270qth63bk2bp3k7vljqti4restbf', '192.168.0.110', 1555919412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393431323b),
('egeibdprh4rsqr86o4q2s4hifskt8du9', '192.168.0.111', 1555911033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313033333b),
('ehl57jvuhjc50nkrubqhh1t90aslvfs9', '192.168.0.111', 1555910797, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303739373b),
('ej4bjvnmiigedial0i1e2spgk05nedog', '192.168.0.119', 1555770499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303439393b),
('emb2ulmig50pb85lrs9bqdam23a2aarl', '192.168.0.111', 1555910455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303435353b),
('emisu3d0hh97818r84f9nc6mol3dmonk', '192.168.0.110', 1555921164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313136343b),
('enlo9aoa90kbuplutfufvuiud2ktpk2t', '192.168.0.110', 1555926189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363138383b),
('eo47ap9r0vga5i9h4ef7lmf0d02abdrr', '192.168.0.110', 1555919676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393637363b),
('eoeqprvms4iufke8vpnhk0pikopaplum', '192.168.0.110', 1555768208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383230383b),
('ep5irilrq3a1l1jepr5sou0u43h8t0tv', '192.168.0.110', 1555914332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343333323b),
('eqaqcrf1np9icvrhcgpe21c4v88add8t', '192.168.0.110', 1555914124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343132333b),
('eqc52i54ihom3h14ihgj532gr31ildta', '192.168.0.101', 1555766307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363330373b),
('eqlu0855jcl7hhb1m4f2qntd8j26gris', '192.168.0.111', 1555910434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303433343b),
('erjaqb4bkpn143hopq2v4v3ueve1ephm', '192.168.0.101', 1555765496, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353439363b),
('et7h6juast3ckbjghne37aqfgtvc6tj9', '192.168.0.110', 1555912538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323533373b),
('eu8ldvlle5ka1uvfk77lggi0flk8lo4b', '192.168.0.119', 1555766760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363736303b),
('evc8r6sg027gdhvoifr7ltqirg83114c', '192.168.0.119', 1555770415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303431353b),
('f2i6kvfnms7fa1fd1hmhp5ndkmr5ifjm', '192.168.0.110', 1555919893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393839333b),
('f2latedqfc46r7qgst9qopk3ldjaf0lh', '192.168.0.101', 1555766247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363234373b),
('f3fuq29linl14uiugmf6feqtour8u29b', '192.168.0.110', 1555926546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363534363b),
('f4firmt6o0kas4npm7s3o3bhdqrqnubr', '192.168.0.119', 1555770560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303536303b),
('f4p8mro4qfjb62gb7bemi4u1hs6mmgoi', '192.168.0.119', 1555766987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363938373b),
('f6eg0db3a1op6bifmi46f66jg4feje1f', '192.168.0.110', 1555925942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353934323b),
('f7mptf3jrg48pvlr3vct4vkdch222s15', '192.168.0.101', 1555766124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363132343b),
('f9nt67valf73e6d5sp9s6im064214lsk', '192.168.0.110', 1555913549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333534393b),
('fa72btjgovqoktq8inp8ln875kk1pe0g', '192.168.0.110', 1555913772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333737313b),
('fb7g4ve59a19kla0gplgtgqac07v95jm', '192.168.0.110', 1555926088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363038373b),
('fcfl3ej1gitl5usmt2v18ela04qig8hl', '192.168.0.119', 1555765161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353136303b),
('fdff48tf6ndb59r544mhhjcbmllronvk', '192.168.0.119', 1555770506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303530363b),
('fe4vdb90nsqe4v3qde8g7cau6t8nmkkc', '192.168.0.111', 1555911012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031323b),
('fe5n36sa6gth9ght3ogv2huerh151qbv', '192.168.0.130', 1555768617, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383631363b),
('feqkd08h7p9ceclo9c3703vu3gj6ko9r', '192.168.0.119', 1555766952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363935323b),
('ff1kj99spt1f36vee6ng6fqvtim289sd', '192.168.0.110', 1555913787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333738363b),
('fffe5v5mvuk188be4jgptj8u3q6r0gd6', '192.168.0.111', 1555910381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303338313b),
('fi7v7cugccuqso3fq176fn09gk711f72', '192.168.0.110', 1555913705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333730353b),
('fit5bc6vmt5bu2ctjku24puv702u23ft', '192.168.0.101', 1555765438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353433383b),
('fkb5c110vd78ptinoovds41ee68sinc7', '192.168.0.119', 1555765932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353933323b),
('fkrp2a42p5vogus7np9f8c1h2ion5566', '192.168.0.110', 1555919683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393638333b),
('flcvftidbneb65pb3a6b5pbrjulhu5ku', '192.168.0.110', 1555913777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333737363b),
('fljdrdhs2q3td70g1n4h6oph6atvdbcv', '192.168.0.110', 1555919823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393832333b),
('fmasp8or6vjl1bcii4veiu4rj3tive09', '192.168.0.101', 1555766133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133333b),
('fpv0cn6vl5nf5127vhlpil2k55i1g492', '192.168.0.110', 1555919675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393637353b),
('fq13tkdejr7h2ujfjnouqhdohda1l4hi', '192.168.0.110', 1555768748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383734383b),
('fr4i4k0hrqrl1nq5bkvf3pefj9ljh9l8', '192.168.0.119', 1555770371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303337313b),
('fsrkfkafsn4vc9k14b9p66pdort6l6ie', '192.168.0.110', 1555911804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313830343b),
('fuenkjaq1virphv1odsoc3lssv3s8bmr', '192.168.0.101', 1555765904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353930333b),
('g05gvhb0bg54nrht0cvp2ceo1mtan0un', '192.168.0.110', 1555926680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363638303b),
('g2j7usdocrd582ki4ge0ijrtnmgoe98l', '192.168.0.110', 1555911366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313336363b),
('g33d5389m56kefa2bqs92r3rdjtp39e7', '192.168.0.119', 1555770480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303438303b),
('g3k34palv08n3csbek93bporqsn944gb', '192.168.0.101', 1555765517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353531373b),
('g3sl9u3mrbeqoqifjrd3hipm72rimpr8', '192.168.0.110', 1555913702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333730323b),
('g4o8rh08t5akoo9rilr983ar09apcgia', '192.168.0.119', 1555770563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303536323b),
('g6lcbko6p8j52r3gui699mu7ruapmdca', '192.168.0.119', 1555770497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303439373b),
('g7e84a0qnbvfslc2mv4ud0qjtqprqq81', '192.168.0.110', 1555926740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363734303b),
('g7f07lfvq64dqgn6cv0r7dqa8c6t96vk', '192.168.0.101', 1555766344, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334343b),
('g7qu3lfisehuhpk8fc5n3mbhvqfgiles', '192.168.0.119', 1555765202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353230323b),
('g8n246gtusg5q3pkc2tjm2e058hs0q97', '192.168.0.109', 1555766578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363537383b),
('g90i5e0tn48cd18t1kf46op10922h98p', '192.168.0.101', 1555766476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363437363b),
('gc8jjer0gdudb6i18u65245guqa5opri', '192.168.0.110', 1555768211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383231313b),
('gd38vltmhnaouladtm5evfv46qao1op8', '192.168.0.110', 1555919348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393334383b),
('ged64te8ckjdc2eamss25bncs64764ll', '192.168.0.101', 1555766342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334323b),
('getvjs8dhf0i2dvjf62ko12viig98cn8', '192.168.0.111', 1555910357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303335373b),
('gfbkt82kgbt0fip4u21nbcao5ci91d88', '192.168.0.110', 1555910276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303237363b),
('ggglgsnnadhl1rvb7tss8anbd0gp6ds6', '192.168.0.119', 1555767594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373539343b),
('ghjkmom8lmkcr0ji79pcs9pk2hbce2ke', '192.168.0.109', 1555765754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353735343b),
('gi10jp30mjko2o3i0tl8n6c0dlicuub1', '192.168.0.110', 1555925578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353537383b),
('gkbufgosnugeotfhaij1pskl27obb0h4', '192.168.0.110', 1555911374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313337343b),
('gm33ifqm9lsg2dffnn9oj925ccl94jih', '192.168.0.101', 1555766228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363232383b),
('gmjba7ne0nv24m1sf3imi3t2f6skkib7', '192.168.0.119', 1555766898, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363839383b),
('gookq5p85pfmlupkao5fqogcdkck04fi', '192.168.0.110', 1555919601, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393630313b),
('gp3sb6me616arss1097si0l1dei3ubid', '192.168.0.101', 1555765489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353438393b),
('gpf1oc1p89sis6robst6e0hsuka19fvp', '192.168.0.101', 1555766480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363438303b),
('gqbfoq6gb8vebkmdqaa4vcc5acebnkfb', '192.168.0.111', 1555911363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313336333b),
('gs0n05l5cd9jjq2bdai6d9m9uobqau6i', '192.168.0.110', 1555919349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393334393b),
('gsacdbsoirethcnnisvfud49grs01234', '192.168.0.119', 1555769371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393337313b),
('gsene3vhkob3cr20t6ftn9nenb42ge99', '192.168.0.110', 1555912537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323533373b),
('gtq0nupjookidh0ef3mohep9j191tm4o', '192.168.0.125', 1555915856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353835363b),
('gvf4h9e462qm2nekvtmlkottop715i2c', '192.168.0.110', 1555916923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363932333b),
('h0fhtrsfsdd9qq93lvihrfkgpntp2fja', '192.168.0.119', 1555766843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363834333b),
('h3pf36u6qc1fidh85c3jdgspmao4315u', '192.168.0.110', 1555926635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363633353b),
('h4bnmk5h2dbm99gjd8inm318mrmnrfjl', '192.168.0.110', 1555768063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383036323b),
('h4f9hs51q3lml8b8uqbaaapgfl08tc05', '192.168.0.110', 1555921187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313138373b),
('h4hnhplns5iaq1psi0scsl76sop7c9h2', '192.168.0.110', 1555914236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343233363b),
('h5fqmujoblecqkdkm447rm15otel3ern', '192.168.0.110', 1555914383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343338333b),
('h64kl5hm8j7ikusnjfjkcbs52ivi2d93', '192.168.0.119', 1555764239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736343233383b),
('h67leli1813d3ldfu3r7nit488n4lv7j', '192.168.0.109', 1555766584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363538343b),
('h79o2d7mpo11mp8oe3rtnepis5u47i9p', '192.168.0.110', 1555925941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353934313b),
('h93t3d76ou9q89q23b7f8hrohkmn8gaa', '192.168.0.119', 1555765213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353231323b),
('hb95pc9krejf7rk9fo4k2u6t9kvfo6fo', '192.168.0.119', 1555766895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363839353b),
('hcaqoasnjkfqjd75k16us141a20eicug', '192.168.0.130', 1555768414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383431343b),
('hccemkq5ncqpr8dkqk2vbcj2c38ff0aq', '192.168.0.101', 1555766133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133333b),
('hd2aojfscbdfc9sd28oagr74lldg44f4', '192.168.0.110', 1555926692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363639323b),
('hecrkdnbiesait8amcvsikaliiuqn4jq', '192.168.0.110', 1555919892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393839313b),
('hed24rk1d32561f9ejbbr2hdjsfmhr0d', '192.168.0.110', 1555919069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393036393b),
('helfj828vht4brfpsdppvs18qgqea0ni', '192.168.0.119', 1555767015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373031353b),
('hgi0gpdaftj0ssvopr5stgqgr3vp82ab', '192.168.0.110', 1555909373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353930393337323b),
('hidtrfflvu254d4vukr3o6n6t3h4mu9e', '192.168.0.119', 1555766904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363930343b),
('hjc74oi3cf1kmetsmbtpdlr2aq866vel', '192.168.0.110', 1555911377, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313337373b),
('hlaqg8pm2k2ocgu059ii9u02m2pm1b89', '192.168.0.119', 1555766999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363939393b),
('hmns1bk2fdqjnp4tod70bheih4hpn9t2', '192.168.0.101', 1555766478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363437383b),
('hnt35b72eloeu287e76ci7g168m9g857', '192.168.0.119', 1555766916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363931363b),
('ho6b0hgobrtd06b5nbttr04v2a8h5npc', '192.168.0.110', 1555921177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313137373b),
('hooggccaus6ajdo315d0nravmr9ukpee', '192.168.0.110', 1555926011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363031313b),
('hp2rum47bd3qfj30hrlpd2adkt62bsc6', '192.168.0.119', 1555770555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303535353b),
('hp6j7bf059m9br2ohh7sirs50hvjncma', '192.168.0.130', 1555768698, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383639383b),
('hpvilikg327ebk3c1es2k75r75veitn5', '192.168.0.110', 1555916486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363438363b),
('ht04ssg32nrbv0kniqlf6t4tle0hbg66', '192.168.0.111', 1555910693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303639333b),
('htu5t4q6ulua9csnr3g4mnfj5hevh341', '192.168.0.119', 1555765263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353236323b),
('husajkfba3nk3kheq0bhuggunit7fabf', '192.168.0.101', 1555766142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363134323b),
('i09gvq71ut5s75nvefeenitkebhg3rck', '192.168.0.101', 1555766204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230333b),
('i25jlfpsq4aq62g4d07utfocsl8f1p0i', '192.168.0.101', 1555766102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363130323b),
('i5eo5bglv7l0tu9pdf0d3rfemggeilji', '192.168.0.110', 1555920802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303830313b),
('i73jof53ilct1p6gf5v77rkhtb3d7eeq', '192.168.0.110', 1555925931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353933313b),
('i7cocvoegg661a0ed5foecepplio2ile', '192.168.0.111', 1555910688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303638383b),
('i97ua2g2kdk3k1rvck4o9e78qubshcva', '192.168.0.111', 1555910390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303339303b),
('iaak6n74e2u6gh842gq55htl7gr4qkac', '192.168.0.111', 1555910452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303435323b),
('ib7pa4svcjhts85f37daa4bbgacmnnri', '192.168.0.130', 1555768210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383231303b),
('ib9umbbspjdt7nb86fbj2hntf82eq0ff', '192.168.0.110', 1555925594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353539343b),
('ic7aug7cpa74t7l8t79s5dqmu9ml8qph', '192.168.0.111', 1555910380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303338303b),
('ieutp1e5mfh2a0n297m5ik6a5u0bdo3i', '192.168.0.111', 1555912148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323134383b),
('if5gbpia9q188c5on5abpauavb438n9m', '192.168.0.110', 1555918664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383636343b),
('ifq7i8f92a5jsaqtpn1e2406gfr23r4i', '192.168.0.110', 1555915985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353938353b),
('ighk8u9h36fdlh6sl995pp9rfij8dvf9', '192.168.0.110', 1555926679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363637383b),
('ihario68lkc6ftv33bu5vbk6f5pffgeq', '192.168.0.111', 1555911015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031353b),
('iimbb3hd9ee4pvik8d0njc2sbvbek82a', '192.168.0.110', 1555768374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383337343b),
('iiu5pilk9qa3u5u07qs35kh4sus0fgqc', '192.168.0.110', 1555913739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333733383b),
('ijaqvoclnc6pc837cnccg9he2oihhafp', '192.168.0.111', 1555910658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635383b),
('ijfr8ipe6jeisnk33tooibgpl57e9rbq', '192.168.0.110', 1555914233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343233333b),
('ijpe09ffjqqki8lms2dhi0otm03driss', '192.168.0.119', 1555769351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393335303b),
('ilmlubrcafulvh0pj1jgdvum4kd4o7om', '192.168.0.110', 1555925998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353939383b),
('imfs6kmdsk1stsoe6ncrj84k0d4g3s6c', '192.168.0.110', 1555768535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383533353b),
('ioceric62qovr4fceo6mlij35efe4l9q', '192.168.0.110', 1555912268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323236383b),
('iog2db0fsjdjt5aifm93kum6jgapt8c5', '192.168.0.110', 1555914219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343231393b),
('ioq8ho3lpg2001k5hscn5r5i6d95a574', '192.168.0.110', 1555768089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383038393b),
('ip96hlos2om2qp4obrbg3v2uurioqfda', '192.168.0.110', 1555915965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353936353b),
('ipnj1ud21tesrnblaf3cbi80776s53nr', '192.168.0.119', 1555767171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373137313b),
('ipp7qcskisp1nhqcdiun6j94i6qopisl', '192.168.0.110', 1555914213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343231333b),
('ipqp8sf77ccdajf69eqqoha0i7evv45k', '192.168.0.110', 1555912292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323239323b),
('iqo1vggfc266higb3mm16m0b581ko2cc', '192.168.0.110', 1555919119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393131393b),
('ir7of1pbl4b8kpqiq27di849el4caeb6', '192.168.0.101', 1555766300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363239393b),
('irmhlhv1advb7gs6pjhtot226f5kt82g', '192.168.0.119', 1555765204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353230343b),
('is1845albk497hfr9r2ehrdnkfa16a9g', '192.168.0.110', 1555768202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383230323b),
('isup18c87af4puncq4f59os3tvjqacfb', '192.168.0.111', 1555910663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636333b),
('ivmu0a6ocb2r649g2735rg564l1c32e9', '192.168.0.110', 1555768714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383731343b),
('ivrpg82arhe5onrcartle57799j7iacs', '192.168.0.110', 1555919602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393630323b),
('j1690u6kgd38iagldj8ann00p432stab', '192.168.0.110', 1555926686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363638363b),
('j2dblksk4utj0insat72pu5mcm3g5djl', '192.168.0.111', 1555910461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303436313b),
('j528f79togdnd7mmhbuapjsp8tbeggar', '192.168.0.119', 1555769371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393337313b),
('j6001cviid3m2qafk2lfn90lcntrktkc', '192.168.0.111', 1555910687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303638373b),
('j78cn06hnis54kkoe2v42r1s5npu3lqn', '192.168.0.119', 1555765996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353939353b),
('j7keg1ega0b75b0ean0p2bcbjampokck', '192.168.0.110', 1555916744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363734343b),
('j8i2e4f4r416apstoddbdsmhhgmn6ntv', '192.168.0.111', 1555910796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303739363b),
('j98t1g3poefo6kk5qhil23lol1t21iiu', '192.168.0.110', 1555768115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383131353b),
('jce2u0eim97iojqrng3mubm3f35f3nuj', '192.168.0.101', 1555766158, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363135383b),
('jcv1sjm7esehs45j6hc5ckbkb9k0t6aa', '192.168.0.110', 1555913590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333539303b),
('jgvm0chfq32m1iet62qt6akf31f86irp', '192.168.0.111', 1555910654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635343b),
('jh37cjc7ffipl8m2n8f9us1pu9r8ulml', '192.168.0.110', 1555768761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383736303b),
('jhiu127o8ip565tugdkee0fvudb9qhn6', '192.168.0.111', 1555910369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336393b),
('jhu2nj1jukk1lb8bmctkcj32rm6q600g', '192.168.0.119', 1555766986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363938363b),
('ji851c9a9p8aqehgodk1mgc2j8bu1158', '192.168.0.119', 1555766011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363031303b),
('ji9c84v7appa0tcff06h95g816i4p2o5', '192.168.0.101', 1555766422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363432323b),
('jj3n05f4m6dsiogj21133qfmes3vtj4u', '192.168.0.101', 1555765464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353436343b),
('jjlt3djqfo5cua7p2h7ilkdsk3s69ukk', '192.168.0.101', 1555766122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363132323b),
('jo8i4etfkb93rvjdc2c5g7of5127ofbm', '192.168.0.110', 1555913614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333631343b),
('jod475oqvi7tjhonff4gbloau53r8b8j', '192.168.0.110', 1555914438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343433373b),
('joknmq2h8cqg3f9sb7h3m8j014hj5m94', '192.168.0.110', 1555925597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353539373b),
('jpohit40ls063bhp0iack7jnbq7hm8aj', '192.168.0.119', 1555767581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373538313b),
('jqvk358k23jrl6ju6eksrtfb0es7m16i', '192.168.0.101', 1555766332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363333323b),
('jrn8l4gltno8s418np6n0duoi4m6o15e', '192.168.0.110', 1555911374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313337343b),
('js0ml50fo3j8um0ck3fpntlchn71amm5', '192.168.0.119', 1555769542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393534323b),
('js59dnjubkpl8j94ef99n61p8q9r82nj', '192.168.0.111', 1555911010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031303b),
('jshfa00hlc6qkba2v3ggadb7p7ulatoi', '192.168.0.110', 1555926500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363530303b),
('jsm9l94qr49i73chug7nh9bhnn2np6le', '192.168.0.110', 1555911731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313733313b),
('k1okeie5ub8m1ftvhhvfplsclqthuhtj', '192.168.0.119', 1555771113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313131333b),
('k684cmt776027nkmhhj0t60nvea8j42q', '192.168.0.110', 1555768228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383232373b),
('k8e4k1ltmt532c2skbsatp9fb3jr1ner', '192.168.0.101', 1555766209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230393b),
('ka9m4ucb2tecvc7la7i4jnblbeq2nhpc', '192.168.0.110', 1555911825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313832343b),
('kacm2qlcrsae6rjbfrspipurb7qa124q', '192.168.0.119', 1555770494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303439343b),
('kbf7en5cmbto7herv5cb09fkk55ebfet', '192.168.0.119', 1555770928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303932383b),
('kbit81ijhkjf77dur2mgfmrjaps81ffi', '192.168.0.119', 1555765155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353135353b),
('kcc97svbvilihmel09uo2sejh1a2gf1p', '192.168.0.110', 1555919793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393739333b),
('kd2e9r83hplba2gdvvnnp0o096m0ug25', '192.168.0.119', 1555767177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373137373b),
('kdslca20ao1g09kk84f523pta2a0o3lj', '192.168.0.111', 1555910439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303433393b),
('keb6j76sdfjin2g5hsk1djo3vsbjq4ff', '192.168.0.110', 1555912559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323535393b),
('kfej7mojh84b0anc7s2jfvtd83ol7hd5', '192.168.0.119', 1555771039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313033393b),
('kfuoeuj56glh9fd6ff9ua7guddielerk', '192.168.0.110', 1555921189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313138393b),
('kggkni0bbcbcs0avtc5basbdkripnbl7', '192.168.0.110', 1555913597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333539363b),
('kh38ia7pjpk7sq70m4fa6s6ei5rui7b1', '192.168.0.119', 1555769353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393335333b),
('khte0bao431ludtcnp18as6nd5pp74mv', '192.168.0.119', 1555767573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373537333b),
('kjpq4pf4bnd9o8sgoddqoj3pm8boovbq', '192.168.0.119', 1555769651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393635313b),
('kmg2ej91mo9fv4qkg6lh65566oq21mpa', '192.168.0.121', 1555912229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323232393b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535373538333838223b6c6f67696e546f6b656e7c733a33323a223332323161333161373861626233643764303333623564386134343834653833223b73616d616a5f69647c4e3b),
('knftas69m59et71bgthmsrdvm6coua50', '192.168.0.119', 1555764236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736343233363b),
('knk1hcneao5eo0dks4uts8oih4dihb3e', '192.168.0.119', 1555769356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393335363b),
('ko5mgn1hfl6567akod232f003c8king3', '192.168.0.119', 1555764224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736343232333b),
('kon54tub2lgjr2ph8024e89bmdt1s429', '192.168.0.110', 1555910254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303235343b),
('kot764j4c3avr6fcrarqnvo2qrchdonb', '192.168.0.110', 1555913586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333538363b),
('kpuc26peui89hie498f63no4jshpllg0', '192.168.0.111', 1555910410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303431303b),
('kqqdlcc763s5ot364m8283vlh5niqqik', '192.168.0.110', 1555926639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363633393b),
('krd3a45mcnvrsd3ho061953ccvjcti17', '192.168.0.110', 1555913687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333638363b),
('ks7ssbmsucbl0o4rvd9ot8qvhv934epb', '192.168.0.110', 1555910248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303234383b),
('ku75ps80tiismmjrroc9u30sj85o46r5', '192.168.0.110', 1555926758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363735373b),
('ku8c6m8i0en5lre2gujng2igrefvppl8', '192.168.0.111', 1555911016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031363b),
('ku945585ska24a0pq4a6d5r1ggbb5jv9', '192.168.0.110', 1555912274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323237343b),
('kvgsh8kekehsjrg8isk2iddnv7ob18n0', '192.168.0.110', 1555918921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383932313b),
('l1tml1pvk8man5nrd6l5bf08fm0t1olv', '192.168.0.111', 1555910352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303335313b),
('l23ni5bih24hf2q7kmehj4sm8csrcnqn', '192.168.0.110', 1555919649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393634393b),
('l2ojtn89oeh01fdrhcuk3rrotrq1ku6n', '192.168.0.109', 1555765724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353732343b),
('l35st53m9p6sladetai1ijaeenf344al', '192.168.0.110', 1555921169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313136393b),
('l3pu84e8so4qmqvfcje3p9sv490qqkbq', '192.168.0.111', 1555910883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303838323b),
('l3qumb80v3ujimqtv052dtppm7g1lo3j', '192.168.0.101', 1555766289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363238393b),
('l3rhi12d5ijl0q00j1m7oj6hocqhuk79', '192.168.0.111', 1555910883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303838333b),
('l4hp9mi2edrgcu80t2rh65io1j3mkuc3', '192.168.0.111', 1555910795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303739353b),
('l6huneqi5u9sa65t995tn91jhftkk5va', '192.168.0.101', 1555766475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363437353b),
('l8b4n57ap71ebgonklsfvdmeqad85e3h', '192.168.0.110', 1555920813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303831333b),
('l9gb0untjgqu1j9vh6bdugpdutcfteeb', '192.168.0.110', 1555926082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363038323b),
('la5ms7u1cvffs4efmqftjdpgipsh7esm', '192.168.0.110', 1555913682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333638323b),
('lar7mnt75j0uvmng8dgsdm5pjcd5kfub', '192.168.0.101', 1555765903, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353930333b),
('lbalf2so5c38iclv389ud3nu2cgcovuq', '192.168.0.111', 1555911012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031323b),
('lcug6clad3hr6fo50mkb58iqj49bstq1', '192.168.0.110', 1555918922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383932323b),
('ld13deleulg33ds7rhsat0hc5mb6hnvm', '192.168.0.111', 1555910838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303833383b),
('ldfjpnv6nvj9akedq8l5qmd46um2e292', '192.168.0.119', 1555770468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303436383b),
('le5rdhu6ebue4e7u8nh19h2euaglpr2c', '192.168.0.121', 1555926598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363536303b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393135383138223b6c6f67696e546f6b656e7c733a33323a223138366563626134303736313461353939383631613134333833376134323630223b73616d616a5f69647c4e3b),
('lec3ive6p084ks8qorcl35l7s5pkj871', '192.168.0.109', 1555766197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363139373b),
('lf0bbltsl2hvijtq3o0c0l4n74vj0166', '192.168.0.101', 1555765539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353533393b),
('lf1686kabrjt16h9bsmoqeg48el70r4v', '192.168.0.101', 1555766322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363332323b),
('lh8vc564jvt82pophs370jrj621eocbh', '192.168.0.110', 1555921184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313138343b),
('lhiud4dc1a4iefokav7rg6h70ulbsn7e', '192.168.0.110', 1555926687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363638373b),
('ljbvi7tefagb1lsbe7pv9952rsdc50kl', '192.168.0.111', 1555911362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313336313b),
('ljteeba51ei2nb71vod7pmk68v4j9jp1', '192.168.0.119', 1555769646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393634363b),
('ll0vt3o9cpj0c0m40i1slhqu94u6bm84', '192.168.0.101', 1555766133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133333b),
('ln7c8l369jo0pgov58euc47atcctflva', '192.168.0.119', 1555765493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353439323b),
('lnji0eqpmie234ooatvrdi8r94sbknih', '192.168.0.119', 1555770316, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303331363b),
('lnnr16mrdnin8n08dknc8qnohv1rmf4k', '192.168.0.111', 1555911362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313336313b),
('lo2qivgemdo7tblevmiau7fdod5gt1dn', '192.168.0.101', 1555766192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363139323b),
('lo3jvpub3pd74tk795t3tp9t4keksn3h', '192.168.0.111', 1555910837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303833373b),
('lormifm4n6e21ckhaqr3l6ukvc5cldep', '192.168.0.101', 1555766310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363331303b),
('lr7kn38n307tp2ae4l9kf5s0ndmjsh0f', '192.168.0.101', 1555766121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363132313b),
('lrgoa9c73a0qpe0rsb6cr0h07hafv2ok', '192.168.0.110', 1555914111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343131313b),
('ls4ekdl04st68mb436gnmf4vh3ld6554', '192.168.0.111', 1555910355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303335353b),
('lvnu4r26o6q6d0a66cne80k05mrq7nan', '192.168.0.110', 1555912257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323235373b),
('m2rho23squ943ej4k5gpoljv8lcj3t10', '192.168.0.110', 1555909387, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353930393338373b),
('m399djojfgbdo2nj7kfpvdcik8q6jcqc', '192.168.0.101', 1555765461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353436303b),
('m39hi2k2gul3g8pgqrv8hhc341q86l8n', '192.168.0.101', 1555765904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353930333b),
('m5tbvcjopgm397s5fr9asu63u083lgiv', '192.168.0.110', 1555912261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323236313b),
('m7k1orlkn5nu9i4v9glkov70vqnourt0', '192.168.0.110', 1555915923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353932333b),
('m85ddqe6qamt52lm9mqvtb7qp4sf169t', '192.168.0.101', 1555766204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230333b),
('m8iblsc9d525takf3g0e7mkq1q7tpsdh', '192.168.0.111', 1555912085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323038353b),
('m9ariva1rb3eb0sau40p93mgoi7d8ppp', '192.168.0.111', 1555910666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636363b),
('mamsai24jcj1kiud9hu5of9u4rb7gmdk', '192.168.0.109', 1555765753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353735333b),
('mats31l3qsrkbi7327k4mnf7n2lbqa2l', '192.168.0.110', 1555926016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363031363b),
('mb7ri5trqor7flerj2smukkv9731o1nf', '192.168.0.110', 1555911736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313733353b),
('mblbd1o0ev61mb2m2bk0hrmbtniofaod', '192.168.0.110', 1555914211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343231313b),
('mej3n69kj9qqh6sh67k9s32loj7t3q48', '192.168.0.101', 1555765513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353531323b),
('mfjg4f92cimgvffreb0m51fchj0i86fv', '192.168.0.110', 1555911818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313831383b),
('mg16q1gqol01gps8t9ulnev4vkikt268', '192.168.0.101', 1555766158, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363135383b),
('mg5iae22kgi96bork9n6npejuk315j8g', '192.168.0.110', 1555920542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303534323b),
('mh37bldcvloj01dcrh7j0a7ddqb96krl', '192.168.0.101', 1555765513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353531323b),
('mhrci0f4mo4cjsqrg8qtva3ud2pccqkh', '192.168.0.101', 1555766347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334363b),
('miqc4sl6jqj8qh3v98t1oktsrettgoca', '192.168.0.110', 1555926022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363032313b),
('mjvhmokeeegovd9pg70prr59tkuduar2', '192.168.0.119', 1555771033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313033333b),
('mkp1cpe19tcu067tutn9c4im4pqrhiaf', '192.168.0.101', 1555766246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363234363b),
('mlr54m11ooo8e75kl93s4d8dsmhh8en8', '192.168.0.111', 1555910369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336393b),
('mqgibrvquilng4gdor401e0jqcfqlqsm', '192.168.0.110', 1555911282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313238323b),
('mrnl1hsfsappj7r8jff585e6uoeamfu2', '192.168.0.119', 1555767595, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373539343b),
('msv51hshdkrm14k3mdmmi1lrmenbiek3', '192.168.0.119', 1555766011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363031303b),
('n0o4ucm1cnkg7u4knj53mbsng58ln9o7', '192.168.0.110', 1555768300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383330303b),
('n16ffsdg411ravdtm2ftpvet1jdefujl', '192.168.0.101', 1555765590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353539303b),
('n1jlregb2fs3ci8l51llvmk4hbt2hhds', '192.168.0.110', 1555911737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313733373b),
('n1nb32hf5o8ppc6t4v9dbtlli4314nl3', '192.168.0.110', 1555768296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383239363b),
('n5p1lo5n3fkampruaujsjocqgnbif71e', '192.168.0.101', 1555766441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363434313b),
('n7anf53sda6uhsui3ear5nli34vhpcn2', '192.168.0.110', 1555916860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363836303b),
('n7r3r5gdqnrtd9od9u2a9keora6eurkb', '192.168.0.110', 1555914235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343233353b),
('n7riiuv84o05jk8u2l7sh1hsftmemdum', '192.168.0.119', 1555767595, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373539353b),
('nam2q89vuqtg9b8au47l8rshp2qo8u7o', '192.168.0.119', 1555771044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313034343b),
('nb0ktjhimrffr12m14isvslooh9el0u5', '192.168.0.109', 1555765921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353932313b),
('nefrmd6ok7fo137td6dhp6ef8t6fhn04', '192.168.0.119', 1555766916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363931363b),
('nfhqu0qd62bp886d60l25o890a08ka41', '192.168.0.119', 1555767657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373635373b),
('ngj7d7fc603btkjbgtcrvmjv74qherco', '192.168.0.119', 1555766944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363934343b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('nhf9ff05erk2li87t7buuqmaguosre4l', '192.168.0.119', 1555766951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363935313b),
('nhugfuh7a3sm195up4e4uj19icvlv8od', '192.168.0.119', 1555765519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353531393b),
('njo9cna6kgine85mns0ka758pc5psi74', '192.168.0.111', 1555916110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363131303b),
('nkggbgj15amuasldruegb5n3hvid78gq', '192.168.0.109', 1555768022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383032313b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535373431303437223b6c6f67696e546f6b656e7c733a33323a226561303963393535353266346534656432613064646339373533333436306261223b73616d616a5f69647c4e3b),
('nna73cufi3jloncapffoegp8npeiutob', '192.168.0.119', 1555767161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373136303b),
('nngm5u408ddkg04j9plqjsknvflrhcbg', '192.168.0.119', 1555770557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303535373b),
('nom07qbhrv7olq3mu99kjgma63uam941', '192.168.0.111', 1555910667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636373b),
('np4fdaj26egv9jkf7snpjm60ioq9qubj', '192.168.0.110', 1555919381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393338303b),
('nr6gii3nc675d63ednmf5qgraireanev', '192.168.0.119', 1555767597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373539373b),
('ns8q9c0oqnl2ng3k18cllnde2ogf895g', '192.168.0.101', 1555766345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334353b),
('nsgmril5hei147marrhi2asl6osfi0ut', '192.168.0.101', 1555766200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230303b),
('nsn98oq35l7stpc13runoph1fledo3v6', '192.168.0.110', 1555921183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313138333b),
('nt4gnte11pee6d5lv21u55p3il6rmhlc', '192.168.0.101', 1555766092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363039323b),
('nu57mdbc2201i4ipm7dcc39dp1il4cut', '192.168.0.119', 1555770493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303439333b),
('nv0auo3cjh4s61540nuusr83get752oo', '192.168.0.110', 1555926032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363033313b),
('o3k0eqbdsshb3n875gp16uql23govvpr', '192.168.0.109', 1555768021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383032313b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535373431303437223b6c6f67696e546f6b656e7c733a33323a226561303963393535353266346534656432613064646339373533333436306261223b73616d616a5f69647c4e3b),
('o4b2od2m2jr8u26v7vgfkf3pkohrcd5g', '192.168.0.110', 1555911374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313337343b),
('o6l7s45lbqlf8ahs5qdge4a09tr4kgkn', '192.168.0.110', 1555768392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383339313b),
('o72f4jdu67gbtlk1hk81nk2etp5l2oab', '192.168.0.111', 1555910364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336343b),
('o7i33i1vi3gkaarlt1m38tjhngop3onc', '192.168.0.110', 1555914351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343335313b),
('o80mgl8cd3euifm73324e7ntrfrk2ffs', '192.168.0.119', 1555766768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363736383b),
('o8am9v8hpucvm0inbtn1qct91kr6f9qv', '192.168.0.119', 1555764225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736343232343b),
('o8c2nuqhnn6n9trg940dsnb1aeuslllr', '192.168.0.111', 1555910655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635353b),
('o96qi838oh227gbnue8aie99o43soroc', '192.168.0.119', 1555765295, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353239353b),
('oaio0bsgc5i18vu0o1aei6s6djm8hhop', '192.168.0.119', 1555769351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393335303b),
('ocjt6k59dan18f2jf9fhjvm77iptf364', '192.168.0.110', 1555909380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353930393337393b),
('ockndr1efcbd9isp5po51861v3oah4ov', '192.168.0.111', 1555910455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303435353b),
('od8m7mqm9m7eqlgja0e5jo30459u7mh6', '192.168.0.111', 1555911016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031363b),
('oesqvqb682os761g8vagg6m2u1mkjekp', '192.168.0.130', 1555768825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383832343b),
('ogasuf9hrdcsfu2ke4fquhojo8ckfrns', '192.168.0.101', 1555766439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363433393b),
('oh3pgfevgtqtkac346ap70prpciceh19', '192.168.0.110', 1555768132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383133323b),
('oikr01c3gjlvhsbrodvbjceiaq8guhvp', '192.168.0.119', 1555766890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363838393b),
('oilvgkbg5623cn7vs5t3omofp6mhsf5a', '192.168.0.119', 1555771045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313034353b),
('ok5vamch41h6ob2ohao6bmau974gf5i6', '192.168.0.119', 1555770363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303336323b),
('ol2k0gmriglos5bmpnkcqp8do9lmeejm', '192.168.0.109', 1555766442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363434323b),
('omihiij4p0kn9mtms1m6ajvctt0140ka', '192.168.0.110', 1555925579, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353537393b),
('oogpd4hbcnbe16uu3hkvas057n5kta0t', '192.168.0.110', 1555913687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333638363b),
('ook7aaoij5ttbgl1oeu2qjpjn5uf8sbi', '192.168.0.101', 1555766182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363138323b),
('opoaqn6btjqpmp0d6u2r1v1s1ucl8nj0', '192.168.0.110', 1555913777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333737363b),
('oqhskfhlksfsk5c0sg2p8sd7qlhig5mb', '192.168.0.110', 1555768487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383438373b),
('ouka90f0dmkps4sumfpkt2cl9bnekt35', '192.168.0.110', 1555921190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932313138393b),
('ovcqmlh52dmskt2jdni7gbt8f8cqltro', '192.168.0.119', 1555766681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363638303b),
('p02dainchptbcsobluvb3n6qit30t5rf', '192.168.0.110', 1555919416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393431363b),
('p1tcskpk0l6h7upms36hd0ufrduouhdn', '192.168.0.110', 1555919117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393131363b),
('p2s032aqfhf9qt0f61hrbfdc3buh78dv', '192.168.0.110', 1555911819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313831393b),
('p4irpcdab5e62fdi1cbpm382c7jc21kj', '192.168.0.119', 1555770307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303330373b),
('p64t5s24jgcobm559q718j5ui502htng', '192.168.0.110', 1555926127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363132363b),
('p6mtj9sl6jna0ho3109ovqpf9v2o6d9d', '192.168.0.110', 1555768377, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383337373b),
('p6rorfm0lgdsg570208495sn0im00orm', '192.168.0.110', 1555768843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383834333b),
('p6v73ejuqar2pdk0efv5698ks2efbeuk', '192.168.0.119', 1555767587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373538373b),
('p750c19l9dcs0p5i4m4bnhr5ucq947un', '192.168.0.101', 1555766404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363430343b),
('p75ud5ecslbaan2smq8k3pj9cf5rjko2', '192.168.0.111', 1555910660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636303b),
('pa3ol9o28e4kvhg0qckbs1luhgv8275r', '192.168.0.110', 1555919608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393630373b),
('pae42k5uoe2fd4k8j1eflhk8cotsucki', '192.168.0.110', 1555919395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393339353b),
('panh32r8ss0h8qdb8n77vjrqhbf5eubv', '192.168.0.130', 1555768802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383830323b),
('pc6u39cer5im6gv2adm0152ha7d4674q', '192.168.0.110', 1555914237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343233373b),
('pcc5udg5ruf9oo7r2rokj1ml10vibpel', '192.168.0.119', 1555770449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303434393b),
('pdq354v40vu1ovm0ghp46aomc5us0alg', '192.168.0.119', 1555766909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363930383b),
('pe1s6651n20vo2tgke4103gcp1cb1jl2', '192.168.0.111', 1555910360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336303b),
('pe2t66csdfsgun1ieope20e637agndqg', '192.168.0.110', 1555926004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363030343b),
('pf6dnf7igdp498j47747upro8qe4ams5', '192.168.0.101', 1555766479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363437393b),
('pgu9n7t1qf2kumebjvmm2tt50gg679er', '192.168.0.110', 1555920692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303639323b),
('ph32foinoal89kufv6oqpvuqtg2g32r1', '192.168.0.110', 1555919890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393839303b),
('pha86bbjgd8de70vb3i6c67dvn3nph5d', '192.168.0.101', 1555766297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363239363b),
('phd152hqcsdm3n2mkmve4ml0i53fhhsi', '192.168.0.119', 1555770507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303530373b),
('pikn3gldbijk9tp36hh4mit821r8baqj', '192.168.0.101', 1555765901, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353930303b),
('pkj2kbdi0rlva4toh8n7nr91f6cesm8c', '192.168.0.101', 1555766484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363438343b),
('plq5d9utrp5t8gq7ggk99senhoh2n7a2', '192.168.0.101', 1555766131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133313b),
('pn93u43a2bsui5m13d91jfvk5ipct8m0', '192.168.0.110', 1555913792, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333739323b),
('polce02ddidflst80qch70vdb0bu57bk', '192.168.0.110', 1555917074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931373037343b),
('pq3t9d7ge3u5asamv60fvthnqq85cu9r', '192.168.0.111', 1555910647, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303634373b),
('pssim9j3tu4np0hbou7gn2lti0199ljb', '192.168.0.110', 1555914245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343234353b),
('ptfu635td6jmf8ueroik1tve92dftriq', '192.168.0.119', 1555771028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313032383b),
('pvuhcp3mjrs2su1bj9u70kur3a7a603k', '192.168.0.101', 1555766231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363233303b),
('q0jli1r4h0mf492654pms28s4vueied3', '192.168.0.109', 1555765580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353538303b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535373431303437223b6c6f67696e546f6b656e7c733a33323a226561303963393535353266346534656432613064646339373533333436306261223b73616d616a5f69647c4e3b),
('q0tht9mcm7perhct51gedukl8mkan81f', '192.168.0.110', 1555912252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323235323b),
('q173kvfc0ac4blau3ifujasnjhbuskkq', '192.168.0.119', 1555769346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393334363b),
('q1lbprsdt9accdr8g94qrkpccunf93fb', '192.168.0.110', 1555925711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353731313b),
('q2ds445p4jljtt8abv70kaji6tc01e8i', '192.168.0.110', 1555916831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363833303b),
('q3fgmgoum0rchmoq3i7lfv8bnn59sg9g', '192.168.0.110', 1555913793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333739333b),
('q3jc2ets7p5cvoli8trtt6lhbce0sj42', '192.168.0.121', 1555915608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931353630383b6964656e746974797c733a32303a2273616d616a40646967697461747476612e636f6d223b656d61696c7c733a32303a2273616d616a40646967697461747476612e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535373538333838223b6c6f67696e546f6b656e7c733a33323a223332323161333161373861626233643764303333623564386134343834653833223b73616d616a5f69647c4e3b),
('q3qsr28i9fp5ja9pgcracud35r8dt02p', '192.168.0.110', 1555913678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333637383b),
('q4rhvolj4in1jf6o1hc78tl05ln2sgv4', '192.168.0.110', 1555914086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343038363b),
('q5ac9kg09stfr19l22g469snatd4adng', '192.168.0.119', 1555766011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363031303b),
('q5oofsrpv2el0p72oro3p0ao5vdbafcq', '192.168.0.119', 1555769651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393635313b),
('q61pd85vo3jldnkagt26mcrqj3978h9k', '192.168.0.110', 1555919120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393131393b),
('q62bqrveomblge4okgsoc34mj8co9fb6', '192.168.0.119', 1555766905, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363930353b),
('q8bgs16skqtq2l924tcvkud8un5eovfu', '192.168.0.119', 1555764248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736343234383b),
('q8gcv75l8hhu3go9ub5goh3c49bgcie3', '192.168.0.119', 1555765993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353939323b),
('q9lgo35jka73105l1vrv5a26oardrjak', '192.168.0.119', 1555769108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393130383b),
('qe6p5jkn9s3tfebn43a46v04mubeai2f', '192.168.0.110', 1555914352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343335323b),
('qedpgel6n4qafu83l3u86gvojc79135t', '192.168.0.119', 1555770410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303431303b),
('qel5sa2o6d27477frdktuvu9gslauc67', '192.168.0.101', 1555766310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363331303b),
('qgf9bj50omb0jtl6dkqf9s5itnu9q5v6', '192.168.0.110', 1555910719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303731393b),
('qgfm14nhqj5i5rd8cb5g8hm21t6jbjtk', '192.168.0.111', 1555910658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303635383b),
('qh18h2esegcl3t97n1c74jjqtm35cllp', '192.168.0.110', 1555914394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343339343b),
('qieeej05uarqd5ud9r3q5ik9eh339fie', '192.168.0.101', 1555765504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353530343b),
('qjtocmltvroetiobppoldr9alrtk83uk', '192.168.0.111', 1555910366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336363b),
('qkioav705tob9h4pbqgfs3frf4s65ind', '192.168.0.110', 1555768257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383235373b),
('qkn2d7loa43ol88hcn4q1qr6dih0pp05', '192.168.0.119', 1555769436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393433353b),
('ql8ggfp8ugebdfggnfmj4rrf5seuf50u', '192.168.0.101', 1555766445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363434353b),
('qlssec1g0de1ida8ljvusf91g4ivu2qg', '192.168.0.110', 1555914228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343232383b),
('qmijb125tqk6d8dropq6sqcsmjlpdm45', '192.168.0.119', 1555767602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373630323b),
('qmnfern91u1nbgr5ohhj8tf958a9alc4', '192.168.0.119', 1555771106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313130363b),
('qmqcl9hppok42k67qgeb4lh2g5g052jg', '192.168.0.110', 1555914440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343434303b),
('qmtr78dj079ebrg6af0hkiinf3cnqcfd', '192.168.0.119', 1555769438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393433373b),
('qnb7hkil3bh1e90vpav3ltsvtajmv19e', '192.168.0.110', 1555914433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343433333b),
('qnkoi5bo3gqtnru6rqu5llagq7cgedfh', '192.168.0.101', 1555766156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363135363b),
('qo697fqdbsig64cfqju7909hfqi07cod', '192.168.0.111', 1555910646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303634363b),
('qovv1s0ssmdkjmn32l1ju8tbq7p0k3hd', '192.168.0.109', 1555765605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353630353b),
('qpdivhl3nsijt7slvfa4d5586dpe3nre', '192.168.0.110', 1555911791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313739313b),
('qprb5hkhshlj0rnt1ap4eeoqabl835i6', '192.168.0.119', 1555765520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353531393b),
('qqnavdhg89hat5eufmmm2gl84t3c8m1j', '192.168.0.120', 1555912066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323034333b),
('qrfbarneihdusl8fmcbla5s6s16i9pkt', '192.168.0.119', 1555770361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303336313b),
('qt2nrl6ca4614gb07ja94187e1ou9beq', '192.168.0.110', 1555926197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363139363b),
('qt7hq23uq86j44nujqv88379v232v541', '192.168.0.119', 1555766016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363031363b),
('quhobbci8e76cd8umipc2m9tivtr3ljp', '192.168.0.110', 1555917202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931373230323b),
('qv0k1o48luc3hdlnd6336636ejlaj66q', '192.168.0.110', 1555768224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383232343b),
('r0hdhh5s4sv235c0ogujls0bl18c4884', '192.168.0.110', 1555912550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323535303b),
('r16uribbk9koogpbrs4amta3hv8v0cq1', '192.168.0.110', 1555926116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363131363b),
('r22hhkb6p9k5od5r155i7g7fg48j03d7', '192.168.0.111', 1555916112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363131323b),
('r3boudti3ojef8e2o2b5toke9c2di2ma', '192.168.0.110', 1555926555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363535353b),
('r3r9tfjbnoff6ecaaip2kdvgrb7irdhm', '192.168.0.101', 1555765904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353930333b),
('r5hvrh2jqkg2o442orsdv5hmq478ckq7', '192.168.0.111', 1555910354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303335343b),
('r5m0898l07bcrjv6jcav2h31f4na0pcs', '192.168.0.111', 1555910403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303430333b),
('r8adpl9re76i0encaen44nog4dh227s8', '192.168.0.111', 1555910406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303430363b),
('r8ba1vtqp80q829jnlh23808fd5jtpu4', '192.168.0.110', 1555911735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313733353b),
('r8u6d5bfd3mog8kn8jgkp01c8vncjtak', '192.168.0.110', 1555914229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343232393b),
('rcvdk0d9lucsv7tsga2g9ti178hpiok0', '192.168.0.110', 1555914222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343232313b),
('rd8avapl1seqfmar9ino2ds1f273pnqm', '192.168.0.111', 1555910433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303433323b),
('rdmdufpnt98encfi4vhd8rs9p4hti3nf', '192.168.0.110', 1555913747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333734363b),
('reo563lokbfpl9h1m3rc09vfj6pn1fnm', '192.168.0.111', 1555911011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313031313b),
('rfdcclvpkovkc08dg5ks6p2h1dueaa73', '192.168.0.110', 1555926191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363139313b),
('rfon8qo7iih5ei8v9rgo702muj95aunv', '192.168.0.111', 1555910876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303837353b),
('rg86a1bpp4gehmqm3tfc0l7aag0tgt29', '192.168.0.119', 1555770320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303332303b),
('rge6a7k9n92qn6q2ikcepo22gro95k49', '192.168.0.110', 1555768230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383233303b),
('rh08dm0ump9m9d7dvgdd2rgg09tih04c', '192.168.0.119', 1555767591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373539313b),
('ri25c11r9k95acdh3diqe6b87sov7m03', '192.168.0.101', 1555766095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363039353b),
('rjrcjk33q9vss7bdmtaunmj4oc9upvvg', '192.168.0.110', 1555768057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383035373b),
('rknlr5srfnn768vrc6ej6edjoi2sn1ej', '192.168.0.125', 1555914774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343737333b),
('rl2fvhok2me3usofnsp5bfiiiom46m2q', '192.168.0.110', 1555912284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323238333b),
('rlt41q1517id8ir0puhdr1eo6smb8hm0', '192.168.0.119', 1555769490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736393439303b),
('rn2v3hnksmdth459p7ffrerea6pu7773', '192.168.0.110', 1555926195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363139353b),
('rovp7t44uhj94hrpt20jk86ms3nc06u8', '192.168.0.119', 1555767395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373339353b),
('rpj3pvj9r53agjvi116vb1eommd8nc88', '192.168.0.101', 1555766102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363130323b),
('rr3jjae72qa1rsb370i5iqqugen1cr6p', '192.168.0.110', 1555768041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383034303b),
('rrac3pimd57jtts6auc7tm1371kmdnh4', '192.168.0.119', 1555766942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363934323b),
('rt2h282nqhtshi97aa7kt58i8965b62g', '192.168.0.101', 1555766102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363130323b),
('ru6g08lpa7ohn0ata1vlrhe9tsu66g4u', '192.168.0.101', 1555766224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363232343b),
('ru8ou2tflrd03nfattt1o4ti0epbor0d', '192.168.0.110', 1555919650, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393635303b),
('rv8efijgevufe6ejf01fohf9d3pghf1e', '192.168.0.101', 1555766345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334353b),
('s0sor80aqruoagrrhev59rascef6dtrm', '192.168.0.119', 1555767182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373138323b),
('s1eg51dupg7u5qmmkq2pgp64hlscofol', '192.168.0.110', 1555919409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393430393b),
('s1qvqj3d9qcni470i0vhbb1cafmhjb70', '192.168.0.110', 1555768258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383235383b),
('s4ei53p3k9bn362u6smt4hpauk009qnh', '192.168.0.110', 1555912529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323532393b),
('s4hcjul837qrp5fae0m2veokamvc4eju', '192.168.0.110', 1555920685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303638353b),
('s4s5olett99kbb8ug0iag5cct4mjbrtb', '192.168.0.110', 1555912533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323533333b),
('s5rn1tl220t6gu181ldk6rul1s33fue2', '192.168.0.110', 1555918420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383432303b),
('s66id1a61gfh7pkfhaoltp56pb2tsg3r', '192.168.0.101', 1555766131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133313b),
('s6bla30it6bmtvrjhr7uiomo2quf4cs4', '192.168.0.101', 1555766352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363335323b),
('s6s963ffenfcm44sqhb27qs65aifklu9', '192.168.0.110', 1555916893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363839333b),
('s9eit64f2tsis4l4ji6u0tj8vkkr1kma', '192.168.0.119', 1555767603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373630333b),
('sbb7hgn73h4d6p8offiomgjdsv1o2mle', '192.168.0.111', 1555916111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363131313b),
('sbh3bn0n96a1sc2u8olooguo2jvj7g0q', '192.168.0.101', 1555765539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353533393b),
('scd1ckgbhqogilmng6lnqd14v1t66da4', '192.168.0.119', 1555771686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313638363b),
('sd4kja4mufk87c3nq0k7j47bit5qabjc', '192.168.0.110', 1555911677, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313637373b),
('set7e0a8b6tdohkmjgnsl0qn3ug0qvim', '192.168.0.110', 1555913599, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333539393b),
('sgahvfadclu2lu1ck3uma6pe0td43av1', '192.168.0.119', 1555770491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303439303b),
('sh379topkln7vd44mtacl9upd78kb5e4', '192.168.0.101', 1555766230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363233303b),
('sh3mtt9776s55g9t4afqai3319jjf809', '192.168.0.110', 1555911799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313739393b),
('sh3pj14uq8r7fbc9302i7g749hm44cpc', '192.168.0.109', 1555766578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363537383b),
('shq021abfoefcccdbbb91v319t0nj9f6', '192.168.0.110', 1555926632, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363633323b),
('skgs4oikkhnbtebafjv3et256upr2ltq', '192.168.0.110', 1555918391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383339313b),
('so60bg72jbec68fjm0n4rdjmcdjbapu0', '192.168.0.101', 1555766342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363334323b),
('spd9lu1qfu7qgqd2m96llof08ii3317i', '192.168.0.110', 1555920815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303831343b),
('sr419g7vnth5sm4b75n8l8lt5p5adq6l', '192.168.0.110', 1555768550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383535303b),
('ss0jr837oup62p1g6u63ce674gk3c4mi', '192.168.0.110', 1555926119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363131383b),
('ssdcbeb3mqj7c3po76fdjt8sn2poon2n', '192.168.0.110', 1555912293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323239333b),
('stfhd50oum3elgaftk3rrplrh64oijde', '192.168.0.101', 1555766183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363138333b),
('su2r3nov1rp3ru3keq4n8iojvjdair93', '192.168.0.110', 1555768302, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383330323b),
('su4hljlq79nhecm8h3dfvtc2b9e3ed12', '192.168.0.119', 1555770309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303330393b),
('t065oc7m762f6qlojunroe9gf520qiu1', '192.168.0.101', 1555766207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363230373b),
('t1p9m5eea3eiogcm1ghrc70v8pe1mrri', '192.168.0.110', 1555914127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343132373b),
('t4ce4dcupmg96rranqoh6lc5ric91i9j', '192.168.0.111', 1555910661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303636313b),
('t4cvu3o1ojvhve72196g1shesjhn98v0', '192.168.0.110', 1555768559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383535393b),
('t5ipgm030kdp9fkf6ndn4he38ju46g1q', '192.168.0.101', 1555766322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363332323b),
('t7efn50mtmo19p01rg8l1b3p79bh0gro', '192.168.0.111', 1555910428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303432373b),
('ta2j8hp4hvl2aufr7sd843e3ie9qh562', '192.168.0.110', 1555919402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393430313b),
('tagbfniok052qgdai2edga1334vsmopv', '192.168.0.110', 1555914149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343134393b),
('tbcvpk42l2f736rb52um8b9bqrnbs7op', '192.168.0.119', 1555767596, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373539363b),
('tcis2q9r5qeorh2m54hcskpfk4lj2vf8', '192.168.0.111', 1555910369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303336393b),
('tdj0lelcufn33roqe20st4nd90k3q13k', '192.168.0.101', 1555766470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363437303b),
('tdna7vsqcdq4gqju5lmsn5tm911fph2g', '192.168.0.101', 1555766322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363332323b),
('te58tst0lubs9i2c0ujqisv0g8gtgg2c', '192.168.0.119', 1555767586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373538363b),
('teecssja4fsvdbksgboqvlb0uep4mt9k', '192.168.0.110', 1555920711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303731313b),
('teoq5e3pnl1oiuai3lriqbqhqetc069p', '192.168.0.119', 1555766004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363030343b),
('tf0ocur7dqt6k76d8b77jatgk9apbm5b', '192.168.0.110', 1555914437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343433373b),
('tgrrli0attfkge73amsfc8vsu69pkeku', '192.168.0.110', 1555916030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363033303b),
('thc3briuouuoggh9alrp933b359tan0c', '192.168.0.110', 1555914333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343333333b),
('tjla9i7pif2bbd34gpcibvbc2pele5gn', '192.168.0.111', 1555910407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303430363b),
('tk5346s8ni4agrd767d5qut3q7q492bq', '192.168.0.110', 1555912265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323236353b),
('tkju5vq2i8cmqj3p1j5pb9rh84g44ge6', '192.168.0.111', 1555911359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313335393b),
('tmf7k01renaojq6s9h35li5mah4g8tmu', '192.168.0.119', 1555766973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363937333b),
('tpe3dkggdohs728qfkibe24ma8b42jsr', '192.168.0.110', 1555926561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363536303b),
('tq2a4ss7jk38ndfcfep7t60oj3mpljgi', '192.168.0.110', 1555925944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353934343b),
('tq3df3s3qmmi2pq7u8oojdao6vplbfui', '192.168.0.110', 1555925671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353637313b),
('tqjemt1nehdneief4cntf5m9fi3iipla', '192.168.0.111', 1555911372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313337323b),
('trrcsmce3lafp3po19qh68cchkr63g36', '192.168.0.111', 1555912149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323134393b),
('tt9n7k5g75mshrv3sa89ctf4m4b8amid', '192.168.0.119', 1555771096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737313039363b),
('ttkmibsghoi7rr7ev54jtg9hgerc3s0a', '192.168.0.119', 1555770368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353737303336383b),
('u07g3h4a56jac8v3op7nbrbmo105l9rk', '192.168.0.119', 1555766715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363731353b),
('u3gq400s3vbkt4fcdi1i7d0p894dtuq1', '192.168.0.119', 1555767658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373635383b),
('u3mimo26f6efeatdhjs15i9a7sic0evn', '192.168.0.110', 1555916956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363935363b),
('u4jaforl26vc08utahjcd1mntls5srr2', '192.168.0.110', 1555913578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333537383b),
('u50iulav11ds0a8quod8a7qh4ugj13et', '192.168.0.110', 1555768551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383535313b),
('u5ebpmo2oertp76270siv7m1d1id9553', '192.168.0.110', 1555926087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363038373b),
('u5l3pj3p0rp7hokbli6ovlrojnvf2cso', '192.168.0.110', 1555913777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333737363b),
('u6o5arv4u7sgp3s9d9v9vr2tm6aj1tej', '192.168.0.111', 1555911033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313033333b),
('u9f051cnbcaf14burctlhebc7sc9olb0', '192.168.0.111', 1555916009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363030383b),
('ue5l0ht7bhm4s3n6pq8jgds6bf366oku', '192.168.0.110', 1555917164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931373136343b),
('uee0kmg774g2poi2bqpsu00figar9e1q', '192.168.0.101', 1555765549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353534393b),
('uflcf4278gvidespk52jutn979g229rp', '192.168.0.110', 1555911676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313637363b),
('ufvk7qks39g1shfgejnluintunkmo905', '192.168.0.111', 1555910406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303430353b),
('uh1112k9q69s5mjnmspcef3iq5tigj3u', '192.168.0.101', 1555766314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363331343b),
('ui7g3abmlfqva5dpfu0g16u5ssri2np8', '192.168.0.119', 1555767015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373031353b),
('uiaefs3ecli55m9t4l1n0aj2gm8ndmq4', '192.168.0.110', 1555912261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323236313b),
('uijtglbgialvbaho3psobp506fclmd61', '192.168.0.110', 1555912542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931323534323b),
('uju5ufmpvrogid6mkl7nhpsrrqstmcdp', '192.168.0.110', 1555914114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343131343b),
('ukbm0lpg0as4ap8uu5nckd239v8ih8mb', '192.168.0.110', 1555925744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353734343b),
('ukvcmml0hgvmrudccbdffs4ajdhoe4js', '192.168.0.110', 1555768545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383534343b),
('ulidkq2g7gdfvcqbb0t73f5nn0c1os3k', '192.168.0.110', 1555911812, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313831323b),
('uohendbqu59t16pqcbpa98rqk4pescs8', '192.168.0.110', 1555913761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931333736313b),
('urp43beq1jsg07opo1ghrfdtnvmo014d', '192.168.0.110', 1555914385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343338353b),
('usfpm11695sqvm0lcepshldlulou7egu', '192.168.0.110', 1555911829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313832393b),
('usmbua4oda3nptg0ccs1qhlcfhom3ctk', '192.168.0.119', 1555766753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363735333b),
('utdue18s1qihtv4pcjpkoqnq9g3rsdvt', '192.168.0.119', 1555767182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736373138323b),
('uu4j5oc1u0ftgutbgbgi5410ibco47m8', '192.168.0.111', 1555910453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303435333b),
('uu5fj9p67knge671b1gg4n6oi0lb9h9h', '192.168.0.101', 1555766133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363133333b),
('uu8iliacpglrugi31v05q4ih8hp2dcti', '192.168.0.119', 1555766993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363939333b),
('uui99g7s4pu79g5sq1cqv2ba3p2m6ipj', '192.168.0.101', 1555766257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363235373b),
('uuq0kuogundrlvoa8n9l6pr5rc1258ed', '192.168.0.110', 1555914124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343132333b),
('uv5vs2sslg9u51b6il00uoav7akfqacr', '192.168.0.110', 1555914476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343437363b),
('v2dfrmdra3arb2v9s1ont2r6m87e16uu', '192.168.0.130', 1555768304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383330343b),
('v32r41odhvvvescj7j3rs9do8j5le0qe', '192.168.0.101', 1555766225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363232353b),
('v363omtnpnvp38no1irrg6hbdbjeogoe', '192.168.0.111', 1555910884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303838343b),
('v47bve8mh16silg4806vhu99o219qcj3', '192.168.0.110', 1555919410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393431303b),
('v5nlkgve0qb19ugl4i63s0ns68eil4gf', '192.168.0.101', 1555765501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353530313b),
('v5uplfri5n9l6elggmrkip3i5g0eaupk', '192.168.0.110', 1555911728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313732383b),
('v6ca94g8l76cnlmg26g3h2r2td1o4ec4', '192.168.0.111', 1555911335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313333353b),
('v6idjadlr3i5ti82gmln5d9kmjhorf9g', '192.168.0.110', 1555925672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353637323b),
('v7u4andum3tahkrt3b2pi2beorqr1hve', '192.168.0.119', 1555766751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363735313b),
('v8a3v00frlt1cugjn8pa5mf27efjble0', '192.168.0.110', 1555919688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393638383b),
('v91oo2ioif7nrnrg7dpoejsvb7qqol6m', '192.168.0.110', 1555916524, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363532343b),
('v9hptdj9b65g9445hev347umvd5p85gr', '192.168.0.110', 1555926117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932363131373b),
('vb0v41cprd3ugohokta0n82i49m9m732', '192.168.0.111', 1555910594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303539343b),
('vbeq9puiu4aekcjn3h5vb9j0ba038uiv', '192.168.0.110', 1555919805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393830353b),
('vbo4g8m8e5jjvm7dnemjsjvl2t84fus6', '192.168.0.110', 1555911736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931313733353b),
('vdbs3jqpefo530g32r594k3nsl773d98', '192.168.0.101', 1555766446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363434363b),
('veqamdq15ops1fhpk02bv3uvoso6find', '192.168.0.119', 1555765493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736353439333b),
('vhs1n7iooqa7q0mfr0iq3di45sektp6u', '192.168.0.110', 1555919230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393233303b),
('vj4ma6vtkok0gmfm7r5e98rmju0jk64e', '192.168.0.110', 1555768364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736383336333b),
('vk9g4ravpbtpl3c4t5pqpeiuuaiqckb1', '192.168.0.110', 1555918187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931383138373b),
('vkaou4dv4vmool6bk85mv8m5d2ef3953', '192.168.0.111', 1555910172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303136393b),
('vksp7uuebqcsgqnecto5cdvjkorbhamd', '192.168.0.110', 1555920811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303831313b),
('vlan29llgeo0mm32rpchrqpm9u68u3c7', '192.168.0.110', 1555914392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931343339313b),
('vnedar72sf9124g2ftv2eeme51ocu76d', '192.168.0.111', 1555910439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303433383b),
('vp4opa81tum3ml27d5vrg9rpdb6avnh2', '192.168.0.110', 1555920657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932303635373b),
('vqj8fgblrtruu1gp7q111lhqtu5b9ec6', '192.168.0.101', 1555766427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353736363432363b),
('vsfihq8kkv4ot4khe19ufvg5fh1mejuk', '192.168.0.111', 1555916059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931363035393b),
('vsvb9ae3bltkvp08mcbp8k7i0h0q8j3d', '192.168.0.110', 1555925713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353932353731333b),
('vtial6057rlmfgb9notae1pggp0nkpbj', '192.168.0.111', 1555910410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931303431303b),
('vvopvj15dkrdb5f83fjoakfv236kj3qj', '192.168.0.110', 1555919654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353931393635343b);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_source`
--

CREATE TABLE `tbl_source` (
  `source_id` int(11) NOT NULL,
  `source_name` varchar(50) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `is_default` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_source`
--

INSERT INTO `tbl_source` (`source_id`, `source_name`, `sort_order`, `is_default`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'News Paper', 2, 0, 1, '2018-05-31 13:10:29', 1, '2018-08-01 15:52:04', 1),
(11, 'Email', 1, 0, 1, '2018-06-04 18:24:19', 1, '2018-08-01 15:51:52', 1),
(22, 'Direct', 3, 0, 1, '2018-08-01 15:52:20', 1, '2018-08-01 15:52:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`state_id`, `country_id`, `state_name`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(240, 1, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(241, 2, 'Balkh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(242, 2, 'Herat', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(243, 2, 'Kabol', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(244, 2, 'Qandahar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(245, 3, 'Benguela', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(246, 3, 'Huambo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(247, 3, 'Luanda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(248, 3, 'Namibe', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(249, 4, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(250, 5, 'Tirana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(251, 6, 'Andorra la Vella', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(252, 7, 'CuraÃ§ao', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(253, 8, 'Abu Dhabi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(254, 8, 'Ajman', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(255, 8, 'Dubai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(256, 8, 'Sharja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(257, 9, 'Buenos Aires', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(258, 9, 'Catamarca', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(259, 9, 'CÃ³rdoba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(260, 9, 'Chaco', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(261, 9, 'Chubut', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(262, 9, 'Corrientes', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(263, 9, 'Distrito Federal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(264, 9, 'Entre Rios', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(265, 9, 'Formosa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(266, 9, 'Jujuy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(267, 9, 'La Rioja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(268, 9, 'Mendoza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(269, 9, 'Misiones', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(270, 9, 'NeuquÃ©n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(271, 9, 'Salta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(272, 9, 'San Juan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(273, 9, 'San Luis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(274, 9, 'Santa FÃ©', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(275, 9, 'Santiago del Estero', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(276, 9, 'TucumÃ¡n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(277, 10, 'Lori', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(278, 10, 'Yerevan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(279, 10, 'Å irak', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(280, 11, 'Tutuila', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(281, 14, 'St John', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(282, 15, 'Capital Region', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(283, 15, 'New South Wales', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(284, 15, 'Queensland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(285, 15, 'South Australia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(286, 15, 'Tasmania', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(287, 15, 'Victoria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(288, 15, 'West Australia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(289, 16, 'KÃ¤rnten', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(290, 16, 'North Austria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(291, 16, 'Salzburg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(292, 16, 'Steiermark', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(293, 16, 'Tiroli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(294, 16, 'Wien', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(295, 17, 'Baki', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(296, 17, 'GÃ¤ncÃ¤', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(297, 17, 'MingÃ¤Ã§evir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(298, 17, 'Sumqayit', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(299, 18, 'Bujumbura', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(300, 19, 'Antwerpen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(301, 19, 'Bryssel', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(302, 19, 'East Flanderi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(303, 19, 'Hainaut', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(304, 19, 'LiÃ¨ge', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(305, 19, 'Namur', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(306, 19, 'West Flanderi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(307, 20, 'Atacora', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(308, 20, 'Atlantique', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(309, 20, 'Borgou', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(310, 20, 'OuÃ©mÃ©', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(311, 21, 'BoulkiemdÃ©', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(312, 21, 'Houet', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(313, 21, 'Kadiogo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(314, 22, 'Barisal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(315, 22, 'Chittagong', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(316, 22, 'Dhaka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(317, 22, 'Khulna', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(318, 22, 'Rajshahi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(319, 22, 'Sylhet', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(320, 23, 'Burgas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(321, 23, 'Grad Sofija', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(322, 23, 'Haskovo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(323, 23, 'Lovec', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(324, 23, 'Plovdiv', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(325, 23, 'Ruse', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(326, 23, 'Varna', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(327, 24, 'al-Manama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(328, 25, 'New Providence', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(329, 26, 'Federaatio', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(330, 26, 'Republika Srpska', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(331, 27, 'Brest', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(332, 27, 'Gomel', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(333, 27, 'Grodno', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(334, 27, 'Horad Minsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(335, 27, 'Minsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(336, 27, 'Mogiljov', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(337, 27, 'Vitebsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(338, 28, 'Belize City', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(339, 28, 'Cayo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(340, 29, 'Hamilton', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(341, 29, 'Saint GeorgeÂ´s', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(342, 30, 'Chuquisaca', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(343, 30, 'Cochabamba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(344, 30, 'La Paz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(345, 30, 'Oruro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(346, 30, 'PotosÃ­', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(347, 30, 'Santa Cruz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(348, 30, 'Tarija', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(349, 31, 'Acre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(350, 31, 'Alagoas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(351, 31, 'AmapÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(352, 31, 'Amazonas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(353, 31, 'Bahia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(354, 31, 'CearÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(355, 31, 'Distrito Federal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(356, 31, 'EspÃ­rito Santo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(357, 31, 'GoiÃ¡s', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(358, 31, 'MaranhÃ£o', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(359, 31, 'Mato Grosso', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(360, 31, 'Mato Grosso do Sul', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(361, 31, 'Minas Gerais', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(362, 31, 'ParaÃ­ba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(363, 31, 'ParanÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(364, 31, 'ParÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(365, 31, 'Pernambuco', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(366, 31, 'PiauÃ­', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(367, 31, 'Rio de Janeiro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(368, 31, 'Rio Grande do Norte', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(369, 31, 'Rio Grande do Sul', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(370, 31, 'RondÃ´nia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(371, 31, 'Roraima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(372, 31, 'Santa Catarina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(373, 31, 'SÃ£o Paulo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(374, 31, 'Sergipe', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(375, 31, 'Tocantins', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(376, 32, 'St Michael', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(377, 33, 'Brunei and Muara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(378, 34, 'Thimphu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(379, 36, 'Francistown', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(380, 36, 'Gaborone', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(381, 37, 'Bangui', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(382, 38, 'Alberta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(383, 38, 'British Colombia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(384, 38, 'Manitoba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(385, 38, 'Newfoundland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(386, 38, 'Nova Scotia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(387, 38, 'Ontario', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(388, 38, 'QuÃ©bec', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(389, 38, 'Saskatchewan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(390, 39, 'Home Island', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(391, 39, 'West Island', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(392, 40, 'Basel-Stadt', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(393, 40, 'Bern', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(394, 40, 'Geneve', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(395, 40, 'Vaud', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(396, 40, 'ZÃ¼rich', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(397, 41, 'Antofagasta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(398, 41, 'Atacama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(399, 41, 'BÃ­obÃ­o', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(400, 41, 'Coquimbo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(401, 41, 'La AraucanÃ­a', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(402, 41, 'Los Lagos', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(403, 41, 'Magallanes', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(404, 41, 'Maule', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(405, 41, 'OÂ´Higgins', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(406, 41, 'Santiago', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(407, 41, 'TarapacÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(408, 41, 'ValparaÃ­so', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(409, 42, 'Anhui', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(410, 42, 'Chongqing', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(411, 42, 'Fujian', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(412, 42, 'Gansu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(413, 42, 'Guangdong', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(414, 42, 'Guangxi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(415, 42, 'Guizhou', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(416, 42, 'Hainan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(417, 42, 'Hebei', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(418, 42, 'Heilongjiang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(419, 42, 'Henan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(420, 42, 'Hubei', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(421, 42, 'Hunan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(422, 42, 'Inner Mongolia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(423, 42, 'Jiangsu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(424, 42, 'Jiangxi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(425, 42, 'Jilin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(426, 42, 'Liaoning', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(427, 42, 'Ningxia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(428, 42, 'Peking', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(429, 42, 'Qinghai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(430, 42, 'Shaanxi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(431, 42, 'Shandong', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(432, 42, 'Shanghai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(433, 42, 'Shanxi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(434, 42, 'Sichuan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(435, 42, 'Tianjin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(436, 42, 'Tibet', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(437, 42, 'Xinxiang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(438, 42, 'Yunnan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(439, 42, 'Zhejiang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(440, 43, 'Abidjan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(441, 43, 'BouakÃ©', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(442, 43, 'Daloa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(443, 43, 'Korhogo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(444, 43, 'Yamoussoukro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(445, 44, 'Centre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(446, 44, 'ExtrÃªme-Nord', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(447, 44, 'Littoral', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(448, 44, 'Nord', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(449, 44, 'Nord-Ouest', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(450, 44, 'Ouest', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(451, 0, 'Bandundu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(452, 0, 'Bas-ZaÃ¯re', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(453, 0, 'East Kasai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(454, 0, 'Equateur', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(455, 0, 'Haute-ZaÃ¯re', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(456, 0, 'Kinshasa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(457, 0, 'North Kivu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(458, 0, 'Shaba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(459, 0, 'South Kivu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(460, 0, 'West Kasai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(461, 46, 'Brazzaville', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(462, 46, 'Kouilou', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(463, 47, 'Rarotonga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(464, 48, 'Antioquia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(465, 48, 'AtlÃ¡ntico', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(466, 48, 'BolÃ­var', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(467, 48, 'BoyacÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(468, 48, 'Caldas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(469, 48, 'CaquetÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(470, 48, 'Cauca', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(471, 48, 'CÃ³rdoba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(472, 48, 'Cesar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(473, 48, 'Cundinamarca', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(474, 48, 'Huila', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(475, 48, 'La Guajira', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(476, 48, 'Magdalena', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(477, 48, 'Meta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(478, 48, 'NariÃ±o', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(479, 48, 'Norte de Santander', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(480, 48, 'QuindÃ­o', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(481, 48, 'Risaralda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(482, 48, 'SantafÃ© de BogotÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(483, 48, 'Santander', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(484, 48, 'Sucre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(485, 48, 'Tolima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(486, 48, 'Valle', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(487, 49, 'Njazidja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(488, 50, 'SÃ£o Tiago', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(489, 51, 'San JosÃ©', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(490, 52, 'CamagÃ¼ey', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(491, 52, 'Ciego de Ãvila', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(492, 52, 'Cienfuegos', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(493, 52, 'Granma', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(494, 52, 'GuantÃ¡namo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(495, 52, 'HolguÃ­n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(496, 52, 'La Habana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(497, 52, 'Las Tunas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(498, 52, 'Matanzas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(499, 52, 'Pinar del RÃ­o', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(500, 52, 'Sancti-SpÃ­ritus', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(501, 52, 'Santiago de Cuba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(502, 52, 'Villa Clara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(503, 53, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(504, 54, 'Grand Cayman', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(505, 55, 'Limassol', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(506, 55, 'Nicosia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(507, 56, 'HlavnÃ­ mesto Praha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(508, 56, 'JiznÃ­ Cechy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(509, 56, 'JiznÃ­ Morava', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(510, 56, 'SevernÃ­ Cechy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(511, 56, 'SevernÃ­ Morava', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(512, 56, 'VÃ½chodnÃ­ Cechy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(513, 56, 'ZapadnÃ­ Cechy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(514, 57, 'Anhalt Sachsen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(515, 57, 'Baden-WÃ¼rttemberg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(516, 57, 'Baijeri', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(517, 57, 'Berliini', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(518, 57, 'Brandenburg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(519, 57, 'Bremen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(520, 57, 'Hamburg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(521, 57, 'Hessen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(522, 57, 'Mecklenburg-Vorpomme', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(523, 57, 'Niedersachsen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(524, 57, 'Nordrhein-Westfalen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(525, 57, 'Rheinland-Pfalz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(526, 57, 'Saarland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(527, 57, 'Saksi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(528, 57, 'Schleswig-Holstein', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(529, 57, 'ThÃ¼ringen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(530, 58, 'Djibouti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(531, 59, 'St George', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(532, 60, 'Ã…rhus', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(533, 60, 'Frederiksberg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(534, 60, 'Fyn', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(535, 60, 'KÃ¸benhavn', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(536, 60, 'Nordjylland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(537, 61, 'Distrito Nacional', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(538, 61, 'Duarte', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(539, 61, 'La Romana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(540, 61, 'Puerto Plata', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(541, 61, 'San Pedro de MacorÃ­', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(542, 61, 'Santiago', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(543, 62, 'Alger', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(544, 62, 'Annaba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(545, 62, 'Batna', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(546, 62, 'BÃ©char', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(547, 62, 'BÃ©jaÃ¯a', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(548, 62, 'Biskra', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(549, 62, 'Blida', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(550, 62, 'Chlef', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(551, 62, 'Constantine', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(552, 62, 'GhardaÃ¯a', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(553, 62, 'Mostaganem', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(554, 62, 'Oran', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(555, 62, 'SÃ©tif', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(556, 62, 'Sidi Bel AbbÃ¨s', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(557, 62, 'Skikda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(558, 62, 'TÃ©bessa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(559, 62, 'Tiaret', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(560, 62, 'Tlemcen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(561, 63, 'Azuay', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(562, 63, 'Chimborazo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(563, 63, 'El Oro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(564, 63, 'Esmeraldas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(565, 63, 'Guayas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(566, 63, 'Imbabura', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(567, 63, 'Loja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(568, 63, 'Los RÃ­os', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(569, 63, 'ManabÃ­', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(570, 63, 'Pichincha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(571, 63, 'Tungurahua', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(572, 64, 'al-Buhayra', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(573, 64, 'al-Daqahliya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(574, 64, 'al-Faiyum', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(575, 64, 'al-Gharbiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(576, 64, 'al-Minufiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(577, 64, 'al-Minya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(578, 64, 'al-Qalyubiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(579, 64, 'al-Sharqiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(580, 64, 'Aleksandria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(581, 64, 'Assuan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(582, 64, 'Asyut', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(583, 64, 'Bani Suwayf', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(584, 64, 'Giza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(585, 64, 'Ismailia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(586, 64, 'Kafr al-Shaykh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(587, 64, 'Kairo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(588, 64, 'Luxor', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(589, 64, 'Port Said', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(590, 64, 'Qina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(591, 64, 'Sawhaj', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(592, 64, 'Shamal Sina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(593, 64, 'Suez', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(594, 65, 'Maekel', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(595, 66, 'El-AaiÃºn', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(596, 67, 'Andalusia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(597, 67, 'Aragonia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(598, 67, 'Asturia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(599, 67, 'Balears', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(600, 67, 'Baskimaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(601, 67, 'Canary Islands', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(602, 67, 'Cantabria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(603, 67, 'Castilla and LeÃ³n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(604, 67, 'Extremadura', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(605, 67, 'Galicia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(606, 67, 'Kastilia-La Mancha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(607, 67, 'Katalonia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(608, 67, 'La Rioja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(609, 67, 'Madrid', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(610, 67, 'Murcia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(611, 67, 'Navarra', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(612, 67, 'Valencia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(613, 68, 'Harjumaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(614, 68, 'Tartumaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(615, 69, 'Addis Abeba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(616, 69, 'Amhara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(617, 69, 'Dire Dawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(618, 69, 'Oromia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(619, 69, 'Tigray', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(620, 70, 'Newmaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(621, 70, 'PÃ¤ijÃ¤t-HÃ¤me', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(622, 70, 'Pirkanmaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(623, 70, 'Pohjois-Pohjanmaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(624, 70, 'Varsinais-Suomi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(625, 71, 'Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(626, 72, 'East Falkland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(627, 73, 'Alsace', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(628, 73, 'Aquitaine', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(629, 73, 'Auvergne', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(630, 73, 'ÃŽle-de-France', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(631, 73, 'Basse-Normandie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(632, 73, 'Bourgogne', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(633, 73, 'Bretagne', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(634, 73, 'Centre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(635, 73, 'Champagne-Ardenne', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(636, 73, 'Franche-ComtÃ©', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(637, 73, 'Haute-Normandie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(638, 73, 'Languedoc-Roussillon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(639, 73, 'Limousin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(640, 73, 'Lorraine', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(641, 73, 'Midi-PyrÃ©nÃ©es', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(642, 73, 'Nord-Pas-de-Calais', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(643, 73, 'Pays de la Loire', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(644, 73, 'Picardie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(645, 73, 'Provence-Alpes-CÃ´te', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(646, 73, 'RhÃ´ne-Alpes', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(647, 74, 'Streymoyar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(648, 0, 'Chuuk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(649, 0, 'Pohnpei', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(650, 76, 'Estuaire', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(651, 77, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(652, 77, 'England', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(653, 77, 'Jersey', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(654, 77, 'North Ireland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(655, 77, 'Scotland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(656, 77, 'Wales', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(657, 78, 'Abhasia [Aphazeti]', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(658, 78, 'Adzaria [AtÅ¡ara]', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(659, 78, 'Imereti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(660, 78, 'Kvemo Kartli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(661, 78, 'Tbilisi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(662, 79, 'Ashanti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(663, 79, 'Greater Accra', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(664, 79, 'Northern', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(665, 79, 'Western', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(666, 80, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(667, 81, 'Conakry', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(668, 82, 'Basse-Terre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(669, 82, 'Grande-Terre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(670, 83, 'Banjul', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(671, 83, 'Kombo St Mary', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(672, 84, 'Bissau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(673, 85, 'Bioko', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(674, 86, 'Attika', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(675, 86, 'Central Macedonia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(676, 86, 'Crete', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(677, 86, 'Thessalia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(678, 86, 'West Greece', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(679, 87, 'St George', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(680, 88, 'Kitaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(681, 89, 'Guatemala', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(682, 89, 'Quetzaltenango', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(683, 90, 'Cayenne', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(684, 91, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(685, 92, 'Georgetown', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(686, 93, 'Hongkong', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(687, 93, 'Kowloon and New Kowl', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(688, 95, 'AtlÃ¡ntida', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(689, 95, 'CortÃ©s', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(690, 95, 'Distrito Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(691, 96, 'Grad Zagreb', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(692, 96, 'Osijek-Baranja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(693, 96, 'Primorje-Gorski Kota', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(694, 96, 'Split-Dalmatia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(695, 97, 'Nord', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(696, 97, 'Ouest', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(697, 98, 'Baranya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(698, 98, 'BÃ¡cs-Kiskun', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(699, 98, 'Borsod-AbaÃºj-ZemplÃ', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(700, 98, 'Budapest', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(701, 98, 'CsongrÃ¡d', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(702, 98, 'FejÃ©r', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(703, 98, 'GyÃ¶r-Moson-Sopron', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(704, 98, 'HajdÃº-Bihar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(705, 98, 'Szabolcs-SzatmÃ¡r-Be', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(706, 99, 'Aceh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(707, 99, 'Bali', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(708, 99, 'Bengkulu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(709, 99, 'Central Java', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(710, 99, 'East Java', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(711, 99, 'Jakarta Raya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(712, 99, 'Jambi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(713, 99, 'Kalimantan Barat', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(714, 99, 'Kalimantan Selatan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(715, 99, 'Kalimantan Tengah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(716, 99, 'Kalimantan Timur', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(717, 99, 'Lampung', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(718, 99, 'Molukit', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(719, 99, 'Nusa Tenggara Barat', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(720, 99, 'Nusa Tenggara Timur', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(721, 99, 'Riau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(722, 99, 'Sulawesi Selatan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(723, 99, 'Sulawesi Tengah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(724, 99, 'Sulawesi Tenggara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(725, 99, 'Sulawesi Utara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(726, 99, 'Sumatera Barat', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(727, 99, 'Sumatera Selatan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(728, 99, 'Sumatera Utara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(729, 99, 'West Irian', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(730, 99, 'West Java', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(731, 99, 'Yogyakarta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(732, 100, 'Andhra Pradesh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(733, 100, 'Assam', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(734, 100, 'Bihar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(735, 100, 'Chandigarh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(736, 100, 'Chhatisgarh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(737, 100, 'Delhi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(738, 100, 'Gujarat', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(739, 100, 'Haryana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(740, 100, 'Jammu and Kashmir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(741, 100, 'Jharkhand', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(742, 100, 'Karnataka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(743, 100, 'Kerala', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(744, 100, 'Madhya Pradesh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(745, 100, 'Maharashtra', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(746, 100, 'Manipur', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(747, 100, 'Meghalaya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(748, 100, 'Mizoram', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(749, 100, 'Orissa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(750, 100, 'Pondicherry', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(751, 100, 'Punjab', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(752, 100, 'Rajasthan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(753, 100, 'Tamil Nadu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(754, 100, 'Tripura', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(755, 100, 'Uttar Pradesh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(756, 100, 'Uttaranchal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(757, 100, 'West Bengali', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(758, 102, 'Leinster', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(759, 102, 'Munster', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(760, 103, 'Ardebil', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(761, 103, 'Bushehr', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(762, 103, 'Chaharmahal va Bakht', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(763, 103, 'East Azerbaidzan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(764, 103, 'Esfahan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(765, 103, 'Fars', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(766, 103, 'Gilan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(767, 103, 'Golestan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(768, 103, 'Hamadan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(769, 103, 'Hormozgan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(770, 103, 'Ilam', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(771, 103, 'Kerman', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(772, 103, 'Kermanshah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(773, 103, 'Khorasan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(774, 103, 'Khuzestan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(775, 103, 'Kordestan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(776, 103, 'Lorestan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(777, 103, 'Markazi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(778, 103, 'Mazandaran', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(779, 103, 'Qazvin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(780, 103, 'Qom', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(781, 103, 'Semnan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(782, 103, 'Sistan va Baluchesta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(783, 103, 'Teheran', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(784, 103, 'West Azerbaidzan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(785, 103, 'Yazd', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(786, 103, 'Zanjan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(787, 104, 'al-Anbar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(788, 104, 'al-Najaf', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(789, 104, 'al-Qadisiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(790, 104, 'al-Sulaymaniya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(791, 104, 'al-Tamim', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(792, 104, 'Babil', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(793, 104, 'Baghdad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(794, 104, 'Basra', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(795, 104, 'DhiQar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(796, 104, 'Diyala', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(797, 104, 'Irbil', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(798, 104, 'Karbala', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(799, 104, 'Maysan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(800, 104, 'Ninawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(801, 104, 'Wasit', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(802, 105, 'HÃ¶fuÃ°borgarsvÃ¦Ã°i', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(803, 106, 'Ha Darom', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(804, 106, 'Ha Merkaz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(805, 106, 'Haifa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(806, 106, 'Jerusalem', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(807, 106, 'Tel Aviv', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(808, 107, 'Abruzzit', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(809, 107, 'Apulia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(810, 107, 'Calabria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(811, 107, 'Campania', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(812, 107, 'Emilia-Romagna', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(813, 107, 'Friuli-Venezia Giuli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(814, 107, 'Latium', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(815, 107, 'Liguria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(816, 107, 'Lombardia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(817, 107, 'Marche', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(818, 107, 'Piemonte', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(819, 107, 'Sardinia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(820, 107, 'Sisilia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(821, 107, 'Toscana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(822, 107, 'Trentino-Alto Adige', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(823, 107, 'Umbria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(824, 107, 'Veneto', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(825, 108, 'St. Andrew', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(826, 108, 'St. Catherine', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(827, 109, 'al-Zarqa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(828, 109, 'Amman', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(829, 109, 'Irbid', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(830, 110, 'Aichi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(831, 110, 'Akita', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(832, 110, 'Aomori', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(833, 110, 'Chiba', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(834, 110, 'Ehime', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(835, 110, 'Fukui', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(836, 110, 'Fukuoka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(837, 110, 'Fukushima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(838, 110, 'Gifu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(839, 110, 'Gumma', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(840, 110, 'Hiroshima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(841, 110, 'Hokkaido', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(842, 110, 'Hyogo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(843, 110, 'Ibaragi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(844, 110, 'Ishikawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(845, 110, 'Iwate', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(846, 110, 'Kagawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(847, 110, 'Kagoshima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(848, 110, 'Kanagawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(849, 110, 'Kochi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(850, 110, 'Kumamoto', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(851, 110, 'Kyoto', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(852, 110, 'Mie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(853, 110, 'Miyagi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(854, 110, 'Miyazaki', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(855, 110, 'Nagano', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(856, 110, 'Nagasaki', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(857, 110, 'Nara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(858, 110, 'Niigata', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(859, 110, 'Oita', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(860, 110, 'Okayama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(861, 110, 'Okinawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(862, 110, 'Osaka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(863, 110, 'Saga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(864, 110, 'Saitama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(865, 110, 'Shiga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(866, 110, 'Shimane', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(867, 110, 'Shizuoka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(868, 110, 'Tochigi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(869, 110, 'Tokushima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(870, 110, 'Tokyo-to', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(871, 110, 'Tottori', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(872, 110, 'Toyama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(873, 110, 'Wakayama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(874, 110, 'Yamagata', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(875, 110, 'Yamaguchi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(876, 110, 'Yamanashi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(877, 111, 'Almaty', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(878, 111, 'Almaty Qalasy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(879, 111, 'AqtÃ¶be', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(880, 111, 'Astana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(881, 111, 'Atyrau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(882, 111, 'East Kazakstan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(883, 111, 'Mangghystau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(884, 111, 'North Kazakstan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(885, 111, 'Pavlodar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1);
INSERT INTO `tbl_state` (`state_id`, `country_id`, `state_name`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(886, 111, 'Qaraghandy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(887, 111, 'Qostanay', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(888, 111, 'Qyzylorda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(889, 111, 'South Kazakstan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(890, 111, 'Taraz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(891, 111, 'West Kazakstan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(892, 112, 'Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(893, 112, 'Coast', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(894, 112, 'Eastern', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(895, 112, 'Nairobi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(896, 112, 'Nyanza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(897, 112, 'Rift Valley', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(898, 113, 'Bishkek shaary', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(899, 113, 'Osh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(900, 114, 'Battambang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(901, 114, 'Phnom Penh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(902, 114, 'Siem Reap', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(903, 115, 'South Tarawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(904, 116, 'St George Basseterre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(905, 117, 'Cheju', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(906, 117, 'Chollabuk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(907, 117, 'Chollanam', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(908, 117, 'Chungchongbuk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(909, 117, 'Chungchongnam', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(910, 117, 'Inchon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(911, 117, 'Kang-won', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(912, 117, 'Kwangju', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(913, 117, 'Kyonggi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(914, 117, 'Kyongsangbuk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(915, 117, 'Kyongsangnam', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(916, 117, 'Pusan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(917, 117, 'Seoul', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(918, 117, 'Taegu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(919, 117, 'Taejon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(920, 118, 'al-Asima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(921, 118, 'Hawalli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(922, 119, 'Savannakhet', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(923, 119, 'Viangchan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(924, 120, 'al-Shamal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(925, 120, 'Beirut', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(926, 121, 'Montserrado', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(927, 122, 'al-Zawiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(928, 122, 'Bengasi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(929, 122, 'Misrata', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(930, 122, 'Tripoli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(931, 123, 'Castries', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(932, 124, 'Schaan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(933, 124, 'Vaduz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(934, 125, 'Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(935, 125, 'Northern', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(936, 125, 'Western', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(937, 126, 'Maseru', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(938, 127, 'Kaunas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(939, 127, 'Klaipeda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(940, 127, 'Panevezys', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(941, 127, 'Vilna', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(942, 127, 'Å iauliai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(943, 128, 'Luxembourg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(944, 129, 'Daugavpils', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(945, 129, 'Liepaja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(946, 129, 'Riika', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(947, 130, 'Macau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(948, 131, 'Casablanca', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(949, 131, 'Chaouia-Ouardigha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(950, 131, 'Doukkala-Abda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(951, 131, 'FÃ¨s-Boulemane', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(952, 131, 'Gharb-Chrarda-BÃ©ni', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(953, 131, 'Marrakech-Tensift-Al', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(954, 131, 'MeknÃ¨s-Tafilalet', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(955, 131, 'Oriental', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(956, 131, 'Rabat-SalÃ©-Zammour-', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(957, 131, 'Souss Massa-DraÃ¢', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(958, 131, 'Tadla-Azilal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(959, 131, 'Tanger-TÃ©touan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(960, 131, 'Taza-Al Hoceima-Taou', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(961, 132, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(962, 133, 'Balti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(963, 133, 'Bender (TÃ®ghina)', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(964, 133, 'Chisinau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(965, 133, 'Dnjestria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(966, 134, 'Antananarivo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(967, 134, 'Fianarantsoa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(968, 134, 'Mahajanga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(969, 134, 'Toamasina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(970, 135, 'Maale', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(971, 136, 'Aguascalientes', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(972, 136, 'Baja California', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(973, 136, 'Baja California Sur', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(974, 136, 'Campeche', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(975, 136, 'Chiapas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(976, 136, 'Chihuahua', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(977, 136, 'Coahuila de Zaragoza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(978, 136, 'Colima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(979, 136, 'Distrito Federal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(980, 136, 'Durango', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(981, 136, 'Guanajuato', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(982, 136, 'Guerrero', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(983, 136, 'Hidalgo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(984, 136, 'Jalisco', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(985, 136, 'MÃ©xico', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(986, 136, 'MichoacÃ¡n de Ocampo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(987, 136, 'Morelos', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(988, 136, 'Nayarit', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(989, 136, 'Nuevo LeÃ³n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(990, 136, 'Oaxaca', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(991, 136, 'Puebla', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(992, 136, 'QuerÃ©taro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(993, 136, 'QuerÃ©taro de Arteag', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(994, 136, 'Quintana Roo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(995, 136, 'San Luis PotosÃ­', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(996, 136, 'Sinaloa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(997, 136, 'Sonora', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(998, 136, 'Tabasco', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(999, 136, 'Tamaulipas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1000, 136, 'Veracruz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1001, 136, 'Veracruz-Llave', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1002, 136, 'YucatÃ¡n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1003, 136, 'Zacatecas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1004, 137, 'Majuro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1005, 138, 'Skopje', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1006, 139, 'Bamako', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1007, 140, 'Inner Harbour', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1008, 140, 'Outer Harbour', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1009, 141, 'Irrawaddy [Ayeyarwad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1010, 141, 'Magwe [Magway]', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1011, 141, 'Mandalay', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1012, 141, 'Mon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1013, 141, 'Pegu [Bago]', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1014, 141, 'Rakhine', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1015, 141, 'Rangoon [Yangon]', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1016, 141, 'Sagaing', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1017, 141, 'Shan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1018, 141, 'Tenasserim [Tanintha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1019, 142, 'Ulaanbaatar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1020, 143, 'Saipan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1021, 144, 'Gaza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1022, 144, 'Inhambane', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1023, 144, 'Manica', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1024, 144, 'Maputo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1025, 144, 'Nampula', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1026, 144, 'Sofala', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1027, 144, 'Tete', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1028, 144, 'ZambÃ©zia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1029, 145, 'Dakhlet NouÃ¢dhibou', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1030, 145, 'Nouakchott', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1031, 146, 'Plymouth', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1032, 147, 'Fort-de-France', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1033, 148, 'Plaines Wilhelms', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1034, 148, 'Port-Louis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1035, 149, 'Blantyre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1036, 149, 'Lilongwe', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1037, 150, 'Johor', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1038, 150, 'Kedah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1039, 150, 'Kelantan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1040, 150, 'Negeri Sembilan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1041, 150, 'Pahang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1042, 150, 'Perak', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1043, 150, 'Pulau Pinang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1044, 150, 'Sabah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1045, 150, 'Sarawak', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1046, 150, 'Selangor', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1047, 150, 'Terengganu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1048, 150, 'Wilayah Persekutuan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1049, 151, 'Mamoutzou', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1050, 152, 'Khomas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1051, 153, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1052, 154, 'Maradi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1053, 154, 'Niamey', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1054, 154, 'Zinder', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1055, 155, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1056, 156, 'Anambra & Enugu & Eb', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1057, 156, 'Bauchi & Gombe', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1058, 156, 'Benue', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1059, 156, 'Borno & Yobe', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1060, 156, 'Cross River', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1061, 156, 'Edo & Delta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1062, 156, 'Federal Capital Dist', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1063, 156, 'Imo & Abia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1064, 156, 'Kaduna', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1065, 156, 'Kano & Jigawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1066, 156, 'Katsina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1067, 156, 'Kwara & Kogi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1068, 156, 'Lagos', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1069, 156, 'Niger', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1070, 156, 'Ogun', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1071, 156, 'Ondo & Ekiti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1072, 156, 'Oyo & Osun', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1073, 156, 'Plateau & Nassarawa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1074, 156, 'Rivers & Bayelsa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1075, 156, 'Sokoto & Kebbi & Zam', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1076, 157, 'Chinandega', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1077, 157, 'LeÃ³n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1078, 157, 'Managua', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1079, 157, 'Masaya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1080, 158, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1081, 159, 'Drenthe', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1082, 159, 'Flevoland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1083, 159, 'Gelderland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1084, 159, 'Groningen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1085, 159, 'Limburg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1086, 159, 'Noord-Brabant', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1087, 159, 'Noord-Holland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1088, 159, 'Overijssel', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1089, 159, 'Utrecht', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1090, 159, 'Zuid-Holland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1091, 160, 'Akershus', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1092, 160, 'Hordaland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1093, 160, 'Oslo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1094, 160, 'Rogaland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1095, 160, 'SÃ¸r-TrÃ¸ndelag', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1096, 161, 'Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1097, 161, 'Eastern', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1098, 161, 'Western', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1099, 162, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1100, 163, 'Auckland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1101, 163, 'Canterbury', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1102, 163, 'Dunedin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1103, 163, 'Hamilton', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1104, 163, 'Wellington', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1105, 164, 'al-Batina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1106, 164, 'Masqat', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1107, 164, 'Zufar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1108, 165, 'Baluchistan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1109, 165, 'Islamabad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1110, 165, 'Nothwest Border Prov', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1111, 165, 'Punjab', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1112, 165, 'Sind', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1113, 165, 'Sindh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1114, 166, 'PanamÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1115, 166, 'San Miguelito', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1116, 167, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1117, 168, 'Ancash', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1118, 168, 'Arequipa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1119, 168, 'Ayacucho', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1120, 168, 'Cajamarca', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1121, 168, 'Callao', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1122, 168, 'Cusco', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1123, 168, 'Huanuco', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1124, 168, 'Ica', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1125, 168, 'JunÃ­n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1126, 168, 'La Libertad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1127, 168, 'Lambayeque', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1128, 168, 'Lima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1129, 168, 'Loreto', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1130, 168, 'Piura', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1131, 168, 'Puno', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1132, 168, 'Tacna', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1133, 168, 'Ucayali', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1134, 169, 'ARMM', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1135, 169, 'Bicol', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1136, 169, 'Cagayan Valley', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1137, 169, 'CAR', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1138, 169, 'Caraga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1139, 169, 'Central Luzon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1140, 169, 'Central Mindanao', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1141, 169, 'Central Visayas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1142, 169, 'Eastern Visayas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1143, 169, 'Ilocos', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1144, 169, 'National Capital Reg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1145, 169, 'Northern Mindanao', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1146, 169, 'Southern Mindanao', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1147, 169, 'Southern Tagalog', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1148, 169, 'Western Mindanao', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1149, 169, 'Western Visayas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1150, 170, 'Koror', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1151, 171, 'National Capital Dis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1152, 172, 'Dolnoslaskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1153, 172, 'Kujawsko-Pomorskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1154, 172, 'Lodzkie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1155, 172, 'Lubelskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1156, 172, 'Lubuskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1157, 172, 'Malopolskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1158, 172, 'Mazowieckie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1159, 172, 'Opolskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1160, 172, 'Podkarpackie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1161, 172, 'Podlaskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1162, 172, 'Pomorskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1163, 172, 'Slaskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1164, 172, 'Swietokrzyskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1165, 172, 'Warminsko-Mazurskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1166, 172, 'Wielkopolskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1167, 172, 'Zachodnio-Pomorskie', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1168, 173, 'Arecibo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1169, 173, 'BayamÃ³n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1170, 173, 'Caguas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1171, 173, 'Carolina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1172, 173, 'Guaynabo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1173, 173, 'MayagÃ¼ez', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1174, 173, 'Ponce', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1175, 173, 'San Juan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1176, 173, 'Toa Baja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1177, 174, 'Chagang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1178, 174, 'Hamgyong N', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1179, 174, 'Hamgyong P', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1180, 174, 'Hwanghae N', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1181, 174, 'Hwanghae P', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1182, 174, 'Kaesong-si', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1183, 174, 'Kangwon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1184, 174, 'Nampo-si', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1185, 174, 'Pyongan N', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1186, 174, 'Pyongan P', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1187, 174, 'Pyongyang-si', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1188, 174, 'Yanggang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1189, 175, 'Braga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1190, 175, 'CoÃ­mbra', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1191, 175, 'Lisboa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1192, 175, 'Porto', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1193, 176, 'Alto ParanÃ¡', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1194, 176, 'AsunciÃ³n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1195, 176, 'Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1196, 177, 'Gaza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1197, 177, 'Hebron', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1198, 177, 'Khan Yunis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1199, 177, 'Nablus', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1200, 177, 'North Gaza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1201, 177, 'Rafah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1202, 178, 'Tahiti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1203, 179, 'Doha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1204, 180, 'Saint-Denis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1205, 181, 'Arad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1206, 181, 'Arges', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1207, 181, 'Bacau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1208, 181, 'Bihor', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1209, 181, 'Botosani', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1210, 181, 'Braila', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1211, 181, 'Brasov', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1212, 181, 'Bukarest', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1213, 181, 'Buzau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1214, 181, 'Caras-Severin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1215, 181, 'Cluj', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1216, 181, 'Constanta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1217, 181, 'DÃ¢mbovita', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1218, 181, 'Dolj', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1219, 181, 'Galati', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1220, 181, 'Gorj', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1221, 181, 'Iasi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1222, 181, 'Maramures', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1223, 181, 'Mehedinti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1224, 181, 'Mures', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1225, 181, 'Neamt', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1226, 181, 'Prahova', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1227, 181, 'Satu Mare', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1228, 181, 'Sibiu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1229, 181, 'Suceava', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1230, 181, 'Timis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1231, 181, 'Tulcea', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1232, 181, 'VÃ¢lcea', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1233, 181, 'Vrancea', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1234, 182, 'Adygea', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1235, 182, 'Altai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1236, 182, 'Amur', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1237, 182, 'Arkangeli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1238, 182, 'Astrahan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1239, 182, 'BaÅ¡kortostan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1240, 182, 'Belgorod', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1241, 182, 'Brjansk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1242, 182, 'Burjatia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1243, 182, 'Dagestan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1244, 182, 'Habarovsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1245, 182, 'Hakassia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1246, 182, 'Hanti-Mansia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1247, 182, 'Irkutsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1248, 182, 'Ivanovo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1249, 182, 'Jaroslavl', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1250, 182, 'Kabardi-Balkaria', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1251, 182, 'Kaliningrad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1252, 182, 'Kalmykia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1253, 182, 'Kaluga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1254, 182, 'KamtÅ¡atka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1255, 182, 'KaratÅ¡ai-TÅ¡erkessi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1256, 182, 'Karjala', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1257, 182, 'Kemerovo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1258, 182, 'Kirov', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1259, 182, 'Komi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1260, 182, 'Kostroma', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1261, 182, 'Krasnodar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1262, 182, 'Krasnojarsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1263, 182, 'Kurgan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1264, 182, 'Kursk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1265, 182, 'Lipetsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1266, 182, 'Magadan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1267, 182, 'Marinmaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1268, 182, 'Mordva', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1269, 182, 'Moscow (City)', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1270, 182, 'Moskova', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1271, 182, 'Murmansk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1272, 182, 'Nizni Novgorod', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1273, 182, 'North Ossetia-Alania', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1274, 182, 'Novgorod', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1275, 182, 'Novosibirsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1276, 182, 'Omsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1277, 182, 'Orenburg', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1278, 182, 'Orjol', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1279, 182, 'Penza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1280, 182, 'Perm', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1281, 182, 'Pietari', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1282, 182, 'Pihkova', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1283, 182, 'Primorje', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1284, 182, 'Rjazan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1285, 182, 'Rostov-na-Donu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1286, 182, 'Saha (Jakutia)', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1287, 182, 'Sahalin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1288, 182, 'Samara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1289, 182, 'Saratov', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1290, 182, 'Smolensk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1291, 182, 'Stavropol', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1292, 182, 'Sverdlovsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1293, 182, 'Tambov', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1294, 182, 'Tatarstan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1295, 182, 'Tjumen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1296, 182, 'Tomsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1297, 182, 'Tula', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1298, 182, 'Tver', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1299, 182, 'Tyva', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1300, 182, 'TÅ¡eljabinsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1301, 182, 'TÅ¡etÅ¡enia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1302, 182, 'TÅ¡ita', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1303, 182, 'TÅ¡uvassia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1304, 182, 'Udmurtia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1305, 182, 'Uljanovsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1306, 182, 'Vladimir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1307, 182, 'Volgograd', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1308, 182, 'Vologda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1309, 182, 'Voronez', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1310, 182, 'Yamalin Nenetsia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1311, 183, 'Kigali', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1312, 184, 'al-Khudud al-Samaliy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1313, 184, 'al-Qasim', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1314, 184, 'al-Sharqiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1315, 184, 'Asir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1316, 184, 'Hail', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1317, 184, 'Medina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1318, 184, 'Mekka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1319, 184, 'Najran', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1320, 184, 'Qasim', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1321, 184, 'Riad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1322, 184, 'Riyadh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1323, 184, 'Tabuk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1324, 185, 'al-Bahr al-Abyad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1325, 185, 'al-Bahr al-Ahmar', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1326, 185, 'al-Jazira', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1327, 185, 'al-Qadarif', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1328, 185, 'Bahr al-Jabal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1329, 185, 'Darfur al-Janubiya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1330, 185, 'Darfur al-Shamaliya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1331, 185, 'Kassala', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1332, 185, 'Khartum', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1333, 185, 'Kurdufan al-Shamaliy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1334, 186, 'Cap-Vert', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1335, 186, 'Diourbel', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1336, 186, 'Kaolack', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1337, 186, 'Saint-Louis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1338, 186, 'ThiÃ¨s', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1339, 186, 'Ziguinchor', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1340, 187, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1341, 189, 'Saint Helena', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1342, 190, 'LÃ¤nsimaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1343, 191, 'Honiara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1344, 192, 'Western', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1345, 193, 'La Libertad', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1346, 193, 'San Miguel', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1347, 193, 'San Salvador', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1348, 193, 'Santa Ana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1349, 194, 'San Marino', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1350, 194, 'Serravalle/Dogano', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1351, 195, 'Banaadir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1352, 195, 'Jubbada Hoose', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1353, 195, 'Woqooyi Galbeed', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1354, 196, 'Saint-Pierre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1355, 197, 'Aqua Grande', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1356, 198, 'Paramaribo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1357, 199, 'Bratislava', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1358, 199, 'VÃ½chodnÃ© Slovensko', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1359, 200, 'Osrednjeslovenska', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1360, 200, 'Podravska', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1361, 201, 'Ã–rebros lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1362, 201, 'East GÃ¶tanmaan lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1363, 201, 'GÃ¤vleborgs lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1364, 201, 'JÃ¶nkÃ¶pings lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1365, 201, 'Lisboa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1366, 201, 'SkÃ¥ne lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1367, 201, 'Uppsala lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1368, 201, 'VÃ¤sterbottens lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1369, 201, 'VÃ¤sternorrlands lÃ¤', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1370, 201, 'VÃ¤stmanlands lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1371, 201, 'West GÃ¶tanmaan lÃ¤n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1372, 202, 'Hhohho', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1373, 203, 'MahÃ©', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1374, 204, 'al-Hasaka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1375, 204, 'al-Raqqa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1376, 204, 'Aleppo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1377, 204, 'Damascus', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1378, 204, 'Damaskos', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1379, 204, 'Dayr al-Zawr', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1380, 204, 'Hama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1381, 204, 'Hims', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1382, 204, 'Idlib', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1383, 204, 'Latakia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1384, 205, 'Grand Turk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1385, 206, 'Chari-Baguirmi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1386, 206, 'Logone Occidental', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1387, 207, 'Maritime', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1388, 208, 'Bangkok', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1389, 208, 'Chiang Mai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1390, 208, 'Khon Kaen', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1391, 208, 'Nakhon Pathom', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1392, 208, 'Nakhon Ratchasima', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1393, 208, 'Nakhon Sawan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1394, 208, 'Nonthaburi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1395, 208, 'Songkhla', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1396, 208, 'Ubon Ratchathani', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1397, 208, 'Udon Thani', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1398, 209, 'Karotegin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1399, 209, 'Khujand', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1400, 210, 'Fakaofo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1401, 211, 'Ahal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1402, 211, 'Dashhowuz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1403, 211, 'Lebap', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1404, 211, 'Mary', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1405, 212, 'Dili', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1406, 213, 'Tongatapu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1407, 214, 'Caroni', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1408, 214, 'Port-of-Spain', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1409, 215, 'Ariana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1410, 215, 'Biserta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1411, 215, 'GabÃ¨s', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1412, 215, 'Kairouan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1413, 215, 'Sfax', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1414, 215, 'Sousse', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1415, 215, 'Tunis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1416, 216, 'Adana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1417, 216, 'Adiyaman', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1418, 216, 'Afyon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1419, 216, 'Aksaray', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1420, 216, 'Ankara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1421, 216, 'Antalya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1422, 216, 'Aydin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1423, 216, 'Ã‡orum', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1424, 216, 'Balikesir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1425, 216, 'Batman', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1426, 216, 'Bursa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1427, 216, 'Denizli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1428, 216, 'Diyarbakir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1429, 216, 'Edirne', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1430, 216, 'ElÃ¢zig', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1431, 216, 'Erzincan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1432, 216, 'Erzurum', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1433, 216, 'Eskisehir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1434, 216, 'Gaziantep', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1435, 216, 'Hatay', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1436, 216, 'IÃ§el', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1437, 216, 'Isparta', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1438, 216, 'Istanbul', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1439, 216, 'Izmir', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1440, 216, 'Kahramanmaras', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1441, 216, 'KarabÃ¼k', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1442, 216, 'Karaman', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1443, 216, 'Kars', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1444, 216, 'Kayseri', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1445, 216, 'KÃ¼tahya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1446, 216, 'Kilis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1447, 216, 'Kirikkale', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1448, 216, 'Kocaeli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1449, 216, 'Konya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1450, 216, 'Malatya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1451, 216, 'Manisa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1452, 216, 'Mardin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1453, 216, 'Ordu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1454, 216, 'Osmaniye', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1455, 216, 'Sakarya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1456, 216, 'Samsun', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1457, 216, 'Sanliurfa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1458, 216, 'Siirt', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1459, 216, 'Sivas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1460, 216, 'Tekirdag', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1461, 216, 'Tokat', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1462, 216, 'Trabzon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1463, 216, 'Usak', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1464, 216, 'Van', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1465, 216, 'Zonguldak', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1466, 217, 'Funafuti', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1467, 218, 'New Taipei', 1, '2017-10-16 17:21:31', 1, '2019-04-19 10:35:29', 1),
(1468, 218, 'Changhwa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1469, 218, 'Chiayi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1470, 218, 'Hsinchu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1471, 218, 'Hualien', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1472, 218, 'Ilan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1473, 218, 'Kaohsiung', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1474, 218, 'Keelung', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1475, 218, 'Miaoli', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1476, 218, 'Nantou', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1477, 218, 'Pingtung', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1478, 218, 'Taichung', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1479, 218, 'Tainan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1480, 218, 'Taipei', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1481, 218, 'Taitung', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1482, 218, 'Taoyuan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1483, 218, 'YÃ¼nlin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1484, 219, 'Arusha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1485, 219, 'Dar es Salaam', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1486, 219, 'Dodoma', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1487, 219, 'Kilimanjaro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1488, 219, 'Mbeya', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1489, 219, 'Morogoro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1490, 219, 'Mwanza', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1491, 219, 'Tabora', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1492, 219, 'Tanga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1493, 219, 'Zanzibar West', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1494, 220, 'Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1495, 221, 'Dnipropetrovsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1496, 221, 'Donetsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1497, 221, 'Harkova', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1498, 221, 'Herson', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1499, 221, 'Hmelnytskyi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1500, 221, 'Ivano-Frankivsk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1501, 221, 'Kiova', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1502, 221, 'Kirovograd', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1503, 221, 'Krim', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1504, 221, 'Lugansk', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1505, 221, 'Lviv', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1506, 221, 'Mykolajiv', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1507, 221, 'Odesa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1508, 221, 'Pultava', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1509, 221, 'Rivne', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1510, 221, 'Sumy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1511, 221, 'Taka-Karpatia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1512, 221, 'Ternopil', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1513, 221, 'TÅ¡erkasy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1514, 221, 'TÅ¡ernigiv', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1515, 221, 'TÅ¡ernivtsi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1516, 221, 'Vinnytsja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1517, 221, 'Volynia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1518, 221, 'Zaporizzja', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1);
INSERT INTO `tbl_state` (`state_id`, `country_id`, `state_name`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_active`) VALUES
(1519, 221, 'Zytomyr', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1520, 223, 'Montevideo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1521, 224, 'Alabama', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1522, 224, 'Alaska', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1523, 224, 'Arizona', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1524, 224, 'Arkansas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1525, 224, 'California', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1526, 224, 'Colorado', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1527, 224, 'Connecticut', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1528, 224, 'District of Columbia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1529, 224, 'Florida', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1530, 224, 'Georgia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1531, 224, 'Hawaii', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1532, 224, 'Idaho', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1533, 224, 'Illinois', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1534, 224, 'Indiana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1535, 224, 'Iowa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1536, 224, 'Kansas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1537, 224, 'Kentucky', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1538, 224, 'Louisiana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1539, 224, 'Maryland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1540, 224, 'Massachusetts', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1541, 224, 'Michigan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1542, 224, 'Minnesota', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1543, 224, 'Mississippi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1544, 224, 'Missouri', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1545, 224, 'Montana', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1546, 224, 'Nebraska', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1547, 224, 'Nevada', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1548, 224, 'New Hampshire', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1549, 224, 'New Jersey', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1550, 224, 'New Mexico', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1551, 224, 'New York', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1552, 224, 'North Carolina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1553, 224, 'Ohio', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1554, 224, 'Oklahoma', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1555, 224, 'Oregon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1556, 224, 'Pennsylvania', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1557, 224, 'Rhode Island', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1558, 224, 'South Carolina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1559, 224, 'South Dakota', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1560, 224, 'Tennessee', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1561, 224, 'Texas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1562, 224, 'Utah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1563, 224, 'Virginia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1564, 224, 'Washington', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1565, 224, 'Wisconsin', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1566, 225, 'Andijon', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1567, 225, 'Buhoro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1568, 225, 'Cizah', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1569, 225, 'Fargona', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1570, 225, 'Karakalpakistan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1571, 225, 'Khorazm', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1572, 225, 'Namangan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1573, 225, 'Navoi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1574, 225, 'Qashqadaryo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1575, 225, 'Samarkand', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1576, 225, 'Surkhondaryo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1577, 225, 'Toskent', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1578, 225, 'Toskent Shahri', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1579, 226, 'â€“', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1580, 0, 'St George', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1581, 228, 'Bolivar', 1, '2017-10-16 17:21:31', 1, '2019-04-19 10:33:14', 1),
(1582, 228, 'AnzoÃ¡tegui', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1583, 228, 'Apure', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1584, 228, 'Aragua', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1585, 228, 'Barinas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1586, 228, 'BolÃ­var', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1587, 228, 'Carabobo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1588, 228, 'Distrito Federal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1589, 228, 'FalcÃ³n', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1590, 228, 'GuÃ¡rico', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1591, 228, 'Lara', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1592, 228, 'MÃ©rida', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1593, 228, 'Miranda', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1594, 228, 'Monagas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1595, 228, 'Portuguesa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1596, 228, 'Sucre', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1597, 228, 'TÃ¡chira', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1598, 228, 'Trujillo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1599, 228, 'Yaracuy', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1600, 228, 'Zulia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1601, 229, 'Tortola', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1602, 230, 'St Thomas', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1603, 231, 'An Giang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1604, 231, 'Ba Ria-Vung Tau', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1605, 231, 'Bac Thai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1606, 231, 'Binh Dinh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1607, 231, 'Binh Thuan', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1608, 231, 'Can Tho', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1609, 231, 'Dac Lac', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1610, 231, 'Dong Nai', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1611, 231, 'Haiphong', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1612, 231, 'Hanoi', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1613, 231, 'Ho Chi Minh City', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1614, 231, 'Khanh Hoa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1615, 231, 'Kien Giang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1616, 231, 'Lam Dong', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1617, 231, 'Nam Ha', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1618, 231, 'Nghe An', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1619, 231, 'Quang Binh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1620, 231, 'Quang Nam-Da Nang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1621, 231, 'Quang Ninh', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1622, 231, 'Thua Thien-Hue', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1623, 231, 'Tien Giang', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1624, 232, 'Shefa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1625, 233, 'Wallis', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1626, 234, 'Upolu', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1627, 235, 'Aden', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1628, 235, 'Hadramawt', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1629, 235, 'Hodeida', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1630, 235, 'Ibb', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1631, 235, 'Sanaa', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1632, 235, 'Taizz', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1633, 236, 'Central Serbia', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1634, 236, 'Kosovo and Metohija', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1635, 236, 'Montenegro', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1636, 236, 'Vojvodina', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1637, 237, 'Eastern Cape', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1638, 237, 'Free State', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1639, 237, 'Gauteng', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1640, 237, 'KwaZulu-Natal', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1641, 237, 'Mpumalanga', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1642, 237, 'North West', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1643, 237, 'Northern Cape', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1644, 237, 'Western Cape', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1645, 238, 'Central', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1646, 238, 'Copperbelt', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1647, 238, 'Lusaka', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1648, 239, 'Bulawayo', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1649, 239, 'Harare', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1650, 239, 'Manicaland', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1651, 239, 'Midlands', 1, '2017-10-16 17:21:31', 1, '2017-10-16 17:21:31', 1),
(1652, 240, 'test', 1, '2018-02-07 15:44:17', 1, '2018-02-07 15:44:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `status_type` enum('lead','sales order','supplier quotation','assets','assets repair','inquiry','assets maintenance','sales invoice','request for quotation','purchase receipt','material request','purchase invoice','quality inspection') NOT NULL DEFAULT 'lead',
  `sort_order` int(11) NOT NULL,
  `is_default` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`status_id`, `status_name`, `status_type`, `sort_order`, `is_default`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Closed', 'lead', 2, 0, 1, '0000-00-00 00:00:00', 0, '2018-08-01 17:41:38', 1),
(2, 'Open', 'lead', 1, 0, 1, '2018-05-31 12:21:33', 1, '2018-08-01 17:41:25', 1),
(6, 'Replied', 'lead', 3, 0, 1, '2018-05-31 12:40:43', 1, '2018-08-01 17:41:52', 1),
(8, 'Closed', 'sales order', 2, 0, 1, '2018-06-22 11:31:14', 1, '2018-08-01 17:42:28', 1),
(9, 'Replied', 'assets', 3, 0, 1, '2018-07-20 12:37:39', 1, '2018-08-01 17:46:44', 1),
(10, 'Closed', 'assets', 2, 0, 1, '2018-07-20 12:38:01', 1, '2018-08-01 17:46:30', 1),
(12, 'Open', 'assets', 1, 0, 1, '2018-07-21 11:05:46', 1, '2018-08-01 17:46:17', 1),
(13, 'Open', 'assets maintenance', 1, 0, 1, '2018-07-26 18:53:08', 1, '2018-08-01 17:47:03', 1),
(14, 'Closed', 'assets maintenance', 2, 0, 1, '2018-07-26 18:53:19', 1, '2018-08-01 17:47:15', 1),
(15, 'Open', 'sales invoice', 1, 0, 1, '2018-07-30 18:33:39', 1, '2018-08-01 17:42:17', 1),
(16, 'Replied', 'sales invoice', 3, 0, 1, '2018-07-30 18:33:50', 1, '2018-08-01 17:42:46', 1),
(17, 'Open', 'inquiry', 1, 0, 1, '2018-07-31 15:48:51', 1, '2018-08-01 15:18:29', 1),
(18, 'Closed', 'inquiry', 1, 0, 1, '2018-07-31 15:49:13', 1, '2018-08-01 15:18:40', 1),
(19, 'Replied', 'inquiry', 3, 0, 1, '2018-08-01 15:19:01', 1, '2018-08-01 15:19:01', 1),
(20, 'Open', 'supplier quotation', 1, 0, 1, '2018-08-01 17:43:17', 1, '2018-08-01 17:43:17', 1),
(21, 'Closed', 'supplier quotation', 2, 0, 1, '2018-08-01 17:43:32', 1, '2018-08-01 17:43:32', 1),
(22, 'Replied', 'supplier quotation', 3, 0, 1, '2018-08-01 17:43:46', 1, '2018-08-01 17:43:46', 1),
(23, 'Replied', 'assets maintenance', 3, 0, 1, '2018-08-01 17:47:33', 1, '2018-08-01 17:47:33', 1),
(24, 'Open', 'assets repair', 1, 0, 1, '2018-08-01 17:48:01', 1, '2018-08-01 17:48:01', 1),
(25, 'Closed', 'assets repair', 2, 0, 1, '2018-08-01 17:48:13', 1, '2018-08-01 17:48:13', 1),
(26, 'Replied', 'assets repair', 3, 0, 1, '2018-08-01 17:48:28', 1, '2018-08-01 17:48:28', 1),
(27, 'Open', 'sales order', 1, 0, 1, '2018-08-01 17:49:25', 1, '2018-08-01 17:49:25', 1),
(28, 'Replied', 'sales order', 3, 0, 1, '2018-08-01 17:49:52', 1, '2018-08-01 17:49:52', 1),
(29, 'Closed', 'sales invoice', 2, 0, 1, '2018-08-01 17:50:23', 1, '2018-08-01 17:50:23', 1),
(30, 'Open', 'request for quotation', 1, 0, 1, '2018-08-03 11:48:39', 1, '2018-08-03 11:48:39', 1),
(31, 'Closed', 'request for quotation', 2, 0, 1, '2018-08-03 11:48:56', 1, '2018-08-03 11:48:56', 1),
(32, 'Open', 'purchase receipt', 1, 0, 1, '2018-08-04 12:37:58', 1, '2018-08-04 12:37:58', 1),
(33, 'Closed', 'purchase receipt', 2, 0, 1, '2018-08-04 12:38:18', 1, '2018-08-04 12:38:18', 1),
(34, 'Open', 'material request', 1, 0, 1, '2018-08-04 12:55:44', 1, '2018-08-04 12:55:44', 1),
(35, 'Open', 'purchase invoice', 1, 0, 1, '2018-08-04 14:18:58', 1, '2018-08-04 14:18:58', 1),
(36, 'Closed', 'purchase invoice', 3, 1, 1, '2018-08-04 14:19:12', 1, '2018-08-04 14:19:12', 1),
(37, 'Open', 'quality inspection', 1, 0, 1, '2018-08-04 16:31:10', 1, '2018-08-04 16:31:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surname_master`
--

CREATE TABLE `tbl_surname_master` (
  `surname_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL,
  `surname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `created_by` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surname_master`
--

INSERT INTO `tbl_surname_master` (`surname_id`, `samaj_id`, `surname`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, '', 1, '2019-03-08 12:56:00', 1, '2019-03-08 12:56:00'),
(3, 1, '', 1, '2019-03-08 17:19:10', 1, '2019-03-08 17:19:10'),
(4, 1, '', 1, '2019-03-08 17:19:35', 1, '2019-03-08 17:19:35'),
(5, 1, '', 1, '2019-03-08 17:20:12', 1, '2019-03-08 17:20:12'),
(6, 1, '', 1, '2019-03-08 17:20:59', 1, '2019-03-08 17:20:59'),
(7, 1, '', 1, '2019-03-11 17:21:56', 1, '2019-03-11 17:21:56'),
(8, 1, '', 1, '2019-03-12 11:02:55', 1, '2019-03-12 11:02:55'),
(9, 2, '', 1, '2019-03-12 11:04:36', 1, '2019-03-12 11:04:36'),
(10, 3, '', 1, '2019-03-12 16:42:22', 1, '2019-03-12 16:42:22'),
(11, 3, '', 1, '2019-03-12 16:42:48', 1, '2019-03-12 16:42:48'),
(12, 1, '', 1, '2019-03-12 19:21:14', 1, '2019-03-12 19:21:14'),
(13, 2, '', 1, '2019-03-12 19:22:28', 1, '2019-03-12 19:22:28'),
(14, 1, '', 1, '2019-03-13 11:07:55', 1, '2019-03-13 11:07:55'),
(15, 1, '', 1, '2019-04-11 16:53:11', 1, '2019-04-11 16:53:11'),
(16, 1, '', 1, '2019-04-12 12:52:25', 1, '2019-04-12 12:52:25'),
(17, 2, '', 1, '2019-04-19 10:56:32', 1, '2019-04-19 10:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surname_master_description`
--

CREATE TABLE `tbl_surname_master_description` (
  `surname_description_id` int(11) NOT NULL,
  `surname_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surname_master_description`
--

INSERT INTO `tbl_surname_master_description` (`surname_description_id`, `surname_id`, `language_id`, `surname`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Digitattva', '2019-03-08 12:56:00', 1, '2019-03-08 12:56:00', 1),
(2, 1, 3, 'ડિજિટત્વ', '2019-03-08 12:56:00', 1, '2019-03-08 12:56:00', 1),
(3, 2, 1, 'Patel', '2019-03-08 05:18:49', 1, '2019-03-08 05:18:49', 1),
(4, 2, 3, 'Patel', '2019-03-08 05:18:49', 1, '2019-03-08 05:18:49', 1),
(5, 3, 1, 'Tailor', '2019-03-08 05:19:10', 1, '2019-03-08 05:19:10', 1),
(6, 3, 3, 'દરજી', '2019-03-08 05:19:10', 1, '2019-03-08 05:19:10', 1),
(7, 4, 1, 'Detroja', '2019-03-08 05:19:35', 1, '2019-03-08 05:19:35', 1),
(8, 4, 3, 'દેત્રોજા', '2019-03-08 05:19:35', 1, '2019-03-08 05:19:35', 1),
(9, 5, 1, 'Darbar', '2019-03-08 05:20:12', 1, '2019-03-08 05:20:12', 1),
(10, 5, 3, 'દરબાર', '2019-03-08 05:20:12', 1, '2019-03-08 05:20:12', 1),
(11, 6, 1, 'Shah', '2019-03-08 05:21:00', 1, '2019-03-08 05:21:00', 1),
(12, 6, 3, 'શાહ', '2019-03-08 05:21:00', 1, '2019-03-08 05:21:00', 1),
(13, 7, 1, 'Stave', '2019-03-11 05:21:56', 1, '2019-03-11 05:21:56', 1),
(14, 7, 3, 'સ્ટેવ', '2019-03-11 05:21:56', 1, '2019-03-11 05:21:56', 1),
(15, 8, 1, 'Desai', '2019-03-12 11:02:55', 1, '2019-03-12 11:02:55', 1),
(16, 8, 3, 'દેસાઈ', '2019-03-12 11:02:55', 1, '2019-03-12 11:02:55', 1),
(17, 9, 1, 'Khan', '2019-03-12 11:04:37', 1, '2019-03-12 11:04:37', 1),
(18, 9, 3, 'ખાન', '2019-03-12 11:04:37', 1, '2019-03-12 11:04:37', 1),
(19, 10, 1, 'Stave', '2019-03-12 04:42:22', 1, '2019-03-12 04:42:22', 1),
(20, 10, 3, 'સ્ટેવ', '2019-03-12 04:42:22', 1, '2019-03-12 04:42:22', 1),
(21, 11, 1, 'Michale', '2019-03-12 04:42:48', 1, '2019-03-12 04:42:48', 1),
(22, 11, 3, 'માઇકલ', '2019-03-12 04:42:48', 1, '2019-03-12 04:42:48', 1),
(23, 12, 1, 'Patel', '2019-03-12 07:21:14', 1, '2019-03-12 07:21:14', 1),
(24, 12, 3, 'પટેલ', '2019-03-12 07:21:14', 1, '2019-03-12 07:21:14', 1),
(25, 13, 1, 'Moulana', '2019-03-12 07:22:28', 1, '2019-03-12 07:22:28', 1),
(26, 13, 3, 'મૌલાના', '2019-03-12 07:22:28', 1, '2019-03-12 07:22:28', 1),
(27, 14, 1, 'Shah', '2019-03-13 11:07:55', 1, '2019-03-13 11:07:55', 1),
(28, 14, 3, 'શાહ', '2019-03-13 11:07:55', 1, '2019-03-13 11:07:55', 1),
(29, 15, 1, 'Prajapati', '2019-04-11 04:53:11', 1, '2019-04-11 04:53:11', 1),
(30, 15, 3, 'પ્રજાપતિ', '2019-04-11 04:53:11', 1, '2019-04-11 04:53:11', 1),
(31, 16, 1, 'Jain', '2019-04-12 12:52:25', 1, '2019-04-12 12:52:25', 1),
(32, 16, 3, 'જૈન', '2019-04-12 12:52:25', 1, '2019-04-12 12:52:25', 1),
(33, 17, 1, 'Mullana', '2019-04-19 10:56:32', 1, '2019-04-19 10:56:32', 1),
(34, 17, 3, 'મુલ્લાના', '2019-04-19 10:56:32', 1, '2019-04-19 10:56:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `node_id` int(11) NOT NULL,
  `cat_id` text NOT NULL,
  `login_token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `node_id`, `cat_id`, `login_token`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$YrafkUtdhP4vezTANE9JMOXDTXVD/Dsc6RadZLzRlX.tKsuVd9oUW', '', 'samaj@digitattva.com', '', 'k07g.MiBq11m9UY91FmwK.4cdd59ba50c521bc9f', 1530096689, 'z7YQ.Ll0SLquYdXEfGvU..', 1268889823, 1555926571, 1, 'Bhargav', 'Vashi', 'ADMIN', '9898098980', 0, '', '186ecba407614a599861a143837a4260'),
(3, '::1', 'nywotys@mailinator.com', '$2y$08$j1oFLgrXGwxVDkJ3gBwMpuHTZs7Qh76IltoWiIgsTSmuNTVurGARW', NULL, 'nywotys@mailinator.com', NULL, NULL, NULL, NULL, 1538660019, NULL, 1, 'Tatum', 'Oliver', NULL, '564654654654', 0, '', ''),
(4, '::1', 'digitattva123@digitattva.in', '$2y$08$ryca8i5r5PGOGIVJUFox5OfHZWRYE2bBQ8z5nirm0HiSErcSIhiCO', NULL, 'digitattva123@digitattva.in', NULL, NULL, NULL, NULL, 1552484944, 1552541373, 1, 'Digitattva', 'Technolabs', NULL, '1234567891', 0, '', '88a54cd3dd02d5507f635de8648b1f1f'),
(5, '::1', 'vijaydessai@gmail.com', '$2y$08$3yE4bCPz0zXYkX6SRFgv.uqHmsEwDELDDHUuIyJ./uuVRuR8PcyIm', NULL, 'vijaydessai@gmail.com', NULL, NULL, NULL, NULL, 1552916420, NULL, 1, 'Vijay', 'Sumit Bhai', NULL, '9714154356', 0, '', ''),
(6, '192.168.0.120', 'akki@gmail.com', '$2y$08$hNVHByTOrEcWqMHvAI.Cne3c0dU3l0q4D6aLl2iDddD7amTdf6Vd.', NULL, 'akki@gmail.com', NULL, NULL, NULL, NULL, 1552977566, NULL, 1, 'Akki', 'Rasik Bhai', NULL, '9714154356', 0, '', ''),
(13, '192.168.0.120', 'akki.54874@gmail.com', '$2y$08$AxdV/i1Xhy/92HZFiTjIzute3ooikcZu2fK9g4zyAptUN3BK617tW', NULL, 'akki.54874@gmail.com', NULL, NULL, NULL, NULL, 1555305355, NULL, 1, 'Akki', 'Rasik Bhai ', NULL, '9714154356', 0, '', ''),
(14, '192.168.0.121', 'harsh.lad@digitattva.com', '$2y$08$HMxepq1ITUm89GCU09QuQuGfvWej7yBvOAADXXVGyhpjAhRZu4QMC', NULL, 'harsh.lad@digitattva.com', NULL, NULL, NULL, NULL, 1555330651, NULL, 1, 'Harsh', 'Shailesh bhai', NULL, '9428277181', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users_company`
--

CREATE TABLE `tbl_users_company` (
  `users_company_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users_company`
--

INSERT INTO `tbl_users_company` (`users_company_id`, `users_id`, `company_id`) VALUES
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 2, 3),
(6, 2, 5),
(7, 3, 3),
(8, 3, 4),
(9, 3, 10),
(10, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users_groups`
--

CREATE TABLE `tbl_users_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` mediumint(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_users_groups`
--

INSERT INTO `tbl_users_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 1, 1),
(3, 1, 1),
(5, 1, 1),
(6, 3, 1),
(7, 1, 1),
(8, 1, 2),
(9, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users_samaj`
--

CREATE TABLE `tbl_users_samaj` (
  `users_samaj_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `samaj_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users_samaj`
--

INSERT INTO `tbl_users_samaj` (`users_samaj_id`, `users_id`, `samaj_id`) VALUES
(1, 4, 1),
(2, 5, 1),
(3, 6, 1),
(10, 13, 1),
(11, 14, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_activity_log`
--
ALTER TABLE `tbl_activity_log`
  ADD PRIMARY KEY (`activity_log_id`),
  ADD KEY `staffid` (`staff_id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `tbl_banner_description`
--
ALTER TABLE `tbl_banner_description`
  ADD PRIMARY KEY (`banner_description_id`);

--
-- Indexes for table `tbl_banner_file`
--
ALTER TABLE `tbl_banner_file`
  ADD PRIMARY KEY (`banner_file_id`);

--
-- Indexes for table `tbl_blood_groups`
--
ALTER TABLE `tbl_blood_groups`
  ADD PRIMARY KEY (`blood_group_id`);

--
-- Indexes for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `tbl_business`
--
ALTER TABLE `tbl_business`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `tbl_business_description`
--
ALTER TABLE `tbl_business_description`
  ADD PRIMARY KEY (`business_description_id`);

--
-- Indexes for table `tbl_business_email`
--
ALTER TABLE `tbl_business_email`
  ADD PRIMARY KEY (`business_email_id`);

--
-- Indexes for table `tbl_business_file`
--
ALTER TABLE `tbl_business_file`
  ADD PRIMARY KEY (`business_file_id`);

--
-- Indexes for table `tbl_business_mobile`
--
ALTER TABLE `tbl_business_mobile`
  ADD PRIMARY KEY (`business_mobile_id`);

--
-- Indexes for table `tbl_business_telephone`
--
ALTER TABLE `tbl_business_telephone`
  ADD PRIMARY KEY (`business_telephone_id`);

--
-- Indexes for table `tbl_business_types`
--
ALTER TABLE `tbl_business_types`
  ADD PRIMARY KEY (`business_type_id`);

--
-- Indexes for table `tbl_business_type_description`
--
ALTER TABLE `tbl_business_type_description`
  ADD PRIMARY KEY (`business_type_description_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_category_description`
--
ALTER TABLE `tbl_category_description`
  ADD PRIMARY KEY (`category_description_id`);

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_customer_group`
--
ALTER TABLE `tbl_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `tbl_device_info`
--
ALTER TABLE `tbl_device_info`
  ADD PRIMARY KEY (`device_info_id`);

--
-- Indexes for table `tbl_document`
--
ALTER TABLE `tbl_document`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `tbl_document_type`
--
ALTER TABLE `tbl_document_type`
  ADD PRIMARY KEY (`document_type_id`);

--
-- Indexes for table `tbl_education`
--
ALTER TABLE `tbl_education`
  ADD PRIMARY KEY (`education_id`);

--
-- Indexes for table `tbl_education_description`
--
ALTER TABLE `tbl_education_description`
  ADD PRIMARY KEY (`education_description_id`);

--
-- Indexes for table `tbl_email_template`
--
ALTER TABLE `tbl_email_template`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indexes for table `tbl_employee_type`
--
ALTER TABLE `tbl_employee_type`
  ADD PRIMARY KEY (`employee_type_id`);

--
-- Indexes for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `tbl_event_description`
--
ALTER TABLE `tbl_event_description`
  ADD PRIMARY KEY (`event_description_id`);

--
-- Indexes for table `tbl_event_file`
--
ALTER TABLE `tbl_event_file`
  ADD PRIMARY KEY (`event_file_id`);

--
-- Indexes for table `tbl_event_rsvp`
--
ALTER TABLE `tbl_event_rsvp`
  ADD PRIMARY KEY (`event_rsvp_id`);

--
-- Indexes for table `tbl_gallerys`
--
ALTER TABLE `tbl_gallerys`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `tbl_gallery_description`
--
ALTER TABLE `tbl_gallery_description`
  ADD PRIMARY KEY (`gallery_description_id`);

--
-- Indexes for table `tbl_gallery_file`
--
ALTER TABLE `tbl_gallery_file`
  ADD PRIMARY KEY (`gallery_file_id`);

--
-- Indexes for table `tbl_gender`
--
ALTER TABLE `tbl_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `tbl_gender_description`
--
ALTER TABLE `tbl_gender_description`
  ADD PRIMARY KEY (`gender_description_id`);

--
-- Indexes for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_industry_type`
--
ALTER TABLE `tbl_industry_type`
  ADD PRIMARY KEY (`industry_type_id`);

--
-- Indexes for table `tbl_language_master`
--
ALTER TABLE `tbl_language_master`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `tbl_login_attempts`
--
ALTER TABLE `tbl_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_log_email`
--
ALTER TABLE `tbl_log_email`
  ADD PRIMARY KEY (`log_email_id`);

--
-- Indexes for table `tbl_marital_status`
--
ALTER TABLE `tbl_marital_status`
  ADD PRIMARY KEY (`marital_status_id`);

--
-- Indexes for table `tbl_marital_status_description`
--
ALTER TABLE `tbl_marital_status_description`
  ADD PRIMARY KEY (`marital_status_description_id`);

--
-- Indexes for table `tbl_market_segment`
--
ALTER TABLE `tbl_market_segment`
  ADD PRIMARY KEY (`market_segment_id`);

--
-- Indexes for table `tbl_members`
--
ALTER TABLE `tbl_members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `tbl_member_biodata_file`
--
ALTER TABLE `tbl_member_biodata_file`
  ADD PRIMARY KEY (`member_biodata_file_id`);

--
-- Indexes for table `tbl_member_description`
--
ALTER TABLE `tbl_member_description`
  ADD PRIMARY KEY (`member_description_id`);

--
-- Indexes for table `tbl_member_file`
--
ALTER TABLE `tbl_member_file`
  ADD PRIMARY KEY (`member_file_id`);

--
-- Indexes for table `tbl_member_marital_status`
--
ALTER TABLE `tbl_member_marital_status`
  ADD PRIMARY KEY (`marital_status_id`);

--
-- Indexes for table `tbl_member_mobile`
--
ALTER TABLE `tbl_member_mobile`
  ADD PRIMARY KEY (`member_mobile_id`);

--
-- Indexes for table `tbl_monk`
--
ALTER TABLE `tbl_monk`
  ADD PRIMARY KEY (`monk_id`);

--
-- Indexes for table `tbl_monk_description`
--
ALTER TABLE `tbl_monk_description`
  ADD PRIMARY KEY (`monk_description_id`);

--
-- Indexes for table `tbl_monk_location`
--
ALTER TABLE `tbl_monk_location`
  ADD PRIMARY KEY (`monk_location_id`);

--
-- Indexes for table `tbl_native`
--
ALTER TABLE `tbl_native`
  ADD PRIMARY KEY (`native_id`);

--
-- Indexes for table `tbl_native_location`
--
ALTER TABLE `tbl_native_location`
  ADD PRIMARY KEY (`native_location_id`);

--
-- Indexes for table `tbl_notification_schedule_mapper`
--
ALTER TABLE `tbl_notification_schedule_mapper`
  ADD PRIMARY KEY (`notification_schedule_id`);

--
-- Indexes for table `tbl_pachkhan`
--
ALTER TABLE `tbl_pachkhan`
  ADD PRIMARY KEY (`pachkhan_id`);

--
-- Indexes for table `tbl_pachkhan_description`
--
ALTER TABLE `tbl_pachkhan_description`
  ADD PRIMARY KEY (`pachkhan_description_id`);

--
-- Indexes for table `tbl_pages`
--
ALTER TABLE `tbl_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `tbl_page_description`
--
ALTER TABLE `tbl_page_description`
  ADD PRIMARY KEY (`page_description_id`);

--
-- Indexes for table `tbl_password_reset`
--
ALTER TABLE `tbl_password_reset`
  ADD PRIMARY KEY (`password_reset_id`);

--
-- Indexes for table `tbl_polls`
--
ALTER TABLE `tbl_polls`
  ADD PRIMARY KEY (`poll_id`);

--
-- Indexes for table `tbl_poll_description`
--
ALTER TABLE `tbl_poll_description`
  ADD PRIMARY KEY (`poll_description_id`);

--
-- Indexes for table `tbl_poll_value`
--
ALTER TABLE `tbl_poll_value`
  ADD PRIMARY KEY (`poll_value_id`);

--
-- Indexes for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbl_post_category`
--
ALTER TABLE `tbl_post_category`
  ADD PRIMARY KEY (`post_category_id`);

--
-- Indexes for table `tbl_post_description`
--
ALTER TABLE `tbl_post_description`
  ADD PRIMARY KEY (`post_description_id`);

--
-- Indexes for table `tbl_post_file`
--
ALTER TABLE `tbl_post_file`
  ADD PRIMARY KEY (`post_file_id`);

--
-- Indexes for table `tbl_post_likes`
--
ALTER TABLE `tbl_post_likes`
  ADD PRIMARY KEY (`post_likes_id`);

--
-- Indexes for table `tbl_push_notification_master`
--
ALTER TABLE `tbl_push_notification_master`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `tbl_relationship_master`
--
ALTER TABLE `tbl_relationship_master`
  ADD PRIMARY KEY (`relationship_master_id`);

--
-- Indexes for table `tbl_samaj`
--
ALTER TABLE `tbl_samaj`
  ADD PRIMARY KEY (`samaj_id`);

--
-- Indexes for table `tbl_samaj_contact`
--
ALTER TABLE `tbl_samaj_contact`
  ADD PRIMARY KEY (`samaj_contact_id`);

--
-- Indexes for table `tbl_samaj_description`
--
ALTER TABLE `tbl_samaj_description`
  ADD PRIMARY KEY (`samaj_description_id`);

--
-- Indexes for table `tbl_sessions`
--
ALTER TABLE `tbl_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tbl_source`
--
ALTER TABLE `tbl_source`
  ADD PRIMARY KEY (`source_id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tbl_surname_master`
--
ALTER TABLE `tbl_surname_master`
  ADD PRIMARY KEY (`surname_id`);

--
-- Indexes for table `tbl_surname_master_description`
--
ALTER TABLE `tbl_surname_master_description`
  ADD PRIMARY KEY (`surname_description_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users_company`
--
ALTER TABLE `tbl_users_company`
  ADD PRIMARY KEY (`users_company_id`);

--
-- Indexes for table `tbl_users_groups`
--
ALTER TABLE `tbl_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `tbl_users_samaj`
--
ALTER TABLE `tbl_users_samaj`
  ADD PRIMARY KEY (`users_samaj_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_activity_log`
--
ALTER TABLE `tbl_activity_log`
  MODIFY `activity_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_banner_description`
--
ALTER TABLE `tbl_banner_description`
  MODIFY `banner_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_banner_file`
--
ALTER TABLE `tbl_banner_file`
  MODIFY `banner_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_blood_groups`
--
ALTER TABLE `tbl_blood_groups`
  MODIFY `blood_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_business`
--
ALTER TABLE `tbl_business`
  MODIFY `business_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_business_description`
--
ALTER TABLE `tbl_business_description`
  MODIFY `business_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_business_email`
--
ALTER TABLE `tbl_business_email`
  MODIFY `business_email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_business_file`
--
ALTER TABLE `tbl_business_file`
  MODIFY `business_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_business_mobile`
--
ALTER TABLE `tbl_business_mobile`
  MODIFY `business_mobile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_business_telephone`
--
ALTER TABLE `tbl_business_telephone`
  MODIFY `business_telephone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_business_types`
--
ALTER TABLE `tbl_business_types`
  MODIFY `business_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_business_type_description`
--
ALTER TABLE `tbl_business_type_description`
  MODIFY `business_type_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_category_description`
--
ALTER TABLE `tbl_category_description`
  MODIFY `category_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6180;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_customer_group`
--
ALTER TABLE `tbl_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_device_info`
--
ALTER TABLE `tbl_device_info`
  MODIFY `device_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_document`
--
ALTER TABLE `tbl_document`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_document_type`
--
ALTER TABLE `tbl_document_type`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_education`
--
ALTER TABLE `tbl_education`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_education_description`
--
ALTER TABLE `tbl_education_description`
  MODIFY `education_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_email_template`
--
ALTER TABLE `tbl_email_template`
  MODIFY `email_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_employee_type`
--
ALTER TABLE `tbl_employee_type`
  MODIFY `employee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_event_description`
--
ALTER TABLE `tbl_event_description`
  MODIFY `event_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_event_file`
--
ALTER TABLE `tbl_event_file`
  MODIFY `event_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_event_rsvp`
--
ALTER TABLE `tbl_event_rsvp`
  MODIFY `event_rsvp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_gallerys`
--
ALTER TABLE `tbl_gallerys`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_gallery_description`
--
ALTER TABLE `tbl_gallery_description`
  MODIFY `gallery_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_gallery_file`
--
ALTER TABLE `tbl_gallery_file`
  MODIFY `gallery_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_gender`
--
ALTER TABLE `tbl_gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_gender_description`
--
ALTER TABLE `tbl_gender_description`
  MODIFY `gender_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_industry_type`
--
ALTER TABLE `tbl_industry_type`
  MODIFY `industry_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_language_master`
--
ALTER TABLE `tbl_language_master`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_login_attempts`
--
ALTER TABLE `tbl_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_log_email`
--
ALTER TABLE `tbl_log_email`
  MODIFY `log_email_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_marital_status`
--
ALTER TABLE `tbl_marital_status`
  MODIFY `marital_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_marital_status_description`
--
ALTER TABLE `tbl_marital_status_description`
  MODIFY `marital_status_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_market_segment`
--
ALTER TABLE `tbl_market_segment`
  MODIFY `market_segment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_members`
--
ALTER TABLE `tbl_members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_member_biodata_file`
--
ALTER TABLE `tbl_member_biodata_file`
  MODIFY `member_biodata_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_member_description`
--
ALTER TABLE `tbl_member_description`
  MODIFY `member_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tbl_member_file`
--
ALTER TABLE `tbl_member_file`
  MODIFY `member_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_member_marital_status`
--
ALTER TABLE `tbl_member_marital_status`
  MODIFY `marital_status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_member_mobile`
--
ALTER TABLE `tbl_member_mobile`
  MODIFY `member_mobile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_monk`
--
ALTER TABLE `tbl_monk`
  MODIFY `monk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_monk_description`
--
ALTER TABLE `tbl_monk_description`
  MODIFY `monk_description_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_monk_location`
--
ALTER TABLE `tbl_monk_location`
  MODIFY `monk_location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_native`
--
ALTER TABLE `tbl_native`
  MODIFY `native_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_native_location`
--
ALTER TABLE `tbl_native_location`
  MODIFY `native_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_notification_schedule_mapper`
--
ALTER TABLE `tbl_notification_schedule_mapper`
  MODIFY `notification_schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pachkhan`
--
ALTER TABLE `tbl_pachkhan`
  MODIFY `pachkhan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pachkhan_description`
--
ALTER TABLE `tbl_pachkhan_description`
  MODIFY `pachkhan_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_pages`
--
ALTER TABLE `tbl_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_page_description`
--
ALTER TABLE `tbl_page_description`
  MODIFY `page_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_password_reset`
--
ALTER TABLE `tbl_password_reset`
  MODIFY `password_reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_polls`
--
ALTER TABLE `tbl_polls`
  MODIFY `poll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_poll_description`
--
ALTER TABLE `tbl_poll_description`
  MODIFY `poll_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_poll_value`
--
ALTER TABLE `tbl_poll_value`
  MODIFY `poll_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `tbl_post_category`
--
ALTER TABLE `tbl_post_category`
  MODIFY `post_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `tbl_post_description`
--
ALTER TABLE `tbl_post_description`
  MODIFY `post_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `tbl_post_file`
--
ALTER TABLE `tbl_post_file`
  MODIFY `post_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tbl_post_likes`
--
ALTER TABLE `tbl_post_likes`
  MODIFY `post_likes_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_push_notification_master`
--
ALTER TABLE `tbl_push_notification_master`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_relationship_master`
--
ALTER TABLE `tbl_relationship_master`
  MODIFY `relationship_master_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_samaj`
--
ALTER TABLE `tbl_samaj`
  MODIFY `samaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_samaj_contact`
--
ALTER TABLE `tbl_samaj_contact`
  MODIFY `samaj_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_samaj_description`
--
ALTER TABLE `tbl_samaj_description`
  MODIFY `samaj_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_source`
--
ALTER TABLE `tbl_source`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1653;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_surname_master`
--
ALTER TABLE `tbl_surname_master`
  MODIFY `surname_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_surname_master_description`
--
ALTER TABLE `tbl_surname_master_description`
  MODIFY `surname_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_users_company`
--
ALTER TABLE `tbl_users_company`
  MODIFY `users_company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_users_groups`
--
ALTER TABLE `tbl_users_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_users_samaj`
--
ALTER TABLE `tbl_users_samaj`
  MODIFY `users_samaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
