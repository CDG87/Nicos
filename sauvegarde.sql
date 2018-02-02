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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO audit VALUES
("6","1","44","2018-01-30",null,null,null,null,"Inspection","2018-01-30");




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
("6","2","2","97","103");




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






CREATE TABLE `controler` (
  `NUM_BATIMENT` smallint(6) NOT NULL,
  `NUM_AUDIT` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_BATIMENT`,`NUM_AUDIT`),
  KEY `I_FK_CONTROLER_BATIMENT` (`NUM_BATIMENT`),
  KEY `I_FK_CONTROLER_AUDIT` (`NUM_AUDIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO controler VALUES
("2","6");




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
("2","DERBALI","Elodie","Responsable du service Prévention des risques professionnels","Pôle SST / Service Prévention","Centre de Gestion de la Haute-Vienne","55 rue de l’Ancienne École Normale d’Instituteurs 
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
INSERT INTO critere VALUES
("202","23","21","202","Travail isolé cimetière (moyen d’alerte)",null),
("203","23","21","203","Formation",null),
("204","23","21","204","Habilitation",null),
("205","23","22","205","Règles de sécurité d’intervention station d’épuration",null),
("206","23","22","206","Protection adaptée (chute-noyade)",null),
("207","23","22","207","Travail isolé station d’épuration (moyen d’alerte)",null),
("208","23","23","208","Règles de sécurité",null),
("209","23","23","209","Protection adaptée au soudage et meulage",null),
("210","23","23","210","Travail isolé soudage et meulage (moyen d’alerte)",null),
("211","23","23","211","Aspiration des fumées",null),
("212","23","24","212","Formation certifiée",null),
("213","23","24","213","EPI adaptés à l’utilisation des produits phytosanitaires",null),
("214","23","24","214","Cahier d’enregistrement",null),
("215","23","24","215","Armoire / Local spécifique",null),
("216","23","25","216","Formation spécifique",null),
("217","23","25","217","Déclaration de restauration scolaire",null),
("218","23","25","218","Poste de travail adapté",null),
("219","23","26","219","Formation spécifique en piscine",null),
("220","23","26","220","Travail isolé",null),
("221","23","27","221","Formation spécifique en menuiserie",null),
("222","23","27","222","Aspiration des poussières",null),
("223","23","27","223","Mesures VLEP",null),
("224","24",null,"224","Accès et aménagement - Travailleurs handicapés",null),
("225","24",null,"225","Contrôle de réglementation ERP de 5ème cat",null),
("226","24",null,"226","Aires de jeux",null),
("227","24",null,"227","Risques sanitaires",null),
("229","19",null,"229","Exposition aux rayons ionisants (RADON)",null),
("230","2","8","230","Arbres à cardan",null),
("232","13",null,"232","Equipements de protection individuelle",null),
("233","12",null,"233","Escabeaux",null),
("234","23","26","234","Equipements de protection individuelle",null),
("235","23","26","235","Protection adaptée (chute-noyade)",null),
("236","23","26","236","Trichloramines",null),
("237","21",null,"237","Câbles électriques et voies de circulation",null),
("239","15","18","239","Formation à la conduite",null),
("240","10","12","240","Vannes \"police\null,null),
("241","23","28","241","Formation",null),
("242","23","28","242","Habilitation et renouvellement",null),
("243","23","28","243","Stockage",null),
("244","14","16","244","Equipements de sécurité (gilet, triangle)",null),
("245","23","25","245","EPI adaptés",null),
("247","25",null,"247","Evaluation  du risque (effondrement, chute d\'objet)",null),
("248","12",null,"248","Échelles fixes",null),
("249","14","15","249","Etat du véhicule",null),
("250","23","25","250","Couverture anti-feu",null),
("251","25",null,"251","EPI adaptés",null),
("253","26",null,"253","Présence de boisson alcoolisée",null),
("254","26",null,"254","Gestion du risque alcool",null);




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
("6","1","2","1","2","8","97","NC","0",null,"WIN_20151208_14_24_23_Pro.jpg");




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
("1","1","Atelier principal",null,null),
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
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=latin1;


INSERT INTO observation VALUES
("4","1","L’Autorité Territoriale n’a pas désigné d’agent sur la mission d\'Assistant de Prévention.","2",null),
("6","2","Le ou les agents désignés en tant qu\'Assistant de Prévention disposent d\'un arrêté de désignation.","1",null),
("7","2","Le ou les agents désignés en tant qu\'Assistant de Prévention ne disposent pas d\'un arrêté de désignation.","2",null),
("8","3","Le ou les agents disposent de leur lettre de cadrage.","1",null),
("10","3","Le ou les agents désignés ne disposent pas de leur lettre de cadrage .","2",null),
("12","4","FORMATION OBLIGATOIRE:
("15","4","FORMATION OBLIGATOIRE:
("16","5","Les moyens mis à disposition du ou des agents pour assurer les missions d\'AP sont suffisants pour assurer toutes les activités définies dans la lettre de cadrage.","1",null),
("18","5","Les moyens mis à disposition du ou des agents pour assurer les missions d\'AP ne sont pas suffisants pour assurer toutes les activités définies dans la lettre de cadrage.","2",null),
("21","6","L\'Autorité Territoriale a désigné un agent sur la mission de Conseiller de Prévention.","1",null),
("23","6","L\'Autorité Territoriale n\'a pas désigné d\'agent sur la mission de Conseiller de Prévention.","2",null),
("25","7","L\'agent désigné en tant que Conseiller de Prévention dispose d\'un arrêté de nomination.","1",null),
("26","7","L\'agent désigné en tant que Conseiller de Prévention ne dispose pas d\'un arrêté de nomination.","2",null),
("28","8","L\'agent dispose d\'une lettre de cadrage.","1",null),
("30","8","L\'agent ne dispose pas d\'une lettre de cadrage.","2",null),
("32","9","FORMATION OBLIGATOIRE:
("34","9","FORMATION OBLIGATOIRE:
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
("49","15","Il a été indiqué que la liste des agents soumis à une surveillance médicale particulière n\'a pas été communiquée au Médecin de Prévention.
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
("127","45","RECENSEMENT:
("128","45","FDS:
INSERT INTO observation VALUES
("130","45","RECENSEMENT:
("131","45","FDS:
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
("160","57","EXTINCTEURS:
("161","57","EXTINCTEURS:
("162","57","ALARME INCENDIE:
("163","57","ALARME INCENDIE:
("166","58","PTAC<3,5T:
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
("191","67","TRACTEUR>50CV:
("192","67","TRACTEUR>50CV:
("193","67","MINIPELLE/TRACTEUR<50CV:
("194","67","TRACTOPELLE:
("195","67","PEMP:
("197","67","TONDEUSE AUTOPORTEE:
("198","68","Le ou les agents concernées par les travaux à proximité des réseaux aériens ou enterrés ont obtenu l\'habilitation AIPR (autorisation d’intervention à proximité des réseaux)","1",null),
("199","68","Il a été indiqué que le ou les agents concernées par les travaux à proximité des réseaux aériens ou enterrés ne possèdent pas l\'habilitation AIPR (autorisation d’intervention à proximité des réseaux)","2",null),
("200","69","CERTIPHYTO:
("201","69","CERTIBIOCIDE:
("202","69","CERTIPHYTO:
("203","69","CERTIBIOCIDE:
("204","70","Un ou des agents sont formés aux techniques de tronçonnage.","1",null),
("205","70","Il a été indiqué qu\'il n\'y a pas d\'agent formé aux techniques de tronçonnage.","2",null),
("206","71","Il a été indiqué que les agents susceptibles d\'être exposés à l\'amiante ont suivi la formation réglementaire.","1",null),
("207","71","Il a été indiqué que les agents susceptibles d\'être exposés à l\'amiante n\'ont pas suivi la formation réglementaire.","2",null),
("208","72","LOCAUX:
("209","72","LOCAUX:
("210","72","VÉHICULES:
("211","72","VÉHICULES:
("213","73","Il a été indiqué que l\'affichage des différents n° d\'urgence et consignes de sécurité n\'est pas présent sur tous les sites.","2",null),
("214","73","Il a été indiqué que l\'affichage des différents n° d\'urgence et consignes de sécurité est présent sur tous les sites.","1",null),
("215","73","Il a été indiqué qu\'un affichage d\'urgence est présent sur certains sites et qu\'il est nécessaire de le compléter. (voir les préconisations)","2",null),
("216","74","LOCAUX:
("217","74","LOCAUX:
("218","74","VÉHICULES:
("219","74","VÉHICULES:
("220","75","Il a été indiqué qu\'une organisation de travail est mise en place pour prévenir des risques liés aux situations de travail isolé.
("222","75","Il a été indiqué qu\'aucune organisation de travail n\'est mise en place pour prévenir les situations de travail isolé sur des activités à risques élevés. (tronçonnage, travail en hauteur, travail en bordure de bassin etc...)","2",null),
("223","76","SUR SITE:
("224","76","EN EXTERIEUR:
("225","76","SUR SITE:
("226","76","EN EXTÉRIEUR:
("227","77","Les locaux de travail ont été rendus accessibles aux travailleurs handicapés.","1",null),
("228","77","Les locaux de travail n\'ont pas été rendus accessibles aux travailleurs handicapés.","2",null),
("229","78","Il a été indiqué que les équipements de travail et de protection individuelle sont fournis aux agents.
("230","78","Il a été indiqué qu\'aucun équipement de travail et de protection individuelle n\'est fourni aux agents.","2",null),
("231","79","Il a été indiqué que les EPI sont  portés par les agents.","1",null),
("232","79","Il a été indiqué que les EPI ne sont pas systématiquement portés par les agents.","2",null),
("233","80","Le suivi est assuré par chaque agent avant utilisation.
("234","80","Le suivi et l\'entretien ne sont pas maîtrisés, il a été indiqué que les agents gèrent eux-même le remplacement et le nettoyage de leurs EPI.","2",null),
("235","81","FORMATION:
("236","81","FORMATION:
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
("273","94","VESTIAIRES/SANITAIRES:
("274","94","NETTOYAGE:
("275","94","LOCAUX DE TRAVAIL:
("276","95","Absence de point d’eau potable et fraîche.","2",null),
("277","95","Eau potable et fraîche à disposition.","1",null),
("278","96","INTERDICTION:
("279","96","AFFICHAGE:
("281","96","INTERDICTION:
("282","97","VESTIAIRES:
("284","97","LAVABOS:
("286","98","(Une ou) des douches sont à disposition (du ou) des agents du centre technique.","1",null),
("287","98","Aucune douche n’est à disposition des agents du centre technique.","2",null),
("288","99","LOCAL:
("289","99","LOCAL:
("290","99","EQUIPEMENTS:
("291","99","EQUIPEMENTS:
("292","99","MOBILIER:
("293","99","MOBILIER:
("294","100","CABINET D\'AISANCE:
("295","100","NOMBRE:
("296","100","ENTRETIEN:
("297","100","SÉPARATION:
("298","100","CABINET D\'AISANCE:
("299","100","NETTOYAGE:
("300","100","SÉPARATION:
("301","101","Absence d’eau potable et fraîche à disposition.","2",null),
("302","101","Eau potable et fraîche à disposition.","1",null),
("303","102","Absence de local de repos.","2",null),
("304","102","Présence d’un local de repos.","1",null),
("305","103","CHAUFFAGE:
("306","103","CHAUFFAGE:
("307","103","VÊTEMENTS:
("308","103","VÊTEMENTS:
("309","104","ECLAIRAGE:
("311","104","ECLAIRAGE:
("312","104","PROTECTION LUMINEUSE:
("313","104","PROTECTION LUMINEUSE:
("314","105","Absence d’aération par ventilation mécanique ou par ventilation naturelle permanente.","2",null),
("315","105","Présence d’une aération par ventilation mécanique ou par ventilation naturelle permanente.","1",null),
("316","106","VÉHICULES:
("317","106","LOCAUX:
("318","107","L\'affichage des différents numéros d\'urgence et consignes de sécurité est présent sur tous les sites de la structure.","1",null),
("319","107","L\'affichage des différents numéros d\'urgence et consignes de sécurité n\'est pas présent sur tous les sites de la structure.","2",null),
("320","108","TRAVAIL ISOLE:
("321","108","TRAVAIL ISOLE:
("322","109","TÉLÉPHONE FIXE:
("323","109","TÉLÉPHONE FIXE:
("324","110","Absence de procédure d’urgence.","2",null),
("325","110","Présence d’une procédure d’urgence.","1",null),
("326","111","L’effectif théorique à été calculé.","1",null),
("327","111","L’effectif théorique n’a pas été calculé.","2",null),
("328","112","Les remarques de la commission de sécurité ont été levées.","1",null),
("329","112","Les remarques de la commission de sécurité n’ont pas été levées.","2",null),
("330","112","Un avis défavorable à été émis par la commission de sécurité.","2",null),
("331","113","NOMBRE:
("332","113","NOMBRE:
("333","113","ACCESSIBILITÉ:
("334","113","ACCESSIBILITÉ:
("335","113","SIGNALISATION:
("336","113","SIGNALISATION:
("337","113","ENGINS:
("338","113","ENGINS:
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
("350","118","AFFICHAGE:
("351","118","Les plans d\'évacuation sont à jour et affichés.","1",null),
("352","119","Le ou les dégagements sont libres.","1",null),
("353","119","Le ou les dégagements sont encombrés.","2",null),
("355","120","OUVERTURE:
("356","120","OUVERTURE:
("357","120","NOMBRE;
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
("374","129","CONFORMITÉ:
("375","129","CONFORMITÉ:
("376","129","DÉGAGEMENT:
("377","129","MAIN COURANTE:
("378","129","DÉGAGEMENT:
("379","130","Le ou les plans de travail situés en hauteur ne disposent pas de garde-corps.","2",null),
("380","130","Le ou les plans de travail situés en hauteur disposent de garde-corps réglementaires.","1",null),
("382","130","Le ou les plans de travail situés en hauteur ne disposent pas de garde-corps réglementaires.","2",null),
("385","131","La structure ne dispose pas de plate-forme élévatrice mobile de personne (PEMP) mais il a été indiqué qu’il lui arrivé d’en louer occasionnellement","1",null),
("386","131","FORMATION CONDUITE:
("388","131","E.P.I:
("389","131","FORMATION E.P.I:
("390","131","FORMATION CONDUITE:
("391","131","FORMATION E.P.I:
("392","131","NOMBRE D\'AGENTS:
("393","132","EPI:
("394","132","FORMATION:
("395","132","FORMATION:
("397","133","FORMATION:
("398","133","FORMATION:
("399","133","NOTICE:
("400","133","NOTICE:
("401","133","ETAT GÉNÉRAL:
("402","133","VÉRIFICATION PÉRIODIQUE:
("403","133","VÉRIFICATION PÉRIODIQUE:
("404","134","ETAT:
("405","134","ETAT:
("407","134","UTILISATION ECHELLE:
("408","134","UTILISATION ECHELLE:
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
("429","142","MISE A DISPOSITION:
("430","142","PORT OBLIGATOIRE:
("433","142","ETAT:
("434","142","MISE A DISPOSITION:
("435","143","SIGNALISATION:
("436","143","SIGNALISATION:
("437","143","TRACTEUR EPAREUSE:
("438","143","TRACTEUR EPAREUSE:
("439","143","OUTILS ATTELÉS:
("440","143","OUTILLAGES PORTES:
("441","144","STOCK:
("442","144","STOCK:
("443","144","FIN DE PRESCRIPTION:
("444","144","ETAT:
("445","144","ETAT:
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
("473","157","TRACTEUR EPAREUSE:
("474","157","TRACTEUR EPAREUSE:
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
("498","168","EVALUATION DES RISQUES:
("499","168","EVALUATION DES RISQUES:
("501","169","Il a été indiqué que certains agents du service technique ont suivi la formation certifiante ’Certi-phyto’","1",null),
("502","169","Il a été indiqué que les agents du service technique n’ont pas suivi de formation à l’utilisation des produits dangereux.","2",null),
("503","169","Il a été indiqué que des agents du restaurant scolaire ont suivi une formation sur cette problématique dans le cadre de l’HACCP.","1",null),
("504","169","Il a été indiqué que les agents d’entretien n’ont pas suivi de formation à l’utilisation des produits dangereux.","2",null),
("505","170","Il a été indiqué que les FDS (Fiches de données de sécurité) des produits utilisés et stockés ont été recensées et sont mises à disposition sur les sites de stockage.","1",null),
("506","170","INVENTAIRE:
("507","171","La liste des travailleurs exposés a été communiquée au service de médecine préventive.","1",null),
("508","171","La liste des travailleurs exposés n\'a pas été communiquée au service de médecine préventive.
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
("522","176","STOCKAGE:
("523","176","LOCAL:
("524","176","ARMOIRE:
("526","176","STOCKAGE:
("527","177","La liste des travailleurs exposés a été communiquée au service de médecine préventive.","1",null),
("528","177","La liste des travailleurs exposés n\'a pas été communiquée au service de médecine préventive.","2",null),
("529","178","Il a été indiqué que la collectivité dispose d\'agents formés et habilités à intervenir sur les installations électriques.","1",null),
("530","178","Il a été indiqué que la collectivité ne dispose pas d\'agent formé et habilité à intervenir sur les installations électriques.","2",null),
("531","179","La ou les installations sont conformes (rapport de vérification périodique sans remarque)","1",null),
("533","180","La ou les armoires sont signalées par un pictogramme de danger électrique.","1",null),
("534","180","La ou les armoires ne sont pas signalées par un pictogramme de danger électrique.","2",null),
("535","181","EVALUATION RISQUE BRUIT: 
("536","181","EVALUATION RISQUE BRUIT:
("537","182","MISE A DISPOSITION:
("538","182","MISE A DISPOSITION:
("539","183","FORMATION RISQUE BRUIT:
("540","183","FORMATION RISQUE BRUIT:
("541","184","SUIVI MEDICAL:
("542","184","SUIVI MEDICAL:
("543","185","MESURES D\'EXPOSITION:
("544","185","MESURES D\'EXPOSITION:
("545","186","EVALUATION DES RISQUES:
("546","186","EVALUATION DES RISQUES:
("547","186","EVALUATION DES RISQUES:
("548","187","Une démarche de suppression de l\'exposition au risque a été initiée.","1",null),
("549","187","Aucune démarche de suppression de l\'exposition au risque n\'a été initiée.","2",null),
("550","188","LISTE AGENTS EXPOSES:
("551","188","LISTE AGENTS EXPOSES:
("552","189","INSTRUCTION:
("553","189","INSTRUCTION:
("554","190","Le risque lié aux vibrations mécaniques a fait l\'objet d\'une évaluation des risques dans le document unique (DUERP)","1",null),
("555","190","Le risque lié aux vibrations mécaniques n\'a pas fait l\'objet d\'une évaluation des risques dans le document unique.","2",null),
("556","191","MESURES D\'EXPOSITION:
("557","191","MESURES D\'EXPOSITION:
("558","192","SUIVI MÉDICAL:
("559","192","SUIVI MÉDICAL:
("560","193","L’implantation du bureau est adaptée.","1",null),
("561","193","L’implantation du bureau est à revoir.","2",null),
("562","194","L’éclairage est suffisant et les protections contre l’éblouissement sont présentes.","1",null),
("563","194","L’éclairage est insuffisant et les protections contre l’éblouissement sont absentes.","2",null),
("564","195","MATÉRIEL INFORMATIQUE ET MOBILIER:
("565","195","MATÉRIEL INFORMATIQUE ET MOBILIER:
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
("631","227","AMIANTE:
("632","227","AMIANTE:
("643","229","DIAGNOSTIC RADON:
("644","229","DIAGNOSTIC RADON:
("649","230","Il a été indiqué que le ou les arbres à cardan n\'ont pas fait l\'objet d\'une vérification périodique (annuelle)","2",null),
("651","53","Il a été indiqué que toutes les installations électriques n\'ont pas été vérifiées par un organisme agréé ou une personne qualifiée .","2",null),
("654","232","Des chaussures de sécurité anti-dérapantes à embout renforcé sont à disposition.","1",null),
("655","232","Absence de chaussure de sécurité à embout renforcé.","2",null),
("656","97","VESTIAIRES:
("658","93","Une zone de danger observée lors de l\'inspection est à signaler par des dispositifs visuels","2",null),
("659","106","LOCAUX:
("660","106","VÉHICULES:
("661","106","CONTENU:
("662","107","Un affichage des numéros d\'urgence est présent, il est cependant nécessaire de le compléter","2",null),
("663","108","ASTREINTE:
("664","108","ASTREINTE:
("665","109","TÉLÉPHONE PORTABLE:
("666","109","TÉLÉPHONE PORTABLE:
("667","121","Le ou les escaliers d\'une largeur au moins égale à 1,5 mètre sont munis d\'une main courante de chaque côté.","1",null),
("668","121","Aucun objet, marchandise ou matériel ne fait obstacle à la circulation des personnes dans le ou les escaliers.","1",null),
("669","121","Le ou les escaliers d\'une largeur au moins égale à 1,5 mètre ne sont pas munis d\'une main courante de chaque côté.","2",null),
("670","122","Le bâtiment n\'est pas équipé d\'un système d\'alarme sonore.","2",null),
("671","123","Absence de Bloc Autonome d\'Eclairage Sécurité (BAES). ","2",null),
("672","125","La fosse de visite est conforme aux recommandation R468 et R469.","1",null),
("673","129","MAIN COURANTE:
("674","129","MAINS COURANTES:
("675","132","EPI:
("676","132","CONTRÔLE:
("677","132","CONTRÔLE:
("678","133","ETAT GÉNÉRAL:
("681","233","ETAT:
("682","233","ETAT:
("683","233","UTILISATION ESCABEAU:
("684","131","NOMBRE D\'AGENTS FORMES:
("685","164","Il a été indiqué que l\'Engin de Service Hivernal a fait l\'objet d\'une \"réception à titre isolé\" auprès des services de la DREAL.","1",null),
("686","150","Matériel modifié remettant en cause sa conformité CE.","2",null),
("687","139","Il n\'y a aucun mesure de vérification de la validité du permis de conduire des agents.","2",null),
("688","140","Les agents ont suivi la formation FIMO mais ne sont  pas à jour de leur recyclage (FCO).","2",null),
("689","168","EVALUATION DES RISQUES:
("690","174","Pas de dispositif de captage des polluants.","2",null),
("691","178","Il a été indiqué que les agents formés ne sont pas à jour de leur recyclage (recommandation tous les 3 ans)","2",null),
("692","181","EVALUATION RISQUE BRUIT:
("693","182","ETAT:
("694","182","ETAT:
("695","182","PORT:
("696","184","SUIVI MEDICAL:
("697","185","MOYENS DE REDUCTION:
("698","185","SIGNALISATION:
("699","185","MOYENS DE REDUCTION:
("700","185","SIGNALISATION:
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
("717","195","MATÉRIEL INFORMATIQUE:
("718","195","MATÉRIEL INFORMATIQUE:
("719","195","MOBILIER:
("720","195","MOBILIER:
("721","197","SURFACE:
("722","197","LARGEUR DE PASSAGE:
("723","197","SURFACE:
("724","197","LARGEUR DE PASSAGE:
("725","237","Les voies de circulation sont dégagées.","1",null),
("726","237","Présence de câbles électriques dans la ou les voies de circulation.","2",null),
("727","237","Présence d’objets dans la ou les voies de circulation.","2",null),
("728","236","Absence de produit ou de procédé qui permette de réduire la teneur en chlore combiné dans les bassins.","2",null),
("729","201","Le ou les agents ne sont pas équipés des EPI nécessaires.","2",null),
("730","204","L’habilitation date de plus de 6 ans et n’a pas été renouvelée.","2",null),
("731","190","Les risques liés aux vibrations mécaniques n\'ont pas été évalués sur tous les équipements de travail.","2",null),
("732","191","MOYENS DE REDUCTION:
("734","191","MOYENS DE RÉDUCTION:
("735","229","DIAGNOSTIC RADON:
("736","229","DIAGNOSTIC RADON:
("737","229","SUIVI MEDICAL:
("738","229","SUIVI MEDICAL:
("739","229","PREVENTION:
("740","229","PREVENTION:
("741","97","ARMOIRES:
("742","105","Aération par ventilation insuffisante.","2",null),
("743","120","NOMBRE:
("744","121","Des objets dans l\'escalier, font obstacle à la circulation des personnes.","2",null),
("745","129","MAINS COURANTES:
("746","134","ACCÈS:
("747","233","UTILISATION ESCABEAU:
("748","136","Les dispositifs d\'aide à la manutention sont insuffisants ou inadaptés.","2",null),
("749","232","Absence de gant de manutention manuelle.","2",null),
("757","239","TRACTOPELLE:
("758","239","TRACTOPELLE:
("759","239","TRACTEUR>50CV:
("760","239","TRACTEUR>50CV:
("761","239","TRACTEUR<50CV/MINIPELLE:
("762","239","PEMP:
("763","239","TRACTEUR<50CV/MINIPELLE:
("764","239","PEMP:
("765","157","TRACTEUR:
("766","157","TRACTEUR:
("767","157","TRACTOPELLE:
("768","157","TRACTOPELLE:
("769","157","SIGNALISATION COMPLÉMENTAIRE:
("770","157","SIGNALISATION COMPLÉMENTAIRE:
("775","240","Les organes de coupure d\'énergie (vannes \"police\") sont signalés et accessibles.","1",null),
("776","240","Les organes de coupure d\'énergie (vannes \"police\") ne sont pas accessibles.","2",null),
("778","176","COMPATIBILITÉ:
("779","176","COMPATIBILITÉ:
("780","240","Les organes de coupure d\'énergie (vannes \"police\") ne sont pas signalés.","2",null),
("781","161","La ou les tondeuses autoportées ont un éclairage défaillant. (Gyrophare et/ou éclairage de position et/ou de changement de direction)","2",null),
("782","241","Le ou les agents ont été formés à l\'utilisation des artifices.","1",null),
("783","241","Le ou les agents n\'ont pas été formés à l\'utilisation des artifices.","2",null),
("784","242","Le ou les agents ont été habilités par l\'Autorité Territoriale.","1",null),
("785","242","Le ou les agents n\'ont pas été habilités par l\'Autorité Territoriale.","2",null),
("786","243","Le stockage est conforme à la réglementation.","1",null),
("787","243","Le stockage n\'est pas conforme à la réglementation.","2",null),
("788","169","Il a été indiqué que le ou les agents n’ont pas suivi de formation à l’utilisation et à la manipulation des produits dangereux.","2",null),
("789","170","PRÉSENCE:
("790","142","PORT OBLIGATOIRE:
("791","142","ETAT:
("792","179","VÉRIFICATION:
("793","179","SUIVI:
("794","182","PORT:
("796","4","FORMATION OBLIGATOIRE:
("797","4","FORMATION CONTINUE:
("798","9","FORMATION CONTINUE:
("799","36","Il a été indiqué que le registre Santé et Sécurité au Travail n\'a  pas été ouvert dans tous les services.","2",null),
("800","44","Il a été indiqué qu\'il n\'y a pas d\'agents formés et habilités en nombre suffisant pour intervenir sur les installations électriques ou à proximité.","2",null),
("801","48","Il a été indiqué qu\'il n\'y a pas de vérifications périodiques de l\'ensemble des installations d\'aération et de ventilation.","2",null),
("802","50","Il a été indiqué que certains appareils ou accessoires de levage ne sont pas contrôlés périodiquement.","2",null),
("803","230","Le ou les arbres à cardan ont fait l\'objet d\'une vérification périodique (annuelle)","1",null),
("804","230","Il a été indiqué que les arbres à cardan n\'ont pas tous fait l\'objet d\'une vérification périodique (annuelle)","2",null),
("805","58","PTAC<3,5T:
("806","58","PTAC>3,5T:
("807","58","PTAC>3,5T:
("808","244","Le ou les véhicules en circulation sont équipés d’un triangle de présignalisation et d’un gilet rétroréfléchissant rangés dans l’habitacle et aux normes CE.","1",null),
("809","244","Le ou les véhicules en circulation ne sont pas équipés d’un triangle de présignalisation et d’un gilet rétroréfléchissant.","2",null),
("810","244","Les véhicules en circulation ne sont pas tous équipés d’un triangle de présignalisation et d’un gilet rétroréfléchissant.","2",null),
("811","53","SUIVI:
("812","52","Il a été indiqué que tous les équipements de travail en hauteur ne sont pas vérifiés. (Voir la liste dans les préconisations)","2",null),
("813","52","SUIVI:
("814","62","Il a été indiqué que les formations initiales à la sécurité n\'était pas systématiquement effectuées.","2",null),
("815","63","Il a été indiqué qu\'aucun plan de formation n\'a été mis en place.","2",null),
("816","63","Un plan de formation a été mis en place.","1",null);
INSERT INTO observation VALUES
("818","64","Il a été indiqué que tous les agents n\'ont pas suivi de formation à l\'utilisation des extincteurs.","2",null),
("819","65","RECYCLAGE:
("820","67","MINIPELLE/TRACTEUR<50CV:
("821","67","TRACTOPELLE:
("822","67","PEMP:
("823","67","TONDEUSE AUTOPORTEE:
("824","67","RECYCLAGE:
("825","75","Il a été indiqué qu\'il n\'y a pas de procédure en place pour les interventions sous astreinte.","2",null),
("826","80","Le suivi et l\'entretien sont assurés par un prestataire. ","1",null),
("827","92","L\'autorité territoriale ne délivre pas de Permis de feu pour les travaux par \"point chaud\".","2",null),
("828","92","L\'autorité territoriale délivre un Permis de feu pour tous les travaux par \"point chaud\".","1",null),
("830","97","LAVABOS:
("831","97","LAVABOS:
("832","97","ARMOIRES:
("833","206","Le ou les plans de travail situés en hauteur ne disposent pas de garde-corps réglementaires.","2",null),
("834","223","Des mesures de VLEP ont été effectuées et sont supérieures à la réglementation.","2",null),
("835","227","RADON:
("836","227","RADON:
("837","227","LÉGIONELLOSE:","2",null),
("838","227","LÉGIONELLOSE:","1",null),
("840","212","Il a été indiqué que les agents qui utilisent des produits phyto-sanitaires n\'ont pas tous suivi la formation Certi-Phyto. ","2",null),
("841","216","Il a été indiqué que les agents intervenants sur la fabrication ou la manutention des repas n\'ont pas tous suivi de formation  à l\'hygiène alimentaire (HACCP)","2",null),
("842","245","Les agents ont à leur disposition les EPI adaptés (gants anti-chaleur, gants anti-coupures, vêtements et chaussures de sécurité)","1",null),
("843","245","Absence de gant de protection contre la coupure.","2",null),
("844","96","AFFICHAGE:
("845","118","MISE A JOUR:
("846","78","Il a été indiqué que les agents ne sont pas tous dotés des équipements de travail et de protection individuelle nécessaire.","2",null),
("847","81","SENSIBILISATION:
("848","81","SENSIBILISATION:
("849","71","A CONTRÔLER:
("850","1","A CONTRÔLER:
("851","2","A CONTRÔLER:
("852","3","A CONTRÔLER:
("853","4","A CONTRÔLER:
("854","31","A CONTRÔLER:
("855","5","A CONTRÔLER:
("856","6","A CONTRÔLER:
("857","7","A CONTRÔLER:
("858","8","A CONTRÔLER:
("859","9","A CONTRÔLER:
("860","10","A CONTRÔLER:
("861","11","A CONTRÔLER:
("862","12","A CONTRÔLER:
("863","13","A CONTRÔLER:
("864","14","A CONTRÔLER:
("865","15","A CONTRÔLER:
("866","16","A CONTRÔLER:
("867","17","A CONTRÔLER:
("868","18","A CONTRÔLER:
("869","19","A CONTRÔLER:
("870","20","A CONTRÔLER:
("871","21","A CONTRÔLER:
("872","22","A CONTRÔLER:
("873","23","A CONTRÔLER:
("874","24","A CONTRÔLER:
("875","25","A CONTRÔLER:
("876","26","A CONTRÔLER:
("877","27","A CONTRÔLER:
("878","28","A CONTRÔLER:
("879","29","A CONTRÔLER:
("880","30","A CONTRÔLER:
("881","32","A CONTRÔLER:
("882","33","A CONTRÔLER:
("883","34","A CONTRÔLER:
("884","35","A CONTRÔLER:
("885","36","A CONTRÔLER:
("886","37","A CONTRÔLER:
("887","38","A CONTRÔLER:
("888","39","A CONTRÔLER:
("889","40","A CONTRÔLER:
("890","41","A CONTRÔLER:
("891","42","A CONTRÔLER:
("892","43","A CONTRÔLER:
("893","44","A CONTRÔLER:
("894","45","A CONTRÔLER:
("895","46","A CONTRÔLER:
("896","47","A CONTRÔLER:
("897","48","A CONTRÔLER:
("898","49","A CONTRÔLER:
("899","50","A CONTRÔLER:
("900","51","A CONTRÔLER:
("901","52","A CONTRÔLER:
("902","53","A CONTRÔLER:
("903","54","A CONTRÔLER:
("904","55","A CONTRÔLER:
("905","56","A CONTRÔLER:
("906","57","A CONTRÔLER:
("907","58","A CONTRÔLER:
("908","59","A CONTRÔLER:
("909","60","A CONTRÔLER:
("910","61","A CONTRÔLER:
("911","230","A CONTRÔLER:
("912","62","A CONTRÔLER:
("913","63","A CONTRÔLER:
("914","64","A CONTRÔLER:
("916","66","Il a été indiqué que les agents n\'ont pas tous suivi de formation sur les risques spécifiques sur leur poste de travail (voir liste dans la partie réglementaire).","2",null),
("917","67","A CONTRÔLER:
("918","68","A CONTRÔLER:
("919","69","A CONTRÔLER:
("920","70","A CONTRÔLER:
INSERT INTO observation VALUES
("921","72","A CONTRÔLER:
("922","73","A CONTRÔLER:
("923","74","A CONTRÔLER:
("924","75","A CONTRÔLER:
("925","76","A CONTRÔLER:
("926","77","A CONTRÔLER:
("927","78","A CONTRÔLER:
("928","79","A CONTRÔLER:
("929","80","A CONTRÔLER:
("930","81","A CONTRÔLER:
("931","82","A CONTRÔLER:
("932","83","A CONTRÔLER:
("933","84","A CONTRÔLER:
("934","85","A CONTRÔLER:
("935","86","A CONTRÔLER:
("936","87","A CONTRÔLER:
("937","88","A CONTRÔLER:
("938","89","A CONTRÔLER:
("939","90","A CONTRÔLER:
("940","91","A CONTRÔLER:
("941","92","A CONTRÔLER:
("944","247","EVALUATION DES RISQUES:
("945","247","EVALUATION DES RISQUES:
("946","248","ECHELLE FIXE>3M:
("947","248","ECHELLE FIXE>3M:
("948","248","ECHELLE D’ACCÈS:
("949","248","ECHELLE D’ACCÈS:
("950","66","A CONTRÔLER:
("951","134","PORT DE CHARGES:
("952","134","ACCÈS:
("953","249","PNEUMATIQUES:
("954","249","PNEUMATIQUES:
("955","245","Absence de gant de protection contre la brûlure.","2",null),
("956","245","Absence de chaussures de sécurité fermées à embout renforcé.","2",null),
("957","250","Présence d\'une couverture anti-feu facilement accessible.","1",null),
("958","250","PRÉSENCE:
("959","250","POSITIONNEMENT:
("960","251","MISE A DISPOSITION:
("961","251","MISE A DISPOSITION:
("962","247","EVALUATION DES RISQUES:
("963","251","ETAT:
("964","251","PORT:
("965","251","ETAT:
("966","251","PORT:
("967","249","ECLAIRAGE:
("968","249","ECLAIRAGE:
("969","65","A CONTRÔLER:
("970","80","Le nettoyage et le suivi sont assurés par l\'employeur.","1",null),
("1006","170","PRÉSENCE:
("1012","253","Il a été constaté la présence de boissons alcoolisées non réglementaires et accessibles aux agents ","2",null),
("1013","254","Il existe un règlement intérieur qui définit l\'ensemble des postes à risque et qui contient un protocole d\'action (procédure de gestion immédiate de ces situations)","1",null),
("1015","253","Il a été indiqué qu\'aucune boisson alcoolisée autre que le vin, la bière, le cidre et le poiré n\'est présente","1",null),
("1016","253","Il existe un règlement intérieur où sont intégrées les  obligations et interdictions en matière d\'alcool","1",null),
("1017","254","Il existe une procédure à mettre en oeuvre sans règlement intérieur pour les cas d\'agent en état d\'ébriété.","1",null),
("1018","254","Il n\'existe pas de règlement intérieur  ni de note de service qui définit l\'ensemble des postes à risque et qui contient un protocole d\'action (procédure de gestion immédiate de ces situations)","2",null),
("1023","94","ENCOMBREMENT: 
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;






CREATE TABLE `participer` (
  `NUM_PARTICIPANT` smallint(6) NOT NULL,
  `NUM_AUDIT` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM_PARTICIPANT`,`NUM_AUDIT`),
  KEY `I_FK_PARTICIPER_PARTICIPANT` (`NUM_PARTICIPANT`),
  KEY `I_FK_PARTICIPER_AUDIT` (`NUM_AUDIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `pole` (
  `CODE_POLE` smallint(6) NOT NULL AUTO_INCREMENT,
  `LIBELLE_POLE` varchar(32) DEFAULT NULL,
  `PICTOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_POLE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


INSERT INTO pole VALUES
("1","Administratif","fa-at"),
("2","Technique","fa-gavel"),
("4","Enfance","fa-smile-o"),
("5","Culture / Animation / Sport","fa-futbol-o"),
("6","Santé / Social","fa-heartbeat"),
("7","Police / Secours","fa-ambulance");




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
("6","1","2","1","2","8","97","282"),
("6","1","2","1","2","8","97","830"),
("6","1","2","1","2","8","97","831");




CREATE TABLE `preconisation` (
  `NUM_PRECONISATION` smallint(6) NOT NULL AUTO_INCREMENT,
  `NUM_CRITERE` smallint(6) NOT NULL,
  `LIBELLE_PRECONISATION` varchar(1000) NOT NULL,
  `code_Preco` int(1) DEFAULT NULL,
  PRIMARY KEY (`NUM_PRECONISATION`),
  KEY `NUM_CRITERE` (`NUM_CRITERE`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=latin1;


INSERT INTO preconisation VALUES
("1","1","DESIGNATION:
("2","2","Une délibération informant de la nomination d’un assistant doit être prise.
("3","3","La mission de l\'Assistant de Prévention ainsi que les moyens qui lui sont accordés sont définis dans une « lettre de cadrage », signée de l\'autorité territoriale en cours de mandat.
("4","4","FORMATION OBLIGATOIRE:
("5","5","Pour mener à bien ses missions, l’assistant de prévention doit pouvoir bénéficier de temps et avoir accès à un poste informatique, à des outils d’information et éventuellement à un moyen de transport afin d’exercer ses missions. 
("6","6","Désigner un agent sur la mission de Conseiller de Prévention.
("7","7","Pour officialiser la nomination, un arrêté doit être pris :
("8","8","Les mission du Conseiller de Prévention ainsi que les moyens qui lui sont accordés sont définis dans une « lettre de cadrage », signée de l\'autorité territoriale en cours de mandat.
("9","9","FORMATION OBLIGATOIRE:
("10","10","La reconnaissance de la place du conseiller de prévention est un gage de réussite. Il est vivement conseillé aux collectivités et établissements de veiller au respect des règles suivantes :
("11","11","S’assurer que tous les agents sont à jour de leur visite médicale et planifier avec le service de médecine préventive du CDG les visites des agents non à jour.
("12","12","Consulter le médecin de prévention sur les projets de construction ou d\'aménagements importants ou bien de modifications apportées aux équipements et ceux liés aux nouvelles technologies. 
("13","13","Le médecin de prévention doit être destinataire des Fiches de Données de Sécurité (FDS) des produits dangereux.
("14","14","Informer le médecin de prévention dans les plus brefs délais de chaque accident de service et de chaque maladie professionnelle ou à caractère professionnel.
("15","15","Mettre en place une procédure d’information du médecin de prévention.
("17","16","Les collectivités qui ne disposent pas de service médecine préventive et qui ont conventionné avec celui du CDG87, peuvent s’adresser au CDG et faire la demande d’une copie du rapport annuel d’activités réalisé par le service SST du CDG sur leur périmètre.",null),
("18","17","Dès qu’une collectivité ou un établissement public franchit le seuil de 50 agents, il a l’obligation de créer un CHSCT.
("20","18","S’assurer qu’à la suite des dernières élections professionnelles, les membres de l’instance CHSCT vont suivre la formation réglementaire.
("22","19","Établir un programme annuel de prévention. 
("23","20","Mettre en place l’organisation d’une délégation d’enquête en partenariat avec le CHSCT à la suite de chaque accident selon les critères de gravité et de répétitivité préétablis (art. 41 du décret 85-603 du 10 juin 1985) ;
("24","21","Le CHSCT doit obligatoirement être consulté dans les domaines suivants :
("25","22","Réunir le comité au moins 3 fois par an sans dépasser 9 mois entre deux réunions.
("26","23","Établir un règlement intérieur .
("27","24","Établir après chaque réunion un procès-verbal comprenant le compte rendu des débats et le détail des votes.",null),
("28","25","Informer le comité des visites et des observations faites par l’ACFI.",null),
("29","26","Désigner un ACFI ou passer convention avec le Centre de Gestion.",null),
("30","27","Rédiger une convention et une lettre de mission.",null),
("31","28","Consulter l’ACFI sur la teneur de tous documents se rattachant à sa mission, et notamment des règlements et des consignes que l’autorité territoriale envisage d’adopter en matière d’hygiène, de sécurité et de conditions de travail.",null),
("32","29","Faire contrôler les conditions d’application des règles d’hygiène et de sécurité par l’ACFI afin qu’il propose à l’autorité territoriale compétente toute mesure qui leur paraît de nature à améliorer l’hygiène et la sécurité du travail et la prévention des risques professionnels.",null),
("33","30","Informer l’ACFI des suites données à ses propositions.",null),
("34","31","Initier une démarche d\'évaluation des risques professionnels et la rédaction du document unique.
("35","32","Initier une mise à jour du document unique.
("36","33","Élaborer et afficher à l’attention des personnels une note indiquant les modalités d’accès au document unique.
("37","34","Présenter le plan d\'action du document unique aux membres du comité afin d\'indiquer les axes pouvant s\'inscrire dans le programme annuel de prévention.
("38","35","Initier un diagnostic des Risques Psycho-Sociaux.
("39","36","Ce registre doit être ouvert et mis à disposition de tous les agents, de l’ACFI mais également des usagers ; un document type est téléchargeable sur le site du CDG87 rubrique Santé et Sécurité au Travail RUSST/chapitre 3.1 ou sur le site de la CNRACL à l’adresse:
("40","37","Ce registre doit être ouvert sous la responsabilité de l’Autorité Territoriale et mis à disposition du CT/CHSCT et des agents intervenus dans la procédure; un document type est téléchargeable sur le site du CDG87 rubrique Santé et Sécurité au Travail  rubrique Santé et Sécurité au Travail RUSST/chapitre 3.2 ou sur le site de la CNRACL à l’adresse:
("41","38","Ce régistre doit être ouvert et tenu à jour des différents contrôles périodiques;  un document type est téléchargeable sur le site du CDG87 rubrique Santé et Sécurité au Travail  rubrique Santé et Sécurité au Travail RUSST/chapitre 4.1 ou sur le site de la CNRACL à l’adresse:
("42","39","S’assurer que chaque bâtiment considéré comme ERP dispose de son registre de sécurité incendie et que sa mise à jour est effective.
("43","40","En s’appuyant sur l’évaluation des risques, l’Autorité territoriale assistée de son AP peuvent se rapprocher du Médecin de Prévention pour élaborer cette fiche .
("44","41","Après la réalisation de l’évaluation des risques, l’Autorité territoriale assistée de son AP doivent élaborer ces fiches .
("45","42","S’assurer que les agents disposent bien des autorisations de conduite signées par l’autorité territoriale.
("46","43","S’assurer que la collectivité dispose du dossier contenant les résultats des contrôles effectués et les mesures prises pour l’ensemble des installations de la collectivité; à défaut prévoir la réalisation d’un diagnostic.
("47","44","S’assurer que seuls les agents disposants de l’habilitation électrique, à jour de recyclage, interviennent sur les ouvrages électriques ou à proximité.
("48","45","INVENTAIRE:
("49","46","Etablir les notices de poste.
("50","47","La Déclaration d’Intention de Commencement de Travaux (DICT), a pour objet d’indiquer aux exploitants de réseaux la localisation précise des travaux projetés et les techniques de travaux qui seront employées.
("51","48","S’assurer que toutes les installations de ventilation mécanique sont recensées et contrôlées.
("52","49","S’assurer que le suivi des opérations de contrôle est tracé et à jour.
("53","50","S’assurer de la mise à jour  de la liste des équipements et engins de levage à contrôler.
("54","51","Recenser toutes les installations entrant dans le champ de ces vérifications périodiques et consigner la réalisation des différents contrôles dans le registre de sécurité.",null),
("55","52","ÉCHAFAUDAGE:
("56","53","Les installations électriques pour l’ensemble des bâtiments (mairie, groupes scolaires, ateliers municipaux, salle polyvalente...etc), doivent être vérifiées lors de leur mise en service ou après avoir subi une modification de structure par un organisme agréé, puis périodiquement par une personne qualifiée ou société compétente.
("57","54","Vérifier les caractéristiques du compresseur afin d’intégrer cet équipement à la liste des vérifications périodiques. Faire procéder à son contrôle par un organisme agréé tous les 40 mois.
("58","55","Certains équipements nécessitent une vérification obligatoire annuelle. Le résultat de ces vérifications doit être consigné dans le registre unique de sécurité.
("59","56","Vérifier qu’aucun équipement de travail  mis en service avant le 01/01/93 n’est utilisé auquel cas s’assurer qu’ils répondent aux prescriptions techniques du CT et à défaut réaliser un plan de mise en conformité en précisant la nature des travaux à réaliser, la date de réalisation prévue.",null),
("60","57","EXTINCTEURS:
("61","58","PTAC>3,5T:
("62","59","Mettre en place la périodicité des contrôles de ces installations et tracer leurs résultats dans le registre de sécurité. S’assurer qu’aucun portail de la collectivité n’entre pas dans la catégorie des automatiques ou semi-automatiques, auquel cas, il doit  être contrôlé semestriellement par un technicien qualifié ou entreprise extérieure spécialisée  conformément à l’arrêté du 21 décembre 1993.
("63","60","Initier une vérification périodique du ou des réservoirs enterrés.
("64","61","S’assurer que les vérifications périodiques ont été effectuées et que les remarques éventuelles ont été levées.",null),
("65","62","Initier une formation à la sécurité pour tout nouvel entrant.
("66","63","Le plan de formation traduit la politique de formation de la collectivité dans un document formalisé qui prévoit, pour une durée déterminée,
("67","64","Prévoir de former le personnel à la manipulation des extincteurs.
("68","65","Au sein de la Fonction publique territoriale, les services concernés par cette formation sont en priorité les services techniques et la restauration collective où les risques d’accidents de service sont importants,il peut être judicieux également de former les agents des services en contact direct avec du public (ATSEM, mairie, équipements sportifs, etc.).
("69","66","Mettre en place des formations ou de l’information sur les risques spécifiques aux différentes activités.
("70","67","TONDEUSE AUTOPORTEE:
("71","68","Initier des formations AIPR.
("72","69","CERTIPHYTO:
("73","70","Un stage du CNFPT permet de répondre à cette obligation, il s’agit de la formation.« Débroussaillage, abattage, tronçonnage ». Sont notamment abordés dans cette formation :
("74","71","Les agents susceptibles d’intervenir sur de l’amiante doivent suivre une formation d’une durée minimale de 2 jours (formation obligatoirement suivie par tout travailleur préalablement à sa première intervention susceptible de l’exposer à l’amiante).
("75","72","Tous les lieux de travail, y compris les véhicules, doivent être équipés d’un matériel de premiers secours destiné à prodiguer les premiers soins en cas d’accident.
("77","74","LOCAUX:
("79","76","Afin de s’assurer que les agents travaillant seuls soient à même de pouvoir alerter leur responsable hiérarchique et les secours dans tous les cas :
("80","77","Le poste de travail ainsi que les locaux sanitaires et de restauration que les travailleurs handicapés sont susceptibles d\'utiliser dans l\'établissement doivent être aménagés de telle sorte que ces travailleurs puissent y accéder aisément.",null),
("81","78","Lors de l’évaluation des risques, s’assurer que pour toutes les activités des agents qui le nécessitent, des EPI (comme harnais, longe. contre les chutes de hauteur, gants, lunettes, casques antibruit, chaussures de sécurité) sont bien mis à disposition.
("82","79","Les obligations en matière d’utilisation, de port et de vérifications des EPI découlent de consignes (ou du règlement intérieur si il existe) à l’intérieur desquelles elles doivent être mentionnées.
("83","80","L’autorité territoriale doit :
("84","81","Prévoir la mise en place d’un support de  formation/ communication/ information  pour les agents.
("85","82","L’employeur élabore une consigne d’utilisation au poste de travail. Elle indique qu’avant chaque utilisation le travailleur doit procéder à un contrôle du bon état de ses EPI.
("86","83","Interdire aux jeunes de 15 à 18 ans d’effectuer les travaux interdits (Le mineur ne peut être affecté qu’à des travaux légers qui ne sont pas susceptibles de porter préjudice à sa sécurité, à sa santé ou à son développement).",null),
("87","84","Seuls les le ou les jeunes travailleurs âgés de 15 à
("88","85","S’assurer que les mesures dérogatoires sont prises..",null),
("89","86","Prendre  une délibération de dérogation.",null),
("90","87","Transmettre la délibération pour information au Comité D’hygiène de Sécurité et des Conditions de Travail (CHSCT).
("91","88","Renouveler la délibération tous les 3 ans.",null),
("92","89","Lors de travaux sous-traités, il est nécessaire de définir les mesures de prévention à appliquer avec l’entreprise et il est souhaitable que ces mesures  soient formalisées dans un document écrit (Plan de Prévention).
("93","90","Dans le cas de livraisons récurrentes de fournisseurs (exemples: livraisons quotidiennes au restaurant scolaire, au magasin...), formaliser les mesures de prévention à mettre en œuvre pour ces opérations sur un document écrit appelé \"protocole sécurité chargement/déchargement\".
("94","91","Prévoir, à l’occasion de tous chantiers importants impliquant de la coactivité , de mettre en place une coordination SPS.
("95","92","Mettre en place une procédure d’élaboration d’un permis de feu pour les interventions d’entreprises extérieures lors de travaux par point chaud et s’assurer qu’elle a bien été réalisée.
("96","93","La signalisation est un outil primordial pour la prise en compte des dangers par les travailleurs car elle donne une indication sécurité et santé. Elle est présente pour compléter les mesures de prévention et de protection mise en place par l’employeur.",null),
("97","93","Une évaluation des risques doit être réalisée afin de déterminer les risques présents sur les installations de travail, et ne pouvant être évités par quelconque moyen. La signalisation de sécurité à mettre en place (choix, nombre, emplacement) sera en fonction de l’importance de ces risques, des dangers ou de la zone à couvrir.",null),
("98","94","Les locaux de travail et leurs annexes doivent être régulièrement entretenus et nettoyés; exempts de tout encombrement pour laisser le passage libre aux déplacements des agents .",null),
("99","94","L’aménagement des locaux techniques influe directement sur les conditions de travail. En effet, quand un atelier ne permet pas de ranger les différents équipements, matériels et outils, il est alors difficile de trouver les bonnes pratiques et de faire respecter les consignes d’hygiène et de sécurité. ",null),
("100","95","Mettre à disposition de l’eau potable et fraiche.
("101","96","INTERDICTION:
("102","96","AFFICHAGE:
("103","97","ARMOIRES:
("104","97","VESTIAIRES:
("106","97","LAVABOS:
INSERT INTO preconisation VALUES
("107","98","Dans les établissements où sont effectués certains travaux
("108","99","Mettre à disposition un local de restauration pourvu de sièges et de tables en nombre suffisant et qui comporte un robinet d’eau potable, fraîche et chaude, pour dix usagers, doté d’un moyen de conservation ou de réfrigération des aliments et des boissons et d’une installation permettant de réchauffer les plats.",null),
("110","100","CABINET D\'AISANCE:
("111","100","ENTRETIEN:
("112","100","SÉPARATION:
("113","101","Mettre de l’eau potable et fraîche à disposition.
("114","102","Mettre à disposition un local de repos.
("115","103","CHAUFFAGE:
("118","104","ECLAIRAGE:
("119","105","Installer une ventilation mécanique ou permettre une ventilation naturelle permanente des locaux à pollution non spécifique.
("120","106","S\'assurer que tous les locaux et les véhicules disposent d\'une trousse de premiers secours.
("121","107","Prévoir la mise en place de cet affichage sur les sites non encore équipés.
("122","108","TRAVAIL ISOLE:
("123","108","ASTREINTE:
("124","109","Lors de l’évaluation des risques lié au travail isolé, mettre en oeuvre des moyens d’alerte dans le cadre d’une procédure de déclenchement et d’organisation des secours:
("126","109","SYSTEME D.A.T.I:
("128","110","Déterminer une procédure d’urgence.
("129","111","Calculer l’effectif théorique des personnes susceptibles d’être présentes à prendre en compte pour la prévention des incendies et de l’évacuation.
("130","112","Lever les remarques faites par la commission de sécurité.
("131","113","NOMBRE:
("132","113","SIGNALISATION:
("133","113","ENGINS:
("134","113","ACCESSIBILITÉ:
("135","114","Organiser au moins tous les 6 mois des exercices au cours desquels les travailleurs apprennent à reconnaître les caractéristiques du signal sonore d’alarme générale, à se servir des moyens de premier secours et à exécuter les diverses manœuvres nécessaires.
("136","115","Les locaux présentant des risques d’incendie du fait du stockage et de la manipulation de produits inflammables doivent comprendre :
("137","116","Installer des dispositifs de désenfumage dans les zones qui le nécessitent.",null),
("138","117","Mettre en place une consigne incendie
("139","118","AFFICHAGE:
("140","119","Dégager les issues d’évacuation.
("141","120","OUVERTURE:
("142","121","L’escalier doit être équipé de rampes sur le côté. Il doit avoir une pente permettant un accès en toute sécurité et les marches doivent respecter les caractéristiques réglementaires.
("143","122","Les établissements recevant plus de 50 personnes simultanément, et ceux, quelle que soit leur importance, où sont manipulées et mises en œuvre des matières inflammables doivent être équipés d’un système d’alarme sonore.
("144","123","Réparer les BAES en dysfonctionnement.
("145","124","L’évaluation des risques a pour but d’identifier les situations propices au risque de chutes de plain-pied, de manière à définir des actions de prévention permettant de traiter au mieux les causes et contextes favorables à la survenue des accidents.
("146","125","Si présence d\'une fosse de visite:
("147","126","Il existe deux moyens de protéger les salariés des risques de glissades :
("148","127","Ranger et/ou nettoyer la zone.
("149","128","Intégrer au document unique, l\'évaluation des risques liés aux chutes de hauteur.",null),
("150","129","MAIN COURANTE:
("151","129","CONCEPTION:
("154","130","Installer des garde-corps.
("156","131","FORMATION CONDUITE:
("157","131","FORMATION E.P.I:
("158","131","E.P.I:
("160","132","VÉRIFICATION PÉRIODIQUE
("161","132","MISE A DISPOSITION
("163","133","FORMATION/NOTICE:
("165","134","ETAT:
("167","134","UTILISATION ECHELLE:
("168","135","Faire un inventaire des manutentions manuelles et initier un plan d’action.
("169","136","Prévoir des moyens mécaniques (équipements de manutention et / ou levage) adaptés et en nombre suffisant.
("170","136","RESTAURATION:
("171","137","Former les agents sur les gestes et postures à adopter pour accomplir en sécurité les manutentions manuelles.
("172","138","Organiser le poste de travail afin de supprimer ou de diminuer les manutentions.
("173","139","Dès lors que l’engin est présent sur les voies ouvertes à la circulation publique, le Code de la Route s’applique dans son entier.
("176","140","Le dispositif FIMO / FCO s\'applique à l’exception des conducteurs : (entre autres)
("177","141","Mettre en place ou compléter la signalisation des zones de danger.
("178","142","MISE A DISPOSITION:
("181","143","SIGNALISATION VÉHICULES/ENGINS:
("184","144","STOCK:
("185","144","FIN DE PRESCRIPTION:
("186","145","Les agents doivent être informés des risques qu’ils encourent lors de travaux sur la voie publique. De plus, afin d’éviter les mauvais positionnements de panneaux il convient de former un nombre judicieux d’agents à la signalisation de chantier. (formations CNFPT inscrites au catalogue)
("188","146","Voir la possibilité d’installer une séparation entre la cabine et la cargaison
("189","147","Réaliser un plan d’arrimage
("191","148","Le véhicule doit être adapté à son utilisation (dimension, capacité, puissance…) , de la carrosserie appropriée, munie des points d’arrimage et des équipements spécifiques qui sont nécessaires pour transporter le chargement en toute sécurité.",null),
("193","150","Acquérir des matériels conformes,
("194","151","Effectuer la vérification et l’entretien necessaire à la machine contrôlée",null),
("195","152","Acquérir des matériels conformes,
("196","153","Mettre à disposition des travailleurs les notices d’instruction
("197","154","L’information concernant les travailleurs chargés de la mise en œuvre ou de la maintenance des équipements de travail doit porter sur les points suivants :
("198","154","Les vérifications périodiques ne se substituent pas à l’obligation d’effectuer les opérations de maintenance définies par le fabricant de la machine. Il est d’ailleurs fortement recommandé d’enregistrer les opérations de maintenance des machines dans un carnet de maintenance.",null),
("199","155","Maintenir en état de conformité tous les équipements de travail",null),
("200","156","Maintenir l’engin en conformité avec la règlementation",null),
("201","157","SIGNALISATION COMPLÉMENTAIRE:
("202","158","Effectuer la VGP des engins qui le nécessitent
("203","159","Faire contrôler le pulvérisateur.
("204","160","Former le ou les agents à la conduite en sécurité de la tondeuse autoportée.
("205","161","Équiper la ou les tondeuses autoportées d\'un gyrophare pour les déplacements sur voie publique.
("206","162","Equiper la tondeuse auto-portée d’une structure anti-retournement",null),
("207","163","Deux cas de figures sont possibles en fonction des caractéristiques établies par le constructeur :
("208","164","S\'assurer, auprès du service des mines de la DREAL,  que l\'Engin de Service Hivernal (ESH) nécessite bien le besoin d\'être réceptionné et contrôlé.
("209","165","Les engins de service hivernal étant des véhicules à progression lente, ils doivent être équipés d’un dispositif lumineux d’identification à faisceau stationnaire et clignotant, placé à l’avant du véhicule, en partie supérieure.
("210","166","Former le ou les agents à la conduite en sécurité de l’ESH et de son équipement",null),
("211","166","Autoriser la conduite de l’ESH aux personnes qui disposent du permis correspondant au type de véhicule.",null),
("212","167","S\'assurer de la conformité de la lame de déneigement.",null),
("213","167","Fiche de constitution d’un dossier de réception à titre isolé de véhicule en application du code de la route.
("214","168","La prise en compte du risque chimique passe par l’inventaire des produits chimiques et des nuisances (en identifiant leurs dangers), leur évaluation au poste de travail et la mise en place de mesures de prévention adaptées au risque évalué.
("215","169","Initier une formation des agents appropriée, sur les agents chimiques dangereux se trouvant sur le lieu de travail intégrant notamment les noms, les risques pour la santé et la sécurité qu’ils comportent .
("217","170","PRÉSENCE:
("220","171","Lister les agents exposés aux produits phytosanitaires, à certaines peintures classées CMR et aux poussières de bois.
("221","172","Initier une démarche de substitution des produits les plus dangereux.
("222","173","Mettre à disposition des agents des notices de poste (consignes techniques d\'utilisation des produits). 
("223","174","Mettre en place un dispositif de captage des poluants.
("224","174","Revoir l’efficacité du dispositif de captage des poluants.
("225","175","S’assurer que des équipements de protection contre les projections (lunettes, masque), manipulations (gants, blouses, tabliers..) sont à disposition des agents et sont portés.",null),
("226","175","Pour l’utilisation des produits phytosanitaires ou de certaines peintures, s’assurer que les agents portent les EPI adaptés dès la préparation du traitement, durant le traitement et jusqu’au rinçage du matériel.",null),
("227","176","LOCAL:
("228","177","Établir la liste des activités d’ordre électrique (en priorité les activités visées par la 2ème catégorie de personnel) et la liste des personnes qui les réalisent, définir les formations nécessaires en fonction des activités réalisées.",null),
("229","178","S\'assurer que seuls les agents disposants de l\'habilitation électrique , à jour de recyclage, interviennent sur les ouvrages électriques.
("230","179","VÉRIFICATION:
INSERT INTO preconisation VALUES
("231","180","Les locaux ou emplacements présentant un risque de choc électrique doivent être délimités aux moyens d’obstacles et signalés au moyen d’un panneau d’avertissement réglementaire du danger électrique. L’accès à ces locaux ou emplacements est réservé aux personnes habilitées.",null),
("232","181","EVALUATION RISQUE BRUIT:
("233","182","MISE A DISPOSITION:
("234","183"," FORMATION:
("235","184","SUIVI MEDICAL:
("236","185","MESURES:
("237","186","EVALUATION DES RISQUES:
("238","187","PREVENTION:
("239","188","SURVEILLANCE MEDICALE:
("240","188","SURVEILLANCE MEDICALE:
("241","189","INSTRUCTION:
("242","190","Les effets nocifs dépendent des propriétés physiques des vibrations (fréquence et amplitude), de la durée d’exposition, de la posture, des efforts exercés par l’opérateur, du froid et de l’humidité, ainsi que du mode de transmission au corps. Les affections vasculaires, neurologiques et ostéoarticulaires liées à l’exposition aux vibrations sont reconnues comme maladies professionnelles au titre des tableaux n°69 du régime général de la Sécurité Sociale. De même que les lombalgies liées à l’exposition aux vibrations (tableau 97).
("243","191","ÉVALUATION/MESURE D\'EXPOSITION
("244","192","INFORMATION MÉDECIN DE PRÉVENTION:
("245","193","IMPLANTATION
("246","194","L\'éclairage des locaux de travail doit permettre de :
("247","195","BUREAU/SIÈGE/REPOSE-PIEDS
("248","196","Pour la prévention de la fatigue visuelle, il convient d’agir notamment sur l’organisation du travail, l’affichage à l’écran et l’implantation des postes.  
("249","196","Pour la vision, quitter l’écran des yeux pour regarder au loin de temps en temps (environ toutes les 20 minutes) constitue une pause visuelle qui permet de relâcher l’accommodation.",null),
("250","197","Les règles d’aménagement des bureaux prennent en compte de nombreux critères comme l’éclairage, la largeur des voies de circulation, la hauteur sous plafond, les couleurs utilisées, les nuisances sonores…
("251","198","S’assurer qu’il n’existe pas de livraisons récurrentes de fournisseurs intervenants sur l’emprise de la collectivité (exemples: livraisons quotidiennes au restaurant scolaire); auquel cas formaliser les mesures de prévention à mettre en œuvre pour ces opérations sur un document écrit appelé \"protocole sécurité (chargement/déchargement\".
("252","199","Lors de travaux sous-traités, il est nécessaire de définir les mesures de prévention à appliquer avec l’entreprise et il est souhaitable que ces mesures  soient formalisées dans un document écrit (Plan de Prévention).
("253","200","La réglementation encadre très clairement l’exposition à ces risques et impose à l’autorité territoriale de mettre en place des mesures de prévention.
("254","201","Les travaux d’inhumation et d’exhumation en cimetière exposent les agents à de nombreuses nuisances tant chimiques, bactériologiques, physiques que psychologiques qui demeurent mal connues car peu étudiées à ce jour.
("255","202","Afin de faciliter les interventions de secours en cas d’accident du travail, des moyens d’alerte doivent être disponibles pour les agents travaillant seuls  (téléphone, talkie-walkie, Système homme mort, dispositif DATI…)
("256","203","Les agents qui exécutent la prestation funéraire doivent posséder une attestation de formation professionnelle ou douze mois d’expérience professionnelle et un certificat d’aptitude physique de la médecine du travail. Pour les chauffeurs, un permis de conduire ainsi qu’une autorisation de conduire adaptés au type de véhicule sont nécessaires.",null),
("258","205","La réduction des risques professionnels repose sur plusieurs niveaux d’actions :
("259","206","Installer des garde-corps réglementaires.
("260","207","Afin de faciliter les interventions de secours en cas d’accident du travail, des moyens d’alerte doivent être disponibles pour les agents travaillant seuls  (téléphone, talkie-walkie, Système homme mort, dispositif DATI…)
("261","208","Choisir le matériel en fonction de la nature des travaux à réaliser, de l’intensité d’utilisation, prendre en compte l’ergonomie (poignée anti-vibratile, poids, taille) de l’outil. 
("262","209","MEULAGE:
("263","210","L\'outil le plus approprié pour prendre en compte la notion de travailleur isolé reste l’évaluation des risques.
("264","211","Les fumées de soudage sont nocives et doivent donc être captées à leur source d’émission
("265","212","Initier des formations Certiphyto.
("266","213","Stocker les EPI dans une armoire ou un local différent de celui servant au stockage des produits.
("267","214","Assurer une tracabilité de l’utilisation des produits phytosanitaires par la mise en place d’un registre des traitements à tenir à jour avec dates, lieux, types de produits, doses…",null),
("268","215","Les produits phytosanitaires doivent être stockés de façon groupée et distincte des produits d’autres natures, dans un lieu spécifique et sous clef.
("269","216","Voici la liste des principales formations professionnelles souvent nécessaires, qui peuvent être proposées à ces agents (essentiellement par le CNFPT) : - Formation aux notions de base en hygiène alimentaire (tenue réglementaire, protocole de lavage des mains, plan de nettoyage et de désinfection des locaux et du matériel…),   - Formation  à l’application de la méthode HACCP (méthodologie et moyens d’évaluation de la méthode,…), - Formation sur les bases de l’équilibre alimentaire, la gestion des allergies, la conception des menus,…, - Formation aux gestes et postures de sécurité dans le travail, - Formation à la conduite à tenir en cas d’urgence (secourisme, incendie,…), - Sensibilisation au risque chimique (règles de manipulation, de stockage), - Formation au risque électrique (ex : obtention de l’habilitation électrique H0B0 pour les agents ayant à changer une ampoule ou un tube fluorescent ou effectuant des travaux de nettoyage à proximité d’une installation électrique non protégée",null),
("270","217","L’HACCP (« Hazard Analysis Critical Control Point » ou analyse des dangers et des points critiques pour leur maîtrise) est une méthode d’assurance qualité permettant de garantir la sécurité alimentaire et l’hygiène des denrées. 
("271","218","Les plans de travail (légumerie, tables de préparation ou de dressage, plans de cuisson et laverie) doivent se situer à une hauteur convenable afin de prévenir les mauvaises postures (85 cm recommandé). La profondeur des bacs ne doit pas être trop excessive. L’ensemble de ces équipements doit être facile à nettoyer. Les espaces entre chaque poste de travail doivent être suffisants afin de faciliter les déplacements et notamment le passage des chariots.",null),
("272","219","Suggérer les formations continues suivantes :
("273","220","Il n’est pas interdit de laisser un agent travailler seul pour une activité telle que le nettoyage des locaux qui n’expose pas l’agent à des risques très importants. Cependant, tout agent dont le poste de travail est isolé doit faire l\'objet d\'une surveillance directe ou indirecte de jour comme de nuit. La collectivité doit, par exemple, s’assurer que l’agent a quitté les locaux de travail dans un bon état de santé.
("274","221","Initier des formations PRAP, manipulation des extincteurs et des formations à l’utilisation et à l’entretien des différentes machines à bois.
("275","222","Pour les machines portatives, il convient de généraliser le captage localisé des poussières à la source en utilisant par exemple un outillage muni d’un système d’aspiration intégré et s’organiser pour isoler les matériels et postes de travail qui ne pourraient être raccordés au réseau d’aspiration.
("276","223","L’Autorité Territoriale doit établir et tenir à jour un dossier de l’installation de dépoussiérage. Ce dossier d’installation permet le suivi et le contrôle régulier et est destiné à consigner le respect de la valeur limite d’exposition (fixée à 1mg/m3), vérifié au moins une fois par an par un organisme agréé. Les poussières de bois sont nocives par inhalation et par contact cutané pour tous les bois, mais plus ou moins selon les variétés d’essences de bois (feuillus, conifères, exotiques) et les produits chimiques éventuellement associés (dont le formaldéhyde). Elles sont responsables d’atteintes des voies respiratoires et cutanées et de cancers de l’ethmoïde et des sinus de la face (qui, même s’ils sont rares et d’apparition tardive, ont été longtemps sous-estimés).
("277","224","Mettre en accessibilité les locaux de travail concernant le ou les travailleurs handicapés.
("278","225","S’assurer que l’entretien et les vérifications sont effectuées et les inscrire sur le registre incendie.",null),
("279","226","S’assurer que la vérification des aires de jeux est bien effectuée et que les remarques ou non conformités sont levées.",null),
("280","227","AMIANTE:
("282","227","RADON:
("287","229","DIAGNOSTIC RADON:
("291","230","Initier un contrôle des arbres à cardan.
("292","53","SUIVI:
("294","73","En matière d’hygiène et de sécurité, les affichages concernent :
("295","232","Fournir aux agents des équipements de protection individuelle (gants, chaussures de sécurité, …) 
("296","130","La réglementation actuelle indique que les travaux temporaires en hauteur doivent être réalisés à partir d’un plan de travail conçu, installé ou équipé de manière à préserver la santé et la sécurité des travailleurs. Le poste de travail est tel qu’il permet l’exécution des travaux dans des conditions ergonomiques.
("298","110","La survenance d\'un accident du travail, d\'une détresse médicale ou d\'un état pathologique dans la structure nécessite la mise en place de moyens efficaces destinés à prendre en charge le plus rapidement possible la victime. L\'organisation des secours passe par la mise en oeuvre de moyens humains, la formalisation de la conduite à tenir en cas d\'urgence ou d\'accident, un dispositif d\'alerte efficace et la mise à disposition de moyens de secours adaptés dans la structure.",null),
("299","115","Le stockage de produits inflammables dans les armoires de sécurité coupe- feu minimise le risque d\'incendie et protège les produits à l\'intérieur de l\'armoire en cas d\'incendie dans le bâtiment.",null),
("300","115","Les locaux doivent être conçus de manière à limiter la propagation de l’incendie à l’intérieur des bâtiments. Art.R4216-1 à 34 du CdT.
("301","123","Cet éclairage doit être installé dans les dégagements et dans tous les locaux sauf si ceux-ci réunissent les trois conditions ci-après :
("302","125","- L’accès à la fosse doit pouvoir s’effectuer par les deux extrémités : un accès principal à l’aide d’un escalier et un accès de secours pouvant être réalisé par escalier ou à défaut une échelle métallique fixe donnant les mêmes garanties.
("303","129","DÉGAGEMENT:
("304","129","ACCÈS:
("305","134","ECHELLE FIXE>3M:
("306","134","ACCÈS:
("307","132","FORMATION:
("308","133","VÉRIFICATION PÉRIODIQUE
("310","233","ETAT:
("311","131","NOMBRE D\'AGENTS:
("313","143","OUTILS PORTES/TRACTES:
("314","168","Examiner si l’exposition est possible par voie aérienne (inhalation de poussières ou de gouttelettes contaminées), par pénétration à travers la peau et les muqueuses, par contact avec la peau ou les muqueuses, par inoculation accidentelle (microblessure, piqûre, coupure…), ou par voie digestive (en portant les mains ou un objet contaminé à la bouche).
("315","182","ETAT:
("316","181","EVALUATION RISQUE BRUIT:
("317","234","Veiller à ce que les agents disposent des EPI et des vêtements de travail requis et que ceux-ci soient en bon état : 
("318","235","Concevoir et aménager les locaux de manière à limiter les risques de chutes : dispositifs antidérapants sur le sol, bouée de secours à
("319","236","-Mise en place de prélèvements d’atmosphère (tube cassette).
("320","234","Les EPI et les vêtements de travail nécessaires à la manipulation des produits chimiques (cf. la fiche de donnée de sécurité du produit manipulé) : 
("321","220","L’employeur se doit d’analyser les situations de travail isolé et leurs conséquences éventuelles dans le cadre de son évaluation des risques. Il lui appartient de prendre les mesures de prévention et d’organisation des secours à mettre en œuvre.
("322","193","AMÉNAGEMENT
("323","194","Dans la circulaire du 11 avril 1984, nous pouvons lire : 
("324","194","Les exigences de sécurité et de confort de l\'éclairage en milieu de travail ont pris une importance grandissante. 
("325","195","CLAVIER/SOURIS/ECRAN
("326","237","Les lieux de travail intérieurs doivent être aménagés de telle façon que les piétons puissent circuler de manière sûre. 
("327","236","Les actions correctives passent par des mesures techniques de captage des polluants à la source, de ventilation et d’assainissement de l’air, d’élimination et de dégradation de la trichloramine comme par la mise en place de système de strippage associé à un procédé de dégradation de la trichloramine breveté par l’INRS PROPHETE.
("328","236","Lutter contre les effets de la trichloramine s’inscrit dans une approche générale des principes de prévention liés au risque chimique. Dès lors que des salariés sont exposés à des risques chimiques, l’employeur est tenu :
("330","204","Le Code général des collectivités territoriales réglemente la réalisation des activités d’inhumation et d’exhumation. Pour l’exercice de ces missions, il impose à la commune d’être habilitée par la préfecture.
("331","186","EVALUATION DES RISQUES:
("332","187","SUBSTITUTION:
("333","192","SUIVI MÉDICAL:
("334","191","MOYENS DE RÉDUCTION:
("336","191","Lorsqu\'en dépit de ces mesures, les valeurs limites d\'exposition ont été dépassées, l\'employeur prend immédiatement des mesures pour ramener l\'exposition au-dessous de celles-ci, détermine les causes du dépassement et adapte les mesures de protection et de prévention en vue d\'éviter un nouveau dépassement.",null),
("337","144","ETAT:
("338","103","VÊTEMENTS:
("339","104","VALEURS MINIMALES D\'ECLAIREMENT:
("340","104","PROTECTION LUMINEUSE:
("341","188","LISTE AGENTS EXPOSES:
("342","229","PREVENTION:
("343","229","SUIVI MEDICAL:
("344","117","Les consignes incendie doivent indiquer:
("345","118","MISE A JOUR:
INSERT INTO preconisation VALUES
("346","233","UTILISATION ESCABEAU:
("347","133","ETAT GÉNÉRAL:
("348","137","Les formations Prévention des Risques liés à l’Activité Physique. (P.R.A.P) répondent à cette obligation de formation, abordant à la fois les gestes et postures à adopter lors de manutentions, mais aussi l’analyse ergonomique du poste de travail.",null),
("349","136","TECHNIQUE:
("350","142","PORT OBLIGATOIRE:
("352","239","Une formation adéquate du conducteur est nécessaire pour la conduite de tous les engins, Elle est à compléter et réactualiser chaque fois que le besoin se fait ressentir.
("353","157","GYROPHARE:
("354","157","TRI FLASH:
("363","240","ACCESSIBILITE:
("365","176","ARMOIRE:
("366","176","COMPATIBILITÉ:
("367","185","SIGNALISATION:
("368","161","Remettre en conformité le ou les éclairages défaillants.
("369","164","Fiche de constitution d\'un dossier de réception à titre isolé de véhicule en application du code de la route.
("370","241","Faire former le ou les agents à la mise en oeuvre des articles pyrotechniques, sinon, utiliser les
("371","242","Un titre d\'habilitation doit faire suite à la formation obligatoire.
("372","243","STOCKAGE:
("373","170","INVENTAIRE:
("374","142","ETAT:
("375","179","SUIVI:
("376","182","PORT:
("377","4","FORMATION CONTINUE:
("378","9","FORMATION CONTINUE:
("379","45","FDS:
("381","244","Le triangle de pré signalisation doit se trouver à bord du véhicule.
("382","58","PTAC<3,5T:
("383","57","ALARME INCENDIE:
("384","52","ÉCHELLES/ESCABEAUX:
("385","67","CACES:
("386","69","CERTIBIOCIDE:
("387","72","CONTENU:
("388","74","VEHICULES:
("389","75","Recenser les principales activités dangereuses réalisées, l’outil le plus approprié pour prendre en compte la notion de travailleur isolé reste l’évaluation des risques.
("390","76","ASTREINTE:
("393","227","LÉGIONELLOSE:
("394","245","Le port des EPI suivants peut être rendu obligatoire en fonction des résultats de l’évaluation des risques professionnels : - Les vêtements de travail : blouse propre, légère, claire et solide (supportant les lavages) .   Les gants : 4 sortes de gants peuvent être utilisés selon le cas [* Les gants en maille métallique pour diminuer la gravité des coupures notamment lors de la découpe de la viande (norme CE-EN 1082-1), * Les gants souples pour la manipulation des denrées,  imperméables aux bactéries et jetables (en nitrile ou en latex), * Les gants de protection thermique pour l’usage du matériel et des installations de cuisson (four,…),* Les gants de protection contre les produits chimiques ], - Les chaussures ou sabots de sécurité : résistants et antidérapants  (normes CE-EN 345 ou 346), ) La coiffe : enveloppant l’ensemble de la chevelure, - Le masque bucco-nasal : son usage peut être nécessaire afin d’éviter la contamination des aliments ",null),
("395","75","ASTREINTE:
("397","247","Intégrer au document unique, l\'évaluation des risques liés aux chutes d\'objets et effondrements en s\'appuyant par exemple sur les recommandations de la CNAMTS",null),
("398","248","ECHELLE FIXE>3M:
("399","243","SIGNALISATION:
("400","249","PNEUMATIQUES:
("401","209","SOUDAGE:
("402","250","PRÉSENCE:
("403","250","POSITIONNEMENT:
("404","251","MISE A DISPOSITION:
("405","251","PORT:
("406","251","ETAT:
("407","249","ECLAIRAGE:
("410","175","S’assurer que des équipements de protection (lunettes, masque, gants, combinaison, tabliers...),   ne sont en aucun cas stockés dans le même endroit que les produits.",null),
("412","253","Aucune boisson alcoolisée autre que le vin, la bière, le cidre et le poiré n\'est autorisé sur le lieu de travil.
("413","254","Mette en place une démarche de prévention s\'appuyant sur une sensibilisation /information des agents",null),
("414","253","Si la structure est soumise à un règlement intérieur, il est important que celui-ci rappelle les obligations et interdictions en matière de risque alcool.",null),
("415","254","L\'Autorité territoriale affirme et affiche une politique de prévention et de gestion du risque alcool claire en fixant les limités, en les rappelant régulièrement , en intervenant de manière graduée et en disposant de procédures permettant de gérer les situations.",null),
("416","254","M^me si(il n\'est pas obligatoire  dans la fonction publique territoriale, le règlement intérieur peut être un bon moyen de fixer les règles d\'organisation et de fonctionnement de la collectivité en matière d’hygiène et sécurité et notamment dans le cadre de la gestion des situations d’alcoolisation. 




CREATE TABLE `resume_article` (
  `NUM_RESUME_ARTICLE` smallint(6) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION_RESUME_ARTICLE` varchar(10000) DEFAULT NULL,
  `DATE_ARTICLE` date DEFAULT NULL,
  PRIMARY KEY (`NUM_RESUME_ARTICLE`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


INSERT INTO resume_article VALUES
("1","Art 108-3 de la Loi 84-53 du 26 janvier 1984 Art.4 du Décret 85-603 modifié (circulaire du 12 octobre 2012 pour application) ...des assistants de prévention et, le cas échéant, des conseillers de prévention sont désignés par l’autorité territoriale sous l’autorité de laquelle ils exercent leurs fonctions.  
("2","Art.4 du Décret 85-603 modifié du 10 juin 1985:   \"Dans le champ de compétence du comité mentionné à l’article 37, des assistants de prévention et, le cas échéant, des conseillers de prévention sont désignés par l’autorité territoriale sous l’autorité de laquelle ils exercent leurs fonctions.....\null,null),
("3","Art.4 du Décret du 10 juin 1985  modifié:
("4","Arrêté du 29 janvier 2015 relatif à la formation obligatoire des assistants de prévention, des conseillers de prévention et des agents chargés des fonctions d\'inspection dans le domaine de la santé et de la sécurité:
("5","Art.4 du Décret du 10 juin 1985  modifié:
("6","Art.4 du Décret 85-603 modifié du 10 juin 1985:  
("7","Art.4 du Décret du 10 juin 1985 modifié:
("8","Art.4 du Décret 85-603 modifié:
("9","Arrêté du 29 janvier 2015 relatif à la formation obligatoire des assistants de prévention, des conseillers de prévention et des agents chargés des fonctions d\'inspection dans le domaine de la santé et de la sécurité: 
("10","Art.10 et art.11 du décret n°85-603 modifié:
("11","Les dispositions de l’article 2-1 du décret n° 85-603 précisent que les autorités territoriales sont chargées de veiller à la sécurité et à la protection de la santé des agents placés sous leur autorité.
("12","Art.16 du décret n°85-603 modifié.
("13","Art.17 et 18 du décret n°85-603 modifié.
("14","Art.25 du décret n°85-603 modifié.
("15","Le décret n° 2012-135 relatif à l’organisation de la médecine du travail du 31 janvier 2012 restreint la liste de risques imposant la mise en place d’une surveillance médicale renforcée.
("16","Art.26 du décret n°85-603 modifié.
("17","Art.27 du décret n°85-603 modifié.
("18","Art.8 du décret n°85-603 modifié.
("19","Art.49 et 50 du décret n°85-603 modifié.
("20","Art.41 du Décret n°85-603 du 10 juin 1985 modifié.
("21","Art.36 du décret 85-603 modifié:
("22","Art.58 du décret 85-603 modifié:
("23","Loi n° 84-53 du 26 janvier 1984 modifiée portant dispositions statutaires relatives à la fonction publique territoriale et notamment ses articles 32 à 33-1 ;
("24","Art.56 du décret 85-603 modifié:
("25","Art.43 du décret 85-603 modifié:
("26","Art.25 de la Loi 84-53 du 26 janvier 1984:
("27","Art.5 du Décret du 10 juin 1985 modifié:
("28","Art.48 du décret 85-603 modifié:
("29","Art.5 du décret 85-603 modifié:
("30","Art.5 du décret 85-603 modifié:
("31","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-1  du CdT.
("32","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-2  du CdT.
("33","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-4  du CdT.
("34","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-3  du CdT.
("35","Une obligation générale de sécurité incombe à l’employeur (article L. 4121-1 du CdT). Il lui revient d’évaluer les risques, y compris psychosociaux, et de prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale de ses salariés.
("36","Art.3-1 du décret n°85-603 modifié:
("37","Art.5-3  et 5.4 du décret n° 85-603 modifié.
("38","Art.L.4711-5, R.4323-25 et R.4323-101 du CdT:
("39","Art.R.4227-39 du CdT:
("40","Art.14-1 du décret n° 85-603 modifié et Art.D.4624-37 à D.4624-41 et D.4625-15 du CdT:
("41","Art.L.4121-3-1 du CdT:
("42","Art.R.4323-55 à 57 du CdT:
("43","(Décret n°96-97, Décret n°96-98, Décret n°97-855, Décret n°2001-840, Décret n°2002-839, Décret n°2002-1528, Décret n 2003-462, Décret n 2004-802, Décret n°2012-639, art. R.4412-94 à 148 du CdT)
("44","(Décret n° 88-1056 du 14 novembre 1988 et publication UTE C 18-510 approuvée par l\'Arrêté du 17 janvier 1989)
("45","Art.R.4411-73 du CdT. 
("46","Art.R.4412-39 du CdT:
("47","Décret n° 2011-1241 du 5 octobre 2011 relatif à l\'exécution de travaux à proximité de certains ouvrages souterrains, aériens ou subaquatiques de transport ou de distribution: 
("48","Arrêté du 08/10/87 relatif au contrôle périodique des installations d\'aération et d\'assainissement des locaux de travail :
("49","Art.1 à 7 de l\'Arrêté du 29/12/2010: 
("50","Art.R.4323-22 du CdT - arrêté du 1er mars 2004:
("51","Art.R.224-31 du code de l\'environnement:
("52","arrêté du 21/12/2004 art 4:
("53","Décret n°88-1056 du 14/11/88 et Arrêté du 20/12/88:
("54","Décret 99-1046 du 13/12/99 et arrêté du 15 mars 2000)
("55","Art.R.4323-99 du CdT:
("56","Décret 93-40 du 11 janvier 1993:
("57","Art.R.4227-34 à R.4227-39 du CdT. et Arrêté du 04/11/93:
("58","Depuis le 1er janvier 1992, le contrôle technique périodique des véhicules automobiles légers (VL) est obligatoire en France. Cette obligation fait suite à un arrêté du 18 juin 1991 réglementé par le Code de la route. Cette obligation est destinée à renforcer et à améliorer la sécurité des automobilistes sur la route.
("59","Arrêté du 21/12/1993 et décret 92-233 du 31 mars 1992, Art.R.4323-12 et Art.R.4224-12 du CdT. Norme NF P25 362 remplacée par NF EN 13241-1
("60","Arrêté du 1er juillet 2004, 
("61","L’établissement doit obtenir une attestation de conformité, délivrée par le préfet du département dans lequel l’établissement est construit, assemblé ou implanté pour la première fois (CTS 3).
("62","Art.L.4121-1 à 3 et R.4141-3 du CdT:
("63","Art.L.4141-1 à 4, L.4142-1 à 4, L.4143-1, L.4154-2 & 4 et L.4522-2 du CdT:
("64","Décret 85-603 modifié et Art.R.4227-39 du CdT:
("65","Art.13 du décret n°85-603 modifié et R.4141-17, R.4224-14, R.4224-15, D.4711-1 du CdT et Arrêté du 24 juillet 2007 modifié et Arrêté du 6 novembre 2009:
("66","Art.L.4121-1 du CdT:
("67","Art.R.4323-55 à 57 du CdT et arrêté du 2/12/98:
("68","Applicable depuis le 1er janvier 2016, il porte l’obligation de la délivrance de l’AIPR au 1er janvier 2018. Celle-ci concerne les maîtres d’ouvrage, maîtres d’œuvre et géomètres pour la partie conception, les encadrants de chantiers ou techniques et enfin certains profils opérateurs.
("69","Arrêté du 7 février 2012 JORF n°0046 du 23 février 2012 , article1 :
("70","Art.R.4323-1 à 3 du CdT:
("71","Un décret prévoit, depuis 1997, l\'interdiction de l\'amiante (quelle que soit la variété de fibres considérée) et des produits en contenant.
("72","Art.R.4224-14 et R.4224-23 du CdT:
("73","Art.D.4711-1 du CdT:
("74","Art.R.4227-28, 29, 39 et 45 du CdT:
("75","Art.R.4543-20 du CdT:
("76","Art.R.4543-19 du CdT:
("77","Décret n° 2009-1272 du 21 octobre 2009 relatif à l\'accessibilité des lieux de travail aux travailleurs handicapés:
("78","Art.R.4321-1 à 4 du CdT:
("79","Art.R.4321-4 du CdT:
("80","Art.R.4323-95 du CdT:
("81","Art.R.4323-104 du CdT:
("82","Art.R.4323-104 du CdT:
("83","Art.D.4153-15 du CdT:
("84","Art.L.4153-9 du CdT et les articles 5-5 à 5-12 du décret n°85-603 relatif à l\'hygiène et à la sécurité du travail dans la fonction publique territoriale
("85","Article 5-5 du Décret 85-603 modifié:
("86","Article 5-6 du Décret 85-603 modifié:
("87","Article 5-7 du Décret 85-603 modifié:
("88","Article 5-8 du Décret 85-603 modifié:
("89","Art.R.4511-1 à R.4514-10 du CdT:
("90","Art.R.4515-1 à 11 du CdT:
("91","Décret 92-1368 et Art.R.4532-1 à 76 du CdT:
("92","Art R.4512-7 du CdT ; Décret n° 92-158 du 20 février 1992 et Arrêté du 19 mars 1993:
("93","Signalisation des zones de danger comportant notamment des risques de chute de personnes ou des risques de chute d’objets. Dispositifs pour éviter l’accès aux agents non autorisés (gardes corps, chaînes, signalisation par bande au sol).
("94","Conformément à l’article 2 du décret 85-603 du 10 juin 1985 modifié 
("95","Art.R.4225-2 du CdT- L’employeur met à la disposition des travailleurs de l’eau potable et fraîche pour la boisson.
("96","Décret n°2006-1386 du 15 novembre 2006 (application de Art.L3511-7 du Code de la santé publique) poser le principe d’une interdiction totale de fumer dans les lieux à usage collectif et notamment sur le lieu de travail ;
("97","Art.R.4228-1 du CdT- L’employeur met à la disposition des travailleurs les moyens d’assurer leur propreté individuelle, notamment des vestiaires, des lavabos, des cabinets d’aisance et, le cas échéant, des douches. 
("98","Art.R.4228-8 du CdT - Dans les établissements où sont réalisés certains travaux insalubres et salissants, des douches sont mises à la disposition des travailleurs.  La liste de ces travaux ainsi que les conditions de mises à disposition des douches sont fixées par arrêté des ministres chargés du travail ou de l’agriculture et, en tant que de besoin, par le ministre chargé de la santé. 
("99","Art.R.4228-22 du CdT
("100","Art.R.4228-10 du CdT:
INSERT INTO resume_article VALUES
("101","Art.R.4225-2 du CdT:
("102","Art.R.4228-23 du CdT:
("103","Art.R.4223-13 à 15 et art.R.4225-1 du CdT 
("104","Art.R.4223-1 à 12 du CdT:
("105","Art.R.4222-4 du CdT:
("106","Art.R.4224-14 du CdT:
("107","Art.R.4224-16 du CdT: 
("108","Art.R.4543-20 du CdT- (Décr. no 2008-1325 du 15 déc. 2008 ) Un  travailleur isolé ne peut réaliser des interventions ou travaux qui: 
("109","Art.R.4543-19 du CdT- (Décr. no 2008-1325 du 15 déc. 2008 ) Un travailleur isolé doit pouvoir signaler toute situation de détresse et être secouru dans les meilleurs délais.
("110","Art.R.4224-16 du CdT:
("111","Art.R.4227-3 à 6 du CdT:
("112","En fonction des activités qui s’y déroulent et du nombre de personnes susceptibles d’être présentes dans l’établissement, l’ERP est soumis à des contraintes réglementaires plus ou moins importantes.
("113","Art.R.4227-28 du CdT:
("114","R.4227-39 du CdT:
("115","Art.R.4227-22 du CdT:- Les locaux ou les emplacements dans lesquels sont entreposées ou manipulées des substances ou préparations classées explosives, comburantes ou extrêmement inflammables, ainsi que des matières dans un état physique susceptible d’engendrer des risques d’explosion ou d’inflammation instantanée, ne contiennent aucune source d’ignition telle que foyer, flamme, appareil pouvant donner lieu à production extérieure d’étincelles ni aucune surface susceptible de provoquer par sa température une auto-inflammation des substances, préparations ou matières précitées. 
("116","Art.R.4216-13 du CdT:
("117","Art.R.4227-37 du CdT:
("118","Règlement de sécurité relatif aux établissements recevant du public (1° et 4° catégorie)
("119","Art.R.4227-4 du CdT:
("120","Art.R.4227-6 à 7 du CdT:
("121","Art.R.4227-10 du CdT:- Les escaliers sont munis de rampe ou de main-courante. Ceux d’une largeur au moins égale à 1,5 mètre en sont munis de chaque côté. 
("122","Art.R.4227-34 du CdT:
("123","Art.R.4227-13 du CdT:
("124","Art.R.4224-18 du CdT. 
("125","Il n’y a pas de réglementation spécifique à ce type d’installation mais 2 recommandations (R468 et R469) de la CNAMTS (Caisse Nationale d’Assurance Maladie des Travailleurs Salariés) apportent des précisions sur les mesures qu’il est vivement conseillé d’adopter, afin d’assurer une prévention des risques efficace en application des textes en vigueur (en particulier certains articles du CT et des textes spécifiques sur la conception des lieux de travail et la prévention des risques en atmosphère explosible). 
("126","Art.R.4224-3 du CdT:
("127","Conformément à l’article 2 du décret 85-603 du 10 juin 1985 modifié; l’autorité territoriale doit maintenir en état les locaux, équipements et installations de travail.
("128","Art.R.4323-58 à 60  du CDT 
("129","Art.R.4227-10 du CdT:
("130","Art.R.4323-59  du CDT :
("131","Art.R.4323-89 et 90 du CdT:
("132","Art.R.4323-61 du CdT:
("133","Art.R.4323-69 à 80 du CdT:
("134","Art.R.4323-81 à 88 du CdT:
("135","Art.R.4541-2 du CdT:
("136","Art.R.4541-3 du CdT: 
("137","Art.R.4541-8 du CdT:
("138","Art.R.4541-9 du CdT:
("139","Décret n° 2011-1475 du 9 novembre 2011
("140","Décret n°2007/1340 du 11 septembre 2007 modifié par décret n°2013-386 du 6 mai 2013 :
("141","Arrêté du 4 novembre 1993 relatif à la signalisation de sécurité et de santé au travail :
("142","Instruction interministérielle sur la signalisation routière, 8ème partie, Livre I (dernier arrêté intégré 31 juillet 2002):
("143","Arrêté du 4 juillet 1972 relatif aux feux spéciaux des véhicules à progression lente:
("144","Arrêté du 6 NOVEMBRE 1992 modifié par l’arrêté du 6 décembre 2011 (J.O. du 22 décembre 2011):
("145","Art.L.4141-1 du CdT :
("146","Art.L.4321-1 du CdT:
("147","Art.R.312-19 du code de la route:
("148","Art.L.4321-1 du CdT:
("150","Art.R.4313-5 à 26 et 49 du CdT:
("151","Art.R.4323-22 et 28 du CdT (Vérification initiale avant mise en service ou à la remise en service),
("152","Art.R.4322-1 du CdT:
("153","Art.R.4322-3 du CdT:
("154","Art.R.4323-1 du CdT:
("155","Art.R.4322-2 du CdT:
("156","Art.R.4322-1 et 2, art.R.4324-30 à 35 du CdT:
("157","Directive 2009/61/CE
("158","Art.R.4323-23 du CdT:
("159","Vu le décret n° 2008-1254 du 1er décembre 2008 relatif au contrôle des matériels destinés à l’application de produits phytopharmaceutiques ; 
("160","regle_util_tondeuse.png
("161","eclai_signal_tondeuse.png
("162","Art.R.4324-30 du CdT:
("163","Art.R317-8 code de la route:
("164","Art.R.311-1 et suivants du Code de la Route, art. R312-4  du Code de la Route,
("165","(Arrêté du 30/10/87, du 20/01/87 et 18/11/96) 
("166","Art R.4323-55 du CdT:
("167","L’article 10 de la Loi n°99-574 du 9 juillet 1999 d’orientation agricole permet aux collectivités de faire appel à des exploitants agricoles pour assurer le déneigement des routes. La loi du 27 juillet 2010 de modernisation de l’agriculture et de la pêche a modifié et complété ces dispositions :
("168","Art R.4412-5 à 10 du CdT:
("169","Art.R.4412-38 du CdT:
("170","Inventaire détaillé de l’ensemble des produits présents dans la collectivité. Présence des fiches de données de sécurité mises à jour. 
("171","Art.R.4412-40 à 43 du CdT. 
("172","Art.R.4412-15 du CdT:
("173","Art.R.4411 du CdT et suivants et l’arrêté du 10 juin 1985 modifié donne de manière générale les obligations incombant aux fabricants de produits, à l’employeur, aux utilisateurs et à la médecine du travail dans le cadre de la prévention du risque chimique. 
("174","Art.R.4412-23 du CdT.
("175","Art.R.4323-95 et 97 du CdT:
("176","Art.R.4412-11 et 21 du CdT.
("177","Art.R.4624-18 du Cdt:
("178","Décret 2010-1016 fixant les obligations des employeurs (art R.4226-1 à 21 du CdT)
("179","Norme NF C 18-510
("180","Norme NF C 18-510
("181","Art.R.4433-1 à 7 du CdT. 
("182","Les articles R. 4311-12 à R. 4311-15 du CdT définissant les équipements de protection individuelle.
("183","Art.R.4436-1 du CdT.
("184","Art.R.4435-2 à 5 du CdT:
("185","Valeurs de l’Exposition sonore quotidienne  ou  de pression acoustique de crête
("186","Art.R.4421-1 à 4 , Art.R.4422-1  et Art.R.4423-1 à 4 du CdT. le Décret n° 94-352 du 4 mai 1994 relatif à la protection des travailleurs contre les risques résultant de leur exposition à des agents biologiques et l\'Arrêté du 30 juin 1998 qui fixe la liste des agents biologiques pathogènes
("187","Art.R.4422-1 du CdT: \" L\'employeur prend des mesures de prévention visant à supprimer ou à réduire au minimum les risques résultant de l\'exposition aux agents biologiques, conformément aux principes de prévention énoncés à l\'article L 4121-2 du CdT » 
("188","Art.R.4426-1 à 13 du CdT: \" L’employeur établit, après avis du médecin du travail, une liste des travailleurs exposés à des agents biologiques des groupes 3 ou 4.   Il indique le type de travail réalisé, et, lorsque c’est possible, l’agent biologique auquel les travailleurs sont exposés ainsi que les données relatives aux expositions, aux accidents et aux incidents. 
("189","Art.R.4425-1 du CdT:  \"L’employeur fournit sur le lieu de travail des instructions écrites et, le cas échéant, des affiches portant sur la procédure à suivre :
("190","Évaluation:
("191","Art.R.4442-1 et 2 du CdT:
("192","Art.R.4446-2 à 4 du CdT:
("193","Décret 91-451 du 14/05/1991 relatif aux risques liés au travail sur écrans de visualisation et Circulaire d’application DRT n°91-18 du 4 novembre 1991
("194","« L\'éclairage doit être conçu et réalisé de manière à éviter la fatigue visuelle, ainsi que les affections de la vue qui en résultent, et permettre de déceler les risques perceptibles à la vue. Les locaux de travail doivent autant que possible disposer d\'une lumière naturelle suffisante »
("195","Art.R.4542-3 du CdT:
("196","Art.R.4542-4 du CdT:
("197","Le Code du Travail n’impose pas de surface minimale ni d’aménagements obligatoires par poste de travail, mais le respect de règles de sécurité, de santé et de bien-être. Des normes prévoient cependant de telles dispositions, notamment pour les salariés travaillant devant des écrans.
("198","Protocole de sécurité
("199","Art.R.4511-1 à R.4514-10 du CdT:
("200","Effondrement - Blindage des fouilles: 
("201","Art.R.4321-4 du CdT:
INSERT INTO resume_article VALUES
("202","Art.R.4543-19 du CdT:- (Décr. no 2008-1325 du 15 déc. 2008 ) 
("203","L’article R.02223-42 du Code général des collectivités territoriales précise que les agents qui exécutent l’une des prestations funéraires (inhumation, exhumation)
("204","Art.L.2223-23 Code général des collectivités territoriales:
("205","Art.R.4323-58 à 60  du CdT:
("206","Art.L.4121-1 du CdT:
("207","Art.R.4543-19 du CdT:- (Décr. no 2008-1325 du 15 déc. 2008 ) 
("208","Dispositions générales sur :
("209","- EPIs adaptés (vêtement difficilement inflammable, lunettes de protection, protection respiratoire si absence de système de ventilation)
("210","Art.R.4543-19 du CdT:- (Décr. no 2008-1325 du 15 déc. 2008 ) 
("211","Art.R.4222-12  du CdT: 
("212","Arrêté du 7 février 2012 JORF n°0046 du 23 février 2012 , article 1:
("213","DECRET 87-361 du 27 mai 1987 article 8:
("214","Le règlement (CE)/1107/2009 : tenir à jour un registre des applications de produits phytosanitaires:
("215","DECRET 87-361 du 27 mai 1987:
("216","- Arrêté du 29 septembre 1997.
("217","Art.6 du Règlement (CE) n°852/2004  du 29 avril 2004 relatif aux Contrôles officiels, enregistrement et agrément: 
("218","Art.L.4121-2 du CdT:
("219","Art.R.4412-87du CdT:
("220","La démarche de prévention des risques professionnels impose avant tout à l’employeur de chercher à éviter les risques ou à les limiter (article L.4121-1 du CdT). Les mesures, mises en place sur le fondement des principes généraux de prévention (article L.4121-2 du CdT), auront pour objet de maîtriser les risques qui ne peuvent être évités, en intégrant la sécurité le plus en amont possible des procédés de travail, et en privilégiant les mesures de protection collective sur les moyens de protection individuelle.
("221","L\'article L6321-1 du code du travail précise que \"l\'employeur assure l\'adaptation des salariés à leur poste de travail. Il veille au maintien de leur capacité à occuper un emploi, au regard notamment de l\'évolution des emplois, des technologies et des organisations. Il peut proposer des formations qui participent au développement des compétences, ainsi qu\'à la lutte contre l\'illettrisme\".
("222","Art.R.4312-1 du CdT:
("223","Art.R.4412-149 du CdT:
("224","Art.R.4214-26 du CdT:
("225","Réglementation ERP. Art.PE 4
("226","Décret n°94-699 du 10/08/94
("227"," - Risque amiante
("229","Décret 2003 - 296 du 31 mars 2003 relatif à la protection des travailleurs contre les dangers des rayonnements ionisants:
("230","Art.R.4323-23 et 24 du CdT:
("232","Art.R4311-8 du CdT:
("233","Art.R.4323-81 à 88 du CdT:
("234","defaut",null),
("235","Art.L.4121-1 du CdT:
("236","L’autorité territoriale évalue les risques encourus pour la santé et la sécurité des travailleurs pour toute activité susceptible de présenter un risque d’exposition à des agents chimiques dangereux (extrait de l’article R 4412-5 du CdT). Pour plus d’information sur le risque chimique, voir la fiche n°10 : Prévention du risque chimique.
("237","Art.R.4214-3 du CdT:
("239","Art.R.4323-55 du CdT:
("240","Arrêté du 21 mars 1968 fixant les règles techniques et de sécurité applicables au stockage et à l\'utilisation de produits pétroliers.
("241","Art.R.4462-27 du CdT:
("242","Art.R.4462-27 du CdT:
("243","Art.4 à 6 de l\'Arrêté du 31 mai 2010 pris en application des articles 3, 4 et 6 du décret n° 2010-580 du 31 mai 2010 relatif à l\'acquisition, la détention et l\'utilisation des artifices de divertissement et des articles pyrotechniques destinés au théâtre:
("244","Le Comité interministériel de la sécurité routière (CISR) du 13 février 2008 a décidé de rentre obligatoire la présence dans tout véhicule d’un gilet de sécurité et d’un triangle de pré-signalisation (en complément des feux de détresse). Le non respect de ces obligations est passible d’une contravention de la quatrième classe (amende forfaitaire de 135 €, amende minorée de 90 €).",null),
("245","Art.R.4321-1 à 4 du CdT:
("247","Le risque d’effondrements et de chutes d’objets peut être présent dans toutes les entreprises, il en résulte un accident engendré par la chute d’un objet ou bien un effondrement sur un ou plusieurs opérateurs. La cause de ce risque est multifactorielle.
("248","Art.4323-83 et 87du CdT:
("249","Art.R314-1 du code de la route:
("250","Art.R.4227-28 du CdT:
("251","defaut",null),
("253","Art R. 4228-20 du CdT:  \"Aucune boisson alcoolisée autre que le vin, la bière, le cidre et le poiré n\'est autorisée sur le lieu de travail.
("254","Art R. 4228-21 du CdT: \" Il est interdit de laisser entrer ou séjourner dans les lieux de travail des personnes en état d\'ivresse.\"
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