-- Adminer 4.8.1 MySQL 5.5.5-10.3.29-MariaDB-0+deb10u1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution',	'Caution',	0),
('society_cardealer',	'Concessionnaire',	1),
('society_police',	'Police',	1);

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1,	'society_cardealer',	0,	NULL),
(2,	'society_police',	0,	NULL);

DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_cardealer',	'Concesionnaire',	1),
('society_police',	'Police',	1);

DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `datastore`;
CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_police',	'Police',	1);

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1,	'society_police',	NULL,	'{}');

DROP TABLE IF EXISTS `dpkeybinds`;
CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1,	'Usage abusif du klaxon',	30,	0),
(2,	'Franchir une ligne continue',	40,	0),
(3,	'Circulation à contresens',	250,	0),
(4,	'Demi-tour non autorisé',	250,	0),
(5,	'Circulation hors-route',	170,	0),
(6,	'Non-respect des distances de sécurité',	30,	0),
(7,	'Arrêt dangereux / interdit',	150,	0),
(8,	'Stationnement gênant / interdit',	70,	0),
(9,	'Non respect  de la priorité à droite',	70,	0),
(10,	'Non-respect à un véhicule prioritaire',	90,	0),
(11,	'Non-respect d\'un stop',	105,	0),
(12,	'Non-respect d\'un feu rouge',	130,	0),
(13,	'Dépassement dangereux',	100,	0),
(14,	'Véhicule non en état',	100,	0),
(15,	'Conduite sans permis',	1500,	0),
(16,	'Délit de fuite',	800,	0),
(17,	'Excès de vitesse < 5 kmh',	90,	0),
(18,	'Excès de vitesse 5-15 kmh',	120,	0),
(19,	'Excès de vitesse 15-30 kmh',	180,	0),
(20,	'Excès de vitesse > 30 kmh',	300,	0),
(21,	'Entrave de la circulation',	110,	1),
(22,	'Dégradation de la voie publique',	90,	1),
(23,	'Trouble à l\'ordre publique',	90,	1),
(24,	'Entrave opération de police',	130,	1),
(25,	'Insulte envers / entre civils',	75,	1),
(26,	'Outrage à agent de police',	110,	1),
(27,	'Menace verbale ou intimidation envers civil',	90,	1),
(28,	'Menace verbale ou intimidation envers policier',	150,	1),
(29,	'Manifestation illégale',	250,	1),
(30,	'Tentative de corruption',	1500,	1),
(31,	'Arme blanche sortie en ville',	120,	2),
(32,	'Arme léthale sortie en ville',	300,	2),
(33,	'Port d\'arme non autorisé (défaut de license)',	600,	2),
(34,	'Port d\'arme illégal',	700,	2),
(35,	'Pris en flag lockpick',	300,	2),
(36,	'Vol de voiture',	1800,	2),
(37,	'Vente de drogue',	1500,	2),
(38,	'Fabriquation de drogue',	1500,	2),
(39,	'Possession de drogue',	650,	2),
(40,	'Prise d\'ôtage civil',	1500,	2),
(41,	'Prise d\'ôtage agent de l\'état',	2000,	2),
(42,	'Braquage particulier',	650,	2),
(43,	'Braquage magasin',	650,	2),
(44,	'Braquage de banque',	1500,	2),
(45,	'Tir sur civil',	2000,	3),
(46,	'Tir sur agent de l\'état',	2500,	3),
(47,	'Tentative de meurtre sur civil',	3000,	3),
(48,	'Tentative de meurtre sur agent de l\'état',	5000,	3),
(49,	'Meurtre sur civil',	10000,	3),
(50,	'Meurte sur agent de l\'état',	30000,	3),
(51,	'Meurtre involontaire',	1800,	3),
(52,	'Escroquerie à l\'entreprise',	2000,	2);

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('alive_chicken',	'Poulet vivant',	1,	0,	1),
('bread',	'Bread',	1,	0,	1),
('clothe',	'Vêtement',	1,	0,	1),
('copper',	'Cuivre',	1,	0,	1),
('cutted_wood',	'Bois coupé',	1,	0,	1),
('diamond',	'Diamant',	1,	0,	1),
('essence',	'Essence',	1,	0,	1),
('fabric',	'Tissu',	1,	0,	1),
('fish',	'Poisson',	1,	0,	1),
('gold',	'Or',	1,	0,	1),
('iron',	'Fer',	1,	0,	1),
('packaged_chicken',	'Poulet en barquette',	1,	0,	1),
('packaged_plank',	'Paquet de planches',	1,	0,	1),
('petrol',	'Pétrole',	1,	0,	1),
('petrol_raffin',	'Pétrole Raffiné',	1,	0,	1),
('slaughtered_chicken',	'Poulet abattu',	1,	0,	1),
('stone',	'Pierre',	1,	0,	1),
('washed_stone',	'Pierre Lavée',	1,	0,	1),
('water',	'Water',	1,	0,	1),
('wood',	'Bois',	1,	0,	1),
('wool',	'Laine',	1,	0,	1);

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('cardealer',	'Concessionnaire',	0),
('fisherman',	'Pêcheur',	0),
('fueler',	'Raffineur',	0),
('lumberjack',	'Bûcheron',	0),
('miner',	'Mineur',	0),
('police',	'LSPD',	0),
('reporter',	'Journaliste',	0),
('slaughterer',	'Abatteur',	0),
('tailor',	'Couturier',	0),
('unemployed',	'Unemployed',	0);

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1,	'unemployed',	0,	'unemployed',	'Unemployed',	200,	'{}',	'{}'),
(2,	'cardealer',	0,	'recruit',	'Recrue',	10,	'{}',	'{}'),
(3,	'cardealer',	1,	'novice',	'Novice',	25,	'{}',	'{}'),
(4,	'cardealer',	2,	'experienced',	'Experimente',	40,	'{}',	'{}'),
(5,	'cardealer',	3,	'boss',	'Patron',	0,	'{}',	'{}'),
(6,	'police',	0,	'recruit',	'Recrue',	20,	'{}',	'{}'),
(7,	'police',	1,	'officer',	'Officier',	40,	'{}',	'{}'),
(8,	'police',	2,	'sergeant',	'Sergent',	60,	'{}',	'{}'),
(9,	'police',	3,	'lieutenant',	'Lieutenant',	85,	'{}',	'{}'),
(10,	'police',	4,	'boss',	'Commandant',	100,	'{}',	'{}'),
(11,	'lumberjack',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(12,	'fisherman',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(13,	'fueler',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(14,	'reporter',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(15,	'tailor',	0,	'employee',	'Intérimaire',	0,	'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}',	'{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(16,	'miner',	0,	'employee',	'Intérimaire',	0,	'{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}',	'{}'),
(17,	'slaughterer',	0,	'employee',	'Intérimaire',	0,	'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}',	'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}');

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE `owned_vehicles` (
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `plate` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `skin` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('AudiS3',	'2015s3',	1000,	'audi'),
('AudiA62015',	'a615',	1000,	'audi'),
('AudiA7',	'a7',	1000,	'audi'),
('AudiA8FSI',	'a8fsi',	1000,	'audi'),
('AudiSportQuattro',	'asportquattro',	1000,	'audi'),
('AudiA4TFSIQuattro2017',	'audia4',	90,	'audi'),
('AudiS4',	'b5s4',	1000,	'audi'),
('PaganiHuayraBC',	'bc',	1000,	'pagani'),
('AudiRS62003',	'c5rs6',	1000,	'audi'),
('McLarenF1',	'f1',	1000,	'mclaren'),
('Audi90QuatroIMSAGTO',	'imsa90',	750,	'audi'),
('PaganiZondaR',	'ktkzr',	1000,	'pagani'),
('MacLarenP1',	'p1',	1000,	'mclaren'),
('MacLarenP1GTR',	'p1gtr',	1000,	'mclaren'),
('AudiR8',	'r8ppi',	1000,	'audi'),
('AudiRS3SB2018',	'rs318',	1000,	'audi'),
('AudiRS4Avant',	'rs4avant',	1000,	'audi'),
('AudiRS52011',	'rs5',	1000,	'audi'),
('Audi_C7_RS6',	'rs6',	750,	'audi'),
('AudiRS7',	'rs7',	1000,	'audi'),
('AudiSQ7',	'sq72016',	1000,	'audi'),
('PaganiZondaTricolore',	'tricolore',	1000,	'pagani'),
('audittrs',	'ttrs',	1000,	'audi');

DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('audi',	'Audi'),
('mclaren',	'McLaren'),
('pagani',	'Pagani');

DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2021-07-16 19:48:12
