-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 05. Dez 2024 um 13:54
-- Server-Version: 5.7.39
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pandoc`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name_de` varchar(50) NOT NULL,
  `name_fr` varchar(255) DEFAULT NULL,
  `name_it` varchar(255) DEFAULT NULL,
  `description_de` text,
  `description_fr` text,
  `description_it` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_activ` tinyint(1) NOT NULL DEFAULT '1',
  `access_role` enum('all','user','moderator','admin') NOT NULL DEFAULT 'all'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `name_de`, `name_fr`, `name_it`, `description_de`, `description_fr`, `description_it`, `is_active`, `is_activ`, `access_role`) VALUES
(1, 'Erfahrung', 'Expérience', 'Esperienza', NULL, NULL, NULL, 1, 1, 'all'),
(2, 'Suche TherapeutIn', 'Recherche d\'un thérapeute', 'Cercare un terapeuta', NULL, NULL, NULL, 1, 1, 'all'),
(3, 'Gedanken', 'Pensées', 'Pensieri', NULL, NULL, NULL, 1, 1, 'all'),
(4, 'Rant', 'Rant', 'Rant', NULL, NULL, NULL, 1, 1, 'all'),
(8, 'Ressourcen', 'Ressources', 'Risorse', 'adasdfadsf', 'sdf', 'sdfg', 1, 1, 'all');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`) VALUES
(1, 21, NULL, 'BBBBBBBBBB', '2024-07-02 21:34:31'),
(2, 21, 3, 'sdfasdfsa', '2024-07-03 12:08:00'),
(3, 21, 3, 'Das ist ein ganz neuer Kommentar!!!', '2024-07-03 12:41:35'),
(4, 14, 3, 'Hallo?', '2024-07-03 14:51:11'),
(5, 18, 3, 'You can submit your Kirby-made sites here to share them with other users and make it easier for us to select new entries for the showcase on the website. We can\'t wait to see your submissions!!', '2024-07-03 15:19:00'),
(6, 40, NULL, 'asdfasdf', '2024-07-04 16:27:05'),
(7, 40, NULL, 'asdfasdf', '2024-07-04 16:27:12'),
(8, 40, NULL, 'asdfadsf', '2024-07-04 16:27:20'),
(9, 40, NULL, 'asdfadsf', '2024-07-04 16:27:27'),
(10, 21, NULL, 'Noch ein Kommi', '2024-07-04 16:27:42'),
(11, 39, NULL, 'kjnälälnälknälknälkälknälknälknläknälkn', '2024-07-05 20:03:38'),
(12, 39, NULL, 'öbökhvljhvljhvöjhv', '2024-07-05 20:03:54'),
(13, 40, 3, '.kjbökjbökj', '2024-07-05 20:04:25'),
(14, 47, 3, 'Kommentare funktionieren auch?\r\n', '2024-08-02 08:19:08'),
(15, 47, 3, 'Noch einer...', '2024-08-05 17:49:37'),
(16, 53, 4, 'In zwei Kantonen – Glarus und Appenzell Innerrhoden – erlässt das Volk die kantonalen Gesetze an einer Versammlung aller Bürger, der Landsgemeinde. Im Kanton Appenzell Innerrhoden werden an der Landsgemeinde überdies die Mitglieder der kantonalen Regierung und der kantonalen Gerichte gewählt. In allen anderen Kantonen finden Wahlen und Abstimmungen an der Urne statt.[2]', '2024-08-07 16:08:54'),
(17, 53, 4, 'Quickly manage the layout, alignment, and sizing of grid columns, navigation, components, and more with a full suite of responsive flexbox utilities. For more complex implementations, custom CSS may be necessary.', '2024-08-07 21:11:31'),
(18, 55, 4, 'Eine Antwort...', '2024-08-07 21:16:01'),
(19, 52, 3, 'yvvdfsbsdfb', '2024-08-10 21:06:56'),
(20, 58, 3, 'Realistische Aquarellpinsel für Procreate. Aquarellpinsel für Ipad Procreate. Brush & Canvas Set für Ipad. Digital Pinsel Set', '2024-09-06 18:11:10'),
(21, 54, 3, 'Da die Platoniker Platon überschwänglich verehrten, wurden über sein Leben zahlreiche teils phantastische Anekdoten und Legenden verbreitet, die oft seiner Verherrlichung dienten.[2] Es wurde sogar behauptet, er sei ein Sohn des Gottes Apollon, sein leiblicher Vater sei nur sein Stiefvater gewesen.[3] Daneben gab es aber auch Geschichten, die seine Verspottung und Diffamierung bezweckten.[4] Daher ist die historische Wahrheit schwer zu ermitteln. Eine Hauptquelle ist Platons Siebter Brief, der heute überwiegend für echt gehalten wird und auch im Fall seiner Unechtheit als wertvolle zeitgenössische Quelle anzusehen wäre.', '2024-09-22 19:55:43'),
(22, 89, 6, 'Eine Antwort', '2024-09-29 16:26:15'),
(23, 89, 6, 'Zweite Antwort\r\n', '2024-09-29 16:26:36'),
(24, 101, 6, 'Gehen Kommentare noch??', '2024-10-08 18:23:38'),
(25, 101, 6, 'Gehen Kommentare noch??', '2024-10-08 18:24:36'),
(26, 98, 6, 'Gehen Kommentare noch???', '2024-10-08 18:30:09'),
(27, 100, 6, 'Kein Kommentar.', '2024-10-08 18:32:44'),
(28, 108, 4, 'Blabala antowrten', '2024-10-14 11:36:49'),
(29, 114, 6, 'Funktioniert die Kommentarfunktion noch???\r\n', '2024-10-19 18:49:12'),
(30, 112, 3, 'fsdfsdfasdf', '2024-10-25 15:22:18'),
(31, 86, 6, 'dfghdfghdgf', '2024-10-25 15:23:31'),
(32, 114, NULL, 'Fkfjkxjkk', '2024-11-30 21:28:49'),
(33, 114, NULL, 'Jigu', '2024-11-30 21:29:34'),
(34, 124, 6, 'Kckkxj', '2024-11-30 21:30:26'),
(35, 124, 6, 'Wo ist der Kommi?', '2024-11-30 21:35:02');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `name_de` varchar(255) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `name_it` varchar(255) NOT NULL,
  `description_de` text,
  `description_fr` text,
  `description_it` text,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `designations`
--

INSERT INTO `designations` (`id`, `name_de`, `name_fr`, `name_it`, `description_de`, `description_fr`, `description_it`, `is_active`) VALUES
(17, 'Berater', 'Conseiller', 'Consulente', NULL, NULL, NULL, 1),
(18, 'Psychologe*', 'Psychologue', 'Psicologo*', NULL, NULL, NULL, 1),
(19, 'Psychiaterin', 'Psychiatre', 'Psichiatra', NULL, NULL, NULL, 1),
(20, 'Pfleger*', 'Infirmier*', 'Infermiere*', NULL, NULL, NULL, 1),
(21, 'Coach', 'Coach', 'Coach', NULL, NULL, NULL, 1),
(22, 'Psychotherapeut', 'Psychothérapeute', 'Psicoterapeuta', NULL, NULL, NULL, 1),
(23, 'Sozialarbeiter*', 'Assistant social*', 'Assistente sociale', NULL, NULL, NULL, 1),
(24, 'Klinik', 'Clinique', 'Clinica', NULL, NULL, NULL, 1),
(25, 'Tagesklinik', 'Clinique de jour', 'Clinica diurna', NULL, NULL, NULL, 1),
(27, 'Tagesstruktur', 'Structure de jour', 'Struttura diurna', NULL, NULL, NULL, 1),
(28, 'Beraterin', 'Conseillère', '', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `post_messages_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `content`, `created_at`, `is_read`, `post_messages_id`) VALUES
(1, 4, 3, 'Testmessage', '2024-08-01 19:13:01', 1, NULL),
(2, 3, 4, 'Dein Beitrag wurde geblockt...', '2024-09-17 15:04:30', 1, NULL),
(3, 4, 4, 'War es Samstag?', '2024-09-17 18:23:40', 1, NULL),
(4, 6, 3, 'asdasdf', '2024-10-07 15:35:33', 1, NULL),
(5, 6, 3, 'Hallo', '2024-10-12 19:24:07', 1, NULL),
(6, 6, 3, 'Hallo', '2024-10-12 19:24:09', 1, NULL),
(7, 6, 3, 'Hallo', '2024-10-12 19:25:12', 1, NULL),
(8, 4, 3, 'Blaubal', '2024-10-12 19:33:04', 1, NULL),
(9, 3, 4, 'Heihei', '2024-10-12 19:42:05', 1, NULL),
(10, 4, 3, 'Bist du da?', '2024-10-12 21:01:17', 1, NULL),
(11, 4, 3, 'Testmessage without asda', '2024-10-12 21:54:06', 1, NULL),
(12, 4, 3, 'sdfsdf', '2024-10-13 12:26:32', 1, NULL),
(13, 4, 3, 'Geht es?', '2024-10-13 12:28:15', 1, NULL),
(14, 4, 3, 'Yes', '2024-10-13 13:08:49', 1, NULL),
(15, 4, 3, 'Nachmittag', '2024-10-13 15:10:35', 1, NULL),
(16, 4, 3, 'asdfsdf', '2024-10-13 15:22:58', 1, NULL),
(17, 4, 3, 'jd lqjhdlkahsldkhalskdfhalsdhf lakshdfljahsldfjha sdjhfalshdfasdhflajsdhflajksf ahjsdfs flkashd flajsdlfjha sljd falsdhf laslfkjhas lfd', '2024-10-13 20:32:08', 1, NULL),
(18, 4, 3, 'jhalsdf kljashf dlhslfdjhals fdh alkjshf lkajhs dlfkjhalskjdhf lakjhsdfl kahs', '2024-10-13 20:32:20', 1, NULL),
(19, 4, 3, 'It starts', '2024-10-13 20:40:15', 1, NULL),
(20, 4, 3, 'aas', '2024-10-14 08:57:13', 1, NULL),
(21, 4, 1, 'Test...', '2024-10-14 09:12:14', 0, NULL),
(22, 4, 1, 'Nochmal', '2024-10-14 14:32:10', 0, NULL),
(23, 4, 1, 'Blob', '2024-10-14 14:39:16', 0, NULL),
(24, 6, 3, 'Das geht', '2024-10-14 14:40:31', 1, NULL),
(27, 6, 3, 'Alles noch da?', '2024-10-14 14:59:20', 1, NULL),
(36, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"Ein Post mit einer Psychiaterin\" vom 23.09.2024 22:27:\n', '2024-10-23 18:56:56', 0, 86),
(37, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"Für meinen Sohn 18, Depressionen, suche ich einen Therapeuten im Raum Luzern\" vom 06.09.2024 18:10:\n', '2024-10-23 19:12:17', 0, 58),
(38, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"Neuer post mit neuem formulr\" vom 23.09.2024 17:47:\n', '2024-10-23 19:13:22', 0, 80),
(42, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"Eine Empfehlung von Herzen für Frau...\" vom 25.09.2024 14:36:\n', '2024-10-23 19:34:06', 0, 87),
(43, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"Eine Empfehlung von Herzen für Frau...\" vom 25.09.2024 14:36:\n', '2024-10-23 19:36:13', 0, 87),
(45, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"Ein Post mit einer Psychiaterin\" vom 23.09.2024 22:27:\n', '2024-10-23 19:47:31', 0, 86),
(46, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=60\">Im Raum Graubünden</a>\" vom 14.09.2024 15:47:', '2024-10-23 19:49:57', 1, 60),
(69, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"Meine Gedanken zum Reflexion versus Handeln\" vom 17.09.2024 16:50:', '2024-10-24 18:56:49', 1, NULL),
(73, 6, 3, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=82\" target=\"_blank\">Was habt Ihr mit ihr erlebt?</a>\" vom 23.09.2024 18:08:', '2024-10-25 12:18:26', 1, NULL),
(74, 3, 4, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=53\" target=\"_blank\">Erlebnis von letztem Mittwoch</a>\" vom 07.08.2024 15:18:', '2024-10-25 12:32:45', 1, NULL),
(75, 3, 58, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=53\" target=\"_blank\">Erlebnis von letztem Mittwoch</a>\" vom 07.08.2024 15:18:', '2024-10-25 12:38:24', 0, NULL),
(77, 6, 6, 'gfedfg', '2024-10-25 12:45:33', 1, NULL),
(79, 6, 6, 'sfsdfsd', '2024-10-25 13:19:16', 1, NULL),
(85, 6, 6, 'sdf', '2024-10-25 19:47:47', 1, NULL),
(90, 6, 6, 'Testnachrichtlang', '2024-10-25 20:16:26', 1, NULL),
(91, 6, 6, 'Testnachrichtlang', '2024-10-25 20:16:29', 1, NULL),
(113, 6, 6, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=53\" target=\"_blank\">Erlebnis von letztem Mittwoch</a>\" vom 07.08.2024 15:18:', '2024-10-26 14:38:10', 1, NULL),
(114, 6, 6, 'sdfdf', '2024-10-26 14:45:05', 1, NULL),
(115, 6, 6, 'sdf', '2024-10-26 14:59:30', 1, NULL),
(116, 6, 6, 'sdf', '2024-10-26 15:01:02', 1, NULL),
(117, 6, 6, 'adasd', '2024-10-26 15:10:36', 1, NULL),
(118, 6, 6, 'mm', '2024-10-26 15:10:38', 1, NULL),
(119, 6, 4, '', '2024-10-26 15:10:54', 1, NULL),
(120, 6, 4, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=54\" target=\"_blank\">KGV was ist eure Erfahrung?</a>\" vom 07.08.2024 17:25:', '2024-10-26 15:11:01', 1, NULL),
(122, 3, 2, '', '2024-10-26 15:15:28', 1, NULL),
(123, 3, 2, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=5\" target=\"_blank\">dfgdfg</a>\" vom 02.07.2024 16:13:', '2024-10-26 15:15:35', 0, NULL),
(124, 3, 4, 'ddhdghghdhdfgdfhg', '2024-10-26 15:16:19', 1, NULL),
(125, 3, 6, 'Bezugnehmend auf Ihren Beitrag \"<a href=\"post.php?id=108\" target=\"_blank\">Der Berater</a>\" vom 10.10.2024 20:46:', '2024-10-26 15:19:20', 1, NULL),
(126, 3, 6, '\"<a href=\"post.php?id=99\" target=\"_blank\">Ein Rant aus Schaffhausen</a>\" from 07.10.2024 17:34:', '2024-10-26 15:21:03', 1, NULL),
(127, 3, 6, '\"<a href=\"post.php?id=115\" target=\"_blank\">Zuroberst?</a>\" from 19.10.2024 20:29', '2024-10-26 15:21:34', 1, NULL),
(128, 6, 4, 'sdfsdfsaasdfda', '2024-10-26 16:56:53', 1, NULL),
(129, 6, 3, 'Hallo.', '2024-11-14 20:52:34', 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT 'No Title',
  `content` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_id` int(11) DEFAULT NULL,
  `canton` varchar(2) NOT NULL,
  `therapist` varchar(255) DEFAULT NULL,
  `designation` varchar(50) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `is_deactivated` tinyint(1) DEFAULT '0',
  `therapist_id` int(11) DEFAULT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `content`, `created_at`, `updated_at`, `parent_id`, `canton`, `therapist`, `designation`, `tags`, `is_published`, `is_active`, `is_banned`, `is_deactivated`, `therapist_id`, `sticky`) VALUES
(5, 2, 2, 'dfgdfg', 'dfgd', '2024-07-02 16:13:15', '2024-09-17 20:20:18', NULL, '', NULL, '', NULL, 1, 1, 0, 0, NULL, 0),
(8, 2, 2, 'asdfs', 'sdfgsdf', '2024-07-02 16:16:05', '2024-07-02 17:13:54', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(9, 2, 2, 'asdfs', 'sdfgsdf', '2024-07-02 16:16:08', '2024-07-02 17:13:54', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(10, 2, 2, 'sdfg', 'sdfgsd', '2024-07-02 16:31:03', '2024-07-02 17:13:54', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(11, 2, 2, 'sdfgdf', 'dfg', '2024-07-02 16:31:11', '2024-07-02 17:13:54', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(12, 2, 2, 'sdfgdf', 'dfg', '2024-07-02 16:31:18', '2024-07-02 17:13:54', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(13, 1, 1, 'Test Title', 'Test Content', '2024-07-02 16:32:35', '2024-09-17 16:18:27', NULL, '', NULL, '', NULL, 0, 0, 1, 0, NULL, 0),
(14, 2, 2, 'weg', 'sdfg', '2024-07-02 16:32:35', '2024-09-17 11:45:15', NULL, '', NULL, '', NULL, 1, 1, 0, 0, NULL, 0),
(15, 1, 1, 'Test Title', 'Test Content', '2024-07-02 16:32:58', '2024-07-02 16:32:58', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(16, 1, 1, 'Test Title', 'Test Content', '2024-07-02 16:54:41', '2024-07-02 16:54:41', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(17, 2, 2, 'Posta', 'Test von mir', '2024-07-02 16:54:41', '2024-09-17 12:13:55', NULL, '', NULL, '', NULL, 1, 1, 0, 0, NULL, 0),
(18, 2, 2, 'sdfg', 'Testasdfasdf', '2024-07-02 16:55:49', '2024-07-02 17:13:54', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(19, 2, 2, 'Therapeut', 'Was ist das ?', '2024-07-02 17:12:04', '2024-07-02 17:13:54', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(20, 2, 3, 'Meldung', 'Textmeldung', '2024-07-02 17:15:58', '2024-07-02 17:15:58', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(21, 3, 2, 'Mit Klaus?! Ja', 'asdasdva Alles ist gut', '2024-07-02 20:15:42', '2024-07-03 12:08:49', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(24, 3, NULL, 'No Title', 'asdfasdfad', '2024-07-02 21:02:00', '2024-07-02 21:02:00', 23, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(25, 3, NULL, 'No Title', 'xxxxx', '2024-07-02 21:02:07', '2024-07-02 21:02:07', 24, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(26, 3, NULL, 'No Title', 'sssädflnsä', '2024-07-02 21:02:23', '2024-07-02 21:02:34', 24, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(27, 3, NULL, 'No Title', 'dgsdhdfghd', '2024-07-02 21:09:51', '2024-07-02 21:09:51', 26, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(28, 3, NULL, 'No Title', 'dfgdfgh', '2024-07-02 21:09:55', '2024-07-02 21:09:55', 26, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(29, 3, NULL, 'No Title', 'asdfasf kjösjgdsd', '2024-07-02 21:25:10', '2024-07-02 21:25:10', 16, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(30, 3, NULL, 'No Title', 'Therapeut?', '2024-07-02 21:25:34', '2024-07-02 21:25:34', 19, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(31, 3, NULL, 'No Title', 'BBBBBBBBBBBBB', '2024-07-02 21:26:03', '2024-07-02 21:26:03', 22, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(32, NULL, NULL, 'No Title', 'sfasdfasdfasdfasd\r\nBABABABABAB', '2024-07-02 21:29:01', '2024-07-02 21:29:01', 20, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(33, NULL, NULL, 'No Title', 'asdf', '2024-07-02 21:29:32', '2024-07-02 21:29:32', 20, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(34, NULL, NULL, 'No Title', 'WASTATA', '2024-07-02 21:32:45', '2024-07-02 21:32:45', 20, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(35, 3, 3, 'Mittwochspost', 'Blablbaalsfsdg sd', '2024-07-03 12:42:16', '2024-07-03 12:42:16', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(36, 3, 1, 'Text', 'Also, I’ve put together a video demonstrating the basics of the program using a pre-made preset for guidance:\r\n\r\nhttps://vimeo.com/822621794\r\n\r\nThe program is completely free to use and experiment with. The only limitation of the tool is the ability to export graphics in different sizes, which can be unlocked by purchasing a license key.', '2024-07-03 15:03:04', '2024-07-03 15:03:04', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(37, 3, NULL, 'Lokaler Post', 'Arzt in Basel', '2024-07-04 11:08:12', '2024-07-04 11:08:12', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(38, 3, 4, 'Basel 2 ', 'asdsdvasdv', '2024-07-04 11:11:18', '2024-07-04 11:11:18', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(39, 3, 4, 'Arzt in Basel?', 'Blablalanasf', '2024-07-04 11:47:38', '2024-07-04 11:47:38', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(40, 3, 4, 'sdfsd', 'sdfgsdf.kjbökj', '2024-07-04 11:57:01', '2024-07-05 20:04:21', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(41, 3, 3, 'Font', 'Aufgrund der Vielzahl der verfügbaren Schriften musst Du allerdings eine Auswahl treffen und entscheiden. Daher wollen wir Dir in diesem Artikel einige der Google Schriften vorstellen, die sich hervorragend dafür eignen, starke Überschriften prominent abzubilden.', '2024-07-05 20:17:22', '2024-07-05 20:17:22', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(42, 3, 1, 'TEST schmal', 'södf aäsdljfaäls dfäasd ', '2024-07-05 21:29:35', '2024-07-05 21:29:35', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(43, NULL, 2, 'Dr. Max', 'JHvlajhsökajsdäajkbsdvasd', '2024-07-12 16:00:09', '2024-07-12 16:00:09', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(44, NULL, 1, 'BBBB', 'sdcysdvasd', '2024-07-12 16:00:37', '2024-07-12 16:00:37', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(45, 3, 2, 'Dr. Max', 'So blabal sdlfjö sgsöidg äsidflg sfdg', '2024-07-12 16:01:57', '2024-07-12 16:01:57', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(46, 4, 3, 'Eine Meldung von Flux', 'Blablab und so', '2024-08-01 21:05:24', '2024-08-01 21:05:24', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(47, 3, 1, 'Funktioniert alles noch?', 'Ja, jetzt wieder.', '2024-08-02 08:18:49', '2024-08-05 17:49:23', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(48, 4, 4, 'Noch ein Beitrag von Flux', 'Ja, genau....', '2024-08-02 08:44:20', '2024-09-17 17:04:11', NULL, '', NULL, '', NULL, 0, 0, 1, 0, NULL, 0),
(49, 4, 4, 'Ein Montagspost', 'Mit montäglichem Gruss', '2024-08-05 18:07:09', '2024-08-05 18:07:09', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(50, 4, 3, 'Komische Frage', 'Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans. Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da es dort wimmele von bösen Kommata, wilden Fragezeichen und hinterhältigen Semikoli, doch das Blindtextchen ließ sich nicht beirren. Es packte seine sieben Versalien, schob sich sein Initial in den Gürtel und machte sich auf den Weg. Als es die ersten Hügel des Kursivgebirges erklommen hatte, warf es einen letzten Blick zurück auf die Skyline seiner Heimatstadt Buchstabhausen, die Headline von Alphabetdorf und die Subline seiner eigenen Straße, der Zeilengasse. Wehmütig lief ihm eine rhetorische Frage über die Wange, dann setzte es seinen Weg fort. Unterwegs traf es eine Copy. Die Copy warnte das Blindtextchen, da, wo sie herkäme wäre sie', '2024-08-05 18:18:01', '2024-08-05 21:48:33', NULL, '', NULL, '', NULL, 0, 1, 0, 0, NULL, 0),
(51, 4, 2, 'Suche Dings auf dem Land', 'asdfasfdasd', '2024-08-05 19:58:41', '2024-08-07 21:09:01', NULL, 'AI', 'nichts', 'Psychologe/in', 'sdfgsd', 0, 1, 0, 0, NULL, 0),
(52, 4, 2, 'Erlebnis von letztem Samstag', 'Die Bezeichnung «Kanton» für ein Glied der Eidgenossenschaft findet sich erstmals 1475[3] oder 1467[4] aus Freiburg belegt. Da cantone in Oberitalien seit dem 11. Jahrhundert für «Landesteil» steht, nimmt Walther von Wartburg an, das Wort sei von lombardischen Kaufleuten in die heutige Westschweiz gebracht worden, wo es dann als Kanton ins Deutsche und als canton ins Französische übernommen wurde. Italienisch cantone ist eine Vergrösserungsform von canto, was «Ecke, Rand, Winkel, Stück, Teil» bedeutet. Canto wiederum stammt von lateinisch canthus «eiserner Radreifen», das seinerseits ursprünglich vielleicht ein keltisches Wort war.[5]', '2024-08-07 15:18:06', '2024-08-10 22:08:04', NULL, 'BS', 'Toni Cordura', 'Pfleger/in', 'Kantone', 0, 1, 0, 0, NULL, 0),
(53, 4, 2, 'Erlebnis von letztem Mittwoch', 'Die Bezeichnung «Kanton» für ein Glied der Eidgenossenschaft findet sich erstmals 1475[3] oder 1467[4] aus Freiburg belegt. Da cantone in Oberitalien seit dem 11. Jahrhundert für «Landesteil» steht, nimmt Walther von Wartburg an, das Wort sei von lombardischen Kaufleuten in die heutige Westschweiz gebracht worden, wo es dann als Kanton ins Deutsche und als canton ins Französische übernommen wurde. Italienisch cantone ist eine Vergrösserungsform von canto, was «Ecke, Rand, Winkel, Stück, Teil» bedeutet. Canto wiederum stammt von lateinisch canthus «eiserner Radreifen», das seinerseits ursprünglich vielleicht ein keltisches Wort war.[5]', '2024-08-07 15:18:11', '2024-09-17 20:19:06', NULL, 'BS', 'Toni Cordura', 'Berater/in', 'Kantone', 1, 1, 0, 0, NULL, 0),
(54, 4, 1, 'KGV was ist eure Erfahrung?', 'Im Buch \"Hoch hinaus\" (SAC - Tourenführer) steht: Ansonsten gilt es, in heiklem Gehgelände die Übersicht und die Nerven zu behalten, bis man oben zum Gipfelfirn gelangt.\r\nDieser Aussage kann ich nur zustimmen! Es braucht wirklich Nerven. Das Gelände ist nirgends schwierig, aber dauernd brüchig. Soviel schlechten Fels über eine solange Strecke habe ich vermutlich noch nie erlebt. Aber trotzdem ist es eine landschaftlich hervorragend schöne Tour!! Das Ambiente ist wirklich schön!', '2024-08-07 17:25:52', '2024-09-17 12:56:04', NULL, 'SO', 'Luzius Bormann', 'Psychologe/in', '', 1, 1, 0, 0, NULL, 0),
(55, 4, 1, 'Langer Titel oder nicht - oder zu wenig lang?', 'sdfas dföasdf a', '2024-08-07 21:14:17', '2024-08-07 21:15:03', NULL, 'GE', 'Toni Cordura', 'Pfleger/in', 'asdfads', 0, 1, 0, 0, NULL, 0),
(56, 3, 3, 'Erlebnis im August', 'In 1989, just before finishing his studies at the Central Academy of Fine Arts, Liu Ye got a lucky chance through a friend to go to Germany to study at the Berlin University of Arts (Universität der Künste Berlin). This new world was very different from socialist China and amazed Liu Ye infinitely. The Bauhaus style—so beloved by him—and its influence could be seen everywhere!', '2024-08-19 15:33:09', '2024-08-19 15:33:09', NULL, 'TI', 'Anton Mathis', 'Psychiater/in', '', 0, 1, 0, 0, NULL, 0),
(57, 3, 3, 'Unterwegs', 'Anfällig für dieses Phänomen ist der Bahnhof am Flughafen Zürich. Er ist nicht nur gut frequentiert, sondern es sind auch viele Menschen mit Gepäck unterwegs. Zudem sind viele Reisende aus dem Ausland mit den Schweizer Zügen nicht vertraut. Deshalb haben die SBB nun eine neue Massnahme getestet.', '2024-08-22 13:20:06', '2024-09-17 11:33:12', NULL, 'GL', 'Lina Foldi', 'Pfleger/in', '', 1, 1, 0, 0, NULL, 0),
(58, 3, 2, 'Für meinen Sohn 18, Depressionen, suche ich einen Therapeuten im Raum Luzern', 'If you want to makes some particular text or any other content different from the rest, you can wrap it in a span tag, give it a class attribute, then select it with the attribute value for styling.', '2024-09-06 18:10:41', '2024-09-17 16:02:54', NULL, 'LU', '', 'Psychologe/in', '', 1, 1, 0, 0, NULL, 0),
(59, 3, 1, 'Wie ansprechen?', 'The placeholder attribute specifies a short hint that describes the expected value of an input field/text area. The short hint is displayed in the field before the user enters a value.\r\n\r\nIn most of the browsers, placeholder texts are usually aligned on the left. The selector uses the text-align property to set the text alignment in the placeholder. This selector can change from browser to browser. For example:', '2024-09-09 13:56:43', '2024-09-09 13:56:43', NULL, 'SZ', 'Alex Daanets', 'Psychiater/in', '', 0, 1, 0, 0, NULL, 0),
(60, 3, 2, 'Im Raum Graubünden', 'Nachdem reflection im Englischen und réflexion im Französischen sich im 17. Jahrhundert als umgangssprachliche Begriffe eingebürgert hatten, wurde John Lockes Behandlung der Reflexion in seinem Versuch über den menschlichen Verstand (1690) maßgebend für die weiteren philosophischen Auseinandersetzungen darüber. Locke unterscheidet zwischen der Wahrnehmung äußerer Gegenstände und der Wahrnehmung der Vorgänge in unserer eigenen Seele wie „Wahrnehmen, Denken, Zweifeln, Glauben, Begründen, Wissen, Wollen“, samt den damit verbundenen Gefühlen der „Zufriedenheit oder Unzufriedenheit“:\r\n\r\n„Indem wir uns deren bewusst sind und sie in uns betrachten, so empfängt unser Verstand dadurch ebenso bestimmte Vorstellungen, wie von den unsere Sinne erregenden Körpern. Diese Quelle von Vorstellungen hat Jeder ganz in sich selbst, und obgleich hier von keinem Sinn gesprochen werden kann, da sie mit äusserlichen Gegenständen nichts zu tun hat, so ist sie doch den Sinnen sehr ähnlich und könnte ganz richtig innerer Sinn genannt werden. Allein da ich jene Quelle schon Sinneswahrnehmung (sensation) nenne, so nenne ich diese: Selbstwahrnehmung (reflection) (…)“.[6]\r\nUnklar bleibt dabei, ob die Reflexion als von der äußeren Wahrnehmung abhängig oder als eigenständige Quelle der Erkenntnis gesehen werden soll, da Locke im Rückgriff auf Descartes, der freilich den Begriff Reflexion noch nicht verwendet, auch Letzteres behauptet.[7]', '2024-09-14 15:47:24', '2024-09-17 12:04:44', NULL, 'GR', '', 'Psychiater/in', '', 1, 1, 0, 0, NULL, 0),
(61, 3, 4, 'Freud', 'Für Immanuel Kant und seine Transzendentalphilosophie war die Reflexion wesentliches Mittel der Erkenntnis, indem er die Rolle der damit verbundenen Begriffe und ihrer notwendigen Unterscheidung betonte, vgl. → Grundrelation, Kritizismus. Indem er diese Tätigkeiten auf das eigene Ich des Denkenden zurückführte, benannte er sie auch mit eigenen ›Reflexionsbegriffen‹, nämlich der Einerleiheit und Verschiedenheit, der Einstimmung und des Widerstreits, des Inneren und des Äußeren, der Materie und der Form (KrV B 316 ff.). Hierbei ist auch auf die Amphibolie der Reflexionsbegriffe hinzuweisen (KrV B 326).\r\n\r\nDer Gedanke, dass die Reflexion einen Verlust der Unmittelbarkeit bedeute, findet sich erstmals bei François Fénelon und wurde vor allem von Jean-Jacques Rousseau propagiert: „Der Zustand der Reflexion ist gegen die Natur.“[8] Eine bekannt gewordene literarische Verarbeitung dieses Themas ist Heinrich von Kleists Über das Marionettentheater, wo es heißt:\r\n\r\n„Wir sehen, daß in dem Maße, als in der organischen Welt die Reflexion dunkler und schwächer wird, die Grazie immer strahlender und herrschender hervortritt.“\r\nJohann Gottfried Herder verwies darauf, dass die Reflexion auf Sprache angewiesen ist: nur sie erlaube es, in einem „Ocean von Empfindungen“ einzelne Momente festzuhalten, an denen der Verstand sich reflektieren könne.[9] Da die Menschen dabei auf bereits früher Erreichtes zurückgriffen, das sie erweiterten und verbesserten, stellt sich für Herder die Geistesgeschichte schließlich als ein „überindividueller Reflexionszusammenhang“ (L. Zahn) dar.[10]', '2024-09-14 16:19:41', '2024-09-21 21:05:08', NULL, 'OW', '', 'Pfleger/in', '', 0, 0, 0, 0, NULL, 0),
(63, 3, 1, 'Deutschland?', 'aasdfasdfa', '2024-09-17 16:13:19', '2024-09-17 16:14:07', NULL, 'TG', 'Luzius Bormann', 'Psychologe/in', '', 1, 1, 0, 0, NULL, 0),
(64, 3, 3, 'Meine Gedanken zum Reflexion versus Handeln', 'Reflexion bedeutet etwas prüfendes und vergleichendes Nachdenken. Dabei sind verschiedene Formen der Reflexion zu unterscheiden.\r\n\r\nEs gibt zum einen die Selbstreflexion, also das Nachdenken über sich selbst bzw. das eigene Verhalten. Das zugehörige Verb ist reflektieren und steht für grübeln, durchdenken oder nachsinnen.[1]\r\n\r\nIn der Philosophie gibt es seit dem 17. Jahrhundert darüber hinaus fachspezifische Verwendungen des Begriffs, die sich an diesem Begriff orientieren und unterschiedliche Aspekte hervorheben. Beispielsweise Reflexion über die Gesellschaftsverhältnisse oder über den Sprachgebrauch.\r\n\r\nIm Zentrum steht dabei die Unterscheidung von auf äußere Objekte bezogenem Wahrnehmen und derjenigen geistigen Tätigkeit, die sich auf den Akt des Denkens und der Vorstellung selbst richtet (Abstraktion).', '2024-09-17 16:50:19', '2024-09-17 17:03:31', NULL, 'ZH', '', 'Psychologe/in', '', 1, 1, 0, 0, NULL, 0),
(65, 3, 2, 'Suche Empfehlung für guten KVT Therapeuten in Bern', 'Die Finanzierung der Armee erhitzt die Gemüter im Nationalrat. Die SP ärgert, dass die Bürgerlichen die Armee auf Kosten der Entwicklungshilfe und des Bundespersonals aufrüsten wollen.\r\n\r\nDa entfährt es SP-Nationalrat Fabian Molina: Der Zürcher Politiker bezeichnet die Schweizer Armee als Trachtenverein. Die SVP reagiert empört. Sicherheitspolitiker Mauro Tuena verlangt eine Entschuldigung. Vergeblich. Molina doppelt nach: «Von der SVP lasse ich mir nichts sagen». (sel)', '2024-09-19 18:04:25', '2024-09-21 22:48:38', NULL, 'BE', '', 'Psychologe/in', 'KVT', 0, 0, 0, 1, NULL, 0),
(66, 3, 1, 'Ich muss etwas loswerden...', 'Der Dokumentarfilm «Russians at war» soll trotz Kritik am Zurich Film Festival gezeigt werden. Der Filmemacherin Anastasia Trofimova wird vorgeworfen, mit der Dokumentation russische Kriegsverbrechen in der Ukraine zu verharmlosen.\r\n\r\n«Russians at war» wird wie geplant am Zurich Film Festival (ZFF) gezeigt, wie Festivaldirektor Christian Jungen am Donnerstag an einer Medienkonferenz in Zürich sagte.\r\n\r\nDer Film, für den Trofimova eine russische Militäreinheit im Krieg gegen die Ukraine mehrere Monate lang begleitete, löste vor allem bei Ukrainerinnen und Ukrainern heftige Reaktionen aus. Vorführungen am Toronto Film Festival mussten wegen Drohungen abgesagt werden.', '2024-09-19 18:19:07', '2024-09-19 18:19:07', NULL, 'TI', 'Francesca Paradi', 'Psychiater/in', '', 0, 1, 0, 0, NULL, 0),
(67, 3, 1, 'Manchmal denke ich...', 'Doch an dem Abend herrschten extreme Bedingungen: Schlechte Sicht, Sturmböen über 100 km/h und Temperaturen von −10 Grad Celsius führten dazu, dass eine Rettungstruppe sich zu Fuss auf den Weg machte. Geolokalisation lieferte den Standort der Gruppe. Den vier Berggängern wurde eingeschärft, sie sollten sich nicht von den übermittelten Koordinaten entfernen. Weiter sollten sie hinter Felsen oder bei Gletscherspalten Schutz suchen – der Aufstieg der Rettungskräfte sollte mehrere Stunden dauern.', '2024-09-19 18:45:58', '2024-09-21 23:05:46', NULL, 'VS', 'Toni Cordura', 'Psychologe/in', '', 0, 0, 1, 0, NULL, 0),
(68, 3, 1, 'Manchmal denke ich...', 'Doch an dem Abend herrschten extreme Bedingungen: Schlechte Sicht, Sturmböen über 100 km/h und Temperaturen von −10 Grad Celsius führten dazu, dass eine Rettungstruppe sich zu Fuss auf den Weg machte. Geolokalisation lieferte den Standort der Gruppe. Den vier Berggängern wurde eingeschärft, sie sollten sich nicht von den übermittelten Koordinaten entfernen. Weiter sollten sie hinter Felsen oder bei Gletscherspalten Schutz suchen – der Aufstieg der Rettungskräfte sollte mehrere Stunden dauern.', '2024-09-19 18:49:37', '2024-09-21 21:47:18', NULL, 'VS', 'Toni Cordura', 'Psychologe/in', '', 0, 0, 0, 1, NULL, 0),
(69, 3, 3, 'Funktioniert das Post-Erstellen noch?', 'Dank guter Ortskenntnisse und Erfahrung hätten sie das Risiko schnell abschätzen und das Vorgehen sorgfältig planen können. Die Sicherheit der Rettungskräfte sei immer im Vordergrund gestanden.', '2024-09-19 22:54:42', '2024-09-21 21:12:35', NULL, 'GL', '', 'Pfleger/in', '', 0, 1, 0, 1, NULL, 0),
(70, 3, 2, 'Jemand in La Chaux-de-Fonds?', 'Er war Schüler des Sokrates, dessen Denken und Methode er in vielen seiner Werke schilderte. Die Vielseitigkeit seiner Begabungen und die Originalität seiner wegweisenden Leistungen als Denker und Schriftsteller machten Platon zu einer der bekanntesten und einflussreichsten Persönlichkeiten der Geistesgeschichte. In der Metaphysik und Erkenntnistheorie, in der Ethik, Anthropologie, Staatstheorie, Kosmologie, Kunsttheorie und Sprachphilosophie setzte er Maßstäbe auch für diejenigen, die ihm – wie sein bedeutendster Schüler Aristoteles – in zentralen Fragen widersprachen.', '2024-09-20 21:47:09', '2024-09-21 20:47:50', NULL, 'JU', '', '', 'Therapeutin', 0, 1, 0, 0, NULL, 0),
(71, 3, 1, 'Die erste Sitzung mit Fr. Rust', 'Im literarischen Dialog, der den Verlauf einer gemeinsamen Untersuchung nachvollziehen lässt, sah er die allein angemessene Form der schriftlichen Darbietung philosophischen Bemühens um Wahrheit. Aus dieser Überzeugung verhalf er der noch jungen Literaturgattung des Dialogs zum Durchbruch und schuf damit eine Alternative zur Lehrschrift und zur Rhetorik als bekannten Darstellungs- und Überzeugungsmitteln. Dabei bezog er dichterische und mythische Motive sowie handwerkliche Zusammenhänge ein, um seine Gedankengänge auf spielerische, anschauliche Weise zu vermitteln. Zugleich wich er mit dieser Art der Darbietung seiner Auffassungen dogmatischen Festlegungen aus und ließ viele Fragen, die sich daraus ergaben, offen bzw. überließ deren Klärung den Lesern, die er zu eigenen Anstrengungen anregen wollte.\r\n\r\n', '2024-09-20 21:49:52', '2024-09-21 20:58:58', NULL, 'TG', 'Laura Rust', 'Psychologe/in', 'Rust', 0, 1, 0, 0, NULL, 0),
(73, 3, 1, 'Kann ich diesen Post deaktivieren, so dass er im richtigen Tab landet?', 'Platon stammte aus einer vornehmen, wohlhabenden Familie Athens. Sein Vater Ariston betrachtete sich als Nachkomme des Kodros, eines mythischen Königs von Athen; jedenfalls war ein Vorfahre Aristons, Aristokles, schon 605/604 v. Chr. Archon gewesen, hatte also das höchste Staatsamt bekleidet. Unter den Ahnen von Platons Mutter Periktione war ein Freund und Verwandter des legendären athenischen Gesetzgebers Solon.[6] Der Philosoph hatte zwei ältere Brüder, Adeimantos und Glaukon, die in der Politeia als Dialogteilnehmer auftreten, und eine ältere Schwester, Potone, deren Sohn Speusippos später Platons Nachfolger als Leiter der Akademie (Scholarch) wurde. Ariston verstarb schon früh; Periktione heiratete um 423 v. Chr. ihren Onkel mütterlicherseits Pyrilampes, einen angesehenen Athener, der zu Perikles’ Zeit als Gesandter tätig gewesen war. Pyrilampes hatte aus einer früheren Ehe einen Sohn, Demos, der Platons Stiefbruder wurde. Aus der Ehe zwischen Periktione und Pyrilampes ging Antiphon, ein jüngerer Halbbruder Platons, hervor.', '2024-09-21 21:02:42', '2024-09-21 21:03:43', NULL, 'OW', 'Alex Daanets', 'Psychologe/in', 'Platon', 0, 1, 0, 0, NULL, 0),
(74, 3, 4, 'Test mit dem neuen is_deactivated status', 'Test', '2024-09-21 21:15:39', '2024-09-21 21:23:01', NULL, 'AI', '', '', '', 1, 0, 0, 0, NULL, 0),
(75, 3, 3, 'Neuer Test für Deaktivierung', 'sdfadf', '2024-09-21 21:24:30', '2024-09-21 21:44:09', NULL, 'NW', '', '', '', 0, 0, 0, 1, NULL, 0),
(76, 3, 3, 'Nochmal Test, Deactivation', 'asdfasd', '2024-09-21 21:36:10', '2024-09-22 19:02:59', NULL, 'VS', '', '', '', 0, 0, 1, 0, NULL, 0),
(79, 3, 3, 'asdfas', 'asdfasd', '2024-09-23 17:45:41', '2024-09-23 17:45:41', NULL, 'AI', '', '', '', 0, 0, 0, 0, NULL, 0),
(80, 3, 1, 'Neuer post mit neuem formulr', 'asdfasd', '2024-09-23 17:47:42', '2024-09-23 17:48:10', NULL, 'FR', '1', '', '', 1, 1, 0, 0, NULL, 0),
(81, 3, 2, 'asdfasdf', 'asdfadf', '2024-09-23 17:49:32', '2024-09-23 17:49:32', NULL, 'GL', '', '', '', 0, 0, 0, 0, NULL, 0),
(82, 3, 1, 'Was habt Ihr mit ihr erlebt?', 'sdgsdfgsfdg', '2024-09-23 18:08:45', '2024-09-23 18:20:13', NULL, 'AR', '3', '', '', 1, 1, 0, 0, NULL, 0),
(83, 3, 1, 'Komisches Erlebnis in der PTK', 'aslfnaösdjfnaödsjnäad', '2024-09-23 18:18:55', '2024-09-23 18:18:55', NULL, 'BS', '4', '', '', 0, 1, 0, 0, NULL, 0),
(84, 3, 4, 'Es geht immer noch nichtttt!!!!', 'sdfasdf', '2024-09-23 18:22:03', '2024-09-28 23:57:00', NULL, 'VS', '', '', '', 0, 0, 0, 1, NULL, 0),
(85, 3, 4, 'Endlich funktioniert es!  Hoffentlich auch mit neuem Post...', 'safasdfas', '2024-09-23 18:34:09', '2024-09-23 18:34:39', NULL, 'UR', '', '', '', 1, 1, 0, 0, NULL, 0),
(86, 3, 1, 'Ein Post mit einer Psychiaterin', 'asdfjnasödfoias ödhaösd höadsa', '2024-09-23 22:27:20', '2024-09-23 22:27:31', NULL, 'SH', '3', '', '', 1, 1, 0, 0, NULL, 0),
(87, 3, 1, 'Eine Empfehlung von Herzen für Frau...', 'asdansdöansdvnaäsdlnvasdv', '2024-09-25 14:36:58', '2024-09-25 14:37:28', NULL, 'GR', '5', '', '', 1, 1, 0, 0, NULL, 0),
(89, 6, 1, 'Mich stört das bei ihm, glaube ich auch', 'Der Begriff „kognitiv\" ist vom lateinischen „cognoscere“ abgeleitet und bedeutet „erkennen“. In einer kognitiven Therapie geht es darum, sich über seine Gedanken, Einstellungen und Erwartungen klar zu werden. Das Ziel ist, falsche und belastende Überzeugungen zu erkennen und dann zu verändern. Denn es sind häufig nicht nur die Dinge und Situationen selbst, die Probleme bereiten, sondern auch die vielleicht viel zu große Bedeutung, die man ihnen gibt.', '2024-09-26 16:52:26', '2024-09-29 18:40:13', NULL, 'SG', '6', 'Berater/in', '', 1, 1, 0, 0, NULL, 0),
(90, 6, 3, 'Noch ein paar Gedanken', 'asdasdfasdfasdfasdfasdfasd', '2024-10-03 16:46:11', '2024-10-03 16:46:11', NULL, 'BL', '', '', '', 0, 0, 0, 0, NULL, 0),
(91, 4, 3, 'asdfasdf', 'asdfsd', '2024-10-03 21:41:08', '2024-10-03 21:41:08', NULL, 'GE', '', '', '', 0, 0, 0, 0, NULL, 0),
(92, 6, 1, 'Testbeitrag', 'sdajsdvjabsäkdvajbädsv', '2024-10-05 20:15:06', '2024-10-05 20:15:06', NULL, 'BS', '3', '', '', 0, 0, 0, 0, NULL, 0),
(93, 6, 4, 'Regengedanken', '<p>Kennt ihr diesen <b>Gedanken, oder diesen? </b>Er kann mich vom Schlafen abhalten. Ich lese dann <a href=\"https://www.watson.ch/\" target=\"_blank\">hier.</a></p>', '2024-10-06 14:46:46', '2024-10-06 15:45:51', NULL, 'TG', '', '', '', 1, 1, 0, 0, NULL, 0);
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `content`, `created_at`, `updated_at`, `parent_id`, `canton`, `therapist`, `designation`, `tags`, `is_published`, `is_active`, `is_banned`, `is_deactivated`, `therapist_id`, `sticky`) VALUES
(94, 6, 1, 'Post mit Editor', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, &quot;Adjusted Verdana Fallback&quot;, sans-serif; font-size: 25px;\">Stefan Mäder, Präsident des Versicherungsverbandes, freut sich über die Rückkehr des <i>verlorenen Mitglieds,</i> räumt bei der BVG-Reform Fehler ein - und er fordert, dass für Hausbesitzer Erdbebenversicherungen obligatorisch werden.<br></span><br><br><img src=\"data:image/png;base64,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\" data-filename=\"6.png\" style=\"width: 250px;\"></p>', '2024-10-06 15:08:52', '2024-10-06 15:09:11', NULL, 'UR', '4', '', '', 1, 1, 0, 0, NULL, 0),
(96, 6, 3, 'Geht er jetzt? Der Editor?', '<p><a href=\"https://www.bzbasel.ch/schweiz/schweizer-radio-und-fernsehen-srf-investigativ-ist-das-vorzeigeprojekt-des-unternehmens-es-faellt-auf-mit-tiefem-output-und-mit-vielen-personalwechseln-ld.2681019\" class=\"teaser__link\" style=\"margin:0px;font-family:\'chm-sans-serif\', Arial;font-size:14px;\"></a></p><div class=\"teaser__wrapper\" style=\"margin:0px;\"><h2 class=\"teaser__title teaser__title--1of2 teaser__title--regular teaser__title--0\" style=\"margin:0px;font-family:\'chm-sans-serif\', Arial;font-size:1.25rem;letter-spacing:0.01em;line-height:1.25;\"><span class=\"teaser__title-name\" style=\"margin:0px;\"><u>SRF investigativ»: Beim Recherche-Team fielen Mitarbeiter wochenlang aus – die Gründe sind erstaunlich</u></span></h2></div>', '2024-10-06 15:29:48', '2024-10-08 10:12:54', NULL, 'FR', '', '', 'ACT', 1, 1, 0, 0, NULL, 0),
(98, 6, 1, 'Un test avec des tags', '<p>Blablabla je nsdfgsdfgsdfesdfasdf sais pasdfh<br />Neu? sds<br /><br />Balablasdss</p>', '2024-10-06 20:01:19', '2024-10-08 18:30:51', NULL, 'GE', '8', '', 'LaVie,Quelechose,Noch', 1, 1, 0, 0, NULL, 0),
(99, 6, 4, 'Ein Rant aus Schaffhausen', '<p>asdfmasdfnskdfnaljdfaös öl jasdöf jsöldjg lösdjg sdfg sldjgs!!!!!</p>', '2024-10-07 17:34:32', '2024-10-07 17:35:21', NULL, 'SH', '', '', 'Ranti', 1, 1, 0, 0, NULL, 0),
(100, 6, 2, 'KVT Therapeut gesucht', '<p>Nach 10 Jahre Psychoanalyse möchte ich mal etwas praktisches machen und suche deshalb einen guten KVT Therapeuten in Basel oder auch Raum Liestal. Weiss jemand wer?</p>', '2024-10-07 18:24:07', '2024-10-07 19:18:33', NULL, 'BS', '', '', 'KVT,Basel', 1, 1, 0, 0, NULL, 0),
(101, 6, 1, 'Er erzählt so viel von sich?', '<p>Mein Therapeut erzählt sehr viel von sich, auch sehr persönliches. Dinge, die ich eigentlich gar nicht unbedingt hören will...<br /><br />Unsicher</p>', '2024-10-07 20:26:46', '2024-10-08 10:12:09', NULL, 'TG', '3', '', 'Persönliches', 1, 1, 0, 0, NULL, 0),
(102, 6, 1, 'Dringend!', '<p>cgndfgndfgndfngdgn</p>', '2024-10-08 10:33:25', '2024-10-08 18:59:55', NULL, 'GR', '5', '', 'Notfall', 0, 0, 1, 0, NULL, 0),
(108, 6, 1, 'Der Berater', '<p>yvdadvdv</p>', '2024-10-10 20:46:06', '2024-10-10 20:46:49', NULL, 'AR', '9', '', 'Berater', 1, 1, 0, 0, NULL, 0),
(109, 6, 1, 'Berufsbezeichnung Filter', '<p>asdfafdjbaödskfjbaödsf</p>', '2024-10-11 16:52:21', '2024-10-11 16:52:33', NULL, 'BE', '10', '', 'Basel', 1, 1, 0, 0, NULL, 0),
(110, 6, 1, 'Poste en francais', '<p>Blabla en francais</p>', '2024-10-12 17:59:48', '2024-10-12 18:00:03', NULL, 'NW', '11', '', 'Francais', 1, 1, 0, 0, NULL, 0),
(112, 6, 1, 'Test', '<p>sdfgsdfg</p>', '2024-10-19 17:27:42', '2024-10-19 17:29:13', NULL, 'BL', '7', '', 'KVT', 1, 1, 0, 0, NULL, 0),
(113, 6, 4, 'asdf', '<p>asfd</p>', '2024-10-19 18:05:41', '2024-10-19 18:05:41', NULL, 'SO', '', '', 'Persönliches', 0, 0, 0, 0, NULL, 1),
(114, 6, 3, 'Sticky post', '<p>asdfasd</p>', '2024-10-19 18:09:15', '2024-10-19 20:40:46', NULL, 'VD', '12', '', 'Sticky', 1, 1, 0, 0, NULL, 0),
(115, 6, 8, 'Zuroberst?', '<p>asdfasdf</p>', '2024-10-19 20:29:43', '2024-10-19 21:19:37', NULL, 'ZG', '', '', 'Francais', 1, 1, 0, 0, NULL, 0),
(116, 6, 3, 'Sticky Thoughts', '<p>sdfgsdfgsdf</p>', '2024-10-19 20:46:46', '2024-10-19 23:44:59', NULL, 'BS', '', '', '', 1, 1, 0, 0, NULL, 0),
(117, 6, 4, 'Stick III', '<p>asdfsdfsdgsdfgsdfg</p>', '2024-10-19 21:13:26', '2024-10-29 15:30:35', NULL, 'BE', '', '', 'Persönliches', 1, 1, 0, 0, NULL, 0),
(118, 3, 3, 'banned', '<p>fhjghjfghj</p>', '2024-10-25 15:21:33', '2024-10-25 15:21:33', NULL, 'AR', '', '', '', 0, 0, 0, 0, NULL, 0),
(119, 3, 1, 'Mit Theapeut', '<p>sfalsndföansdföasnda</p>', '2024-10-27 14:51:45', '2024-11-19 18:14:37', NULL, 'GL', '2', '', 'Berater', 1, 1, 0, 0, NULL, 0),
(120, 6, 3, 'Ist KVT wirklich langfristig effektiv?', 'Die kognitive Verhaltenstherapie (KVT) ist eine der verbreitetsten und am besten untersuchten Formen von Psychotherapie. Sie kombiniert zwei Therapieansätze: die kognitive Therapie und die Verhaltenstherapie.\r\n\r\nWelche Behandlungsmethoden eingesetzt werden, hängt davon ab, um welches Problem, welche Erkrankung oder Störung es sich handelt. Die Grundidee der Therapie ist aber immer dieselbe: Was wir denken, wie wir uns verhalten und welche Gefühle andere in uns auslösen, hängt eng miteinander zusammen – und ist entscheidend für unser Wohlbefinden.', '2024-10-28 17:27:30', '2024-10-28 17:27:30', NULL, 'BL', '', '', '', 0, 0, 0, 0, NULL, 0),
(121, 6, 1, 'November', '<p>asdfasdfasfd</p>', '2024-11-18 20:32:22', '2024-11-18 20:32:43', NULL, 'AR', '2', '', '', 1, 1, 0, 0, NULL, 0),
(122, 6, 1, 'Das richtige Mass, wer hat es gefunden?', '<p>advadvadfvadva</p>', '2024-11-18 21:22:02', '2024-11-27 19:18:30', NULL, 'TG', '13', '', 'Mass', 1, 1, 0, 0, NULL, 0),
(124, 3, 1, 'Gustav: wir duzen uns. Macht ihr das auch?', '<p>Die <a href=\"https://de.wikipedia.org/wiki/Enztalbahn\" title=\"Enztalbahn\" style=\"background-image:none;background-size:initial;\">Enztalbahn</a>, auch kurz Enz­bahn genannt, ist eine 19,76 Kilo­meter lange Eisenbahn­strecke im Nord­schwarzwald, die größten­teils dem Fluss Enz folgt. Die durch­gehend ein­gleisige Haupt­bahn zweigt im Pforzheimer Stadt­teil Brötzingen von der Nagoldtal­bahn ab und führt als Stich­bahn nach Bad Wildbad, bis 1992 Wildbad genannt. Bis zum Jahr 2002 handelte es sich um eine nicht elektrifi­zierte<span>Strecke mit geringer Verkehrs­bedeutung. Nach Über­nahme und Elektrifi­zierung durch die Albtal-Verkehrs-Gesell­schaft (AVG) und nach­folgendem Neubau einer 0,68 Kilo­meter langen Straßen­bahn-Anschluss­strecke in die Innen­stadt von Bad Wildbad konnte das Fahrplan­angebot ver­dichtet und die Nach­frage deutlich gesteigert werden. Schon in den ersten Jahren erhöhten sich die Fahrgast­zahlen von durch­schnittlich etwa 1200 Fahr­gästen pro Tag auf 2300, bis zum Sommer 2004 auf 3300 Fahr­gäste pro Tag. Im Zentral­ort Bad Wildbad erhöhte sich die Anzahl der Ein­steiger pro Tag montags bis freitags von 250 auf 800, an Samstagen von 160 auf 630 und an Sonntagen von 150 auf 830.</span></p>', '2024-11-26 18:43:02', '2024-11-27 21:22:37', NULL, 'BS', '6', '', '', 1, 1, 0, 0, NULL, 0),
(125, 6, 1, 'St.Gallen, Psychiatrie', '<p>ssf</p>', '2024-12-02 18:00:07', '2024-12-02 18:00:07', NULL, 'SG', '14', '', '', 0, 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post_saved`
--

CREATE TABLE `post_saved` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `canton` varchar(5) NOT NULL,
  `therapist` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sticky` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `post_saved`
--

INSERT INTO `post_saved` (`id`, `user_id`, `category_id`, `canton`, `therapist`, `designation`, `title`, `content`, `tags`, `created_at`, `sticky`) VALUES
(1, 3, 4, 'BL', '', 'Berater', 'Was war das?', 'We use optional cookies to improve your experience on our websites, such as through social media connections, and to display personalized advertising based on your online activity. If you reject optional cookies, only cookies necessary to provide you the services will be used. You may change your selection by clicking “Manage Cookies” at the bottom of the page. Privacy Statement Third-Party Cookies', '', '2024-09-14 13:00:17', 0),
(2, 3, 1, 'LU', 'Frau Regina Solters', 'Psychologe/in', 'KGV und so. Nicht mehr so sicher', 'Bootstrap 4 is built with flexbox, but not every element’s display has been changed to display: flex as this would add many unnecessary overrides and unexpectedly change key browser behaviors. Most of our components are built with flexbox enabled.\r\n\r\nShould you need to add display: flex to an element, do so with .d-flex or one of the responsive variants (e.g., .d-sm-flex). You’ll need this class or display value to allow the use of our extra flexbox utilities for sizing, alignment, spacing, and more.', '', '2024-09-14 13:07:44', 0),
(18, 6, 3, 'BL', '', '', 'Diese ganzen Zweifel', 'Sie haben bereits Ihren Rucksack mit vielen Erfahrungen gesammelt und fühlen sich bereit\r\nfür den nächsten Schritt auf der Karriereleiter? Dann sind Sie genau die Richtige Person als:', '', '2024-10-03 12:47:30', 0),
(19, 6, 1, 'TG', '3', '', 'Er erzählt so viel von sich?', '<p>Mein Therapeut erzählt sehr viel von sich, auch sehr persönliches. Dinge, die ich eigentlich gar nicht unbedingt hören will...<br /><br />Unsicher</p>', 'Persönliches', '2024-10-08 08:30:05', 0),
(20, 6, 4, 'BE', '', '', 'Stick III', '<p>asdfsdfsdgsdfgsdfg</p>', 'Persönliches', '2024-10-28 16:27:12', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post_tags`
--

CREATE TABLE `post_tags` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
(100, 1),
(112, 1),
(100, 2),
(109, 2),
(101, 3),
(113, 3),
(117, 3),
(101, 4),
(20, 6),
(21, 12),
(108, 13),
(119, 13),
(110, 15),
(115, 15),
(122, 17);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(2, 'Basel'),
(13, 'Berater'),
(15, 'Francais'),
(12, 'Königsdisziplin'),
(1, 'KVT'),
(17, 'Mass'),
(6, 'Notfall'),
(3, 'Persönliches'),
(4, 'unsicher');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `therapists`
--

CREATE TABLE `therapists` (
  `id` int(11) NOT NULL,
  `form_of_address` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `canton` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `designation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `therapists`
--

INSERT INTO `therapists` (`id`, `form_of_address`, `first_name`, `last_name`, `institution`, `designation`, `description`, `canton`, `created_at`, `designation_id`) VALUES
(1, 'Frau', 'sdfgsdf', 'sdfg', 'sdfgsdfg', 'sdfgsdfg', NULL, 'BE', '2024-09-23 15:01:01', NULL),
(2, 'Herr', 'Lorenz', 'Namane', '', 'Psychologe', NULL, 'SG', '2024-09-23 15:58:05', NULL),
(3, 'Frau', 'Nina', 'Oppenheimer', '', 'Psychiaterin', NULL, 'AR', '2024-09-23 16:08:17', NULL),
(4, 'Herr', 'Lukas', 'Gerber', 'UPK, PTK', 'Psychologe/in', NULL, 'BS', '2024-09-23 16:16:35', NULL),
(5, 'Frau', 'Rina', 'Clanin', '', 'Psychiater/in', NULL, 'GR', '2024-09-25 12:35:36', NULL),
(6, 'Herr', 'Gustav', 'Geroldi', '', 'Psychiater/in', 'Ich arbeite seit 20 Jahren mit....', 'BS', '2024-09-26 14:48:38', NULL),
(7, 'Frau', 'Alina', 'Regenbogen', '', 'Psychologe/in', NULL, 'BS', '2024-09-29 20:59:33', NULL),
(8, 'Madame', 'Grenadine', 'Rimbaud', '', 'Psychologe/in', NULL, 'GE', '2024-10-06 18:00:32', NULL),
(9, 'Herr', 'Olaf', 'Berbini', '', 'Berater', NULL, 'AR', '2024-10-10 18:45:30', NULL),
(10, 'Frau', 'Livia', 'Remiger', '', 'Psychologe*', NULL, 'JU', '2024-10-11 14:51:26', NULL),
(11, 'Monsieur', 'Claude', 'Rechaud', '', 'Psychiatre', NULL, 'NW', '2024-10-12 15:59:19', NULL),
(12, 'Herr', 'Arman', 'Rigolezza', '', 'Coach', NULL, 'NE', '2024-10-19 16:08:49', NULL),
(13, 'Frau', 'Alma', 'Meineren', 'UPK', 'Psychotherapeut', NULL, 'TG', '2024-11-18 20:21:24', NULL),
(14, 'Herr', 'Roberto', 'Lucis', 'Psychiatrie St.Gallen', 'Pfleger*', NULL, 'SG', '2024-11-18 20:40:02', NULL),
(15, 'Frau', 'Corinne', 'Baumann', '', 'Pfleger*', NULL, 'AR', '2024-11-26 17:56:46', NULL),
(16, 'Herr', 'Marco', 'di Ligno', '', 'Coach', NULL, 'TI', '2024-11-26 18:04:10', NULL),
(17, '', '', '', '', 'Klinik', NULL, 'BS', '2024-11-26 18:38:31', NULL),
(18, '', '', '', '', 'Klinik', NULL, 'BS', '2024-11-26 18:38:31', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `biography` text,
  `registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar_url` varchar(255) DEFAULT NULL,
  `bio` text,
  `role` enum('user','moderator','admin') DEFAULT 'user',
  `is_banned` tinyint(1) DEFAULT '0',
  `default_canton` varchar(2) DEFAULT NULL,
  `language_preference` varchar(2) DEFAULT 'de',
  `messages_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `biography`, `registration_date`, `avatar_url`, `bio`, `role`, `is_banned`, `default_canton`, `language_preference`, `messages_active`) VALUES
(1, 'pandoc', 'pandoc@example.com', '$2y$10$YourHashedPasswordHere', NULL, NULL, '2024-07-02 11:11:30', NULL, NULL, 'user', 0, NULL, 'de', 1),
(2, 'default_user', 'default@example.com', 'default_password', NULL, NULL, '2024-07-02 17:11:46', NULL, NULL, 'user', 0, NULL, 'de', 1),
(3, 'Klaus & Klaus', 'fleix@gmx.ch', '$2y$10$hdSTF508XATjUX3z8LSPL.fFDo8aWHZ8bXmTvg9rrzqf/9c/Xfray', '2.png', NULL, '2024-07-02 20:12:53', 'uploads/avatars/2.png', 'Ein wenig und ein wenig mehr über mich.\r\n', 'moderator', 0, '', 'de', 1),
(4, 'Flux', 'flux@gmx.ch', '$2y$10$/JTvJTLOQqNp9jwRo7XlqeVYUsXivOLM1UO9ulAMEneHapZzAT.Vq', '8.png', NULL, '2024-08-01 21:04:44', 'uploads/avatars/8.png', 'Seit drei Jahren in Therapie bei Dr. Müller oder heisst er Meier?', 'moderator', 0, '', 'de', 1),
(6, 'Admina', 'admina@admin.ch', '$2y$10$cfJlq4tHm0d2hp/YOrEMNuF.2n9hWpxxTn6Wo.GL1HSwYC/Jmqzh2', '6.png', NULL, '2024-09-18 22:07:45', 'uploads/avatars/6.png', 'Ich bin einer der Admins und auch ein User.', 'admin', 0, '', 'de', 1),
(58, 'Lina', 'asdfa@asfa.com', '$2y$10$6gNgdQwQ45lp4FqhpwrveeFUTfDc4DEMlwCac0zQi4cs5iDWNrS4W', 'default-avatar.png', NULL, '2024-10-08 18:18:39', 'uploads/avatars/default-avatar.png', NULL, 'user', 0, NULL, 'de', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_blocks`
--

CREATE TABLE `user_blocks` (
  `blocker_id` int(11) NOT NULL,
  `blocked_id` int(11) NOT NULL,
  `blocked_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user_blocks`
--

INSERT INTO `user_blocks` (`blocker_id`, `blocked_id`, `blocked_at`) VALUES
(3, 3, '2024-12-02 13:02:25'),
(6, 3, '2024-12-02 13:08:39');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name_de`);

--
-- Indizes für die Tabelle `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `fk_messages_post_messages_id` (`post_messages_id`);

--
-- Indizes für die Tabelle `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);
ALTER TABLE `posts` ADD FULLTEXT KEY `title` (`title`,`content`);

--
-- Indizes für die Tabelle `post_saved`
--
ALTER TABLE `post_saved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `therapists`
--
ALTER TABLE `therapists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation_id` (`designation_id`);
ALTER TABLE `therapists` ADD FULLTEXT KEY `form_of_address` (`form_of_address`,`last_name`,`first_name`,`designation`,`institution`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indizes für die Tabelle `user_blocks`
--
ALTER TABLE `user_blocks`
  ADD PRIMARY KEY (`blocker_id`,`blocked_id`),
  ADD KEY `blocked_id` (`blocked_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT für Tabelle `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT für Tabelle `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT für Tabelle `post_saved`
--
ALTER TABLE `post_saved`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `therapists`
--
ALTER TABLE `therapists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_post_messages_id` FOREIGN KEY (`post_messages_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints der Tabelle `post_saved`
--
ALTER TABLE `post_saved`
  ADD CONSTRAINT `post_saved_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints der Tabelle `therapists`
--
ALTER TABLE `therapists`
  ADD CONSTRAINT `therapists_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`);

--
-- Constraints der Tabelle `user_blocks`
--
ALTER TABLE `user_blocks`
  ADD CONSTRAINT `user_blocks_ibfk_1` FOREIGN KEY (`blocker_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_blocks_ibfk_2` FOREIGN KEY (`blocked_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
