-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 07 Juin 2019 à 09:02
-- Version du serveur :  5.6.36
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestcom`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedureSelect` (IN `idUser` INT, OUT `log` VARCHAR(50))  BEGIN 
SELECT login into log FROM user WHERE id_user = idUser ;
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(150) NOT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `civilite` char(1) DEFAULT NULL,
  `numero` char(5) NOT NULL,
  `id_ville` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `adresse`, `date_naissance`, `civilite`, `numero`, `id_ville`) VALUES
(4, 'DUPOND', 'Paul', '11 rue de la liberté', '2000-01-14', NULL, '1234', 1),
(5, 'LA FONTAINE', 'Pierre', '1 avenue de Paris', '1990-12-10', NULL, '1235', 2),
(7, 'Dessard', 'Chris', '4 rue de Londres', NULL, 'M', '1237', 3),
(8, 'Farou', 'Joelle', '4 rue de Londres', NULL, 'F', '1238', 3),
(10, 'DESSARD', 'Laura', '5 rue de la liberté', NULL, 'F', '12310', 18),
(17, 'LEGRAND', 'Louis', '', NULL, NULL, '12317', NULL),
(18, 'ZADI', 'Joachim', NULL, NULL, 'M', '12318', NULL),
(19, 'HAGHIGHI', 'David', NULL, NULL, 'M', '12319', NULL),
(20, 'DEBLANGY', 'Claude', NULL, NULL, 'M', '12320', NULL),
(21, 'T.', 'Merlin', NULL, NULL, 'M', '12321', NULL),
(22, 'SANDRO', 'Rossi', NULL, NULL, 'M', '12322', NULL),
(23, 'KELMOH', 'Landry', NULL, NULL, 'M', '12323', NULL),
(24, 'ELALAMA', 'Mohamed', NULL, NULL, 'M', '12324', NULL),
(25, 'ATTAL', 'David', NULL, NULL, 'M', '12325', NULL),
(26, 'MATSIMA', 'Constant', NULL, NULL, 'M', '12326', NULL),
(27, 'OMARI', 'Youssef', NULL, NULL, 'M', '12327', NULL),
(28, 'RENAUD', 'Claude', NULL, NULL, 'M', '12328', NULL),
(29, 'EZZAT', 'Tarek', NULL, NULL, 'M', '12329', 2),
(30, 'ZOME', 'Christophe', '151 avenue de la république', '1992-07-16', 'M', '12330', 2),
(31, 'RODRIGUES JR.', 'Sidnei', '', NULL, 'M', '12331', 1),
(32, 'FEUZEU', 'Thierry', '', NULL, 'M', '12332', NULL),
(33, 'GRECEANU', 'Vincent', '', NULL, 'M', '12333', NULL),
(34, 'BOUKEBECHE', 'Madani', NULL, NULL, 'M', '12334', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `numero` char(5) NOT NULL,
  `id_client` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` decimal(15,0) DEFAULT NULL,
  `taux_remise` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date_commande`, `numero`, `id_client`, `id_produit`, `quantite`, `prix_unitaire`, `taux_remise`) VALUES
(1, '2018-09-01', '00001', 7, 3, 1, '899', 0),
(4, '2018-09-01', '00001', 7, 9, 2, '1299', 0),
(3, '2018-09-01', '00001', 7, 13, 1, '429', 0),
(2, '2018-09-11', '00002', 7, 3, 2, '899', 10),
(9, '2018-09-11', '00002', 7, 17, 10, '29', 20),
(5, '2018-12-28', '00003', 18, 4, 2, '750', 0),
(10, '2018-12-28', '00003', 18, 10, 3, '255', 0),
(12, '2018-12-28', '00003', 18, 13, 1, '429', 0),
(11, '2018-12-28', '00003', 18, 17, 5, '29', 0),
(15, '2018-12-31', '00004', 18, 1, 1, '999', 0),
(6, '2018-12-31', '00004', 18, 11, 11, '299', 0),
(7, '2018-12-25', '00005', 4, 5, 2, '799', 0),
(16, '2018-12-25', '00005', 4, 10, 2, '255', 0),
(13, '2018-12-25', '00005', 4, 15, 5, '499', 0),
(14, '2018-12-25', '00005', 4, 17, 3, '29', 0),
(8, '2018-11-11', '00006', 10, 9, 4, '45', 5);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `id_ville` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fournisseur`, `nom`, `id_ville`) VALUES
(1, 'MSI', 22),
(2, 'HP', 3),
(3, 'Dell', 2),
(4, 'Sony', 19),
(5, 'Apple', 3),
(6, 'Samsung', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `code_pays` char(2) NOT NULL,
  `nom` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`code_pays`, `nom`) VALUES
('FR', 'France'),
('UK', 'Royaume uni');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `libelle` varchar(150) NOT NULL,
  `prix_unitaire` decimal(15,3) NOT NULL,
  `reference` char(8) NOT NULL,
  `id_fournisseur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `libelle`, `prix_unitaire`, `reference`, `id_fournisseur`) VALUES
(1, 'PC Gamer', '999.000', 'MSIG111', 1),
(2, 'PC Gamer Killer', '1499.000', 'MSIGK12', 1),
(3, 'MSI Start', '899.000', 'MSIS01', 1),
(4, 'HP Pavillon', '750.000', 'HP1566', 2),
(5, 'HP Pavilion x360', '799.000', '11107712', 2),
(8, 'PC Gamer HP OMEN 17', '1099.000', 'an122nf', 2),
(9, 'PC Gamer HP OMEN 17', '1299.000', 'an106nf', 2),
(10, 'Imprimante lazer', '255.000', 'HPLZ123', 2),
(11, 'HP Jetencre Photosmart', '299.000', 'HPPS221', 2),
(12, 'Souris fast', '39.000', 'HP 721', 2),
(13, 'HP Ecran 21"', '429.000', 'HPS21', 2),
(14, 'Souris sans fil 5 boutons', '67.000', 'MSIM1251', 1),
(15, 'Ecran ultra rapide', '499.000', 'MSISUS', 1),
(16, 'HP Ecran extra plat 25"', '535.000', 'HPSUF', 2),
(17, 'Souris 3 boutons', '29.000', 'HPMB111', 2),
(19, 'Cartouche Encre HP JET Boir', '45.000', 'HPPS221N', 2);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_client` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_client`, `login`, `password`, `email`, `actif`) VALUES
(4, 'paul', 'abc', 'dp@gmail.com', 1),
(7, 'christo', 'cd', 'chis.d@tivipro.tv', 1),
(10, 'luara', 'azerty', 'laura@laposte.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id_ville` bigint(20) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `code_pays` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`id_ville`, `nom`, `code_postal`, `code_pays`) VALUES
(1, 'Malakoff', '92240', 'FR'),
(2, 'Lyon', '69003', 'FR'),
(3, 'Paris', '75008', 'FR'),
(11, 'Manchester', 'M11BA', 'UK'),
(18, 'Paris', '75014', 'FR'),
(19, 'Paris', '75001', 'FR'),
(20, 'Montrouge', '92120', 'FR'),
(21, 'Lyon', '69009', 'FR'),
(22, 'Londres', 'SW1X', 'UK'),
(23, 'Liverpool', 'L1OAA', 'UK');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `id_ville` (`id_ville`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_fournisseur`),
  ADD KEY `fournisseur_ville_FK` (`id_ville`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`code_pays`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `Produit_fournisseur_FK` (`id_fournisseur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id_ville`),
  ADD KEY `idx_code_pays` (`code_pays`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id_ville` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);



--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fournisseur_ville_FK` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `Produit_fournisseur_FK` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
