-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 25 Janvier 2018 à 15:09
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `base_inspection_cdg`
--

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `NUM_LIEU` smallint(6) NOT NULL,
  `NUM_GROUPE_LIEU` smallint(6) NOT NULL,
  `NOM_LIEU` varchar(32) DEFAULT NULL,
  `code_lieu` int(11) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lieu`
--

INSERT INTO `lieu` (`NUM_LIEU`, `NUM_GROUPE_LIEU`, `NOM_LIEU`, `code_lieu`, `PICTOS`) VALUES
(1, 1, 'Atelier principal', 0, ''),
(2, 1, 'Service Espaces verts', 0, ''),
(3, 1, 'Service voirie', 0, ''),
(4, 1, 'Atelier soudage / meulage', 0, ''),
(5, 1, 'Atelier menuiserie', 0, ''),
(8, 1, 'Atelier peinture', 0, ''),
(10, 1, 'Atelier électricité', 0, ''),
(13, 1, 'Magasin / Stock', 0, ''),
(16, 2, 'Vestiaires', 0, ''),
(18, 2, 'Sanitaires', 0, ''),
(20, 2, 'Cuisine', 0, ''),
(21, 2, 'Salle de pause', 0, ''),
(22, 2, 'Salle de repos', 0, ''),
(26, 2, 'Chambres', 0, ''),
(30, 3, 'Toiture', 0, ''),
(31, 3, 'Mezzanine', 0, ''),
(32, 3, 'Estrade', 0, ''),
(33, 3, 'Combles', 0, ''),
(34, 3, 'Sous sol', 0, ''),
(35, 3, 'Dortoir', 0, ''),
(38, 4, 'Armoire produits chimiques', 0, ''),
(39, 4, 'Armoire produits phytosanitaires', 0, ''),
(40, 4, 'Local produits chimiques', 0, ''),
(41, 4, 'Local produits inflammables', 0, ''),
(42, 4, 'Local produits d’entretien', 0, ''),
(43, 4, 'Local de stockage', 0, ''),
(44, 4, 'Local technique', 0, ''),
(45, 4, 'Local poubelles', 0, ''),
(46, 4, 'Local petit matériel', 0, ''),
(47, 4, 'Stock alimentaire', 0, ''),
(48, 4, 'Stockage consommables', 0, ''),
(49, 4, 'Local chaudière/ chaufferie', 0, ''),
(50, 5, 'Salle de repos', 0, ''),
(51, 5, 'Salle de pause', 0, ''),
(52, 5, 'Réfectoire', 0, ''),
(53, 5, 'Salle de réunion', 0, ''),
(54, 5, 'Salle du conseil', 0, ''),
(55, 5, 'Salle des mariages', 0, ''),
(56, 5, 'Salle de classe', 0, ''),
(57, 5, 'Salle de jeux', 0, ''),
(58, 5, 'Salle de loisirs', 0, ''),
(59, 5, 'Salle de motricité', 0, ''),
(60, 6, 'Accueil', 0, ''),
(66, 5, 'Salle de soins', 0, ''),
(69, 1, 'Illuminations de noël', 0, ''),
(71, 6, 'Secrétariat', 0, ''),
(72, 6, 'Bureau', 0, ''),
(73, 6, 'Bureau des élus', 0, ''),
(74, 6, 'Bureau Autorité Territoriale', 0, ''),
(75, 5, 'Salle principale', 0, ''),
(76, 6, 'Salle du conseil', 0, ''),
(77, 6, 'Salle des mariages', 0, ''),
(79, 8, 'Garage Véhicules', 0, ''),
(80, 9, 'Structure globale', 0, ''),
(81, 7, 'Bassin', 0, ''),
(82, 7, 'Puit', 0, ''),
(83, 7, 'Poste de relevage', 0, ''),
(84, 7, 'Réservoir', 0, ''),
(85, 7, 'Eco-point', 0, ''),
(86, 7, 'Laboratoire', 0, ''),
(87, 7, 'Quai', 0, ''),
(88, 7, 'Bas de quai', 0, ''),
(89, 8, 'Véhicules', 0, ''),
(90, 8, 'Engins', 0, ''),
(91, 8, 'Tracteur', 0, ''),
(92, 8, 'Tractopelle', 0, ''),
(93, 8, 'Tracteur épareuse', 0, ''),
(94, 8, 'Tondeuse autoportée', 0, ''),
(95, 8, 'Matériel porté', 0, ''),
(96, 8, 'Matériel tracté', 0, ''),
(97, 6, 'Archives', 0, ''),
(98, 8, 'Voiture', 0, ''),
(99, 8, 'Camion', 0, 'fa-truck'),
(100, 8, 'Fourgon / camionnette', 0, ''),
(102, 7, 'Haut de quai', 0, ''),
(103, 2, 'Escalier', 0, ''),
(104, 2, 'Couloir', 0, ''),
(106, 1, 'Service eau / assainissement', 0, ''),
(107, 10, 'Réception marchandises', 0, ''),
(108, 3, 'Vide-sanitaire', 0, ''),
(109, 10, 'Local poubelles', 0, ''),
(110, 10, 'Réserve', 0, ''),
(111, 10, 'Plonge', 0, ''),
(112, 10, 'Légumerie', 0, ''),
(113, 10, 'Salle à manger', 0, ''),
(114, 10, 'Cuisine', 0, ''),
(115, 10, 'Préparation chaude', 0, ''),
(116, 10, 'Préparation froide', 0, ''),
(118, 2, 'Voie d\'accès', 0, '');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`NUM_LIEU`),
  ADD KEY `I_FK_LIEU_GROUPE_LIEU` (`NUM_GROUPE_LIEU`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
