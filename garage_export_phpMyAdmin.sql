-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 26 nov. 2025 à 17:46
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
  `a_prix` float NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_article`
--

INSERT INTO `g_article` (`a_id`, `a_ref`, `a_qty`, `a_designation`, `a_marque`, `a_prix`) VALUES
(1, '7DJH423', 10, 'filtre à air', 'VALEO', 23),
(2, '5SQGD5Z', 25, 'filtre à GO', 'MECAFILTER', 40),
(3, '7DJT423', 33, 'filtre à pollen', 'BOSCH', 155),
(5, 'JKD7HP2', 2, 'filtre à air', 'BOSCH', 17),
(6, 'IPDT5HGS', 10, 'filtre à pollen', 'VALEO', 112),
(7, '7DQW423', 7, 'filtre à air', 'MAN', 24),
(8, '7DQW424', 23, 'filtre à huile', 'MAN', 67),
(9, '7DJT423', 22, 'filtre à pollen', 'BOSCH', 194),
(10, 'KT0WFQA', 60, 'Filtre pollen', 'MECAFILTER', 18.9),
(11, 'Q9DREJ6', 77, 'Filtre à huile', 'MAN FILTER', 22.5),
(12, 'S0PAHZF', 149, 'Filtre pollen', 'BOSCH', 19.9),
(13, 'BP5D3IW', 35, 'Filtre pollen', 'PURFLUX', 18.5),
(14, 'W7FGJ2S', 18, 'Filtre à huile', 'MAN FILTER', 21.5),
(15, 'DBAYMQE', 72, 'Filtre à huile', 'BOSCH', 21.9),
(16, '3XTBQ0F', 27, 'Filtre à carburant', 'BOSCH', 27.9),
(17, 'ZM3D8CY', 21, 'Filtre à air', 'MECAFILTER', 20.9),
(18, 'VLX51C6', 14, 'Filtre pollen', 'MAN FILTER', 17.9),
(19, '7I8BP13', 103, 'Filtre à carburant', 'PURFLUX', 29.9),
(20, 'YPEWALU', 66, 'Filtre à huile', 'MECAFILTER', 22.9),
(21, '958TEVW', 65, 'Filtre à huile', 'PURFLUX', 23.5),
(22, 'BK9P3DX', 38, 'Filtre pollen', 'PURFLUX', 18.9),
(23, '1HRM0Q5', 76, 'Filtre à air', 'PURFLUX', 21.9),
(24, 'OET09UZ', 49, 'Filtre à carburant', 'MECAFILTER', 26.9),
(25, 'Y13AT6N', 86, 'Filtre à air', 'VALEO', 20.5),
(26, 'XW46AJP', 111, 'Filtre à air', 'VALEO', 21.5),
(27, 'SFING8M', 64, 'Filtre à huile', 'PURFLUX', 23.9),
(28, 'IJ9LETP', 50, 'Filtre à carburant', 'PURFLUX', 28.5),
(29, 'QN12MF0', 36, 'Filtre à huile', 'PURFLUX', 22.9),
(30, 'P86LDZM', 142, 'Filtre à huile', 'MECAFILTER', 24.9),
(31, 'PFN8JCV', 15, 'Filtre à carburant', 'VALEO', 27.5),
(32, 'NA0LC8V', 52, 'Filtre à huile', 'MAN FILTER', 23.9),
(33, 'M2Y49OH', 115, 'Filtre à air', 'MECAFILTER', 21.9),
(34, '6G5W7TE', 14, 'Filtre pollen', 'MECAFILTER', 17.5),
(35, 'FODMYZ8', 21, 'Filtre pollen', 'MECAFILTER', 18.2),
(36, 'RK6027A', 96, 'Filtre à air', 'MECAFILTER', 21.4),
(37, 'REIHFAV', 110, 'Filtre à air', 'VALEO', 21.9),
(38, 'B1IEUN5', 116, 'Filtre pollen', 'MAN FILTER', 19.9),
(39, 'ATZ04QK', 82, 'Filtre à carburant', 'VALEO', 28.9),
(40, 'SUQGXFE', 39, 'Filtre à huile', 'PURFLUX', 23.5),
(41, 'GOW28RS', 101, 'Filtre pollen', 'MAN FILTER', 19.5),
(42, 'EBYSVAF', 30, 'Filtre à huile', 'BOSCH', 21.4),
(43, '12ZRBFY', 42, 'Filtre à carburant', 'VALEO', 26.5),
(44, 'Z9MF857', 74, 'Filtre à huile', 'BOSCH', 21.9),
(45, 'OU94KZJ', 45, 'Filtre pollen', 'MECAFILTER', 18.2),
(46, '651OAYG', 70, 'Filtre à carburant', 'PURFLUX', 27.9),
(47, 'Z580OU6', 93, 'Filtre à huile', 'PURFLUX', 24.2),
(48, 'HFS3QJZ', 143, 'Filtre pollen', 'PURFLUX', 19.9),
(49, 'I3BWHUD', 116, 'Filtre pollen', 'VALEO', 19.5),
(50, 'I3SUFQH', 67, 'Filtre pollen', 'VALEO', 18.7),
(51, 'J9OH2E4', 124, 'Filtre à carburant', 'VALEO', 29.5),
(52, 'WS7P3UF', 93, 'Filtre pollen', 'MAN FILTER', 19.2),
(53, 'PQ10675', 26, 'Filtre à carburant', 'PURFLUX', 27.4),
(54, '9KHOINR', 110, 'Filtre pollen', 'BOSCH', 19.8),
(55, 'PM5194Q', 39, 'Filtre à huile', 'PURFLUX', 23.4),
(56, 'DNCT6QB', 146, 'Filtre à carburant', 'BOSCH', 30.9),
(57, '473EL91', 150, 'Filtre à carburant', 'VALEO', 31.5),
(58, 'YT24QJN', 147, 'Filtre à carburant', 'VALEO', 31.2),
(59, 'NQEU9RV', 105, 'Filtre à carburant', 'VALEO', 29.9),
(60, '646fg77j', 44, 'filtre à air', 'MAN FILTER', 20.9),
(61, '646464646', 25, 'filtre à air', 'VALEO', 19.9),
(62, '46464gghlld', 22, 'Filtre à GO', 'BOSCH', 25.9),
(65, 'PFB001', 20, 'Plaquettes de frein AV', 'BOSCH', 69.9),
(66, 'PFB002', 15, 'Plaquettes de frein AR', 'BOSCH', 59.9),
(67, 'DISK001', 12, 'Disque de frein AV', 'VALEO', 89),
(68, 'BAT001', 8, 'Batterie 60Ah', 'EXIDE', 129.9),
(69, 'BAT002', 5, 'Batterie 70Ah', 'EXIDE', 149.9),
(70, 'WIP001', 40, 'Balais essuie-glace AV', 'VALEO', 24.9),
(71, 'WIP002', 25, 'Balais essuie-glace AR', 'VALEO', 14.9),
(72, 'BULB001', 50, 'Ampoule H7 55W', 'PHILIPS', 9.9),
(73, 'OIL001', 27, 'Bidon huile 5W30 5L', 'TOTAL', 49.9),
(74, 'CLT001', 18, 'Bidon liquide de refroidissement 5L', 'VALEO', 24.5);

-- --------------------------------------------------------

--
-- Structure de la table `g_client`
--

DROP TABLE IF EXISTS `g_client`;
CREATE TABLE IF NOT EXISTS `g_client` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_nom` varchar(50) DEFAULT NULL,
  `c_adresse` varchar(100) DEFAULT NULL,
  `c_telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_client`
--

INSERT INTO `g_client` (`c_id`, `c_nom`, `c_adresse`, `c_telephone`) VALUES
(1, 'Anissa Stanyland', '9 Eagan Junction', '4978486694'),
(2, 'Gillan De Michetti', '572 Bashford Street', '5688382641'),
(3, 'Mamie Trillow', '25 Superior Drive', '7725140478'),
(4, 'Britte Kleinmintz', '72 Hanover Pass', '4292779149'),
(5, 'Marlene Mansuer', '160 Warrior Avenue', '6013552895'),
(6, 'Whit Marzelo', '5721 Old Shore Parkway', '8965736159'),
(7, 'Jacobo Murdy', '6375 Spaight Junction', '1307630577'),
(8, 'Addi Vanichkin', '7495 Arrowood Drive', '4655466013'),
(9, 'Ashlie Cogin', '0631 Schlimgen Circle', '4422135471'),
(10, 'Zorina Dacke', '00464 Moland Pass', '6333524542'),
(11, 'Willem Wippermann', '29 Fremont Junction', '7544310630'),
(12, 'Fabian Synke', '3 North Park', '4638933585'),
(13, 'Carley Pownall', '28 Ryan Hill', '9227998755'),
(14, 'Damian Bisco', '9 Nova Trail', '9762391163'),
(15, 'Aylmer Pirolini', '55 West Point', '4201025145'),
(16, 'Alonzo Carlon', '5 Dottie Place', '8066855647'),
(17, 'Rivi Dumigan', '98131 Arkansas Parkway', '3894605899'),
(18, 'Keelia Lefley', '0351 Oriole Hill', '1302546770'),
(19, 'Terrence Towse', '1982 Roxbury Place', '5704293393'),
(20, 'Betteann Franklyn', '54541 Montana Center', '4566115474'),
(21, 'Janella Goolden', '8 Melby Center', '4448095977'),
(22, 'Nathanial Axe', '8808 Village Pass', '7383440937'),
(23, 'Olly Farebrother', '268 Eagle Crest Point', '3001529466'),
(24, 'Chance Piatek', '2 Waxwing Point', '8534528661'),
(25, 'Jerrold Gregoraci', '5214 Heath Park', '9344691608'),
(26, 'Jedediah Seagrove', '3249 Nancy Point', '4239330049'),
(27, 'Link Beeswing', '94652 Morningstar Terrace', '3852806652'),
(28, 'Rakel Blaxton', '6532 Dayton Court', '1123273980'),
(29, 'Sheba Rapier', '876 Ludington Junction', '5613987404'),
(30, 'Sabra Daventry', '5 Fallview Parkway', '4128164713'),
(31, 'Kaylee Hoodlass', '148 South Circle', '2285645355'),
(32, 'Roby Loveland', '746 Fordem Road', '4715503091'),
(33, 'Alfi O\'Curran', '2678 Lakeland Hill', '6907479395'),
(34, 'Benton Eagan', '74 Village Court', '8306467380'),
(35, 'Onofredo Playdon', '21 Johnson Junction', '6999939723'),
(36, 'Rebeca Braley', '9932 Jackson Point', '6469406667'),
(37, 'Port Beckham', '8511 Barby Lane', '1636932794'),
(38, 'Lorant Brimman', '5 Sloan Junction', '2046967741'),
(39, 'Doti Aspell', '23873 Mosinee Point', '8474908280'),
(40, 'Alvan Iorillo', '5 Golf View Avenue', '8083471224'),
(41, 'Celestine Couzens', '18860 Jackson Pass', '9945395827'),
(42, 'Spike Jeeks', '496 Harbort Trail', '4866734410'),
(43, 'Ilysa Harman', '52 Dixon Court', '6634290339'),
(44, 'Jakob Arger', '7 Briar Crest Circle', '9306764230'),
(45, 'Kelcey Kinver', '32616 Dixon Junction', '8157089291'),
(46, 'Aurie Woodrup', '1099 Nobel Center', '2442751335'),
(47, 'Janie Langham', '57226 Main Trail', '3191962722'),
(48, 'Ilene Hirschmann', '584 Roxbury Parkway', '1587434385'),
(49, 'Denis Macrow', '30 1st Way', '2259804427'),
(50, 'Sydelle Primrose', '7156 Eastwood Hill', '3368961984');

-- --------------------------------------------------------

--
-- Structure de la table `g_facture`
--

DROP TABLE IF EXISTS `g_facture`;
CREATE TABLE IF NOT EXISTS `g_facture` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_numero` varchar(30) NOT NULL,
  `f_date` date NOT NULL,
  `f_fk_or_id` int NOT NULL,
  `f_total_mo` decimal(10,2) NOT NULL,
  `f_total_articles` decimal(10,2) NOT NULL,
  `f_total_ttc` decimal(10,2) NOT NULL,
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `uq_facture_numero` (`f_numero`),
  KEY `fk_facture_or` (`f_fk_or_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_facture`
--

INSERT INTO `g_facture` (`f_id`, `f_numero`, `f_date`, `f_fk_or_id`, `f_total_mo`, `f_total_articles`, `f_total_ttc`) VALUES
(1, 'F2025-0001', '2025-11-26', 1, 235.00, 37.80, 272.80),
(2, 'F2025-0002', '2025-11-26', 5, 164.50, 144.70, 309.20);

--
-- Déclencheurs `g_facture`
--
DROP TRIGGER IF EXISTS `trg_facture_calc_totals_before_ins`;
DELIMITER $$
CREATE TRIGGER `trg_facture_calc_totals_before_ins` BEFORE INSERT ON `g_facture` FOR EACH ROW BEGIN
    DECLARE total_articles DECIMAL(10,2);
    DECLARE mo_montant DECIMAL(10,2);

    -- compute total articles for this repair order
    SELECT IFNULL(SUM(ora_montant_a), 0)
    INTO total_articles
    FROM g_ordre_reparation_article
    WHERE ora_fk_ora_or_id = NEW.f_fk_or_id;

    -- get labour amount from repair order
    SELECT or_montant_mo
    INTO mo_montant
    FROM g_ordre_reparation
    WHERE or_id = NEW.f_fk_or_id;

    -- assign computed amounts to NEW row
    SET NEW.f_total_mo = mo_montant;
    SET NEW.f_total_articles = total_articles;
    SET NEW.f_total_ttc = NEW.f_total_mo + total_articles;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `g_main_doeuvre`
--

DROP TABLE IF EXISTS `g_main_doeuvre`;
CREATE TABLE IF NOT EXISTS `g_main_doeuvre` (
  `mo_id` int NOT NULL AUTO_INCREMENT,
  `mo_tarif_horaire` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`mo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_main_doeuvre`
--

INSERT INTO `g_main_doeuvre` (`mo_id`, `mo_tarif_horaire`) VALUES
(1, 94.00);

-- --------------------------------------------------------

--
-- Structure de la table `g_ordre_reparation`
--

DROP TABLE IF EXISTS `g_ordre_reparation`;
CREATE TABLE IF NOT EXISTS `g_ordre_reparation` (
  `or_id` int NOT NULL AUTO_INCREMENT,
  `or_main_doeuvre_qty` float(5,2) DEFAULT NULL,
  `or_montant_mo` float(10,2) DEFAULT NULL,
  `or_fk_or_vclient_id` int NOT NULL,
  `or_fk_or_g_main_doeuvre_id` int NOT NULL,
  PRIMARY KEY (`or_id`),
  KEY `or_fk_or_vclient_id` (`or_fk_or_vclient_id`),
  KEY `fk_or_main_doeuvre` (`or_fk_or_g_main_doeuvre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_ordre_reparation`
--

INSERT INTO `g_ordre_reparation` (`or_id`, `or_main_doeuvre_qty`, `or_montant_mo`, `or_fk_or_vclient_id`, `or_fk_or_g_main_doeuvre_id`) VALUES
(1, 2.50, 235.00, 1, 1),
(2, 2.00, 188.00, 3, 1),
(3, 2.75, 258.50, 4, 1),
(4, 1.50, 141.00, 9, 1),
(5, 1.75, 164.50, 3, 1),
(6, 1.00, 94.00, 7, 1),
(7, 2.00, 188.00, 1, 1);

--
-- Déclencheurs `g_ordre_reparation`
--
DROP TRIGGER IF EXISTS `trg_or_calc_mo_before_ins`;
DELIMITER $$
CREATE TRIGGER `trg_or_calc_mo_before_ins` BEFORE INSERT ON `g_ordre_reparation` FOR EACH ROW BEGIN
    DECLARE mo_tarif DECIMAL(10,2);  -- ici c'est plus explicite

    SELECT mo_tarif_horaire
    INTO mo_tarif
    FROM g_main_doeuvre
    WHERE mo_id = NEW.or_fk_or_g_main_doeuvre_id;

    SET NEW.or_montant_mo = NEW.or_main_doeuvre_qty * mo_tarif;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trg_or_calc_mo_before_upd`;
DELIMITER $$
CREATE TRIGGER `trg_or_calc_mo_before_upd` BEFORE UPDATE ON `g_ordre_reparation` FOR EACH ROW BEGIN
    DECLARE mo_tarif DECIMAL(10,2);

    SELECT mo_tarif_horaire
    INTO mo_tarif
    FROM g_main_doeuvre
    WHERE mo_id = NEW.or_fk_or_g_main_doeuvre_id;

    SET NEW.or_montant_mo = NEW.or_main_doeuvre_qty * mo_tarif;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `g_ordre_reparation_article`
--

DROP TABLE IF EXISTS `g_ordre_reparation_article`;
CREATE TABLE IF NOT EXISTS `g_ordre_reparation_article` (
  `ora_id` int NOT NULL AUTO_INCREMENT,
  `ora_qty` float(5,2) DEFAULT NULL,
  `ora_montant_a` float(10,2) DEFAULT NULL,
  `ora_fk_ora_article_id` int NOT NULL,
  `ora_fk_ora_or_id` int NOT NULL,
  PRIMARY KEY (`ora_id`),
  KEY `ora_fk_ora_article_id` (`ora_fk_ora_article_id`),
  KEY `ora_fk_ora_or_id` (`ora_fk_ora_or_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_ordre_reparation_article`
--

INSERT INTO `g_ordre_reparation_article` (`ora_id`, `ora_qty`, `ora_montant_a`, `ora_fk_ora_article_id`, `ora_fk_ora_or_id`) VALUES
(1, 2.00, 37.80, 10, 1),
(2, 1.00, 49.90, 73, 2),
(3, 2.00, 47.00, 40, 2),
(4, 2.00, 178.00, 67, 3),
(5, 2.00, 139.80, 65, 3),
(6, 1.00, 129.90, 68, 4),
(7, 1.00, 24.90, 70, 4),
(8, 1.00, 69.90, 65, 5),
(9, 1.00, 24.90, 70, 5),
(10, 1.00, 49.90, 73, 5),
(11, 3.00, 149.70, 73, 7);

--
-- Déclencheurs `g_ordre_reparation_article`
--
DROP TRIGGER IF EXISTS `trg_ora_calc_montant_before_ins`;
DELIMITER $$
CREATE TRIGGER `trg_ora_calc_montant_before_ins` BEFORE INSERT ON `g_ordre_reparation_article` FOR EACH ROW BEGIN
    DECLARE article_prix DECIMAL(10,2);  -- prix unitaire
    DECLARE stock_actuel INT;            -- stock disponible

    -- Recup prix & stock
    SELECT a_prix, a_qty
    INTO article_prix, stock_actuel
    FROM g_article
    WHERE a_id = NEW.ora_fk_ora_article_id;

    -- Verif stock
    IF stock_actuel < NEW.ora_qty THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuffisant';
    END IF;

    -- Déduire article du stock
    UPDATE g_article
    SET a_qty = a_qty - NEW.ora_qty
    WHERE a_id = NEW.ora_fk_ora_article_id;

    -- Calcul montant_a
    SET NEW.ora_montant_a = NEW.ora_qty * article_prix;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trg_ora_calc_montant_before_upd`;
DELIMITER $$
CREATE TRIGGER `trg_ora_calc_montant_before_upd` BEFORE UPDATE ON `g_ordre_reparation_article` FOR EACH ROW BEGIN
    DECLARE article_prix DECIMAL(10,2);  -- unit article price

    -- get unit price from g_article
    SELECT a_prix
    INTO article_prix
    FROM g_article
    WHERE a_id = NEW.ora_fk_ora_article_id;

    -- recompute line amount when qty or article changes
    SET NEW.ora_montant_a = NEW.ora_qty * article_prix;
END
$$
DELIMITER ;

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
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_vehicule`
--

INSERT INTO `g_vehicule` (`v_id`, `v_type`, `v_energie`, `v_marque`) VALUES
(1, '500', 'ESSENCE', 'FIAT'),
(2, 'YARIS', 'DIESEL', 'TOYOTA'),
(5, 'C3', 'DIESEL', 'CITROEN'),
(9, '208', 'ESSENCE', 'PEUGEOT'),
(10, 'MEGANE', 'ESSENCE', 'RENAULT'),
(201, 'A180', 'HYBRIDE', 'MERCEDES'),
(202, 'YARIS', 'ESSENCE', 'TOYOTA'),
(204, '308', 'DIESEL', 'PEUGEOT'),
(206, '308', 'ESSENCE', 'PEUGEOT'),
(207, 'A180', 'ESSENCE', 'MERCEDES'),
(208, '308', 'HYBRIDE', 'PEUGEOT'),
(213, '500', 'HYBRIDE', 'FIAT'),
(214, '500', 'DIESEL', 'FIAT'),
(215, 'A180', 'DIESEL', 'MERCEDES'),
(216, 'C3', 'ESSENCE', 'CITROEN'),
(220, 'CLIO', 'DIESEL', 'RENAULT'),
(231, 'YARIS', 'HYBRIDE', 'TOYOTA'),
(255, 'CLIO', 'HYBRIDE', 'RENAULT'),
(256, 'CLIO', 'ESSENCE', 'RENAULT'),
(261, 'C3', 'HYBRIDE', 'CITROEN'),
(262, 'CLIO ESTATE', 'ESSENCE', 'RENAULT');

-- --------------------------------------------------------

--
-- Structure de la table `g_vehicule_article`
--

DROP TABLE IF EXISTS `g_vehicule_article`;
CREATE TABLE IF NOT EXISTS `g_vehicule_article` (
  `va_id` int NOT NULL AUTO_INCREMENT,
  `va_fk_vehicule_id` int NOT NULL,
  `va_fk_article_id` int NOT NULL,
  PRIMARY KEY (`va_id`),
  UNIQUE KEY `uq_va` (`va_fk_vehicule_id`,`va_fk_article_id`),
  KEY `fk_va_article` (`va_fk_article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=726 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_vehicule_article`
--

INSERT INTO `g_vehicule_article` (`va_id`, `va_fk_vehicule_id`, `va_fk_article_id`) VALUES
(642, 1, 1),
(643, 1, 10),
(644, 1, 20),
(645, 1, 65),
(7, 1, 70),
(134, 1, 71),
(261, 1, 72),
(388, 1, 73),
(515, 1, 74),
(647, 2, 2),
(646, 2, 17),
(648, 2, 22),
(649, 2, 66),
(8, 2, 70),
(135, 2, 71),
(262, 2, 72),
(389, 2, 73),
(516, 2, 74),
(651, 5, 19),
(650, 5, 23),
(652, 5, 34),
(653, 5, 65),
(9, 5, 70),
(136, 5, 71),
(263, 5, 72),
(390, 5, 73),
(517, 5, 74),
(654, 9, 25),
(655, 9, 31),
(656, 9, 35),
(657, 9, 67),
(10, 9, 70),
(137, 9, 71),
(264, 9, 72),
(391, 9, 73),
(518, 9, 74),
(658, 10, 26),
(660, 10, 41),
(659, 10, 43),
(661, 10, 65),
(11, 10, 70),
(138, 10, 71),
(265, 10, 72),
(392, 10, 73),
(519, 10, 74),
(663, 201, 24),
(662, 201, 33),
(664, 201, 38),
(665, 201, 65),
(12, 201, 70),
(139, 201, 71),
(266, 201, 72),
(393, 201, 73),
(520, 201, 74),
(666, 202, 17),
(667, 202, 31),
(668, 202, 34),
(669, 202, 65),
(13, 202, 70),
(140, 202, 71),
(267, 202, 72),
(394, 202, 73),
(521, 202, 74),
(670, 204, 36),
(3, 204, 39),
(671, 204, 46),
(672, 204, 48),
(4, 204, 65),
(673, 204, 66),
(15, 204, 70),
(142, 204, 71),
(269, 204, 72),
(396, 204, 73),
(523, 204, 74),
(675, 206, 31),
(674, 206, 33),
(676, 206, 34),
(677, 206, 65),
(17, 206, 70),
(144, 206, 71),
(271, 206, 72),
(398, 206, 73),
(525, 206, 74),
(679, 207, 31),
(678, 207, 33),
(680, 207, 34),
(681, 207, 65),
(18, 207, 70),
(145, 207, 71),
(272, 207, 72),
(399, 207, 73),
(526, 207, 74),
(683, 208, 24),
(682, 208, 36),
(684, 208, 38),
(685, 208, 65),
(19, 208, 70),
(146, 208, 71),
(273, 208, 72),
(400, 208, 73),
(527, 208, 74),
(688, 213, 21),
(686, 213, 33),
(687, 213, 38),
(689, 213, 65),
(24, 213, 70),
(151, 213, 71),
(278, 213, 72),
(405, 213, 73),
(532, 213, 74),
(691, 214, 24),
(690, 214, 36),
(692, 214, 48),
(693, 214, 66),
(25, 214, 70),
(152, 214, 71),
(279, 214, 72),
(406, 214, 73),
(533, 214, 74),
(695, 215, 19),
(694, 215, 36),
(696, 215, 41),
(697, 215, 66),
(26, 215, 70),
(153, 215, 71),
(280, 215, 72),
(407, 215, 73),
(534, 215, 74),
(699, 216, 24),
(698, 216, 33),
(700, 216, 35),
(701, 216, 65),
(27, 216, 70),
(154, 216, 71),
(281, 216, 72),
(408, 216, 73),
(535, 216, 74),
(703, 220, 19),
(702, 220, 23),
(704, 220, 49),
(705, 220, 66),
(31, 220, 70),
(158, 220, 71),
(285, 220, 72),
(412, 220, 73),
(539, 220, 74),
(707, 231, 24),
(706, 231, 33),
(708, 231, 38),
(709, 231, 65),
(42, 231, 70),
(169, 231, 71),
(296, 231, 72),
(423, 231, 73),
(550, 231, 74),
(710, 255, 37),
(711, 255, 43),
(712, 255, 50),
(713, 255, 65),
(66, 255, 70),
(193, 255, 71),
(320, 255, 72),
(447, 255, 73),
(574, 255, 74),
(714, 256, 37),
(715, 256, 51),
(716, 256, 52),
(717, 256, 65),
(67, 256, 70),
(194, 256, 71),
(321, 256, 72),
(448, 256, 73),
(575, 256, 74),
(718, 261, 36),
(719, 261, 39),
(720, 261, 45),
(721, 261, 65),
(72, 261, 70),
(199, 261, 71),
(326, 261, 72),
(453, 261, 73),
(580, 261, 74),
(722, 262, 37),
(724, 262, 54),
(723, 262, 59),
(725, 262, 65),
(73, 262, 70),
(200, 262, 71),
(327, 262, 72),
(454, 262, 73),
(581, 262, 74);

-- --------------------------------------------------------

--
-- Structure de la table `g_vehicule_client`
--

DROP TABLE IF EXISTS `g_vehicule_client`;
CREATE TABLE IF NOT EXISTS `g_vehicule_client` (
  `vc_id` int NOT NULL AUTO_INCREMENT,
  `vc_plaque` varchar(15) DEFAULT NULL,
  `vc_annee` int NOT NULL,
  `vc_fk_catalogue_vehicule_id` int NOT NULL,
  `vc_fk_client_vehicule_id` int NOT NULL,
  PRIMARY KEY (`vc_id`),
  KEY `vc_fk_catalogue_vehicule_id` (`vc_fk_catalogue_vehicule_id`),
  KEY `vc_fk_client_vehicule_id` (`vc_fk_client_vehicule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `g_vehicule_client`
--

INSERT INTO `g_vehicule_client` (`vc_id`, `vc_plaque`, `vc_annee`, `vc_fk_catalogue_vehicule_id`, `vc_fk_client_vehicule_id`) VALUES
(1, 'AA-123-AA', 2018, 1, 1),
(2, 'BB-456-BB', 2016, 2, 2),
(3, 'CC-789-CC', 2021, 208, 3),
(4, 'DD-321-DD', 2015, 220, 4),
(5, 'EE-654-EE', 2019, 216, 5),
(6, 'FF-987-FF', 2020, 215, 6),
(7, 'GG-159-GG', 2022, 231, 7),
(8, 'HH-753-HH', 2017, 214, 8),
(9, 'JJ-258-JJ', 2021, 255, 9),
(10, 'KK-852-KK', 2014, 204, 10),
(11, 'LL-111-LL', 2016, 220, 1),
(12, 'MM-222-MM', 2019, 202, 2),
(13, 'NN-333-NN', 2018, 256, 3),
(14, 'DD-654-DD', 2019, 206, 4),
(15, 'EE-987-EE', 2020, 213, 5),
(16, 'OO-444-OO', 2022, 261, 11);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_facture`
--
ALTER TABLE `g_facture`
  ADD CONSTRAINT `fk_facture_or` FOREIGN KEY (`f_fk_or_id`) REFERENCES `g_ordre_reparation` (`or_id`);

--
-- Contraintes pour la table `g_ordre_reparation`
--
ALTER TABLE `g_ordre_reparation`
  ADD CONSTRAINT `fk_or_main_doeuvre` FOREIGN KEY (`or_fk_or_g_main_doeuvre_id`) REFERENCES `g_main_doeuvre` (`mo_id`),
  ADD CONSTRAINT `g_ordre_reparation_ibfk_1` FOREIGN KEY (`or_fk_or_vclient_id`) REFERENCES `g_vehicule_client` (`vc_id`);

--
-- Contraintes pour la table `g_ordre_reparation_article`
--
ALTER TABLE `g_ordre_reparation_article`
  ADD CONSTRAINT `g_ordre_reparation_article_ibfk_1` FOREIGN KEY (`ora_fk_ora_article_id`) REFERENCES `g_article` (`a_id`),
  ADD CONSTRAINT `g_ordre_reparation_article_ibfk_2` FOREIGN KEY (`ora_fk_ora_or_id`) REFERENCES `g_ordre_reparation` (`or_id`);

--
-- Contraintes pour la table `g_vehicule_article`
--
ALTER TABLE `g_vehicule_article`
  ADD CONSTRAINT `fk_va_article` FOREIGN KEY (`va_fk_article_id`) REFERENCES `g_article` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_va_vehicule` FOREIGN KEY (`va_fk_vehicule_id`) REFERENCES `g_vehicule` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `g_vehicule_client`
--
ALTER TABLE `g_vehicule_client`
  ADD CONSTRAINT `g_vehicule_client_ibfk_1` FOREIGN KEY (`vc_fk_catalogue_vehicule_id`) REFERENCES `g_vehicule` (`v_id`),
  ADD CONSTRAINT `g_vehicule_client_ibfk_2` FOREIGN KEY (`vc_fk_client_vehicule_id`) REFERENCES `g_client` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
