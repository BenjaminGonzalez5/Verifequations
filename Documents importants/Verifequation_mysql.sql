CREATE DATABASE verifequations;
USE verifequations;

CREATE TABLE `utilisateur` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `pseudo` varchar(255),
  `nom` varchar(255),
  `age` int,
  `email` varchar(255),
  `predilection` varchar(255),
  `created_at` timestamp,
  `avatar` int,
  `role` int,
  `etude` int,
  `niveau` int
);

CREATE TABLE `voter` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `votant` int,
  `vote` int
);

CREATE TABLE `avatar` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `chemin` varchar(255)
);

CREATE TABLE `role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `libelle` varchar(255)
);

CREATE TABLE `message` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `libelle` varchar(255),
  `contenu` text,
  `lu` boolean,
  `created_at` timestamp,
  `emmeteur` int,
  `recepteur` int
);

CREATE TABLE `etude` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `domaine` varchar(255)
);

CREATE TABLE `niveau` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `libelle` varchar(255)
);

CREATE TABLE `cours` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `titre` varchar(255),
  `created_at` timestamp,
  `niveau` int,
  `auteur` int
);

CREATE TABLE `chapitre` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `titre` varchar(255),
  `numero` int,
  `contenu` longtext,
  `cours` int
);

ALTER TABLE `utilisateur` ADD FOREIGN KEY (`id`) REFERENCES `voter` (`votant`);

ALTER TABLE `voter` ADD FOREIGN KEY (`vote`) REFERENCES `utilisateur` (`id`);

ALTER TABLE `utilisateur` ADD FOREIGN KEY (`avatar`) REFERENCES `avatar` (`id`);

ALTER TABLE `utilisateur` ADD FOREIGN KEY (`role`) REFERENCES `role` (`id`);

ALTER TABLE `message` ADD FOREIGN KEY (`emmeteur`) REFERENCES `utilisateur` (`id`);

ALTER TABLE `message` ADD FOREIGN KEY (`recepteur`) REFERENCES `utilisateur` (`id`);

ALTER TABLE `utilisateur` ADD FOREIGN KEY (`etude`) REFERENCES `etude` (`id`);

ALTER TABLE `utilisateur` ADD FOREIGN KEY (`niveau`) REFERENCES `niveau` (`id`);

ALTER TABLE `cours` ADD FOREIGN KEY (`niveau`) REFERENCES `niveau` (`id`);

ALTER TABLE `cours` ADD FOREIGN KEY (`auteur`) REFERENCES `utilisateur` (`id`);

ALTER TABLE `chapitre` ADD FOREIGN KEY (`cours`) REFERENCES `cours` (`id`);
