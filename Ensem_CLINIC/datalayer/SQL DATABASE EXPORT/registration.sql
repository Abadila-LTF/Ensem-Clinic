-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 02 fév. 2021 à 21:27
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `registration`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `AdminID` varchar(11) NOT NULL,
  `adminpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`AdminID`, `adminpassword`) VALUES
('abadila', '12345');

-- --------------------------------------------------------

--
-- Structure de la table `bookapp`
--

CREATE TABLE `bookapp` (
  `AppoID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `patientID` int(11) NOT NULL,
  `docID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `description`
--

CREATE TABLE `description` (
  `X` int(11) NOT NULL,
  `descID` int(11) NOT NULL,
  `descName` varchar(30) NOT NULL,
  `treatment` varchar(50) NOT NULL,
  `Note` varchar(200) NOT NULL,
  `doctorIDdesc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `doctor`
--

CREATE TABLE `doctor` (
  `DoctorID` int(11) NOT NULL,
  `Doctorname` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ContactNumber` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `categorey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ContactNumber` varchar(40) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Bloodtype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `AdminID` (`AdminID`);

--
-- Index pour la table `bookapp`
--
ALTER TABLE `bookapp`
  ADD PRIMARY KEY (`AppoID`),
  ADD UNIQUE KEY `Time` (`Time`),
  ADD KEY `patientoapp` (`patientID`),
  ADD KEY `doctopatient` (`docID`);

--
-- Index pour la table `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`X`),
  ADD KEY `descpatientID` (`descID`),
  ADD KEY `descDoctorID` (`doctorIDdesc`);

--
-- Index pour la table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bookapp`
--
ALTER TABLE `bookapp`
  MODIFY `AppoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `description`
--
ALTER TABLE `description`
  MODIFY `X` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bookapp`
--
ALTER TABLE `bookapp`
  ADD CONSTRAINT `doctopatient` FOREIGN KEY (`docID`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patientoapp` FOREIGN KEY (`patientID`) REFERENCES `patients` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `descDoctorID` FOREIGN KEY (`doctorIDdesc`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descpatientID` FOREIGN KEY (`descID`) REFERENCES `patients` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
