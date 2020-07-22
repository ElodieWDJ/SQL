-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le : Lun 11 Février 2013 à 13:26
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `sitemarchand`
--
create database sitemarchand;

-- On pointe sur notre BDD
use sitemarchand;
-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `code` char(6) NOT NULL,
  `libelle` char(80) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`code`, `libelle`) VALUES
('AN0', 'Bagues avec diamants'),
('AN1', 'Bagues avec perles et pierres'),
('B0', 'Bracelets avec pierres'),
('B1', 'Bracelets avec perles'),
('B2', 'Bracelets avec ambre'),
('G0', 'Colliers avec pierres'),
('G1', 'Colliers avec perles'),
('G2', 'Colliers avec ambre'),
('OR0', 'Boucles d''oreilles avec pierres'),
('OR1', 'Boucles d''oreille avec perles'),
('OR2', 'Boucles d''oreille avec ambre'),
('OR3', 'Boucles d''oreille avec or');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ident` char(12) NOT NULL,
  `mdp` char(12) DEFAULT NULL,
  `nom` char(60) DEFAULT NULL,
  `prenom` char(60) DEFAULT NULL,
  `rue` char(60) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(60) DEFAULT NULL,
  `email` char(60) DEFAULT NULL,
  `tel` char(15) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ident`, `mdp`, `nom`, `prenom`, `rue`, `cp`,
 `ville`, `email`, `tel`, `admin`) VALUES
('i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 0),
('test', 'test', 'test', 'test', 'test', '35000', 'test', 
'test@gmail.com', 'test', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `dateCommande` date DEFAULT NULL,
  `identClient` char(12) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `commande_ibfk_1` (`identClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE IF NOT EXISTS `lignecommande` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCommande` int(11) NOT NULL,
  `referenceProduit` char(12) NOT NULL,
  `qte` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_numeroCommande` (`numeroCommande`),
  KEY `FK_refProduit` (`referenceProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `reference` char(10) NOT NULL,
  `designation` char(255) DEFAULT NULL,
  `prixHT` decimal(10,2) DEFAULT NULL,
  `image` char(30) DEFAULT NULL,
  `codeCategorie` char(6) DEFAULT NULL,
  `Actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`reference`),
  KEY `produit_ibfk_1` (`codeCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`reference`, `designation`, `prixHT`,
 `image`, `codeCategorie`, `Actif`) VALUES
('AN001', 'bouquet de perles', '82.00', 'AN001.jpg', 'AN0', 0),
('AN101', 'or blanc et diamant', '173.00', 'AN101.jpg', 'AN1', 0),
('B001', 'trois fils Tourmalines', '127.00', 'B001.jpg', 'B0', 1),
('B002', 'pierres variées', '84.00', 'B002.jpg', 'B0', 1),
('B003', 'tourmaline', '46.00', 'B003.jpg', 'B0', 1),
('B004', 'aquamarine milk', '134.00', 'B004.jpg', 'B0', 0),
('B005', 'onyx perles granats rouges rondes', '83.00', 'B005.jpg', 'B0', 0),
('B007', 'or et corail', '78.00', 'B007.jpg', 'B0', 1),
('B102', 'chaines or et perles', '76.00', 'B102.jpg', 'B1', 1),
('B103', 'rigido con 1 perla', '107.00', 'B103.jpg', 'B1', 1),
('B104', 'or perles et rondelle de nacre au centre', '54.00', 'B104.jpg', 'B1', 1),
('B105', 'rigido con ch madreparla', '173.00', 'B105.jpg', 'B1', 1),
('B202', 'or et ambre', '133.00', 'B202.jpg', 'B2', 1),
('B203', 'or ambre et fermeture standard', '109.00', 'B203.jpg', 'B2', 0),
('G001', 'or nacre rose et perle', '77.00', 'G001.jpg', 'G0', 1),
('G002', 'perles onyx et granat', '154.00', 'G002.jpg', 'G0', 1),
('G102', 'or et tourmaline', '207.00', 'G102.jpg', 'G1', 1),
('G103', 'or et granat noir', '85.00', 'G103.jpg', 'G1', 1),
('G104', 'acquamarine milk perle baroque et ficelle', '59.50', 'G104.jpg', 'G1', 0),
('G105', 'trois acquamarines milk plates et ficelle', '72.00', 'G105.jpg', 'G1', 1),
('G201', 'or et ambre', '181.00', 'G201.jpg', 'G2', 0),
('OR101', 'spirales or et perles', '66.00', 'OR101.jpg', 'OR1', 1),
('OR102', '1/2 boulle avec 2 perles', '39.00', 'OR102.jpg', 'OR1', 0),
('OR201', 'or et ambre', '53.00', 'OR201.jpg', 'OR2', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`identClient`) 
  REFERENCES `client` (`ident`);

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `lignecommande_ibfk_3` 
  FOREIGN KEY (`numeroCommande`) REFERENCES `commande` (`numero`),
  ADD CONSTRAINT `lignecommande_ibfk_4` 
  FOREIGN KEY (`referenceProduit`) REFERENCES `produit` (`reference`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`codeCategorie`) 
  REFERENCES `categorie` (`code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
