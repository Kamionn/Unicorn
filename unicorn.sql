-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 24 juin 2022 à 20:31
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `localhost_legacy_1.7`
--


INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_unicorn', 'unicorn', 1);

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_unicorn', 'unicorn', 1);

INSERT INTO `jobs` (`name`, `label`) VALUES
('unicorn', 'unicorn');

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('unicorn', 0, 'stage', 'stagiaire', 0, '', ''),
('unicorn', 1, 'worker', 'Employer', 0, '', ''),
('unicorn', 2, 'barman', 'Barman', 400, '', ''),
('unicorn', 3, 'securite', 'Agent de sécurité', 0, '', ''),
('unicorn', 4, 'boss', 'Patron', 500, '', '');
