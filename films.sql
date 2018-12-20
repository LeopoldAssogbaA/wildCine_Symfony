-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 20 déc. 2018 à 22:52
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `wildcine_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realisateur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` int(11) NOT NULL,
  `acteurs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `bande_anonnce` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_size` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `films`
--

INSERT INTO `films` (`id`, `titre`, `realisateur`, `genre`, `acteurs`, `pays`, `description`, `bande_anonnce`, `image_name`, `updated_at`, `image_size`) VALUES
(1, 'Le Seigneur des anneaux', 'Peter Jackson', 2, 'Ellijah Wood', 'USA', 'La communauté de l\'anneau se forme pour détruire l\'anneau unique et se dirige vers le Mordor.', 'https://youtu.be/nalLU8i4zgs', '5c1c1ab8615ef053789166.jpg', '2018-12-20 22:42:00', 14665),
(2, 'Harry Potter', 'Chris Colombus', 2, 'Daniel Radcliff', 'USA, Grande Bretagne', 'Harry Potter découvre qu\'il est sorcier et se met en route pour Poudlard.', 'https://youtu.be/ht5T2thYQFk', '5c1c1ac31c21b522885815.jpg', '2018-12-20 22:42:10', 16456),
(3, 'Les Affranchis', 'Martin Scorsese', 6, 'Ray Liotta', 'USA', 'Depuis sa plus tendre enfance, Henry Hill, né d\'un père irlandais et d\'une mère sicilienne, veut devenir gangster et appartenir à la Mafia...', 'https://youtu.be/0v0NUEmeqbI', '5c1c1acd94ed9014406562.jpg', '2018-12-20 22:42:21', 18122),
(4, 'Scarface', 'Brian de Palma', 6, 'Al Paccino', 'USA', 'En 1980, Tony \"Scarface\" Montana bénéficie d\'une amnistie du gouvernement cubain pour retourner en Floride. Ambitieux et sans scrupules, il élabore un plan pour éliminer un caïd de la pègre et prendre la place qu\'il occupait sur le marché de la drogue.', 'https://youtu.be/3VNLz5pHq74', '5c1c1ad6846ac544462271.jpg', '2018-12-20 22:42:30', 15789),
(5, 'Porco Rosso', 'Hayao Miyazaki', 4, 'Michael Keaton', 'Japon', 'Dans l\'entre-deux-guerres quelque part en Italie, le pilote Marco, aventurier solitaire, vit dans le repaire qu\'il a etabli sur une ile deserte de l\'Adriatique. A bord de son splendide hydravion rouge, il vient en aide aux personnes en difficulté.', 'https://youtu.be/ETIJUDUFnl8', '5c1c1ade83483727847387.jpg', '2018-12-20 22:42:38', 19664),
(6, 'Wihiplash', 'Damien Chazelle', 1, 'Miles Teller', 'USA', 'Andrew, 19 ans, rêve de devenir l’un des meilleurs batteurs de jazz de sa génération. Mais la concurrence est rude au conservatoire de Manhattan où il s’entraîne avec acharnement. Il a pour objectif d’intégrer le fleuron des orchestres dirigé par Terence Fletcher, professeur féroce et intraitable. Lorsque celui-ci le repère enfin, Andrew se lance, sous sa direction, dans la quête de l’excellence...', 'https://youtu.be/qpxjxhvP904', '5c1c1ae67c013675259083.jpg', '2018-12-20 22:42:46', 19344),
(7, 'Forest Gump', 'robert Zemeckis', 1, 'Tom Hanks', 'usa', 'Quelques décennies d\'histoire américaine, des années 1940 à la fin du XXème siècle, à travers le regard et l\'étrange odyssée d\'un homme simple et pur, Forrest Gump.', 'https://youtu.be/vhbOdIJyalo', '5c1c1af094f9c358497027.jpg', '2018-12-20 22:42:56', 11204),
(8, 'La ligne verte', 'Frank Darabont', 1, 'Tom Hanks', 'usa', 'Paul Edgecomb, Gardien-chef du pénitencier de Cold Mountain en 1935, était chargé de veiller au bon déroulement des exécutions capitales. Parmi les prisonniers se trouvait un colosse du nom de John Coffey...', 'https://youtu.be/mccs8Ql8m8o', '5c1c1b025a30e716775036.jpg', '2018-12-20 22:43:14', 16694),
(9, 'H2G2', 'Garth Jennings', 2, 'Martin Freeman', 'USA', 'Sale journée pour le Terrien Arthur Dent. Sa maison est sur le point d\'être rasée par un bulldozer, il découvre que son meilleur ami, Ford Prefect, est un extraterrestre et pour couronner le tout, la Terre va être pulvérisée dans quelques minutes pour faire de la place à une voie express hyperspatiale.', 'https://youtu.be/CxSw3j53q94', '5c1c1b0edb5f9645891355.jpg', '2018-12-20 22:43:26', 21822),
(10, 'Le Parrain', 'Francis Ford Coppla', 6, 'Marlon Brando', 'USA', 'En 1945, à New York, les Corleone sont une des cinq familles de la mafia. Don Vito Corleone marie sa fille à un bookmaker. Sollozzo, \"parrain\" de la famille Tattaglia, propose à Don Vito une association dans le trafic de drogue...', 'https://youtu.be/ktCk487JeMw', '5c1c1b16b924e495458669.jpg', '2018-12-20 22:43:34', 12980),
(11, 'The Dark Knight', 'Christopher Nolan', 2, 'Christian Bale', 'USA', 'Batman entreprend de démanteler les dernières organisations criminelles de Gotham. Mais il se heurte bientôt à un nouveau génie du crime qui répand la terreur et le chaos dans la ville : le Joker..', 'https://youtu.be/wrcaivEjWCo', '5c1c1b26c80a0736818595.jpg', '2018-12-20 22:43:50', 17031),
(12, 'Pulp Fiction', 'Quentin Tarantino', 1, 'Uma Thurman', 'USA', 'L\'odyssée sanglante et burlesque de petits malfrats dans la jungle de Hollywood à travers trois histoires qui s\'entremêlent.', 'https://youtu.be/wk_kBj28mOM', '5c1c1b2f66692662771714.jpg', '2018-12-20 22:43:59', 21425),
(13, 'Fight Club', 'David Fincher', 1, 'BRad Pitt', 'USA', 'Le narrateur, vit seul, travaille seul, dort seul, comme beaucoup d\'autres personnes seules qui connaissent la misère morale et sexuelle. C\'est pourquoi il va devenir membre du Fight club, un lieu clandestin dirigé par Tyler Durden, anarchiste entre gourou et philosophe.', 'https://youtu.be/N9_xlIN80rM', '5c1c1b377b410568474596.jpg', '2018-12-20 22:44:07', 11000),
(14, 'Matrix', 'Lana Wachowski, Lilly Wachowski', 2, 'Keanu Reeves', 'USA', 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l\'un des pirates les plus recherchés du cyber-espace. A cheval entre deux mondes, Neo est assailli par d\'étranges songes et des messages cryptés provenant d\'un certain Morpheus.', 'https://youtu.be/8xx91zoASLY', '5c1c1b3fde239734275342.jpg', '2018-12-20 22:44:15', 18945);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
