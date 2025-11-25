-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 25 nov. 2025 à 10:01
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `garage`
--

-- --------------------------------------------------------

--
-- Structure de la table `g_article`
--

DROP TABLE IF EXISTS `g_article`;
CREATE TABLE IF NOT EXISTS `g_article` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_ref` varchar(50) DEFAULT NULL,
  `a_qty` int DEFAULT NULL,
  `a_designation` varchar(50) DEFAULT NULL,
  `a_marque` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_article`
--

INSERT INTO `g_article` (`a_id`, `a_ref`, `a_qty`, `a_designation`, `a_marque`) VALUES
(1, '7DJH423', 10, 'filtre à air', 'VALEO'),
(2, '5SQGD5Z', 25, 'filtre à GO', 'MECAFILTER'),
(3, '7DJT423', 22, 'filtre à pollen', 'BOSCH'),
(4, 'RDTH123', 9, 'filtre à huile', 'MAN FILTER'),
(5, 'JKD7HP2', 2, 'filtre à air', 'BOSCH'),
(6, 'IPDT5HGS', 10, 'filtre à POLLEN', 'VALEO');

-- --------------------------------------------------------

--
-- Structure de la table `g_vehicule`
--

DROP TABLE IF EXISTS `g_vehicule`;
CREATE TABLE IF NOT EXISTS `g_vehicule` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `v_type` varchar(50) DEFAULT NULL,
  `v_energie` varchar(50) DEFAULT NULL,
  `v_marque` varchar(50) DEFAULT NULL,
  `v_fk_article_vehicule_id` int NOT NULL,
  PRIMARY KEY (`v_id`),
  KEY `v_fk_article_vehicule_id` (`v_fk_article_vehicule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_vehicule`
--

INSERT INTO `g_vehicule` (`v_id`, `v_type`, `v_energie`, `v_marque`, `v_fk_article_vehicule_id`) VALUES
(1, '500', 'ESSENCE', 'FIAT', 3),
(2, 'YARIS', 'DIESEL', 'TOYOTA', 2),
(3, '208', 'ESSENCE', 'PEUGEOT', 4),
(4, 'MEGANE', 'ESSENCE', 'RENAULT', 4),
(5, 'C3', 'DIESEL', 'CITROEN', 5);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_vehicule`
--
ALTER TABLE `g_vehicule`
  ADD CONSTRAINT `g_vehicule_ibfk_1` FOREIGN KEY (`v_fk_article_vehicule_id`) REFERENCES `g_article` (`a_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
