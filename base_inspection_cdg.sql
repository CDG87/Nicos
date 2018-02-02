SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `base_inspection_cdg`
--




CREATE TABLE `audit` (
  `NUM_AUDIT` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_CONTROLEUR` smallint(6) NOT NULL,
  `NUM_STRUCTURE` smallint(6) NOT NULL,
  `DATE_AUDIT` date DEFAULT NULL,
  `DATE_AUDIT_2` date DEFAULT NULL,
  `DATE_AUDIT_3` date DEFAULT NULL,
  `DATE_AUDIT_4` date DEFAULT NULL,
  `DATE_AUDIT_5` date DEFAULT NULL,
  `LIBELLE_AUDIT` varchar(50) DEFAULT NULL,
  `DATE_CONTROLE_AUDIT` date DEFAULT NULL,
  PRIMARY KEY (`NUM_AUDIT`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


INSERT INTO audit VALUES
("7","1","45","2000-01-01",null,null,null,null,"Inspection","2000-01-01");




CREATE TABLE `batiment` (
  `NUM_BATIMENT` smallint(6) NOT NULL AUTO_INCREMENT,
  `CODE_POLE` smallint(6) NOT NULL,
  `NOM_BATIMENT` varchar(60) DEFAULT NULL,
  `code_Batiment` int(11) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NUM_BATIMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;


INSERT INTO batiment VALUES
("1","1","Mairie",null,null),
("2","1","Siège",null,null),
("3","2","Service technique",null,null),
("4","2","Cimetière",null,null),
("5","2","Station de chauffage",null,null),
("6","2","Station de traitement des eaux",null,null),
("9","4","Ecole maternelle",null,null),
("10","4","Ecole primaire",null,null),
("11","4","Restaurant scolaire",null,null),
("12","4","Relais assistante maternelle",null,null),
("13","4","Crèche",null,null),
("14","5","Ecole de musique",null,null),
("15","5","Centre de loisirs / Animation",null,null),
("16","5","Office du tourisme",null,null),
("17","5","Piscine",null,null),
("18","5","Espace aquatique",null,null),
("19","5","Bibliothèque",null,null),
("20","6","Unité Alzheimer",null,null),
("21","6","EPHAD (soins/chambres)",null,null),
("22","6","Blanchisserie",null,null),
("32","6","Cuisine centrale",null,null),
("33","2","Lagune",null,null),
("34","2","Réservoir eau potable",null,null),
("35","1","Agence postale",null,null),
("36","2","Déchetterie",null,null),
("37","2","Station de transit",null,null),
("38","2","Plate-forme déchets verts",null,null),
("40","5","Complexe sportif",null,null),
("41","5","Gymnase",null,null),
("42","5","Camping / Village de vacances",null,null),
("43","6","Salle polyvalente",null,null),
("44","6","Salle des associations",null,null),
("45","6","Logement social",null,null),
("46","5","Opéra",null,null),
("47","6","Foyer logement",null,null),
("48","6","Portage à domicile",null,null),
("50","7","Police municipale",null,null),
("51","7","SDIS",null,null);




CREATE TABLE `centre` (
  `NUM_CENTRE` int(11) NOT NULL AUTO_INCREMENT,
  `LOGO` varchar(32) DEFAULT NULL,
  `ENTETE` varchar(200) DEFAULT NULL,
  `NOM` varchar(100) DEFAULT NULL,
  `ADRESSE` varchar(60) DEFAULT NULL,
  `CP` int(11) NOT NULL,
  `VILLE` varchar(30) DEFAULT NULL,
  `TEL` varchar(30) DEFAULT NULL,
  `FAX` varchar(11) DEFAULT NULL,
  `SITE` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`NUM_CENTRE`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO centre VALUES
("1","logo_cdg.jpg","Pôle Santé et Sécurité au Travail, Service Prévention des Risques Professionnels","Centre de Gestion de la Fonction Publique Territoriale de la Haute-Vienne","55 rue de l\'AENI","87009","LIMOGES","0555300854","0555300864","cdg87.fr");




CREATE TABLE `comprendre` (
  `NUM_AUDIT` smallint(6) NOT NULL,
  `NUM_OBSERVATION` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_AUDIT`,`NUM_OBSERVATION`),
  KEY `NUM_AUDIT` (`NUM_AUDIT`),
  KEY `NUM_OBSERVATION` (`NUM_OBSERVATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO comprendre VALUES
("7","1024");




CREATE TABLE `contenir` (
  `NUM_AUDIT` smallint(6) NOT NULL,
  `NUM_BATIMENT_C` int(11) NOT NULL,
  `NUM_LIEU` smallint(6) NOT NULL,
  `NUM_CRITERE_C` int(11) NOT NULL,
  `NUM_PRECONISATION` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_AUDIT`,`NUM_BATIMENT_C`,`NUM_LIEU`,`NUM_CRITERE_C`,`NUM_PRECONISATION`),
  KEY `NUM_AUDIT` (`NUM_AUDIT`),
  KEY `NUM_LIEU` (`NUM_LIEU`),
  KEY `NUM_PRECONISATION` (`NUM_PRECONISATION`),
  KEY `NUM_BATIMENT` (`NUM_BATIMENT_C`),
  KEY `NUM_CRITERE` (`NUM_CRITERE_C`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO contenir VALUES
("7","1","1","93","96");




CREATE TABLE `controle_critere` (
  `NUM_CRITERE` smallint(6) NOT NULL,
  `NUM_AUDIT` smallint(6) NOT NULL,
  `VALEUR_CRITERE` char(5) DEFAULT NULL,
  `VALEUR_IMPORTANT` tinyint(1) DEFAULT NULL,
  `PRECONISATION_CRITERE` varchar(1000) DEFAULT NULL,
  `PHOTO_CRITERE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NUM_CRITERE`,`NUM_AUDIT`),
  KEY `I_FK_CONTROLE_CRITERE_AUDIT` (`NUM_AUDIT`),
  KEY `NUM_CRITERE` (`NUM_CRITERE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO controle_critere VALUES
("1","7","C","0",null,"Bussière-Galant-2017-04-21 (1).jpg");




CREATE TABLE `controler` (
  `NUM_BATIMENT` smallint(6) NOT NULL,
  `NUM_AUDIT` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_BATIMENT`,`NUM_AUDIT`),
  KEY `I_FK_CONTROLER_BATIMENT` (`NUM_BATIMENT`),
  KEY `I_FK_CONTROLER_AUDIT` (`NUM_AUDIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO controler VALUES
("1","7");




CREATE TABLE `controleur` (
  `NUM_CONTROLEUR` smallint(6) NOT NULL AUTO_INCREMENT,
  `NOM_CONTROLEUR` varchar(32) DEFAULT NULL,
  `PRENOM_CONTROLEUR` varchar(32) DEFAULT NULL,
  `FONCTION_CONTROLEUR` varchar(100) DEFAULT NULL,
  `AFFECTATION_CONTROLEUR` varchar(50) DEFAULT NULL,
  `CENTRE_CONTROLEUR` varchar(50) DEFAULT NULL,
  `ADRESSE_CONTROLEUR` varchar(100) DEFAULT NULL,
  `TEL_FIXE_CONTROLEUR` varchar(10) DEFAULT NULL,
  `TEL_MOBILE_CONTROLEUR` varchar(10) DEFAULT NULL,
  `FAX_CONTROLEUR` varchar(10) DEFAULT NULL,
  `EMAIL_CONTROLEUR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NUM_CONTROLEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO controleur VALUES
("1","ROUSSY","Frédéric","Agent Chargé de la Fonction d’Inspection","Pôle SST / Service Prévention","Centre de Gestion de la Haute-Vienne","55 rue de l’Ancienne École Normale d’Instituteurs BP 339 - 87009 Limoges Cedex ","0555300863",null,"0555300864","frederic.roussy@cdg87.fr"),
("2","DERBALI","Elodie","Responsable du service Prévention des risques professionnels","Pôle SST / Service Prévention","Centre de Gestion de la Haute-Vienne","55 rue de l’Ancienne École Normale d’Instituteurs \nBP 339 - 87009 Limoges Cedex ","0555300854","0689495877",null,"elodie.derbali@cdg87.fr"),
("3","LAMANT","Didier","Préventeur","Pôle SST / Service Prévention","Centre de Gestion de la Haute-Vienne","55 rue de l’Ancienne École Normale d’Instituteurs BP 339 - 87009 Limoges Cedex ","0555300869",null,null,"didier.lamant@cdg87.fr");




CREATE TABLE `critere` (
  `NUM_CRITERE` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_THEME` smallint(6) NOT NULL,
  `NUM_SOUS_THEME` smallint(6) DEFAULT NULL,
  `NUM_RESUME_ARTICLE` smallint(6) NOT NULL,
  `LIBELLE_CRITERE` varchar(100) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NUM_CRITERE`),
  KEY `I_FK_CRITERE_THEME` (`NUM_THEME`),
  KEY `I_FK_CRITERE_SOUS_THEME` (`NUM_SOUS_THEME`),
  KEY `NUM_RESUME_ARTICLE` (`NUM_RESUME_ARTICLE`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;


INSERT INTO critere VALUES
("1","1","1","1","Assistant de prévention désigné",null),
("2","1","1","2","Arrêté nomination de l’AP",null),
("3","1","1","3","Lettre de cadrage de l’AP",null),
("4","1","1","4","Formation Initiale et continue de l’AP",null),
("5","1","1","5","Moyens mis à disposition de l’AP",null),
("6","1","2","6","Conseiller de prévention désigné",null),
("7","1","2","7","Arrêté de nomination du CP",null),
("8","1","2","8","Lettre de cadrage du CP",null),
("9","1","2","9","Formation Initiale et continue du CP",null),
("10","1","2","10","Moyens mis à disposition du CP",null),
("11","1","3","11","Suivi médical des agents",null),
("12","1","3","12","Consultation sur projet",null),
("13","1","3","13","Produits dangereux",null),
("14","1","3","14","Procédure AT/MP",null),
("15","1","3","15","Surveillance médicale particulière",null),
("16","1","3","16","Rapport d’activité",null),
("17","1","4","17","Existence CT ou CHS-CT",null),
("18","1","4","18","Formation des membres du CHS-CT",null),
("19","1","4","19","Programme annuel de prévention",null),
("20","1","4","20","Rapport enquête après AT/MP",null),
("21","1","4","21","Consultation sur les projets",null),
("22","1","4","22","Nombre de réunions",null),
("23","1","4","23","Règlement intérieur du CHSCT",null),
("24","1","4","24","Propositions et avis du comité (CR)",null),
("25","1","5","25","Information mission ACFI",null),
("26","1","5","26","Désignation d’un ACFI",null),
("27","1","5","27","Convention, lettre de mission",null),
("28","1","5","28","Consultation sur projet",null),
("29","1","5","29","Contrôle des règles HSST",null),
("30","1","5","30","Suites données aux propositions",null),
("31","2","6","31","Existence du Document Unique (DU)",null),
("32","2","6","32","Mise à jour du DU",null),
("33","2","6","33","Modalité d’accès au DU",null),
("34","2","6","34","Utilisation du DU par le CHS-CT",null),
("35","2","6","35","Evaluation des RPS",null),
("36","2","7","36","Registre Santé et Sécurité au Travail",null),
("37","2","7","37","Registre de Dangers Graves et Imminents",null),
("38","2","7","38","Registre de sécurité (ou des vérifications)",null),
("39","2","7","39","Registre sécurité ERP",null),
("40","2","7","40","Fiche de risques professionnels",null),
("41","2","7","41","Fiche individuelle de prévention des expositions",null),
("42","2","7","42","Autorisations de conduite",null),
("43","2","7","43","Dossier Technique Amiante",null),
("44","2","7","44","Habilitations électriques",null),
("45","2","7","45","FDS Produits chimiques",null),
("46","2","7","46","Notices de poste produits chimiques",null),
("47","2","7","47","DICT",null),
("48","2","8","48","Aération- Ventilation ",null),
("49","2","8","49","Ascenceurs",null),
("50","2","8","50","Appareils de levage",null),
("51","2","8","51","Installations thermiques",null),
("52","2","8","52","Echafaudage - Echelle - Escabeau",null),
("53","2","8","53","Installations Electriques",null),
("54","2","8","54","Equipements sous pression",null),
("55","2","8","55","EPI : harnais, cartouches...",null),
("56","2","8","56","Equipements de travail en service",null),
("57","2","8","57","Matériel incendie : extincteurs…",null),
("58","2","8","58","Contrôle technique",null),
("59","2","8","59","Portes et portails",null),
("60","2","8","60","Réservoirs enterrés - Pdx inflammables",null),
("61","2","8","61","Chapiteaux / tentes et structures",null),
("62","3",null,"62","Formation initiale à la sécurité",null),
("63","3",null,"63","Plan de formation à la sécurité",null),
("64","3",null,"64","Formation Incendie",null),
("65","3",null,"65","Premiers secours / SST",null),
("66","3",null,"66","Formation au poste de travail",null),
("67","3",null,"67","Formation à la conduite en sécurité",null),
("68","3",null,"68","Formation AIPR",null),
("69","3",null,"69","Formation Certiphyto / Certibiocide",null),
("70","3",null,"70","Formation Tronçonnage",null),
("71","3",null,"71","Formation Amiante",null),
("72","4",null,"72","Trousses de secours",null),
("73","4",null,"73","Affichage obligatoire",null),
("74","4",null,"74","Matériels d’extinction",null),
("75","4",null,"75","Travail isolé",null),
("76","4",null,"76","Moyens d’alerte",null),
("77","4",null,"77","Accessibilité travailleurs handicapés",null),
("78","5",null,"78","Fourniture des EPI aux agents",null),
("79","5",null,"79","Contrôle du port des EPI",null),
("80","5",null,"80","Suivi et entretien des EPI",null),
("81","5",null,"81","Formation à l’utilisation des EPI",null),
("82","5",null,"82","Consignes d’utilisation des EPI",null),
("83","6",null,"83","Travaux interdits",null),
("84","6",null,"84","Travaux règlementés",null),
("85","6",null,"85","Mesure dérogatoire",null),
("86","6",null,"86","Delibération",null),
("87","6",null,"87","Information CHSCT / ACFI",null),
("88","6",null,"88","Renouvellement de la dérogation",null),
("89","7",null,"89","Plan de prévention",null),
("90","7",null,"90","Protocole chargement / déchargement",null),
("91","7",null,"91","Coordinateur SPS",null),
("92","7",null,"92","Permis de feu",null),
("93","8","9","93","Signalisation zone de danger",null),
("94","8","9","94","Entretien régulier des locaux de travail",null),
("95","8","9","95","Présence point d’eau",null),
("96","8","9","96","Interdiction de fumer",null),
("97","8","10","97","Vestiaires - Lavabos",null),
("98","8","10","98","Douches",null),
("99","8","10","99","Local de restauration",null),
("100","8","10","100","Sanitaires",null);
INSERT INTO critere VALUES
("101","8","10","101","Eau fraîche et potable",null),
("102","8","10","102","Local de repos",null),
("103","8","11","103","Ambiance thermique",null),
("104","8","11","104","Eclairage",null),
("105","8","11","105","Ventilation",null),
("106","9",null,"106","Trousse de secours",null),
("107","9",null,"107","Affichage numéros d’urgence",null),
("108","9",null,"108","Travail isolé",null),
("109","9",null,"109","Moyens d’alerte",null),
("110","9",null,"110","Procédure d’urgence",null),
("111","10","12","111","Connaissance de l’effectif",null),
("112","10","12","112","ERP : validation commmission sécurité",null),
("113","10","12","113","Moyens d’extinction de première intervention",null),
("114","10","12","114","Exercices d\'évacuation",null),
("115","10","12","115","Stockage des produits inflammables",null),
("116","10","12","116","Désenfumage",null),
("117","10","13","117","Consignes incendie",null),
("118","10","13","118","Plans d\'évacuation",null),
("119","10","14","119","Dégagement libéré",null),
("120","10","14","120","Sortie de secours",null),
("121","10","14","121","Escalier",null),
("122","10","14","122","Système alarme sonore",null),
("123","10","14","123","Signalisation de secours d’urgence (BAES)",null),
("124","11",null,"124","Evaluation du risque (plain pied)",null),
("125","11",null,"125","Fosse de réparation",null),
("126","11",null,"126","Sol anti-dérapant",null),
("127","11",null,"127","Nettoyage / encombrement",null),
("128","12",null,"128","Evaluation du risque (hauteur)",null),
("129","12",null,"129","Escaliers",null),
("130","12",null,"130","Garde corps",null),
("131","12",null,"131","PEMP",null),
("132","12",null,"132","EPI (harnais)",null),
("133","12",null,"133","Echafaudage",null),
("134","12",null,"134","Échelles mobiles",null),
("135","13",null,"135","Inventaire et plan d’actions",null),
("136","13",null,"136","Matériel de manutention adapté",null),
("137","13",null,"137","Formation et information du personnel",null),
("138","13",null,"138","Limitations des ports de charges",null),
("139","14","15","139","Permis",null),
("140","14","15","140","Formation FIMO/FCO",null),
("141","14","15","141","Signalisation routière (panneaux, indications...)",null),
("142","14","16","142","Signalisation des agents",null),
("143","14","16","143","Signalisation des véhicules et materiels",null),
("144","14","16","144","Balisage des chantiers",null),
("145","14","16","145","Formation au balisage",null),
("146","14","16","146","Séparation cabine / rangement",null),
("147","14","16","147","Arrimage",null),
("148","14","16","148","Véhicule adapté",null),
("150","15","17","150","Marquage CE - Protection",null),
("151","15","17","151","Entretien des machines",null),
("152","15","17","152","Matériel en état de conformité",null),
("153","15","17","153","Notices d’instruction disponibles",null),
("154","15","17","154","Carnet de maintenance des machines",null),
("155","15","17","155","Organes de sécurité présents",null),
("156","15","18","156","Règles d’utilisation",null),
("157","15","18","157","Eclairage et signalisation",null),
("158","15","18","158","Vérification générale périodique (VGP)",null),
("159","15","18","159","Cuve pulvérisateur",null),
("160","15","19","160","Formation tondeuse autoportée",null),
("161","15","19","161","Eclairage et signalisation ",null),
("162","15","19","162","Système anti-écrasement",null),
("163","15","19","163","Homologation",null),
("164","15","20","164","Réception à titre isolé",null),
("165","15","20","165","Eclairage et signalisation (ESH)",null),
("166","15","20","166","Formation à la conduite d’un ESH",null),
("167","15","20","167","Déneigement par un exploitant agricole",null),
("168","16",null,"168","Evaluation du risque chimique",null),
("169","16",null,"169","Formation des agents",null),
("170","16",null,"170","Inventaire produits et FDS",null),
("171","16",null,"171","Liste travailleurs exposés",null),
("172","16",null,"172","Démarche suppression expositions produits dangereux",null),
("173","16",null,"173","Notice de poste (Consignes d’utilisation et secours)",null),
("174","16",null,"174","Captage des polluants",null),
("175","16",null,"175","Equipements de protection individuelle",null),
("176","16",null,"176","Conditions de stockage",null),
("177","17",null,"177","Liste des agents exposés",null),
("178","17",null,"178","Habilitations du personnel",null),
("179","17",null,"179","Conformité des installations",null),
("180","17",null,"180","Signalisation des installations",null),
("181","18",null,"181","Evaluation du risque lié au bruit",null),
("182","18",null,"182","Equipement de protection individuelle lié au bruit",null),
("183","18",null,"183","Formation - Information",null),
("184","18",null,"184","Surveillance médicale",null),
("185","18",null,"185","Mesures d’expostition et de corrections",null),
("186","19",null,"186","Evaluation du risque biologique",null),
("187","19",null,"187","Démarche suppression expositions produits biologiques dangereux",null),
("188","19",null,"188","Surveillance médicale - Liste agents exposés",null),
("189","19",null,"189","Instructions écrites / plan d’urgence",null),
("190","20",null,"190","Evaluation du risque lié aux vibrations mécaniques",null),
("191","20",null,"191","Mesures d’expostition et de corrections",null),
("192","20",null,"192","Surveillance médicale liée aux vibrations mécaniques",null),
("193","21",null,"193","Implantation et aménagement des postes",null),
("194","21",null,"194","Eclairage adapté",null),
("195","21",null,"195","Mobilier adapté",null),
("196","21",null,"196","Organisation du travail",null),
("197","21",null,"197","Surface et largeur de passage",null),
("198","22",null,"198","Protocole chargement /déchargement ",null),
("199","22",null,"199","Plan de prévention entreprises extérieures",null),
("200","23","21","200","Règles de sécurité d’intervention",null),
("201","23","21","201","EPI adapté",null);




CREATE TABLE `date_maj` (
  `NUM_CRITERE` smallint(6) NOT NULL,
  `DATE_OBSERVATION` date DEFAULT NULL,
  `DATE_PROPOSITION` date DEFAULT NULL,
  `DATE_IMAGE` date DEFAULT NULL,
  PRIMARY KEY (`NUM_CRITERE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO date_maj VALUES
("1","2018-01-22","2018-01-22","2018-01-22"),
("2","2018-01-22","2018-01-22","2018-01-22"),
("3","2018-01-22",null,null),
("4",null,null,null),
("5",null,null,null),
("6",null,null,null),
("7",null,null,null),
("8",null,null,null),
("9",null,null,null),
("10",null,null,null),
("11",null,null,null),
("12",null,null,null),
("13",null,null,null),
("14",null,null,null),
("15",null,null,null),
("16",null,null,null),
("17",null,null,null),
("18",null,null,null),
("19",null,null,null),
("20",null,null,null),
("21",null,null,null),
("22",null,null,null),
("23",null,null,null),
("24",null,null,null),
("25",null,null,null),
("26",null,null,null),
("27",null,null,null),
("28",null,null,null),
("29",null,null,null),
("30",null,null,null),
("31","2018-01-22",null,null),
("32",null,null,null),
("33",null,null,null),
("34",null,null,null),
("35",null,null,null),
("36",null,null,null),
("37",null,null,null),
("38",null,null,null),
("39",null,null,null),
("40",null,null,null),
("41",null,null,null),
("42",null,null,null),
("43",null,null,null),
("44",null,null,null),
("45",null,null,null),
("46",null,null,null),
("47",null,null,null),
("48",null,null,null),
("49",null,null,null),
("50",null,null,null),
("51",null,null,null),
("52",null,null,null),
("53",null,null,null),
("54",null,null,null),
("55",null,null,null),
("56",null,null,null),
("57",null,null,null),
("58",null,null,null),
("59",null,null,null),
("60",null,null,null),
("61",null,null,null),
("62",null,null,null),
("63",null,null,null),
("64",null,null,null),
("65",null,null,null),
("66",null,null,null),
("67",null,null,null),
("68",null,null,null),
("69",null,null,null),
("70",null,null,null),
("71",null,null,null),
("72",null,null,null),
("73",null,null,null),
("74",null,null,null),
("75",null,null,null),
("76",null,null,null),
("77",null,null,null),
("78",null,null,null),
("79",null,null,null),
("80",null,null,null),
("81",null,null,null),
("82",null,null,null),
("83",null,null,null),
("84",null,null,null),
("85",null,null,null),
("86",null,null,null),
("87",null,null,null),
("88",null,null,null),
("89",null,null,null),
("90",null,null,null),
("91",null,null,null),
("92",null,null,null),
("93",null,null,null),
("94",null,null,null),
("95",null,null,null),
("96",null,null,null),
("97",null,null,null),
("98",null,null,null),
("99",null,null,null),
("100",null,null,null);
INSERT INTO date_maj VALUES
("101",null,null,null),
("102",null,null,null),
("103",null,null,null),
("104",null,null,null),
("105",null,null,null),
("106",null,null,null),
("107",null,null,null),
("108",null,null,null),
("109",null,null,null),
("110",null,null,null),
("111",null,null,null),
("112",null,null,null),
("113",null,null,null),
("114",null,null,null),
("115",null,null,null),
("116",null,null,null),
("117",null,null,null),
("118",null,null,null),
("119",null,null,null),
("120",null,null,null),
("121",null,null,null),
("122",null,null,null),
("123",null,null,null),
("124",null,null,null),
("125",null,null,null),
("126",null,null,null),
("127",null,null,null),
("128",null,null,null),
("129",null,null,null),
("130",null,null,null),
("131",null,null,null),
("132",null,null,null),
("133",null,null,null),
("134",null,null,null),
("135",null,null,null),
("136",null,null,null),
("137",null,null,null),
("138",null,null,null),
("139",null,null,null),
("140",null,null,null),
("141",null,null,null),
("142",null,null,null),
("143",null,null,null),
("144",null,null,null),
("145",null,null,null),
("146",null,null,null),
("147",null,null,null),
("148",null,null,null),
("150",null,null,null),
("151",null,null,null),
("152",null,null,null),
("153",null,null,null),
("154",null,null,null),
("155",null,null,null),
("156",null,null,null),
("157",null,null,null),
("158",null,null,null),
("159",null,null,null),
("160",null,null,null),
("161",null,null,null),
("162",null,null,null),
("163",null,null,null),
("164",null,null,null),
("165",null,null,null),
("166",null,null,null),
("167",null,null,null),
("168",null,null,null),
("169",null,null,null),
("170",null,null,null),
("171",null,null,null),
("172",null,null,null),
("173",null,null,null),
("174",null,null,null),
("175",null,null,null),
("176",null,null,null),
("177","2018-01-22",null,null),
("178",null,null,null),
("179",null,null,null),
("180",null,null,null),
("181",null,null,null),
("182",null,null,null),
("183",null,null,null),
("184",null,null,null),
("185",null,null,null),
("186",null,null,null),
("187",null,null,null),
("188",null,null,null),
("189",null,null,null),
("190",null,null,null),
("191",null,null,null),
("192",null,null,null),
("193",null,null,null),
("194",null,null,null),
("195",null,null,null),
("196",null,null,null),
("197",null,null,null),
("198",null,null,null),
("199",null,null,null),
("200",null,null,null),
("201",null,null,null);
INSERT INTO date_maj VALUES
("202",null,null,null),
("203",null,null,null),
("204",null,null,null),
("205",null,null,null),
("206",null,null,null),
("207",null,null,null),
("208",null,null,null),
("209",null,null,null),
("210",null,null,null),
("211",null,null,null),
("212",null,null,null),
("213",null,null,null),
("214",null,null,null),
("215",null,null,null),
("216",null,null,null),
("217",null,null,null),
("218",null,null,null),
("219",null,null,null),
("220",null,null,null),
("221",null,null,null),
("222",null,null,null),
("223",null,null,null),
("224",null,null,null),
("225",null,null,null),
("226",null,null,null),
("227",null,null,null),
("229",null,null,null),
("230",null,null,null),
("232",null,null,null),
("233",null,null,null),
("234",null,null,null),
("235",null,null,null),
("236",null,null,null),
("237",null,null,null),
("239",null,null,null),
("240",null,null,null),
("241",null,null,null),
("242",null,null,null),
("243",null,null,null),
("244",null,null,null),
("245",null,null,null),
("247",null,null,null),
("248",null,null,null),
("249",null,null,null),
("250",null,null,null),
("251",null,null,null),
("253",null,null,null),
("254",null,null,null);




CREATE TABLE `disposer` (
  `NUM_AUDIT` smallint(6) NOT NULL,
  `NUM_PRECONISATION` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_AUDIT`,`NUM_PRECONISATION`),
  KEY `NUM_PRECONISATION` (`NUM_PRECONISATION`),
  KEY `NUM_AUDIT` (`NUM_AUDIT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO disposer VALUES
("7","1");




CREATE TABLE `groupe_lieu` (
  `NUM_GROUPE_LIEU` smallint(6) NOT NULL AUTO_INCREMENT,
  `LIBELLE_GROUPE_LIEU` varchar(32) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NUM_GROUPE_LIEU`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO groupe_lieu VALUES
("1","Atelier / Service (voirie...)","fa-industry"),
("2","Locaux sociaux / circulation","fa-users"),
("3","Structure / Annexes (Mezz...)","fa-bed"),
("4","Local / Armoire","fa-columns"),
("5","Salle","fa-arrows-alt"),
("6","Administratif (bureau...)","fa-desktop"),
("7","Eau / Assainissement / Déchets","fa-trash"),
("8","Engins / Véhicules (tracteur...)","fa-truck"),
("9","# Structure globale #","fa-university"),
("10","Restauration","fa-cutlery");




CREATE TABLE `identifiant` (
  `login` varchar(16) NOT NULL,
  `mdp` varchar(16) NOT NULL,
  `admin` int(1) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO identifiant VALUES
("prevention","nicos","0"),
("admin","admin","1");




CREATE TABLE `image_critere` (
  `NUM_IMAGE_CRITERE` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_CRITERE` smallint(6) NOT NULL,
  `LIBELLE_IMAGE_CRITERE` varchar(32) NOT NULL,
  PRIMARY KEY (`NUM_IMAGE_CRITERE`),
  KEY `NUM_CRITERE` (`NUM_CRITERE`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


INSERT INTO image_critere VALUES
("3","53","instal-elec1.png"),
("5","64","formation incendie.png"),
("8","73","affiche secours 1.png"),
("12","91","coord SPS.png"),
("14","97","vestaire_lava.png"),
("20","109","moy_alerte.png"),
("22","124","risque_plain_pied2.png"),
("23","125","fosse_reparation.png"),
("24","128","risque_hauteur.png"),
("33","140","forma_poid_lourd.png"),
("35","142","signa_agent.png"),
("39","144","balise_chantier.png"),
("40","160","regle_util_tondeuse.png"),
("41","161","eclai_signal_tondeuse.png"),
("42","164","recep_engin_hiver.png"),
("43","171","lst_trav_expo.png"),
("44","176","condi_stock.png"),
("48","183","forma_info_bruit.png"),
("52","186","eva_risque_bio.png"),
("54","190","eva_risque_meca2.png"),
("58","196","orga_trav_ecran.png"),
("59","208","reg_secu_soudage.png"),
("60","216","forma_spe_rest.png"),
("62","11","suivi_medical.png"),
("63","13","produits_dangereux.png"),
("64","17","chsct.png"),
("65","18","chsct.png"),
("66","23","chsct.png"),
("67","34","chsct.png"),
("68","31","document_unique.png"),
("69","36","registre_sst.png"),
("70","37","registre_dangers.jpg"),
("71","39","registre_erp.png"),
("72","42","autorisation_de_conduite.png"),
("73","43","dossier_amiante.png"),
("74","44","habilitation_electrique.png"),
("75","45","fds.png"),
("76","47","dict.png"),
("77","49","ascenseur.png"),
("78","50","appareil_de_levage.png"),
("79","52","echafaudage_echel.png"),
("81","54","equipement_sous_pression.png"),
("82","57","materiel_incendie.png"),
("83","58","vehicules.png"),
("84","72","trousse_de_secours.jpg"),
("86","74","materiel_d_extinction.jpg"),
("87","75","travail_isole.png"),
("88","76","moyen_d_alerte.jpg"),
("89","77","accessibilite.jpg"),
("90","78","fourniture_d_epi.gif"),
("91","79","controle_port_des_epi.jpg"),
("92","82","consignes_d_utilisation.png"),
("93","89","plan_de_prevention.png"),
("94","90","protocole_chargement.png"),
("95","92","permis_de_feu.jpg"),
("96","93","signalisation_zone_danger.jpg"),
("97","95","presence_de_point_d_eau.jpg"),
("98","96","interdiction_de_fumer.jpg"),
("100","98","douche.png"),
("101","100","sanitaires.jpg"),
("102","103","ambiance_thermique.jpg"),
("103","104","eclairage.jpg"),
("105","107","numeros_d_urgence.gif"),
("106","108","travail_isole.png"),
("108","113","moyen_d_exctinction.jpg"),
("109","116","desenfumage.png"),
("110","117","plans_et_consignes.png"),
("111","122","systeme_d_dalarme.jpg"),
("112","123","signa_secours_urg.png"),
("113","127","nettoyage.jpg"),
("114","129","escaliers.jpg"),
("115","130","garde_corps3.png.jpg"),
("116","131","pemp.jpg"),
("117","132","epi_harnais.jpg"),
("118","133","echafaudage.jpg"),
("119","134","echelles_escabeaux.jpg"),
("120","136","materiel_manutention_adapte.jpg"),
("121","138","limitation_port_de_charge.jpg"),
("122","139","permis.jpg"),
("124","143","signalisation_des_vehicules.gif"),
("127","150","marquage_ce.jpg"),
("128","155","organes_de_securite_presents.jpg"),
("129","157","eclairage_signalisation.jpg"),
("130","158","vgp.png"),
("131","159","cuve_pulverisateur.jpg"),
("132","162","systeme_anti_ecrasement.jpg"),
("133","163","homologation.png"),
("134","165","eclairage_et_signalisation.jpg"),
("135","170","inventaire_produits_et_fds.jpg"),
("136","173","consignes_d_utilisation2.jpg"),
("137","175","equipindividuel.jpg"),
("139","178","habilitation_du_personnel.jpg"),
("140","179","conformite_des_installations.jpg"),
("141","180","signa_installations.png"),
("142","182","equipement_ndividuel.jpg"),
("143","185","mesures_d_exposition.bmp"),
("144","193","implantation.jpg"),
("145","194","eclairage_adapte.gif"),
("146","195",null),
("147","200","regle_intervention.jpg");
INSERT INTO image_critere VALUES
("148","253","alcool-au-travail.jpg"),
("149","254","alcool-ivresse.png");




CREATE TABLE `inscrire` (
  `NUM_AUDIT` smallint(6) NOT NULL,
  `NUM_POLE_C` int(11) NOT NULL,
  `NUM_BATIMENT_C` int(11) NOT NULL,
  `NUM_GROUPE_LIEU_C` int(11) NOT NULL,
  `NUM_LIEU` smallint(6) NOT NULL,
  `NUM_THEME_C` int(11) NOT NULL,
  `NUM_CRITERE` smallint(6) NOT NULL,
  `VALEUR_CRITERE` char(5) DEFAULT NULL,
  `VALEUR_IMPORTANT` tinyint(1) DEFAULT NULL,
  `PRECONISATION_CRITERE` varchar(1000) DEFAULT NULL,
  `PHOTO_CRITERE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NUM_AUDIT`,`NUM_POLE_C`,`NUM_BATIMENT_C`,`NUM_GROUPE_LIEU_C`,`NUM_LIEU`,`NUM_THEME_C`,`NUM_CRITERE`),
  KEY `NUM_AUDIT` (`NUM_AUDIT`),
  KEY `NUM_LIEU` (`NUM_LIEU`),
  KEY `NUM_CRITERE` (`NUM_CRITERE`),
  KEY `NUM_POLE` (`NUM_POLE_C`),
  KEY `NUM_BATIMENT` (`NUM_BATIMENT_C`),
  KEY `NUM_GROUPE_LIEU` (`NUM_GROUPE_LIEU_C`),
  KEY `NUM_THEME` (`NUM_THEME_C`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO inscrire VALUES
("7","1","1","1","1","8","93","NC","0",null,null);




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
("2","1","Service Espaces verts",null,null),
("3","1","Service voirie",null,null),
("4","1","Atelier soudage / meulage",null,null),
("5","1","Atelier menuiserie",null,null),
("8","1","Atelier peinture",null,null),
("10","1","Atelier électricité",null,null),
("13","1","Magasin / Stock",null,null),
("16","2","Vestiaires",null,null),
("18","2","Sanitaires",null,null),
("20","2","Cuisine",null,null),
("21","2","Salle de pause",null,null),
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
("69","1","Illuminations de noël",null,null),
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
("98","8","Voiture",null,null),
("99","8","Camion",null,"fa-truck"),
("100","8","Fourgon / camionnette",null,null),
("102","7","Haut de quai",null,null),
("103","2","Escalier",null,null),
("104","2","Couloir",null,null),
("106","1","Service eau / assainissement",null,null),
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




CREATE TABLE `observation` (
  `NUM_OBSERVATION` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_CRITERE` smallint(6) NOT NULL,
  `LIBELLE_OBSERVATION` varchar(500) NOT NULL,
  `CODE_COULEUR_OBSERVATION` tinyint(1) NOT NULL,
  `code_obs` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUM_OBSERVATION`),
  KEY `NUM_CRITERE` (`NUM_CRITERE`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=latin1;


INSERT INTO observation VALUES
("4","1","L’Autorité Territoriale n’a pas désigné d’agent sur la mission d\'Assistant de Prévention.","2",null),
("6","2","Le ou les agents désignés en tant qu\'Assistant de Prévention disposent d\'un arrêté de désignation.","1",null),
("7","2","Le ou les agents désignés en tant qu\'Assistant de Prévention ne disposent pas d\'un arrêté de désignation.","2",null),
("8","3","Le ou les agents disposent de leur lettre de cadrage.","1",null),
("10","3","Le ou les agents désignés ne disposent pas de leur lettre de cadrage .","2",null),
("12","4","FORMATION OBLIGATOIRE:\nLe ou les agents ont suivi la formation obligatoire d\'Assistant de Prévention.","1",null),
("15","4","FORMATION OBLIGATOIRE:\nIl a été indiqué que le ou les agents n\'ont pas suivi la formation obligatoire.","2",null),
("16","5","Les moyens mis à disposition du ou des agents pour assurer les missions d\'AP sont suffisants pour assurer toutes les activités définies dans la lettre de cadrage.","1",null),
("18","5","Les moyens mis à disposition du ou des agents pour assurer les missions d\'AP ne sont pas suffisants pour assurer toutes les activités définies dans la lettre de cadrage.","2",null),
("21","6","L\'Autorité Territoriale a désigné un agent sur la mission de Conseiller de Prévention.","1",null),
("23","6","L\'Autorité Territoriale n\'a pas désigné d\'agent sur la mission de Conseiller de Prévention.","2",null),
("25","7","L\'agent désigné en tant que Conseiller de Prévention dispose d\'un arrêté de nomination.","1",null),
("26","7","L\'agent désigné en tant que Conseiller de Prévention ne dispose pas d\'un arrêté de nomination.","2",null),
("28","8","L\'agent dispose d\'une lettre de cadrage.","1",null),
("30","8","L\'agent ne dispose pas d\'une lettre de cadrage.","2",null),
("32","9","FORMATION OBLIGATOIRE:\nL\'agent a suivi la formation initiale et est à jour de sa formation continue.","1",null),
("34","9","FORMATION OBLIGATOIRE:\nIl a été indiqué que l\'agent n\'a pas suivi la formation obligatoire préalable à la prise de fonction.","2",null),
("36","10","Les moyens mis à disposition de l\'agent pour assurer les missions de Conseiller de Prévention sont suffisants au regard des activités définies dans la lettre de cadrage.","1",null),
("37","10","Les moyens mis à disposition de l\'agent pour assurer les missions de Conseiller de Prévention ne sont pas suffisants au regard des activités définies dans la lettre de cadrage.","2",null),
("40","11","Il a été indiqué que les agents sont à jour de leur suivi médical.","1",null),
("41","11","Il a été indiqué que les agents ne sont pas tous à jour de leur suivi médical.","2",null),
("42","12","Le médecin de prévention a été consulté sur les projets de construction ou d\'aménagement importants des locaux de travail.","1",null),
("43","12","Il n\'y a pas eu de consultation du Médecin de prévention pour les projets de construction ou d\'aménagement importants des locaux de travail.","2",null),
("44","13","Le Médecin de Prévention est informé lors de l\'achat et de l\'utilisation de produits dangereux.","1",null),
("45","13","Le Médecin de Prévention n\'est pas informé lors de l\'achat et de l\'utilisation de produits dangereux.","2",null),
("46","14","Le service de médecine préventive est informé des accidents de service et/ou des maladies professionnelles.","1",null),
("47","14","Le service de médecine préventive n\'est pas informé des accidents de service et/ou des maladies professionnelles.","2",null),
("48","15","La liste des agents soumis à une surveillance médicale particulière a été communiquée au Médecin de Prévention.","1",null),
("49","15","Il a été indiqué que la liste des agents soumis à une surveillance médicale particulière n\'a pas été communiquée au Médecin de Prévention.\n","2",null),
("51","16","Le rapport d\'activité a été établi et transmis à l\'Autorité Territoriale.","1",null),
("53","16","Le rapport d\'activité n\'a pas été transmis à l\'Autorité Territoriale.","2",null),
("54","17","Compte tenu de l\'effectif de la collectivité (<50 agents), les missions du CHSCT sont placées auprès du Comité Technique du CDG87.","1",null),
("55","17","Un Comité d\'Hygiène, de Sécurité et des Conditions de Travail (CHSCT) a été créé.","1",null),
("56","17","Le Comité d\'Hygiène, de Sécurité et des Conditions de Travail (CHSCT) n\'a pas été créé.","2",null),
("57","18","Les membres du CHSCT sont formés.","1",null),
("58","18","Les membres du CHSCT n\'ont pas été formés.","2",null),
("59","19","Le programme annuel de prévention a été soumis aux membres du comité.","1",null),
("60","19","Le programme annuel de prévention n\'a pas été soumis aux membres du comité.","2",null),
("62","20","Le CHSCT est informé de tout accident de service grave ou répétés et des suites données à chaque enquète.","1",null),
("63","20","Le CHSCT n\'est pas informé des accidents de service graves ou répétés.","2",null),
("64","21","Le CT est consulté pour avis sur les sujets d\'ordre général intéressant l\'hygiène, la sécurité et les conditions de travail.","1",null),
("65","21","Le CHSCT est consulté pour avis sur les sujets d\'ordre général intéressant l\'hygiène, la sécurité et les conditions de travail.","1",null),
("66","21","Le CT n\'est pas consulté pour avis sur les sujets d\'ordre général intéressant l\'hygiène, la sécurité et les conditions de travail.","2",null),
("67","21","Le CHSCT n\'est pas consulté pour avis sur les sujets d\'ordre général intéressant l\'hygiène, la sécurité et les conditions de travail.","2",null),
("68","22","Le comité à été réuni conformémént à la règlementation.","1",null),
("69","22","Le Comité n\'a pas été réuni conformément à la règlementation.","2",null),
("70","23","Le règlement intérieur du Comité à été créé.","1",null),
("71","23","Le règlement intérieur du Comité n\'a pas été rédigé.","2",null),
("72","24","Les comptes-rendus ont été établis.","1",null),
("73","24","Les compte-rendus n\'ont pas été établis.","2",null),
("74","25","Le comité à été informé de la visite et des observations  de l\'ACFI.","1",null),
("75","25","Le comité à été informé de la visite de l\'ACFI mais pas de ses observations.","2",null),
("76","25","Le comité n\'a pas été informé de la visite et des observations de l\'ACFI.","2",null),
("77","26","Un ACFI à été désigné.","1",null),
("78","26","Il n\'y a pas d\'ACFI désigné.","2",null),
("79","27","Une convention et une lettre de mission ont été rédigées.","1",null),
("80","27","La convention et la lettre de mission n\'ont pas été rédigées.","2",null),
("81","28","L\'ACFI est consulté sur la teneur de tous documents se rattachant à sa mission, et notamment des règlements et des consignes que l\'autorité territoriale envisage d\'adopter en matière d\'hygiène, de sécurité et de conditions de travail.","1",null),
("82","28","L\'ACFI n\'est pas consulté sur la teneur de tous documents se rattachant à sa mission, et notamment des règlements et des consignes que l\'autorité territoriale envisage d\'adopter en matière d\'hygiène, de sécurité et de conditions de travail.","2",null),
("83","29","L\'ACFI a effectué un contrôle des conditions d\'application des règles d\'hygiène et de sécurité.","1",null),
("84","29","L\'ACFI n\'a pas effectué un contrôle des conditions d\'application des règles d\'hygiène et de sécurité.","2",null),
("85","30","L\'autorité territoriale a informé l\'ACFI des suites données à ses propositions.","1",null),
("86","30","L\'autorité territoriale n\'a pas informé l\'ACFI des suites données à ses propositions.","2",null),
("88","31","Le document unique d\'évaluation des risques professionnels a été réalisé.","1",null),
("89","31","Le document unique d\'évaluation des risques n\'a pas été réalisé.","2",null),
("90","31","Il a été indiqué que le document unique d\'évaluation des risques (DU-EvRP) est en cours de réalisation.","2",null),
("92","32","Le document est mis à jour chaque fois que nécessaire et au moins tous les ans.","1",null),
("93","32","Il a été indiqué que le document unique n\'a pas été mis à jour depuis plus d\'un an.","2",null),
("95","33","Le document unique est mis à disposition et son emplacement est indiqué.","1",null),
("96","33","Le document unique est mis à disposition des agents mais son emplacement n\'est pas indiqué.","2",null),
("97","33","Il a été indiqué que le document unique n\'est pas mis à disposition des agents et des acteurs de la prévention.","2",null),
("99","34","Le document unique n\'a pas été utilisé pour l\'élaboration du programme annuel de prévention.","2",null),
("100","34","Le document unique a été utilisé pour l\'élaboration du programme annuel de prévention.","1",null),
("101","35","Les RPS ont été évalués dans le document unique.","1",null),
("102","35","Les RPS n\'ont pas été évalués.","2",null),
("103","35","Les RPS n\'ont été évalués que succintement dans le document unique.","2",null),
("104","36","Il a été indiqué qu\'un registre Santé et Sécurité au Travail a été ouvert par service.","1",null),
("105","36","Il a été indiqué qu\'aucun registre Santé et Sécurité au Travail n\'a été ouvert.","2",null),
("106","37","Le registre spécial coté des dangers graves et imminents a été ouvert et est tenu à disposition des agents et membres du comité.","1",null),
("107","37","Il a été indiqué que le registre des dangers graves et imminents n\'a pas été ouvert.","2",null),
("108","38","Le registre de sécurité a été ouvert.","1",null),
("109","38","Il a été indiqué que le registre de sécurité n\'a pas été ouvert.","2",null),
("110","39","Il a été indiqué qu\'un registre sécurité incendie a été ouvert pour chaque bâtiment classé ERP.","1",null),
("111","39","Il a été indiqué qu\'aucun registre sécurité incendie n\'a été ouvert pour chaque bâtiment classé ERP.","2",null),
("112","40","La collectivité n\'a pas sollicité le médecin de prévention afin d\'établir la fiche des risques professionnels propres aux différentes activités de ses services.","2",null),
("113","40","La collectivité a établi une ou plusieurs fiches des risques professionnels propres aux différentes activités de ses services.","1",null),
("114","41","Les fiches d\'exposition à la pénibilté et les fiches d\'exposition à l\'amiante n\'ont pas été établies.","2",null),
("115","41","Les fiches d\'exposition à la pénibilté et les fiches d\'exposition à l\'amiante ont été établies.","1",null),
("116","42","Les agents disposent d\'autorisations de conduite pour la conduite des différents engins de chantier délivrées par l\'Autorité territoriale. ","1",null),
("117","42","Les agents ne disposent pas d\'autorisation de conduite délivrée par l\'Autorité territoriale.","2",null),
("118","42","Les autorisations de conduite ne sont pas signées par l\'Autorité Territoriale en cours de mandat.","2",null),
("119","43","Les diagnostics Amiante (DTA) ont été faits.","1",null),
("120","43","Les diagnostics Amiante n\'ont pas été faits sur tous les bâtiments (permis avant 1997) de la collectivité.","2",null),
("121","43","Il a été indiqué que la collectivité procède à la réalisation d\'un diagnostic (DTA) particulier pour tous nouveaux travaux.","1",null),
("122","43","Il a été indiqué que la collectivité ne procéde pas systématiquement à la réalisation d\'un diagnostic (DTA) particulier pour tous nouveaux travaux.","2",null),
("123","43","Le ou les DTA ont été réalisés avant  le 21 décembre 2012 et n\'ont pas été mis à jour conformément à la nouvelle méthodologie de repérage.","2",null),
("124","44","Les agents  intervenants sur les installations électriques sont formés et habilités.","1",null),
("126","44","Il a été indiqué qu\'il n\'y a pas d\'agent formé et habilité à intervenir sur les installations électriques.","2",null),
("127","45","RECENSEMENT:\nIl a été indiqué qu\'un travail de recensement des produits chimiques à été réalisé.","1",null),
("128","45","FDS:\nIl a été indiqué que les fiches de données sécurité des produits chimiques utilisés par les agents sont à disposition des agents .","1",null);
INSERT INTO observation VALUES
("130","45","RECENSEMENT:\nIl a été indiqué qu\'aucun recensement des produits chimiques n\'a été fait.","2",null),
("131","45","FDS:\nIl a été indiqué que les fiches de données de sécurité ne sont pas à disposition des agents sur les lieux de stockage.","2",null),
("132","46","Il a été indiqué que des notices techniques ont été mises à disposition des agents utilisateurs.","1",null),
("133","46","Il a été indiqué que les notices techniques des produits chimiques manipulés ne sont pas disponibles.","2",null),
("134","47","Les déclarations d\'intention de commencement de travaux (DICT) sont systématiquement faites.","1",null),
("135","47","Les déclarations d\'intention de commencement de travaux (DICT) ne sont pas faites.","2",null),
("136","48","Il a été indiqué que ces équipements et installations dont la réglementation l\'impose sont vérifiés périodiquement. ","1",null),
("137","48","Il a été indiqué qu\'il n\'y a pas de vérifications périodiques de ces installations.","2",null),
("138","49","Le contrôle périodique de ces installations est effectué par un organisme agréé.","1",null),
("139","49","Il a été indiqué que le contrôle périodiquement n\'a pas été effectué par un organisme agréé.","2",null),
("140","50","Les appareils et/ou accessoires de levage sont contrôlés périodiquement.","1",null),
("141","50","Il a été indiqué que les appareils ou accessoires de levage ne sont pas contrôlés périodiquement.","2",null),
("142","51","Les installations thermiques sont contrôlées et entretenues périodiquement par un prestataire extérieur dans le cadre d\'un contrat d\'entretien.","1",null),
("143","51","Il a été indiqué que les installations thermiques n\'ont jamais été contrôlées dans le cadre d\'un contrat d\'entretien.","2",null),
("145","52","Le ou les échafaudages, échelles et escabeaux font l\'objet d\'une vérification périodique.","1",null),
("146","52","Il a été indiqué que le ou les échafaudages, échelles et escabeaux ne font pas l\'objet d\'une vérification périodique.","2",null),
("148","53","Les installations électriques sont vérifiées périodiquement.","1",null),
("149","53","Il a été indiqué que les installations électriques ne sont pas vérifiées.","2",null),
("150","54","Le ou les compresseurs ne sont pas contrôlés.","2",null),
("151","54","Le ou les compresseurs sont contrôlés.","1",null),
("152","54","Le ou les compresseurs de plus de 10 ans n\'ont pas fait l\'objet d\'une requalification.","2",null),
("153","55","La vérification périodique des EPI soumis à un contrôle n\'est pas faite.","2",null),
("154","55","La vérification périodique des EPI soumis à  contrôle est faite.","1",null),
("155","55","Tous les EPI soumis à un contrôle n\'ont pas fait l\'objet d\'une vérification périodique. (Voir la liste dans les préconisations)","2",null),
("158","56","Il a été indiqué que la collectivité ne dispose pas d\'équipement concerné par cette disposition. ","2",null),
("159","56","Il a été indiqué que la collectivité dispose d\'équipement concerné par cette disposition. ","1",null),
("160","57","EXTINCTEURS:\nLes contrôles périodiques des extincteurs sont faits.","1",null),
("161","57","EXTINCTEURS:\nLe contrôles périodique des extincteurs n\'est pas fait.","2",null),
("162","57","ALARME INCENDIE:\nLes vérifications des systèmes d\'alarme incendie on été faites.","1",null),
("163","57","ALARME INCENDIE:\nLes vérifications des systèmes d\'alarme incendie ne sont pas faites.","2",null),
("166","58","PTAC<3,5T:\nLes contrôles techniques de tous les véhicules (légers et utilitaires) sont effectués annuellement.","1",null),
("169","59","Ces installations sont contrôlées périodiquement.","1",null),
("170","59","Il a été indiqué que ces installations ne sont pas contrôlées périodiquement.","2",null),
("171","60","Il a été indiqué que la vérification périodique du ou des réservoirs n\'ont pas été faites.","2",null),
("172","60","La vérification périodique du ou des réservoirs a été faite.","1",null),
("173","61","Les vérifications périodiques ont été effectuées.","1",null),
("174","61","Il a été indiqué que les vérifications périodiques n\'ont pas été effectuées.","2",null),
("175","62","Il a été indiqué que les formations initiales à la sécurité étaient effectuées pour chaque nouvel entrant.","1",null),
("176","62","Il a été indiqué qu\'aucune formation initiale à la sécurité n\'était effectuée.","2",null),
("177","63","Un plan de formation en tant que tel n\'existe pas formellement mais un suivi tracé des formations à recyclage existe.","1",null),
("179","64","Tous les agents ont suivi une formation à l\'utilisation des extincteurs.","1",null),
("180","64","Il a été indiqué qu\'aucun agent n\'a suivi de formation à l\'utilisation des extincteurs.","2",null),
("182","65","Une organisation a été mise en place pour qu\'au moins deux agents de chaque services où sont effectués des travaux dangereux suivent cette formation.","1",null),
("183","65","Il a été indiqué qu\'il n\'y a pas d\'agent formé aux premiers secours dans les services où sont effectués des travaux dangereux .","2",null),
("184","65","Il a été indiqué qu\'il n\'y a pas d\'agent formé dans tous les services où sont effectués des travaux dangereux.","2",null),
("185","66","Un suivi des formations des agents au poste de travail est en place dans la structure.","1",null),
("186","66","La collectivité a mis en place certaines actions de communication/information vers les agents,telles que l\'utilisation des EPIs et/ou la procédure d\'utilisation des produits d\'entretien","1",null),
("189","66","Il a été indiqué que les agents n\'ont pas suivi de formation sur les risques spécifiques aux différentes activités.","2",null),
("191","67","TRACTEUR>50CV:\nIl a été indiqué que pour la conduite en sécurité du ou des tracteurs >50cv, le ou les agents n\'ont pas suivi de formation.","2",null),
("192","67","TRACTEUR>50CV:\nPour la conduite en sécurité du ou des tracteurs >50cv, le ou les agents ont suivi la formation CACES 8 et sont à jour de leur recyclage.","1",null),
("193","67","MINIPELLE/TRACTEUR<50CV:\nPour la conduite en sécurité du ou des minipelles/tracteurs <50cv, le ou les agents ont suivi la formation CACES 1 et sont à jour de leur recyclage.","1",null),
("194","67","TRACTOPELLE:\nPour la conduite en sécurité du ou des tractopelles, le ou les agents ont suivi la formation CACES 4 et sont à jour de leur recyclage.","1",null),
("195","67","PEMP:\nPour la conduite en sécurité de la nacelle élévatrice, le ou les agents ont suivi la formation CACES PEMP et sont à jour de leur recyclage.","1",null),
("197","67","TONDEUSE AUTOPORTEE:\nPour la conduite en sécurité des tondeuses autoportées, le ou les agents ont suivi une formation spécifique.","1",null),
("198","68","Le ou les agents concernées par les travaux à proximité des réseaux aériens ou enterrés ont obtenu l\'habilitation AIPR (autorisation d’intervention à proximité des réseaux)","1",null),
("199","68","Il a été indiqué que le ou les agents concernées par les travaux à proximité des réseaux aériens ou enterrés ne possèdent pas l\'habilitation AIPR (autorisation d’intervention à proximité des réseaux)","2",null),
("200","69","CERTIPHYTO:\nLe ou les agents qui utilisent des produits phyto-sanitaires ont suivi la formation Certi-Phyto. (applicateur et applicateur opérationnel).","1",null),
("201","69","CERTIBIOCIDE:\nLe ou les agents qui utilisent les produits biocides ont suivi la formation Certi-biocides.","1",null),
("202","69","CERTIPHYTO:\nIl a été indiqué que le ou les agents qui utilisent les produits phyto-sanitaires n\'ont pas suivi la formation Certi-Phyto.","2",null),
("203","69","CERTIBIOCIDE:\nIl a été indiqué que le ou les agents qui utilisent les produits biocides n\'ont pas suivi la formation Certi-biocides.","2",null),
("204","70","Un ou des agents sont formés aux techniques de tronçonnage.","1",null),
("205","70","Il a été indiqué qu\'il n\'y a pas d\'agent formé aux techniques de tronçonnage.","2",null),
("206","71","Il a été indiqué que les agents susceptibles d\'être exposés à l\'amiante ont suivi la formation réglementaire.","1",null),
("207","71","Il a été indiqué que les agents susceptibles d\'être exposés à l\'amiante n\'ont pas suivi la formation réglementaire.","2",null),
("208","72","LOCAUX:\nIl a été indiqué que tous les locaux où interviennent les agents sont pourvus d\'une trousse de premiers secours .","1",null),
("209","72","LOCAUX:\nIl a été indiqué que les locaux où interviennent les agents ne sont pas pourvus de trousse de premiers secours .","2",null),
("210","72","VÉHICULES:\nIl a été indiqué que les véhicules de service sont équipés de trousse de secours.","1",null),
("211","72","VÉHICULES:\nIl a été indiqué que les véhicules de service ne sont pas équipés de trousse de secours. ","2",null),
("213","73","Il a été indiqué que l\'affichage des différents n° d\'urgence et consignes de sécurité n\'est pas présent sur tous les sites.","2",null),
("214","73","Il a été indiqué que l\'affichage des différents n° d\'urgence et consignes de sécurité est présent sur tous les sites.","1",null),
("215","73","Il a été indiqué qu\'un affichage d\'urgence est présent sur certains sites et qu\'il est nécessaire de le compléter. (voir les préconisations)","2",null),
("216","74","LOCAUX:\nIl a été indiqué que tous les locaux sont équipés d\'extincteurs.","1",null),
("217","74","LOCAUX:\nIl a été indiqué que tous les locaux ne sont pas équipés d\'extincteurs.","2",null),
("218","74","VÉHICULES:\nIl a été indiqué que les véhicules qui présentent un risque d\'incendie sont équipés d\'un extincteur.","1",null),
("219","74","VÉHICULES:\nIl a été indiqué que les véhicules qui présentent un risque d\'incendie ne sont pas équipés d\'un extincteur.","2",null),
("220","75","Il a été indiqué qu\'une organisation de travail est mise en place pour prévenir des risques liés aux situations de travail isolé.\nCette procédure est également en place pour les interventions sous astreinte","1",null),
("222","75","Il a été indiqué qu\'aucune organisation de travail n\'est mise en place pour prévenir les situations de travail isolé sur des activités à risques élevés. (tronçonnage, travail en hauteur, travail en bordure de bassin etc...)","2",null),
("223","76","SUR SITE:\nIl a été indiqué que les sites où peuvent intervenir les agents en situation de travailleur isolé sont équipés d\'un téléphone fixe permettant d\'accéder au réseau urbain.","1",null),
("224","76","EN EXTERIEUR:\nIl a été indiqué que les agents en situation de travailleur isolé en extérieur, ont à disposition des téléphones portables professionnels.","1",null),
("225","76","SUR SITE:\nIl a été indiqué que certains sites où peuvent intervenir les agents en situation de travailleur isolé ne sont pas équipés de moyen de communication.","2",null),
("226","76","EN EXTÉRIEUR:\nIl a été indiqué que un ou des agents en situation de travailleur isolé en extérieur, n\'ont pas à leur disposition de moyen de communication professionnel.","2",null),
("227","77","Les locaux de travail ont été rendus accessibles aux travailleurs handicapés.","1",null),
("228","77","Les locaux de travail n\'ont pas été rendus accessibles aux travailleurs handicapés.","2",null),
("229","78","Il a été indiqué que les équipements de travail et de protection individuelle sont fournis aux agents.\n\n","1",null),
("230","78","Il a été indiqué qu\'aucun équipement de travail et de protection individuelle n\'est fourni aux agents.","2",null),
("231","79","Il a été indiqué que les EPI sont  portés par les agents.","1",null),
("232","79","Il a été indiqué que les EPI ne sont pas systématiquement portés par les agents.","2",null),
("233","80","Le suivi est assuré par chaque agent avant utilisation.\nUne mise à jour régulière des équipements est réalisée en fonction de leur état mais il n\'y a pas de contrôle systématique mis en place.","1",null),
("234","80","Le suivi et l\'entretien ne sont pas maîtrisés, il a été indiqué que les agents gèrent eux-même le remplacement et le nettoyage de leurs EPI.","2",null),
("235","81","FORMATION:\nUne formation a été faite au personnel sur la nécessité et l\'entrainement au port des EPI.","1",null),
("236","81","FORMATION:\nAbsence de formation au port des EPI.","2",null),
("237","82","Des consignes d\'utilisation des EPI ont été élaborées.","1",null),
("238","82","Absence de consigne d\'utilisation des EPI.","2",null),
("239","82","Les consignes d\'utilisation de certains équipements n\'ont pas été élaborées.","2",null),
("240","83","Il a été indiqué que le ou les jeunes embauchés de moins de 18 ans n\'effectuent pas de travaux interdits.","1",null),
("241","83","Le ou les jeunes embauchés de moins de 18 ans effectuent un ou des travaux interdits.","2",null),
("242","84","Le ou les jeunes travailleurs âgés de 15 à moins de 18 ans  sont apprentis ou titulaires d’un contrat de professionnalisation ou stagiaires de la formation professionnelle ou élèves ou étudiants préparant un diplôme professionnel ou technologique.","1",null),
("243","84","Le ou les jeunes travailleurs âgés de 15 à moins de 18 ans ne sont pas apprentis ou titulaires d’un contrat de professionnalisation ou stagiaires de la formation professionnelle ou élèves ou étudiants préparant un diplôme professionnel ou technologique.","2",null),
("244","85","Les conditions de dérogation ont été satisfaites.","1",null),
("245","85","Les conditions de dérogation n\'ont pas été satisfaites.","2",null);
INSERT INTO observation VALUES
("246","86","La délibération a été prise par l\'organe délibérant.","1",null),
("247","86","La délibération n\'a pas été prise par l\'organe délibérant.","2",null),
("248","87","La délibération a été transmise pour information au Comité D’hygiène de Sécurité et des Conditions de Travail (CHSCT) ni adressée à l’Agent Chargé de la Fonction d’Inspection (ACFI).","1",null),
("249","87","La délibération n\'a pas été transmise pour information au Comité D’hygiène de Sécurité et des Conditions de Travail (CHSCT) et adressée à l’Agent Chargé de la Fonction d’Inspection (ACFI).","2",null),
("250","87","La délibération n\'a pas été transmise pour information au Comité D’hygiène de Sécurité et des Conditions de Travail (CHSCT).","2",null),
("251","87","La délibération n\'a pas été adressée à l’Agent Chargé de la Fonction d’Inspection (ACFI).","2",null),
("252","88","La délibération a été renouvelée au bout de 3 ans.","1",null),
("253","88","La délibération n\'a pas été renouvelée au bout de 3 ans.","2",null),
("254","89","Il n\'existe pas de procédure mise en place pour l\'accueil d\'entreprises extérieures et la rédaction de plan de prévention.","2",null),
("255","89","Il existe une procédure mise en place pour l\'accueil d\'entreprises extérieures et la rédaction de plan de prévention.","1",null),
("256","90","Il n\'existe pas de procédure d\'élaboration d\'un protocole sécurité (chargement/déchargement) avec les fournisseurs/livreurs.","2",null),
("257","90","Il existe une procédure d\'élaboration d\'un protocole sécurité (chargement/déchargement) avec les fournisseurs/livreurs.","1",null),
("261","91","Une coordination sécurité et protection de la santé (CSPS) est prévue à l’occasion de tous chantiers importants impliquant de la coactivité.","1",null),
("262","91","Aucune coordination sécurité et protection de la santé (CSPS) n\'est prévue à l’occasion des chantiers importants impliquant de la coactivité.","2",null),
("263","92","L\'autorité territoriale ne délivre pas de Permis de feu lorsque les agents interviennent pour des travaux par \"point chaud\" dans les batiments autres que le service technique.","2",null),
("264","92","L\'autorité territoriale délivre un Permis de feu lorsque les agents interviennent pour des travaux par \"point chaud\" dans les batiments autres que le service technique.","1",null),
("265","93","Pas de signalisation des zones de danger","2",null),
("266","93","La signalisation des zones de danger est incomplète","2",null),
("267","93","La signalisation des zones de danger est conforme","1",null),
("273","94","VESTIAIRES/SANITAIRES:\nLe nettoyage des vestiaires et des installations sanitaires est à revoir.","2",null),
("274","94","NETTOYAGE:\nLes locaux de travail sont entretenus et nettoyés régulièrement.","1",null),
("275","94","LOCAUX DE TRAVAIL:\nL’entretien et le nettoyage sont à revoir.","2",null),
("276","95","Absence de point d’eau potable et fraîche.","2",null),
("277","95","Eau potable et fraîche à disposition.","1",null),
("278","96","INTERDICTION:\nL’interdiction de fumer n’est pas respectée.","2",null),
("279","96","AFFICHAGE:\nL’affichage réglementaire n’est pas présent.","2",null),
("281","96","INTERDICTION:\nL’interdiction de fumer est respectée.","1",null),
("282","97","VESTIAIRES:\nLes vestiaires sont installés dans un local spécial de surface convenable(au moins 1m² par agent)","1",null),
("284","97","LAVABOS:\nLe nombre de lavabos est conforme (1 pour 10 agents au plus)","1",null),
("286","98","(Une ou) des douches sont à disposition (du ou) des agents du centre technique.","1",null),
("287","98","Aucune douche n’est à disposition des agents du centre technique.","2",null),
("288","99","LOCAL:\nAbsence de local de restauration.","2",null),
("289","99","LOCAL:\nPrésence d’un local de restauration.","1",null),
("290","99","EQUIPEMENTS:\nAbsence de moyen de conservation ou de réfrigération des aliments et des boissons et d’une installation permettant de réchauffer les plats.","2",null),
("291","99","EQUIPEMENTS:\nPrésence de moyen de conservation ou de réfrigération des aliments et des boissons et d’une installation permettant de réchauffer les plats.","1",null),
("292","99","MOBILIER:\nNombre de sièges et de tables suffisant.","1",null),
("293","99","MOBILIER:\nNombre de sièges et de tables insuffisant.","2",null),
("294","100","CABINET D\'AISANCE:\nAbsence de cabinet d’aisance.","2",null),
("295","100","NOMBRE:\nCabinets d’aisance en nombre insuffisant.","2",null),
("296","100","ENTRETIEN:\nLa périodicité de nettoyage est insuffisante.","2",null),
("297","100","SÉPARATION:\nPas de cabinet d’aisance séparés pour le personnel féminin et masculin","2",null),
("298","100","CABINET D\'AISANCE:\nPrésence de cabinet d’aisance en nombre suffisant.","1",null),
("299","100","NETTOYAGE:\nLes installations sanitaires sont entretenues et nettoyées régulièrement.","1",null),
("300","100","SÉPARATION:\nLes toilettes homme / femme sont séparés","1",null),
("301","101","Absence d’eau potable et fraîche à disposition.","2",null),
("302","101","Eau potable et fraîche à disposition.","1",null),
("303","102","Absence de local de repos.","2",null),
("304","102","Présence d’un local de repos.","1",null),
("305","103","CHAUFFAGE:\nLes locaux affectés au travail sont chauffés pendant la saison froide.","1",null),
("306","103","CHAUFFAGE:\nLes locaux affectés au travail ne sont pas chauffés pendant la saison froide.","2",null),
("307","103","VÊTEMENTS:\nLes agents dont les activités les amènent à intervenir en extérieur, sont dotés de vêtements adaptés contre le froid.","1",null),
("308","103","VÊTEMENTS:\nLes agents dont les activités les amènent à intervenir en extérieur, ne sont pas dotés de vêtement adapté contre le froid.","2",null),
("309","104","ECLAIRAGE:\nL’éclairage des locaux de travail est suffisant.","1",null),
("311","104","ECLAIRAGE:\nL’éclairage des locaux de travail est insuffisant.","2",null),
("312","104","PROTECTION LUMINEUSE:\nLes ouvertures sont équipées de protections fixes ou mobiles appropriées contre les rayons solaires génants.","1",null),
("313","104","PROTECTION LUMINEUSE:\nLes ouvertures ne sont pas équipées de protection fixe ou mobile appropriée contre les rayons solaires gênants.","2",null),
("314","105","Absence d’aération par ventilation mécanique ou par ventilation naturelle permanente.","2",null),
("315","105","Présence d’une aération par ventilation mécanique ou par ventilation naturelle permanente.","1",null),
("316","106","VÉHICULES:\nLes véhicules de service sont équipés de trousse de secours","1",null),
("317","106","LOCAUX:\nLes locaux où interviennent les agents ne sont pas pourvus d\'une trousse de premiers secours","2",null),
("318","107","L\'affichage des différents numéros d\'urgence et consignes de sécurité est présent sur tous les sites de la structure.","1",null),
("319","107","L\'affichage des différents numéros d\'urgence et consignes de sécurité n\'est pas présent sur tous les sites de la structure.","2",null),
("320","108","TRAVAIL ISOLE:\nIl a été indiqué qu\'une organisation de travail est mise en place pour prévenir des risques liés aux situations de travail isolé.","1",null),
("321","108","TRAVAIL ISOLE:\nIl a été indiqué qu\'aucune organisation de travail n\'est mise en place pour prévenir les situations de travail isolé sur des activités à risques élevés. (tronçonnage, travail en hauteur, travail en bordure de bassin etc...)","2",null),
("322","109","TÉLÉPHONE FIXE:\nIl a été indiqué que le site est équipé d\'un téléphone fixe permettant d\'accéder au réseau urbain. ","1",null),
("323","109","TÉLÉPHONE FIXE:\nIl a été indiqué que le site n\'est pas équipé d\'un téléphone fixe permettant d\'accéder au réseau urbain. ","2",null),
("324","110","Absence de procédure d’urgence.","2",null),
("325","110","Présence d’une procédure d’urgence.","1",null),
("326","111","L’effectif théorique à été calculé.","1",null),
("327","111","L’effectif théorique n’a pas été calculé.","2",null),
("328","112","Les remarques de la commission de sécurité ont été levées.","1",null),
("329","112","Les remarques de la commission de sécurité n’ont pas été levées.","2",null),
("330","112","Un avis défavorable à été émis par la commission de sécurité.","2",null),
("331","113","NOMBRE:\nLes extincteurs sont en nombre suffisant","1",null),
("332","113","NOMBRE:\nLes extincteurs ne sont pas en nombre suffisant","2",null),
("333","113","ACCESSIBILITÉ:\nCertains extincteurs sont disposés trop en hauteur (poignée à plus de 1m50)","2",null),
("334","113","ACCESSIBILITÉ:\nLes extincteurs sont accessibles","1",null),
("335","113","SIGNALISATION:\nLa signalisation des extincteurs n’est pas conforme","2",null),
("336","113","SIGNALISATION:\nLa signalisation des extincteurs est conforme","1",null),
("337","113","ENGINS:\nLe ou les engins qui, avec leurs équipements (broyeur, épareuse...) présentent un risque d’incendie en sont équipés.","1",null),
("338","113","ENGINS:\nLe ou les engins qui, avec leurs équipements (broyeur, épareuse...) présentent un risque d’incendie ne sont pas équipés.","2",null),
("339","114","Des essais périodiques et des exercices d’évacuations ont lieu au moins tous les 6 mois.","1",null),
("340","114","Aucun exercice d’évacuation n’a été organisé.","2",null),
("341","114","Un seul exercice d’évacuation par an.","2",null),
("342","115","Les produits inflammables sont stockés dans un local (ou une armoire réservé à cet usage), ventilé, fermé à clé, clairement identifié, pourvu d\'un dispositif de rétention spécifique et résistant au feu.","1",null),
("343","115","Les produits inflammables sont stockés sans précaution particulière.","2",null),
("344","116","Les dispositifs de désenfumage sont présents.","1",null),
("345","116","Les dispositifs de désenfumage sont absents.","2",null),
("346","117","Les consignes incendie sont présentes.","1",null),
("347","117","Les consignes incendie sont absentes.","2",null),
("348","117","Les consignes incendie sont incomplètes.","2",null),
("350","118","AFFICHAGE:\nAbsence de plan d\'évacuation.","2",null),
("351","118","Les plans d\'évacuation sont à jour et affichés.","1",null),
("352","119","Le ou les dégagements sont libres.","1",null),
("353","119","Le ou les dégagements sont encombrés.","2",null),
("355","120","OUVERTURE:\nLa ou les portes ne disposent pas de dispositif dé-verrouillable sans clef","2",null),
("356","120","OUVERTURE:\nLa ou les portes disposent de dispositifs dé-verrouillables sans clef.","1",null),
("357","120","NOMBRE;\nLe nombre de dégagement est suffisant.","1",null),
("358","121","Le ou les escaliers sont munis de rampe ou de main-courante.","1",null),
("359","121","Absence de main-courante dans l\'escalier.","2",null);
INSERT INTO observation VALUES
("360","122","Le bâtiment est équipé d\'un système d\'alarme sonore.","1",null),
("361","122","Le système d\'alarme sonore est en dysfonctionnement.","2",null),
("362","123","Le ou les Blocs Autonomes d\'Eclairage Sécurité (BAES) sont en dysfonctionnement.","2",null),
("363","123","Le ou les Blocs Autonomes d\'Eclairage de Sécurité (BAES) sont en état de fonctionnement.","1",null),
("364","124","L\'évaluation du risque de chute de plain pied a été effectué.","1",null),
("365","124","Il n\'y a pas eu d\'évaluation du risque de chute de plain pied.","2",null),
("366","125","La fosse de visite est recouverte en dehors des interventions.","1",null),
("367","125","La fosse de visite n\'est pas conforme aux recommandations R468 ET R469.","2",null),
("368","126","La zone présente des risques de chute de plain pied","2",null),
("369","126","La zone ne présente pas de risque de chute","1",null),
("370","127","La zone est encombrée","2",null),
("371","127","La zone est exempt de tout encombrement","1",null),
("372","128","La prévention des risques liés aux chutes de hauteur a été évaluée.","1",null),
("373","128","La prévention des risques liés aux chutes de hauteur n\'a pas été évaluée.","2",null),
("374","129","CONFORMITÉ:\nLa plan de travail en hauteur ne dispose pas d’escalier d’accès sécurisé.","2",null),
("375","129","CONFORMITÉ:\nLa plan de travail en hauteur dispose d’un escalier d’accès sécurisé.\n","1",null),
("376","129","DÉGAGEMENT:\nAucun objet, marchandise ou matériel ne fait obstacle à la circulation des personnes.","1",null),
("377","129","MAIN COURANTE:\nLe ou les escaliers sont munis de rampe ou de main-courante.","1",null),
("378","129","DÉGAGEMENT:\nDes objets dans l’escalier, font obstacle à la circulation des personnes.","2",null),
("379","130","Le ou les plans de travail situés en hauteur ne disposent pas de garde-corps.","2",null),
("380","130","Le ou les plans de travail situés en hauteur disposent de garde-corps réglementaires.","1",null),
("382","130","Le ou les plans de travail situés en hauteur ne disposent pas de garde-corps réglementaires.","2",null),
("385","131","La structure ne dispose pas de plate-forme élévatrice mobile de personne (PEMP) mais il a été indiqué qu’il lui arrivé d’en louer occasionnellement","1",null),
("386","131","FORMATION CONDUITE:\nIl a été indiqué que, au moins deux agents disposent du CACES PEMP et d’une autorisation de conduite.","1",null),
("388","131","E.P.I:\nIl a été indiqué que les agents sont dotés des EPI nécessaires (harnais, longe, casque) et qu’ils les portent.","1",null),
("389","131","FORMATION E.P.I:\nIl a été indiqué que agents sont formés à l\'utilisation et à leur mise en oeuvre des Equipements de Protection Individuelle.","1",null),
("390","131","FORMATION CONDUITE:\nIl a été indiqué qu\'aucun agent n\'était formé à l\'utilisation et à leur mise en oeuvre d\'une plate forme élévatrice de personnel (PEMP)","2",null),
("391","131","FORMATION E.P.I:\nLes agents ont a leur disposition des harnais mais n’ont pas été formés à leur utilisation.","2",null),
("392","131","NOMBRE D\'AGENTS:\nIl a été indiqué que les interventions avec la PEMP ne se font pas systématiquement à deux agents.","2",null),
("393","132","EPI:\nLes agents disposent de harnais et de longes contre les chutes de hauteur.","1",null),
("394","132","FORMATION:\nIl a été indiqué que les agents ont été formés à leur utilisation.","1",null),
("395","132","FORMATION:\nIl a été indiqué que les agents n’ont pas été formés à l\'utilisation des dispositifs individuels anti-chute.","2",null),
("397","133","FORMATION:\nIl n’y a pas d’agent formé au montage, démontage de ce matériel.","2",null),
("398","133","FORMATION:\nIl a été indiqué qu’un agent est formé au montage et démontage de ce matériel.","1",null),
("399","133","NOTICE:\nLa notice de montage est disponible.","1",null),
("400","133","NOTICE:\nLa notice de montage n’est pas disponible.","2",null),
("401","133","ETAT GÉNÉRAL:\nLes différents éléments de l’échafaudage sont en bon état visuel.","1",null),
("402","133","VÉRIFICATION PÉRIODIQUE:\nLes vérifications trimestrielles sont effectuées et consignées.","1",null),
("403","133","VÉRIFICATION PÉRIODIQUE:\nLes vérifications périodiques ne sont pas effectuées et consignées.","2",null),
("404","134","ETAT:\nLa ou les échelles utilisées par les agents et vues lors de la visite, sont en bon état.","1",null),
("405","134","ETAT:\nToutes les échelles ne sont pas en bon état (patin anti-dérapant, déformation...)","2",null),
("407","134","UTILISATION ECHELLE:\nll a été indiqué que la ou les échelles ne sont utilisées comme poste de travail que de façon occasionnelle.","1",null),
("408","134","UTILISATION ECHELLE:\nll a été indiqué que la ou les échelles sont utilisées comme poste de travail.","2",null),
("412","135","Aucun inventaire des manutentions manuelles n’a été initié.","2",null),
("413","135","L’ensemble des manutentions manuelles ont été répertoriées.","1",null),
("414","135","Un plan d’action à été initié.","1",null),
("415","136","Des dispositifs d\'aide à la manutention sont disponibles et en nombre suffisant.","1",null),
("416","136","Absence de dispositif d\'aide à la manutention.","2",null),
("417","137","Les agents n’ont pas suivi de formation adéquate à la sécurité relative à l’exécution de ces opérations.","2",null),
("418","137","Les agents ont suivi une formation adéquate à la sécurité relative à l’exécution de ces opérations.","1",null),
("419","137","Les agents n’ont pas tous suivi une formation adéquate à la sécurité relative à l’exécution de ces opérations.","2",null),
("420","138","Les limites réglementaires de port de charges sont respectées.","1",null),
("421","138","Il a été indiqué que les limites réglementaires de port de charges ne sont pas respectées.","2",null),
("422","139","Lors de la visite, il a été indiqué que les agents communaux amenés à conduire les différents véhicules sont titulaires des permis réglementaires","1",null),
("424","140","Les agents ont suivi la formation FIMO et son à jour de leur recyclage (FCO).","1",null),
("425","140","Les agents n\'ont pas suivi la formation FIMO.","2",null),
("426","141","Les zones à risque ne sont pas signalées.","2",null),
("427","141","Les zones à risque sont signalées.","1",null),
("428","141","La signalisation applicable aux trafics est insuffisante.","2",null),
("429","142","MISE A DISPOSITION:\nLes agents  intervenant à pied sur le domaine routier à l’occasion d’un chantier ou d’un danger temporaire sont dotés de vêtements de signalisation classe 2 minimum.","1",null),
("430","142","PORT OBLIGATOIRE:\nIl a été indiqué que ces équipements sont portés.","1",null),
("433","142","ETAT:\nLes vêtements sont dans un état de propreté et d\'usure suffisant pour les maintenir efficaces.","1",null),
("434","142","MISE A DISPOSITION:\nLes agents  intervenant à pied sur le domaine routier à l’occasion d’un chantier ou d’un danger temporaire ne sont pas dotés de vêtements de signalisation classe 2 minimum.","2",null),
("435","143","SIGNALISATION:\nLe ou les véhicules ou engins qui par nécessité de service progressent lentement ou stationnent sur les chaussées sont équipés de la signalisation réglementaire.","1",null),
("436","143","SIGNALISATION:\nLe ou les véhicules qui par nécessité de service progressent lentement ou stationnent sur les chaussées ne sont pas équipés de la signalisation réglementaire. ","2",null),
("437","143","TRACTEUR EPAREUSE:\nLe tracteur épareuse utilisé lors d’un chantier mobile porte un AK5 muni de triflash.","1",null),
("438","143","TRACTEUR EPAREUSE:\nLe tracteur épareuse utilisé lors d’un chantier mobile n’est pas équipé de triflash.","2",null),
("439","143","OUTILS ATTELÉS:\nLes outils attelés ne sont pas signalés par des dispositifs rétroréfléchissants.","2",null),
("440","143","OUTILLAGES PORTES:\nLes outillages portés compris entre 1m et 4m inclus ne sont pas signalés par un dispositif face à l’arrière et deux disposés latéralement. (panneau carré 423x423 ou rectangulaire 423x282)","2",null),
("441","144","STOCK:\nLe centre technique dispose d’un stock  de panneaux de signalisation et il a été indiqué que les agents les utilisent lors de tous les chantiers temporaires.","1",null),
("442","144","STOCK:\nLe centre technique ne dispose pas d’un stock de panneaux de signalisation en nombre suffisant.","2",null),
("443","144","FIN DE PRESCRIPTION:\nPas de signalisation de fin de prescription.","2",null),
("444","144","ETAT:\nLes panneaux de signalisation sont en bon état.","1",null),
("445","144","ETAT:\nCertains panneaux sont usagés et détériorés, ce qui réduit passablement leur efficacité.","2",null),
("446","145","Il a été indiqué que les agents ont suivi une formation théorique au balisage de chantier lors de la formation CACES.","1",null),
("447","145","Il a été indiqué que les agents du service technique n’ont pas suivi de formation pratique s’agissant des risques liés aux interventions sur le domaine routier ( le balisage temporaire).","2",null),
("448","146","Le véhicule n’est pas équipé d’une séparation pouvant protéger des déplacements intempestifs des charges transportées.","2",null),
("449","146","Le véhicule est équipé d’une séparation pouvant protéger des déplacements intempestifs des charges transportées.","1",null),
("450","147","Le véhicule ne dispose pas de dispositif d’arrimage adapté aux charges à transporter.","2",null),
("451","147","Le véhicule dispose de dispositifs d’arrimage adaptés aux charges à transporter.","1",null),
("452","148","Le véhicule n’est pas adapté aux tâches à réaliser.","2",null),
("453","148","Le véhicule est adapté aux tâches à réaliser.","1",null),
("458","150","Le matériel dispose du marquage de conformité CE.","1",null),
("459","150","Matériel avec absence de marquage de conformité CE.","2",null),
("460","151","La machine n’a pas été contrôlé conformémént à la règlementation","2",null),
("461","151","La machine a été contrôlé conformément à la réglementation.","1",null),
("462","152","Matériel avec absence de marquage de conformité CE","2",null),
("463","152","Matériel modifié remettant en cause sa conformité CE","2",null),
("464","152","Le matériel dispose du marquage de conformité CE","1",null),
("465","153","Notice d’instruction disponible","1",null),
("466","153","Notice d’instruction indisponible.","2",null),
("467","154","Une information a été faite aux agents de maintenance des machine, un cahier de suivi à été mis en place","1",null),
("468","154","Aucune gestion de la maintenance des machines","2",null),
("469","155","Organe de sécurité en état.","1",null),
("470","155","Organe de sécurité détérioré.","2",null),
("471","156","L’engin est conforme à la réglementation.","1",null),
("472","156","L’engin n’est pas conforme à la réglementation.","2",null),
("473","157","TRACTEUR EPAREUSE:\nLe tracteur épareuse utilisé lors des chantiers mobiles portent un panneau AK5 muni de triflash.","1",null),
("474","157","TRACTEUR EPAREUSE:\nLe tracteur épareuse utilisé lors des chantiers mobiles n\'est pas équipé d\'un panneau AK5 muni de triflash.","2",null),
("475","158","Les VGP (Vérification Générale Périodique) des engins ont été réalisées.","1",null);
INSERT INTO observation VALUES
("476","158","Les VGP (Vérification Générale Périodique) des engins n’ont pas été réalisées.","2",null),
("477","158","Les VGP (Vérification Générale Périodique) de certains engins n’ont pas été réalisées.","2",null),
("478","159","La VGP (Vérification Générale Périodique) de la cuve du pulvérisateur a été effectuée.","1",null),
("479","159","La VGP (Vérification Générale Périodique) de la cuve du pulvérisateur n’a pas été effectuée.","2",null),
("480","160","Le ou les agents qui utilisent la tondeuse autoportée ont suivis une formation spécifique à la conduite en sécurité.","1",null),
("481","160","Le ou les agents qui utilisent la tondeuse autoportée n\'ont pas suivis de formation spécifique à la conduite en sécurité pour ce type d\'engin.","2",null),
("482","161","La ou les tondeuses autoportées sont équipées de l\'éclairage sécurité réglementaire. (Gyrophare, éclairage de position et de changement de direction)","1",null),
("483","161","La ou les tondeuses autoportées ne sont pas équipées de l\'éclairage sécurité réglementaire. (Gyrophare et/ou éclairage de position et/ou de changement de direction)","2",null),
("484","162","La tondeuse autoportée est susceptible d’évoluer sur des sols en forte pente, elle est équipée d’un système anti-écrasement.","1",null),
("485","162","La tondeuse autoportée est susceptible d’évoluer sur des sols en forte pente et n’est pas équipé d’un système anti-écrasement.","2",null),
("486","163","La tondeuse auto-portée est homologuée pour circuler sur la voie publique.","1",null),
("487","163","La tondeuse auto-portée est amenée à circuler sur la voie publique mais n’est pas homologuée et équipée de la signalisation reglementaire.","2",null),
("488","164","Il a été indiqué que l\'Engin de Service Hivernal a fait l\'objet d\'une exemption de \"réception à titre isolé\" auprès des services de la DREAL.","1",null),
("489","164","Il a été indiqué que l\'Engin de Service Hivernal n\'a pas fait l\'objet d\'une \"réception à titre isolé\" auprès des services de la DREAL.","2",null),
("490","165","L’éclairage et la signalisation sont conformes.","1",null),
("491","165","L’éclairage et la signalisation ne sont pas conformes.","2",null),
("492","166","Le ou les agents sont titulaires du permis correspondant à la catégorie du véhicule et on suivi une formation à la conduite en sécurité.","1",null),
("493","166","Le ou les agents ne sont pas titulaires du permis corespondant à la catégorie du véhicule","2",null),
("494","166","Le ou les agents n’ont pas suivi de formation adapté corespondante au type de véhicule","2",null),
("496","167","La lame fournie à l\'exploitant agricole est en conformité.","1",null),
("497","167","La lame fournie à l\'exploitant agricole n\'est pas en conformité.","2",null),
("498","168","EVALUATION DES RISQUES:\nLe risque chimique a fait l\'objet d\'une évaluation des risques dans le document unique.","1",null),
("499","168","EVALUATION DES RISQUES:\nLe risque chimique n\'a pas fait l\'objet d\'une évaluation des risques dans le document unique.","2",null),
("501","169","Il a été indiqué que certains agents du service technique ont suivi la formation certifiante ’Certi-phyto’","1",null),
("502","169","Il a été indiqué que les agents du service technique n’ont pas suivi de formation à l’utilisation des produits dangereux.","2",null),
("503","169","Il a été indiqué que des agents du restaurant scolaire ont suivi une formation sur cette problématique dans le cadre de l’HACCP.","1",null),
("504","169","Il a été indiqué que les agents d’entretien n’ont pas suivi de formation à l’utilisation des produits dangereux.","2",null),
("505","170","Il a été indiqué que les FDS (Fiches de données de sécurité) des produits utilisés et stockés ont été recensées et sont mises à disposition sur les sites de stockage.","1",null),
("506","170","INVENTAIRE:\nIl a été indiqué que les FDS (Fiches de données de sécurité) des produits utilisés et stockés ne sont pas recensées.","2",null),
("507","171","La liste des travailleurs exposés a été communiquée au service de médecine préventive.","1",null),
("508","171","La liste des travailleurs exposés n\'a pas été communiquée au service de médecine préventive.\n","2",null),
("509","172","Une démarche de substitution à été initié.","1",null),
("510","172","Aucune démarche de substitution n’a été initié.","2",null),
("511","173","Les notices de poste (consignes d\'utilisation et de secours) sont affichées sur le lieu de manipulation.","1",null),
("512","173","Les notices de postes (consignes d\'utilisation et de secours) sont incomplètes.","2",null),
("513","173","Absence de notice de poste (consigne d\'utilisation et de secours) sur le lieu de manipulation.","2",null),
("514","174","Le dispositif de captage des polluants est suffisant.","1",null),
("515","174","Le dispositif de captage des polluants est insuffisant.","2",null),
("516","175","Il a été indiqué que les agents utilisant les produits sont dotés d’équipements de protection (gants, vêtements, chaussures)","1",null),
("517","175","Il Ia été indiqué que les agents assurant l’entretien des locaux ne sont pas dotés de l’ensemble des équipements de protection nécessaire (pas de gant, de chaussures, de vêtement...)","2",null),
("518","175","Il a été indiqué que des équipements individuels tels que combinaisons,gants, bottes, lunettes, masques ont été mis à disposition des agents.","1",null),
("519","175","Il a été indiqué que tous les équipements individuels nécessaires ne sont pas fournis (pas de combinaisons,gants, bottes, masques, lunettes )","2",null),
("520","175","Pas de gant de protection chimique et de gant de protection contre la coupure (gant textile en Kévlar à porter sous un gant d’hygiène) à disposition.","2",null),
("521","175","Privilégier les chaussures fermées pour les activités de restauration nécessitant de multiples déplacements","2",null),
("522","176","STOCKAGE:\nLes produits chimiques sont stockés dans un local (ou une armoire réservé à cet usage), ventilé, fermé à clé, clairement identifié et pourvu d’un dispositif de rétention spécifique.","1",null),
("523","176","LOCAL:\nLes produits d’entretien sont stockés dans un local réservé à cet usage mais sans aération, pas fermé à clé et dépourvu de dispositif de rétention spécifique.","2",null),
("524","176","ARMOIRE:\nLes produits d’entretien sont stockés dans une armoire sans distinction, mélangés à des consommables, sans aération, pas fermé à clé et dépourvu de dispositif de rétention spécifique.","2",null),
("526","176","STOCKAGE:\nLe stockage des produits chimiques n\'est pas conforme à la réglementation.","2",null),
("527","177","La liste des travailleurs exposés a été communiquée au service de médecine préventive.","1",null),
("528","177","La liste des travailleurs exposés n\'a pas été communiquée au service de médecine préventive.","2",null),
("529","178","Il a été indiqué que la collectivité dispose d\'agents formés et habilités à intervenir sur les installations électriques.","1",null),
("530","178","Il a été indiqué que la collectivité ne dispose pas d\'agent formé et habilité à intervenir sur les installations électriques.","2",null),
("531","179","La ou les installations sont conformes (rapport de vérification périodique sans remarque)","1",null),
("533","180","La ou les armoires sont signalées par un pictogramme de danger électrique.","1",null),
("534","180","La ou les armoires ne sont pas signalées par un pictogramme de danger électrique.","2",null),
("535","181","EVALUATION RISQUE BRUIT: \nLe risque bruit a fait l\'objet d\'une évaluation des risques dans le document unique.","1",null),
("536","181","EVALUATION RISQUE BRUIT:\nLe risque bruit n\'a pas fait l\'objet d\'une évaluation des risques dans le document unique.","2",null),
("537","182","MISE A DISPOSITION:\nDes équipements de protection individuelles contre les nuisances sonores sont à disposition des agents.","1",null),
("538","182","MISE A DISPOSITION:\nIl n\'y a pas d\'équipement de protection individuelle contre les nuisances sonores à disposition des agents.","2",null),
("539","183","FORMATION RISQUE BRUIT:\nIl a été indiqué que les agents ont reçu une formation/information en rapport avec les résultats de l\'évaluation\n","1",null),
("540","183","FORMATION RISQUE BRUIT:\nIl a été indiqué que les agents n\'ont reçu aucune formation/information sur les risques liés au bruit","2",null),
("541","184","SUIVI MEDICAL:\nLes bruits auxquels sont exposés les agents ne dépassent pas les valeurs d\'exposition","1",null),
("542","184","SUIVI MEDICAL:\nIl a été indiqué que les agents exposés n\'ont pas eu d\'examen audiométrique préventif ","2",null),
("543","185","MESURES D\'EXPOSITION:\nDes mesures d\'exposition ont été réalisées  et ne font apparaître aucun dépassement des valeurs limites","1",null),
("544","185","MESURES D\'EXPOSITION:\nIl a été indiqué qu\'aucune mesure de niveaux de bruit n\'a été réalisée","2",null),
("545","186","EVALUATION DES RISQUES:\nLe risque biologique a fait l\'objet d\'une évaluation des risques dans le document unique (DUERP)","1",null),
("546","186","EVALUATION DES RISQUES:\nAucune mesures n’a été prise pour réduire l’exposition aux agents biologiques dangereux","2",null),
("547","186","EVALUATION DES RISQUES:\nLes mesures prise pour réduire l’exposition aux agents biologiques dangereux sont insuffisantes","2",null),
("548","187","Une démarche de suppression de l\'exposition au risque a été initiée.","1",null),
("549","187","Aucune démarche de suppression de l\'exposition au risque n\'a été initiée.","2",null),
("550","188","LISTE AGENTS EXPOSES:\nUne liste des agents exposés aux risques biologiques a été établie et transmise au médecin de prévention.\n","1",null),
("551","188","LISTE AGENTS EXPOSES:\nAucune information sur les agents exposés aux risques biologiques n\'a été transmise au médecin de prévention.","2",null),
("552","189","INSTRUCTION:\nIl existe une instruction écrite portant sur la procédure à suivre en cas d’accident ou d’incident grave mettant en cause un agent biologique.","1",null),
("553","189","INSTRUCTION:\nIl n\'existe pas d\'instruction écrite portant sur la procédure à suivre en cas d’accident ou d’incident grave mettant en cause un agent biologique.","2",null),
("554","190","Le risque lié aux vibrations mécaniques a fait l\'objet d\'une évaluation des risques dans le document unique (DUERP)","1",null),
("555","190","Le risque lié aux vibrations mécaniques n\'a pas fait l\'objet d\'une évaluation des risques dans le document unique.","2",null),
("556","191","MESURES D\'EXPOSITION:\nDes mesures d\'exposition ont été réalisées  et ne font apparaître aucun dépassement des valeurs limites.","1",null),
("557","191","MESURES D\'EXPOSITION:\nIl a été indiqué qu\'aucune évaluation ou mesure des niveaux de vibration mécanique n\'a été réalisée.","2",null),
("558","192","SUIVI MÉDICAL:\nLes agents exposés aux vibrations mécaniques dépassant les valeurs limites d\'exposition sont suivi par le médecin de prévention.","1",null),
("559","192","SUIVI MÉDICAL:\nLe médecin de prévention n\'a pas été informé des résultats de l\'évaluation des niveaux de vibrations mécaniques ou du mesurage.","2",null),
("560","193","L’implantation du bureau est adaptée.","1",null),
("561","193","L’implantation du bureau est à revoir.","2",null),
("562","194","L’éclairage est suffisant et les protections contre l’éblouissement sont présentes.","1",null),
("563","194","L’éclairage est insuffisant et les protections contre l’éblouissement sont absentes.","2",null),
("564","195","MATÉRIEL INFORMATIQUE ET MOBILIER:\nLe bureau est équipé de matériel informatique et de mobilier adapté.","1",null),
("565","195","MATÉRIEL INFORMATIQUE ET MOBILIER:\nLe bureau n’est pas équipé de matériel informatique et de mobilier adapté.","2",null),
("566","196","Une organisation du travail est mise en place pour limiter l’astreinte visuelle et la fatigue posturale.","1",null),
("567","196","Aucune organisation de travail n’a été mise en place pour limiter l’astreinte visuelle et la fatigue posturale.","2",null),
("570","197","La surface du bureau et les largeurs de passage correspondent à la norme.","1",null),
("571","197","La surface du bureau et les largeurs de passage sont inférieures à la norme.","2",null),
("572","198","Il existe une procédure pour l\'élaboration d\'un protocole sécurité (chargement/déchargement) avec les fournisseurs/livreurs.","1",null),
("573","198","Il n\'existe pas de procédure pour l\'élaboration d\'un protocole sécurité (chargement/déchargement) avec les fournisseurs/livreurs.","2",null),
("574","199","Il existe une procédure mise en place pour l\'accueil d\'entreprises extérieures et la rédaction de plan de prévention.","1",null),
("575","199","Il n\'existe pas de procédure mise en place pour l\'accueil d\'entreprises extérieures et la rédaction de plan de prévention.","2",null),
("576","200","Des règles de sécurité et d\'intervention ont été planifiées.","1",null),
("577","200","Les règles de sécurité et d\'intervention n\'ont pas été planifiées.","2",null),
("578","201","Le ou les agents sont équipés des EPI nécessaires.","1",null),
("579","201","Le ou les agents ne sont pas équipés de tous les EPI nécessaires.","2",null),
("580","202","Le ou les agents en situation de travailleurs isolés disposent d\'un moyen de communication.","1",null),
("581","202","Le ou les agents en situation de travailleurs isolés ne disposent pas d\'un moyen de communication professionnel.","2",null);
INSERT INTO observation VALUES
("583","203","Le ou les agents ont suivi la formation obligatoire.","1",null),
("584","203","Le ou les agents n’ont pas suivi la formation obligatoire.","2",null),
("585","204","La commune est habilitée par la préfecture.","1",null),
("586","204","La commune n’est pas habilitée par la préfecture.","2",null),
("587","205","Des règles de sécurité formalisées ont été soumises aux agents.","1",null),
("588","205","Aucune règle de sécurité n\'a été formalisée et portée à la connaissance des agents.","2",null),
("589","206","Le ou les plans de travail situés en hauteur disposent de garde-corps réglementaires.","1",null),
("590","206","Le ou les plans de travail situés en hauteur ne disposent pas de garde-corps.","2",null),
("591","207","Le ou les agents en situation de travailleurs isolés disposent d\'un moyen de communication.","1",null),
("592","207","Le ou les agents en situation de travailleurs isolés ne disposent pas d\'un moyen de communication professionnel.","2",null),
("593","208","Les règles de sécurité formalisées ont été soumises aux agents.","1",null),
("594","208","Aucune règle de sécurité n\'a été formalisée et portée à la connaissance des agents.","2",null),
("595","209","Le ou les agents sont équipés des EPI adaptés et nécessaires.","1",null),
("596","209","Le ou les agents ne sont pas équipés de tous les EPI nécessaires.","2",null),
("597","210","Le ou les agents en situation de travailleurs isolés disposent d\'un moyen de communication.","1",null),
("598","210","Le ou les agents en situation de travailleurs isolés ne disposent pas d\'un moyen de communication professionnel.","2",null),
("599","211","Les agents disposent d\'un système de captage des fumées.","1",null),
("600","211","Les agents ne disposent pas d\'un système de captage des fumées.","2",null),
("601","212","Le ou les agents qui utilisent des produits phyto-sanitaires ont suivi la formation Certi-Phyto. (applicateur et applicateur opérationnel).","1",null),
("602","212","Le ou les agents qui utilisent des produits phyto-sanitaires n\'ont pas suivi la formation Certi-Phyto. ","2",null),
("603","213","Les EPI sont stockés dans un local ou une armoire différente du lieu de stockage des produits phytosanitaires.","1",null),
("604","213","Les EPI ne sont pas stockés dans un local ou une armoire différente du lieu de stockage des produits phytosanitaires.","2",null),
("605","214","Présence d\'un registre des applications des produits phytosanitaires.","1",null),
("606","214","Absence de registre des applications des produits phytosanitaires.","2",null),
("607","215","Les produits Phytosanitaires sont stockés dans une armoire ou un local spécifique.","1",null),
("608","215","Les produits Phytosanitaires ne sont pas stockés dans une armoire ou un local spécifique.","2",null),
("609","216","Les agents intervenants sur la fabrication ou la manutention des repas ont suivi la formation réglementaire à l\'hygiène alimentaire (HACCP)","1",null),
("610","216","Les agents intervenants sur la fabrication ou la manutention des repas n\'ont pas suivi de formation  à l\'hygiène alimentaire (HACCP)","2",null),
("611","217","La collectivité  a effectué une déclaration d\'activité alimentaire auprès des services de la DDCPP","1",null),
("612","217","La collectivité  n\'a pas effectué de déclaration d\'activité alimentaire auprès des services de la DDCPP","2",null),
("613","218","L\'aménagement du ou des postes de travail est adapté (matériels et équipements de travail conformes), les principes d\'ergonomie (chariots adaptés, plans de travail à hauteur recommandée...) sont respectés.","1",null),
("614","218","L\'aménagement du ou des postes de travail est à revoir.","2",null),
("615","219","Les agents sont formés aux différents risques relatifs au travail en piscine.","1",null),
("616","219","Les agents ne sont pas formés aux différents risques relatifs au travail en piscine (manutentions, manipulation des produits chimiques, secourisme, nage...).","2",null),
("617","220","Il a été indiqué qu\'une organisation est mise en place afin d\'éviter qu\'un agent ne se trouve en situation de travailleur isolé lorsqu\'il effectue des travaux dangereux (nettoyage en bordure de bassin, manipulation de produits dangereux...)","1",null),
("618","220","Aucune organisation n\'est mise en place afin d\'éviter qu\'un agent ne se trouve en situation de travailleur isolé lorsqu\'il effectue des travaux dangereux (nettoyage en bordure de bassin, manipulation de produits dangereux...)","2",null),
("619","221","Le ou les agents de l\'atelier menuiserie ont suivi une formation spécifique liée à leur activité.","1",null),
("620","221","Le ou les agents de l\'atelier menuiserie n\'ont pas suivi de formation spécifique liée à leur activité.","2",null),
("621","222","Présence de système d\'aspiration des poussières de bois.","1",null),
("622","222","Absence de système d\'aspiration des poussières de bois.","2",null),
("623","223","Des mesures de VLEP ont été effectuées.","1",null),
("624","223","Aucune mesure de VLEP n\'a été effectuée.","2",null),
("625","224","L\'accessibilité des locaux de travail a été prise en compte pour le ou les agents travailleurs handicapés.","1",null),
("626","224","L\'accessibilité des locaux de travail n\'a pas été prise en compte pour le ou les agents travailleurs handicapés.","2",null),
("627","225","Les opérations d\'entretien et de vérification sont effectuées et formalisées.","1",null),
("628","225","Les opérations de vérification et d\'entretien ne sont pas toutes effectuées et formalisées","2",null),
("629","226","La vérification des aires de jeux est effectuée.","1",null),
("630","226","La vérification des aires de jeux n\'est pas effectuée.","2",null),
("631","227","AMIANTE:\nLes DTA ont été faits et les résultats ont été communiqués à la médecine préventive.","1",null),
("632","227","AMIANTE:\nLes DTA n\'ont pas été faits sur tous les bâtiments.","2",null),
("643","229","DIAGNOSTIC RADON:\nUn diagnostic radon a été réalisé dans les locaux","1",null),
("644","229","DIAGNOSTIC RADON:\nAucune mesures ","2",null),
("649","230","Il a été indiqué que le ou les arbres à cardan n\'ont pas fait l\'objet d\'une vérification périodique (annuelle)","2",null),
("651","53","Il a été indiqué que toutes les installations électriques n\'ont pas été vérifiées par un organisme agréé ou une personne qualifiée .","2",null),
("654","232","Des chaussures de sécurité anti-dérapantes à embout renforcé sont à disposition.","1",null),
("655","232","Absence de chaussure de sécurité à embout renforcé.","2",null),
("656","97","VESTIAIRES:\nAbsence de vestiaire.","2",null),
("658","93","Une zone de danger observée lors de l\'inspection est à signaler par des dispositifs visuels","2",null),
("659","106","LOCAUX:\nTous les locaux où interviennent les agents sont  pourvus d\'une trousse de premiers secours ","1",null),
("660","106","VÉHICULES:\nLes véhicules de service ne sont pas équipés de trousse de secours","2",null),
("661","106","CONTENU:\nLe contenu de certaines trousses de secours est à revoir (produits manquants ou périmés)","2",null),
("662","107","Un affichage des numéros d\'urgence est présent, il est cependant nécessaire de le compléter","2",null),
("663","108","ASTREINTE:\nUne procédure est également en place pour les interventions sous astreinte.","1",null),
("664","108","ASTREINTE:\nAucune procédure de gestion du travail isolé n\'a été mise en place pour les interventions sous astreinte","2",null),
("665","109","TÉLÉPHONE PORTABLE:\nIl a été indiqué que les agents amenés à se déplacer dans des zones isolées, ont à disposition des téléphones portables professionnels.","1",null),
("666","109","TÉLÉPHONE PORTABLE:\nIl a été indiqué que les agents amenés à se déplacer dans des zones isolées, n\'ont pas à leur disposition de téléphone portable professionnel.","2",null),
("667","121","Le ou les escaliers d\'une largeur au moins égale à 1,5 mètre sont munis d\'une main courante de chaque côté.","1",null),
("668","121","Aucun objet, marchandise ou matériel ne fait obstacle à la circulation des personnes dans le ou les escaliers.","1",null),
("669","121","Le ou les escaliers d\'une largeur au moins égale à 1,5 mètre ne sont pas munis d\'une main courante de chaque côté.","2",null),
("670","122","Le bâtiment n\'est pas équipé d\'un système d\'alarme sonore.","2",null),
("671","123","Absence de Bloc Autonome d\'Eclairage Sécurité (BAES). ","2",null),
("672","125","La fosse de visite est conforme aux recommandation R468 et R469.","1",null),
("673","129","MAIN COURANTE:\nLe ou les escaliers ne sont pas munis de rampe ou de main-courante.","2",null),
("674","129","MAINS COURANTES:\nLe ou les escaliers d’une largeur au moins égale à 1,5 mètre ne sont pas munis de main courante de chaque côté.","2",null),
("675","132","EPI:\nLes agents ne disposent pas de harnais et de longe contre les chutes de hauteur.","2",null),
("676","132","CONTRÔLE:\nIl a été indiqué que le ou les harnais n\'ont pas été vérifiés réglementairement au cours des 12 derniers mois.","2",null),
("677","132","CONTRÔLE:\nIl a été indiqué que les harnais ont été contrôlés au cours des 12 derniers mois.","1",null),
("678","133","ETAT GÉNÉRAL:\nLa structure de l\'échafaudage présente des non conformités (déformation,\nprésence de corrosion, absence d\'élément de fixation...)","2",null),
("681","233","ETAT:\nLe ou les escabeaux utilisés par les agents et vus lors de la visite, sont en mauvais état.","2",null),
("682","233","ETAT:\nLe ou les escabeaux utilisés par les agents et vus lors de la visite, sont en bon état.","1",null),
("683","233","UTILISATION ESCABEAU:\nIl a été indiqué que les escabeaux sont utilisés pour des interventions occasionnelles et de courte durée.","1",null),
("684","131","NOMBRE D\'AGENTS FORMES:\nIl a été indiqué qu’un seul agent dispose du CACES PEMP et d’une autorisation de conduite or la présence d’un surveillant formé est nécessaire.","2",null),
("685","164","Il a été indiqué que l\'Engin de Service Hivernal a fait l\'objet d\'une \"réception à titre isolé\" auprès des services de la DREAL.","1",null),
("686","150","Matériel modifié remettant en cause sa conformité CE.","2",null),
("687","139","Il n\'y a aucun mesure de vérification de la validité du permis de conduire des agents.","2",null),
("688","140","Les agents ont suivi la formation FIMO mais ne sont  pas à jour de leur recyclage (FCO).","2",null),
("689","168","EVALUATION DES RISQUES:\nL\'évaluation des risques n\'a pas pris en compte l\'ensemble des activités des agents impliquant une exposition à des agents chimiques.","2",null),
("690","174","Pas de dispositif de captage des polluants.","2",null),
("691","178","Il a été indiqué que les agents formés ne sont pas à jour de leur recyclage (recommandation tous les 3 ans)","2",null),
("692","181","EVALUATION RISQUE BRUIT:\nL\'évaluation des risques n\'a pas pris en compte l\'ensemble des activités exposées au risque bruit.","2",null),
("693","182","ETAT:\nLes équipements  de protection individuelle à disposition des agents sont usagés ou détériorés.","2",null),
("694","182","ETAT:\nLes équipements  de protection individuelle à disposition des agents sont en bon état.","1",null),
("695","182","PORT:\nLes agents disposent d\'équipements de protection individuelles contre les nuisances sonores, mais il a été indiqué qu\'ils ne les portent pas systématiquement","2",null),
("696","184","SUIVI MEDICAL:\nLes agents exposés aux bruits dépassant les valeurs limites d\'exposition sont suivi par le médecin de prévention (examen audiométrique)","1",null),
("697","185","MOYENS DE REDUCTION:\nDes mesures d\'exposition ont fait apparaître des niveaux supérieurs aux valeurs limites mais l\'employeur a mis en oeuvre un programme de mesures correctives visant à réduire l\'exposition.","1",null),
("698","185","SIGNALISATION:\nLes lieux de travail où des niveaux de bruit dépassant les valeurs limites ont été mesurés, sont signalés","1",null),
("699","185","MOYENS DE REDUCTION:\nDes mesures d\'exposition ont fait apparaître des niveaux supérieurs aux valeurs limites et aucune mesure corrective visant à réduire l\'exposition n\'a été mise en place","2",null),
("700","185","SIGNALISATION:\nIl n\'existe aucune signalisation des endroits où les agents sont susceptibles d\'être exposés à  un bruit dépassant les valeurs supérieures d\'exposition (cf art.R4434-3 du CdT)","2",null),
("701","234","Les agents ont à disposition les EPI adaptés aux risques liés à leur activité.","1",null),
("702","234","Les agents n\'ont pas à leur disposition les EPI adaptés aux risques liés à leur activité.","2",null);
INSERT INTO observation VALUES
("703","235","Une organisation est mise en place pour la prévention des risques de chute et de noyade.","1",null),
("704","235","Aucune organisation n\'est mise en place pour la prévention des risques de chute et de noyade.","2",null),
("705","236","Des prélèvements d\'air sont effectués et la valeur limite n\'est pas dépassée.","1",null),
("706","236","Aucun contrôle concernant les trichloramines n\'est effectué.","2",null),
("707","234","Les agents n\'ont pas à disposition l\'ensemble des EPI adaptés aux risques liés à leur activité.","2",null),
("708","235","Les moyens techniques et organisationnels mis en place sont insuffisants pour prévenir les risques de chute et de noyade.","2",null),
("709","220","L\' organisation mise en place afin d\'éviter qu\'un agent ne se trouve en situation de travailleur isolé lorsqu\'il effectue des travaux dangereux (nettoyage en bordure de bassin, manipulation de produits dangereux...), est insuffisante.","2",null),
("710","193","L’aménagement du bureau est conforme.","1",null),
("711","193","L’aménagement du bureau est à optimiser.","2",null),
("712","193","L’implantation et l’aménagement du ou des bureaux sont à optimiser.","2",null),
("713","194","L’éclairage est suffisant.","1",null),
("714","194","Les protections contre l’éblouissement sont présentes.","1",null),
("715","194","L’éclairage est insuffisant.","2",null),
("716","194","Les protections contre l’éblouissement sont absentes.","2",null),
("717","195","MATÉRIEL INFORMATIQUE:\nLe bureau est équipé de matériel informatique adapté.","1",null),
("718","195","MATÉRIEL INFORMATIQUE:\nLe bureau n’est pas équipé de matériel informatique adapté.","2",null),
("719","195","MOBILIER:\nLe bureau est équipé de mobilier adapté.","1",null),
("720","195","MOBILIER:\nLe bureau n’est pas équipé de mobilier adapté.","2",null),
("721","197","SURFACE:\nLa surface du bureau correspond à la norme.","1",null),
("722","197","LARGEUR DE PASSAGE:\nLes largeurs de passage correspondent à la norme.","1",null),
("723","197","SURFACE:\nLa surface du bureau est inférieure à la norme.","2",null),
("724","197","LARGEUR DE PASSAGE:\nLa ou les largeurs de passage sont inférieures à la norme.","2",null),
("725","237","Les voies de circulation sont dégagées.","1",null),
("726","237","Présence de câbles électriques dans la ou les voies de circulation.","2",null),
("727","237","Présence d’objets dans la ou les voies de circulation.","2",null),
("728","236","Absence de produit ou de procédé qui permette de réduire la teneur en chlore combiné dans les bassins.","2",null),
("729","201","Le ou les agents ne sont pas équipés des EPI nécessaires.","2",null),
("730","204","L’habilitation date de plus de 6 ans et n’a pas été renouvelée.","2",null),
("731","190","Les risques liés aux vibrations mécaniques n\'ont pas été évalués sur tous les équipements de travail.","2",null),
("732","191","MOYENS DE REDUCTION:\nDes mesures d\'exposition ont fait apparaître des niveaux supérieurs aux valeurs limites mais l\'employeur a mis en oeuvre un programme de mesures correctives visant à réduire l\'exposition.","1",null),
("734","191","MOYENS DE RÉDUCTION:\nDes mesures d\'exposition ont fait apparaître des niveaux supérieurs aux valeurs limites et toutes les mesures correctives visant à réduire l\'exposition n\'ont pas été mises en place.","2",null),
("735","229","DIAGNOSTIC RADON:\nDes mesures ont été réalisées et ne font pas apparaître de dépassement des valeurs limites réglementaires","1",null),
("736","229","DIAGNOSTIC RADON:\nDes mesures ont été réalisées et font apparaître des dépassements des valeurs limites réglementaires","2",null),
("737","229","SUIVI MEDICAL:\nLes agents exposées aux rayonnements RADON  ne sont pas suivis par le médecin de prévention","2",null),
("738","229","SUIVI MEDICAL:\nLes agents exposés aux rayonnements RADON sont identifiés et suivi  par le médecin de prévention","1",null),
("739","229","PREVENTION:\nDes mesures de prévention (organisationnelles et techniques) sont mises en place","1",null),
("740","229","PREVENTION:\nAucune mesure prévue par la réglementation n\'a été mise en place","2",null),
("741","97","ARMOIRES:\nLes vestiaires sont équipés d’armoires individuelles (à double compartiment pour les travaux salissants).","1",null),
("742","105","Aération par ventilation insuffisante.","2",null),
("743","120","NOMBRE:\nLe nombre de dégagement est insuffisant.","2",null),
("744","121","Des objets dans l\'escalier, font obstacle à la circulation des personnes.","2",null),
("745","129","MAINS COURANTES:\nLe ou les escaliers d’une largeur au moins égale à 1,5 mètre sont munis de main courante de chaque côté.","1",null),
("746","134","ACCÈS:\nL\'échelle d\'accès n\'est pas fixée et/ou ne dépasse pas d\'au moins 1m le plan d\'accès.","2",null),
("747","233","UTILISATION ESCABEAU:\nIl a été indiqué que le ou les escabeaux sont utilisés comme poste de travail.","2",null),
("748","136","Les dispositifs d\'aide à la manutention sont insuffisants ou inadaptés.","2",null),
("749","232","Absence de gant de manutention manuelle.","2",null),
("757","239","TRACTOPELLE:\nLes agents qui utilisent la chargeuse-pelleteuse possèdent le CACES 4","1",null),
("758","239","TRACTOPELLE:\nLes agents qui utilisent la chargeuse/pelleteuse n’ont pas suivi de formation à son utilisation en sécurité de type CACES.","2",null),
("759","239","TRACTEUR>50CV:\nLes agents qui utilisent un tracteur agricole supérieur à 50 chevaux possèdent le CACES 8.","1",null),
("760","239","TRACTEUR>50CV:\nLes agents qui utilisent le tracteur agricole n’ont pas suivi de formation à son utilisation en sécurité de type CACES.","2",null),
("761","239","TRACTEUR<50CV/MINIPELLE:\nLes agents qui utilisent des engins de la catégorie 1 (tracteur agricole de puissance inférieure à 50 chevaux , minipelle, minichargeuse), possèdent le CACES correspondant.","1",null),
("762","239","PEMP:\nLes agents qui utilisent une PEMP (plate forme élévatrice mobile de personnel) possèdent le CACES 1B ou 3B.","1",null),
("763","239","TRACTEUR<50CV/MINIPELLE:\nLes agents qui utilisent des engins de la catégorie 1 (tracteur agricole de puissance inférieure à 50 chevaux , minipelle, minichargeuse), n\'ont pas suivi de formation à leur utilisation en sécurité de type CACES.","2",null),
("764","239","PEMP:\nLes agents qui utilisent une PEMP (plate forme élévatrice mobile de personnel) n\'ont pas suivi de formation à son utilisation en sécurité de type CACES.","2",null),
("765","157","TRACTEUR:\nLe tracteur est équipé d\'un gyrophare visible tout azimut.","1",null),
("766","157","TRACTEUR:\nLe tracteur n\'est pas équipé d\'un gyrophare.","2",null),
("767","157","TRACTOPELLE:\nLe tractopelle est équipé d\'un gyrophare visible tout azimut.","1",null),
("768","157","TRACTOPELLE:\nLe tractopelle n\'est pas équipé d\'un gyrophare.","2",null),
("769","157","SIGNALISATION COMPLÉMENTAIRE:\nLes engins de chantier considérés comme des véhicules à progression lente sont équipés de bandes rouges et blanches rétro réfléchissantes.","1",null),
("770","157","SIGNALISATION COMPLÉMENTAIRE:\nLes engins de chantier considérés comme des véhicules à progression lente ne sont pas tous équipés de bandes rouges et blanches rétro réfléchissantes.","2",null),
("775","240","Les organes de coupure d\'énergie (vannes \"police\") sont signalés et accessibles.","1",null),
("776","240","Les organes de coupure d\'énergie (vannes \"police\") ne sont pas accessibles.","2",null),
("778","176","COMPATIBILITÉ:\nLes règles se stockage en fonction des incompatibilités ne sont pas respectée.","2",null),
("779","176","COMPATIBILITÉ:\nLes produits stockés incompatibles sont stockés sur des rétentions séparées.","1",null),
("780","240","Les organes de coupure d\'énergie (vannes \"police\") ne sont pas signalés.","2",null),
("781","161","La ou les tondeuses autoportées ont un éclairage défaillant. (Gyrophare et/ou éclairage de position et/ou de changement de direction)","2",null),
("782","241","Le ou les agents ont été formés à l\'utilisation des artifices.","1",null),
("783","241","Le ou les agents n\'ont pas été formés à l\'utilisation des artifices.","2",null),
("784","242","Le ou les agents ont été habilités par l\'Autorité Territoriale.","1",null),
("785","242","Le ou les agents n\'ont pas été habilités par l\'Autorité Territoriale.","2",null),
("786","243","Le stockage est conforme à la réglementation.","1",null),
("787","243","Le stockage n\'est pas conforme à la réglementation.","2",null),
("788","169","Il a été indiqué que le ou les agents n’ont pas suivi de formation à l’utilisation et à la manipulation des produits dangereux.","2",null),
("789","170","PRÉSENCE:\nLes Fiches de données de sécurité des produits utilisés et stockés ne sont pas présentes sur les lieux de stockage et ne peuvent être consultées par les agents.","2",null),
("790","142","PORT OBLIGATOIRE:\nIl a été observé que les agents ne portent pas la partie haute du vêtement de signalisation, ce qui ne correspond pas à la classe 2 (le haut et le bas étant indissociable).","2",null),
("791","142","ETAT:\nIl a été observé que les vêtements sont, pour certains, dans un état de propreté et/ou d\'usure insuffisant pour les maintenir efficaces.","2",null),
("792","179","VÉRIFICATION:\nAbsence de vérification de la conformité de l\'installation électrique.","2",null),
("793","179","SUIVI:\nLa ou les installations ne sont pas conformes (vérification périodique avec des observations non levées)","2",null),
("794","182","PORT:\nLes agents disposent d\'équipements de protection individuelles contre les nuisances sonores et les portent.","1",null),
("796","4","FORMATION OBLIGATOIRE:\nIl a été indiqué que les agents désignés Assistant de Prévention n\'ont pas tous suivi la formation obligatoire.","2",null),
("797","4","FORMATION CONTINUE:\nIl a été indiqué que le ou les agents ont suivi la formation initiale mais ne sont pas à jour de sa formation continue d\'Assistant de Prévention.","2",null),
("798","9","FORMATION CONTINUE:\nIl a été indiqué que l\'agent a suivi la formation initiale mais n\'est pas à jour de sa formation continue.","2",null),
("799","36","Il a été indiqué que le registre Santé et Sécurité au Travail n\'a  pas été ouvert dans tous les services.","2",null),
("800","44","Il a été indiqué qu\'il n\'y a pas d\'agents formés et habilités en nombre suffisant pour intervenir sur les installations électriques ou à proximité.","2",null),
("801","48","Il a été indiqué qu\'il n\'y a pas de vérifications périodiques de l\'ensemble des installations d\'aération et de ventilation.","2",null),
("802","50","Il a été indiqué que certains appareils ou accessoires de levage ne sont pas contrôlés périodiquement.","2",null),
("803","230","Le ou les arbres à cardan ont fait l\'objet d\'une vérification périodique (annuelle)","1",null),
("804","230","Il a été indiqué que les arbres à cardan n\'ont pas tous fait l\'objet d\'une vérification périodique (annuelle)","2",null),
("805","58","PTAC<3,5T:\nLes contrôles techniques des véhicules (légers et/ou utilitaires) ne sont pas effectués.","2",null),
("806","58","PTAC>3,5T:\nLes contrôles techniques du ou des véhicules lourds ne sont pas effectués.","2",null),
("807","58","PTAC>3,5T:\nLes contrôles techniques du ou des véhicules lourds sont effectués semestriellement.","1",null),
("808","244","Le ou les véhicules en circulation sont équipés d’un triangle de présignalisation et d’un gilet rétroréfléchissant rangés dans l’habitacle et aux normes CE.","1",null),
("809","244","Le ou les véhicules en circulation ne sont pas équipés d’un triangle de présignalisation et d’un gilet rétroréfléchissant.","2",null),
("810","244","Les véhicules en circulation ne sont pas tous équipés d’un triangle de présignalisation et d’un gilet rétroréfléchissant.","2",null),
("811","53","SUIVI:\nIl a été indiqué que la vérification périodique des installations électriques était effectuée mais sans formalisation de la levée des non conformités relevées dans le rapport.","2",null),
("812","52","Il a été indiqué que tous les équipements de travail en hauteur ne sont pas vérifiés. (Voir la liste dans les préconisations)","2",null),
("813","52","SUIVI:\nIl a été indiqué que les équipements pour le travail en hauteur sont vérifiés mais ces informations ne sont pas formalisées sur un registre de sécurité.","2",null),
("814","62","Il a été indiqué que les formations initiales à la sécurité n\'était pas systématiquement effectuées.","2",null),
("815","63","Il a été indiqué qu\'aucun plan de formation n\'a été mis en place.","2",null),
("816","63","Un plan de formation a été mis en place.","1",null);
INSERT INTO observation VALUES
("818","64","Il a été indiqué que tous les agents n\'ont pas suivi de formation à l\'utilisation des extincteurs.","2",null),
("819","65","RECYCLAGE:\nIl a été indiqué que les agents formés SST (sauveteur secouriste du travail) ne sont pas tous à jour de leur recyclage obligatoire.","2",null),
("820","67","MINIPELLE/TRACTEUR<50CV:\nIl a été indiqué que pour la conduite en sécurité du ou des minipelles/tracteurs <50cv, le ou les agents n\'ont pas suivi de formation.","2",null),
("821","67","TRACTOPELLE:\nIl a été indiqué que pour la conduite en sécurité du ou des tractopelles, le ou les agents n\'ont pas suivi de formation.","2",null),
("822","67","PEMP:\nIl a été indiqué que pour la conduite en sécurité de la nacelle élévatrice, le ou les agents n\'ont pas suivi de formation.","2",null),
("823","67","TONDEUSE AUTOPORTEE:\nIl a été indiqué que pour la conduite en sécurité des tondeuses autoportées, le ou les agents n\'ont pas suivi de formation.","2",null),
("824","67","RECYCLAGE:\nIl a été indiqué que tous les agents ne sont pas à jour de leur recyclage CACES.","2",null),
("825","75","Il a été indiqué qu\'il n\'y a pas de procédure en place pour les interventions sous astreinte.","2",null),
("826","80","Le suivi et l\'entretien sont assurés par un prestataire. ","1",null),
("827","92","L\'autorité territoriale ne délivre pas de Permis de feu pour les travaux par \"point chaud\".","2",null),
("828","92","L\'autorité territoriale délivre un Permis de feu pour tous les travaux par \"point chaud\".","1",null),
("830","97","LAVABOS:\nAbsence de lavabo.","2",null),
("831","97","LAVABOS:\nLes lavabos ne sont pas munis de dispositif de nettoyage, d’essuyage et de séchage approprié.","2",null),
("832","97","ARMOIRES:\nLes vestiaires ne possèdent pas d’armoires individuelles.","2",null),
("833","206","Le ou les plans de travail situés en hauteur ne disposent pas de garde-corps réglementaires.","2",null),
("834","223","Des mesures de VLEP ont été effectuées et sont supérieures à la réglementation.","2",null),
("835","227","RADON:\nLa recherche de radon a été faite sur le ou les établissements scolaires","1",null),
("836","227","RADON:\nLa recherche de radon n\'a pas été faite sur le ou les établissements scolaires.","2",null),
("837","227","LÉGIONELLOSE:","2",null),
("838","227","LÉGIONELLOSE:","1",null),
("840","212","Il a été indiqué que les agents qui utilisent des produits phyto-sanitaires n\'ont pas tous suivi la formation Certi-Phyto. ","2",null),
("841","216","Il a été indiqué que les agents intervenants sur la fabrication ou la manutention des repas n\'ont pas tous suivi de formation  à l\'hygiène alimentaire (HACCP)","2",null),
("842","245","Les agents ont à leur disposition les EPI adaptés (gants anti-chaleur, gants anti-coupures, vêtements et chaussures de sécurité)","1",null),
("843","245","Absence de gant de protection contre la coupure.","2",null),
("844","96","AFFICHAGE:\nL’affichage réglementaire est présent.","1",null),
("845","118","MISE A JOUR:\nLes plans d\'évacuation sont incomplets.","2",null),
("846","78","Il a été indiqué que les agents ne sont pas tous dotés des équipements de travail et de protection individuelle nécessaire.","2",null),
("847","81","SENSIBILISATION:\nIl a été indiqué qu\'une information a été faite au personnel sur la nécessité du port des EPI.","1",null),
("848","81","SENSIBILISATION:\nAbsence d\'information sur la nécessité du port des EPI.","2",null),
("849","71","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("850","1","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("851","2","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("852","3","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("853","4","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("854","31","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("855","5","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("856","6","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("857","7","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("858","8","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("859","9","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("860","10","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("861","11","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("862","12","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("863","13","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("864","14","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("865","15","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("866","16","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("867","17","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("868","18","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("869","19","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("870","20","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("871","21","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("872","22","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("873","23","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("874","24","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("875","25","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("876","26","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("877","27","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("878","28","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("879","29","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("880","30","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("881","32","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("882","33","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("883","34","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("884","35","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("885","36","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("886","37","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("887","38","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("888","39","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("889","40","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("890","41","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("891","42","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("892","43","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("893","44","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("894","45","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("895","46","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("896","47","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("897","48","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("898","49","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("899","50","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("900","51","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("901","52","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("902","53","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("903","54","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("904","55","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("905","56","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("906","57","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("907","58","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("908","59","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("909","60","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("910","61","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("911","230","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("912","62","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("913","63","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("914","64","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("916","66","Il a été indiqué que les agents n\'ont pas tous suivi de formation sur les risques spécifiques sur leur poste de travail (voir liste dans la partie réglementaire).","2",null),
("917","67","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("918","68","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("919","69","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("920","70","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null);
INSERT INTO observation VALUES
("921","72","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("922","73","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("923","74","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("924","75","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("925","76","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("926","77","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("927","78","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("928","79","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("929","80","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("930","81","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("931","82","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("932","83","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("933","84","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("934","85","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("935","86","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("936","87","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("937","88","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("938","89","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("939","90","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("940","91","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("941","92","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("944","247","EVALUATION DES RISQUES:\nLe risque d\'effondrement et de chute d\'objet a fait l\'objet d\'une évaluation des risques dans le document unique.","1",null),
("945","247","EVALUATION DES RISQUES:\nLe risque d\'effondrement et de chute d\'objet  n\'a pas fait l\'objet d\'une évaluation des risques dans le document unique.","2",null),
("946","248","ECHELLE FIXE>3M:\nL\'échelle fixe supérieur à 3m est équipée d\'une crinoline.","1",null),
("947","248","ECHELLE FIXE>3M:\nL\'échelle fixe supérieur à 3m n\'est pas équipée d\'une crinoline.","2",null),
("948","248","ECHELLE D’ACCÈS:\nL\'échelle d\'accès dépasse d\'au moins un mètre le niveau d\'accès.","1",null),
("949","248","ECHELLE D’ACCÈS:\nL\'échelle d\'accès ne dépasse d\'au moins un mètre le niveau d\'accès.","2",null),
("950","66","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("951","134","PORT DE CHARGES:\nDes charges sont transportées par l\'intermédiaire d\'une échelle d\'accès.","2",null),
("952","134","ACCÈS:\nL\'échelle d\'accès est fixée et dépasse d\'au moins 1m le plan d\'accès.","1",null),
("953","249","PNEUMATIQUES:\nLes pneumatiques du véhicule sont en bon état.\n","1",null),
("954","249","PNEUMATIQUES:\nLes pneumatiques du véhicule ont une dégradation excessive.","2",null),
("955","245","Absence de gant de protection contre la brûlure.","2",null),
("956","245","Absence de chaussures de sécurité fermées à embout renforcé.","2",null),
("957","250","Présence d\'une couverture anti-feu facilement accessible.","1",null),
("958","250","PRÉSENCE:\nAbsence de couverture anti-feu.","2",null),
("959","250","POSITIONNEMENT:\nLa couverture anti-feu n\'est pas positionnée de façon à la rendre facilement accessible.","2",null),
("960","251","MISE A DISPOSITION:\nDes équipements de protection individuelles contre les risques de chute d\'objet et d\'effondrement sont à disposition des agents.","1",null),
("961","251","MISE A DISPOSITION:\nIl n\'y a pas d\'équipement de protection individuelle contre les risques de chute d\'objet et d\'effondrement à disposition des agents.","2",null),
("962","247","EVALUATION DES RISQUES:\nL\'évaluation des risques d\'effondrement et de chute d\'objet n\'a pas pris en compte l\'ensemble des activités et situations des agents impliquant une exposition à ces risques.","2",null),
("963","251","ETAT:\nLes équipements  de protection individuelle à disposition des agents (casque, chaussures...) sont en bon état.","1",null),
("964","251","PORT:\nLes agents disposent d\'équipements de protection individuelles contre les risques de chute d\'objet et d\'effondrement et les portent.","1",null),
("965","251","ETAT:\nLes équipements  de protection individuelle à disposition des agents sont usagés ou détériorés.","2",null),
("966","251","PORT:\nLes agents disposent d\'équipements de protection individuelles contre les risques de chute d\'objet et d\'effondrement, mais il a été indiqué qu\'ils ne les portent pas systématiquement","2",null),
("967","249","ECLAIRAGE:\nL\'éclairage du véhicule est en état de fonctionnement.","1",null),
("968","249","ECLAIRAGE:\nL\'éclairage du véhicule est défaillant.","2",null),
("969","65","A CONTRÔLER:\nAbsence de document ou d\'information permettant d\'apprécier la conformité du critère.","2",null),
("970","80","Le nettoyage et le suivi sont assurés par l\'employeur.","1",null),
("1006","170","PRÉSENCE:\nLes Fiches de données de sécurité des produits utilisés et stockés sont présentes sur les lieux de stockage et peuvent être consultées par les agents.","1",null),
("1012","253","Il a été constaté la présence de boissons alcoolisées non réglementaires et accessibles aux agents ","2",null),
("1013","254","Il existe un règlement intérieur qui définit l\'ensemble des postes à risque et qui contient un protocole d\'action (procédure de gestion immédiate de ces situations)","1",null),
("1015","253","Il a été indiqué qu\'aucune boisson alcoolisée autre que le vin, la bière, le cidre et le poiré n\'est présente","1",null),
("1016","253","Il existe un règlement intérieur où sont intégrées les  obligations et interdictions en matière d\'alcool","1",null),
("1017","254","Il existe une procédure à mettre en oeuvre sans règlement intérieur pour les cas d\'agent en état d\'ébriété.","1",null),
("1018","254","Il n\'existe pas de règlement intérieur  ni de note de service qui définit l\'ensemble des postes à risque et qui contient un protocole d\'action (procédure de gestion immédiate de ces situations)","2",null),
("1023","94","ENCOMBREMENT: \nLes locaux de travail sont exempts de tout encombrement.","1",null),
("1024","1","L’Autorité Territoriale a désigné au moins un agent sur la mission d’Assistant de Prévention.","1",null);




CREATE TABLE `parametres_diffusion_rapport` (
  `LIBELLE_PERSONNE` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO parametres_diffusion_rapport VALUES
("Autorité territoriale de la structure"),
("Président du CDG87");




CREATE TABLE `participant` (
  `NUM_PARTICIPANT` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_STRUCTURE` smallint(6) NOT NULL,
  `NOM_PARTICIPANT` varchar(32) DEFAULT NULL,
  `PRENOM_PARTICIPANT` varchar(32) DEFAULT NULL,
  `CODE_CIVILITE_PARTICIPANT` smallint(6) DEFAULT NULL,
  `NOM_FONCTION_PARTICIPANT` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`NUM_PARTICIPANT`),
  KEY `I_FK_PARTICIPANT_STRUCURE` (`NUM_STRUCTURE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `participer` (
  `NUM_PARTICIPANT` smallint(6) NOT NULL,
  `NUM_AUDIT` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_PARTICIPANT`,`NUM_AUDIT`),
  KEY `I_FK_PARTICIPER_PARTICIPANT` (`NUM_PARTICIPANT`),
  KEY `I_FK_PARTICIPER_AUDIT` (`NUM_AUDIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `posseder` (
  `NUM_AUDIT` int(11) NOT NULL,
  `NUM_POLE_C` int(11) NOT NULL,
  `NUM_BATIMENT_C` int(11) NOT NULL,
  `NUM_GROUPE_LIEU_C` int(11) NOT NULL,
  `NUM_LIEU` int(11) NOT NULL,
  `NUM_THEME_C` int(11) NOT NULL,
  `NUM_CRITERE_C` int(11) NOT NULL,
  `NUM_OBSERVATION` int(11) NOT NULL,
  PRIMARY KEY (`NUM_AUDIT`,`NUM_POLE_C`,`NUM_BATIMENT_C`,`NUM_GROUPE_LIEU_C`,`NUM_LIEU`,`NUM_THEME_C`,`NUM_CRITERE_C`,`NUM_OBSERVATION`),
  KEY `NUM_AUDIT` (`NUM_AUDIT`),
  KEY `NUM_POLE` (`NUM_POLE_C`),
  KEY `NUM_LIEU` (`NUM_LIEU`),
  KEY `NUM_OBSERVATION` (`NUM_OBSERVATION`),
  KEY `NUM_OBSERVATION_2` (`NUM_OBSERVATION`),
  KEY `NUM_BATIMENT` (`NUM_BATIMENT_C`),
  KEY `NUM_GROUPE_LIEU` (`NUM_GROUPE_LIEU_C`),
  KEY `NUM_THEME` (`NUM_THEME_C`),
  KEY `NUM_CRITERE` (`NUM_CRITERE_C`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO posseder VALUES
("7","1","1","1","1","8","93","265"),
("7","1","1","1","1","8","93","267");




CREATE TABLE `preconisation` (
  `NUM_PRECONISATION` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_CRITERE` smallint(6) NOT NULL,
  `LIBELLE_PRECONISATION` varchar(1000) NOT NULL,
  `code_Preco` int(1) DEFAULT NULL,
  PRIMARY KEY (`NUM_PRECONISATION`),
  KEY `NUM_CRITERE` (`NUM_CRITERE`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=latin1;


INSERT INTO preconisation VALUES
("1","1","DESIGNATION:\nDésigner au moins un Assistant de prévention parmi les agents.\nL’assistant de prévention est désigné par l’autorité territoriale sous l’autorité de laquelle il exerce sa mission. Les assistants de prévention constituent le niveau de proximité du réseau des agents de prévention.\nLeur mission est d’assister l’autorité territoriale auprès de laquelle ils sont placés dans la mise en place d’une politique de prévention.",null),
("2","2","Une délibération informant de la nomination d’un assistant doit être prise.\nVous trouverez sur le site du Centre Départemental de Gestion un modèle d’arrêté de nomination :\nhttp://www.cdg87.fr/IMG/pdf/info_cap-ctp/modele_arrete_designation_assistant_prevention.pdf",null),
("3","3","La mission de l\'Assistant de Prévention ainsi que les moyens qui lui sont accordés sont définis dans une « lettre de cadrage », signée de l\'autorité territoriale en cours de mandat.\nVous trouverez sur le site du Centre Départemental de Gestion un modèle de lettre de cadrage:\nhttp://www.cdg87.fr/IMG/pdf/info_cap-ctp/lettre_cadrage_type_ap.pdf. Cette lettre de cadrage accompagnée de l’arrêté de désignation devra être transmise au CT/CHSCT pour information",null),
("4","4","FORMATION OBLIGATOIRE:\nInitier la formation obligatoire préalable à la prise de fonction du ou des Assistants de Prévention.\nCette formation continue est obligatoire pour permettre à l\'assistant ou au conseiller de prévention de continuer à exercer sa mission. Elle a notamment pour but de parfaire ses compétences et d\'actualiser ses connaissances en matière d\'hygiène et de sécurité.",null),
("5","5","Pour mener à bien ses missions, l’assistant de prévention doit pouvoir bénéficier de temps et avoir accès à un poste informatique, à des outils d’information et éventuellement à un moyen de transport afin d’exercer ses missions. \nL’assistant de prévention devra mettre en forme ses observations, rédiger des rapports, contribuer à la mise en place de projets de prévention, de formation et de sensibilisation. Il devra également connaître les principes de prévention, les risques professionnels, les métiers exercés dans sa collectivité, le fonctionnement de celle-ci et les différents acteurs de la prévention.",null),
("6","6","Désigner un agent sur la mission de Conseiller de Prévention.\nLe conseiller de prévention est désigné par l’autorité territoriale sous l’autorité de laquelle il exerce sa fonction. Les conseillers de prévention assurent une mission de coordination.\nLeur mission est de conseiller l’autorité territoriale auprès de laquelle ils sont placés dans la mise en place d’une politique de prévention.\nCette fonction répond à la nécessité de structurer la prévention, lorsque l\'importance des risques professionnels ou des effectifs le justifient.\nSes qualifications et connaissances en font le référent naturel des Assistants de prévention, qu\'il a vocation à diriger comme chef de service de prévention.\nSes autres missions et conditions de nominations sont identiques à celles de l\'Assistant de prévention.",null),
("7","7","Pour officialiser la nomination, un arrêté doit être pris :\nVous trouverez sur le site du Centre Départemental de Gestion un modèle d’arrêté de nomination :\nhttp://www.cdg87.fr/IMG/pdf/info_cap-ctp/modele_arrete_designation_assistant_prevention.pdf",null),
("8","8","Les mission du Conseiller de Prévention ainsi que les moyens qui lui sont accordés sont définis dans une « lettre de cadrage », signée de l\'autorité territoriale en cours de mandat.\nVous trouverez sur le site du Centre Départemental de Gestion un modèle de lettre de cadrage:\nhttp://www.cdg87.fr/IMG/pdf/info_cap-ctp/lettre_cadrage_type_ap.pdf. Cette lettre de cadrage accompagnée de l’arrêté de désignation devra être transmise au CT/CHSCT pour information",null),
("9","9","FORMATION OBLIGATOIRE:\nInitier la formation de l\'agent désigné en tant que Conseiller de Prévention.\nUne formation préalable à la prise de fonction d\'une durée de sept jours pour les Conseiller de Prévention est obligatoire. Une formation continue de deux jours est obligatoire l\'année suivant leur prise de fonction et au minimum à un module de formation les années suivantes.",null),
("10","10","La reconnaissance de la place du conseiller de prévention est un gage de réussite. Il est vivement conseillé aux collectivités et établissements de veiller au respect des règles suivantes :\n- Donner le temps nécessaire pour l’exercice de cette mission\n- Associer le conseiller de prévention à l’élaboration le document unique ainsi qu’au suivi du plan d’action\n- Lui communiquer l’ensemble des documents et rapports en lien avec la sécurité au travail (rapport d’activité établi par le médecin de prévention , rapport de l\'ACFI...)\n- L\'associer à toutes les démarches qui pourraient être menées au sein de la collectivité ou de l’établissement (analyse des accidents de travail, élaboration de règlements intérieurs…)\nL’autorité territoriale doit s’efforcer de préserver au maximum son autonomie et lui permettre d’effectuer leur mission en toute indépendance. \n",null),
("11","11","S’assurer que tous les agents sont à jour de leur visite médicale et planifier avec le service de médecine préventive du CDG les visites des agents non à jour.\nLa surveillance médicale des agents par le médecin du travail est effectuée réglementairement dans le cadre de :\n• la visite d’embauche,\n• la visite médicale périodique,\n• la visite de surveillance particulière (femmes enceintes, travailleurs reconnus handicapés, agents réintégrés après un congé longue durée ou de longue maladie, agents souffrant de pathologies particulières demandant un suivi par le médecin du travail, agents soumis à des risques spéciaux…),\n• la visite de reprise (une absence pour maladie professionnelle, un congé maternité, une absence d’au moins 8 jours pour accident du travail, une absence de plus de 3 semaines pour maladie ou accident non professionnels, en cas d’absences répétées pour raison de santé).",null),
("12","12","Consulter le médecin de prévention sur les projets de construction ou d\'aménagements importants ou bien de modifications apportées aux équipements et ceux liés aux nouvelles technologies. \nLa spécificité du médecin oriente son action plus particulièrement vers la promotion de la santé et de la qualité de vie au travail.\nPrévoir la mise en place d’une procédure de consultation.",null),
("13","13","Le médecin de prévention doit être destinataire des Fiches de Données de Sécurité (FDS) des produits dangereux.\nIl peut demander que soient effectués des mesures d’ambiance ou des prélèvements (bruit, lumière, poussières de bois, chloramines, etc.), \nSur la base des FDS (fiches de données de sécurité) et avec la collaboration de la médecine préventive, l\'objectif sera de choisir les produits les moins dangereux (éviter ainsi au maximum les produits étiquetés cancérogènes, mutagènes ou toxiques pour la reproduction et ceux étiquetés R 40 : « risque d’effets irréversibles »)",null),
("14","14","Informer le médecin de prévention dans les plus brefs délais de chaque accident de service et de chaque maladie professionnelle ou à caractère professionnel.\nVous pouvez trouver un modèle de déclaration d’accident sur le site du Centre Départemental de Gestion.\nhttp://www.cdg87.fr/IMG/pdf/hygiene_securite/declaration_accident.pdf",null),
("15","15","Mettre en place une procédure d’information du médecin de prévention.\nLe médecin est également habilité à proposer des aménagements de poste ou de conditions d’exercice des fonctions, justifiés par l’âge, la résistance physique ou l’état de santé de l’agent.\nLe médecin du service de médecine préventive définit la fréquence et la nature des visites médicales que comporte cette surveillance médicale. ",null),
("17","16","Les collectivités qui ne disposent pas de service médecine préventive et qui ont conventionné avec celui du CDG87, peuvent s’adresser au CDG et faire la demande d’une copie du rapport annuel d’activités réalisé par le service SST du CDG sur leur périmètre.",null),
("18","17","Dès qu’une collectivité ou un établissement public franchit le seuil de 50 agents, il a l’obligation de créer un CHSCT.\nL\'effectif des personnels retenu pour déterminer le franchissement du seuil de 50 agents est apprécié au 1er janvier de chaque année.\nIl comprend :\n- les fonctionnaires titulaires en position d\'activité ou de congé parental ou accueillis en détachement ou mis à disposition de la collectivité ou de l\'établissement,\n- les fonctionnaires stagiaires en position d\'activité ou de congé parental,\n- les agents contractuels de droit public ou de droit privé bénéficiant d\'un contrat à durée indéterminée ou d\'un contrat d\'une durée minimale de six mois ou d\'un contrat reconduit successivement depuis au moins six mois qui exercent leurs fonctions ou sont placés en\ncongé rémunéré ou en congé parental.\n",null),
("20","18","S’assurer qu’à la suite des dernières élections professionnelles, les membres de l’instance CHSCT vont suivre la formation réglementaire.\nLa formation dispensée aura pour objectif d\'initier les intéressés aux méthodes et procédés à mettre en œuvre pour prévenir les risques professionnels et améliorer les conditions de travail. Cette formation aura plus directement pour objet de développer l\'aptitude à déceler et à mesurer les risques professionnels et la capacité à analyser les conditions de travail.\nLa formation, établie selon un programme théorique et pratique, tiendra compte des caractéristiques de la collectivité et de l’établissement concerné en matière, notamment :\n• de politique de prévention des risques ;\n• de risques professionnels particuliers. ",null),
("22","19","Établir un programme annuel de prévention. \nLes étapes de la réalisation du programme annuel de prévention peuvent se résumer en 4 phases essentielles :\nPhase 1 : Consultation du C.H.S.CT (ou a défaut du CT) sur les propositions établies (en lien avec le document unique, les compte rendus de réunions, le rapport d\'inspection, les analyses d\'accidents...)\nPhase 2 : Mise en œuvre du programme annuel de prévention par les services chargés de mener les actions correctives.\nPhase 3 : Consultation du C.H.S.CT (ou a défaut du CT) pour l\'examen du programme réalisé.\nPhase 4 : Contrôle et éventuellement correction voir prolongation du programme.",null),
("23","20","Mettre en place l’organisation d’une délégation d’enquête en partenariat avec le CHSCT à la suite de chaque accident selon les critères de gravité et de répétitivité préétablis (art. 41 du décret 85-603 du 10 juin 1985) ;\nChaque enquête est conduite par une délégation comprenant un représentant de la collectivité ou de l’établissement et un représentant du personnel. Elle peut être assistée d’un médecin du service de médecine préventive, de l’ACFI et de l’assistant ou du conseiller de prévention.",null),
("24","21","Le CHSCT doit obligatoirement être consulté dans les domaines suivants :\n- sur les projets d\'aménagement importants modifiant les conditions de santé et de sécurité ou les conditions de travail et, notamment, avant toute transformation importante des postes de travail découlant de la modification de l\'outillage, d\'un changement de produit ou de l\'organisation du travail ;\n- sur les projets importants d\'introduction de nouvelles technologies et lors de l\'introduction de ces nouvelle technologies, lorsqu\'elles sont susceptibles d\'avoir des conséquences sur la santé et la sécurité des agents ;\n- sur les mesures générales destinées à permettre le reclassement des agents reconnus inaptes à l\'exercice de leurs fonctions ;\n- sur la teneur de tous documents se rattachant à sa mission, et notamment des règlements et des consignes que l\'autorité territoriale envisage d\'adopter en matière d\'hygiène, de sécurité et de conditions de travail. \n",null),
("25","22","Réunir le comité au moins 3 fois par an sans dépasser 9 mois entre deux réunions.\nEn outre, il est réuni par son Président à la suite de tout accident mettant en cause l’hygiène ou la sécurité ou ayant pu entraîner des conséquences graves.\n",null),
("26","23","Établir un règlement intérieur .\nL\'objet du règlement intérieur est de préciser le fonctionnement du CHSCT pour l\'application des missions et attributions légales et réglementaires. Il s\'agit d\'organiser ce qui n\'est pas précisé par les textes, de formaliser les usages et de permettre le fonctionnement de l\'institution au-delà des individus.\nDès l\'instant où il est adopté, le règlement intérieur s\'impose aux intervenants en CHSCT (membres, experts, personnes qualifiées,…). ",null),
("27","24","Établir après chaque réunion un procès-verbal comprenant le compte rendu des débats et le détail des votes.",null),
("28","25","Informer le comité des visites et des observations faites par l’ACFI.",null),
("29","26","Désigner un ACFI ou passer convention avec le Centre de Gestion.",null),
("30","27","Rédiger une convention et une lettre de mission.",null),
("31","28","Consulter l’ACFI sur la teneur de tous documents se rattachant à sa mission, et notamment des règlements et des consignes que l’autorité territoriale envisage d’adopter en matière d’hygiène, de sécurité et de conditions de travail.",null),
("32","29","Faire contrôler les conditions d’application des règles d’hygiène et de sécurité par l’ACFI afin qu’il propose à l’autorité territoriale compétente toute mesure qui leur paraît de nature à améliorer l’hygiène et la sécurité du travail et la prévention des risques professionnels.",null),
("33","30","Informer l’ACFI des suites données à ses propositions.",null),
("34","31","Initier une démarche d\'évaluation des risques professionnels et la rédaction du document unique.\nLe Document Unique (D.U.) est un outil qui permet de recenser et d’agir sur l’ensemble des risques professionnels. Il met l’accent sur les risques susceptibles d’être rencontrés par les agents dans leur milieu de travail au sein même de leur activité. C’est le point d’entrée de la sécurité dans la structure.\nQue ce soit dans la réflexion du projet, la présentation de celui-ci aux agents ou dans sa réalisation, les préventeurs du CDG87 se tiennent à votre disposition pour vous apporter une aide dans la mise en place de cette démarche de prévention et mettre gracieusement, à votre disposition, un outil informatique permettant de le réaliser.",null),
("35","32","Initier une mise à jour du document unique.\nUne fois établi, le document unique n’a pas vocation à rester figé. Pour tenir compte des évolutions des conditions de travail et de la connaissance des risques, l’employeur est tenu de le mettre à jour chaque fois que nécessaire et au moins une fois l’an.",null),
("36","33","Élaborer et afficher à l’attention des personnels une note indiquant les modalités d’accès au document unique.\nIl est mis à disposition des représentants du personnel, du médecin de prévention, de l’ACFI  mais aussi de l’inspecteur du travail et des ingénieurs conseils ou contrôleurs de sécurité des CARSAT sur simple demande.\nL’employeur doit rendre ce document accessible aux travailleurs et placer une affiche sur le lieu de travail pour indiquer où il est possible de le consulter.",null),
("37","34","Présenter le plan d\'action du document unique aux membres du comité afin d\'indiquer les axes pouvant s\'inscrire dans le programme annuel de prévention.\nAinsi, après avoir établi l’évaluation des risques, consignée dans le Document Unique, l’étape suivante consiste à mettre en place un programme d’actions. Il s’agit sans aucun doute du plus important des documents pour les représentants du personnel du CHSCT. Là seront précisées, planifiées et chiffrées les mesures de prévention et de sécurité à réaliser.\nParmi ces mesures, figureront notamment celles qui auront été décidées sur proposition du CHSCT.\n",null),
("38","35","Initier un diagnostic des Risques Psycho-Sociaux.\nDans le cadre de l’obligation de résultat qui est la sienne, l’employeur public doit lui aussi procéder à l’évaluation de ce type de risque dans son Document Unique, et engager les actions correctives.\nEn fonction des services, des établissements, des métiers, les mêmes éléments généraux de contexte peuvent générer des facteurs de risques variés qu’il faut mettre en évidence afin d’élaborer des plans d’actions appropriés.\nEn cela un constat partagé de la situation de départ, qui peut efficacement être réalisé au travers d’un diagnostic préalable, est presque toujours une nécessité. ",null),
("39","36","Ce registre doit être ouvert et mis à disposition de tous les agents, de l’ACFI mais également des usagers ; un document type est téléchargeable sur le site du CDG87 rubrique Santé et Sécurité au Travail RUSST/chapitre 3.1 ou sur le site de la CNRACL à l’adresse:\nhttps://www.cdc.retraites.fr/outils/RUSST/",null),
("40","37","Ce registre doit être ouvert sous la responsabilité de l’Autorité Territoriale et mis à disposition du CT/CHSCT et des agents intervenus dans la procédure; un document type est téléchargeable sur le site du CDG87 rubrique Santé et Sécurité au Travail  rubrique Santé et Sécurité au Travail RUSST/chapitre 3.2 ou sur le site de la CNRACL à l’adresse:\nhttps://www.cdc.retraites.fr/outils/RUSST/",null),
("41","38","Ce régistre doit être ouvert et tenu à jour des différents contrôles périodiques;  un document type est téléchargeable sur le site du CDG87 rubrique Santé et Sécurité au Travail  rubrique Santé et Sécurité au Travail RUSST/chapitre 4.1 ou sur le site de la CNRACL à l’adresse:\nhttps://www.cdc.retraites.fr/outils/RUSST/",null),
("42","39","S’assurer que chaque bâtiment considéré comme ERP dispose de son registre de sécurité incendie et que sa mise à jour est effective.\nRECOMMANDATION:\nPour les bâtiments non ERP, un seul registre incendie (registre sécurité) peut être ouvert et regrouper l’ensemble des contrôles.",null),
("43","40","En s’appuyant sur l’évaluation des risques, l’Autorité territoriale assistée de son AP peuvent se rapprocher du Médecin de Prévention pour élaborer cette fiche .\nUn document type annexé au chapitre 2 du R.U.S.S.T qui a été mis en ligne sur le site de la CNRACL est téléchargeable.\nhttps://www.cdc.retraites.fr/outils/RUSST/",null),
("44","41","Après la réalisation de l’évaluation des risques, l’Autorité territoriale assistée de son AP doivent élaborer ces fiches .\nElle doit contenir :\n- les conditions habituelles d’exposition appréciées notamment à partir du document unique d’évaluation des risques ainsi que les événements particuliers qui ont pour effet d’augmenter l’exposition ;\n- la période au cours de laquelle cette exposition est survenue (à partir du 1er février 2012);\n -les mesures de prévention, organisationnelles, collectives ou individuelles, mises en œuvre pour faire disparaitre ou réduire les facteurs de risque durant cette période.",null),
("45","42","S’assurer que les agents disposent bien des autorisations de conduite signées par l’autorité territoriale.\nUne autorisation de conduite doit être délivrée par l’employeur, pour la conduite des engins suivants :\n-chariots automoteurs de manutention à conducteur porté ;\n-grues à tour ;\n-grues mobiles ;\n-engins de chantiers télécommandés ou à conducteur porté ;\n-plates-formes élévatrices mobiles de personnel ;\n-grues auxiliaires de chargement de véhicules.\nCette autorisation est accordée :\n-si le médecin du travail a délivré au conducteur un certificat d’aptitude médicale\n-si le conducteur a acquis le savoir et les compétences nécessaires\nChaque agent concerné est détenteur d’un exemplaire de ce titre de conduite.",null),
("46","43","S’assurer que la collectivité dispose du dossier contenant les résultats des contrôles effectués et les mesures prises pour l’ensemble des installations de la collectivité; à défaut prévoir la réalisation d’un diagnostic.\nLe DTA doit être mis à jour par le propriétaire conformément aux dispositions de l’arrêté du 21 décembre 2012 relatif aux recommandations générales de sécurité et au contenu de la fiche récapitulative du « dossier technique amiante » :\n- lors de toute découverte de matériaux et produits contenant de  l’amiante ; \n- lors de la surveillance périodique de matériaux et produits contenant de l’amiante \n- lors de travaux portant sur des matériaux et produits contenant de l’amiante ;\n- et dans les autres cas au plus tard avant le 1er février 2021.",null),
("47","44","S’assurer que seuls les agents disposants de l’habilitation électrique, à jour de recyclage, interviennent sur les ouvrages électriques ou à proximité.\nProcéder au recensement de toutes les activités qui demandent d’intervenir sur des ouvrages électriques et identifier les titres d’habilitations nécessaires pour les agents.\nS’assurer de la validité des habilitations en cours.\nInscrire rapidement les agents identifiés à une prochaine session de formation.",null),
("48","45","INVENTAIRE:\nRéaliser un inventaire exhaustif des produits utilisés.\nIl conviendra de faire un inventaire des risques au cas par cas afin de les intégrer dans le Document Unique de la collectivité ou de l’établissement public. Il faudra aussi veiller à ce que la quantité stockée soit la plus faible possible et en rapport avec les besoins de la structure.Ces fiches comportent 16 chapitres et doivent être fournies gratuitement par les fournisseurs.\n",null),
("49","46","Etablir les notices de poste.\nA chaque poste de travail ou situation de travail où les travailleurs sont exposés, l’employeur établit et actualise une notice les informant des risques et des précautions à prendre et leur rappelant les règles d’hygiène et, le cas échéant, les consignes d’utilisation des équipements de protection collective ou individuelle.",null),
("50","47","La Déclaration d’Intention de Commencement de Travaux (DICT), a pour objet d’indiquer aux exploitants de réseaux la localisation précise des travaux projetés et les techniques de travaux qui seront employées.\n\nCelle-ci permet également d’obtenir les informations sur la localisation des réseaux et les recommandations visant à prévenir l’endommagement des réseaux.\n\nLa DICT est mise à disposition des entreprises de travaux et des collectivités locales afin d’informer les exploitants de réseaux et concessionnaire d’ouvrage de la réalisation de travaux.",null),
("51","48","S’assurer que toutes les installations de ventilation mécanique sont recensées et contrôlées.\nAfin de limiter l’exposition des salariés et les problèmes de salubrité des bâtiments, il est important de contrôler les installations d’aération et d’assainissement des locaux de travail en s\'assurant de leur état de fonctionnement.",null),
("52","49","S’assurer que le suivi des opérations de contrôle est tracé et à jour.\nLes vérifications périodiques sont réalisées par des personnes qualifiées, appartenat ou non à la structure, dont une liste est déterminée.\nCes personnes doivent avoir les compétences nécessaires pour exercer leur mission.",null),
("53","50","S’assurer de la mise à jour  de la liste des équipements et engins de levage à contrôler.\nLes équipements de levage et de protection, accessoires et engins de chantier doivent faire l’objet d’un contrôle régulier afin de détecter toute anomalie.\nCes vérifications s’établissent à la fois lors de la mise en service de l’équipement (achat d’un équipement neuf ou d’occasion) et de façon périodique (annuelle ou semestrielle)\nPour un tracteur équipé d’une fourche de levage:  doit être contôlé tous les 6 mois lorsqu’il est utilisé en engin de levage (déplacement et levage, changement de niveau significatif des marchandises ou des matériels), tous les ans lorsqu’il est utilisé en engin de manutention (déplacent et lèvent des produits non conditionnés (Fumier, terre, fourrage...).",null),
("54","51","Recenser toutes les installations entrant dans le champ de ces vérifications périodiques et consigner la réalisation des différents contrôles dans le registre de sécurité.",null),
("55","52","ÉCHAFAUDAGE:\nInitier une vérification périodique du ou des échafaudages.\nExamen d’adéquation : vérifier que l’échafaudage est en adéquation avec les travaux à effectuer (bonne hauteur, lieu d’installation, …).\n• Examen de montage et d’installation : s’assurer que l’échafaudage est installé de manière sûre, conforme à la notice du fabricant ou au plan de montage et à la notice de calcul.\n• Examen de l’état de conservation : vérifier le bon état des différents éléments de l’échafaudage et, lorsqu’il est en service, l’absence de charges dépassant les limites ou l’absence d’encombrement des planchers.\n",null),
("56","53","Les installations électriques pour l’ensemble des bâtiments (mairie, groupes scolaires, ateliers municipaux, salle polyvalente...etc), doivent être vérifiées lors de leur mise en service ou après avoir subi une modification de structure par un organisme agréé, puis périodiquement par une personne qualifiée ou société compétente.\nConsignation des vérifications pour mise à jour du registre de sécurité",null),
("57","54","Vérifier les caractéristiques du compresseur afin d’intégrer cet équipement à la liste des vérifications périodiques. Faire procéder à son contrôle par un organisme agréé tous les 40 mois.\nLes compresseurs d’air fond l’objet de requalification dont l’intervalle maximal est fixé à 10 ans.\nLes appareils à pression sont soumis à des contraintes multiples et des agressions de tous ordres. Afin de limiter le risque d’éclatement et de s’assurer de l’évolution de leur état dans le temps, les collectivités doivent organiser des examens.\nSe rapprocher des services de la DREAL pour tout complément d’information.",null),
("58","55","Certains équipements nécessitent une vérification obligatoire annuelle. Le résultat de ces vérifications doit être consigné dans le registre unique de sécurité.\nCes équipements sont les suivants :\n- Appareils de protection respiratoire autonome destinés à l’évacuation du personnel.\n- Appareils de protection respiratoire et équipements complets destinés à des interventions accidentelles en milieu hostile.\n- Gilets de sauvetage gonflables.\n- Systèmes de protection individuelle contre les chutes de hauteur.\n- Stocks de cartouches filtrantes anti-gaz pour appareils de protection respiratoire.\n",null),
("59","56","Vérifier qu’aucun équipement de travail  mis en service avant le 01/01/93 n’est utilisé auquel cas s’assurer qu’ils répondent aux prescriptions techniques du CT et à défaut réaliser un plan de mise en conformité en précisant la nature des travaux à réaliser, la date de réalisation prévue.",null),
("60","57","EXTINCTEURS:\nUn extincteur qui ne fait pas l’objet d’un entretien régulier ne peut pas fonctionner convenablement. Un incendie ne peut être lutté que grâce, uniquement à des extincteurs en parfait état. \nUn extincteur doit être contrôlé chaque année.\nDe plus, un contrôle et entretien réguliers doivent être effectués\n-la présence de l’extincteur et celle du plomb\n-dernier visa de l’organisme de vérification < 1an\n-l’état du flexible ou du tromblon (CO2) et du support\n-la parfaite accessibilité (ne pas mettre d’obstacle devant)\n-le balisage et la numérotation",null),
("61","58","PTAC>3,5T:\nLe contrôle technique des poids-lourds concerne les véhicules dont le poids total en charge (PTAC) est supérieur à 3,5 tonnes ou ceux qui correspondent à un genre spécifique. Seuls les contrôleurs agréés par le préfet sont autorisés à vérifier leur bon état de marche. Ce contrôle est effectué à l\'initiative du propriétaire, dans les délais prescrits et à ses frais.",null),
("62","59","Mettre en place la périodicité des contrôles de ces installations et tracer leurs résultats dans le registre de sécurité. S’assurer qu’aucun portail de la collectivité n’entre pas dans la catégorie des automatiques ou semi-automatiques, auquel cas, il doit  être contrôlé semestriellement par un technicien qualifié ou entreprise extérieure spécialisée  conformément à l’arrêté du 21 décembre 1993.\nDans le cas de porte et portail manuel ou motorisé, il doit être controlé par une personne compétente à une fréquence définie par l’employeur.",null),
("63","60","Initier une vérification périodique du ou des réservoirs enterrés.\nLes stockages de volumes importants doivent être traités selon les règles applicables aux stockages industriels, en se référant, s’il y a lieu, à la réglementation des Installations classées pour la protection de l’environnement.",null),
("64","61","S’assurer que les vérifications périodiques ont été effectuées et que les remarques éventuelles ont été levées.",null),
("65","62","Initier une formation à la sécurité pour tout nouvel entrant.\nLe contenu doit prendre en compte :\n- les consignes générales de sécurité (organisation de la sécurité, les consignes incendie, conduite à tenir en cas d’accident, droit de retrait d’une situation de travail dangereuse),\n- les consignes du secteur (règles de circulation, présentation des SST, repérage et implantation du matériel de lutte contre l’incendie),\n- les consignes particulières (indentification des risques, utilisation des EPI, repérages des protections collectives, examen des procédures et des modes opératoires à respecter). \nContrôle documentaire de la formation à la sécurité (émargement, doc. intégré au dossier du salarié).",null),
("66","63","Le plan de formation traduit la politique de formation de la collectivité dans un document formalisé qui prévoit, pour une durée déterminée,\nles besoins de formation.\nLe catalogue des formations mis en ligne par le CNFPT est un des outils d’aide à la réalisation d’un plan de formation.\nUn outil de suivi des recyclages des différentes certifications ou habilitations peut servir de base à la mise en place d’un plan annuel de formation.",null),
("67","64","Prévoir de former le personnel à la manipulation des extincteurs.\nAfin d’apprendre à identifier les matières en feu pour pouvoir choisir et utiliser l’extincteur approprié et connaitre la conduite à tenir en présence d’un début d’incendie et les modalités d’alerte des sapeurs pompiers.  \nIl est recommandé de former l’ensemble des agents.\nVous pouvez contacter le CNFPT qui organise ce type de formation ou contacter votre prestataire.",null),
("68","65","Au sein de la Fonction publique territoriale, les services concernés par cette formation sont en priorité les services techniques et la restauration collective où les risques d’accidents de service sont importants,il peut être judicieux également de former les agents des services en contact direct avec du public (ATSEM, mairie, équipements sportifs, etc.).\nS’assurer que les agents sont à jour de leur recyclage (tous les deux ans).\nVous pouvez contacter le CNFPT qui organise ce type de formation.",null),
("69","66","Mettre en place des formations ou de l’information sur les risques spécifiques aux différentes activités.\nFormation aux gestes et postures, à l’utilisation des produits chimiques (entretien et phytosanitaire), à l’utilisation des Equipements de Protection Individuelle…etc (voir la liste dans la partie réglementation)",null),
("70","67","TONDEUSE AUTOPORTEE:\nS’assurer que les agents ont bien suivi la formation spécifique à la conduite de la tondeuse autoportée. La formation CACES 1 peut être tolérée à la condition que l’organisme testeur atteste que le module \"tondeuse autoportée\" était inclus au programme.\nToujours s’assurer que les agents sont bien aptes médicalement  et que les indications (formation + aptitude médicale) sont mentionnées sur les autorisations de conduite délivrées par l’autorité territoriale.",null),
("71","68","Initier des formations AIPR.\nTous les intervenants à proximité des réseaux sont soumis, à compter du 1er Janvier 2018, à l’obligation de disposer d’une << Autorisation d’Intervention à Proximité des Réseaux >> (AIPR) délivrée par un organisme formateur agréé et reconnu par le ministère (MEDDE) comme centre d’examen par QCM après vérification par celui-ci de la bonne acquisition des compétences nécessaires.\nTous les opérateurs exécutant des travaux chargés de conduire des engins de chantier ou d’effectuer des travaux urgents dispensés de DT intervenant donc à proximité des réseaux enterrés ou aériens devront être titulaires d’une AIPR.\n",null),
("72","69","CERTIPHYTO:\nInitier des formations Certiphyto.\nLe Certiphyto est un certificat individuel pour produits phytopharmaceutiques, obligatoire pour :\n- acheter des produits phytosanitaires\n- utiliser des produits phytosanitaires (permet à son titulaire de réaliser des opérations en lien avec les produits phytopharmaceutiques,\npour lesquelles le certificat a été établi).\n",null),
("73","70","Un stage du CNFPT permet de répondre à cette obligation, il s’agit de la formation.« Débroussaillage, abattage, tronçonnage ». Sont notamment abordés dans cette formation :\n Le débroussaillement : objectifs et techniques, présentation du matériel de sécurité et mesures de sécurité\n Rappel des obligations réglementaires en matière de débroussaillage et élimination des déchets\n L’organisation d’un chantier – les méthodes de travail\n Eléments de base pour la pratique d’abattage et de tronçonnage\nDe même pour les travaux de tronçonnage en hauteur, le CNFPT propose un stage de « Préparation à l’élagage en hauteur » qui répond en partie à l’obligation de formations aux travaux sur cordes. Ce stage devra être complété par les procédures de sauvetage et d’intervention en cas d’accident dans un arbre.",null),
("74","71","Les agents susceptibles d’intervenir sur de l’amiante doivent suivre une formation d’une durée minimale de 2 jours (formation obligatoirement suivie par tout travailleur préalablement à sa première intervention susceptible de l’exposer à l’amiante).\nSi la fibre est interdite en France depuis décembre 1996, elle est toujours présente dans de nombreux bâtiments construits avant cette date, et elle expose les agents à de graves maladies respiratoires.",null),
("75","72","Tous les lieux de travail, y compris les véhicules, doivent être équipés d’un matériel de premiers secours destiné à prodiguer les premiers soins en cas d’accident.\nCe matériel doit être stocké à l’abri de l’humidité et de la poussière, dans un contenant résistant aux chocs et inaltérable.\nLa trousse de secours, ou l’armoire de premiers secours, doit être facilement accessible et signalée. \n\n",null),
("77","74","LOCAUX:\nAu moins un extincteur portatif à eau pulvérisée de 6 litres au minimum pour 200m² de plancher, avec un minimum d’un appareil par niveau.\nLa fixation de l’extincteur doit se faire dans sur un poteau, ou un mur de préférence à proximité des lieux les plus susceptibles d’entraîner la naissance d’un incendie (machinerie, ateliers, circuits électriques,…). Il doit bien évidemment être placé dans un endroit dégagé et visible de tous.\nPrévoir d’adapter leur positionnement à une hauteur de la poignée de 1m50 max (arrêté du 26 juin 2008). Pour prévenir des éventuelles manipulations des enfants aux écoles, il existe des housses de protection.   ",null),
("79","76","Afin de s’assurer que les agents travaillant seuls soient à même de pouvoir alerter leur responsable hiérarchique et les secours dans tous les cas :\n -Établir une liste des agents travaillant seuls et sans moyens d’alerte (même temporairement).\n -Planifier par la suite les actions à mener pour remédier à cette situation critique en cas d’accident.\nUne fois cette analyse effectuée, la collectivité doit mettre en place des moyens de prévention afin de réduire ou éliminer ces situations potentiellement dangereuses. La première réflexion doit se porter sur l’organisation du travail (planification des opérations, modification des horaires d’intervention, constitution d’équipes de travail...). Si une réorganisation du travail s’avère impossible, il faut dans ce cas, réduire l’isolement de l’agent en organisant une surveillance de celui-ci.\n\n",null),
("80","77","Le poste de travail ainsi que les locaux sanitaires et de restauration que les travailleurs handicapés sont susceptibles d\'utiliser dans l\'établissement doivent être aménagés de telle sorte que ces travailleurs puissent y accéder aisément.",null),
("81","78","Lors de l’évaluation des risques, s’assurer que pour toutes les activités des agents qui le nécessitent, des EPI (comme harnais, longe. contre les chutes de hauteur, gants, lunettes, casques antibruit, chaussures de sécurité) sont bien mis à disposition.\nLes agents d’entretien des locaux sont également dotés de chaussures de sécurité  anti-dérapantes , de gants et vêtements de protection (blouse...)\nLes agents de restauration sont dotés de chaussures de sécurité à embouts renforcés et fermées, de gants de protection contre la brûlure et la coupure...\n",null),
("82","79","Les obligations en matière d’utilisation, de port et de vérifications des EPI découlent de consignes (ou du règlement intérieur si il existe) à l’intérieur desquelles elles doivent être mentionnées.\nDes rappels peuvent être faits par l’autorité territoriale.\nLe port des EPI représente souvent une contrainte pour les agents : gène dans le travail, inconfort, aspect esthétique, sous-évaluation des risques et surévaluation de ses capacités à maîtriser le risque ou par impératifs liés à la rapidité d’exécution des tâches.\nC’est pourquoi, il est important d\'associer les agents eux-mêmes leur permettant ainsi d’avoir une meilleure connaissance des risques, des contraintes et de bénéficier de leur expérience terrain mais aussi de consulter les acteurs de l\'hygiène de la sécurité pour ce choix (AP, CT ou CHSCT, médecin du travail, ...). \n",null),
("83","80","L’autorité territoriale doit :\nMettre gratuitement à disposition des agents les EPI adaptés aux risques auxquels sont exposés les agents ;\nGarantir leur conformité ;\nS’assurer de leur maintien en bon état d’hygiène et de fonctionnement ;\nS’assurer de leur utilisation effective ;\nInformer et former les agents à l’utilisation des EPI.\nAfin de gérer l’ensemble des tenues de travail, un plan de dotation des tenues de travail définissant le type et le nombre de vêtements fournis par activité ainsi que les périodes de renouvellement peut être mis en place.",null),
("84","81","Prévoir la mise en place d’un support de  formation/ communication/ information  pour les agents.\nChaque agent doit connaître les risques contre lesquels les équipements de protection individuelle les protègent, les conditions d’utilisation, notamment les consignes pour le stockage et l’entretien de ces équipements. L’agent doit aussi connaître ses responsabilités en cas de non-respect des consignes d’utilisation.\nLa collectivité a l’obligation d’assurer une formation auprès de ses agents, accompagnée d’un entraînement pratique au port d’équipement de protection individuelle de catégorie III, qui permettra à l’agent d’utiliser son matériel en parfaite connaissance.\n",null),
("85","82","L’employeur élabore une consigne d’utilisation au poste de travail. Elle indique qu’avant chaque utilisation le travailleur doit procéder à un contrôle du bon état de ses EPI.\nElle intègre les indicateurs de détérioration de l’EPI (usure de composants, décoloration, trou ou déchirure etc.). Si l’EPI n’est plus en bon état, il doit être mis au rebut.\nLes consignes comportent également les informations pour procéder au bon ajustement des EPI (vérification de l’étanchéité pour les appareils de protection respiratoire…) et le retrait des EPI (procédure de retrait d’une tenue de protection contre un risque chimique, afin d’éviter de se contaminer…).",null),
("86","83","Interdire aux jeunes de 15 à 18 ans d’effectuer les travaux interdits (Le mineur ne peut être affecté qu’à des travaux légers qui ne sont pas susceptibles de porter préjudice à sa sécurité, à sa santé ou à son développement).",null),
("87","84","Seuls les le ou les jeunes travailleurs âgés de 15 à\nmoins de 18 ans, apprentis ou titulaires d’un contrat de professionnalisation ou stagiaires de la formation professionnelle ou élèves ou étudiants préparant un diplôme professionnel ou technologique peuvent bénéficier d’une dérogation pour les travaux interdits et règlementés.",null),
("88","85","S’assurer que les mesures dérogatoires sont prises..",null),
("89","86","Prendre  une délibération de dérogation.",null),
("90","87","Transmettre la délibération pour information au Comité D’hygiène de Sécurité et des Conditions de Travail (CHSCT).\nAdresser la délibération à l’ACFI.",null),
("91","88","Renouveler la délibération tous les 3 ans.",null),
("92","89","Lors de travaux sous-traités, il est nécessaire de définir les mesures de prévention à appliquer avec l’entreprise et il est souhaitable que ces mesures  soient formalisées dans un document écrit (Plan de Prévention).\nUn document type est téléchargeable sur le site du CDG87/Santé et sécurité au travail/RUSST/Chap8.1 ou sur le site de la CNRACL à l’adresse: https://www.cdc.retraites.fr/outils/RUSST/.\n(L’initiative de l’établissement d’un plan de prévention écrit incombe à l’entreprise utilisatrice)",null),
("93","90","Dans le cas de livraisons récurrentes de fournisseurs (exemples: livraisons quotidiennes au restaurant scolaire, au magasin...), formaliser les mesures de prévention à mettre en œuvre pour ces opérations sur un document écrit appelé \"protocole sécurité chargement/déchargement\".\nDans des cas particuliers de petites opérations très répétitives (dépose fréquente de petits colis par exemple) ou lorsqu’il est difficile d’identifier le prestataire au préalable, la priorité de la collectivité sera en fait de donner une information claire à l’intervenant par le moyen le plus adapté à la situation, sur les risques que peut générer l’opération et les précautions à prendre.\nhttps://www.cdc.retraites.fr/outils/RUSST/",null),
("94","91","Prévoir, à l’occasion de tous chantiers importants impliquant de la coactivité , de mettre en place une coordination SPS.\nLe coordonnateur SPS intervient donc sur les chantiers de bâtiment et de travaux publics pour gérer la co-activité des entreprises sur le plan de la sécurité. Il intervient à la demande du maître d’ouvrage en phases de conception et de réalisation.",null),
("95","92","Mettre en place une procédure d’élaboration d’un permis de feu pour les interventions d’entreprises extérieures lors de travaux par point chaud et s’assurer qu’elle a bien été réalisée.\nLe permis de feu est délivré par l’autorité territoriale (ou son représentant) pour chaque travail par points chauds exécutés par les agents de la collectivité ou par le personnel d’une entreprise extérieure. Il doit être renouvelé chaque fois qu’un changement (opérateur, lieu, méthode de travail…) intervient dans le chantier. Le permis de feu ne concerne pas les travaux effectués à des postes de travail permanents de la collectivité. \nhttps://www.cdc.retraites.fr/outils/RUSST/",null),
("96","93","La signalisation est un outil primordial pour la prise en compte des dangers par les travailleurs car elle donne une indication sécurité et santé. Elle est présente pour compléter les mesures de prévention et de protection mise en place par l’employeur.",null),
("97","93","Une évaluation des risques doit être réalisée afin de déterminer les risques présents sur les installations de travail, et ne pouvant être évités par quelconque moyen. La signalisation de sécurité à mettre en place (choix, nombre, emplacement) sera en fonction de l’importance de ces risques, des dangers ou de la zone à couvrir.",null),
("98","94","Les locaux de travail et leurs annexes doivent être régulièrement entretenus et nettoyés; exempts de tout encombrement pour laisser le passage libre aux déplacements des agents .",null),
("99","94","L’aménagement des locaux techniques influe directement sur les conditions de travail. En effet, quand un atelier ne permet pas de ranger les différents équipements, matériels et outils, il est alors difficile de trouver les bonnes pratiques et de faire respecter les consignes d’hygiène et de sécurité. ",null),
("100","95","Mettre à disposition de l’eau potable et fraiche.\nL’eau potable peut être distribuée au moyen d’appareils spécifiques (fontaine…) ou d’un robinet, qui doivent répondre aux conditions d’hygiène et de propreté.\nL’eau est considérée comme fraîche si sa température se situe entre 9° et 12°. Dans tous les cas, la température de l’eau ne peut excéder 15° (circulaire ministérielle du 13 mars 1962)",null),
("101","96","INTERDICTION:\nFaire respecter l’interdiction de fumer.",null),
("102","96","AFFICHAGE:\nMettre en place l’affichage réglementaire.",null),
("103","97","ARMOIRES:\nÉquiper les vestiaires collectifs d\'un nombre suffisant de sièges et d\'armoires individuelles ininflammables.\nCes armoires doivent permettre de suspendre deux vêtements de ville.\nLorsque les vêtements de travail sont susceptibles d\'être souillés de matières dangereuses, salissantes ou malodorantes, les armoires doivent\ncomprendre un compartiment réservé à ces vêtements.\nLes armoires individuelles doivent être munies d\'une serrure ou d\'un cadenas. \n\n",null),
("104","97","VESTIAIRES:\nInstaller des vestiaires collectifs dans un local spécial de surface convenable, isolé des locaux de travail et de stockage et placés à proximité du passage des travailleurs. La surface des vestiaires sera d’au moins 1 m² par agent avec un minimum total de 10 m².\nSi les vestiaires sont installés dans des locaux séparés des lavabos, la communication entre ceux-ci doit pouvoir s\'effectuer sans traverser les locaux de travail ou de stockage et sans passer par l\'extérieur.\nTenir ces locaux en état constant de propreté. Le sol et les parois des vestiaires doivent permettre un nettoyage efficace.\nDans les établissements occupant un personnel mixte, des installations séparées doivent être prévues pour les travailleurs masculins et féminins. ",null),
("106","97","LAVABOS:\nPrévoir au minimum un lavabo pour 10 personnes.\nLes lavabos doivent être installés dans un local spécial de surface convenable, isolé des locaux de travail et de stockage et placés à proximité\ndu passage des travailleurs.\nSi les lavabos sont installés dans des locaux séparés des vestiaires, la communication entre ceux-ci doit pouvoir s\'effectuer sans traverser les locaux de travail ou de stockage et sans passer par l\'extérieur.\nDans les établissements occupant un personnel mixte, des installations séparées doivent être prévues pour les travailleurs masculins et féminins.\nLes lavabos sont à eau potable et l\'eau est à température réglable.\nLa température de l\'eau chaude sanitaire ne doit pas dépasser 60 °C au point de puisage. Le cas échéant, un moyen de réglage doit être à la disposition de l’utilisateur. ",null);
INSERT INTO preconisation VALUES
("107","98","Dans les établissements où sont effectués certains travaux\ninsalubres ou salissants des douches doivent être mises à la disposition du personnel.\nLa liste des travaux nécessitant la mise à disposition de douches est énumérée\ndans l’arrêté du 23 juillet 1947 modifié.",null),
("108","99","Mettre à disposition un local de restauration pourvu de sièges et de tables en nombre suffisant et qui comporte un robinet d’eau potable, fraîche et chaude, pour dix usagers, doté d’un moyen de conservation ou de réfrigération des aliments et des boissons et d’une installation permettant de réchauffer les plats.",null),
("110","100","CABINET D\'AISANCE:\nMettre à disposition un cabinet d’aisance et un urinoir pour vingt hommes et deux cabinets pour vingt femmes.",null),
("111","100","ENTRETIEN:\nFaire procéder au nettoyage et à la désinfection des cabinets d’aisance et des urinoirs au moins une fois par jour.",null),
("112","100","SÉPARATION:\nLes cabinets d’aisance doivent être séparés pour le personnel féminin et masculin.",null),
("113","101","Mettre de l’eau potable et fraîche à disposition.\nDans le cas où des conditions particulières de travail (niveau de température ambiante, exposition à des intempéries, composition de\nl’atmosphère…) entraînent les travailleurs à se désaltérer fréquemment, l’employeur est tenu de mettre gratuitement à leur disposition au moins une boisson non alcoolisée.\nLes boissons et les aromatisants mis à disposition sont choisis en tenant compte des souhaits exprimés par les travailleurs et après avis du médecin du travail.\nL’employeur détermine l’emplacement des postes de distribution des boissons, à proximité des postes de travail et dans un endroit remplissant toutes les conditions d’hygiène. ",null),
("114","102","Mettre à disposition un local de repos.\nÀ défaut de local de repos, lorsque la nature des activités l’exige et après avis du comité d’hygiène, de sécurité et des conditions de travail ou à défaut du comité technique, le local de restauration ou l’emplacement permettant de se restaurer doit pouvoir être utilisé en dehors des heures de repas comme local ou emplacement de repos. Les sièges mis à la disposition des travailleurs pour cet usage comportent des dossiers. \n\n",null),
("115","103","CHAUFFAGE:\nDes mesures doivent être prises pour assurer la protection des agents contre le froid et les intempéries. Ainsi, les locaux affectés au travail, doivent être chauffés pendant la saison froide et la température des locaux annexes est adaptée à l’activité qui y est réalisée.",null),
("118","104","ECLAIRAGE:\nSi un dysfonctionnement apparaît dans ce domaine, la collectivité doit réaliser des mesures d’éclairement et en fonction des résultats, mettre en place des actions correctives (Vous pouvez vous rapprocher du service prévention du CDG )\nUn éclairage bien conçu contribue au confort visuel, à la diminution de la fatigue visuelle et posturale et des risques d’accidents du travail. Les besoins en éclairage sont différents suivant les caractéristiques de l’individu et des tâches à accomplir.\nD’une manière générale, et réglementaire, la lumière naturelle, venant par des ouvertures, doit pouvoir être utilisée pour l’éclairage des locaux destinés au travail, mais il n’y a pas de niveau minimal d’éclairement naturel fixé.",null),
("119","105","Installer une ventilation mécanique ou permettre une ventilation naturelle permanente des locaux à pollution non spécifique.\nDésignation des locaux Débit minimal d’air introduit (en m3 par heure et par local)\nCabinet d’aisances isolé 30\nSalle de bains ou de douches isolée 45\nSalle de bains ou de douches commune\navec un cabinet d’aisances 60\nBains, douches et cabinets d’aisances 30 + 15 N\nLavabos groupés 10 + 5 N\nN : Nombre d’équipements dans le local \nLes cabinets d’aisances doivent être aménagés de manière à ne dégager aucune odeur. Les effluents ou eaux usées des cabinets d’aisances doivent être évacués conformément aux dispositions des règlements sanitaires départementaux.",null),
("120","106","S\'assurer que tous les locaux et les véhicules disposent d\'une trousse de premiers secours.\nContrôler leur contenu. \n\nVous pouvez vous rapprocher du médecin de prévention pour définir au mieux et valider leur contenu en fonction des activités exercées par les agents.\n                                                                                                                                                                                                                                                                               ",null),
("121","107","Prévoir la mise en place de cet affichage sur les sites non encore équipés.\nEn tant qu\'employeur vous êtes tenu d\'afficher dans vos locaux l\'adresse et le numéro d\'appel du médecin du travail ou du service de santé au travail et des services de secours d\'urgence.\n\nCe panneau doit être accessible et lisible.",null),
("122","108","TRAVAIL ISOLE:\nIl est recommandé de ne pas affecter une personne seule à un poste de travail dangereux ou essentiel à la sécurité des autres travailleurs. \nD’autre part, toute personne, ou équipe de personnes dont le poste de travail est isolé, doit faire l’objet d’une surveillance directe ou indirecte, de jour comme de nuit. \nL’outil le plus approprié pour prendre en compte la notion de travailleur isolé reste l’évaluation des risques\nPour évaluer les risques liés au travail isolé:\n - repérer les situations d’isolement prolongé ou ponctuel et les risques associés\n - mettre en œuvre des moyens organisationnels, techniques pour supprimer le travail isolé (binome, lieux fréquentés)",null),
("123","108","ASTREINTE:\nUne réflexion doit être menée préalablement à sa mise en œuvre, concernant les moyens, tant humains que techniques et organisationnels. En matière de santé, de sécurité et de bien-être au travail, un certain nombre de préconisations peuvent être proposées.\nFavoriser le travail en binôme,\nMettre à disposition des moyens de communication et d’alerte, \nÉtablir une procédure en cas d’accident, \nÉtablir des consignes de travail avec définition des missions, des moyens et priorisation des interventions…\nLes collectivités doivent mettre en place un dispositif d’astreintes par délibération, conformément à la réglementation, notamment pour couvrir le\npersonnel territorial en cas d’accident, à défaut de quoi leur responsabilité pourrait être engagée.\n",null),
("124","109","Lors de l’évaluation des risques lié au travail isolé, mettre en oeuvre des moyens d’alerte dans le cadre d’une procédure de déclenchement et d’organisation des secours:\n - doter les agents d’un moyen d’alerte ( téléphone, DATI)\n - assurer une surveillance à distance\n - assurer une surveillance par le passage périodique d’un autre agent\nUn agent intervenant sur un chantier doit toujours être muni d’un moyen d’alerte si il est seul ou pouvoir suivre une procédure de surveillance.\nPenser à informer les agents sur les modalités d’utilisation des moyens de communication : taper 0 avant le numéro d’appel pour une communication extérieure, possibilité de taper les numéros d’urgence (112, 18, 15…)à la place du code PIN, même sans forfait, lorsqu’on allume un portable… ",null),
("126","109","SYSTEME D.A.T.I:\nLa mise en place d\'un DATI permet de répondre à la réglementation (article R 4224-16 du code du Travail) imposant au chef d\'entreprise d\'assurer les premiers secours aux accidentés et blessés : en effet, le DATI est un système de télécommunication qui transmet une alarme en cas de défaillance ou d\'agression du travailleur isolé vers un poste de surveillance.\nLa dotation d\'un DATI à un travailleur isolé est une mesure préventive insuffisante si elle n\'est pas accompagnée d\'une permanence à l\'écoute ayant une procédure rapide et compétente en cas d\'alerte DATI, des consignes d\'intervention efficaces (moyens, plan d\'évacuation, ...).\nCes systèmes, qui permettent la détection de l\'état physique du travailleur et sa localisation, sont constitués au minimum par un émetteur porté par le travailleur isolé et un récepteur placé dans la collectivité, pour recevoir l\'alarme à un poste de surveillance et la transmettre aux secours.",null),
("128","110","Déterminer une procédure d’urgence.\nIl appartient au chef d’entreprise, après avis du médecin du travail, de définir à l’avance l’organisation de ses secours internes et de ses moyens d’alerte, en cas d’accident ou d’urgence médicale.\nCette obligation revêt une importance particulière dès l’instant où, en cas d’accident du travail, tout défaut ou carence dans l’organisation des secours peut être fatal à la victime et engager la responsabilité pénale de l’employeur",null),
("129","111","Calculer l’effectif théorique des personnes susceptibles d’être présentes à prendre en compte pour la prévention des incendies et de l’évacuation.\nUn système d’alarme doit être installé dans chaque établissement où peuvent être réunies habituellement 50 personnes, et dans ceux, quelle que soit leur importance, où sont manipulées et mises en œuvres des matières inflammables (explosives, extrêmement inflammables, comburantes…). \nUne consigne de sécurité doit être établie et affichée de manière apparente :\n-dans chaque local pour les locaux dont l’effectif est supérieur à 5 personnes ou pour les locaux présentant des risques spécifiques.\n-dans chaque local ou dégagement desservant un groupe de locaux dans les autres cas. \n",null),
("130","112","Lever les remarques faites par la commission de sécurité.\nComposée de techniciens, d’experts et d’officiers sapeurs-pompiers, la commission de sécurité a pour mission d’éclairer les autorités administratives (maires ou parfois préfet) sur les règles de sécurité applicables dans les ERP. \nLes principaux contrôles concernent les dispositifs permettant de réduire les risques d’incendie, d’éviter la propagation du feu et des fumées, de faciliter l’évacuation du public et l’intervention des secours.",null),
("131","113","NOMBRE:\nVérifier que les extincteurs sont en nombre suffisant (Il convient de prévoir au moins un extincteur portatif à eau pulvérisé d’une capacité minimale de 6 litres pour 200m² de plancher, et par niveau)",null),
("132","113","SIGNALISATION:\nS’assurer de la présence de la signalétique réglementaire de positionnement.\nL’emplacement des extincteurs doit être indiqué par une signalisation visible de loin et sur le plan d’évacuation. ",null),
("133","113","ENGINS:\nS’assurer que tous les engins présentant des risques d’incendie (épareuse, gyrobroyeur..) sont pourvus d’un extincteur.",null),
("134","113","ACCESSIBILITÉ:\nS’assurer que les extincteur soient accessibles( recommandation que la poignée ne soit pas à plus de 1m50 du sol)",null),
("135","114","Organiser au moins tous les 6 mois des exercices au cours desquels les travailleurs apprennent à reconnaître les caractéristiques du signal sonore d’alarme générale, à se servir des moyens de premier secours et à exécuter les diverses manœuvres nécessaires.\nLes dates et les observations faites au cours de ces exercices doivent être consignées dans un registre. ",null),
("136","115","Les locaux présentant des risques d’incendie du fait du stockage et de la manipulation de produits inflammables doivent comprendre :\n-	des moyens de lutte incendie adaptés aux risques (extincteurs adaptés et en nombre suffisant, sable ou terre…), facilement accessibles et clairement signalés, contrôlés périodiquement et dont la manipulation est familière au personnel\n-	une signalisation interdisant de fumer ou d’utiliser une flamme nue\n-	une installation et des appareils électriques autorisés\n-	une interdiction d’effectuer des travaux entraînant la production d’étincelles ou un fort dégagement de chaleur (soudage, meulage, coupage…)\nLes substances ou préparations facilement inflammables ne doivent pas être déposées sur et sous les escaliers, les passages et les couloirs, ainsi qu’à proximité des issues des locaux et des bâtiments (article R. 232-12-15 du CdT).\n\n",null),
("137","116","Installer des dispositifs de désenfumage dans les zones qui le nécessitent.",null),
("138","117","Mettre en place une consigne incendie\nUne consigne de sécurité doit être établie et affichée de manière apparente :\n-dans chaque local pour les locaux dont l’effectif est supérieur à 5 personnes ou pour les locaux présentant des risques spécifiques.\n-dans chaque local ou dégagement desservant un groupe de locaux dans les autres cas.  \nCes consignes comportent la liste du matériel de secours et d’extinction, la désignation du personnel chargé de prévenir les secours, les moyens d’alerte et d’évacuation et obligent toute personne apercevant un début d’incendie à donner l’alerte et mettre en œuvre les moyens de premiers secours.",null),
("139","118","AFFICHAGE:\nMettre en place des plans d’évacuation.\nLe plan d’évacuation joue un rôle crucial dans les situations de danger. Celui-ci permet de rendre l’évacuation des personnes plus rapide et plus sûre en schématisant les lieux de rassemblement et les cheminements vers les sorties. Il est conçu en tenant compte de l’agencement des lieux, du nombre de personnes à évacuer, de la présence éventuelle de personnes à mobilité réduite ainsi que de la localisation des issues et escaliers de secours.\nIl représente également les moyens d’alarme et d’extinction. Ils doivent être affichés à proximité des ascenseurs et des escaliers. On peut également retrouver dessus les consignes de sécurité incendie.",null),
("140","119","Dégager les issues d’évacuation.\nLes locaux doivent être aménagés de telle sorte à permettre une évacuation rapide et en toute sécurité du personnel. Pour ce faire, les dégagements (escaliers, couloirs, portes...) doivent être toujours dégagés. ",null),
("141","120","OUVERTURE:\nInstaller un dispositif dé-verrouillable sans clef.\nLorsqu’il s’agit d’une évacuation de plus de 50 personnes, l’ouverture des portes doit se faire vers l’extérieur. Dans tous les cas, l’ouverture doit être possible facilement. De même, les portes verrouillées doivent être manœuvrables de l’intérieur et sans clé. ",null),
("142","121","L’escalier doit être équipé de rampes sur le côté. Il doit avoir une pente permettant un accès en toute sécurité et les marches doivent respecter les caractéristiques réglementaires.\n-Elles ne sont pas glissantes.\n-S\'il n\'y a pas de contremarche, les marches successives se recouvrent de 5 centimètres.\n-Il est interdit de placer une ou deux marches isolées dans les circulations principales.\n-Les dimensions des marches des escaliers sont conformes aux règles de l\'art.\n-Les volées ne comptent pas plus de 25 marches.\n-Les paliers ont une largeur égale à celle des escaliers et, en cas de volées non contrariées, leur longueur est supérieure à 1 mètre.\n-Les escaliers tournants sont à balancement continu sans autre palier que ceux desservant les étages.\n-Les dimensions des marches sur la ligne de foulée à 0,60 mètre du noyau ou du vide central sont conformes aux règles de l\'art.\n",null),
("143","122","Les établissements recevant plus de 50 personnes simultanément, et ceux, quelle que soit leur importance, où sont manipulées et mises en œuvre des matières inflammables doivent être équipés d’un système d’alarme sonore.\nÉquiper le bâtiment d\'un système d\'alarme sonore.\n",null),
("144","123","Réparer les BAES en dysfonctionnement.\nL\'éclairage de sécurité doit être fixe et assurer l\'éclairage pour l\'évacuation, l\'éclairage d\'ambiance (ou antipanique) et permettre la mise en oeuvre des mesures de sécurité et l\'intervention des secours.",null),
("145","124","L’évaluation des risques a pour but d’identifier les situations propices au risque de chutes de plain-pied, de manière à définir des actions de prévention permettant de traiter au mieux les causes et contextes favorables à la survenue des accidents.\n\nSi l’implication des agents dans l’évaluation des risques est toujours préconisée, elle est particulièrement nécessaire s’agissant des chutes de plain-pied. Les causes de ces accidents sont rarement manifestes et leurs circonstances de survenue sont étroitement liées au contexte global des tâches à réaliser. ",null),
("146","125","Si présence d\'une fosse de visite:\n• La supprimer (il est conseillé de disposer de ponts élévateurs) \n• Réserver l’accès uniquement aux agents formés\n• Mettre en place un dispositif de protection adapté à l’utilisation de la fosse\n• Compléter ce dispositif par un balisage si possible physique (gardes-corps fixes ou escamotables associés à un pourtour de bandes\nde couleurs contrastées et anti-dérapantes)\n• Prévoir un dispositif de guidage des roues pour faciliter les allers et venues des véhicules",null),
("147","126","Il existe deux moyens de protéger les salariés des risques de glissades :\n- rendre le sol antidérapant (protection collective).\n- imposer le port de chaussures antidérapantes (protection individuelle)\nDans les conditions de travail propices aux chutes de plain-pied (sols souvent humides ou rendus glissant à la suite du renversement d’un produit de denrées alimentaires, de liquides techniques, d’hydrocarbures ou huiles…, comme dans la restauration, les industries agroalimentaires, garages, stations-services …), le travailleur doit être équipés de chaussures ou mocassins antidérapants et les sols doivent être couverts de résine ou de revêtements antidérapants.\nMais, sans une bonne tenue des locaux, ces mesures préventives comme l’installation de revêtements de sol perfectionnés, le port de chaussures antidérapantes ne seront jamais tout à fait efficaces.",null),
("148","127","Ranger et/ou nettoyer la zone.\nUne mauvaise organisation du travail, le désordre, l’absence d’espace de travail distinct..., peuvent être à l’origine de nombreux risques d’accidents, d’incendies, de chutes ou encore de coupures.\nL’aménagement des locaux influe directement sur les conditions de travail. En effet, quand un atelier ne permet pas de ranger les différents équipements, matériels et outils, il est alors difficile de trouver les bonnes pratiques et de faire respecter les consignes d’hygiène et de sécurité.\nC’est pourquoi, il faut aménager les locaux en tenant compte de la réglementation applicable et des activités qui y sont réalisées.",null),
("149","128","Intégrer au document unique, l\'évaluation des risques liés aux chutes de hauteur.",null),
("150","129","MAIN COURANTE:\nInstaller une ou deux main-courante selon la largeur de l\'escalier.( deux si la largeur>1,50m)\n\nLes mains courantes ou rampes d\'escalier ont une fonction de prise en main et de guidage en prévention et protection contre les risques de chutes. ",null),
("151","129","CONCEPTION:\nLes marches doivent obéir aux caractéristiques suivantes :\n1° Elles ne sont pas glissantes ;\n2° S\'il n\'y a pas de contremarche, les marches successives se recouvrent de 5 centimètres ;\n3° Il est interdit de placer une ou deux marches isolées dans les circulations principales ;\n4° Les dimensions des marches des escaliers sont conformes aux règles de l\'art ;\n5° Les volées ne comptent pas plus de 25 marches ;\n6° Les paliers ont une largeur égale à celle des escaliers et, en cas de volées non contrariées, leur longueur est supérieure à 1 mètre ;\n7° Les escaliers tournants sont à balancement continu sans autre palier que ceux desservant les étages ;\n8° Les dimensions des marches sur la ligne de foulée à 0,60 mètre du noyau ou du vide central sont conformes aux règles de l\'art ;\n9° Le giron extérieur des marches est inférieur à 0,42 mètre.",null),
("154","130","Installer des garde-corps.\nLa prévention des chutes de hauteur à partir d’un plan de travail est assurée : \nSoit par des garde-corps intégrés ou fixés de manière sûre, rigides et d’une résistance appropriée, placés à une hauteur comprise entre un mètre et 1,10 m et comportant au moins \n-une plinthe de butée de 10 à 15 cm, en fonction de la hauteur retenue pour les garde-corps\n-une main courante\n-une lisse intermédiaire à mi-hauteur \nSoit par tout autre moyen assurant une sécurité équivalente.\nLa mise en place de système type barrière écluse permet de sécuriser la zone d’accès. ",null),
("156","131","FORMATION CONDUITE:\nSi une nacelle est utilisée par les agents, s’assurer que pour sa manipulation, ceux-ci (au moins deux: un dans la nacelle, un au sol) soient formés à la conduite en sécurité de ce type d’engin et soient autorisés à le conduire.\nLe surveillant n\'est pas obligé d\'avoir un CACES PEMP, mais doit avoir été formé (en interne par un collègue titulaire du CACES par exemple) aux modalités de secours le cas échéant.Cette formation d\'utilisation des PEMP doit être enregistrée et tracée. Ensuite l\'employeur peut lui délivrer une autorisation de conduite restrictive au sol.\nCette formation doit être renouvelée aussi souvent que nécessaire et peut être réalisée par un organisme de formation spécifique.",null),
("157","131","FORMATION E.P.I:\nToute personne devant intervenir en hauteur avec des EPI doit être formée pour connaître les différents EPI ainsi que leurs fonctions, savoir les utiliser et être capable de les mettre en œuvre en toute sécurité (conformément aux spécifications du fabricant).",null),
("158","131","E.P.I:\nLa nacelle équipée de ses garde-corps constitue un plan de travail muni d\'une protection collective contre le risque de chute de hauteur. Le port du harnais n’est donc pas réglementairement obligatoire.\nToutefois, les règles d\'utilisation de la PEMP déterminées par le constructeur et définies dans la notice d’instructions doivent être respectées, ce qui peut comprendre le port d\'EPI et les conditions de leur mise en œuvre (liaison, harnais, points d’accrochage). Dans ce cas la longe utilisée doit être suffisamment courte pour assurer la retenue de l\'opérateur, c\'est à dire empêcher son éjection par dessus le garde-corps.",null),
("160","132","VÉRIFICATION PÉRIODIQUE\nS’assurer de la vérification périodique de ces équipements de protection (12 mois)\nElle porte sur :\n- l\'état général des coutures et des modes de fixation (sangles, boucles, mousquetons, …),\n- les conditions de stockage qui doivent être conformes aux préconisations du constructeur indiquées dans la notice d\'instruction\n- la date de péremption de l\'équipement (définie par le fabricant).\nAssurer une traçabilité de ces vérifications.",null),
("161","132","MISE A DISPOSITION\nS’assurer de la mise à disposition d’EPI contre les chutes de hauteur lorsque les activités le nécessitent.\nLes équipements de protection individuelle contre les chutes sont composés de trois parties : un harnais, un système de liaison\net un dispositif d’ancrage.\n",null),
("163","133","FORMATION/NOTICE:\nS’assurer que le montage de cet équipement est effectué  par ou sous la direction d’une personne désignée ayant reçu la formation réglementaire et disposant de la notice et du plan de montage du fabricant. Ces documents étant conservés sur les lieux de travail. Aucune personne ne doit se trouver sur échafaudage roulant lors de son déplacement.",null),
("165","134","ETAT:\nS’assurer que les dispositifs antidérapants de toutes les échelles et escabeaux utilisés sont bien présents.\nS’assurer de leur bon état ( solidité, résistance...) et que leurs règles d’utilisation sont respectées.\nS’assurer que toute échelle contrôlée et identifiée comme ’Hors-service’ ne puisse plus être utilisée.",null),
("167","134","UTILISATION ECHELLE:\nS’assurer, qu’une réflexion sur les mesures de prévention à mettre en œuvre pour les activités d\'élagage, d\'accrochage des illuminations de noël soit menée, privilégier l’utilisation de matériels type manche télescopique, PIR (Plates-formes Individuelles Roulantes), nacelle élévatrice, sinon s’assurer que les échelles soient bien conformes et équipés de dispositifs antidérapants mais aussi que l’évaluation a démontré que le risque est faible et que les interventions sont de courtes durées ou une impossibilité technique de faire autrement.",null),
("168","135","Faire un inventaire des manutentions manuelles et initier un plan d’action.\nL’objectif est de transformer les situations de travail pour réduire les contraintes qui pèsent sur les opérateurs. ",null),
("169","136","Prévoir des moyens mécaniques (équipements de manutention et / ou levage) adaptés et en nombre suffisant.\nEnvisager d’investir dans des équipements de manutention supplémentaires en fonction des besoins des agents (exemples : transpalettes, fûts de lubrifiants sur roues, sommier roulant pour mécanique auto, brouette, gerbeur (semi) automatiques électrique, diable, dessertes à roulettes, chariots de ménage etc.).\nCes équipements seront choisis compte tenu des résultats de l’évaluation des risques professionnels, en concertation avec les agents utilisateurs.\n",null),
("170","136","RESTAURATION:\nPour les agents de restauration, essayer de faire livrer la marchandise au plus près, commander plus régulièrement et en moins grande quantité, prévoir un rangement suffisant et à hauteur pour éviter le stockage en haut ou en partie basse.\nUtilisation de dispositifs d’aide à la manutention (brouette, diable, dessertes...)",null),
("171","137","Former les agents sur les gestes et postures à adopter pour accomplir en sécurité les manutentions manuelles.\nInformer les agents sur les risques encourus lorsque les activités ne sont pas réalisées de manière techniquement correcte.\n-Information sur les charges manipulées : poids, centre de gravité…\n-Formation générale des agents à la sécurité (nouveaux embauchés, travailleurs temporaires, stagiaires, agents ayant changé de poste) complétée par une formation spécifique relative aux manutentions. Il s’agit d’une formation théorique et pratique visant à former les agents\naux gestes à adopter pour manutentionner en sécurité.\nCette formation spécifique s’adresse à tous les agents appelés à effectuer des manutentions manuelles, même si celles-ci restent exceptionnelles.",null),
("172","138","Organiser le poste de travail afin de supprimer ou de diminuer les manutentions.\nÉquiper les charges de moyens de préhension :poignées, ventouses, …\nToujours travailler en équipe lors de la manutention de charges lourdes et encombrantes, afin de diviser la charge de travail et de préserver la santé des agents.\nEssayer de prendre les mesures d’organisation appropriées et les moyens nécessaires pour éviter la manutention manuelle de charges. ",null),
("173","139","Dès lors que l’engin est présent sur les voies ouvertes à la circulation publique, le Code de la Route s’applique dans son entier.\nAucune dérogation n’est valable, même si la collectivité est rurale. \nLorsqu’un article prévoit une dérogation pour les exploitations agricoles, les collectivités ne sont pas concernées.\nConcernant le contrôle de la validité des permis de conduire des agents, l’Autorité territoriale pourrait mettre en place un règlement intérieur de sécurité dans lequel serait précisé l’obligation faite à tout agent de signaler un éventuel retrait de permis à sa hiérarchie.",null),
("176","140","Le dispositif FIMO / FCO s\'applique à l’exception des conducteurs : (entre autres)\n- des véhicules transportant du matériel ou de l\'équipement, à utiliser dans l\'exercice du métier de leur conducteur, à condition que la conduite du véhicule ne représente pas l\'activité principale du conducteur. \nEn effet on peut penser que ce cas concerne les agents conduisant des poids lourds à titre exceptionnel, aux fins de transporter le matériel ou l’outillage nécessaire à leurs tâches.\nPar conséquent, une appréciation au cas par cas des conditions d’utilisation des véhicules concernés doit prévaloir.\nIl faut donc être attentif aux fonctions et attributions réelles des agents.\n",null),
("177","141","Mettre en place ou compléter la signalisation des zones de danger.\nLa signalisation est un outil primordial pour la prise en compte des dangers par les travailleurs car elle donne une indication sécurité et santé. \nElle est présente pour compléter les mesures de prévention et de protection mise en place par l’employeur. ",null),
("178","142","MISE A DISPOSITION:\nS’assurer que les vêtements haute visibilité de signalisation sont mis à disposition des agents et sont portés.\nLa signalisation des personnes est une obligation préalable à toute intervention sur le domaine routier. Le port de vêtements de haute visibilité est obligatoire pour l’ensemble du personnel intervenant sur la voie publique.\nToute personne intervenant à pied sur le domaine routier à l’occasion d’un chantier doit revêtir un vêtement de signalisation à haute visibilité classe 2 (chasubles et gilets) ou 3 (combinaisons, vestes + pantalons).",null),
("181","143","SIGNALISATION VÉHICULES/ENGINS:\nS’assurer que tous les véhicules intervenant habituellement sur la chaussée disposent d’une signalisation apposée à l’avant, à l’arrière et de chaque coté  composée de bandes réfléchissantes biaises alternées rouges et blanches.\n\nS’assurer que tous les véhicules lents ou d’avertissement intervenant sur les chantiers mobiles temporaires sont équipés d’un panneau triangulaire type AK5 tri-flash visible de l’avant et de l’arrière (tri-flash non obligatoire pour les arroseuses, balayeuses et les bennes à ordures ménagères)\n\nS’assurer que les engins de chantier dont la vitesse maximale n’excède pas 30km/H disposent d’un gyrophare lorsqu’ils évoluent sur la voie publique.",null),
("184","144","STOCK:\nQuelle que soit leur taille, les chantiers routiers doivent faire l’objet d’une signalisation temporaire, mise en place avant tout début de travaux sur la voie publique.\nEn cas d’insuffisance de la signalisation temporaire des chantiers, la responsabilité de l\'Autorité Territoriale et de la collectivités sera engagée. De plus en dehors du cadre strict de l’accident de travail, un tiers accidenté peut, également, demander réparation (au titre de la responsabilité civile et/ou pénale) à la collectivité en cas de faute.",null),
("185","144","FIN DE PRESCRIPTION:\nCommander des panneaux de fin de prescription.\nPlacée en aval du danger ou du chantier, cette signalisation marque la fin des prescriptions imposées. Elle est en principe située en dehors de la chaussée, sur l’accotement. Elle se compose d\'un ou plusieurs panneaux de fin de prescription (panneaux type B). \n",null),
("186","145","Les agents doivent être informés des risques qu’ils encourent lors de travaux sur la voie publique. De plus, afin d’éviter les mauvais positionnements de panneaux il convient de former un nombre judicieux d’agents à la signalisation de chantier. (formations CNFPT inscrites au catalogue)\nUne solution peut consister à mettre en place dans les véhicules une fiche récapitulant les principales règles de balisage de chantier sur ou en bordure de la voie publique.  ",null),
("188","146","Voir la possibilité d’installer une séparation entre la cabine et la cargaison\nLa cloison de séparation évite les transferts de charge. Il faut savoir que le moindre objet transporté dans la caisse de chargement d’un véhicule utilitaire peut devenir un réel danger pour la vie du conducteur et de ses passagers en cas de collision ou de freinage brutal.\nUne cloison de séparation, pleine ou avec un hublot, a plusieurs vertus : elle arrête une partie des bruits et des odeurs (éventuellement des émanations toxiques de produits transportés), elle évite les déperditions de climatisation et de chauffage. Par ailleurs, elle arrête en cas de choc les petits objets projetés.",null),
("189","147","Réaliser un plan d’arrimage\nL’arrimage en sécurité ne peut résulter de l’implication d’un seul opérateur: il nécessite une démarche qui couvre les matériels, l’organisation et les hommes.\nLes étapes essentielles pour atteindre ces objectifs sont:\n- la formation des opérateurs intervenant dans l’arrimage\n- la réalisation du plan d’arrimage\n- et la mise à disposition du matériel adapté\nRéaliser l’arrimage en fonction des caractéristiques du chargement et des sollicitations extrêmes auxquelles il risque d’être soumis lors de la circulation routière afin d’éviter tout déplacement intempestif des charges transportées.",null),
("191","148","Le véhicule doit être adapté à son utilisation (dimension, capacité, puissance…) , de la carrosserie appropriée, munie des points d’arrimage et des équipements spécifiques qui sont nécessaires pour transporter le chargement en toute sécurité.",null),
("193","150","Acquérir des matériels conformes,\nMaintenir ces équipements en état de conformité,\nMettre en conformité les équipements les plus anciens.",null),
("194","151","Effectuer la vérification et l’entretien necessaire à la machine contrôlée",null),
("195","152","Acquérir des matériels conformes,\nMaintenir ces équipements en état de conformité,\nMettre en conformité les équipements les plus anciens.",null),
("196","153","Mettre à disposition des travailleurs les notices d’instruction\nLorsque des risques résiduels subsistent, le fabricant doit en avertir l’utilisateur de façon explicite. \nIl doit apposer les avertissements appropriés sur la machine : il peut notamment utiliser des pictogrammes compréhensibles par tous.",null),
("197","154","L’information concernant les travailleurs chargés de la mise en œuvre ou de la maintenance des équipements de travail doit porter sur les points suivants :\n-Conditions d’utilisation ou de maintenance\n-Instructions ou consignes\n-Conduite à tenir face aux situations anormales prévisibles\n-Conclusions tirées de l’expérience acquise permettant de supprimer certains risques",null),
("198","154","Les vérifications périodiques ne se substituent pas à l’obligation d’effectuer les opérations de maintenance définies par le fabricant de la machine. Il est d’ailleurs fortement recommandé d’enregistrer les opérations de maintenance des machines dans un carnet de maintenance.",null),
("199","155","Maintenir en état de conformité tous les équipements de travail",null),
("200","156","Maintenir l’engin en conformité avec la règlementation",null),
("201","157","SIGNALISATION COMPLÉMENTAIRE:\nLes véhicules travaillant habituellement sur la chaussée peuvent être peints en orange ou en une couleur claire et doivent porter une signalisation complémentaire (Bandes de couleur rouge et blanche : les bandes horizontales doivent être à une hauteur inférieure à 1,5 m)",null),
("202","158","Effectuer la VGP des engins qui le nécessitent\nLa Vérification Générale Périodique (VGP) est une obligation légale pour les engins de chantiers et de levage. Les vérifications générales périodiques ont pour objectif de déceler, en temps utile, toute détérioration susceptible de créer des dangers. Il doit être remédié aux défauts constatés conformément à l’obligation de sécurité, notamment à l’obligation de maintien en état de conformité.\nLes engins « de levage » déplacent et lèvent (changement de niveau significatif) des marchandises ou des matériels. La vérification périodique est obligatoire tous les 6 mois. \nLes engins de « manutention » déplacent et lèvent des produits non conditionnés (Fumier, terre, fourrage...) : La vérification périodique est obligatoire tous les ans. \nEn règle générale, les automoteurs (télescopiques) sont à vérifier tous les 6 mois, alors que la majorité des chargeurs fronteaux montés sur tracteur sont à contrôler tous les 12 mois.",null),
("203","159","Faire contrôler le pulvérisateur.\nLe premier contrôle d’un pulvérisateur doit intervenir au plus tard cinq ans après sa première mise sur le marché.\nÀ partir du 1er janvier 2014, les matériels déjà contrôlés sur la période 2009-2013 doivent renouveler leur contrôle, cinq ans après le contrôle précédent. La date limite de validité est poinçonnée sur la vignette.\n",null),
("204","160","Former le ou les agents à la conduite en sécurité de la tondeuse autoportée.\nLa réglementation prévoit une formation adéquate pour tous les conducteurs affectés sur des équipements mobiles automoteurs.\nDe nombreuses collectivités sont équipées de cet équipement de travail. Pour autant, la manipulation de ce matériel ne s’improvise pas et nécessite des règles d’utilisation strictes. ",null),
("205","161","Équiper la ou les tondeuses autoportées d\'un gyrophare pour les déplacements sur voie publique.\nIl doit être placé de telle sorte qu\'il soit visible à 50 m tous azimuts.",null),
("206","162","Equiper la tondeuse auto-portée d’une structure anti-retournement",null),
("207","163","Deux cas de figures sont possibles en fonction des caractéristiques établies par le constructeur :\n- la tondeuse autoportée est homologuée selon le Code de la route (avec procès verbal de réception), son conducteur peut donc circuler sur la chaussée, si elle est immatriculée et équipée de la signalisation réglementaire.\n- La tondeuse autoportée n’est pas homologuée selon le Code de la route (pas de procès verbal de réception et pas d’immatriculation), son conducteur ne peut donc pas circuler sur la chaussée. \nDans ce cas, se rapprocher dans un premier temps du fournisseur ou fabricant pour savoir s’il existe des kits d’homologation qu’il pourrait installer,\ndans le cas contraire, transporter la tondeuse sur un véhicule ou une remorque adaptés. ",null),
("208","164","S\'assurer, auprès du service des mines de la DREAL,  que l\'Engin de Service Hivernal (ESH) nécessite bien le besoin d\'être réceptionné et contrôlé.\nLa Réception à Titre Isolé est une Immatriculation de l’ESH en configuration de travail VH (avec tous ses outils) avec contrôle par le Service des mines de la DREAL, avec l\'objectif de vérifier la conformité aux règles de sécurité des véhicules et des personnes dès lors que leurs dimensions et poids dépassent la normale (art. R312-4 du code de la route ).",null),
("209","165","Les engins de service hivernal étant des véhicules à progression lente, ils doivent être équipés d’un dispositif lumineux d’identification à faisceau stationnaire et clignotant, placé à l’avant du véhicule, en partie supérieure.\nLes feux bleus à éclat sont fortement recommandés (dits de catégorie B). Ces feux, qui ne peuvent être utilisés que lors du déneigement, signalent aux usagers qu’ils doivent faciliter la progression du véhicule. Ces feux n’accordent pas une priorité de passage contrairement à ceux utilisés sur les véhicules prioritaires (Gendarmerie, police, pompiers…).\nLes feux oranges (gyrophare) doivent également être présents, pour indiquer aux usagers d’être prudents face au véhicule.\nEn aucun cas, ces deux types de feux ne peuvent être utilisés de façon simultanée. En dehors de la période hivernal, ces feux doivent être masqués.\n",null),
("210","166","Former le ou les agents à la conduite en sécurité de l’ESH et de son équipement",null),
("211","166","Autoriser la conduite de l’ESH aux personnes qui disposent du permis correspondant au type de véhicule.",null),
("212","167","S\'assurer de la conformité de la lame de déneigement.",null),
("213","167","Fiche de constitution d’un dossier de réception à titre isolé de véhicule en application du code de la route.\nhttp://www.developpement-durable.gouv.fr/IMG/pdf/RTI03-5-8_062011_Engin_Service_Hivernal.pdf",null),
("214","168","La prise en compte du risque chimique passe par l’inventaire des produits chimiques et des nuisances (en identifiant leurs dangers), leur évaluation au poste de travail et la mise en place de mesures de prévention adaptées au risque évalué.\nContrairement aux risques à effet immédiat, le risque chimique est, a priori, \"invisible\". Il doit pourtant être évalué et annexé au document unique d’évaluation des risques.\nL\'INRS et ses partenaires ont développé le logiciel Seirich (Système d’évaluation et d’information sur les risques chimiques en milieu professionnel). Il permet aux entreprises de s’informer et d’évaluer leurs risques chimiques. C’est un outil modulaire, développé pour tous quelles que soient leurs connaissances sur les risques chimiques ou la taille de l’entreprise.",null),
("215","169","Initier une formation des agents appropriée, sur les agents chimiques dangereux se trouvant sur le lieu de travail intégrant notamment les noms, les risques pour la santé et la sécurité qu’ils comportent .\nIl est nécessaire également de mettre à disposition des agents des consignes techniques d’utilisation des produits. Vous pouvez vous rapprocher de vos fournisseurs qui sont susceptibles de vous les fournir.",null),
("217","170","PRÉSENCE:\nLa présence et la lecture des FDS (devant être transmises gratuitement par les fournisseurs) est indispensable; elles permettent, entre autre,  d’informer les utilisateurs sur les différents équipements de protection à utiliser et les conduites à tenir en cas d’accident.\nCes fiches doivent être à disposition des utilisateurs, par exemple sur le lieu de stockage.\nAttention l’utilisation de produits  100% naturels ne signifie pas que le produit n’est pas dangereux (la FDS vous donnera les indications sur les règles de sécurité à respecter)",null),
("220","171","Lister les agents exposés aux produits phytosanitaires, à certaines peintures classées CMR et aux poussières de bois.\nTransmettre la liste au médecin de prévention.\n",null),
("221","172","Initier une démarche de substitution des produits les plus dangereux.\nEn matière de prévention des risques liés aux agents chimiques dangereux (ACD) et aux agents cancérogènes, mutagènes ou toxiques pour la reproduction de catégorie 1 ou 2 (CMR), la recherche de substitution est une obligation qui s’impose à l’employeur et prévaut sur toutes les autres mesures de réduction du risque, lorsque celui-ci n’a pu être supprimé.",null),
("222","173","Mettre à disposition des agents des notices de poste (consignes techniques d\'utilisation des produits). \nCes consignes doivent être rédigées par l’employeur sur la base des F.D.S. Elles regroupent les risques liés au produit, les\nbonnes pratiques à respecter (dilution conduite à tenir en cas de projection , d’accident…); les pratiques à bannir et les\nprotections à mettre en œuvre (E.P.I. …). \nVous pouvez vous rapprocher de vos fournisseurs qui sont susceptibles de vous les fournir.\nUn document type est téléchargeable sur le site de la CNRACL à l\'adresse:\nhttps://www.cdc.retraites.fr/outils/RUSST/\n\n",null),
("223","174","Mettre en place un dispositif de captage des poluants.\nLa mise en place de dispositifs de captage des polluants au plus près de leurs points d’émission permet d’éviter que ceux-ci ne soient mis en suspension dans l’air et inhalés par les opérateurs. La ventilation générale ne peut être envisagée en tant que technique principale d’assainissement de l’air que si le recours à une ventilation locale est techniquement impossible ou lorsque les polluants sont peu dangereux et émis à un très faible débit.\nCes mesures de protection collective peuvent être d’ordre organisationnel ou technique. Elles doivent être mises en œuvre en priorité à des mesures de protection individuelle.",null),
("224","174","Revoir l’efficacité du dispositif de captage des poluants.\nLa mise en place de dispositifs de captage des polluants au plus près de leurs points d’émission permet d’éviter que ceux-ci ne soient mis en suspension dans l’air et inhalés par les opérateurs. La ventilation générale ne peut être envisagée en tant que technique principale d’assainissement de l’air que si le recours à une ventilation locale est techniquement impossible ou lorsque les polluants sont peu dangereux et émis à un très faible débit.",null),
("225","175","S’assurer que des équipements de protection contre les projections (lunettes, masque), manipulations (gants, blouses, tabliers..) sont à disposition des agents et sont portés.",null),
("226","175","Pour l’utilisation des produits phytosanitaires ou de certaines peintures, s’assurer que les agents portent les EPI adaptés dès la préparation du traitement, durant le traitement et jusqu’au rinçage du matériel.",null),
("227","176","LOCAL:\nEviter au maximum la diversification et l’accumulation des produits (se limiter au strict nécessaire) et respecter les consignes d’utilisation et de stockage (contenants étiquetés correctement) \nStockage réglementaire:\n - dans un local dédié (fermé à clé, ventilé naturellement ou mécaniquement, pourvu d’un sol imperméable)\n - avec des modalités de rangement respectant les incompatibilités des produits (certains mélanges pouvant dégager des vapeurs nocives voire hautement dangereuses)\n - prévoir un dispositif de rétention aux fuites éventuelles \n - présence des fiches FDS à demeure sur le  lieu de stockage\nEviter de multiplier les sites de stockage et gérer au mieux les volumes de stockage\nEviter la présence de source d’ignition (tableau électrique...)",null),
("228","177","Établir la liste des activités d’ordre électrique (en priorité les activités visées par la 2ème catégorie de personnel) et la liste des personnes qui les réalisent, définir les formations nécessaires en fonction des activités réalisées.",null),
("229","178","S\'assurer que seuls les agents disposants de l\'habilitation électrique , à jour de recyclage, interviennent sur les ouvrages électriques.\n\nProcéder au recensement de toutes les activités qui demandent d\'intervenir sur des ouvrages électriques et identifier les titres d\'habilitations nécessaires (cf tableau en annexe) pour les agents.\nS\'assurer de la validité des habilitations en cours.\nInscrire rapidement les agents identifiés à une prochaine session de formation.",null),
("230","179","VÉRIFICATION:\nFaire réaliser annuellement une vérification périodique des installations électriques.\nToutefois, le délai entre deux vérifications peut être porté à deux ans si le rapport précédent ne présente aucune observation ou si, avant l\'échéance, le chef d\'établissement a fait réaliser les travaux de mise en conformité de nature à répondre aux observations contenues dans le rapport de vérification.\nLa vérification périodique est réalisée soit par un organisme accrédité, soit par une personne qualifiée appartenant à la collectivité (personne justifiant d’une formation juridique et technique, d’une pratique régulière de l’activité de vérification et de la capacité à rédiger les rapports).\n",null);
INSERT INTO preconisation VALUES
("231","180","Les locaux ou emplacements présentant un risque de choc électrique doivent être délimités aux moyens d’obstacles et signalés au moyen d’un panneau d’avertissement réglementaire du danger électrique. L’accès à ces locaux ou emplacements est réservé aux personnes habilitées.",null),
("232","181","EVALUATION RISQUE BRUIT:\nEvaluer les risques d’exposition au bruit qui subsistent et mettre en place des mesures de protection des travailleurs exposés. \nAu préalable, il est important de bien comprendre et de caractériser l’exposition des salariés sur leur lieu de travail (sources de bruit, mode de propagation, exposition des travailleurs). \nLa réglementation française impose de mettre en place des actions de prévention et de protection spécifiques en fonction des niveaux sonores d’exposition : évaluation et mesurage si nécessaire des niveaux de bruit auxquels les travailleurs sont exposés, mise à disposition des salariés de protecteurs individuels (casque antibruit, bouchons d’oreille) au-delà de certains seuils d’exposition, mise en œuvre d’un programme de réduction de l’exposition au bruit.\n",null),
("233","182","MISE A DISPOSITION:\nEn cas d\'impossibilité d\'éviter les risques dus à l\'exposition au bruit par d\'autres moyens et lorsque l\'exposition au bruit dépasse les valeurs d\'exposition inférieures, des protecteurs auditifs individuels, appropriés et correctement adaptés, sont mis à la disposition des agents\nLes protecteurs individuels contre le bruit (PICB) reposent tous sur le même principe : former un obstacle à l\'accès des ondes sonores dans l\'appareil auditif. \nDans la pratique, on distingue deux catégories de matériels :\n-les protecteurs avec coquilles englobant  le pavillon de l’oreille et formant ainsi un obstacle. Ils se déclinent en trois types : « casques anti-bruit », aussi appelés « serre-tête », « coquilles montées sur casque » et « coquilles serre-nuque » aussi appelées « serre-nuque ».\n-les bouchons d\'oreilles qui obstruent le conduit auditif. Ils peuvent être en mousse, pré-moulés en silicone, en cire formable, ou enfin sur-mesure c’est-à-dire moulés individuellement",null),
("234","183"," FORMATION:\nOrganiser la formation professionnelle des agents aux risques liés aux postes de travail en fonction du niveau d’exposition et réaliser des actions de sensibilisation au port des équipements de protection adaptés.\n",null),
("235","184","SUIVI MEDICAL:\nLes agents exposés au bruit dans les conditions prévues au 2° de l\'art.R4434-7 du CT (\"...lorsque l\'exposition au bruit égale ou dépasse les valeurs d\'exposition supérieures...\"), bénéficient d\'une surveillance médicale renforcée.",null),
("236","185","MESURES:\nSi l\'évaluation en identifie la nécessité, des mesures de niveaux de bruit auxquels les agents sont exposés sont réalisées; elles doivent permettre, dans une situation donnée, de constater si les valeurs limites d\'exposition sont dépassées. Ces mesures sont réalisées par des personnes compétentes. Les résultats sont communiqués au médecin de prévention.\n",null),
("237","186","EVALUATION DES RISQUES:\nL\'employeur doit évaluer le risque biologique au sein de tous ses services.  Pour toutes activités susceptibles de présenter un risque d\'exposition à des agents biologiques, l\'employeur détermine la nature, la durée et les conditions de l\'exposition des agents\nExaminer si l’exposition est possible par voie aérienne (inhalation de poussières ou de gouttelettes contaminées), par pénétration à travers la peau et les muqueuses, par contact avec la peau ou les muqueuses, par inoculation accidentelle (microblessure, piqûre, coupure…), ou par voie digestive (en portant les mains ou un objet contaminé à la bouche).\nUne fois réalisée l’identification des situations dangereuses liées à un type d’activité, il convient pour chacune d’entre elles de tenir compte de la gravité des dommages potentiels et d’estimer la probabilité d’apparition. Cela permet de hiérarchiser les risques afin de déterminer les mesures de prévention à mettre en place de façon prioritaire.",null),
("238","187","PREVENTION:\nL\'employeur doit définir des mesures de prévention qui vont permettre de rompre la chaîne de transmission en intervenant sur l’un des différents maillons que sont  la source de l’infection, le mode de transmission et l’agent potentiellement exposé. \nAGIR SUR LA SOURCE: ( nettoyage des locaux et du matériel pour assurer un bon niveau d’hygiène, désinfection régulière des locaux ,   lutte contre la prolifération  des insectes et rongeurs pouvant diffuser un agent pathogène.) \nAGIR SUR LE MODE DE TRANSMISSION: (assurer la ventilation  et l’assainissement de l’air , limiter la mise en suspension de poussières ou de particules humides, installer des armoires individuelles avec séparation vêtements de ville et vêtements de travail,  prévoir des installations sanitaires )\nAGIR SUR L\'INDIVIDU:(fournir les EPIs adaptés (gants, lunettes, ...), former  les agents à l’utilisation des moyens de protection, les informer  sur les dangers, rappeler les mesures d\'hygiène individuelle)\n",null),
("239","188","SURVEILLANCE MEDICALE:\nUne surveillance médicale particulière est prescrite pour les seuls agents suivants: • personnes reconnues travailleurs handicapés;  • femmes enceintes;  • agents réintégrés après un congé de longue maladie ou de longue durée;  • agents occupant des postes dans des services comportant des risques spéciaux;  • agents souffrant de pathologies particulières.",null),
("240","188","SURVEILLANCE MEDICALE:\nLe médecin du travail est juge des modalités de la surveillance médicale renforcée, en tenant compte des recommandations de bonnes pratiques existantes. Cette surveillance comprend au moins un ou des examens de nature médicale selon une périodicité n’excédant pas vingt-quatre mois.\nSeuls les travailleurs classés en catégorie A (exposition aux radiations ionisantes) restent soumis à un examen médical annuel.",null),
("241","189","INSTRUCTION:\nDéterminer une procédure sur la conduite à tenir en cas d’accident ou d’incident grave mettant en cause un agent biologique: - exposition au sang ou à des produits biologiques, - exposition aux eaux usées, - morsure par animal, ...etc\nL\'instruction devra préciser comment est assurée la gestion des secours.\n",null),
("242","190","Les effets nocifs dépendent des propriétés physiques des vibrations (fréquence et amplitude), de la durée d’exposition, de la posture, des efforts exercés par l’opérateur, du froid et de l’humidité, ainsi que du mode de transmission au corps. Les affections vasculaires, neurologiques et ostéoarticulaires liées à l’exposition aux vibrations sont reconnues comme maladies professionnelles au titre des tableaux n°69 du régime général de la Sécurité Sociale. De même que les lombalgies liées à l’exposition aux vibrations (tableau 97).\nRéduction de l’intensité vibratoire et de sa transmission \n- outils générant des niveaux vibratoires plus faibles \n- dispositifs d’amortissement des vibrations : poignées antivibratiles, gants anti-vibratiles... \n- système de suspension des cabines de conduite \n- planchers anti-vibratiles \n- sièges à faible fréquence de résonance \n- contrôle et entretien des outils et engins : bon état du siège remplacer les sièges obsolètes), bon réglage du siège...",null),
("243","191","ÉVALUATION/MESURE D\'EXPOSITION\nL\'évaluation du niveau d\'exposition peut être effectuée selon les procédés suivants :\n- grâce à une estimation fondée sur les informations concernant le niveau d\'émission vibratoire des équipements de travail utilisés, fournies par les fabricants de ces matériels, et sur l\'observation des pratiques de travail spécifiques ;\n- grâce à une estimation fondée sur les informations concernant l\'amplitude des vibrations dans des conditions de travail similaires ;\n- ou par un mesurage.\nEn cas de dépassement de la valeur d’action (0,5 m/s² sur 8 h), l’employeur est tenu de prendre des mesures techniques ou organisationnelles visant à réduire au minimum l\'exposition aux vibrations mécaniques et les risques qui en résultent.",null),
("244","192","INFORMATION MÉDECIN DE PRÉVENTION:\nInformer le médecin de prévention de l\'évaluation ou des mesures de vibrations mécaniques.\nLes salariés exposés doivent faire l’objet d’une visite d’information et de prévention réalisée par un professionnel de santé, c’est-à-dire, le médecin du travail ou bien, sous son autorité, le collaborateur médecin.\nL’employeur doit être tenu informé par le médecin du travail de toute conclusion significative provenant notamment du suivi de l\'état de santé du salarié exercé par le professionnel de santé, dans le respect du secret médical.",null),
("245","193","IMPLANTATION\nIl est en général possible d\'implanter de façon adéquate un poste de travail comprenant un ordinateur et ce, quelle que soit la configuration de la pièce. Il convient pour cela d\'étudier l\'éclairage, ainsi que  l\'environnement sonore et thermique.\nLe travail sur écran nécessite un éclairage spécifique, différent de celui du travail de bureau. Il convient d\'analyser les éclairages naturels et artificiels et de les moduler pour éviter les éblouissements et les reflets. \nLes personnes consultant souvent des documents papier peuvent avoir besoin d\'une lampe d\'appoint si l’éclairement (quantité de lumière qui arrive sur une surface) de ces documents est inférieur à 200 lux, voire à 300 lux si ces personnes ont plus de 40 ans.\nAutant que possible, placer les écrans perpendiculairement aux fenêtres.\nLes teintes pastel sont à privilégier aussi bien pour les parois que pour les mobiliers et les équipements informatiques.\n",null),
("246","194","L\'éclairage des locaux de travail doit permettre de :\n-faciliter l\'exécution d\'une tâche : c\'est la notion de performance visuelle. \nEn effet, une vision normale ne peut s\'exercer qu\'avec un minimum de lumière. Un bon niveau d\'éclairement permet une bonne productivité avec notamment une baisse des erreurs, des accidents, une moindre fatigue visuelle.\n-assurer le bien-être : c\'est la notion fondamentale du confort visuel.\nEn effet en plus du niveau moyen d\'éclairement nécessaire, il faut absolument veiller à : \n- une bonne qualité de la lumière émise par les sources \n- une uniformité de l\'éclairement \n- et à l\'équilibre des luminances pour éviter les éblouissements notamment. \n",null),
("247","195","BUREAU/SIÈGE/REPOSE-PIEDS\nLe plan de travail doit être de dimension suffisante (profondeur 80 cm pour un écran plat, 115 cm pour un écran cathodique 19 pouces ; largeur 160 cm) pour s’accorder de la variété des tâches et de l’encombrement relatif des matériels (notamment écran et clavier). \nUn plan de travail annexe, en retour de table, de dimensions plus faibles (60 x 120 cm) est à prévoir pour le rangement des dossiers. \nLe dessous du bureau doit être exempt d’encombrement (unité centrale, casier) pour ne pas gêner le positionnement des jambes.\nUn siège approprié est mis à la disposition de chaque travailleur à son poste de travail. Il doit comporter les caractéristiques habituellement connues (piétement à cinq branches, assise pivotante, roulettes, réglage en hauteur de l\'assise et du dossier). \nIl est préférable que ce dossier soit inclinable d\'avant en arrière avec la possibilité de le bloquer dans différentes positions. \n",null),
("248","196","Pour la prévention de la fatigue visuelle, il convient d’agir notamment sur l’organisation du travail, l’affichage à l’écran et l’implantation des postes.  \nPour la prévention des TMS, il convient d’agir notamment sur l’organisation du travail, l’aménagement des postes et la conception et le choix des dispositifs  d’entrée (clavier, souris, boule roulante…), en tenant compte des caractéristiques physiques du salarié. Le choix du matériel (fauteuil, table, souris, clavier, porte-copie, repose-pieds) est aussi déterminant.\nAménager une pause d’au moins 5 min toutes les heures si la tâche est intensive ou bien d’un quart d’heure toutes les 2 heures si la tâche l’est moins. Il faut bouger pendant les pauses. \nAttention, les temps d’attente de réponses qui imposent la surveillance de l’écran ne sont pas des pauses !",null),
("249","196","Pour la vision, quitter l’écran des yeux pour regarder au loin de temps en temps (environ toutes les 20 minutes) constitue une pause visuelle qui permet de relâcher l’accommodation.",null),
("250","197","Les règles d’aménagement des bureaux prennent en compte de nombreux critères comme l’éclairage, la largeur des voies de circulation, la hauteur sous plafond, les couleurs utilisées, les nuisances sonores…\nIl faut notamment savoir que :\n-la distance entre un plan de travail et un mur ou un meuble doit être au minimum de 80 cm et de 180 cm si une ou plusieurs personnes sont amenées à devoir circuler derrière la personne assise,\n-l’éclairage naturel doit être privilégié. Pour cela, il est important de veiller à ce qu’aucun meuble de rangement n’occulte la lumière apportée par les ouvertures vers l’extérieur ;\n-l’éclairage artificiel doit être installé de façon à ce que l’ensemble du bureau soit illuminé de façon homogène ;\n-la largeur des couloirs doit être d’au moins 150 cm ;\n-les câbles et les fils ne doivent pas être apparents et surtout ne pas gêner le déplacement des salariés ;\n",null),
("251","198","S’assurer qu’il n’existe pas de livraisons récurrentes de fournisseurs intervenants sur l’emprise de la collectivité (exemples: livraisons quotidiennes au restaurant scolaire); auquel cas formaliser les mesures de prévention à mettre en œuvre pour ces opérations sur un document écrit appelé \"protocole sécurité (chargement/déchargement\".\nDans des cas particuliers de petites opérations très répétitives (dépose fréquente de petits colis par exemple) ou lorsqu’il est difficile d’identifier le prestataire au préalable, la priorité de la collectivité sera en fait de donner une information claire à l’intervenant par le moyen le plus adapté à la situation, sur les risques que peut générer l’opération et les précautions à prendre.\nhttps://www.cdc.retraites.fr/outils/RUSST/",null),
("252","199","Lors de travaux sous-traités, il est nécessaire de définir les mesures de prévention à appliquer avec l’entreprise et il est souhaitable que ces mesures  soient formalisées dans un document écrit (Plan de Prévention).\nUn document type est téléchargeable sur le site du CDG87/Santé et sécurité au travail/RUSST/Chap8.1 ou sur le site de la CNRACL à l’adresse: https://www.cdc.retraites.fr/outils/RUSST/.\n(L’initiative de l’établissement d’un plan de prévention écrit incombe à l’entreprise utilisatrice)",null),
("253","200","La réglementation encadre très clairement l’exposition à ces risques et impose à l’autorité territoriale de mettre en place des mesures de prévention.\nDans un premier temps, il convient d’évaluer les risques pour ces situations de travail et de définir ensuite les mesures de prévention à mettre en oeuvre afin de les réduire.\nLa prévention passe également par l’information et la formation des agents sur ces risques et par la surveillance médicale (aptitude au poste de travail, vaccinations, etc.).\nPour l’ensemble des activités d’inhumation et/ou d’exhumation, il convient de faire travailler les agents en binôme afin de prévenir les risques liés aux situations de travailleur isolé.",null),
("254","201","Les travaux d’inhumation et d’exhumation en cimetière exposent les agents à de nombreuses nuisances tant chimiques, bactériologiques, physiques que psychologiques qui demeurent mal connues car peu étudiées à ce jour.\nCes travaux, encore effectués en régie pour certaines collectivités, nécessitent la mise en place de moyens de prévention et de protection permettant aux agents de travailler en sécurité.\n\nEquipements de protection individuelle:\n- Des gants de protection contre les produits chimiques, les produits infectieux et pour la manutention des charges lourdes et encombrantes.\n- Une combinaison jetable.\n- Des lunettes de protection couvrantes et antibuées.\n- Un masque à cartouche (contre les produits chimiques et infectieux en présence) pour les exhumations.\n- Des chaussures ou bottes de sécurité.\n- Un vêtement de pluie.\n",null),
("255","202","Afin de faciliter les interventions de secours en cas d’accident du travail, des moyens d’alerte doivent être disponibles pour les agents travaillant seuls  (téléphone, talkie-walkie, Système homme mort, dispositif DATI…)\nAfin de faciliter les interventions de secours en cas d’accident du travail, des consignes de sécurité doivent être communiquées aux agents et affichées dans les locaux de travail. Celles-ci doivent faire apparaître notamment :\n- la conduite à tenir en cas d’accident\n- le nom des agents formés aux 1ers secours sur le site\n- les numéros de téléphone d’urgence",null),
("256","203","Les agents qui exécutent la prestation funéraire doivent posséder une attestation de formation professionnelle ou douze mois d’expérience professionnelle et un certificat d’aptitude physique de la médecine du travail. Pour les chauffeurs, un permis de conduire ainsi qu’une autorisation de conduire adaptés au type de véhicule sont nécessaires.",null),
("258","205","La réduction des risques professionnels repose sur plusieurs niveaux d’actions :\n-Réaliser une Evaluation des Risques Professionnels ;\n-Former et informer les agents sur les risques et les méthodes de travail au sein des installations ;\n-S’assurer que les agents concernés sachent nager ;\n-Mettre en place des binômes pour travailler sur les sites (en fonction de la dangerosité des tâches réalisées): éviter le plus possible le travail isolé ; à défaut, prévenir systématiquement les services de la collectivité dès que l’agent part travailler seul sur le site en indiquant une heure prévisionnelle de fin du travail ;\n-Définir les locaux à risques (explosion, produits chimiques…) ;\n-Définir et formaliser des consignes de sécurité (organisation des secours, fiche sur la conduite à tenir en cas d’accident …) et d’utilisation pour les produits chimiques ;\n-Veiller à ce que les agents disposent des EPI et des vêtements de travail requis et que ceux ci soient en bon état : »",null),
("259","206","Installer des garde-corps réglementaires.\nLa prévention des chutes de hauteur à partir d’un plan de travail est assurée : \nSoit par des garde-corps intégrés ou fixés de manière sûre, rigides et d’une résistance appropriée, placés à une hauteur comprise entre un mètre et 1,10 m et comportant au moins \n-une plinthe de butée de 10 à 15 cm, en fonction de la hauteur retenue pour les garde-corps\n-une main courante\n-une lisse intermédiaire à mi-hauteur \nSoit par tout autre moyen assurant une sécurité équivalente.\nLa mise en place de système type barrière écluse permet de sécuriser la zone d’accès. \n",null),
("260","207","Afin de faciliter les interventions de secours en cas d’accident du travail, des moyens d’alerte doivent être disponibles pour les agents travaillant seuls  (téléphone, talkie-walkie, Système homme mort, dispositif DATI…)\nAfin de faciliter les interventions de secours en cas d’accident du travail, des consignes de sécurité doivent être communiquées aux agents et affichées dans les locaux de travail. Celles-ci doivent faire apparaître notamment :\n- la conduite à tenir en cas d’accident\n- le nom des agents formés aux 1ers secours sur le site\n- les numéros de téléphone d’urgence",null),
("261","208","Choisir le matériel en fonction de la nature des travaux à réaliser, de l’intensité d’utilisation, prendre en compte l’ergonomie (poignée anti-vibratile, poids, taille) de l’outil. \nContrôler le bon fonctionnement de la meuleuse en la faisant tourner à vide. \nVérifier la mise en place et la bonne orientation du carter de protection. \nVérifier l’état du câble électrique avant de brancher la meuleuse. \nFixer fermement la pièce à meuler et la placer dans une position ergonomique. \nEffectuer le travail sur un poste aéré et éloigné des zones de stockage et des zones de circulation. \nMettre les équipements de protection individuelle. ",null),
("262","209","MEULAGE:\nPort de lunettes ou visière de sécurité contre les projections, de gants (résistants aux coupures et à la chaleur, de préférence adaptés aux vibrations), de protections auditives, de masque à poussière (masques jetables FFP1), vêtements de travail ou tablier de protection...",null),
("263","210","L\'outil le plus approprié pour prendre en compte la notion de travailleur isolé reste l’évaluation des risques.\nAfin de prendre des mesures préventives adaptées, la collectivité doit donc examiner toutes les situations et circonstances de travail isolé. Lors de cette analyse, les principaux facteurs présentés ci-dessous sont à considérer :\n-La durée de l’isolement ;\n-Les moyens de communication : \nQuels sont les modes de communication disponibles ?\nEst-il possible de voir ou d’entendre le travailleur ?\n-Le lieu de travail :\nEst-il éloigné ?\nFaut-il un moyen de transport pour s’y rendre ?\n-La nature du travail :\nQuels sont les outils, matériels, produits et machines utilisés ?\nLes activités sont-elles à haut risque ?\n-L’agent :\nPossède-t-il une expérience et une formation suffisante pour exercer l’activité concernée ?\nA-t-il des antécédents médicaux ?",null),
("264","211","Les fumées de soudage sont nocives et doivent donc être captées à leur source d’émission\nLes dangers sont variés en fonction de la nature du matériau soudé, du gaz utilisé, du métal d’apport…\nPour les soudages T.I.G et M.I.G, il existe un risque d’asphyxie provoqué par l’usage de gaz inertes lorsque ceux-ci sont mis en œuvre dans des espaces confinés.\nLes fumées et les gaz peuvent provoquer des pathologies aiguës (effets toxiques, irritants, allergisants) et chroniques (infections pulmonaires provoquées par les poussières).",null),
("265","212","Initier des formations Certiphyto.\nLe Certiphyto est un certificat individuel pour produits phytopharmaceutiques, obligatoire pour :\n- acheter des produits phytosanitaires\n- utiliser des produits phytosanitaires (permet à son titulaire de réaliser des opérations en lien avec les produits phytopharmaceutiques,\npour lesquelles le certificat a été établi).\n",null),
("266","213","Stocker les EPI dans une armoire ou un local différent de celui servant au stockage des produits.\nIls doivent être rangés en dehors du local de stockage des produits phytosanitaires afin d’éviter leur saturation par les éventuelles vapeurs toxiques pouvant être dégagées par les produits. ",null),
("267","214","Assurer une tracabilité de l’utilisation des produits phytosanitaires par la mise en place d’un registre des traitements à tenir à jour avec dates, lieux, types de produits, doses…",null),
("268","215","Les produits phytosanitaires doivent être stockés de façon groupée et distincte des produits d’autres natures, dans un lieu spécifique et sous clef.\nPour les petites quantités : armoire fermant à clef.\nPour les grandes quantités : local spécifique avec rayonnage, correctement ventilé.\n- le local de stockage doit être strictement réservé aux produits phytosanitaires et fermé à clé.\n- ne stocker qu’une quantité minimale de produits, en les conservant dans leur emballage d’origine. Des armoires adaptées peuvent le cas échéant convenir pour le stockage.\n- un local de stockage frais, ventilé, le sol étant imperméable (ex. : ciment…).\n- les produits doivent être classés par famille (insecticides, herbicides…), sur des rayonnages métalliques.\n- installer un panneau sur la porte du local avertissant de la présence de produits phytosanitaires, y afficher les consignes en cas d’accident (numéros d’urgence…) et l’interdiction de fumer.\n",null),
("269","216","Voici la liste des principales formations professionnelles souvent nécessaires, qui peuvent être proposées à ces agents (essentiellement par le CNFPT) : - Formation aux notions de base en hygiène alimentaire (tenue réglementaire, protocole de lavage des mains, plan de nettoyage et de désinfection des locaux et du matériel…),   - Formation  à l’application de la méthode HACCP (méthodologie et moyens d’évaluation de la méthode,…), - Formation sur les bases de l’équilibre alimentaire, la gestion des allergies, la conception des menus,…, - Formation aux gestes et postures de sécurité dans le travail, - Formation à la conduite à tenir en cas d’urgence (secourisme, incendie,…), - Sensibilisation au risque chimique (règles de manipulation, de stockage), - Formation au risque électrique (ex : obtention de l’habilitation électrique H0B0 pour les agents ayant à changer une ampoule ou un tube fluorescent ou effectuant des travaux de nettoyage à proximité d’une installation électrique non protégée",null),
("270","217","L’HACCP (« Hazard Analysis Critical Control Point » ou analyse des dangers et des points critiques pour leur maîtrise) est une méthode d’assurance qualité permettant de garantir la sécurité alimentaire et l’hygiène des denrées. \nElle doit être obligatoirement appliquée en France depuis 1998, pour toute structure de restauration collective à caractère social. Cette méthode comporte principalement la rédaction et la mise en œuvre de procédures et d’autocontrôles afin d’éviter les risques de toxi-infections. Ces procédures et ces autocontrôles doivent être réguliers (mis à jour périodiquement) et consignés par écrit. Ils doivent être également mis à la disposition des services vétérinaires le cas échéant. Les responsables des établissements concernés sont chargés de les  mettre en place afin de vérifier la conformité des installations et du fonctionnement de leur établissement.",null),
("271","218","Les plans de travail (légumerie, tables de préparation ou de dressage, plans de cuisson et laverie) doivent se situer à une hauteur convenable afin de prévenir les mauvaises postures (85 cm recommandé). La profondeur des bacs ne doit pas être trop excessive. L’ensemble de ces équipements doit être facile à nettoyer. Les espaces entre chaque poste de travail doivent être suffisants afin de faciliter les déplacements et notamment le passage des chariots.",null),
("272","219","Suggérer les formations continues suivantes :\nFormation aux manutentions et aux risques liés à l\'activité physique (formation PRAP),\nFormation à la sécurité dans le stockage et l’utilisation des produits de traitement des eaux de piscine,\nFormation continue à la conduite à tenir en cas d’urgence (secourisme, incendie,…), \nCours de natation.\n\n",null),
("273","220","Il n’est pas interdit de laisser un agent travailler seul pour une activité telle que le nettoyage des locaux qui n’expose pas l’agent à des risques très importants. Cependant, tout agent dont le poste de travail est isolé doit faire l\'objet d\'une surveillance directe ou indirecte de jour comme de nuit. La collectivité doit, par exemple, s’assurer que l’agent a quitté les locaux de travail dans un bon état de santé.\nEn revanche, pour des activités dangereuses la présence d’un surveillant connaissant les mesures à prendre en cas d’incident ou d’accident est nécessaire : travail en bordure de bassin, exposition à des substances très toxiques, utilisation d’un appareil de levage, utilisation d’un harnais de sécurité par exemple…",null),
("274","221","Initier des formations PRAP, manipulation des extincteurs et des formations à l’utilisation et à l’entretien des différentes machines à bois.\nLe façonnage, l’assemblage et la finition de divers ouvrages en bois exposent les menuisiers et ébénistes à des risques professionnels importants de plusieurs natures : l’utilisation de machines à bois, d’outils portatifs mécaniques ou manuels dangereux (scie circulaire, ponceuse…) sont à l’origine de blessures aux membres et aux yeux qui peuvent être graves et s’infecter, mais il faut aussi tenir compte de risques à effets plus ou moins différés, le bruit pour la surdité professionnelle, les risques chimiques et allergiques des produits chimiques du vernissage, du collage et du traitement des bois, les troubles respiratoires causés par les poussières de bois, et les troubles musculo-squelettiques liés aux postures de travail contraignantes, aux vibrations des outils ou à la manutention d\'objets lourds (planches, panneaux de bois…).",null),
("275","222","Pour les machines portatives, il convient de généraliser le captage localisé des poussières à la source en utilisant par exemple un outillage muni d’un système d’aspiration intégré et s’organiser pour isoler les matériels et postes de travail qui ne pourraient être raccordés au réseau d’aspiration.\nDes mesures complémentaires d’hygiène des locaux doivent être mises en œuvre tel le nettoyage régulier du sol et des parois de l’atelier à l’aide d’un aspirateur industriel adapté avec un filtre absolu (pas de soufflette ni de balai qui dispersent les poussières dans l’air) et l’évacuation fréquente des sciures et des copeaux de l’atelier. \nLes filtres et les sacs laissent échapper les poussières les plus fines et le vidage ou leur remplacement est une cause d’empoussièrement majeure, et il convient alors que l’opérateur se protège ponctuellement avec un masque de protection respiratoire de type FFP3.\nLa prévention collective indispensable concerne la conception des locaux, la ventilation",null),
("276","223","L’Autorité Territoriale doit établir et tenir à jour un dossier de l’installation de dépoussiérage. Ce dossier d’installation permet le suivi et le contrôle régulier et est destiné à consigner le respect de la valeur limite d’exposition (fixée à 1mg/m3), vérifié au moins une fois par an par un organisme agréé. Les poussières de bois sont nocives par inhalation et par contact cutané pour tous les bois, mais plus ou moins selon les variétés d’essences de bois (feuillus, conifères, exotiques) et les produits chimiques éventuellement associés (dont le formaldéhyde). Elles sont responsables d’atteintes des voies respiratoires et cutanées et de cancers de l’ethmoïde et des sinus de la face (qui, même s’ils sont rares et d’apparition tardive, ont été longtemps sous-estimés).\nLes opérations de sciage du bois mais surtout de ponçage génèrent une quantité importante de poussières très fines : lorsque ces particules de poussière irritantes se logent dans le nez, elles peuvent causer une rhinite.",null),
("277","224","Mettre en accessibilité les locaux de travail concernant le ou les travailleurs handicapés.\nLes lieux de travail - y compris les locaux annexes - aménagés dans un bâtiment neuf ou dans la partie neuve d’un bâtiment existant, doivent être rendus accessibles aux travailleurs handicapés, quel que soit leur handicap et l’effectif du bâtiment.",null),
("278","225","S’assurer que l’entretien et les vérifications sont effectuées et les inscrire sur le registre incendie.",null),
("279","226","S’assurer que la vérification des aires de jeux est bien effectuée et que les remarques ou non conformités sont levées.",null),
("280","227","AMIANTE:\nDisposer d’un dossier technique amiante complet et à jour (DTA)",null),
("282","227","RADON:\nRéaliser des mesures de radon et transmettre la synthèse des résultats à l’ARS.",null),
("287","229","DIAGNOSTIC RADON:\nFaire réaliser des mesures d\'activité volumique du radon par un organisme agréé.\nConsigner le résultat de ces mesures dans le document unique (art.4 arrêté du 7 août 2008)",null),
("291","230","Initier un contrôle des arbres à cardan.\nDes facteurs externes qui dégradent rapidement le matériel, comme la poussière, les branches, conjugués aux conditions météo, impliquent une surveillance renforcée et une maintenance régulière qui n’est pas toujours assurée durant les périodes d’activités intenses. Il arrive souvent que cette tâche soit négligée, ce qui accélère les dégradations, augmentant ainsi sensiblement les risques d’accidents.\nPour déterminer la conformité de l’arbre à cardans, on dispose de trois méthodes :\n– l’examen visuel de l’état du protecteur et de l’arbre à cardans ;\n– le démontage du protecteur afin de vérifier les parties non visibles ou inaccessibles, en faisant attention à remonter correctement l’ensemble des pièces techniques ;\n– la vérification par un organisme compétent.",null),
("292","53","SUIVI:\nLes non-conformités qui apparaissent dans les rapports de vérification électrique doivent faire l\'objet d\'une intervention formalisée afin de pouvoir assurer un suivi des contrôles.",null),
("294","73","En matière d’hygiène et de sécurité, les affichages concernent :\n\n- Les coordonnées du Service de santé au travail compétent pour l’établissement (CT Art. D. 4711-1) ;\n- Les coordonnées des services de secours d’urgence (CT Art. D. 4711-1) ;\n- Les consignes en cas d’incendie (CT Art. R. 4227-28 et suivants) ;\n- Le document unique : Les salariés doivent être informé des modalités d\'accès au document unique d\'évaluation des risques (CT Art. R. 4121-4) ;\n- La liste nominative des membres du CHSCT (CT Art. R. 4613-8).\n- La liste nominative des secouristes",null),
("295","232","Fournir aux agents des équipements de protection individuelle (gants, chaussures de sécurité, …) \nLes situations de travail étant très différentes, trois catégories de chaussures ont été répertoriées, se distinguant essentiellement par le niveau de protection offert par l’embout :\nNorme NF EN ISO 20345 : Chaussures de sécurité à usage professionnel, marqués S, avec embout de protection de 200 Joules (chute d’un objet de 20kg d’une hauteur d’un mètre).\nNorme NF EN ISO 20346 : Chaussures de protection à usage professionnel, marqués P, avec embout de protection de 100 Joules (chute d’un objet de 10kg d’une hauteur d’un mètre).\nNorme NF EN ISO 20347 : Chaussures de travail à usage professionnel, marqués O, sans embout de protection.\nCes équipements seront choisis compte tenu des résultats de l’évaluation des risques professionnels, en concertation avec les agents utilisateurs.\n\n",null),
("296","130","La réglementation actuelle indique que les travaux temporaires en hauteur doivent être réalisés à partir d’un plan de travail conçu, installé ou équipé de manière à préserver la santé et la sécurité des travailleurs. Le poste de travail est tel qu’il permet l’exécution des travaux dans des conditions ergonomiques.\nSi le travail en hauteur est nécessaire pour réaliser l’intervention, la première\nmesure à envisager est la mise en place de protections collectives visant à empêcher la chute.\nCe dispositif est composé de :\n- Un garde-corps placé à une hauteur comprise\nentre 1 m et 1,10 m.\n- Une lisse intermédiaire à mi-hauteur.\n- Une plinthe de butée de 10 à 15 cm.\nTout dispositif d’une efficacité au moins équivalente est bien entendu accepté.",null),
("298","110","La survenance d\'un accident du travail, d\'une détresse médicale ou d\'un état pathologique dans la structure nécessite la mise en place de moyens efficaces destinés à prendre en charge le plus rapidement possible la victime. L\'organisation des secours passe par la mise en oeuvre de moyens humains, la formalisation de la conduite à tenir en cas d\'urgence ou d\'accident, un dispositif d\'alerte efficace et la mise à disposition de moyens de secours adaptés dans la structure.",null),
("299","115","Le stockage de produits inflammables dans les armoires de sécurité coupe- feu minimise le risque d\'incendie et protège les produits à l\'intérieur de l\'armoire en cas d\'incendie dans le bâtiment.",null),
("300","115","Les locaux doivent être conçus de manière à limiter la propagation de l’incendie à l’intérieur des bâtiments. Art.R4216-1 à 34 du CdT.\nPrévoir un matériau (murs et plafonds) isolant thermique (forte chaleur, gel) et incombustible de type M0 pour prévenir le risque d\'incendie (consulter votre assureur).\nEx : Parpaing, béton cellulaire, plâtre, complexe isolant plaque de plâtre + polystyrène. Un enduit lisse et étanche au sol remontant sur 10 cm permet d’éviter la pénétration du produit dans les murs. ",null),
("301","123","Cet éclairage doit être installé dans les dégagements et dans tous les locaux sauf si ceux-ci réunissent les trois conditions ci-après :\n- le local débouche directement, de plain-pied, sur un dégagement commun équipé d\'un éclairage d\'évacuation, ou à l\'extérieur ;\n- l\'effectif du local est inférieur à 20 personnes ;\n- toute personne se trouvant à l\'intérieur dudit local doit avoir moins de trente mètres à parcourir.",null),
("302","125","- L’accès à la fosse doit pouvoir s’effectuer par les deux extrémités : un accès principal à l’aide d’un escalier et un accès de secours pouvant être réalisé par escalier ou à défaut une échelle métallique fixe donnant les mêmes garanties.\n- L’escalier doit être conçu selon les normes en vigueur et être antidérapant (béton rugueux, acier strié ou revêtu d’un produit antidérapant et incombustible), de la largeur de la fosse et facile à utiliser, même en transportant des pièces.\n- Ne pas utiliser d’escabeau ou d’échelle en bois, car le bois devient glissant au contact des huiles, graisses,…\n- Lors de la conception, il est conseillé de matérialiser au sol le plan de circulation afin de supprimer les risques d’interférence entre les piétons et les véhicules en déplacement ou en manœuvre. \n",null),
("303","129","DÉGAGEMENT:\nEtre rigoureux sur l’ordre, le rangement et la propreté des locaux : c’est le principe de base pour éviter les chutes de plain-pied. Il est nécessaire de veiller à ce que les voies de circulation (couloirs,escaliers,…) soient dégagées de tout objet inutile.\n",null),
("304","129","ACCÈS:\nParce que les chutes dans les escaliers peuvent causer des blessures graves, voire même la mort, les exigences des codes du bâtiment relatives aux escaliers et aux rampes d’accès sont très rigoureuses. Une conception appropriée prévoyant des moyens de garder ou de retrouver son équilibre peut permettre de réduire grandement les risques de trébuchement, mais même une conception exceptionnelle ne peut éliminer entièrement les risques de chutes. Il en est de même pour les rampes d’accès. Le fait est que plusieurs incidents résultent d’un manque d’attention, d’un comportement négligent et du port de chaussures qui ne sont pas adéquates.\nLa meilleure façon de minimiser les risques de chutes dans les escaliers est d\'encourager la construction d\'escaliers bien conçus tout en favorisant une sensibilisation aux risques potentiels.",null),
("305","134","ECHELLE FIXE>3M:\nLes échelles fixes, d’une hauteur supérieure à 3 mètres, doivent être munies de crinolines (ensemble d’arceaux horizontaux et de montants verticaux solidaires de l’échelle et ayant pour fonction de limiter les conséquences d’une chute) à partir de 2,30 à 3 mètres du sol (l’usage recommande 2,50 mètres). La hauteur d’échelle entre 2 paliers successifs ne peut dépasser 9 mètres.\nComme pour tout équipement de travail, qu’il s’agisse d’échelles fixes ou d’échelles portables, d’escabeaux ou de marchepieds, il conviendra de s’assurer que le matériel a fait l’objet d’une évaluation qui prenne en compte sa solidité et la sécurité qu’il offre à l’utilisation en référence aux norme NF E 85-016.",null),
("306","134","ACCÈS:\nPour information, la mise en place d’une échelle comme moyen d’accès est déconseillée. \nEn effet, dans ce cadre, le port de charges doit rester exceptionnel et limité à des charges légères et peu encombrantes (il ne doit pas empêcher le maintien d’une prise sûre) (art. R. 4323-88 du CdT). ",null),
("307","132","FORMATION:\nToute personne devant intervenir en hauteur avec des EPI doit suivre obligatoirement une formation adéquate et spécifique. Il est indispensable d’une part,\nde connaître les différents EPI et leurs fonctions, et d’autre part, de maîtriser parfaitement le port et l’utilisation de ces équipements. \nCette formation doit être renouvelée aussi souvent que nécessaire pour que les EPI soient utilisés conformément aux spécifications du fabricant.",null),
("308","133","VÉRIFICATION PÉRIODIQUE\nLes composants d’un échafaudage doivent faire l’objet d’une vérification de leur bon état de conservation avant toute opération de montage d’un échafaudage. \nLe matériel endommagé ne doit jamais être utilisé.",null),
("310","233","ETAT:\nS’assurer que les dispositifs antidérapants de toutes les échelles et escabeaux utilisés sont bien présents.\nS’assurer de leur bon état ( solidité, résistance...) et que leurs règles d’utilisation sont respectées.\nS’assurer que tous les escabeaux contrôlée et identifiée comme ’Hors-service’ ne puisse plus être utilisée.",null),
("311","131","NOMBRE D\'AGENTS:\n2 personnes au moins sont nécessaires pour mettre en œuvre les PEMP de type 1 et 3:\n-une titulaire d’une autorisation de conduite, manœuvrant la plate-forme de travail,\n-une seconde dont la présence est indispensable au bas de la PEMP pour guider l’opérateur, alerter les secours en cas de besoin et assurer la surveillance de l’environnement.",null),
("313","143","OUTILS PORTES/TRACTES:\nLorsque le chargement présente un dépassement compris entre 1 m et 4 m inclus, ou lorsque l\'outillage porté amovible à l\'arrière présente une longueur comprise entre 1 m et 4 m inclus, celui-ci est signalé par les dispositifs supplémentaires suivants :\n- des dispositifs conformes aux dispositions de l\'arrêté du 20 janvier 1987 modifié susvisé, et éventuellement amovibles : un dispositif face à l\'arrière et deux disposés latéralement et symétriquement sur les côtés du dépassement, dont un des bords de la plage réfléchissante est situé à moins d\'un mètre de l\'extrémité arrière du dépassement ;\n- pour un outillage porté amovible, s\'ajoutent des dispositifs catadioptriques latéraux conformes aux dispositions de l\'arrêté du 16 juillet 1954 modifié susvisé.",null),
("314","168","Examiner si l’exposition est possible par voie aérienne (inhalation de poussières ou de gouttelettes contaminées), par pénétration à travers la peau et les muqueuses, par contact avec la peau ou les muqueuses, par inoculation accidentelle (microblessure, piqûre, coupure…), ou par voie digestive (en portant les mains ou un objet contaminé à la bouche).\nUne fois réalisée l’identification des situations dangereuses liées à un type d’activité, il convient pour chacune d’entre elles de tenir compte de la gravité des dommages potentiels et d’estimer la probabilité d’apparition. Cela permet de hiérarchiser les risques afin de déterminer les mesures de prévention à mettre en place de façon prioritaire.",null),
("315","182","ETAT:\nRemplacer les protecteurs contre les nuisances sonores.\nIl est conseillé d\'entretenir les protections auditives selon les recommandations du fabricant pour leur conserver toute leur efficacité et leur intégrité.\nLe serre-tête à coquilles appelé également casque antibruit est réutilisable, mais il est conseillé de changer les coussinets sur les oreillettes tous les six mois pour conserver une bonne étanchéité.",null),
("316","181","EVALUATION RISQUE BRUIT:\nL\'employeur évalue et, si nécessaire, mesure les niveaux de bruit auxquels les travailleurs sont exposés.",null),
("317","234","Veiller à ce que les agents disposent des EPI et des vêtements de travail requis et que ceux-ci soient en bon état : \n- les agents présents sur le bassin (MNS) doivent porter des chaussures en plastique ouvertes (sandales) à semelle antidérapante. \n- Ils peuvent être dotés de protections auditives. Ces protections doivent permettre de garder un contact auditif suffisant avec l’extérieur (messages d’alerte nécessaires pour la surveillance du bassin). Des bouchons moulés individualisés équipés de filtres spécifiques peuvent permettre de maintenir cette communication. \n\nVeiller au port et à la vérification de l’état et à l’entretien des EPI par les agents\nAvoir un moyen de communication permanent (…) afin de pouvoir contacter la hiérarchie et/ou les services d’urgence le cas échéant, \n",null),
("318","235","Concevoir et aménager les locaux de manière à limiter les risques de chutes : dispositifs antidérapants sur le sol, bouée de secours à\nproximité des bassins, protection collective contre les chutes de hauteur (PIRL, etc.), \nNe pas effectuer l’entretien aux abords du bassin en position de travailleur isolé.\nS’assurer que l’agent d’entretien sache nager.\nMise en place de bouées de sauvetage ou de vêtements à volume de flottabilité incorporé pour l’entretien aux abords du bassin.\nSécurisation du bassin vidangé (gardes corps)\n",null),
("319","236","-Mise en place de prélèvements d’atmosphère (tube cassette).\n-Respect des valeurs limites établies par l’INRS* : valeur limite indicative dite de « confort » pour le NCL3 de 0,5 mg.m-3 et valeur limite maximum de 1,5 mg.m-3.\n-	ise en place d’un procédé d’extraction de chloramines par contact gaz/liquide (ex : procédé de dégazage par chutes d’eau au niveau des bacs tampons). Voir le document ND2117.77.99 de l’INRS*.\nIl existe également des systèmes de déchloramination (déchloraminateur : diminution du taux de chloramine par action physique de rayons UV) qui permettent, notamment, une amélioration de la qualité de l’air. \n",null),
("320","234","Les EPI et les vêtements de travail nécessaires à la manipulation des produits chimiques (cf. la fiche de donnée de sécurité du produit manipulé) : \n- vêtements de travail traités anti-acides, \n- gants en PVC avec manchettes, \n- écran facial de protection, masque de protection respiratoire filtrant les vapeurs organiques (masque à cartouche anti-chlore), \n- chaussures ou bottes de sécurité.\n\nVeiller au port et à la vérification de l’état des EPI ainsi qu’à leur entretien par les agents ",null),
("321","220","L’employeur se doit d’analyser les situations de travail isolé et leurs conséquences éventuelles dans le cadre de son évaluation des risques. Il lui appartient de prendre les mesures de prévention et d’organisation des secours à mettre en œuvre.\nEn l’absence de définition réglementaire du travail isolé, c’est l’évaluation des risques qu’est tenu de mener l’employeur qui doit permettre d’identifier les situations d’isolement prolongé ou ponctuel, habituel ou fortuit, et les risques associés. Il revient ensuite à l’employeur de déterminer les mesures appropriées à leur prévention.",null),
("322","193","AMÉNAGEMENT\nChoisir un mobilier respectant les normes en vigueur, autant que possible réglable. Il faut aussi veiller à offrir assez d\'espace aux agents pour qu\'ils puissent bouger, changer de position, étendre leurs jambes, accéder aisément à leur documents...\nLes plantes vertes peuvent contribuer à préserver un taux d’humidité adéquat.\nPour établir un compromis entre vision et posture, le haut du moniteur doit se situer au niveau des yeux. Toutefois, si le salarié  porte des verres progressifs, l’écran doit si possible être à moitié encastré dans la table. A défaut, il sera directement posé sur la table, sans support. Une autre solution est le port de verres correcteurs spécifiques au travail sur écran.\nLorsque le salarié  travaille à par",null),
("323","194","Dans la circulaire du 11 avril 1984, nous pouvons lire : \n« Il est souhaitable de modifier les niveaux d\'éclairement en fonction de certaines conditions rencontrées et notamment des possibilités visuelles des travailleurs. Des mesures peuvent être proposées par le médecin du travail »\nIl est possible à cet égard de consulter les recommandations de l\'Association Française de l\'Éclairage (AFE) et les normes AFNOR X 35-103 et EN 12665 pour suivre les conseils de la circulaire. Dans la norme AFNOR, il y a notamment un tableau qui indique les majorations d\'éclairage à apporter selon l\'âge de l\'opérateur, les facteurs de réflexion et les contrastes, etc...\n",null),
("324","194","Les exigences de sécurité et de confort de l\'éclairage en milieu de travail ont pris une importance grandissante. \nL’utilisation d\'un éclairage des locaux bien conçu permet d\'éviter une détérioration de la vue et les fatigues intempestives que pourrait causer un travail prolongé dans des conditions d\'éclairages mal adaptées. \nUn éclairage adapté permet également de prévenir les risques d\'accidents occasionnés par une perception visuelle dégradée de l\'environnement.\nIl convient ainsi d\'éviter toute cause d\'éblouissement et tout reflet parasite sur l\'écran susceptibles de gêner l\'utilisateur.\n",null),
("325","195","CLAVIER/SOURIS/ECRAN\nL\'espace devant le clavier doit être suffisant (10-15 cm du bord du bureau) pour permettre un appui pour les mains et les avant-bras de l\'utilisateur.\nLes touches du clavier doivent être suffisamment sensibles pour ne pas avoir à les actionner avec trop de force ou de tension.\nLa distance recommandée entre son écran et soi est d’environ 70 cm (longueur du bras tendu). La hauteur de l\'écran doit être ajustée afin que le haut de l\'écran arrive à hauteur des yeux. Pour les porteurs de verres progressifs, l’écran devra être placé plus bas pour éviter les extensions excessives du cou.\nPour un meilleur confort visuel et une meilleure concentration, l’écran sera choisi de préférence le plus grand possible.",null),
("326","237","Les lieux de travail intérieurs doivent être aménagés de telle façon que les piétons puissent circuler de manière sûre. \nLes planchers des locaux doivent être exempts de bosses, de trous ou de plans inclinés dangereux ; ils doivent être fixes, stables et non glissants. Les largeurs de passage seront au minimum de 80 cm pour accéder à son poste, aux éléments de rangement et aux plans de travail annexes. \nLes câbles au sol doivent être évités dans la mesure du possible en prévoyant des alimentations par le sol dont les emplacements sont judicieusement choisis (à proximité des mobiliers). \nDes goulottes pourront, le cas échéant, protéger le câblage au sol.\n",null),
("327","236","Les actions correctives passent par des mesures techniques de captage des polluants à la source, de ventilation et d’assainissement de l’air, d’élimination et de dégradation de la trichloramine comme par la mise en place de système de strippage associé à un procédé de dégradation de la trichloramine breveté par l’INRS PROPHETE.\nCes mesures peuvent être complétées par des actions d’information et de formation des salariés et personnels des piscines et centres aquatiques.\n",null),
("328","236","Lutter contre les effets de la trichloramine s’inscrit dans une approche générale des principes de prévention liés au risque chimique. Dès lors que des salariés sont exposés à des risques chimiques, l’employeur est tenu :\n-D’évaluer les risques  : identifier tous les produits chimiques présents ou susceptibles d’être rencontrés dans l’environnement de travail. Pour évaluer l’exposition des salariés à la trichloramine, vous pouvez vous référer à la méthode de prélèvement de référence  et utiliser des outils comme TRIKLORAME développé par l’INRS, pour un suivi sur site par autocontrôle.\n-De consigner les résultats de l’évaluation dans le document unique et les tenir à disposition du médecin du travail et du CHSCT.\n- De supprimer ou substituer les produits et procédés dangereux par d’autres produits ou procédés moins dangereux et mis à disposition (difficilement envisageable au regard des de l’utilisation du chlore dans les secteurs d’activités concernés).",null),
("330","204","Le Code général des collectivités territoriales réglemente la réalisation des activités d’inhumation et d’exhumation. Pour l’exercice de ces missions, il impose à la commune d’être habilitée par la préfecture.\nCette habilitation est généralement accordée pour une durée de six ans. Toutefois, lorsque la régie ne justifie pas d’une expérience professionnelle, acquise dans le respect des conditions de la section 2 du chapitre III du titre II du livre II, d’au moins deux années consécutives dans les activités pour lesquelles l’habilitation a été sollicitée, cette habilitation est accordée pour une durée limitée à un an.",null),
("331","186","EVALUATION DES RISQUES:\nLors de l\'évaluation, l\'employeur porte une attention particulière sur les dangers des agents biologiques susceptibles d\'être présents dans les différents réservoirs de germes (les déchets, les eaux usées, l\'organisme des patients, de personnes décédées, des animaux vivants ou morts, ....)",null),
("332","187","SUBSTITUTION:\nSi la nature de l’activité le permet, essayer de remplacer l’agent biologique par un produit de substitution moins dangereux.",null),
("333","192","SUIVI MÉDICAL:\nAssurer une surveillance médicale appropriée pour la prévention du risque et le dépistage précoce des affections (surveillance médicale renforcée dans les conditions qui seront fixées par le médecin du travail).\n",null),
("334","191","MOYENS DE RÉDUCTION:\n1)Pour protéger les travailleurs contre les effets des vibrations transmises au corps entier,\n-Choisir des machines traitées contre les vibrations et correctement entretenues\n-Minimiser le couplage entre la machine et l’opérateur par une bonne opération de la machine et des postures confortables\n-Maintenir une température suffisante, en particulier pour les mains\n2)Pour protéger les travailleurs contre les effets des vibrations transmises aux membres supérieurs,\n-Choisir des machines traitées contre les vibrations et correctement entretenues\n-Minimiser le couplage entre la machine et l’opérateur par une bonne opération de la machine et des postures confortables\n-Maintenir une température suffisante, en particulier pour les mains.",null),
("336","191","Lorsqu\'en dépit de ces mesures, les valeurs limites d\'exposition ont été dépassées, l\'employeur prend immédiatement des mesures pour ramener l\'exposition au-dessous de celles-ci, détermine les causes du dépassement et adapte les mesures de protection et de prévention en vue d\'éviter un nouveau dépassement.",null),
("337","144","ETAT:\nRemplacer les panneaux usagés.\nLes panneaux doivent être en bon état et lisibles (pas plus de 2 panneaux côte à côte). \nTous les signaux utilisés en signalisation temporaire doivent être rétro réfléchissants (exceptés les signaux K1 et les feux R et KR11). \n",null),
("338","103","VÊTEMENTS:\nFournir aux agents des équipements de protection individuelles contre le froid.\nLe choix des EPI se fera donc en fonction des risques à prévenir, des conditions de travail et des utilisateurs.\nLes équipements mis à disposition ne devront pas nuire aux exigences inhérentes à la tâche à effectuer (mobilité et dextérité pour l’essentiel). La tenue adoptée devra, par ailleurs, être compatible avec les équipements de protection individuelle prévus pour d’autres risques (haute visibilité, travail en hauteur, protection respiratoire…) lorsqu’ils sont utilisés conjointement avec les vêtements de protection contre le froid. ",null),
("339","104","VALEURS MINIMALES D\'ECLAIREMENT:\nLocal pour archives 100 lux\nVestiaires, sanitaires 120 lux\nSalles de réception et d’attente 150 lux\nLocaux ne nécessitant pas la perception de détail 200 lux\nMécanique moyenne 200 lux\nDactylographie, travaux de bureau 200 lux\nTravail sur établi 200 lux\nFinition, polissage, vernissage 300 lux\nMécanique de petite pièce 300 lux\nTravail sur machine 300 lux ",null),
("340","104","PROTECTION LUMINEUSE:\nL\'éclairage naturel doit être maîtrisé. Un agent travaillant à proximité d\'une fenêtre peut être à un moment de la journée gêné par la lumière, il doit pouvoir se protéger à l\'aide de stores ou de rideaux. Afin de limiter les incommodités liées à la lumière naturelle il est recommandé d\'éviter de placer des écrans dans des bureaux ayant des baies vitrées dont la surface est supérieure à 25% de la surface au sol.",null),
("341","188","LISTE AGENTS EXPOSES:\nL\'autorité établit une liste de ses personnels  exposés à des agents biologiques en précisant le type de travail réalisé, l\'agent biologique , les données relatives à l\'exposition (durée, fréquence...) et également les accidents et incidents déjà survenus.\nCette liste devra être conservé au moins 10 ans après la fin de l\'exposition",null),
("342","229","PREVENTION:\nMettre en place des actions pour réduire l\'activité volumique du radon dans l\'air (ventilation, aération...). \nOrganiser l\'activité des agents pour réduire leur exposition.\nSi nécessaire, mettre en place un suivi dosimétrique individuel des agents et mettre à jour la fiche individuelle d\'exposition des agents.",null),
("343","229","SUIVI MEDICAL:\nL\'employeur établit une fiche individuelle d\'exposition (art.R.4452-23 du CT) . Cette fiche comprendra:\n1° La nature du travail accompli ;\n2° Les caractéristiques des sources émettrices auxquelles le travailleur est exposé ;\n3° La nature des rayonnements ;\n4° Le cas échéant, les résultats des mesurages des niveaux de rayonnements optiques artificiels ;\n5° Les périodes d\'exposition.",null),
("344","117","Les consignes incendie doivent indiquer:\n- le matériel d’extinction et de secours et le personnel chargé de mettre ce matériel en action\n- les personnes chargées de diriger l’évacuation du personnel\n- les moyens d’alerte et les personnes chargées d’aviser les sapeurs-pompiers\n",null),
("345","118","MISE A JOUR:\nMettre à jour les plans d’évacuation.\nDoivent y figurer, outre les dégagements, les espaces d\'attente sécurisés et les cloisonnements principaux, l\'emplacement :\n* Des divers locaux techniques et autres locaux à risques particuliers\n* des dispositifs et commandes de sécurité\n* des organes de coupure des fluides\n* des organes de coupure des sources d\'énergie\n* des moyens d\'extinction fixes et d\'alarme.\nOn peut également retrouver dessus les consignes de sécurité incendie.\n",null);
INSERT INTO preconisation VALUES
("346","233","UTILISATION ESCABEAU:\nS’assurer, qu’une réflexion sur les mesures de prévention à mettre en œuvre pour les activités de nettoyage des carreaux, de peinture, de maçonnerie soit menée, privilégier l’utilisation de matériels type manche télescopique, PIRL (Plates-formes Individuelles Roulantes Légère) ou échafaudage,  sinon s’assurer que ces équipements (type escabeau ou marche-pied) soient bien conformes et équipés de dispositifs antidérapants mais aussi que l’évaluation a démontré que le risque est faible et que les interventions sont de courtes durées ou une impossibilité technique de faire autrement.",null),
("347","133","ETAT GÉNÉRAL:\nFaire un examen de l’état de conservation du ou des échafaudages. \nIl a pour but de vérifier le bon état de conservation des éléments constitutifs de l\'échafaudage pendant la durée de sont installation. Il porte entre autres sur, la présence et la bonne utilisation des dispositifs de protection collective et des moyens d’accès, l’absence de déformation, l’absence de corrosion, la présence des éléments de fixation, calage…\nTout équipement détérioré, tordu doit être éliminé. Il est interdit de tenter de le redresser. ",null),
("348","137","Les formations Prévention des Risques liés à l’Activité Physique. (P.R.A.P) répondent à cette obligation de formation, abordant à la fois les gestes et postures à adopter lors de manutentions, mais aussi l’analyse ergonomique du poste de travail.",null),
("349","136","TECHNIQUE:\nMise en place d’appareils de levage mécanique, du type chariot élévateur, ponts roulants, grues…\nAttention : Ce type d’équipement nécessite la mise en place de contrôles et vérifications périodiques obligatoires, mais aussi d’une autorisation de conduite pour chaque agent concerné.\n",null),
("350","142","PORT OBLIGATOIRE:\nIl est recommandé de porter au minimum une tenue haute visibilité de classe 2 en temps normal et de recourir à la classe 3 en cas de mauvaises conditions de visibilité (nuit, pénombre, pluie...) ainsi que sur les axes à forte circulation. \nEn classe 2 le haut est indissociable du bas, en effet un pantalon porté seul peut s’avérer insuffisant : les bandes sont placées près du sol et peuvent être\nconfondues avec de la signalisation de chantier. \nPour effectuer ces travaux en sécurité, il est important pour les agents de porter des équipements de protection\nindividuelle (EPI) adaptés à leurs activités professionnelles mais aussi à leur morphologie : \n\n",null),
("352","239","Une formation adéquate du conducteur est nécessaire pour la conduite de tous les engins, Elle est à compléter et réactualiser chaque fois que le besoin se fait ressentir.\nLes recommandations de la CNAMTS constituent un moyen de répondre à l’obligation réglementaire de contrôle des connaissances et de savoir-faire à la conduite en sécurité, et indirectement à l’obligation réglementaire de formation, puisque le test CACES® donne une traçabilité évidente et une conformité à un référentiel de compétence. Il n’y a pas d’équivalence entre les différentes catégories d’une même famille de CACES.",null),
("353","157","GYROPHARE:\nLes véhicules ou engins contraints par nécessité de service de progresser lentement ou de stationner fréquemment sur la chaussée doivent être dotés de feux spéciaux conformes aux dispositions en vigueur (gyrophare)",null),
("354","157","TRI FLASH:\nLes engins assurant la signalisation de position sont équipés d’un panneau AK5 doté de trois feux de balisage et d’alerte synchronisés visibles de l’avant et de l’arrière.",null),
("363","240","ACCESSIBILITE:\nLes vannes de coupure des sources d\'énergie doivent être signalées et accessibles.",null),
("365","176","ARMOIRE:\nLorsque les quantités de produits sont faibles, leur stockage est envisageable dans des armoires spécifiquement adaptées aux risques, comportant un système de rétention et de ventilation, ainsi qu’une signalisation appropriée.",null),
("366","176","COMPATIBILITÉ:\nIl est impératif de ne jamais stocker ensemble des produits pouvant avoir une réaction l’un avec l’autre. ",null),
("367","185","SIGNALISATION:\nSi le niveau d’exposition quotidien dépasse 85 dB, l’autorité territoriale doit :\n- mettre en place une signalisation appropriée dans les zones concernées,\n- veiller à ce que les protections individuelles soient portées,\n- mettre en place une surveillance médicale",null),
("368","161","Remettre en conformité le ou les éclairages défaillants.\nLe gyrophare doit être placé de telle sorte qu\'il soit visible à 50 m tous azimuts.",null),
("369","164","Fiche de constitution d\'un dossier de réception à titre isolé de véhicule en application du code de la route.\nhttp://www.developpement-durable.gouv.fr/IMG/pdf/RTI03-5-8_062011_Engin_Service_Hivernal.pdf\nUn agent de la collectivité doit se présenter au Service des Mines, avec son véhicule et les outils utilisés (lame de raclage…). Il faut savoir que la réception se fait sur les dimensions et le poids de l’équipement ajouté. Il est donc nécessaire de prévoir une configuration maximale. De cette manière, il sera possible de prendre un équipement plus petit ou moins lourd sans devoir passer de nouveau devant le Service des Mines",null),
("370","241","Faire former le ou les agents à la mise en oeuvre des articles pyrotechniques, sinon, utiliser les\nservices d’une société spécialisée, chargée soit de fournir un spectacle clé en main, soit de mettre en œuvre des artifices\nacquis au préalable. Il lui faudra alors choisir une entreprise assurée contre les risques, en mesure de présenter des références fiables et vérifiables, employant des artificiers expérimentés et possédant un certificat de qualification.",null),
("371","242","Un titre d\'habilitation doit faire suite à la formation obligatoire.\nL’éventualité d’artificiers municipaux, si elle n’apparaît pas comme la plus opportune, requiert en tout état de cause les compétences et habilitations requises. Les artificiers, à l’instar de tout agent appelé à évoluer dans la zone de tir ou à manipuler des explosifs, doivent\ndonc au préalable avoir bénéficié d’une formation dispensée par un organisme agréé et être habilité par l’employeur.\nCette habilitation devra être renouvelée tous les 5 ans. ",null),
("372","243","STOCKAGE:\nLe lieu de stockage ne peut en aucun cas servir à la préparation, aux modifications ou aux finitions des pièces d\'artifice. Elles doivent être entreposées et manipulées en l\'état.\nLorsqu\'il s\'agit d\'un spectacle pyrotechnique, les produits pyrotechniques doivent obligatoirement être conservés dans un local clos non accessible au public et surveillé en permanence, pas plus de 15 jours avant la date prévue du spectacle pyrotechnique. Ce local ne doit pas se situer à plus de 50 km du lieu du spectacle.\nLes artifices ne peuvent pas être stockés :\ndans une habitation, ni dans un établissement recevant du public, ou à moins de 50 m d\'une habitation ou un établissement recevant du public, ni en sous-sol, ni en étage, à moins de 100 m d\'un immeuble de grande hauteur (dont le plancher bas du dernier niveau est situé au moins à 28 m du sol), à moins de 100 m d\'émetteurs radio ou radar ou de lignes de haute tension.\n",null),
("373","170","INVENTAIRE:\nRéaliser un inventaire exhaustif des produits utilisés.\nIl conviendra de faire un inventaire des risques au cas par cas afin de les intégrer dans le Document Unique de la collectivité ou de l’établissement public. Il faudra aussi veiller à ce que la quantité stockée soit la plus faible possible et en rapport avec les besoins de la structure.",null),
("374","142","ETAT:\nRemplacer les vêtements usés, abîmés et arrivant en fin de vie.\nEntretenir les vêtements (lavages conformes aux prescriptions du fabriquant).\nLa protection offerte repose exclusivement sur l’état de propreté et l’aspect visuel du vêtement.\nPour cette raison, il doit être entretenu de manière à ce qu’il conserve ses performances colorimétriques et photométriques, et qu’il reste visible de jour comme de nuit. \n",null),
("375","179","SUIVI:\nÉtablir un plan d\'intervention et un suivi de la levée des non conformités relevées dans les rapports.\nLe caractère obligatoire de ces vérifications fait qu’en cas de sinistres, votre assureur peut décliner sa responsabilité si ces rapports ne sont pas à jour.\nÉvidemment l’ensemble de ces rapports ne sont pas destinés qu’à consigner les dangers identifiés mais ont pour but également d’établir un plan d’action pour réduire les risques d’incendie et d’explosion liés au réseau électrique.  ",null),
("376","182","PORT:\nFaire un rappel du port obligatoire des protections auditives pour les activités bruyantes.\nChaque agent doit connaître les risques contre lesquels les équipements de protection individuelle les protègent, les conditions d’utilisation, notamment les consignes pour le stockage et l’entretien de ces équipements. L’agent doit aussi connaître ses responsabilités en cas de non-respect des consignes d’utilisation.\nTout agent qui refuse ou s’abstient d’utiliser les EPI, conformément aux instructions, peut engager sa responsabilité et s’exposer à des sanctions.\nLe port d’EPI représente parfois une contrainte pour les agents et ces derniers sont parfois réticents à les utiliser (gène dans le travail, inconfort,  aspect esthétique, sous évaluation des risques…). C’est pourquoi il est très important d’impliquer les agents dans le choix des protections les plus adaptées.\n",null),
("377","4","FORMATION CONTINUE:\nS’assurer que les agents sont à jour de leur formation continue.\nPasserelle ACMO/AP : Les agents qui ont suivis la formation ACMO doivent suivre une formation continue de 2 jours pour devenir Assistant de Prévention.\nVous pouvez contacter le C.N.F.P.T. pour obtenir des dates de formation afin de suivre la formation initiale ou continue\n",null),
("378","9","FORMATION CONTINUE:\nS’assurer que l\'agent désigné en tant que conseiller de prévention est à jour de ses formations continues.\nL’année suivant la prise de fonctions, les conseillers de prévention doivent suivre une formation continue de 2 jours dont le contenu est fixé par arrêté.\nPar la suite, les agents doivent suivre au minimum un module de formation présent dans le parcours de professionnalisation proposé par le CNFPT.",null),
("379","45","FDS:\nLa présence et la lecture des FDS (devant être transmises gratuitement par les fournisseurs) est indispensable; elles permettent, entre autre,  d’informer les utilisateurs sur les différents équipements de protection à utiliser et les conduites à tenir en cas d’accident.\nEn fonction de l’inventaire de tous les produits utilisés au sein de la collectivité, procéder au recensement de ces fiches.\nTenir ces fiches à disposition des utilisateurs sur le lieu de stockage des différents produits.\nAttention l’utilisation de produits  100% naturels ne signifie pas que le produit n’est pas dangereux (la FDS vous donnera les indications sur les règles de sécurité à respecter)",null),
("381","244","Le triangle de pré signalisation doit se trouver à bord du véhicule.\nLe triangle est obligatoire si le véhicule est immobilisé sur la chaussée.\nLe triangle n\'est pas obligatoire si le véhicule est immobilisé sur la bande d\'arrêt d\'urgence (BAU), qui ne fait pas partie de la chaussée.\nSi le véhicule immobilisé empiète sur la chaussée de l\'autoroute, le conducteur doit se poser la question de l’utilisation du triangle.\nEn règle générale, le triangle n\'est pas obligatoire lorsque sa pose, sur tout type de route, constitue une mise en danger de la vie du conducteur, ce qu\'il lui appartient d\'évaluer.\nLe gilet et le triangle doivent être conformes à la réglementation en vigueur (marquage Communauté européenne « CE » pour le gilet et certification par le marquage « E 27 R » pour le triangle.\nLe gilet de sécurité doit être porté par le conducteur avant de sortir du véhicule, de nuit comme de jour, quelles que soient les conditions de visibilité, à la suite d\'un arrêt d\'urgence. ",null),
("382","58","PTAC<3,5T:\nLes voitures utilitaires de moins de 3,5 tonnes sont soumises à la même réglementation que les véhicules légers. Ils doivent alors passer une visite technique réglementaire tous les deux ans après les 4 ans du véhicule. Il existe 3 catégories de véhicules utilitaires soumis au contrôle technique réglementaire tous les deux ans :\nCatégorie 1: les véhicules dédiés au transport en commun de personnes comportant plus de 9 places avec celle du conducteur\nCatégorie 2 : les véhicules dédiés au transport de marchandises et n’excédant pas 3,5 tonnes en charge\nCatégorie 3: les véhicules détenant des remorques ou semi-remorques dont le poids n’excède pas 3,5 tonnes.\nUne visite complémentaire est également obligatoire. Elle doit être réalisée entre deux contrôles techniques, soit à partir du 11ème mois de la dernière visite technique. Le contrôle complémentaire consiste à vérifier le niveau de pollution émis par le véhicule. ",null),
("383","57","ALARME INCENDIE:\nFaire contrôler le ou les systèmes d\'alarme incendie.\nLa consigne doit prévoir des essais et visites périodiques du matériel et des exercices au cours desquels le personnel apprend à reconnaître les caractéristiques du signal sonore d’alarme générale, à se servir des moyens de premier secours et à exécuter les diverses manœuvres nécessaires. \nCes exercices et essais périodiques doivent avoir lieu au moins tous les six mois. Leur date et les observations auxquelles ils peuvent avoir donné lieu sont consignés sur un registre tenu à la disposition de l’inspecteur du travail. ",null),
("384","52","ÉCHELLES/ESCABEAUX:\nPériodiquement et avant chaque utilisation les échelles et escabeaux doivent faire l’objet de vérifications visuelles.\nCes vérifications portent notamment sur :\n- Le bon état des patins antidérapants,\n- Le non-cintrage des « marches » et « barreaux »,\n- La non-déformation des montants\n- La présence et le bon état des assemblages (soudures, boulons, …),\n- …\nIl est préconisé de tenir à jour périodiquement des registres de contrôle des échelles et escabeaux.\n",null),
("385","67","CACES:\nInitier des formations à la conduite en sécurité pour les engins utilisés.\nIl existe différents types de CACES suivant les engins utilisés. Ils sont classés en trois familles :\n- Les chariots et transpalettes (CACES valable 5ans)\n- Les engins de chantier (CACES valable 10 ans)\n- Les plates-formes élévatrices mobiles de personnes (PEMP) (CACES valable 5 ans)\nChaque famille regroupe plusieurs catégories de CACES. L\'organisme de formation choisi pourra informer plus précisément la collectivité sur le choix de la catégorie.\nLa liste suivante présente les catégories de CACES pour les engins les plus utilisés en collectivité.\nMinipelle/tracteur<50cv: CACES 1\nTracteur>50cv: CACES 8\nTractopelle: CACES 4\nPEMP: CACES 1AB ou 3AB\n",null),
("386","69","CERTIBIOCIDE:\nInitier des formations \"certibiocide\"\nLe Certibiocide s’obtient après une formation abordant l’ensemble des points nécessaires à une utilisation efficace et plus sûre des produits biocides. \nUne journée de formation en passerelle est nécessaire pour les détenteurs du certiphyto.\nLes produits concernés par le « certibiocide » sont :\n- Les produits destinés exclusivement aux professionnels. \n- Les produit appartenant à l’un des types de produits biocides 8, 14, 15, 18 ou 20 ou leur utilisation vise à l\'assainissement et au traitement antiparasitaire des\nlocaux, matériels, véhicules, emplacements et dépendances utilisés :",null),
("387","72","CONTENU:\nLe contenu de la trousse de secours doit être adapté selon les risques auxquels sont exposés les agents, les situations de travail et leurs contraintes.\nAucun texte n’a établi de liste de produits obligatoires. Cependant, le matériel doit être en état de fonctionnement et les produits ne doivent pas être périmés.\nLe médecin du travail peut vous conseiller et adapter le contenu de la trousse aux activités des services. ",null),
("388","74","VEHICULES:\nInstaller des extincteurs dans les véhicules de plus de 3,5 T et ceux susceptibles d\'être à la source d\'un départ de feu (transport de carburant, tracteur épareuse, tracteur et gyrobroyeur...)  et former les agents à leur utilisation.",null),
("389","75","Recenser les principales activités dangereuses réalisées, l’outil le plus approprié pour prendre en compte la notion de travailleur isolé reste l’évaluation des risques.\nAfin de prendre des mesures préventives adaptées, la collectivité doit donc examiner toutes les situations et circonstances de travail isolé. Lors de cette analyse, les principaux facteurs présentés ci-dessous sont à considérer :\n-La durée de l’isolement ;\n-Les moyens de communication : \nQuels sont les modes de communication disponibles ?\nEst-il possible de voir ou d’entendre le travailleur ?\n-Le lieu de travail :\nEst-il éloigné ?\nFaut-il un moyen de transport pour s’y rendre ?\n-La nature du travail :\nQuels sont les outils, matériels, produits et machines utilisés ?\nLes activités sont-elles à haut risque ?\n-L’agent :\nPossède-t-il une expérience et une formation suffisante pour exercer l’activité concernée ?\nA-t-il des antécédents médicaux ?",null),
("390","76","ASTREINTE:\nSi l’activité de l’agent comprend des travaux dangereux nécessitant la présence d’un surveillant, ou que l’évaluation des risques a décelé des travaux présentant un risque particulier pour la santé et la sécurité de l’agent, alors l’agent ne doit pas travailler seul. Il est préconisé de réorganiser les astreintes de façon à ce qu’un second agent puisse se rendre disponible en cas d’intervention concernant une activité dangereuse.",null),
("393","227","LÉGIONELLOSE:\nMettre en place un programme de contrôle du taux de légionelles dans l’eau du (des) réseaux d’eau chaude sanitaire par un laboratoire accrédité COFRAC.",null),
("394","245","Le port des EPI suivants peut être rendu obligatoire en fonction des résultats de l’évaluation des risques professionnels : - Les vêtements de travail : blouse propre, légère, claire et solide (supportant les lavages) .   Les gants : 4 sortes de gants peuvent être utilisés selon le cas [* Les gants en maille métallique pour diminuer la gravité des coupures notamment lors de la découpe de la viande (norme CE-EN 1082-1), * Les gants souples pour la manipulation des denrées,  imperméables aux bactéries et jetables (en nitrile ou en latex), * Les gants de protection thermique pour l’usage du matériel et des installations de cuisson (four,…),* Les gants de protection contre les produits chimiques ], - Les chaussures ou sabots de sécurité : résistants et antidérapants  (normes CE-EN 345 ou 346), ) La coiffe : enveloppant l’ensemble de la chevelure, - Le masque bucco-nasal : son usage peut être nécessaire afin d’éviter la contamination des aliments ",null),
("395","75","ASTREINTE:\nSi l’activité de l’agent comprend des travaux dangereux nécessitant la présence d’un surveillant, ou que l’évaluation des risques a décelé des travaux présentant un risque particulier pour la santé et la sécurité de l’agent, alors l’agent ne doit pas travailler seul. Il est préconisé de réorganiser les astreintes de façon à ce qu’un second agent puisse se rendre disponible en cas d’intervention concernant une activité dangereuse.",null),
("397","247","Intégrer au document unique, l\'évaluation des risques liés aux chutes d\'objets et effondrements en s\'appuyant par exemple sur les recommandations de la CNAMTS",null),
("398","248","ECHELLE FIXE>3M:\nLes échelles fixes, d’une hauteur supérieure à 3 mètres, doivent être munies de crinolines (ensemble d’arceaux horizontaux et de montants verticaux solidaires de l’échelle et ayant pour fonction de limiter les conséquences d’une chute) à partir de 2,30 à 3 mètres du sol (l’usage recommande 2,50 mètres). La hauteur d’échelle entre 2 paliers successifs ne peut dépasser 9 mètres.\nComme pour tout équipement de travail, qu’il s’agisse d’échelles fixes ou d’échelles portables, d’escabeaux ou de marchepieds, il conviendra de s’assurer que le matériel a fait l’objet d’une évaluation qui prenne en compte sa solidité et la sécurité qu’il offre à l’utilisation en référence aux norme NF E 85-016.",null),
("399","243","SIGNALISATION:\nLa porte du local de stockage, côté extérieur, doit signaler la présence d\'artifices à l’intérieur du local et comporter une consigne de mise en garde contre le feu, les cigarettes et les étincelles.",null),
("400","249","PNEUMATIQUES:\nL’utilisation de pneus usés présente de nombreux risques et inconvénients : surconsommation de carburant, freinage moins efficace, glissade, dérapage, aquaplaning, éclatement du pneu.\nPour éviter ces risques, surveillez régulièrement l\'état des pneus.\nLes pneus doivent être changés lorsqu’ils ont atteint le niveau signalé par le témoin d’usure. Les pneumatiques peuvent également présenter une usure anormale (usure irrégulière avec présence par exemple de déchirures ou de bosses sur les flancs du pneu). Dans ce cas, il est indispensable de changer le pneu, le risque d’éclatement étant très important.",null),
("401","209","SOUDAGE:\nL’équipement de protection individuelle du soudeur comporte :\n- casque de soudeur avec écran en matériau adapté (pour la soudure électrique) ou lunettes avec verre adéquat (pour la soudure au chalumeau).\n- gants en cuir avec manchettes\n- chaussures de sécurité et guêtres\n- vêtements de travail (ensemble pantalon, veste, cagoule) en coton ignifugé ou textile technique ininflammable, tablier en cuir\n- Protection antibruit en fonction du niveau de bruit \n",null),
("402","250","PRÉSENCE:\nÉquiper la cuisine d\'une couverture anti-feu.\nLa couverture anti-feu fait aussi partie de l\'équipement de base dans la prévention de l\'incendie.\nLa couverture peut être utilisée dans 2 cas : éteindre un départ de feu dans une pièce, notamment une cuisine (car, contrairement à un extincteur, elle peut être utilisée sur les feux provoqués par l\'huile de cuisson) et couvrir une personne dont les vêtements auraient pris feu.\nDe plus, la couverture n\'aggrave pas les dégâts comme le fait l\'eau ou la poudre chimique contenu dans un extincteur. L\'utilisation rapide d’une couverture anti-feu en fibres aramides ou en fibre de verre, disponible à proximité, permet d\'éteindre un feu avant qu\'il n\'engendre des dommages majeurs ou des blessures gravissimes.",null),
("403","250","POSITIONNEMENT:\nLa couverture anti-feu est destinée à étouffer un feu avant qu’il ne prenne de l’ampleur ou pour éteindre une personne en feu.\nElle doit donc être positionnée au plus près de la source d\'ignition, être visible et facilement accessible.",null),
("404","251","MISE A DISPOSITION:\nÉquiper les agents d\'équipement de protection individuelle (casque, chaussures de sécurité) adapté",null),
("405","251","PORT:\nFaire un rappel du port obligatoire des protections individuelles mises à disposition\nChaque agent doit connaître les risques contre lesquels les équipements de protection individuelle les protègent, les conditions d’utilisation, notamment les consignes pour le stockage et l’entretien de ces équipements. L’agent doit aussi connaître ses responsabilités en cas de non-respect des consignes d’utilisation.\nTout agent qui refuse ou s’abstient d’utiliser les EPI, conformément aux instructions, peut engager sa responsabilité et s’exposer à des sanctions.\n",null),
("406","251","ETAT:\nRemplacer les casques déformés et dont la date apposée en sérigraphie est dépassée.\nIl est conseillé d\'entretenir les protections  selon les recommandations du fabricant pour leur conserver toute leur efficacité et leur intégrité.\n",null),
("407","249","ECLAIRAGE:\nVérifiez régulièrement le bon fonctionnement de l’ensemble des feux des véhicules: croisement, route, position avant et arrière, clignotants et feux de détresse, feux stop, éclairage de la plaque arrière, feux supplémentaires de signalisation... \nContrôlez également que les klaxons fonctionnent bien.\nDans le cadre de la démarche d’évaluation et de prévention de l’ensemble des risques professionnels, la maîtrise du risque routier revêt un véritable enjeu au regard des conséquences économiques, humaines et organisationnelles engendrées par les accidents de la route au travail.\n\n",null),
("410","175","S’assurer que des équipements de protection (lunettes, masque, gants, combinaison, tabliers...),   ne sont en aucun cas stockés dans le même endroit que les produits.",null),
("412","253","Aucune boisson alcoolisée autre que le vin, la bière, le cidre et le poiré n\'est autorisé sur le lieu de travil.\nSeule l\'introduction de ces boissons faiblement alcoolisées est permise notamment pour la restauration.\nCette interdiction est générale et vise aussi bien la hiérarchie  que l\'ensemble des agents. L\'usage modéré pour ces alcools demeure sous la responsabilité à la fois de l\'organisation et des agents consommateurs.\nEn contrepartie, l\'Autorité territoriale  met à la disposition des agents de l\'eau potable et fraiche.",null),
("413","254","Mette en place une démarche de prévention s\'appuyant sur une sensibilisation /information des agents",null),
("414","253","Si la structure est soumise à un règlement intérieur, il est important que celui-ci rappelle les obligations et interdictions en matière de risque alcool.",null),
("415","254","L\'Autorité territoriale affirme et affiche une politique de prévention et de gestion du risque alcool claire en fixant les limités, en les rappelant régulièrement , en intervenant de manière graduée et en disposant de procédures permettant de gérer les situations.",null),
("416","254","M^me si(il n\'est pas obligatoire  dans la fonction publique territoriale, le règlement intérieur peut être un bon moyen de fixer les règles d\'organisation et de fonctionnement de la collectivité en matière d’hygiène et sécurité et notamment dans le cadre de la gestion des situations d’alcoolisation. \n ",null);




CREATE TABLE `resume_article` (
  `NUM_RESUME_ARTICLE` smallint(6) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION_RESUME_ARTICLE` varchar(10000) DEFAULT NULL,
  `DATE_ARTICLE` date DEFAULT NULL,
  PRIMARY KEY (`NUM_RESUME_ARTICLE`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


INSERT INTO resume_article VALUES
("202","Art.R.4543-19 du CdT:- (Décr. no 2008-1325 du 15 déc. 2008 ) \nUn travailleur isolé doit pouvoir signaler toute situation de détresse et être secouru dans les meilleurs délais.\nAfin de s’assurer que les agents travaillant seuls soient à même de pouvoir alerter leur responsable hiérarchique et les secours dans tous les cas. :\nEtablir une liste des agents travaillant seuls et sans moyens d’alerte (même temporairement)\nPlanifier par la suite les actions à mener pour remédier à cette situation critique en cas d’accident.",null),
("203","L’article R.02223-42 du Code général des collectivités territoriales précise que les agents qui exécutent l’une des prestations funéraires (inhumation, exhumation)\ndoivent justifier d’une formation professionnelle d’une durée de seize heures. Cette formation porte sur la législation et la réglementation funéraires, l’hygiène et la\nsécurité, la psychologie et la sociologie du deuil. Elle doit avoir été dispensée, aux agents concernés, dans les trois mois à compter du début de l’exercice de leurs\nfonctions.\n",null),
("204","Art.L.2223-23 Code général des collectivités territoriales:\nLes régies, les entreprises ou les associations et chacun de leurs établissements qui, habituellement, sous leur marque ou non, fournissent aux familles des prestations énumérées à l’article L. 2223-19 ou définissent cette fourniture ou assurent l’organisation des funérailles doivent être habilités à cet effet selon des modalités et une durée prévues par décret en Conseil d’Etat.",null),
("205","Art.R.4323-58 à 60  du CdT:\nL’employeur doit évaluer les risques et privilégier la prévention technique collective, chaque fois qu’elle est possible.\n-Prévention des chutes de hauteur par des garde-corps, placés à une hauteur comprise entre un mètre et 1,10 m et comportant au moins une plinthe de butée de 10 à 15 cm, en fonction de la hauteur retenue pour les garde-corps, une main courante et une lisse intermédiaire à mi-hauteur ou par tout autre moyen assurant une sécurité équivalent\nArt.R.4421-1 à 4 , Art.R.4422-1  et Art.R.4423-1 à 4 du CdT. le Décret n° 94-352 du 4 mai 1994 relatif à la protection des travailleurs contre les risques résultant de leur exposition à des agents biologiques et l\'Arrêté du 30 juin 1998 qui fixe la liste des agents biologiques pathogènes\n",null),
("206","Art.L.4121-1 du CdT:\nL’employeur prend les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs.\nCes mesures comprennent :\n- des actions de prévention des risques professionnels,\n- des actions d’information et de formation,\n- la mise en place d’une organisation et de moyens adaptés.\nL’employeur veille à l’adaptation de ces mesures pour tenir compte du changement des circonstances et tendre à l’amélioration des situations existantes.\n\nArt.R.4323-59  du CDT :\n La prévention des chutes de hauteur à partir d’un plan de travail est assurée :\n1° Soit par des garde-corps intégrés ou fixés de manière sûre, rigides et d’une résistance  appropriée, placés à une hauteur comprise entre un mètre et 1,10 m et comportant au moins :\n    a) Une plinthe de butée de 10 à 15 cm, en fonction de la hauteur retenue pour les garde-corps ;\n    b) Une main courante ;\n    c) Une lisse intermédiaire à mi-hauteur ;\n2° Soit par tout autre moyen assurant une sécurité équivalente.Lorsque les dispositions précédentes ne peuvent être mises en oeuvre, des dispositifs de recueil souples doivent être installés et positionnés de manière à permettre d’éviter une chute de plus de trois mètres.",null),
("207","Art.R.4543-19 du CdT:- (Décr. no 2008-1325 du 15 déc. 2008 ) \nUn travailleur isolé doit pouvoir signaler toute situation de détresse et être secouru dans les meilleurs délais.\nAfin de s’assurer que les agents travaillant seuls soient à même de pouvoir alerter leur responsable hiérarchique et les secours dans tous les cas. :\nEtablir une liste des agents travaillant seuls et sans moyens d’alerte (même temporairement)\nPlanifier par la suite les actions à mener pour remédier à cette situation critique en cas d’accident.",null),
("208","Dispositions générales sur :\n- l’aération/assainissement des locaux de travail (article R. 4221-1 , R. 4222-1 et suivants, en particulier Art.R. 4222-12 dans les locaux à pollution spécifique, les fumées doivent être captées « au fur et à mesure de leur production, au plus près de leur source d’émission et aussi efficacement que possible… »), et R. 4222-23 et R. 4222-24 (travaux en espace confiné) ; \n- prévention du risque chimique (article R. 4412-1 et suivants).\n\n- Permis de feu: (Décret n°92-158 et arrêté du 19 mars 1993) Un permis de travail est établi systématiquement pour les travaux par point chaud\n- Eclairage suffisant\n- Système de ventilation/ aspiration en place: attention aux travaux en espace confiné\n- Stockage des bouteilles conforme (pour le soudage): Du fait des caractéristiques d’explosivité et d’inflammation des mélanges oxygène-gaz, les bouteilles d’oxygène doivent être stockées à l’écart des bouteilles de gaz combustible.\n- Système d’extinction (à eau pulvérivée pour le soudage) à proximité.",null),
("209","- EPIs adaptés (vêtement difficilement inflammable, lunettes de protection, protection respiratoire si absence de système de ventilation)\nR.4534-132 du CdT:\n Des appareils respiratoires empêchant l\'inhalation des vapeurs ou poussières nocives sont mis à la disposition des travailleurs qui réalisent des travaux de soudage, de rivetage ou de découpage sur des éléments recouverts de peinture au minium de plomb, ainsi qu\'à la disposition des travailleurs qui réalisent des travaux de métallisation ou de sablage.\nCes appareils sont maintenus en bon état de fonctionnement et désinfectés avant d\'être attribués à un nouveau titulaire.\n\n- Masque optoélectronique à disposition pour le soudage\nR.4534-133 du CdT:\nLorsque des travaux de soudage à l\'arc sont accomplis sur un chantier, des écrans masquent les arcs aux personnes autres que les soudeurs ou leurs aides, afin de supprimer les risques d\'éblouissement et les dangers du rayonnement ultra-violet.\nA défaut d\'écrans protecteurs, les zones dangereuses sont délimitées et convenablement signalées.\n\n- Ecran de protection à disposition pour le meulage.",null),
("210","Art.R.4543-19 du CdT:- (Décr. no 2008-1325 du 15 déc. 2008 ) \nUn travailleur isolé doit pouvoir signaler toute situation de détresse et être secouru dans les meilleurs délais.\nAfin de s’assurer que les agents travaillant seuls soient à même de pouvoir alerter leur responsable hiérarchique et les secours dans tous les cas. :\nEtablir une liste des agents travaillant seuls et sans moyens d’alerte (même temporairement)\nPlanifier par la suite les actions à mener pour remédier à cette situation critique en cas d’accident.",null),
("211","Art.R.4222-12  du CdT: \nDans les locaux à pollution spécifique, les fumées doivent être captées « au fur et à mesure de leur production, au plus près de leur source d’émission et aussi efficacement que possible… »), et R. 4222-23 et R. 4222-24 (travaux en espace confiné) ; prévention du risque chimique (article R. 4412-1 et suivants).\n\n",null),
("212","Arrêté du 7 février 2012 JORF n°0046 du 23 février 2012 , article 1:\nIl est créé un certificat individuel pour l’activité “utilisation à titre professionnel des produits phytopharmaceutiques” dans les catégories “applicateur” en collectivités territoriales et “applicateur opérationnel” en collectivités territoriales.\nLa durée de validité des certificats individuels est de 5 ans.",null),
("213","DECRET 87-361 du 27 mai 1987 article 8:\nLes équipements de protection doivent, après leur nettoyage, être placés dans une armoire-vestiaire individuelle destinée à ce seul usage et située dans un local autre que celui visé à l\'article 4 ci-dessus. ",null),
("214","Le règlement (CE)/1107/2009 : tenir à jour un registre des applications de produits phytosanitaires:\nLes utilisateurs professionnels de produits phytosanitaires, qu’ils soient agents en collectivités ou prestataires soumis à agrément, doivent tenir un registre des applications des produits phytosanitaires qui doit comporter, par intervention réalisée : la date de l’utilisation, le nom commercial complet du produit, la dose utilisée, l’identification des végétaux traités, l’identification des zones traitées, et l’identification du client dans le cas particulier des prestataires de service soumis à agrément. Ce registre doit être conservé pendant 3 ans.",null),
("215","DECRET 87-361 du 27 mai 1987:\nArt.4:\nLes produits antiparasitaires doivent être placés dans un local réservé à cet usage.\nCe local doit être aéré ou ventilé. Il doit être fermé à clef s’il contient des produits antiparasitaires classés très toxiques, toxiques, cancérogènes, tératogènes ou mutagènes. Cette clef est conservée par l’employeur.",null),
("216","- Arrêté du 29 septembre 1997.\n\n- Règlement (CE) n° 852/2004 du Parlement européen et du Conseil du 29 avril 2004 relatif à l\'hygiène des denrées alimentaires - Annexe II-Chapitre XII: \"\nLes exploitants du secteur alimentaire doivent veiller :\n1) à ce que les manutentionnaires de denrées alimentaires soient encadrés et disposent d\'instructions et/ou d\'une formation en matière d\'hygiène alimentaire adaptées à leur activité professionnelle ;\n2) à ce que les personnes responsables de la mise au point et du maintien de la procédure visée à l\'article 5, paragraphe 1, du présent règlement, ou de la mise en œuvre des guides pertinents dans leur entreprise aient reçu la formation appropriée en ce qui concerne l\'application des principes HACCP ;\net\n3) au respect de toute disposition du droit national relative aux programmes de formation des personnes qui travaillent dans certains secteurs de l\'alimentation.\n\n",null),
("217","Art.6 du Règlement (CE) n°852/2004  du 29 avril 2004 relatif aux Contrôles officiels, enregistrement et agrément: \n\"1. Les exploitants du secteur alimentaire coopèrent avec les autorités compétentes conformément aux autres dispositions législatives communautaires applicables ou, lorsqu\'il n\'en existe pas, au droit national.\n2. En particulier, tout exploitant du secteur alimentaire notifie à l\'autorité compétente appropriée, en respectant les exigences de celle-ci, chacun des établissements dont il a la responsabilité et qui mettent en œuvre l\'une des étapes de la production, de la transformation et de la distribution des denrées alimentaires, en vue de l\'enregistrement d\'un tel établissement.\nLes exploitants du secteur alimentaire veillent, en outre, à ce que les autorités compétentes disposent en permanence d\'informations à jour sur les établissements, y compris en signalant toute modification significative de leurs activités et/ou toute fermeture d\'un établissement existant.\n3. Toutefois, les exploitants du secteur alimentaire veillent à ce que les établissements soient agréés par les autorités compétentes, à la suite d\'au moins une inspection sur place, lorsque l\'agrément est exigé :\n  a) en vertu du droit national de l\'État membre dans lequel se situe l\'établissement ;\n  b) conformément au règlement (CE) nº 853/2004 ;\n  ou\n  c) par une décision arrêtée par la Commission. Cette mesure, qui vise à modifier des éléments non essentiels du présent règlement, est arrêtée en conformité avec la   procédure de réglementation avec contrôle visée à l\'article 14, paragraphe 3. 2*\nTout État membre exigeant l\'agrément de certains établissements situés sur son territoire en vertu du droit national, comme prévu au point a), informe la Commission et les autres États membres des règles de droit national pertinentes.\n",null),
("218","Art.L.4121-2 du CdT:\nL’employeur met en oeuvre les mesures prévues à l’article L. 4121-1 sur le fondement des principes généraux\n4° principe: Adapter le travail à l’homme, en particulier en ce qui concerne la conception des postes de travail ainsi que le choix des équipements de travail et des méthodes de travail et de production, en vue notamment de limiter le travail monotone et le travail cadencé et de réduire les effets de ceux-ci sur la santé ;\n- Hauteur des plans de travail\n- Rehausse des bacs de lavage \n- Portes munies d’oculus \n- Dimensions des locaux\n- Containers à déchets adaptés aux manipulations.",null),
("219","Art.R.4412-87du CdT:\nL\'employeur organise, en liaison avec le comité d\'hygiène, de sécurité et des conditions de travail et le médecin du travail, l\'information et la formation à la sécurité des travailleurs susceptibles d\'être exposés à l\'action d\'agents cancérogènes, mutagènes ou toxiques pour la reproduction.\nCette information et cette formation concernent, notamment:\n  1° Les risques potentiels pour la santé, y compris les risques additionnels dus à la consommation du tabac\n  2° Les précautions à prendre pour prévenir l\'exposition;\n  3° Les prescriptions en matière d\'hygiène ;\n  4° Le port et l\'emploi des équipements et des vêtements de protection ;\n  5° Les mesures à prendre par les travailleurs, notamment par le personnel d\'intervention, pour la prévention d\'incidents et en cas d\'incident.\n\nArt.R.4323-3 du CdT:\nLa formation à la sécurité dont bénéficient les travailleurs chargés de l\'utilisation ou de la maintenance des équipements de travail est renouvelée et complétée aussi souvent que nécessaire pour prendre en compte les évolutions de ces équipements.",null),
("220","La démarche de prévention des risques professionnels impose avant tout à l’employeur de chercher à éviter les risques ou à les limiter (article L.4121-1 du CdT). Les mesures, mises en place sur le fondement des principes généraux de prévention (article L.4121-2 du CdT), auront pour objet de maîtriser les risques qui ne peuvent être évités, en intégrant la sécurité le plus en amont possible des procédés de travail, et en privilégiant les mesures de protection collective sur les moyens de protection individuelle.\n \nEn raison notamment de la grande diversité de situations rencontrées, le CdT confère à l’employeur le pouvoir et la responsabilité :\nd’identifier les situations d’isolement physique,\nd’apprécier l’opportunité de prendre en considération ces situations et d’y remédier,\nde déterminer les mesures appropriées à leur prévention.\n\nCette approche conduira à rechercher des mesures organisationnelles, des mesures de protection collective, des moyens de protection individuelle, mais aussi des mesures de formation et d’information des travailleurs appropriés aux problèmes spécifiques liés à l’isolement.",null),
("221","L\'article L6321-1 du code du travail précise que \"l\'employeur assure l\'adaptation des salariés à leur poste de travail. Il veille au maintien de leur capacité à occuper un emploi, au regard notamment de l\'évolution des emplois, des technologies et des organisations. Il peut proposer des formations qui participent au développement des compétences, ainsi qu\'à la lutte contre l\'illettrisme\".\nArt.R.4412-38 du Cdt (Décret n° 2008-244 du 7 mars 2008)\nL\'employeur veille à ce que les travailleurs ainsi que le comité d\'hygiène, de sécurité et des conditions de travail ou, à défaut, les délégués du personnel :\n1°) Reçoivent des informations sous des formes appropriées et périodiquement actualisées sur les agents chimiques dangereux se trouvant sur le lieu de travail, telles que notamment leurs noms, les risques pour la santé et la sécurité qu\'ils comportent et, le cas échéant, les valeurs limites d\'exposition professionnelle et les valeurs limites biologiques qui leur sont applicables ;\n2°) Aient accès aux fiches de données de sécurité fournies par le fournisseur des agents chimiques ;\n3°) Reçoivent une formation et des informations sur les précautions à prendre pour assurer leur protection et celle des autres travailleurs présents sur le lieu de travail. Sont notamment portées à leur connaissance les consignes relatives aux mesures d\'hygiène à respecter et à l\'utilisation des équipements de protection individuelle.",null),
("222","Art.R.4312-1 du CdT:\nLes machines neuves ou considérées comme neuves au sens de l’article R. 4311-1 sont soumises aux règles techniques prévues par l’annexe I figurant à la fin du présent titre.\nArt.R.4412-70 du CdT:\nDans tous les cas d’utilisation d’un agent cancérogène, mutagène ou toxique pour la reproduction l’employeur applique les mesures suivantes : \n1° Limitation des quantités de cet agent sur le lieu de travail ; \n2° Limitation du nombre de travailleurs exposés ou susceptibles de l’être ; \n3° Mise au point de processus de travail et de mesures techniques permettant d’éviter ou de minimiser le dégagement d’agents ; \n4° Evacuation des agents conformément aux dispositions des articles R. 4222-12 et R. 4222-13 ;",null),
("223","Art.R.4412-149 du CdT:\nLes concentrations des agents chimiques présents dans l’atmosphère des lieux de travail figurant dans le tableau suivant ne doivent pas dépasser, dans la zone de respiration des travailleurs, les valeurs limites d’exposition professionnelle définies ci-après :\nPoussière de bois: 1mg/m3\nLes modalités de prélèvement, les méthodes et moyens à mettre en œuvre pour mesurer les concentrations dans l’air des agents chimiques dangereux ainsi que les caractéristiques et conditions d’utilisation des équipements de protection individuelle contre ces agents sont fixés par arrêté conjoint des ministres chargés du travail et de l’agriculture.",null),
("224","Art.R.4214-26 du CdT:\n-Les lieux de travail, y compris les locaux annexes, aménagés dans un bâtiment neuf ou dans la partie neuve d’un bâtiment existant sont accessibles aux personnes handicapées, quel que soit leur type de handicap. \n« Les lieux de travail sont considérés comme accessibles aux personnes handicapées lorsque celles-ci peuvent accéder à ces lieux, y circuler, les évacuer, se repérer, communiquer, avec la plus grande autonomie possible. \nArt.R.4214-27 du CdT:\n-Des dérogations aux dispositions de l’article R. 4214-26 peuvent être accordées par le préfet, après avis de la commission consultative départementale de sécurité et d’accessibilité, en cas d’impossibilité technique résultant de l’environnement du bâtiment. \nArt.L.5213-6 du CdT:\nAfin de garantir le respect du principe d’égalité de traitement à l’égard des travailleurs handicapés, l’employeur prend, en fonction des besoins dans une situation concrète, les mesures appropriées pour permettre aux travailleurs mentionnés aux 1° à 4° et 9° à 11° de l’article L. 5212-13 d’accéder à un emploi ou de conserver un emploi correspondant à leur qualification, de l’exercer ou d’y progresser ou pour qu’une formation adaptée à leurs besoins leur soit dispensée.",null),
("225","Réglementation ERP. Art.PE 4\n\nEn cours d’exploitation, l’exploitant doit procéder, ou faire procéder par des techniciens compétents, aux opérations d’entretien et de vérification des installations et des équipements techniques de son établissement (entrée en vigueur le 1er mars 2006, de l’article 1er de l’arrêté du 10 octobre 2005) :\n - chauffage,\n - éclairage (de sécurité et d’évacuation), \n - installations électriques, appareils de cuisson, \n - circuits d’extraction de l’air vicié, des buées et des graisses des grandes cuisines, des offices de remise en température et des îlots\n - ascenseurs,\n - moyens de secours.\n\nNote : Le CT renvoie clairement, pour certaines dispositions, à la réglementation ERP mais indique que, en cas de superposition avec la réglementation du CdT, la plus contraignante s’applique.",null),
("226","Décret n°94-699 du 10/08/94\nDécret n°96-1136du 18/12/1996\n\nVérifications régulières:\n- Visuelles (1x/j à 1x/semn)\n- Contrôles détaillés pour le fonctionnement, la stabilité et la surface ? (1X/ mois à 1X/trimestre)\n- Vérif. détaillées des structures et fondations par un organisme Qualifié (1X/trimestre à 1X/an)\n\nConsignées dans un registre :Installations ; Contrôle ; Maintenance ; Réparations ; Accidents éventuels\n\nPrésence d’informations ou de consignes au niveau de l’air de jeux: (Exploitant ; infos parents ; id. alphanumérique ; mention « conforme aux exigence de sécurité »…).",null),
("227"," - Risque amiante\nDécret n°96-97, Décret n°96-98, Décret n°97-855, Décret n°2001-840, Décret n°2002-839, Décret n°2002-1528, Décret n 2003-462, Décret n 2004-802, Décret n°2012-639, art R.4412-94 à 148 du CdT)\nArrêté du 21 décembre 2012 relatif aux recommandations générales de sécurité et au contenu de la fiche récapitulative du « dossier technique amiante »\nArrêté du 23 février 2012 issu de la directive européenne n°2009/148/CE\n\nEvaluation des risques pour les agents, repérage des matériaux ( DTA) et liste des agents exposés\n\nFormation et information à la prévention, à la sécurité et sur les risques potentiels de l’amiante sur la santé.\n\n - Risque légionellose\nCirculaire DGS/VS4 du 31 décembre 1998\n\n - Risque radon\nCirculaire n°99/46 du 27 janvier 199, arrêté du 22 juillet 2004\nLes catégories de lieux ouverts au public concernés par les mesures de radon comptent les établissements d’enseignement.",null),
("229","Décret 2003 - 296 du 31 mars 2003 relatif à la protection des travailleurs contre les dangers des rayonnements ionisants:\nArt.R.4451-7 à  Art.R.4451-11 du CdT:\nArt.R.4451-7 du CdT: \" L\'employeur prend les mesures générales administratives et techniques, notamment en matière d\'organisation du travail et de conditions de travail, nécessaires pour assurer la prévention des accidents du travail et des maladies professionnelles susceptibles d\'être causés  par l\'exposition aux rayonnements ionisants résultant\ndes activités ou des interventions mentionnées à l\'article R. 4451-1 ainsi que de celles mentionnées au deuxième alinéa de l\'article R. 4451-2.\"\nArt.R.4451-1 du CdT: \"  Les dispositions du présent titre s\'appliquent, dans le respect des principes énoncés à l\'article L. 1333-1 du code de la santé publique, dès lors que des travailleurs sont susceptibles d\'être exposés à un risque dû aux rayonnements ionisants :\n  1° Résultant d\'activités nucléaires soumises à un régime d\'autorisation ou de déclaration en application de l\'article L. 1333-4 du code de la santé publique ou des installations\net activités nucléaires intéressant la défense mentionnées à l\'article L. 1333-15 du code de la défense ;\n  2° Survenant au cours d\'interventions mentionnées à l\'article L. 1333-1 du code de la santé publique réalisées en situation d\'urgence radiologique ou résultant d\'une\nexposition durable aux rayonnements ionisants, telles que définies en application du 3° de l\'article L. 1333-20 du même code.\"\nArt.R.4451-136 du CdT: \"Dans les établissements situés dans les départements ou parties de départements figurant sur la liste prévue à l\'article R. 1333-15 du code de la santé publique, où les travailleurs, en raison de la situation de leurs lieux de travail, sont exposés à l\'activité du radon, l\'employeur fait procéder à des mesures de cette activité par un organisme agréé mentionné à l\'article R. 1333-15 du code de la santé publique ou par l\'Institut de radioprotection et de sûreté nucléaire.\nLorsque les résultats des mesures effectuées sont supérieurs aux niveaux fixés par une décision de l\'Autorité de sûreté nucléaire, l\'employeur met en œuvre les actions nécessaires pour réduire l\'exposition aussi bas que raisonnablement possible.\"\nValeurs limites réglementaires: conformément au code du Travail Ces valeurs « absolues » sont des limites à ne pas dépasser. Limites en millisievert/an (mSv sur 12 mois)\nPersonne exposée: 20 mSv: dose efficace pour le corps entier. 500 mSv: dose équivalente pour les mains, avant bras, pied . 500 mSv: dosé équivalente sur tout cm2 de peau .\nSalariés entre 16 et 18 ans: 6 mSv: dose efficace pour le corps entier. 150 mSv dose équivalente pour les mains, avant bras, pied  150 mSv dose équivalente sur tout cm2 de peau.\nFemmes enceintes: La dose doit être inférieure à 1 mSv de la déclaration de grossesse à l’accouchement\nFemmes qui allaitent: Elles ne doivent pas occuper un poste qui entraîne un risque d’exposition interne.\nArrêté du 7 août 2008 relatif à la gestion du risque radon dans les lieux de travail.",null),
("230","Art.R.4323-23 et 24 du CdT:\nDes arrêtés du ministre chargé du travail ou du ministre chargé de l\'agriculture déterminent les équipements de travail ou les catégories d\'équipement de travail pour lesquels l\'employeur procède ou fait procéder à des vérifications générales périodiques afin que soit décelée en temps utile toute détérioration susceptible de créer des dangers.\nCes arrêtés précisent la périodicité des vérifications, leur nature et leur contenu.\nLes vérifications générales périodiques sont réalisées par des personnes qualifiées, appartenant ou non à l\'établissement, dont la liste est tenue à la disposition de l\'inspection du travail.\nCes personnes sont compétentes dans le domaine de la prévention des risques présentés par les équipements de travail soumis à vérification et connaissent les dispositions réglementaires afférentes.\n\nArrêté du 24 juin 1993 soumettant certains équipements de travail à l\'obligation de faire l\'objet de vérifications générales périodiques:\nLes équipements de travail suivants doivent avoir fait l\'objet, depuis moins de douze mois au moment de leur utilisation, de la vérification générale périodique prévue à l\'article R. 4323-23 du code du travail :\n- arbres à cardans de transmission de puissance, amovibles entre une machine automotrice ou un tracteur et une machine réceptrice et dispositifs de protection desdits arbres à cardans ;",null),
("232","Art.R4311-8 du CdT:\nLes E.P.I sont définis par le CdT comme des « dispositifs ou moyens destinés à être portés ou tenus par une personne en vue de la protéger contre un ou plusieurs risques susceptibles de menacer sa santé ou sa sécurité » .\nIls doivent être utilisés dans des situations de travail exposant l’agent à des nuisances. L’autorité territoriale doit au préalable identifier et évaluer les risques afin de définir les mesures de prévention permettant de préserver la santé et la sécurité des agents [Art.L. 4121-1 du CdT]\n\nArt.R.4323.-104 du CdT: \nL’employeur doit informer de manière appropriée les agents utilisant les équipements de protection individuelle.\nCette information doit porter sur :\n• Les risques contre lesquels l’E.P.I. protège\n• Les conditions d’utilisation des E.P.I., notamment les usages auxquels ils sont réservés,\n• Les instructions ou consignes concernant les E.P.I.\n• Les conditions de mise à disposition. \n\n",null),
("233","Art.R.4323-81 à 88 du CdT:\nLes échelles, les escabeaux et les marchepieds ne doivent pas être utilisés comme des postes de travail (c’est-à-dire comme lieu de réalisation d’une tâche). Toutefois, ces équipements peuvent être utilisés en cas d’impossibilité technique de recourir à un équipement assurant une protection collective ou lorsque l’évaluation du risque a établi que ce risque est faible et qu’il s’agit de travaux de courte durée ne présentant pas un caractère répétitif.\nVeiller au bon état de ces équipements (patins et barreaux notamment). Investir, peu à peu, dans du matériel marqué « Conforme aux exigences de sécurité ».",null),
("234","defaut",null),
("235","Art.L.4121-1 du CdT:\nL’employeur prend les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs.\nCes mesures comprennent :\n- des actions de prévention des risques professionnels,\n- des actions d’information et de formation,\n- la mise en place d’une organisation et de moyens adaptés.\nL’employeur veille à l’adaptation de ces mesures pour tenir compte du changement des circonstances et tendre à l’amélioration des situations existantes.\n\nArt.L 4121-3 du CdT:\nL’employeur, compte tenu de la nature des activités de l’établissement, évalue les risques pour la santé et la sécurité des travailleurs, y compris dans le choix des procédés de fabrication, des équipements de travail, des substances ou préparations chimiques, dans l’aménagement ou le réaménagement des lieux de travail ou des installations et dans la définition des postes de travail.\nA la suite de cette évaluation, l’employeur met en œuvre les actions de prévention ainsi que les méthodes de travail et de production garantissant un meilleur niveau de protection de la santé et de la sécurité des travailleurs. Il intègre ces actions et ces méthodes dans l’ensemble des activités de l’établissement et à tous les niveaux de l’encadrement.",null),
("236","L’autorité territoriale évalue les risques encourus pour la santé et la sécurité des travailleurs pour toute activité susceptible de présenter un risque d’exposition à des agents chimiques dangereux (extrait de l’article R 4412-5 du CdT). Pour plus d’information sur le risque chimique, voir la fiche n°10 : Prévention du risque chimique.\nConformément aux dispositions de l’article D.1332-3 du code de la santé publique (CSP), les produits et les procédés permettant de satisfaire aux exigences de qualité d’eaux de piscines ouvertes au public fixées à l’article D.1332-2 font l’objet d’une autorisation d’utilisation de la part du ministère chargé de la santé, après avis de l’Agence nationale de sécurité sanitaire (Anses).\nPar ailleurs, l’arrêté du 7 avril 1981 modifié fixant les dispositions techniques applicables aux piscines, prévoit que cette procédure s’applique aux produits et procédés utilisés pour la désinfection de l’eau des piscines (Art.5) et aux procédés permettant de réduire la teneur en chloramines dans les bassins (Art.5 bis). \nArt.5 bis\nPour respecter les dispositions prévues à l\'article 5 du présent arrêté, concernant la teneur en chlore total de l\'eau, il peut être fait appel à des produits ou procédés qui permettent de réduire la teneur en chlore combiné dans les bassins.\n\n",null),
("237","Art.R.4214-3 du CdT:\nLes planchers des locaux sont exempts de bosses, de trous ou de plans inclinés dangereux.\nIls sont fixes, stables et non glissants.\n\nArt.R.4214-9 du CdT:\nL\'implantation et les dimensions des voies de circulation, y compris les escaliers et les échelles fixes sont déterminées en tenant compte des dispositions du chapitre VI relatives à la prévention des incendies et l\'évacuation.\nLes voies de circulation sont conçues de telle sorte que :\n1° Les piétons ou les véhicules puissent les utiliser facilement, en toute sécurité, conformément à leur affectation ;\n2° Les travailleurs employés à proximité des voies de circulation n\'encourent aucun danger.\n\nArt.R.4214-22 du CdT:\nLes dimensions des locaux de travail, notamment leur hauteur et leur surface, sont telles qu\'elles permettent aux travailleurs d\'exécuter leur tâche sans risque pour leur santé, leur sécurité ou leur bien-être.\nL\'espace libre au poste de travail, compte tenu du mobilier, est prévu pour que les travailleurs disposent d\'une liberté de mouvement suffisante.\nLorsque, pour des raisons propres au poste de travail, ces dispositions ne peuvent être respectées, il est prévu un espace libre suffisant à proximité de ce poste.\n",null),
("239","Art.R.4323-55 du CdT:\nLa conduite des équipements de travail mobiles automoteurs et des équipements de travail servant au levage est réservée aux travailleurs ayant reçu une formation adéquate. Cette formation est complétée et réactualisée chaque fois que nécessaire.\nArrêté du 2 décembre 1998  Circulaire DRT 99-7 du 15 juin 1999\nLa formation et la conduite des équipements de travail mobiles automoteurs et des équipements de levage de charges ou de personnes  : \n- Tractopelle : CACES R372 M (cat. 4) valable 10 ans\n- Balayeuses, Mini-pelle et Tracteurs agricole de – de 50 ch. : CACES R372M (cat. 1) valable 10 ans\n- Tracteurs agricole de + de 50 ch. : CACES R372 M  (cat.8) valable 10 ans\n- PEMP : CACES R386 (et de catégorie, à priori, 1B) valable 5 ans\nS’assurer également que le loueur de la nacelle la fasse vérifier tous les 6 mois\nPrécisions : les conducteurs de certains engins spéciaux ou de travaux publics, parmi lesquels les tractopelles, sont dispensés de l’obligation de détenir un permis de conduire (mais non du CACES). Néanmoins, si les tractopelles sont amenés à circuler sur la voirie (ainsi que les balayeuses), il apparaît nécessaire que les conducteurs possèdent le permis de conduire adéquat à la catégorie du véhicule (B ou C), qui doit être immatriculé\n Les balayeuses tractées, portées ou semi-portées ne nécessitent pas de CACES pour la balayeuse proprement dite mais pour l’engin tracteur. Les balayeuses immatriculées nécessitent le permis (B, C…) correspondant à la catégorie du véhicule.\nLes balayeuses automotrices à conducteur porté nécessitent le CACES catégorie 1 (R372M) + une autorisation de conduite.",null),
("240","Arrêté du 21 mars 1968 fixant les règles techniques et de sécurité applicables au stockage et à l\'utilisation de produits pétroliers.\nArt. 85 - Vanne «police» Lorsqu\'un réservoir ou un groupe de réservoirs reliés présente une contenance supérieure à 1.500 litres, une vanne à commande manuelle doit être installée sur la canalisation d\'alimentation des appareils d\'utilisation.\nSa manœuvre doit pouvoir s\'effectuer de l\'extérieur des locaux contenant les réservoirs et les appareils d\'utilisation.\nLes vannes police doivent être signalées et accessibles en permanence.\n\nGaine pompier :\nElle est obligatoire pour les chaufferies en sous sol. C’est un conduit débouchant à l’extérieur au niveau du sol et permettant , en cas de feu, la mise en œuvre du matériel de ventilation des sapeurs pompiers pour l’évacuation des fumées.\n\n",null),
("241","Art.R.4462-27 du CdT:\nI.-La conduite et la surveillance, ou l\'exécution, d\'activités pyrotechniques déterminées, ainsi que d\'activités déterminées de maintenance ou de transport interne de substances ou objets explosifs, ne sont confiées qu\'à un travailleur habilité à cet effet par l\'employeur à l\'issue des formations initiales et complémentaires dispensées dans les conditions définies par le II et le III du présent article en application de l\'article L. 4141-2.\nII.-Une formation initiale à la sécurité est dispensée par l\'employeur au bénéfice des travailleurs qu\'il embauche, ou des travailleurs temporaires, appelés à conduire, à surveiller ou à exécuter des activités pyrotechniques, les activités de maintenance ainsi que les activités de transport interne de substances ou objets explosifs.\nCette formation comprend :\n1° Un commentaire des prescriptions des articles R. 4462-1 à R. 4462-36 ;\n2° Un commentaire de la consigne générale de sécurité prévue à l\'article R. 4462-6, dont un exemplaire est remis à chaque travailleur suivant cette formation.\nIII.-Cette formation initiale est complétée, avant toute affectation à un poste de travail comportant les activités mentionnées au premier alinéa, par une formation particulière à ce poste, qui comprend notamment :\n1° Une présentation du (ou des) poste (s) de travail et des risques associés ;\n2° Un commentaire des consignes de sécurité de l\'installation et du poste, prévues à l\'article R. 4462-7 ;\n3° Une formation pratique au poste de travail.\n\nArrêté du 31 mai 2010 : art. 1 – le présent arrêté définit […] les connaissances nécessaires et les modalités de délivrance du certificat de qualification en vue de l’utilisation des artifices de divertissement de la catégorie 4, K4 et des articles pyrotechniques destinés au théâtre de la catégorie T2. Les articles 28 à 34 de l’arrêté du 31 mai 2010 définissent les modalités de délivrance du certificat de qualification. La formation prévue à l’article 29, prévoit la délivrance d’une attestation de stage ainsi que d’une attestation de réussite à l’évaluation des connaissances délivrées par l’organisme de formation.\nLa délivrance du certificat de qualification est soumise à la présentation en préfecture des deux attestations prévues à l’article 29, ainsi que la preuve de la participation à trois\nspectacles pyrotechniques sur les cinq dernières années.",null),
("242","Art.R.4462-27 du CdT:\nA l\'issue de ces formations initiales et complémentaires, et en vue de la délivrance de l\'habilitation prévue au premier alinéa, l\'employeur vérifie que le travailleur a les aptitudes nécessaires pour remplir les fonctions associées à son poste de travail.\n\nL\'habilitation fait l\'objet d\'un document signé par l\'employeur et remis au travailleur.\n\nChaque habilitation est renouvelée par l\'employeur tous les cinq ans après qu\'il s\'est assuré du maintien des compétences des travailleurs, compte tenu notamment des formations qu\'ils ont suivies en application de l\'article R. 4462-28.\n\n",null),
("243","Art.4 à 6 de l\'Arrêté du 31 mai 2010 pris en application des articles 3, 4 et 6 du décret n° 2010-580 du 31 mai 2010 relatif à l\'acquisition, la détention et l\'utilisation des artifices de divertissement et des articles pyrotechniques destinés au théâtre:\nLe stockage momentané est autorisé pendant une durée maximale de quinze jours avant la date prévue du spectacle pyrotechnique.\nLe stockage est placé sous le contrôle et la responsabilité d\'une personne désignée par l\'organisateur du spectacle pyrotechnique.\nLe stockage momentané n\'est autorisé que dans le voisinage des lieux du spectacle pyrotechnique.\nLe site de stockage doit être isolé conformément aux prescriptions suivantes :\n- aucune habitation et aucun établissement recevant du public ne se situent à moins de 50 m ;\n- aucun immeuble de grande hauteur ne se trouve à moins de 100 m.\nLe site de stockage ne peut être situé à moins de 100 m d\'émetteurs radio ou radar ou de lignes de haute tension.\nLe stockage ne peut avoir lieu dans un des endroits définis ci-après :\n- un appartement ;\n- une habitation ;\n- un immeuble disposant de lieux d\'habitation ;\n- un établissement recevant du public ;\n- un immeuble de grande hauteur ;\n- un sous-sol ;\n- une cave ;\n- un étage.\nLe local est clos et n\'est pas accessible au public.\nLe local est mis sous la surveillance permanente d\'un gardien ou sous surveillance électronique permettant d\'alerter sans délai le responsable mentionné à l\'article 5 en cas d\'effraction ou de début d\'incendie.\nLes murs et parois du local sont en matériaux de classe A1 selon la norme NF EN 13501-1 en ce qui concerne leurs caractéristiques de réaction et de résistance au feu.\nDes moyens d\'extinction du feu appropriés sont disposés à proximité immédiate du local de stockage. Le responsable du stockage momentané doit s\'assurer que les moyens d\'extinction retenus ne présentent pas d\'incompatibilité éventuelle avec les produits stockés. Des consignes relatives aux incompatibilités éventuelles des produits stockés avec un moyen d\'extinction sont affichées.\nLa porte du local de stockage, côté extérieur, comporte l\'indication de la présence d\'artifices à l\'intérieur du local et une consigne de mise en garde contre le feu, les cigarettes et les étincelles. L\'information peut prendre toute forme appropriée explicite et visible : mention « artifices », pictogramme ou étiquette de transport du risque le plus élevé.\nEn cas de stockage des artifices de divertissement et des articles pyrotechniques destinés au théâtre dans un local avec d\'autres objets ou matières, les règles de sécurité suivantes doivent être respectées :\n- le local ne doit pas contenir d\'autres matières inflammables ou dangereuses ;\n- à l\'intérieur du local de stockage, les artifices de divertissement et les articles pyrotechniques destinés au théâtre sont regroupés et séparés de toute autre matière ou de tout autre objet par un espace totalement libre d\'au moins trois mètres. Si cette distance ne peut être respectée, les artifices de divertissement et les articles pyrotechniques destinés au théâtre devront être stockés isolément dans un local particulier ;\n- en cas de local multiusage, une signalisation de la zone spécifique de stockage indique la nature des risques.",null),
("244","Le Comité interministériel de la sécurité routière (CISR) du 13 février 2008 a décidé de rentre obligatoire la présence dans tout véhicule d’un gilet de sécurité et d’un triangle de pré-signalisation (en complément des feux de détresse). Le non respect de ces obligations est passible d’une contravention de la quatrième classe (amende forfaitaire de 135 €, amende minorée de 90 €).",null),
("245","Art.R.4321-1 à 4 du CdT:\n -  L\'employeur met à la disposition des travailleurs les équipements de travail nécessaires, appropriés au travail à réaliser ou convenablement adaptés à cet effet, en vue de préserver leur santé et leur sécurité.\n -  L\'employeur choisit les équipements de travail en fonction des conditions et des caractéristiques particulières du travail. Il tient compte des caractéristiques de l\'établissement susceptibles d\'être à l\'origine de risques lors de l\'utilisation de ces équipements.\n -  L\'employeur met à la disposition des travailleurs, en tant que de besoin, les équipements de protection individuelle appropriés et, lorsque le caractère particulièrement insalubre ou salissant des travaux l\'exige, les vêtements de travail appropriés. Il veille à leur utilisation effective.",null),
("247","Le risque d’effondrements et de chutes d’objets peut être présent dans toutes les entreprises, il en résulte un accident engendré par la chute d’un objet ou bien un effondrement sur un ou plusieurs opérateurs. La cause de ce risque est multifactorielle.\nArticle R.4223-3 du CdT: « Les lieux de travail intérieurs et extérieurs sont aménagés de telle façon que la circulation des piétons et des véhicules puisse se faire de manière sûre ».\nArticle R.4224-20 du CdT:  \"Lorsque les zones dangereuses présentant un risque de chute d’objet ne peuvent être évitées, elles doivent être signalées.\" ",null),
("248","Art.4323-83 et 87du CdT:\nL\'employeur s\'assure que les échelles fixes sont conçues, équipées ou installées de manière à prévenir les chutes de hauteur.\nAprès évaluation du risque au regard de la hauteur d\'ascension pour lesquelles ces échelles sont conçues, des paliers de repos convenablement aménagés sont prévus afin d\'assurer la progression dans des conditions adaptées du point de vue ergonomique.\n\nLes échelles d\'accès sont d\'une longueur telle qu\'elles dépassent d\'au moins un mètre le niveau d\'accès, à moins que d\'autres mesures aient été prises pour garantir une prise sûre.\nLes échelles sont utilisées de façon à permettre aux travailleurs de disposer à tout moment d\'une prise et d\'un appui sûrs.\nLe port de charges reste exceptionnel et limité à des charges légères et peu encombrantes. Il ne doit pas empêcher le maintien d\'une prise sûre.\n\nNormes relatives aux échelles fixes:\nNF E85-016, NF E85-015, NF E85-012",null),
("249","Art.R314-1 du code de la route:\nLes pneumatiques, à l\'exception de ceux des matériels de travaux publics, doivent présenter sur toute leur surface de roulement des sculptures apparentes.\nLorsque les véhicules et appareils agricoles sont munis de pneumatiques, ceux-ci ne doivent comporter sur leurs flancs aucune déchirure profonde et aucune toile ne doit apparaître ni en surface ni en fond de sculpture.\nLa nature, la forme, l\'état et les conditions d\'utilisation des pneumatiques et autres dispositifs prévus par le présent article sont déterminés par arrêté du ministre chargé des transports.\nLe fait de contrevenir aux dispositions du présent article relatives à la nature, la forme, l\'état et les conditions d\'utilisation des pneumatiques est puni de l\'amende prévue pour les contraventions de la quatrième classe.\nL\'immobilisation du véhicule peut être prescrite dans les conditions prévues aux articles L. 325-1 à L. 325-3.\n\nArt.R416-4 et 11 du code de la route:\nLa nuit, ou le jour lorsque la visibilité est insuffisante, tout conducteur d\'un véhicule doit, dans les conditions définies à la présente section, faire usage des feux dont le véhicule doit être équipé en application des dispositions du livre III.\nLe fait, pour tout conducteur d\'un véhicule à moteur, de circuler la nuit, ou le jour lorsque la visibilité est insuffisante, sans éclairage ni signalisation en un lieu dépourvu d\'éclairage public, est puni de l\'amende prévue pour les contraventions de la quatrième classe.\nTout conducteur coupable de cette infraction encourt également la peine complémentaire de suspension, pour une durée de trois ans au plus, du permis de conduire, cette suspension pouvant être limitée à la conduite en dehors de l\'activité professionnelle.\nCette contravention donne lieu de plein droit à la réduction de quatre points du permis de conduire.",null),
("250","Art.R.4227-28 du CdT:\nL\'employeur prend les mesures nécessaires pour que tout commencement d\'incendie puisse être rapidement et efficacement combattu dans l\'intérêt du sauvetage des travailleurs.\n\nArt.R.4227-31 du CdT:\nLes dispositifs d\'extinction non automatiques sont d\'accès et de manipulation faciles.\n\nNorme NF EN 1869-1997 qui concerne les couvertures anti-feu.",null),
("251","defaut",null),
("253","Art R. 4228-20 du CdT:  \"Aucune boisson alcoolisée autre que le vin, la bière, le cidre et le poiré n\'est autorisée sur le lieu de travail.\nLorsque la consommation de boissons alcoolisées, dans les conditions fixées au premier alinéa, est susceptible de porter atteinte à la sécurité et la santé physique et mentale des travailleurs, l\'employeur, en application de l\'article L. 4121-1 du code du travail, prévoit dans le règlement intérieur ou, à défaut, par note de service les mesures permettant de protéger la santé et la sécurité des travailleurs et de prévenir tout risque d\'accident. Ces mesures, qui peuvent notamment prendre la forme d\'une limitation voire d\'une interdiction de cette consommation, doivent être proportionnées au but recherché.\"\n\nL\'employeur peut interdire toute introduction d\'alcool, si l\'intérêt du service le justifie; le Règlement intérieur doit alors le prévoir.",null),
("254","Art R. 4228-21 du CdT: \" Il est interdit de laisser entrer ou séjourner dans les lieux de travail des personnes en état d\'ivresse.\"\n\nPour des raisons de sécurité, tout agent qui constate un état manifeste d\'ébriété chez un collègue doit le signaler à la hiérarchie directe de l\'agent concerné (cf Art.L.4131-1 du Code du travail)",null),
("256","defaut",null),
("257","defaut",null),
("258","defaut",null),
("259","defaut",null),
("260","defaut",null),
("261","defaut",null),
("262","defaut",null),
("263","defaut",null),
("264","defaut",null),
("265","defaut",null),
("266","defaut",null);




CREATE TABLE `se_trouver` (
  `NUM_BATIMENT` smallint(6) NOT NULL,
  `NUM_LIEU` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_BATIMENT`,`NUM_LIEU`),
  KEY `I_FK_SE_TROUVER_BATIMENT` (`NUM_BATIMENT`),
  KEY `I_FK_SE_TROUVER_LIEU` (`NUM_LIEU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `sous_theme` (
  `NUM_SOUS_THEME` smallint(6) NOT NULL AUTO_INCREMENT,
  `LIBELLE_SOUS_THEME` varchar(100) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NUM_SOUS_THEME`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;


INSERT INTO sous_theme VALUES
("1","Assistant de prévention",null),
("2","Conseiller de prévention",null),
("3","Médecin de prévention",null),
("4"," CT / CHSCT",null),
("5","ACFI",null),
("6","Évaluation des risques professionnels",null),
("7","Documents obligatoires","fa-file-pdf-o "),
("8","Vérifications périodiques",null),
("9","Locaux de travail: Aménagement/ Entretien",null),
("10","Vestiaires/ Sanitaires/ Repos",null),
("11","Ambiances des lieux de travail",null),
("12","Moyens de prévention et de lutte",null),
("13","Affichage de secours",null),
("14","Dégagements, sorties, signalisation",null),
("15","Dispositions générales prévention risque routier",null),
("16","Travaux sur la voie publique",null),
("17","Machines (Entretien, conformité...)",null),
("18","Engins (épareuse, tracteurs agricoles...)",null),
("19","Tondeuses autoportées",null),
("20","Engins de service d’hivernage",null),
("21","Cimetière",null),
("22","Activité en station d’épuration",null),
("23","Activité de soudage et meulage",null),
("24","Utilisation produits phytosanitaires",null),
("25","Restauration","fa-glass"),
("26","Activités en piscine",null),
("27","Menuiserie",null),
("28","Feux d\'artifice",null);




CREATE TABLE `structure` (
  `NUM_STRUCTURE` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_TYPE_STRUCTURE` smallint(6) NOT NULL,
  `NOM_STRUCTURE` varchar(100) DEFAULT NULL,
  `ADRESSE_STRUCTURE` varchar(100) DEFAULT NULL,
  `VILLE_STRUCTURE` varchar(100) NOT NULL,
  `CP_STRUCTURE` int(5) NOT NULL,
  `TELEPHONE_STRUCTURE` varchar(10) DEFAULT NULL,
  `EMAIL_STRUCTURE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NUM_STRUCTURE`),
  KEY `fk_num_type_structure` (`NUM_TYPE_STRUCTURE`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=latin1;


INSERT INTO structure VALUES
("1","2","CAISSE DES ECOLES de PANAZOL","Mairie Rue Jean Monnet","LIMOGES","87000",null,null),
("2","2","CCAS de BELLAC","14 place de la République","BELLAC","8730",null,"ccasbellac@wanadoo.fr"),
("3","2","CCAS de CHATEAUPONSAC","22 avenue du 08 mai 1945","CHATEAUPONSAC","87290",null,"ehpad.chateauponsac@wanadoo.fr"),
("4","2","CCAS de CONDAT","Mairie 1 avenue de Limoges","CONDAT SUR VIENNE","87920",null,"contact@condatsurvienne.fr "),
("5","2","CCAS de COUZEIX","Place du 8 mai 1945","COUZEIX","87270",null,"couzeix.seniors@orange.fr"),
("6","2","CCAS de LADIGNAC LE LONG","4 impasse des terrasses","LADIGNAC LE LONG","87500",null,"maisonderetraiteladignac@wanadoo.fr"),
("7","2","CCAS de LAURIERE","17 rue de la Couture","LAURIERE","87370",null,"foyerlogementlauriere@sfr.fr "),
("8","2","CCAS de RILHAC RANCON","2 Rue du Perou","RILHAC RANCON","87570",null,"ccas@rilhac-rancon.fr "),
("9","2","CCAS de SAUVIAT SUR VIGE","5 rue de la Résidence","SAUVIAT SUR VIGE","87400",null,"foyer.raymondcoudert@wanadoo.fr "),
("10","2","CCAS de ST JUNIEN","2 place Auguste Roche","SAINT JUNIEN","87200",null,"s.mazaud@mairie-saint-junien.fr"),
("11","2","CCAS de ST LAURENT SUR GORRE","5 avenue Léon Dunaud","SAINT LAURENT SUR GORRE","87310",null,"retraite.maison1@wanadoo.fr"),
("12","2","CCAS de ST SULPICE","Rue de la Reine","SAINT SULPICE LES FEUILLES","87160",null,"residenceducedre@wanadoo.fr"),
("13","2","CCAS de ST YRIEIX","Boulevard de l’Hôtel de Ville","SAINT YRIEIX LA PERCHE","87500",null,"i-chateauevene@saint-yrieix.fr "),
("14","2","CCAS de VAL D’ISSOIRE","2 Centre administratif André Reynaud","MEZIERES SUR ISSOIRES","87330",null,"MEZIERES-ISSOIRE@wanadoo.fr "),
("15","2","CCAS d’ISLE","15 rue Joseph Cazauzets","ISLE","87170",null,"joelle.penot@ville-isle.fr"),
("16","2","CCAS LE PALAIS S/ VIENNE","20 rue Jules ferry","LE PALAIS SUR VIENNE","87410",null,"res.puymartin-lepalais@wanadoo.fr"),
("17","2","CCnes AURENCE GLANE DEVELOPPEMENT","17 rue du 8 mai 1945","NIEUL","87510",null,"accueil@cc-agd.com "),
("18","2","CCnes BASSE MARCHE","3 avenue Louis RICOUX","LE DORAT","87210",null,"comcom@bassemarche.fr "),
("19","2","CCnes BRAME BENAIZE","La Forge de Mondon","CROMAC","87160",null,"cc-bramebenaize@wanadoo.fr "),
("20","2","CCnes BRIANCE COMBADE","4 Place Eugène Degrassat","CHATEAUNEUF LA FORET","87130",null,"cdc.briance.combade@wanadoo.fr "),
("21","2","Ccnes BRIANCE SUD HAUTE-VIENNE","Chabanas","PIERRE BUFFIERE","87260",null,"ccbshv@orange.fr "),
("22","2","CCnes DE LA VALLEE DE LA GORRE","2 place de l’Eglise","SAINT LAURENT SUR GORRE","87310",null,"communes.vallee.gorre@wanadoo.fr "),
("23","2","CCnes DE NOBLAT","ZA de Soumagne","SAINT LEONARD DE NOBLAT","87400",null,"j.dennaud@ccnoblat.fr "),
("24","2","CCnes DU HAUT LIMOUSIN","12, Avenue Jean Jaurès","BELLAC","87300",null,"cchautlimousin@wanadoo.fr "),
("25","2","CCnes DU PAYS DE NEXON","6 place de l’Eglise","NEXON","87800",null,"communautecommunenexon@wanadoo.fr "),
("26","2","CCnes DU PAYS DE ST YRIEIX","Rue du 8 mai 1945","SAINT YRIEIX LA PERCHE","87500",null,"m-granger@communaute-saint-yrieix.fr "),
("27","2","CCnes DU VAL DE VIENNE","24 Avenue du Président Wilson","AIXE SUR VIENNE","87700",null,"n-fusade@cc-valdevienne.fr "),
("28","2","CCnes FEUILLARDIERS","La Monnerie","CUSSAC","87150",null,"contact@feuillardiers.com "),
("29","2","CCnes GARTEMPE SAINT PARDOUX","16 avenue de Lorraine","CHATEAUPONSAC","87290",null,"gartempe.saint-pardoux@wanadoo.fr "),
("30","2","CCnes MONTS D’AMBAZAC VAL DU TAURION","13 rue Gay-Lussac","AMBAZAC","87240",null,null),
("31","2","Ccnes MONTS DE CHALUS","32 avenue François Mitterrand","CHALUS","87230",null,"responsable.pag@montsdechalus.fr"),
("32","2","CCnes POL","1 Avenue Voltaire","SAINT JUNIEN","87200",null,null),
("33","2","CCnes PORTE d’OCCITANIE","4 rue Jean Moulin","BESSINES SUR GARTEMPE","87250",null,"cc87portedoc@wanadoo.fr"),
("34","2","CCnes PORTES DE VASSIVIERE","8 rue de la Collégiale","EYMOUTIERS","87120",null,"cc-portesdevassiviere@wanadoo.fr"),
("35","2","CENTRE DE GESTION DE LA FPT","55 rue de l’AENI","LIMOGES","87000",null,"ccmavat@orange.fr "),
("36","2","CENTRE DE LA MEMOIRE D’ORADOUR","L’Auze","ORADOUR SUR GLANE","87520",null,null),
("37","2","CIAS de la CCnes VALLEE DE LA GORRE","2 place de l’église","SAINT LAURENT SUR GORRE","87310",null,"cias.vallee.gorre@orange.fr "),
("38","2","CIAS DES MONTS DE CHALUS","32 avenue François Mitterrand","CHALUS","87230",null,"com.montsdechalus@wanadoo.fr"),
("39","2","CIAS EHPAD DINS LOU PELOU","3 rue de Fromental","CUSSAC","87150",null,null),
("40","2","CIOL ISLE CONDAT BOSMIE","15 rue Joseph Cazauzets","ISLE","87170",null,null),
("41","1","Commune d’AIXE SUR VIENNE","44 Avenue du Président Wilson","AIXE SUR VIENNE","87700",null,"s-hareau@mairie-aixesurvienne.fr"),
("42","1","Commune d’AMBAZAC","Place de l’Hôtel de Ville","AMBAZAC","87240",null,"drh.ambazac@orange.fr"),
("43","1","Commune d’ARNAC LA POSTE","2 place du champ de foire","ARNAC LA POSTE","87160",null,"mairiearnaclaposte2@wanadoo.fr"),
("44","1","Commune d’AUGNE","Le bourg","AUGNE","87120",null,"Mairie.augne@wanadoo.fr"),
("45","1","Commune d’AUREIL","Le bourg","AUREIL","87220",null,"aserve@mairie-aureil.fr"),
("46","1","Commune d’AZAT LE RIS","23 rue du pré du moulin","AZAT LE RIS","87360",null,"mairie.azat@wanadoo.fr"),
("47","1","Commune de BALLEDENT","Le bourg","BALLEDENT","87290",null,"mairieballedent@wanadoo.fr"),
("48","1","Commune de BEAUMONT DU LAC","Le bourg","BEAUMONT DU LAC","87120",null,"mairie.beaumontdulac@wanadoo.fr"),
("49","1","Commune de BELLAC","14 place de la République","BELLAC","87300",null,"bellac@mairie-bellac.fr"),
("50","1","Commune de BERNEUIL","2 route de Poitiers","BERNEUIL","87300",null,"mairieberneuil@wanadoo.fr"),
("51","1","Commune de BERSAC SUR RIVALIER","Le Bourg","BERSAC SUR RIVALIER","87370",null,"mairiebersac@wanadoo.fr"),
("52","1","Commune de BESSINES SUR GARTEMPE","1 place de la Liberté","BESSINES SUR GARTEMPE","87250",null,"commune.de.bessines@wanadoo.fr"),
("53","1","Commune de BEYNAC","29 Rue de la Croix des Combes","BEYNAC","87700",null,"beynac.mairie@wanadoo.fr"),
("54","1","Commune de BLANZAC","5 rue de la mairie","BLANZAC","87300",null,"mairie.blanzac@gmail.com"),
("55","1","Commune de BLOND","Le bourg","BLOND","87300",null,"mairie-blond@wanadoo.fr"),
("56","1","Commune de BOISSEUIL","Place de Soneja","BOISSEUIL","87220",null,"accueil@mairie-boisseuil87.fr"),
("57","1","Commune de BONNAC LA COTE","Le bourg","BONNAC LA COTE","87270",null,"mairie.bonnac@wanadoo.fr"),
("58","1","Commune de BOSMIE L’AIGUILLE","Le Parc du Boucheron","BOSMIE L’AIGUILLE","87110",null,"gestion@mairie-bosmie.fr"),
("59","1","Commune de BREUILAUFA","30 rue Saint Jean","BREUILAUFA","87300",null,"mairie.breuilaufa@wanadoo.fr"),
("60","1","Commune de BUJALEUF","1 place de la mairie","BUJALEUF","87460",null,"mairie@bujaleuf.fr"),
("61","1","Commune de BURGNAC","4 place de l’Eglise","BURGNAC","87800",null,"mairie.burgnac@wanadoo.fr"),
("62","1","Commune de BUSSIERE GALANT","Le bourg","BUSSIERE GALANT","87230",null,"mairie.bussiere.galant@wanadoo.fr"),
("63","1","Commune de BUSSIERE POITEVINE","Mairie","BUSSIERE POITEVINE","87320",null,"mairie.bussiere.poitevine@wanadoo.fr"),
("64","1","Commune de CHAILLAC SUR VIENNE","1 rue des mimosas","CHAILLAC SUR VIENNE","87200",null,"chaillacsurvienne.mairie@wanadoo.fr"),
("65","1","Commune de CHALUS","32 avenue François Mitterrand","CHALUS","87230",null,"mairie.chalus87@wanadoo.fr"),
("66","1","Commune de CHAMBORET","28, avenue du 8 mai 1945","CHAMBORET","87140",null,"mairie.chamboret@wanadoo.fr"),
("67","1","Commune de CHAMPAGNAC LA RIVIERE","4, place de la Mairie","CHAMPAGNAC LA RIVIERE","87150",null,"mairiechampagnelariviere@wanadoo.fr"),
("68","1","Commune de CHAMPNETERY","Le Bourg","CHAMPNETERY","87400",null,"mairie.champnetery@wanadoo.fr"),
("69","1","Commune de CHAMPSAC","le bourg","CHAMPSAC","87230",null,"mairie.champsac@wanadoo.fr"),
("70","1","Commune de CHAPTELAT","54 rue Saint Eloi","CHAPTELAT","87270",null,"chapelle-montbrandeix@orange.fr"),
("71","1","Commune de CHATEAU CHERVIX","Le Bourg","CHATEAU CHERVIX","87380",null,"chaptelat.limousin@wanadoo.fr"),
("72","1","Commune de CHATEAUNEUF LA FORET","2,place du 8 mai 1945","CHATEAUNEUF LA FORET","87130",null,"mairie.chateau-chervix@wanadoo.fr"),
("73","1","Commune de CHATEAUPONSAC","1 place de la République","CHATEAUPONSAC","87290",null,"mairie.chateauneuf-la-foret@wanadoo.fr"),
("74","1","Commune de CHEISSOUX","Le bourg","CHEISSOUX","87460",null,"mairie.chateauponsac@wanadoo.fr"),
("75","1","Commune de CHERONNAC","le Bourg","CHERONNAC","87600",null,"mairiecheissoux@wanadoo.fr"),
("76","1","Commune de CIEUX","6 avenue du Lac","CIEUX","87520",null,"mairie.cheronnac@wanadoo.fr"),
("77","1","Commune de COGNAC LA FORET","Mairie","COGNAC LA FORET","87310",null,"mairie.de.cognac.la.forêt@wanadoo.fr"),
("78","1","Commune de COMPREIGNAC","4 place du 11 novembre 1918","COMPREIGNAC","87140",null,"mairiedecompreignac@wanadoo.fr"),
("79","1","Commune de CONDAT SUR VIENNE","Place de la mairie","CONDAT SUR VIENNE","87920",null,"contact@condatsurvienne.fr"),
("80","1","Commune de COUSSAC BONNEVAL","1 Place Daniel Lamazière","COUSSAC BONNEVAL","87500",null,"mairie.coussac.bonneval@wanadoo.fr"),
("81","1","Commune de COUZEIX","176 avenue de Limoges","COUZEIX","87270",null,"service.personnel@couzeix.fr"),
("82","1","Commune de CROMAC","2 Place du 8 mai 1945","CROMAC","87270",null,"mairie.cromac@wanadoo.fr"),
("83","1","Commune de CUSSAC","1 place de la Mairie","CUSSAC","87150",null,"mairie-cussac@wanadoo.fr"),
("84","1","Commune de DARNAC","Le Bourg","DARNAC","87320",null,"mairiedarnac@wanadoo.fr"),
("85","1","Commune de DINSAC","le bourg","DINSAC","87210",null,"mairie.dinsac@gmail.com"),
("86","1","Commune de DOMPIERRE LES EGLISES","Le Bourg","DOMPIERRE LES EGLISES","87190",null,"mairie.dompierreleseglises@wanadoo.fr"),
("87","1","Commune de DOMPS","Le Bourg","DOMPS","87120",null,"mairie.domps@orange.fr"),
("88","1","Commune de DOURNAZAC","1 rue du 11 Novembre","DOURNAZAC","87230",null,"mairie-dournazac@orange.fr"),
("89","1","Commune de DROUX","Mairie","DROUX","87190",null,"mairie.droux@wanadoo.fr"),
("90","1","Commune de FEYTIAT","Place de Leun","FEYTIAT","87221",null,"mairie@feytiat.fr"),
("91","1","Commune de FLAVIGNAC","19 place du 8 mai 1945","FLAVIGNAC","87230",null,"mairie-flavignac@wanadoo.fr"),
("92","1","Commune de FOLLES","Mairie","FOLLES","87250",null,"mairie.folles@orange.fr"),
("93","1","Commune de FROMENTAL","1 rue Jean Cacaud","FROMENTAL","87250",null,"mairiefromental@wanadoo.fr"),
("94","1","Commune de GAJOUBERT","Le Bourg","GAJOUBERT","87330",null,"mairie.gajoubert@wanadoo.fr"),
("95","1","Commune de GENEYTOUSE","Hôtel de ville","LA GENEYTOUSE","87400",null,null),
("96","1","Commune de GLANDON","Mairie","GLANDON","87500",null,"mairie.glandon@wanadoo.fr"),
("97","1","Commune de GLANGES","Le Bourg","GLANGES","87380",null,"mairie-de-glanges@wanadoo.fr"),
("98","1","Commune de GORRE","Le Bourg","GORRE","87310",null,"mairie.gorre@wanadoo.fr"),
("99","1","Commune de JABREILLES LES BORDES","Les Bordes","JABREILLES LES BORDES","87370",null,"mairie.jabreilles@wanadoo.fr"),
("100","1","Commune de JANAILHAC","1 rue du général Arbonneau","JANAILHAC","87800",null,"mairie.janailhac@wanadoo.fr");
INSERT INTO structure VALUES
("101","1","Commune de JAVERDAT","Mairie","JAVERDAT","87520",null,"mairiedejaverdat@wanadoo.fr"),
("102","1","Commune de JOUAC","Mairie","JOUAC","87890",null,"mairiejouac@viveole.com"),
("103","1","Commune de JOURGNAC","Le Bourg","JOURGNAC","87800",null,"mairie.jourgnac87@laposte.net"),
("104","1","Commune de la BAZEUGE","Mairie","LA BAZEUGE","87210",null,"mairielabazeuge@wanadoo.fr"),
("105","1","Commune de LA CHAPELLE MONTBRANDEIX","le bourg","LA CHAPELLE MONTBRANDEIX","87440",null,"chapelle-montbrandeix@orange.fr"),
("106","1","Commune de LA CROISILLE SUR BRIANCE","22 Route du Mont Gargan","LA CROISILLE SUR BRIANCE","87130",null,"lemaire@lacroisille@orange.fr"),
("107","1","Commune de la CROIX SUR GARTEMPE","Le Bourg","LA CROIX SUR GARTEMPE","87210",null,"mairie.croix.gartempe@wanadoo.fr"),
("108","1","Commune de la JONCHERE ST MAURICE","14 rue de Limoges","LA JONCHERE SAINT MAURICE","87340",null,"mairiedelajonchere@wanadoo.fr"),
("109","1","Commune de la MEYZE","1 square Pittem","LA MEYZE","87800",null,"mairie.la.meyze@wanadoo.fr"),
("110","1","Commune de la PORCHERIE","Mairie","LA PORCHERIE","87380",null,"mairie.laporcherie@wanadoo.fr"),
("111","1",null,"10 place du 11 novembre 1918","LA ROCHE L’ABEILLE","87800",null,"larochelabeille.mairie@wanadoo.fr"),
("112","1","Commune de LADIGNAC LE LONG","Mairie","LADIGNAC LE LONG","87500",null,"mairie.ladignac@wanadoo.fr"),
("113","1","Commune de LAURIERE","Place du Général Thoumas","LAURIERE","87370",null,"mairie.lauriere@wanadoo.fr"),
("114","1","Commune de LAVIGNAC","Mairie","LAVIGNAC","87230",null,"mairie.lavignac@orange.fr"),
("115","1","Commune de LINARDS","9 rue du Dr Touraille","LINARDS","87130",null,null),
("116","1","Commune de LUSSAC LES EGLISES","Mairie","LUSSAC LES EGLISES","87360",null,null),
("117","1","Commune de MAGNAC BOURG","4 RN 20","MAGNAC BOURG","87380",null,"mairie.magnac-bourg@wanadoo.fr"),
("118","1","Commune de MAGNAC LAVAL","rue Camille Grellier","MAGNAC LAVAL","87190",null,"mairie.magnaclaval@wanadoo.fr"),
("119","1","Commune de MAILHAC SUR BENAIZE","Mairie","MAILHAC SUR BENAIZE","87160",null,"secretariat.mairiemeilhac@wanadoo.fr"),
("120","1","Commune de MAISONNAIS SUR TARDOIRE","Mairie","MAISONNAIS SUR TARDOIRE","87440",null,"mairie.maisonnais.sur.tardoire@wanadoo.fr"),
("121","1","Commune de MARVAL","Le Bourg","MARVAL","87440",null,"mairie-marval@wanadoo.fr"),
("122","1","Commune de MASLEON","Mairie","MASLEON","87130",null,"mairiedemasleon@orange.fr"),
("123","1","Commune de MEILHAC","Le Bourg","MEILHAC","87800",null,"mairie.meilhac@wanadoo.fr"),
("124","1","Commune de MEUZAC","Mairie","MEUZAC","87380",null,"mairie.meuzac@wanadoo.fr"),
("125","1","Commune de MOISSANNES","Mairie","MOISSANNES","87400",null,"mairie-de-moissannes@wanadoo.fr"),
("126","1","Commune de MONTROL SENARD","Mairie","MONTROL SENARD","87330",null,"mairie.montrolsenard@wanadoo.fr"),
("127","1","Commune de MORTEMART","1 rue des Augustins","MORTEMART","87330",null,"mairiemortemart@wanadoo.fr"),
("128","1","Commune de NANTIAT","14 rue de l’hôtel de ville","NANTIAT","87140",null,"commune.nantiat@wanadoo.fr"),
("129","1","Commune de NEDDE","Le Bourg","NEDDE","87120",null,"mairie.nedde@wanadoo.fr"),
("130","1","Commune de NEUVIC ENTIER","8 rue de la république","NEUVIC ENTIER","87130",null,"mairie.neuvic-entier@wanadoo.fr"),
("131","1","Commune de NEXON","6 place de l’église","NEXON","87800",null,"mairie.nexon@wanadoo.fr"),
("132","1","Commune de NIEUL","rue du 8 mai 1945","NIEUL","87510",null,"mairie.nieul87@gmail.com"),
("133","1","Commune de NOUIC","Mairie","NOUIC","87330",null,"mairie.nouic@wanadoo.fr"),
("134","1","Commune de PAGEAS","Mairie","PAGEAS","87530",null,"communedepageas@wanadoo.fr"),
("135","1","Commune de PANAZOL","Rue Jean Monnet","PANAZOL","87350",null,"mairie@mairie-panazol.fr"),
("136","1","Commune de PENSOL","Le Bourg","PENSOL","87440",null,"mairie.de.pensol@wanadoo.fr"),
("137","1","Commune de PEYRAT DE BELLAC","Mairie","PEYRAT DE BELLAC","87300",null,"mairiedepeyratdebellac@wanadoo.fr"),
("138","1","Commune de PEYRAT LE CHATEAU","Le Bourg","PEYRAT LE CHATEAU","87470",null,"mairie-peyratlechateau87@wanadoo.fr"),
("139","1","Commune de PEYRILHAC","1 place de la mairie","PEYRILHAC","87510",null,"mairie-de-Peyrilhac@wanadoo.fr"),
("140","1","Commune de PIERRE BUFFIERE","Place de la Libération","PIERRE BUFFIERE","87260",null,"mairie.pierrebuffiere@wanadoo.fr"),
("141","1","Commune de RANCON","Place de la Mairie","RANCON","87290",null,"mairie.rancon@wanadoo.fr"),
("142","1","Commune de RAZES","1 square Edgar Cruveilher","RAZES","87640",null,"mairie.razes@wanadoo.fr"),
("143","1","Commune de REMPNAT","La Terrade","REMPNAT","87120",null,"mairie.rempnat@wanadoo.fr"),
("144","1","Commune de RILHAC LASTOURS","Mairie ","RILHAC LASTOURS","87800",null,"rilhac-lastours87@orange.fr"),
("145","1","Commune de RILHAC RANCON","2 rue du Peyrou","RILHAC RANCON","87570",null,"mairie@rilhac-rancon.fr"),
("146","1","Commune de ROCHECHOUART","Place du château","ROCHECHOUART","87600",null,"mairie@rochechouart.com"),
("147","1","Commune de ROUSSAC","30 place Roger Couégnas","ROUSSAC","87140",null,"contact@roussac.fr"),
("148","1","Commune de ROYERES","1 place de la mairie","ROYERES","87400",null,"mairiederoyeres@free.fr"),
("149","1","Commune de ROZIERS ST GEORGES","Le Bourg","ROZIERS SAINT GEORGES","87130",null,"mairiederoziersstgeorges@wanadoo.fr"),
("150","1","Commune de SAILLAT SUR VIENNE","1 place de la mairie","SAILLAT SUR VIENNE","87720",null,"saillat-mairie@wanadoo.fr"),
("151","1","Commune de SAUVIAT SUR VIGE","68 rue Emile Dourdet","SAUVIAT SUR VIGE","87400",null,"mairie.sauviat@wanadoo.fr"),
("152","1","Commune de SEREILHAC","7 Allée des Tilleuls","SEREILHAC","87620",null,"secretariat@sereilhac.com"),
("153","1","Commune de SOLIGNAC","57 avenue Saint Eloi","SOLIGNAC","87110",null,"mairie-solignac@wanadoo.fr"),
("154","1","Commune de ST AMAND LE PETIT","Le Bourg","SAINT AMAND LE PETIT","87120",null,"mairie.stamandlepetit@wanadoo.fr"),
("155","1","Commune de ST AMAND MAGNAZEIX","Mairie","SAINT AMAND MAGNAZEIX","87290",null,"mairie.st.amand.magnx@wanadoo.fr"),
("156","1","Commune de ST AUVENT","2 Place de l’Eglise","SAINT AUVENT","87310",null,"mairie.de.saint-auvent@wanadoo.fr"),
("157","1","Commune de ST BARBANT","Mairie","SAINT BARBANT","87330",null,"communedesaintbarbant@orange.fr"),
("158","1","Commune de ST BAZILE","Mairie","SAINT BAZILE","87150",null,"mairie.saint-bazile@wanadoo.fr"),
("159","1","Commune de ST BONNET BRIANCE","Mairie","SAINT BONNET BRIANCE","87260",null,"st-bonnet-briance.mairie@orange.fr"),
("160","1","Commune de ST BONNET DE BELLAC","Le Bourg","SAINT BONNET DE BELLAC","87300",null,"mairie.stbonnetdebellac@wanadoo.fr"),
("161","1","Commune de ST BRICE SUR VIENNE","1 place Maisondieu","SAINT BRICE SUR VIENNE","87200",null,"valerie.sabourdy@stbrice87.fr"),
("162","1","Commune de ST CYR","Le Bourg","SAINT CYR","87310",null,"mairie.st-cyr@wanadoo.fr"),
("163","1","Commune de ST DENIS DES MURS","Le Bourg","SAINT DENIS DES MURS","87400",null,"saintdenisdesmurs@free.fr"),
("164","1","Commune de ST GENCE","4 place de l’Eglise","SAINT GENCE","87510",null,"mairie.saintgence@wanadoo.fr"),
("165","1","Commune de ST GENEST SUR ROSELLE","5, rue du 19 Mars 1962","SAINT GENEST SUR ROSELLE","87260",null,"mairiestgenest@wanadoo.fr"),
("166","1","Commune de ST GEORGES LES LANDES","26 rue du poète","SAINT GEORGES LES LANDES","87160",null,"mairies.sgll@wanadoo.fr"),
("167","1","Commune de ST GERMAIN LES BELLES","1 place de l’église","SAINT GERMAIN LES BELLES","87380",null,"mairiedesaintgermainlesbelles@wanadoo.fr"),
("168","1","Commune de ST GILLES LES FORETS","Le Bourg","SAINT GILLES LES FORETS","87130",null,"mairie-st-gilles-les-forets@wanadoo.fr"),
("169","1","Commune de ST HILAIRE BONNEVAL","Mairie","SAINT HILAIRE BONNEVAL","87260",null,"commune-de-st-hilaire-bonneval@wanadoo.fr"),
("170","1","Commune de ST HILAIRE LA TREILLE","1, rue des Rochers","SAINT HILAIRE LA TREILLE","87190",null,"mairie.saint.hilaire.la.treille@wanadoo.fr"),
("171","1","Commune de ST HILAIRE LES PLACES","5 rue des places","SAINT HILAIRE LES PLACES","87800",null,"mairie-saint.hilaire@wanadoo.fr"),
("172","1","Commune de ST JEAN LIGOURE","Avenue des Tilleuls","SAINT JEAN LIGOURE","87260",null,"mairiesaintjeanligoure@orange.fr"),
("173","1","Commune de ST JOUVENT","30 rue des écoles","SAINT JOUVENT","87510",null,"mairie.stjouvent@wanadoo.fr"),
("174","1","Commune de ST JULIEN LE PETIT","Le Bourg","SAINT JULIEN LE PETIT","87460",null,"mairie.saintjulien@free.fr"),
("175","1","Commune de ST JUNIEN","2 place Auguste Roche","SAINT JUNIEN","87200",null,"mairie.junien@orange.fr"),
("176","1","Commune de ST JUNIEN LES COMBES","1 rue du 8 mai 1945","SAINT JUNIEN LES COMBES","87300",null,"contact@saint-junien.fr"),
("177","1","Commune de ST JUST LE MARTEL","Rue de la mairie","SAINT JUST LE MARTEL","87590",null,"mairie.stjustlemartel@wanadoo.fr"),
("178","1","Commune de ST LAURENT LES EGLISES","Le Bourg","SAINT LAURENT LES EGLISES","87240",null,"mairie@stlaurentleseglises.fr"),
("179","1","Commune de ST LAURENT SUR GORRE","3 Place de la Mairie","SAINT LAURENT SUR GORRE","87310",null,"mairie.stlaurent.gorre@wanadoo.fr"),
("180","1","Commune de ST LEGER LA MONTAGNE","Mairie","SAINT LEGER LA MONTAGNE","87340",null,"commune.saintlegerlamontagne@wanadoo.fr"),
("181","1","Commune de ST LEGER MAGNAZEIX","8 avenue du clocher","SAINT LEGER MAGNAZEIX","87190",null,"mairiestleger@wanadoo.fr"),
("182","1","Commune de ST LEONARD DE NOBLAT","Place du 14 juillet","SAINT LEONARD DE NOBLAT","87400",null,"ressources-humaines@ville-saint-leonard.fr"),
("183","1","Commune de ST MARTIAL SUR ISOP","Mairie","SAINT MARTIAL SUR ISOP","87660",null,"mairiestmartials.isop@wanadoo.fr"),
("184","1","Commune de ST MARTIN DE JUSSAC","Mairie","SAINT MARTIN DE JUSSAC","87200",null,"commune.saintmartindejussac@wanadoo.fr"),
("185","1","Commune de ST MARTIN LE MAULT","Le Bourg","SAINT MARTIN LE MAULT","87360",null,"mairie.smlm@wanadoo.fr"),
("186","1","Commune de ST MARTIN LE VIEUX","Mairie","SAINT MARTIN LE VIEUX","87700",null,"mairie.smlv@wanadoo.fr"),
("187","1","Commune de ST MARTIN TERRESSUS","Le Bourg","SAINT MARTIN TERRESSUS","87400",null,"mairie@st-martin-terressus.fr"),
("188","1","Commune de ST MATHIEU","1 place du Dr Hugonneau","SAINT MATHIEU","87440",null,"mairie.saint.mathieu@wanadoo.fr"),
("189","1","Commune de ST MAURICE LES BROUSSES","29 avenue de Limoges","SAINT MAURICE LES BROUSSES","87800",null,"mairie.stmaurice87@free.fr"),
("190","1","Commune de ST MEARD","Mairie","SAINT MEARD","87130",null,"mairie-de-saint-meard@wanadoo.fr"),
("191","1","Commune de ST OUEN SUR GARTEMPE","Le Bourg","SAINT OUEN SUR GARTEMPE","87300",null,"mairie-st-ouen-sur-gartempe@wanadoo.fr"),
("192","1","Commune de ST PARDOUX","5 rue ancien château","SAINT PARDOUX","87250",null,"commune.saint.pardoux@orange.fr"),
("193","1","Commune de ST PAUL","48 avenue de Limoges","SAINT PAUL","87260",null,"mairie-stpaul87@wanadoo.fr"),
("194","1","Commune de ST PRIEST LIGOURE","Mairie","SAINT PRIEST LIGOURE","87800",null,"stpriestligoure.mairie@wanadoo.fr"),
("195","1","Commune de ST PRIEST SOUS AIXE","Mairie","SAINT PRIEST SOUS AIXE","87700",null,"mairie-de-st-priest-sous-aixe@wanadoo.fr"),
("196","1","Commune de ST PRIEST TAURION","22 rue jean Gagnant","SAINT PRIEST TAURION","87480",null,"st-priest-taurion@wanadoo.fr"),
("197","1","Commune de ST SORNIN LA MARCHE","Mairie","SAINT SORNIN LA MARCHE","87210",null,"st.sornin.marche@wanadoo.fr"),
("198","1","Commune de ST SORNIN LEULAC","4 rue de l’ancien abreuvoir","SAINT SORNIN LEULAC","87290",null,"mairie.st-sornin-leulac@wanadoo.fr"),
("199","1","Commune de ST SULPICE LAURIERE","2 rue Jules Ferry","SAINT SULPICE LAURIERE","87370",null,"mairiestslauriere@orange.fr"),
("200","1","Commune de ST SULPICE LES FEUILLES","Rue de la Reine","SAINT SULPICE LES FEUILLES","87160",null,"st.sulpice.les.feuilles@wanadoo.fr");
INSERT INTO structure VALUES
("201","1","Commune de ST SYLVESTRE","Mairie","SAINT SYLVESTRE","87240",null,"mairie.stsylv@wanadoo.fr"),
("202","1","Commune de ST SYMPHORIEN SUR COUZE","Mairie","SAINT SYMPHORIEN S COUZE","87140",null,"commune-st-symphorien@orange.fr"),
("203","1","Commune de ST VICTURNIEN","13 rue Alluaud","SAINT VICTURNIEN","87420",null,"mairie.stvicturnien@wanadoo.fr"),
("204","1","Commune de ST VITTE SUR BRIANCE","Mairie","SAINT VITTE S BRIANCE","87380",null,"mairiestvittesurbriance@orange.fr"),
("205","1","Commune de ST YRIEIX LA PERCHE","45 bd de l’Hôtel de Ville","SAINT YRIEIX LA PERCHE","87500",null,"secretariat@saint-yrieix.fr"),
("206","1","Commune de ST YRIEIX SOUS AIXE","Mairie","SAINT YRIEIX SOUS AIXE","87700",null,"mairie.saint-yrieix-sous-aixe@wanadoo.fr"),
("207","1","Commune de STE ANNE ST PRIEST","Le Bourg","SAINTE ANNE SAINT PRIEST","87120",null,"mairie.sainte.anne.saint.priest@wanadoo.fr"),
("208","1","Commune de STE MARIE DE VAUX","Mairie","SAINTE MARIE DE VAUX","87420",null,"commune.saintemariedevaux@wanadoo.fr"),
("209","1","Commune de SURDOUX","Mairie","SURDOUX","87130",null,"mairie.surdoux@gmail.com"),
("210","1","Commune de SUSSAC","Le Bourg","SUSSAC","87130",null,"mairiesussac@wanadoo.fr"),
("211","1","Commune de TERSANNES","Le Bourg","TERSANNES","87360",null,"mairie.tersannes@wanadoo.fr"),
("212","1","Commune de THIAT","31 rue principale","THIAT","87320",null,"mairie.thiat@wanadoo.fr"),
("213","1","Commune de THOURON","1 rue de la mairie","THOURON","87140",null,"mairie.thouron@wanadoo.fr"),
("214","1","Commune de VAL D’ISSOIRE","2 centre administratif André Reynaud","MEZIERES SUR ISSOIRE","87330",null,null),
("215","1","Commune de VAULRY","Mairie","VAULRY","87140",null,"mairie.vaulry@wanadoo.fr"),
("216","1","Commune de VAYRES","Rue des belles roses","VAYRES","87600",null,"mairie-vayres@wanadoo.fr"),
("217","1","Commune de VERNEUIL MOUSTIERS","Le Bourg","VERNEUIL MOUSTIERS","87360",null,"mairie.verneuil-moustiers@wanadoo.fr"),
("218","1","Commune de VERNEUIL SUR VIENNE","2 place de l’Eglise","VERNEUIL SUR VIENNE","87430",null,"mairie-verneuil-vienne@wanadoo.fr"),
("219","1","Commune de VEYRAC","Mairie","VEYRAC","87520",null,"mairie.de.veyrac@wanadoo.fr"),
("220","1","Commune de VICQ SUR BREUILH","Mairie","VICQ SUR BREUILH","87260",null,"mairie.vicq@wanadoo.fr"),
("221","1","Commune de VIDEIX","Mairie","VIDEIX","87600",null,"commune-de-videix@wanadoo.fr"),
("222","1","Commune de VILLEFAVARD","La Solitude 1 rue de la Liberté","VILLEFAVARD","87190",null,"commune.villefavard@orange.fr"),
("223","1","Commune des BILLANGES","Le Bourg","LES BILLANGES","87340",null,null),
("224","1","Commune des CARS","Mairie","LES CARS","87230",null,null),
("225","1","Commune des GRANDS CHEZEAUX","14 place de la Fontaine","LES GRANDS CHEZEAUX","87160",null,null),
("226","1","Commune des SALLES LAVAUGUYON",null,"LES SALLES LAVAUGUYON","87440",null,null),
("227","1","Commune d’EYBOULEUF","2 rue de l’Etang","EYBOULEUF","87400",null,null),
("228","1","Commune d’EYJEAUX","le bourg","EYJEAUX","87220",null,null),
("229","1","Commune d’EYMOUTIERS","8, rue de la Collégiale","EYMOUTIERS","87120",null,null),
("230","1","Commune d’ISLE","15 rue Joseph Cazauzets","ISLE","87170",null,null),
("231","1","Commune d’ORADOUR SAINT GENEST","13,rue Joseph Guillemot","ORADOUR SAINT GENEST","87210",null,null),
("232","1","Commune d’ORADOUR SUR GLANE","1 Place Charles de Gaulle","ORADOUR SUR GLANE","87520",null,null),
("233","1","Commune d’ORADOUR SUR VAYRES","26, rue du Général de Gaulle","ORADOUR SUR VAYRES","87150",null,null),
("234","1","Commune du BUIS","2 impasse des écoliers","LE BUIS","87140",null,null),
("235","1","Commune du CHALARD","Mairie","LE CHALARD","87500",null,null),
("236","1","Commune du CHATENET EN DOGNON","31 grand rue","LE CHATENET EN DOGNON","87400",null,null),
("237","1","Commune du DORAT","11, avenue Louis Ricoux","LE DORAT","87210",null,null),
("238","1","Commune du PALAIS","20 rue Jules ferry","LE PALAIS SUR VIENNE","87410",null,null),
("239","1","Commune du VIGEN","1 place Adrien Delor","LE VIGEN","87110",null,null),
("240","2","Conservatoire Intercommunal de MUSIQUE et de DANSE","Place de Leun","FEYTIAT","87221",null,"cimd@bbox.fr "),
("241","2","ETABLISSEMENT PUBLIC DU BASSIN DE LA VIENNE","Parc ester Technopole 18 rue Soyouz","LIMOGES","87000",null," i.bouchoule@epbv.fr "),
("242","2","LIMOGES HABITAT","224 rue François Perrin - BP 398","LIMOGES","87000",null,"contact@limogeshabitat.fr "),
("243","2","ODHAC ISLE","4 rue Robert Schuman","ISLE","87170",null,"infodhac@odhac87.fr "),
("244","2","OPERA DE LIMOGES",null,"LIMOGES","87000",null,null),
("245","2","PETR du Pays MONTS et BARRAGES","Le Château","BUJALEUF","87460",null,"accueil@monts-et-barrages-en-limousin.fr "),
("246","2","PNR PERIGORD LIMOUSIN","Maison du Parc La Barde","LA COQUILLE","24",null,"info@pnrpl.com "),
("247","2","SERVICE DEPARTEMENTAL INCENDIE ET SECOURS","2 Avenue du Président Vincent Auriol","LIMOGES","87000",null,"sdis87@antivirus.oleane.com "),
("248","2","SIAEP COUZE GARTEMPE","Hôtel de ville 1 place de la Liberté","BESSINES SUR GARTEMPE","87250",null,"siaep.couze-gartempe@wanadoo.fr "),
("249","2","SIAEP de LA BENAIZE","1 place du 8 mai 1945","CROMAC","87160",null,"aep.la-benaize@laposte.net "),
("250","2","SIAEP LES ALLOIS","Hôtel de ville","LA GENEYTOUSE","87400",null,"mairie.lageneytouse@wanadoo.fr "),
("251","2","SIAEP NEXON","6 place de l’Eglise","NEXON","87800",null,"mairie.nexon@orange.fr "),
("252","2","SIAEP VAYRES TARDOIRE","26 rue du Général de Gaulle","ORADOUR SUR VAYRES","87150",null,"siaepvayrestardoire@wanadoo.fr "),
("253","2","SIAEP VIENNE BRIANCE GORRE","2 Avenue François Mitterand","AIXE SUR VIENNE","87700",null,"mguilloteau@siaep-vbg87.fr "),
("254","2","SICTOM de la REGION de BESSINES","ZA La Croix du Breuil","BESSINES SUR GARTEMPE","87250",null,"sictom.bessines@wanadoo.fr "),
("255","2","SICTOM SUD HAUTE-VIENNE","6 Place de l’église","NEXON","87800",null,"sictom.shv@orange.fr "),
("256","2","SIDEPA GARTEMPE","3 rue Chanzy","BELLAC","87300",null,"sletang@sidepa.fr "),
("257","2","SIEPEA du PAYS DE GLANE","8 route de Villeneuve","VEYRAC","87520",null,null),
("258","2","SIPES DE JAVERDAT","1 Rue de l’école","JAVERDAT","87520",null,"sipesjaverdatcieux@yahoo.fr "),
("259","2","SIVOM SOLIGNAC LE VIGEN","57 avenue Saint Eloi","SOLIGNAC","87110",null,"mairie-solignac@orange.fr "),
("260","2","SIVOM VIENNE GORRE","1-3 place Léon Litaud","SAINT LAURENT SUR GORRE","87310",null,null),
("261","2","SIVOS RANCON ROUSSAC","30 place Roger Couégnas","ROUSSAC","87140",null,null),
("262","2","SIVU CADICHON","Mairie 48 avenue de Limoges","SAINT PAUL","87260",null,"mairie-stpaul87@wanadoo.fr "),
("263","2","SIVU Centre de loisirs des PUYS et GRANDS MONTS","Mairie 14 rue de Limoges","LA JONCHERE SAINT MAURICE","87340",null,null),
("264","2","SIVU Les HAUTS de TARDOIRE","Mairie","CHAMPSAC","87230",null,"sivu.hauts.tardoire@gmail.com "),
("265","2","SMABGA","23 avenue de Lorraine","CHATEAUPONSAC","87290",null,null),
("266","2","SMICTOM CENTRE BASSE MARCHE","2 route de Bellac","MAGNAC LAVAL","87190",null,null),
("267","2","ST JUNIEN HABITAT","Résidence de l’Europe_61 ter av d’Oradour sur Glane","SAINT JUNIEN","87200",null,null),
("268","2","SYDED","19 rue Cruveilhier","LIMOGES","87000",null,"contact@syded87.org "),
("269","2","SYGESBEM","Mairie 14 place de la République","BELLAC","87300",null,"mfernandes@sygesbem.fr "),
("270","2","Syndcat Mixte d’AMENAGEMENTde la TARDOIRE","La Monnerie","ORADOUR SUR VAYRES","87150",null,"syndicat.tardoire@orange.fr "),
("271","2","Syndicat COUL GART EAU","Mairie","LE BUIS","87140",null,"mairie.lebuis@wanadoo.fr "),
("272","2","Syndicat d’AMENAGEMENT DU BASSIN DE LA VIENNE","24 avenue du Président Wilson","AIXE SUR VIENNE","87700",null,"sabvm@wanadoo.fr "),
("273","2","Syndicat de voierie AREDIEN","45 bd de l’Hôtel de Ville","SAINT YRIEIX LA PERCHE","87500",null,"ac-guerin@saint-yrieix.fr "),
("274","2","Syndicat de voierie de la REGION DE BESSINES (SVRB)","La Croix du Breuil","BESSINES SUR GARTEMPE","87250",null,"sivc@wanadoo.fr "),
("275","2","Syndicat ENERGIE HAUTE-VIENNE","ZA le Chatenet 152 avenue Jean Giraudoux","LE PALAIS SUR VIENNE","87410",null,"sehv@sehv.fr "),
("276","2","Syndicat Intercommunal de Musique et de Danse d’ORADOUR S/ VAYRES","18 rue Louis Pasteur","ORADOUR SUR VAYRES","87150",null,null),
("277","2","Syndicat Intercommunal de voierie de NEXON","Hôtel de ville 6 place de l’Eglise","NEXON","87800",null,null),
("278","2","Syndicat Intercommunal de voierie du BAS LIMOUSIN","Mairie","LES CARS","87230",null,null),
("279","2","Syndicat Intercommunal d’ETUDES et de PROGRAMMATION","Hôtel de ville 9 place Léon Betoulle","LIMOGES","87000",null,null),
("280","2","Syndicat Intêret Scolaire ST MEARD LA CROISILLE","Mairie","SAINT MEARD","87130",null,"mairiestmeard@yahoo.fr "),
("281","2","Syndicat Mixte DORSAL","Bât B 19 bd de la Corderie","LIMOGES","87000",null,"contact@dorsal.fr"),
("282","2","Syndicat VIENNE COMBADE","Mairie Place du 14 juillet","SAINT LEONARD DE NOBLAT","87400",null,"compta@syndicat-vienne-combade.fr");




CREATE TABLE `theme` (
  `NUM_THEME` smallint(6) NOT NULL AUTO_INCREMENT,
  `CODE_PARTIE` smallint(6) NOT NULL,
  `NOM_THEME` varchar(100) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NUM_THEME`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;


INSERT INTO theme VALUES
("1","1","Acteurs de la prévention","fa-user"),
("2","1","Système documentaire","fa-book"),
("3","1","Formations","fa-weixin"),
("4","1","Organisation générale des secours","fa-asterisk"),
("5","1","Gestion des EPI","fa-headphones"),
("6","1","Travaux interdits et réglementés","fa-minus-square"),
("7","1","Entreprises extérieures","fa-clipboard"),
("8","2","Aménagement et hygiène des locaux","fa-home"),
("9","2","Organisation des premiers secours","fa-ambulance"),
("10","2","Prévention du risque Incendie - Explosions - Evacuation","fa-fire-extinguisher"),
("11","2","Prévention du risque de chutes de plain pied","fa-street-view"),
("12","2","Prévention du risque lié au travail en hauteur","fa-building"),
("13","2","Prévention du risque lié aux manutentions manuelles","fa-cubes"),
("14","2","Prévention du risque routier","fa-car"),
("15","2","Prévention du risque lié à l’utilisation des Engins et Machines","fa-cogs"),
("16","2","Prévention du risque chimique","fa-flask"),
("17","2","Prévention du risque électrique","fa-plug"),
("18","2","Prévention du risque lié au bruit","fa-deaf"),
("19","2","Prévention du risque biologique","fa-heartbeat"),
("20","2","Prévention du risque lié aux vibrations mécaniques","fa-bar-chart"),
("21","2","Prévention du risque lié au travail sur écran","fa-desktop"),
("22","2","Prévention du risque lié aux entreprises extérieures","fa-pencil-square-o"),
("23","2","Prévention du risque lié à des activités spécifiques","fa-exclamation-triangle"),
("24","2","Prévention du risque spécifique","fa-wheelchair"),
("25","2","Prévention du risque de chute d’objet et d\'effondrement","fa-gavel"),
("26","2","Prévention du risque alcool","fa-glass");




CREATE TABLE `type_structure` (
  `NUM_TYPE_STRUCTURE` smallint(6) NOT NULL,
  `NOM_TYPE_STRUCTURE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`NUM_TYPE_STRUCTURE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO type_structure VALUES
("1","Collectivité"),
("2","Etablissement public local");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;