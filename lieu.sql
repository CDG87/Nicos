SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `base_inspection_cdg`
--




CREATE TABLE `lieu` (
  `NUM_LIEU` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_GROUPE_LIEU` smallint(6) NOT NULL,
  `NOM_LIEU` varchar(32) DEFAULT NULL,
  `code_lieu` int(11) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NUM_LIEU`),
  KEY `I_FK_LIEU_GROUPE_LIEU` (`NUM_GROUPE_LIEU`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;


INSERT INTO lieu VALUES
("1","1","Atelier principal",null,"fa-industry"),
("2","1","Service Espaces verts",null,"fa-tree"),
("3","1","Service voirie",null,"fa-road"),
("4","1","Atelier soudage / meulage",null,"fa-yelp"),
("5","1","Atelier menuiserie",null,"fa-pencil"),
("8","1","Atelier peinture",null,"fa-paint-brush"),
("10","1","Atelier électricité",null,"fa-plug"),
("13","1","Magasin / Stock",null,"fa-cubes"),
("16","2","Vestiaires",null,null),
("18","2","Sanitaires",null,"fa-shower"),
("20","2","Cuisine",null,"fa-glass-martini"),
("21","2","Salle de pause",null,"fa-weixin"),
("22","2","Salle de repos",null,null),
("26","2","Chambres",null,null),
("30","3","Toiture",null,null),
("31","3","Mezzanine",null,null),
("32","3","Estrade",null,null),
("33","3","Combles",null,null),
("34","3","Sous sol",null,null),
("35","3","Dortoir",null,null),
("38","4","Armoire produits chimiques",null,null),
("39","4","Armoire produits phytosanitaires",null,null),
("40","4","Local produits chimiques",null,null),
("41","4","Local produits inflammables",null,null),
("42","4","Local produits d’entretien",null,null),
("43","4","Local de stockage",null,null),
("44","4","Local technique",null,null),
("45","4","Local poubelles",null,null),
("46","4","Local petit matériel",null,null),
("47","4","Stock alimentaire",null,null),
("48","4","Stockage consommables",null,null),
("49","4","Local chaudière/ chaufferie",null,null),
("50","5","Salle de repos",null,null),
("51","5","Salle de pause",null,null),
("52","5","Réfectoire",null,null),
("53","5","Salle de réunion",null,null),
("54","5","Salle du conseil",null,null),
("55","5","Salle des mariages",null,null),
("56","5","Salle de classe",null,null),
("57","5","Salle de jeux",null,null),
("58","5","Salle de loisirs",null,null),
("59","5","Salle de motricité",null,null),
("60","6","Accueil",null,null),
("66","5","Salle de soins",null,null),
("69","1","Illuminations de noël",null,"fa-magic"),
("71","6","Secrétariat",null,null),
("72","6","Bureau",null,null),
("73","6","Bureau des élus",null,null),
("74","6","Bureau Autorité Territoriale",null,null),
("75","5","Salle principale",null,null),
("76","6","Salle du conseil",null,null),
("77","6","Salle des mariages",null,null),
("79","8","Garage Véhicules",null,null),
("80","9","Structure globale",null,null),
("81","7","Bassin",null,null),
("82","7","Puit",null,null),
("83","7","Poste de relevage",null,null),
("84","7","Réservoir",null,null),
("85","7","Eco-point",null,null),
("86","7","Laboratoire",null,null),
("87","7","Quai",null,null),
("88","7","Bas de quai",null,null),
("89","8","Véhicules",null,null),
("90","8","Engins",null,null),
("91","8","Tracteur",null,null),
("92","8","Tractopelle",null,null),
("93","8","Tracteur épareuse",null,null),
("94","8","Tondeuse autoportée",null,null),
("95","8","Matériel porté",null,null),
("96","8","Matériel tracté",null,null),
("97","6","Archives",null,null),
("98","8","Voiture",null,"fa-car"),
("99","8","Camion",null,"fa-truck"),
("100","8","Fourgon / camionnette",null,null),
("102","7","Haut de quai",null,null),
("103","2","Escalier",null,null),
("104","2","Couloir",null,null),
("106","1","Service eau / assainissement",null,"fa-tint"),
("107","10","Réception marchandises",null,null),
("108","3","Vide-sanitaire",null,null),
("109","10","Local poubelles",null,null),
("110","10","Réserve",null,null),
("111","10","Plonge",null,null),
("112","10","Légumerie",null,null),
("113","10","Salle à manger",null,null),
("114","10","Cuisine",null,null),
("115","10","Préparation chaude",null,null),
("116","10","Préparation froide",null,null),
("118","2","Voie d\'accès",null,null);




CREATE TABLE `version` (
  `NUM_VERSION` int(11) NOT NULL AUTO_INCREMENT,
  `VALEUR_VERSION` float NOT NULL,
  PRIMARY KEY (`NUM_VERSION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO version VALUES
("1","0.98");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;