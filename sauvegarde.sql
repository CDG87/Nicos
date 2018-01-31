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
("1","Art 108-3 de la Loi 84-53 du 26 janvier 1984 Art.4 du Décret 85-603 modifié (circulaire du 12 octobre 2012 pour application) ...des assistants de prévention et, le cas échéant, des conseillers de prévention sont désignés par l’autorité territoriale sous l’autorité de laquelle ils exercent leurs fonctions.  \nLes agents mentionnés au premier alinéa peuvent être mis à disposition, pour tout ou partie de leur temps par une commune, l’établissement public de coopération intercommunale dont est membre la commune, ou le centre de gestion, dans les conditions prévues à l’article 108-3 de la loi du 26 janvier 1984 susvisée.","2018-01-22"),
("2","Art.4 du Décret 85-603 modifié du 10 juin 1985:   \"Dans le champ de compétence du comité mentionné à l’article 37, des assistants de prévention et, le cas échéant, des conseillers de prévention sont désignés par l’autorité territoriale sous l’autorité de laquelle ils exercent leurs fonctions.....\null,null),
("3","Art.4 du Décret du 10 juin 1985  modifié:\nL’autorité territoriale adresse aux agents mentionnés au premier alinéa une lettre de cadrage qui définit les moyens mis à leur disposition pour l’exercice de leurs missions. Une copie de cette lettre est communiquée au comité, mentionné à l’article 37, dans le champ duquel l’agent est placé.",null),
("4","Arrêté du 29 janvier 2015 relatif à la formation obligatoire des assistants de prévention, des conseillers de prévention et des agents chargés des fonctions d\'inspection dans le domaine de la santé et de la sécurité:\nLes assistants de prévention n\'ayant pas suivi la formation préalable prévue par l\'arrêté du 3 mai 2002 cité à l\'article 10 ainsi que les conseillers de prévention, désignés en application des dispositions de l\'article 4 du décret du 10 juin 1985 susvisé, reçoivent une formation préalable à leur prise de fonction d\'une durée de :\n- cinq jours pour les assistants de prévention ;\n- sept jours pour les conseillers de prévention.\nLa formation prévue à l\'article précédent porte notamment :\nPour les assistants de prévention, sur l\'acquisition des bases et repères nécessaires au premier exercice de la fonction et la capacité d\'intervenir dans le cadre d\'une démarche de prévention des risques professionnels ;\nPour les conseillers de prévention, sur l\'acquisition d\'une bonne compréhension de son rôle et de ses missions de conseiller de prévention et la capacité à animer une démarche de prévention des risques professionnels.\nLa formation doit aussi faciliter le transfert des acquis en situation professionnelle par la définition, par chaque participant, d\'un plan d\'action opérationnel adapté à son contexte d\'intervention.\nLa durée de la formation continue au profit des assistants de prévention et des conseillers de prévention est fixée à deux journées l\'année suivant leur prise de fonctions et au minimum à un module de formation les années suivantes.\nCette formation a pour but notamment de permettre aux intéressés de parfaire leurs compétences et d\'actualiser leurs connaissances en matière de santé et de sécurité.",null),
("5","Art.4 du Décret du 10 juin 1985  modifié:\n La collectivité doit mettre à la disposition des agents assurant la mission d\'AP les moyens nécessaires; documentations, temps consacré en rapport avec la taille et les risques de la collectivité, soutien de l\'autorité, droit d\'accès aux locaux., formation.\n• libre accès aux locaux, aux réunions du CHS ou du CTP lorsque la situation de la collectivité en matière d’hygiène et de sécurité est évoquée ;\n• possibilité, le cas échéant, de solliciter le Service de Prévention  et de Médecine Préventive du Centre de Gestion\n• droit de démission…",null),
("6","Art.4 du Décret 85-603 modifié du 10 juin 1985:  \n\"Dans le champ de compétence du comité mentionné à l\'article 37, des assistants de prévention et, le cas échéant, des conseillers de prévention sont désignés par l\'autorité territoriale sous l\'autorité de laquelle ils exercent leurs fonctions. Les assistants de prévention constituent le niveau de proximité du réseau des agents de prévention. Les conseillers de prévention assurent une mission de coordination. Ils sont institués lorsque l\'importance des risques professionnels ou des effectifs le justifie.\null,null),
("7","Art.4 du Décret du 10 juin 1985 modifié:\nDans le champ de compétence du comité mentionné à l\'article 37, des assistants de prévention et, le cas échéant, des conseillers de prévention sont désignés par l\'autorité territoriale sous l\'autorité de laquelle ils exercent leurs fonctions. Les assistants de prévention constituent le niveau de proximité du réseau des agents de prévention. Les conseillers de prévention assurent une mission de coordination. Ils sont institués lorsque l\'importance des risques professionnels ou des effectifs le justifie.\nLes agents mentionnés au premier alinéa peuvent être mis à disposition, pour tout ou partie de leur temps par une commune, l\'établissement public de coopération intercommunale dont est membre la commune, ou le centre de gestion, dans les conditions prévues à l\'article 108-3 de la loi du 26 janvier 1984 susvisée.",null),
("8","Art.4 du Décret 85-603 modifié:\nL\'autorité territoriale adresse aux agents mentionnés au premier alinéa une lettre de cadrage qui définit les moyens mis à leur disposition pour l\'exercice de leurs missions. Une copie de cette lettre est communiquée au comité, mentionné à l\'article 37, dans le champ duquel l\'agent est placé.\n\nLes dispositions du présent article et de l\'article 4-1 sont sans incidence sur le principe de la responsabilité de l\'autorité territoriale mentionnée à l\'article 2-1.",null),
("9","Arrêté du 29 janvier 2015 relatif à la formation obligatoire des assistants de prévention, des conseillers de prévention et des agents chargés des fonctions d\'inspection dans le domaine de la santé et de la sécurité: \nLes assistants de prévention n\'ayant pas suivi la formation préalable prévue par l\'arrêté du 3 mai 2002 cité à l\'article 10 ainsi que les conseillers de prévention, désignés en application des dispositions de l\'article 4 du décret du 10 juin 1985 susvisé, reçoivent une formation préalable à leur prise de fonction d\'une durée de :\n- cinq jours pour les assistants de prévention ;\n- sept jours pour les conseillers de prévention.\nLa formation prévue à l\'article précédent porte notamment :\nPour les assistants de prévention, sur l\'acquisition des bases et repères nécessaires au premier exercice de la fonction et la capacité d\'intervenir dans le cadre d\'une démarche de prévention des risques professionnels ;\nPour les conseillers de prévention, sur l\'acquisition d\'une bonne compréhension de son rôle et de ses missions de conseiller de prévention et la capacité à animer une démarche de prévention des risques professionnels.\nLa formation doit aussi faciliter le transfert des acquis en situation professionnelle par la définition, par chaque participant, d\'un plan d\'action opérationnel adapté à son contexte d\'intervention.\nLa durée de la formation continue au profit des assistants de prévention et des conseillers de prévention est fixée à deux journées l\'année suivant leur prise de fonctions et au minimum à un module de formation les années suivantes.\nCette formation a pour but notamment de permettre aux intéressés de parfaire leurs compétences et d\'actualiser leurs connaissances en matière de santé et de sécurité.",null),
("10","Art.10 et art.11 du décret n°85-603 modifié:\nLes collectivités et établissements employant des agents régis par la loi n° 84-53 du 26 janvier 1984 disposent d’un service de médecine préventive dans les conditions définies à l’article 108-2 de la loi du 26 janvier 1984 précitée. \nLe médecin assume deux grands types de missions : \n -  la surveillance du milieu professionnel et la prévention des risques professionnels \n -  le suivi médical des agents.\nL\'autorité territoriale s\'assure du bon suivi de la surveillance médicale obligatoire en vertu de l\'art 108-2 de la loi n°84-53 du 26 janvier 1984 dont la périodicité est fixée à  deux ans au minimum.",null),
("11","Les dispositions de l’article 2-1 du décret n° 85-603 précisent que les autorités territoriales sont chargées de veiller à la sécurité et à la protection de la santé des agents placés sous leur autorité.\nArt.20 du décret n°85-603 modifié.\nLes agents des collectivités et établissements mentionnés à l\'article 1er bénéficient d\'un examen médical périodique au minimum tous les deux ans. Dans cet intervalle, les agents qui le demandent bénéficient d\'un examen médical supplémentaire.\nPour les fonctionnaires territoriaux nommés dans plusieurs emplois permanents à temps non complet, cet examen médical se déroule dans la collectivité qui emploie le fonctionnaire pendant la quotité horaire hebdomadaire la plus longue.",null),
("12","Art.16 du décret n°85-603 modifié.\nLe service de médecine préventive est consulté sur les projets de construction ou aménagements importants des bâtiments administratifs et techniques et de modifications apportées aux équipements ainsi que ceux liés aux nouvelles technologies. Il peut procéder à toute étude et soumettre des propositions.   \nIl formule des propositions sur l’accessibilité des locaux aux agents handicapés.",null),
("13","Art.17 et 18 du décret n°85-603 modifié.\nLe service de médecine préventive est obligatoirement informé, avant toute utilisation de substances ou produits dangereux, de la composition de ces produits et de la nature de ces substances, ainsi que de leurs modalités d’emploi.\n\nLe service de médecine préventive peut demander à l\'autorité territoriale de faire effectuer des prélèvements et des mesures aux fins d\'analyses. Le refus de celle-ci doit être motivé. Le service de médecine préventive informe l\'organisme compétent en matière d\'hygiène et de sécurité, en application du titre IV du présent décret des résultats de toutes mesures et analyses.",null),
("14","Art.25 du décret n°85-603 modifié.\nLe service de médecine préventive est informé par l’autorité territoriale dans les plus brefs délais de chaque accident de service et de chaque maladie professionnelle ou à caractère professionnel.\n",null),
("15","Le décret n° 2012-135 relatif à l’organisation de la médecine du travail du 31 janvier 2012 restreint la liste de risques imposant la mise en place d’une surveillance médicale renforcée.\nAinsi, à compter du 1er juillet 2012, bénéficieront d’une surveillance médicale renforcée (Art.R. 4624-18) :\n-les travailleurs âgés de moins de dix-huit ans,\n-les femmes enceintes,\n-les salariés exposés à l’amiante, aux rayonnements ionisants, au plomb, au risque hyperbare, au bruit, aux vibrations, aux agents biologiques des groupes 3 et 4, aux agents cancérogènes, mutagènes ou toxiques pour la reproduction de catégories 1 et 2,\n-les travailleurs handicapés.\nCette surveillance médicale renforcée comprend au moins un ou des examens de nature médicale selon une périodicité n’excédant pas 24 mois.\n\nSauf pour :\nLes salariés exposés aux rayonnements ionisants (visite, tous les ans)\nLes travailleurs de nuit (tous les 6 mois)\nLes salariés soumis aux VLEP (valeur limite exposition professionnelle) Bruit, Vibration, produits chimiques, etc.",null),
("16","Art.26 du décret n°85-603 modifié.\nLe service de médecine préventive établit chaque année un rapport d’activité qui est transmis à l’autorité territoriale et à l’organisme compétent en matière d’hygiène et de sécurité.  \nUn exemplaire en est transmis au centre de gestion qui établit un rapport de synthèse de l’ensemble des rapports d’activité qu’il a reçus et le transmet au Conseil supérieur de la fonction publique territoriale.",null),
("17","Art.27 du décret n°85-603 modifié.\nSont tenus de créer un ou plusieurs comités d\'hygiène, de sécurité et des conditions de travail, outre les services départementaux d\'incendie et de secours sans condition d\'effectifs, les collectivités ou établissements mentionnés à l\'article 1er, dans les mêmes conditions que celles prévues pour les comités techniques par les premier à quatrième alinéas de l\'article 32 de la loi du 26 janvier 1984 susvisée. Dans les collectivités territoriales et les établissements publics de moins de cinquante agents, les missions du comité d\'hygiène, de sécurité et des conditions de travail sont exercées par le comité technique dont relèvent ces collectivités et établissements. \n« Si l\'importance des effectifs et la nature des risques professionnels, appréciés en fonction notamment des missions confiées aux agents, de l\'agencement et de l\'équipement des locaux, le justifient, des comités d\'hygiène, de sécurité et des conditions de travail locaux ou spéciaux sont créés par décision de l\'organe délibérant de la collectivité ou de l\'établissement. Ils peuvent également être créés si l\'une de ces deux conditions est réalisée. ",null),
("18","Art.8 du décret n°85-603 modifié.\nLes membres représentants du personnel des organismes compétents en matière d’hygiène de sécurité et des conditions de travail visés au titre IV du présent décret bénéficient, au cours du premier semestre de leur mandat, d’une formation d’une durée minimale de cinq jours, renouvelée à chaque mandat.  \nLa formation prévue à l’alinéa précédent est dispensée soit par un organisme figurant sur la liste arrêtée par le préfet de région en application de l’article R. 4614-25 du CdT, soit par un des organismes visés à l’article 1er du décret n° 85-552 du 22 mai 1985 relatif à l’attribution aux agents de la fonction publique territoriale du congé pour formation syndicale, soit par le Centre national de la fonction publique territoriale selon les modalités prévues à l’article 23 de la loi du 12 juillet 1984 susvisée. Elle est organisée dans les conditions définies par le décret n° 2007-1845 du 26 décembre 2007 relatif à la formation professionnelle tout au long de la vie des agents de la fonction publique territoriale.  \nConformément aux dispositions des articles R. 4614-21 à R. 4614-23 du CdT, le contenu des formations visées au premier alinéa du présent article doit permettre aux représentants du personnel au sein des comités d’hygiène, de sécurité et de conditions de travail :  \n1° De développer leur aptitude à déceler et à mesurer les risques professionnels et leur capacité d’analyse des conditions de travail ;  \n2° De les initier aux méthodes et procédés à mettre en œuvre pour prévenir les risques professionnels et améliorer les conditions de travail.",null),
("19","Art.49 et 50 du décret n°85-603 modifié.\nChaque année, le président soumet au comité, pour avis un programme annuel de prévention des risques professionnels et d\'amélioration des conditions de travail établi à partir de l\'analyse prévue à l\'article 39 du présent décret et du rapport annuel. Il fixe la liste détaillée des réalisations ou actions qu\'il lui paraît souhaitable d\'entreprendre au cours de l\'année à venir. Il précise, pour chaque réalisation ou action, ses conditions d\'exécution et l\'estimation de son coût.\nLe comité peut proposer un ordre de priorité et des mesures supplémentaires au programme annuel de prévention. \nLorsque certaines mesures prévues au programme de prévention n\'ont pas été prises, les motifs en sont donnés en annexe au rapport annuel.\n\nArt. 39 du décret n°85-603 modifié.\nLe comité procède à l\'analyse des risques professionnels dans les conditions définies par l\'article L. 4612-2 du CdT.\nLe comité contribue en outre à la promotion de la prévention des risques professionnels et suscite toute initiative qu\'il estime utile dans cette perspective conformément à l\'article L. 4612-3 du CdT. Il peut proposer notamment des actions de prévention du harcèlement moral et du harcèlement sexuel.\nLe comité suggère toutes mesures de nature à améliorer l\'hygiène et la sécurité du travail, à assurer l\'instruction et le perfectionnement des agents dans les domaines de l\'hygiène et de la sécurité. Il coopère à la préparation des actions de formation à l\'hygiène et à la sécurité et veille à leur mise en œuvre.\n",null),
("20","Art.41 du Décret n°85-603 du 10 juin 1985 modifié.\nLe comité procède, dans le cadre de sa mission d\'enquête en matière d\'accidents du travail, d\'accidents de service ou de maladies professionnelles ou à caractère professionnel, à une enquête à l\'occasion de chaque accident du travail, chaque accident de service ou de chaque maladie professionnelle ou à caractère professionnel au sens des 3° et 4° de l\'article 6.\n\"3° En cas d\'accident de service grave ou de maladie professionnelle ou à caractère professionnel grave ayant entraîné mort d\'homme, ou paraissant devoir entraîner une incapacité permanente, ou ayant révélé l\'existence d\'un danger grave, même si les conséquences ont pu en être évitées ;\n4° En cas d\'accident de service ou de maladie professionnelle ou à caractère professionnel présentant un caractère répété à un même poste de travail, ou à des postes de travail similaires, ou dans une même fonction, ou des fonctions similaires.\"\nLes enquêtes sont réalisées par une délégation comprenant un représentant de la collectivité ou de l\'établissement et un représentant du personnel. La délégation peut être assistée d\'un médecin du service de médecine préventive, de l\'agent mentionné à l\'article 5 et de l\'assistant ou du conseiller de prévention.\nLe comité est informé des conclusions de chaque enquête et des suites qui leur sont données.",null),
("21","Art.36 du décret 85-603 modifié:\nLe comité technique est consulté pour avis sur les sujets d\'ordre général intéressant l\'hygiène, la sécurité et les conditions de travail.\nLe comité technique bénéficie du concours du comité d\'hygiène, de sécurité et des conditions de travail dans les matières relevant de sa compétence et peut le saisir de toute question. Il examine en outre les questions dont il est saisi par le comité d\'hygiène, de sécurité et des conditions de travail créé auprès de lui.\nLe comité est consulté :\n1° Sur les projets d\'aménagement importants modifiant les conditions de santé et de sécurité ou les conditions de travail et, notamment, avant toute transformation importante des postes de travail découlant de la modification de l\'outillage, d\'un changement de produit ou de l\'organisation du travail ;\n2° Sur les projets importants d\'introduction de nouvelles technologies et lors de l\'introduction de ces nouvelle technologies, lorsqu\'elles sont susceptibles d\'avoir des conséquences sur la santé et la sécurité des agents.",null),
("22","Art.58 du décret 85-603 modifié:\nLe comité se réunit au moins trois fois par an sur convocation de son président, à son initiative, ou dans le délai maximum d\'un mois, sur demande écrite de deux représentants titulaires du personnel lorsque le comité comprend au plus quatre représentants titulaires et de trois représentants dans les autres cas.\n\nEn outre, le comité est réuni par son président à la suite de tout accident dans les conditions prévues par le II de l\'article 33-1 de la loi du 26 janvier 1984 susvisée.\nSi le comité n\'a pas été réuni sur une période d\'au moins neuf mois, l\'agent chargé des fonctions d\'inspection peut être saisi par les représentants titulaires dans les conditions prévues à l\'alinéa premier. Sur demande de l\'agent chargé des fonctions d\'inspection, l\'autorité territoriale convoque, dans un délai de huit jours à compter de la réception de cette demande, une réunion qui doit avoir lieu dans le délai d\'un mois à compter de la réception de cette demande. \n\nL\'impossibilité de tenir une telle réunion doit être justifiée et les motifs en sont communiqués aux membres du comité d\'hygiène, de sécurité et de conditions de travail.\nEn l\'absence de réponse de l\'autorité territoriale ou lorsqu\'il estime que le refus est insuffisamment motivé, l\'agent chargé des fonctions d\'inspection saisit l\'inspecteur du travail. Dans un tel cas, la procédure décrite aux alinéas 6 à 8 de l\'article 5-2 s\'applique.",null),
("23","Loi n° 84-53 du 26 janvier 1984 modifiée portant dispositions statutaires relatives à la fonction publique territoriale et notamment ses articles 32 à 33-1 ;\nDécret n° 85-565 du 30 mai 1985 modifié relatif aux comités techniques des collectivités territoriales et de leurs établissements publics.\nDécret n°85-603 du 10 juin 1985 modifié relatif à l\'hygiène et à la sécurité du travail ainsi qu\'à la médecine professionnelle et préventive dans la fonction publique territoriale.\nArt.56 du décret 85-603 modifié:\nLe secrétaire du comité est désigné par les représentants du personnel en leur sein. Lors de la désignation du secrétaire, est également fixée la durée de son mandat. Le règlement intérieur détermine les modalités de la désignation.",null),
("24","Art.56 du décret 85-603 modifié:\nAprès chaque réunion, il est établi un procès-verbal comprenant le compte rendu des débats et le détail des votes. Ce document est signé par le président et par le secrétaire, puis transmis dans le délai d\'un mois aux membres du comité. Ce procès-verbal est soumis à l\'approbation du comité lors de la séance suivante.",null),
("25","Art.43 du décret 85-603 modifié:\nLe comité est informé de toutes les visites et observations faites par les agents mentionnés à l\'article 5.",null),
("26","Art.25 de la Loi 84-53 du 26 janvier 1984:\nArt.5 du Décret du 10 juin 1985 modifié (circulaire du 12 octobre 2012 pour application):\nL\'autorité territoriale désigne également, après avis du comité mentionné à l\'article 37, le ou les agents qui sont chargés d\'assurer une fonction d\'inspection dans le domaine de la santé et de la sécurité. Elle peut passer convention avec le centre de gestion pour la mise à disposition de tels agents dans le cadre de l\'article 25 de la loi du 26 janvier 1984 susvisée. \n\nL\'autorité territoriale ou le centre de gestion peut demander au ministre chargé du travail de lui assurer le concours des agents des services de l\'inspection du travail, soit pour des missions permanentes, soit pour des interventions temporaires.",null),
("27","Art.5 du Décret du 10 juin 1985 modifié:\nL\'autorité territoriale élabore une lettre de mission, qui est transmise pour information au comité, mentionné à l\'article 37. Dans le cas d\'un agent mis à disposition par le centre de gestion, la lettre de mission est établie sur la base de la convention passée avec le centre de gestion et transmise pour information au comité mentionné à l\'article 37 de la collectivité territoriale ou de l\'établissement dans lequel l\'agent est amené à exercer ses fonctions. ",null),
("28","Art.48 du décret 85-603 modifié:\nLe comité est consulté sur la teneur de tous documents se rattachant à sa mission, et notamment des règlements et des consignes que l\'autorité territoriale envisage d\'adopter en matière d\'hygiène, de sécurité et de conditions de travail.\nCes documents sont également communiqués, pour avis, aux agents mentionnés à l\'article 5.",null),
("29","Art.5 du décret 85-603 modifié:\nCes agents contrôlent les conditions d\'application des règles d\'hygiène et de sécurité et proposent à l\'autorité territoriale compétente toute mesure qui leur paraît de nature à améliorer l\'hygiène et la sécurité du travail et la prévention des risques professionnels. Dans ce cadre, ils ont librement accès à tous les établissements, locaux et lieux de travail dépendant des services à inspecter et se font présenter les registres et documents imposés par la réglementation. En cas d\'urgence ils proposent à l\'autorité territoriale les mesures immédiates qu\'ils jugent nécessaires. ",null),
("30","Art.5 du décret 85-603 modifié:\nCes agents contrôlent les conditions d\'application des règles d\'hygiène et de sécurité et proposent à l\'autorité territoriale compétente toute mesure qui leur paraît de nature à améliorer l\'hygiène et la sécurité du travail et la prévention des risques professionnels. Dans ce cadre, ils ont librement accès à tous les établissements, locaux et lieux de travail dépendant des services à inspecter et se font présenter les registres et documents imposés par la réglementation. En cas d\'urgence ils proposent à l\'autorité territoriale les mesures immédiates qu\'ils jugent nécessaires.\nL\'autorité territoriale les informe des suites données à leurs propositions.\n ",null),
("31","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-1  du CdT.\nL\'employeur transcrit et met à jour dans un document unique les résultats de l\'évaluation des risques pour la santé et la sécurité des travailleurs à laquelle il procède en application de l\'article L. 4121-3.   \nCette évaluation comporte un inventaire des risques identifiés dans chaque unité de travail de l\'entreprise ou de l\'établissement, y compris ceux liés aux ambiances thermiques",null),
("32","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-2  du CdT.\nLa mise à jour du document unique d\'évaluation des risques est réalisée :\n1° Au moins chaque année;\n2° Lors de toute décision d\'aménagement important modifiant les conditions de santé et de sécurité ou les conditions de travail, au sens de l\'article L. 4612-8 ;\n3° Lorsqu\'une information supplémentaire intéressant l\'évaluation d\'un risque dans une unité de travail est recueillie.",null),
("33","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-4  du CdT.\nLe document unique d\'évaluation des risques est tenu à la disposition : Des agents ;  Des membres du comité d\'hygiène, de sécurité et des conditions de travail ou des instances qui en tiennent lieu ; Des délégués du personnel ; Du médecin de prévention ; Des personnes soumises à un risque pour leur sécurité ou leur santé ....\nUn avis indiquant les modalités d\'accès desagents au document unique est affiché à une place convenable et aisément accessible dans les lieux de travail. Dans les entreprises ou établissements dotés d\'un règlement intérieur, cet avis est affiché au même emplacement que celui réservé au règlement intérieur.",null),
("34","Décret n° 2001-1016 du 5 novembre 2001, codifié à l’article R.4221-3  du CdT.\nDans les établissements dotés d\'un comité d\'hygiène, de sécurité et des conditions de travail, le document unique d\'évaluation des risques est utilisé pour l\'établissement du rapport et du programme de prévention des risques professionnels annuels prévus à l\'article L. 4612-16.",null),
("35","Une obligation générale de sécurité incombe à l’employeur (article L. 4121-1 du CdT). Il lui revient d’évaluer les risques, y compris psychosociaux, et de prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale de ses salariés.\nUn protocole d\'accord relatif à la prévention des risques psychosociaux dans la fonction publique a été signé le 22 octobre 2013. Cet accord-cadre prévoit la mise en place d’un plan national d’action pour la prévention des RPS dans la fonction publique qui doit se traduire par l’élaboration par chaque employeur public d’un plan d’évaluation et de prévention des RPS.\nEn application de l’accord du 22 octobre 2013, chaque employeur public devra, d’ici 2015, élaborer un plan d’évaluation et de prévention des RPS. Ces plans de prévention reposeront sur une phase de diagnostic à laquelle l’ensemble des agents sera associé et qui devra être intégrée dans le document unique d’évaluation des risques professionnels. Le CHSCT contribuera à chaque étape, de l’élaboration du diagnostic à la mise en œuvre du plan de prévention.",null),
("36","Art.3-1 du décret n°85-603 modifié:\nUn registre de santé et de sécurité au travail est ouvert dans chaque service et tenu par les agents mentionnés à l’article 4. Ce document contient consignées les observations et suggestions des agents relatives à la prévention des risques professionnels et à l’amélioration des conditions de travail.\nLe registre de santé et de sécurité au travail est mis à la disposition de l’ensemble des agents et, le cas échéant, des usagers. Il est également mis à la disposition des agents chargés d’une fonction d’inspection mentionnés à l’article 5 et du comité mentionné à l’article 37.",null),
("37","Art.5-3  et 5.4 du décret n° 85-603 modifié.\nLes avis mentionnés au premier alinéa de l’article 5-2 sont consignés dans un registre spécial coté et ouvert au timbre du comité mentionné à l’article 37. Sous la responsabilité de l’autorité territoriale, ce registre est tenu à la disposition des membres de ce comité et de tout agent qui est intervenu en application de l’article 5-2. \nTout avis figurant sur le registre doit être daté et signé et comporter l’indication des postes de travail concernés, de la nature du danger et de sa cause, du nom de la ou des personnes exposées. Les mesures prises par l’autorité territoriale y sont également consignées.",null),
("38","Art.L.4711-5, R.4323-25 et R.4323-101 du CdT:\nLe registre de sécurité (ou registre unique d’hygiène et de sécurité) est destiné à la consignation des résultats des vérifications périodiques obligatoires pratiquées notamment sur les équipements de travail, les équipements de protection collective ou individuelle, les installations dans les lieux de travail. \nIl ne comprend pas de mesures techniques mais : \n-  la liste des équipements ou installations contrôlés ou vérifiés, \n-  la date du contrôle ou de la vérification, \n-  l\'identité de la personne et/ou de l\'organisme chargé(e) du contrôle ou de la vérification.",null),
("39","Art.R.4227-39 du CdT:\nArt.R;123-51 du CCH:\nSont considérés comme ERP \"tous bâtiments, locaux ou enceintes dans lesquels des personnes sont admises soit librement, soit moyennant une rétribution ou une participation quelconque, ou dans lesquels sont tenues des réunions ouvertes à tout venant ou sur invitations payantes ou non\". Art.R-123-2 du Code de la Construction et de l\'Habitation. Les locaux qui peuvent être assimilés au domicile privé ou ceux réservés aux travailleurs ne sont pas des ERP.\nLa consigne de sécurité incendie prévoit des essais et visites périodiques du matériel et des exercices au cours desquels les travailleurs apprennent à reconnaître les caractéristiques du signal sonore d\'alarme générale, à se servir des moyens de premier secours et à exécuter les diverses manœuvres nécessaires.\nCes exercices et essais périodiques ont lieu au moins tous les six mois. Leur date et les observations auxquelles ils peuvent avoir donné lieu sont consignées sur un registre tenu à la disposition de l\'inspection du travail. \nDans le cas des ERP, ce registre , aussi appelé registre ERP ou registre incendie est obligatoire ( art R123-51 du CCH ). il contient entre autre l\'organisation de l\'instruction du personnel avec thèmes et dates des exercices et suivi des vérifications et de l’entretien du matériel incendie et des installations techniques, des travaux, des visites de la commission de sécurité..\nLes PV des visites de la comission de sécurité doivent y être annexés.",null),
("40","Art.14-1 du décret n° 85-603 modifié et Art.D.4624-37 à D.4624-41 et D.4625-15 du CdT:\nDans chaque service d’une collectivité territoriale et dans chaque établissement public relevant d’une collectivité territoriale ou établissement public des collectivités territoriales entrant dans le champ d’application du présent décret, le médecin du service de médecine préventive établit et tient à jour, en liaison avec l’agent désigné en application de l’article 108-3 de la loi du 26 janvier 1984 susvisée et après consultation du comité mentionné à l’article 37, une fiche sur laquelle sont consignés les risques professionnels propres au service et les effectifs d’agents exposés à ces risques.\nCette fiche doit être renseignée par le médecin de prévention en liaison avec la collectivité ( le ou les CP/AP).",null),
("41","Art.L.4121-3-1 du CdT:\nCet article impose que pour chaque travailleur exposé à un ou plusieurs facteurs de risque porofessionnels déterminés par le décret 2012-136 du 30 janvier 2012 et codifié aux art D4121-6 à D4121-9 du CT une fiche individuelle, dénomée fiche de prévention des expositions, soit établie et mentionne :« 1) Les conditions habituelles d’exposition appréciées, notamment, à partir du document unique d’évaluation des risques ainsi que les événements particuliers survenus ayant eu pour effet d’augmenter l’exposition ; 2) La période au cours de laquelle cette exposition est survenue ; 3) Les mesures de prévention, organisationnelles, collectives ou individuelles, mises en oeuvre pour faire disparaître ou réduire les facteurs de risques durant cette période.\n\nArt.R.4412-120 du CdT:\n  L\'employeur établit, pour chaque travailleur exposé, une fiche d\'exposition à l\'amiante indiquant :\n  1° La nature du travail réalisé, les caractéristiques des matériaux et appareils en cause, les périodes de  travail au cours desquelles il a été \nexposé et les autres risques ou nuisances d\'origine chimique, physique \nou biologique du poste de travail ;\n  2° Les dates et les résultats des contrôles de l\'exposition au poste de \ntravail ainsi que la durée et l\'importance des expositions accidentelles ;\n  3° Les procédés de travail utilisés ;\n  4° Les moyens de protection collective et les équipements de protection \nindividuelle utilisés.",null),
("42","Art.R.4323-55 à 57 du CdT:\n - Le certificat d’aptitude médical à la conduite d’engin qui lui a été délivré par le médecin de prévention de la collectivité.\n-  L’attestation de contrôle de connaissance et de savoir faire pour la conduite en sécurité ou le Certificat d’Aptitude à la Conduite d’Engin en Sécurité (CACES) concernant la catégorie d’engin ou le certificat faisant foi de son aptitude professionnelle (CAP, BP, CFPA...)\n- La connaissance des lieux et des instructions à respecter sur le ou les sites d’utilisation \n- Le permis de conduire adéquate.",null),
("43","(Décret n°96-97, Décret n°96-98, Décret n°97-855, Décret n°2001-840, Décret n°2002-839, Décret n°2002-1528, Décret n 2003-462, Décret n 2004-802, Décret n°2012-639, art. R.4412-94 à 148 du CdT)\nArrêté du 21 décembre 2012 relatif aux recommandations générales de sécurité et au contenu de la fiche récapitulative du « dossier technique amiante » \nLe repérage des matériaux et le dossier technique amiante doivent être réalisés au plus tard : - le 31 décembre 2003 pour les IGH et les ERP classé de la première à la quatrième catégorie ; - le 31 décembre 2005 pour les autres bâtiments.\nL\'objectif du repérage est d\'identifier et de localiser les matériaux contenant de l\'amiante incorporés dans les établissements et susceptible de libérer des fibres d\'amiante en cas d\'agression mécanique résultant de l\'usage des locaux (chocs et frottements) ou générée à l\'occasion d\'opérations d\'entretien ou de maintenance.\nDiagnostic obligatoire concernant la recherche : - de calorifugeages contenant de l\'amiante dans les bâtiments dont le permis de construire\n a été délivré avant le 29 juillet 1996 ; - de flocages dans les bâtiments dont le permis de construire a été délivré avant le 1er janvier 1980; \n- de faux plafonds contenant de l\'amiante dans les bâtiments dont le permis de construire a été délivré  avant le 1er juillet 1997.\n\nDepuis le 1er janvier 2013, les repérages des matériaux et produits des listes A, B et C contenant de l’amiante et les rapports de repérage correspondants \ndoivent être réalisés conformément aux dispositions des 2 arrêtés du 12 décembre 2012 (un arrêté pour la liste A et l\'autre pour la liste B) et de \nl\'arrêté du 26 juin 2013 pour la liste C. Il n’est plus possible d’effectuer ces repérages selon les anciennes modalités qui ont été abrogées par les\n arrêtés pré-cités.",null),
("44","(Décret n° 88-1056 du 14 novembre 1988 et publication UTE C 18-510 approuvée par l\'Arrêté du 17 janvier 1989)\nDécret 2010-1016 fixant les obligations des employeurs (art.R.4226-1 à 21 du CdT)\nDécret 2010-1018 relatif à la prévention des risques électriques (art R.4324-21 / R.4535-11 et 12 / R.4722-26 à 30 /R.4724-19 du CdT)\nDécret 2010-1118 relatif aux opérations effectuées sur les installations électriques ou dans leur voisinage (art R.4544-1 à 11 du CdT)\nDocument délivré par l\'Autorité Territoriale aux agents habilités à effectuer des travaux sur ou à proximité des matériels et installations électriques.\nL’habilitation atteste que l’agent est techniquement qualifié, est apte médicalement et a reçu une formation adéquate.\nArt.R.4544-1 du CdT: \"  Les opérations sur les installations électriques ou dans leur voisinage ne peuvent être effectuées que par des travailleurs habilités\"\nArt.R.4544-10 du CdT:\"... L\'employeur délivre, maintient ou renouvelle l\'habilitation selon les modalités contenues dans les normes mentionnées à l\'article R.4544-3...\null,null),
("45","Art.R.4411-73 du CdT. \nLe fabricant ou l\'importateur d\'une substance ou préparation dangereuse fournit au destinataire de cette substance ou préparation une fiche de données de sécurité. \nPrésence des FDS (Fiches de Données de Sécurité) relatives aux produits chimiques sur les lieux de travail et possibilité d’y avoir accès pour les travailleurs \nA collecter auprès des fournisseurs pour l’ensemble des produits utilisés. Elles permettent de connaître les risques et les consignes de sécurité au poste et elles sont utiles en cas d’accident et lors de l’appel des secours ou du centre anti-poison. Veiller à leur mise à jour régulière, tous les 3 ans environ et lors de l’achat de nouveaux produits",null),
("46","Art.R.4412-39 du CdT:\nL\'employeur établit une notice, dénommée notice de poste, pour chaque poste de travail ou situation de travail exposant les travailleurs à des agents chimiques dangereux. Cette notice, actualisée en tant que de besoin, est destinée à informer les travailleurs des risques auxquels leur travail peut les exposer et des dispositions prises pour les éviter.\nLa notice rappelle les règles d\'hygiène applicables ainsi que, le cas échéant, les consignes relatives à l\'emploi des équipements de protection collective ou individuelle.",null),
("47","Décret n° 2011-1241 du 5 octobre 2011 relatif à l\'exécution de travaux à proximité de certains ouvrages souterrains, aériens ou subaquatiques de transport ou de distribution: \nLe décret fixe les règles de déclaration préalable aux travaux, applicables au maître d\'ouvrage (déclaration de projet de travaux) et à l\'exécutant des travaux (déclaration d\'intention de commencement de travaux).\nIl définit les règles de préparation des projets de travaux, dans le but de fournir aux exécutants de travaux des informations précises sur la localisation des réseaux et sur les précautions à prendre en cas de travaux dans leur voisinage immédiat.\nIl impose aux exploitants de réseaux d\'apporter des réponses circonstanciées aux déclarations préalables, de mettre en œuvre une cartographie précise de tous les réseaux neufs et d\'améliorer progressivement celle des réseaux existants, et d\'anticiper les situations accidentelles sur les chantiers de travaux.\nIl encadre les techniques de travaux appliquées à proximité immédiate des réseaux et prévoit une obligation d\'autorisation d\'intervention à proximité des réseaux pour certains intervenants en amont des travaux et au cours de leur exécution.\nIl définit les modalités d\'arrêt des travaux en cas de danger et encadre certaines clauses des marchés entre maître d\'ouvrage et exécutant des travaux.\nIl fixe enfin les sanctions applicables en cas d\'infraction aux dispositions qu\'il prévoit.",null),
("48","Arrêté du 08/10/87 relatif au contrôle périodique des installations d\'aération et d\'assainissement des locaux de travail :\n\n- Local à pollution non spécifique  (bureaux, locaux de restauration...): examen et contrôle du débit d\'air neuf par une personne compétente (annuelle)\n- Local à pollution spécifique : \n• sans recyclage de l\'air, examen et contrôle des débit d\'air extrait et relevé des pressions statique par une personne compétente (annuelle)\n• avec recyclage de l\'air, contrôle de la concentration en poussières ou polluants (tous les 6 mois)",null),
("49","Art.1 à 7 de l\'Arrêté du 29/12/2010: \n\nEtablissements assujettis au CdT :\n• essai et vérification : \n-des portes palières par entreprise spécialisée (6 semaines); \n-des portes et dispositifs de sécurité par personne qualifiée (quotidienne); \n-des organes de levage par personne qualifiée (semestrielle); -des parachutes par personne qualifiée (annuelle)\n• contrôle technique de l\'installation par organisme agréé (5 ans) (décret 23/04/45)\n\nEtablissements recevant du public (ERP):\n• examen de conformité de l\'installation : entreprise spécialisée ou organisme agréé (annuelle)\n• dispositifs de sécurité et de vitesse : entreprise spécialisée ou organisme agréé (annuelle)\n• câbles et chaînes de suspension : entreprise spécialisée (tous les 6 mois) (Arrêté du 25 juin 1980)\n",null),
("50","Art.R.4323-22 du CdT - arrêté du 1er mars 2004:\n - Vérification à la mise en service et lors d’une remise en service après démontage, remontage ou remplacement, réparation ou transformation importante des organes essentiels de l’appareil,\n - Vérifications périodiques :\nAnnuelle : appareils fixes ; \nSemestrielles : appareils mobiles mus mécaniquement (chariots automoteurs à conducteur porté), appareils conçus pour le transport des personnes ou aménagés pour déplacer en élévation le poste de travail s’ils sont mus mécaniquement, câbles d’ascenseur.\n\n(Arrêté du 9/06/93 modifié, Arrêté du 27/07/61)\nAppareils de levage : Cric ; palan ; bras ou portiques de levage pour bennes amovibles ; engins de terrassement équipés pour le levage ;\nAppareils pour l’élévation de postes de travail mus à la main : Échafaudage volant.\nAccessoires de levage : Chaînes, câbles cordages\n\nLes accessoires de levage doivent être soumis tous les douze mois à une vérification périodique comportant un examen ayant pour objet de vérifier le bon état de conservation de l\'accessoire de levage et notamment de déceler toute détérioration, telle que déformation, hernie, étranglement, toron cassé, nombre de fils cassés supérieur à celui admissible, linguet détérioré, ou autre limite d\'emploi précisée par la notice d\'instructions du fabricant, susceptible d\'être à l\'origine de situations dangereuses.",null),
("51","Art.R.224-31 du code de l\'environnement:\nL\'exploitant d\'une chaudière mentionnée à l\'article R. 224-21 doit faire réaliser un contrôle périodique de l\'efficacité énergétique de celle-ci par un organisme accrédité dans les conditions prévues par l\'article R. 224-37.\nArt.R.224-35 et 36:\nLa période entre deux contrôles ne doit pas excéder deux ans. Les chaudières neuves font l\'objet d\'un premier contrôle périodique dans un délai de deux ans à compter de leur installation.\nLorsque la chaudière contrôlée n\'est pas conforme aux obligations prévues aux articles R. 224-22 à R. 224-29, l\'exploitant auquel incombe l\'obligation en cause est tenu de prendre les mesures nécessaires pour y remédier dans un délai de trois mois à compter de la réception du rapport de contrôle.\n\nContrôle périodique des installations consommant de l’énergie thermique : tous les 3 ans.\nAppareils de cuissons : tous les ans.\nVérification à consigner dans le registre de sécurité.\nContrôles:  appareils de mesure et de régulation, - combustion et mesures de rendement énergétique, - émissions polluantes, - état du matériel",null),
("52","arrêté du 21/12/2004 art 4:\n• Echafaudages  : vérification du bon état de conservation par une personne compétente (avant opération de montage et tous les trimestres)  \n- art R4323-69 du CdT:\"Les échafaudages ne peuvent être montés, démontés ou sensiblement modifiés que sous la direction d\'une personne compétente et par des travailleurs qui ont reçu une formation adéquate et spécifique aux opérations envisagées.\" \n• Echelles : vérification de l\'état de conservation et de l\'appropriation de l\'échelle aux contraintes d\'utilisation par l\'employeur (avant toute utilisation et à la suite de toute utilisation)",null),
("53","Décret n°88-1056 du 14/11/88 et Arrêté du 20/12/88:\nArt.R.4226-14 et suivants du CdT:\n• Installations électriques : vérification de l\'état de conformité par une personne qualifiée et compétente dans les domaines de la vérification et de prévention des risques dus à l\'électricité (annuelle)\n• Circuits et installations de sécurité : vérification de l\'état de conformité par une personne qualifiée et compétente dans les domaines de la vérification et de prévention des risques dus à l\'électricité (annuelle)\n• Groupes électrogènes de sécurité : vérification par une personne qualifiée (tous les 15 j.) essai par une personne qualifiée (mensuelle).\n•Vérification de la conformité de l\'ensemble de l\'installation en service par une personne qualifiée et compétente dans les domaines de la vérification et de prévention des risques électriques (annuelle)",null),
("54","Décret 99-1046 du 13/12/99 et arrêté du 15 mars 2000)\nIl existe deux types de contrôles réglementaires :\n- Les inspections périodiques tous les 40 mois (vérification documentaire, visite interne et externe, vérification des accessoires de sécurité)\nAttention : les récipients à pression simples construits suivant la directive 87-404 CE ayant une pression PMS < =10 bar et un volume V <= 100 litres ont une périodicité d’inspection périodique de 5 ans.\n- Les requalifications périodiques tous les 10 ans (vérification documentaire, visite interne et externe, épreuve, vérification des accessoires de sécurité).\nLa réglementation sur les appareils à pression est complexe et distingue notamment les appareils à pression de gaz et de vapeur, les générateurs, les récipients et les tuyauteries. Les visites et épreuves peuvent varier selon les pressions mises en oeuvre, les volumes et les contenus. S’adresser auprès des services de la DREAL pour tout complément d\'information.\nLes réservoirs installés à bord des camions ou véhicules routiers sont également soumis à ces dispositions.",null),
("55","Art.R.4323-99 du CdT:\n« Des arrêtés des ministres chargés du travail ou de l\'agriculture déterminent les équipements de protection individuelle et catégories d\'équipement de protection individuelle pour lesquels l\'employeur procède ou fait procéder à des vérifications générales périodiques afin que soit décelé en temps utile toute défectuosité susceptible d\'être à l\'origine de situations dangereuses ou tout défaut d\'accessibilité contraire aux conditions de mise à disposition ou d\'utilisation déterminées en application de l\'art. R. 4323-97. Ces arrêtés précisent la périodicité des vérifications et, en tant que de besoin, leur nature et leur contenu. »\n\nArrêté du 19 mars 1993 fixant la liste des équipements de protection individuelle qui doivent faire l\'objet des vérifications générales périodiques prévues à l\'article R.4323-99 du code du travail:\nSans préjudice de la vérification à chaque utilisation du maintien en état de conformité des équipements de protection individuelle faite en application de l\'article R.4323-97 du code du travail, les équipements de protection individuelle suivants, en service ou en stock, doivent avoir fait l\'objet, depuis moins de douze mois au moment de leur utilisation, de la vérification générale périodique prévue à l\'article R.4323-99 du code du travail:\n\n- appareils de protection respiratoire autonomes destinés à l\'évacuation;\n- appareils de protection respiratoire et équipements complets destinés à des interventions accidentelles en milieu hostile;\n- gilets de sauvetage gonflables;\n- systèmes de protection individuelle contre les chutes de hauteur;\n- stocks de cartouches filtrantes antigaz pour appareils de protection respiratoire. ",null),
("56","Décret 93-40 du 11 janvier 1993:\nPour les équipements de travail en service avant le 01/01/93, la collectivité doit établir un plan de mise en conformité et faisant partie intégrante du programme annuelle de prévention. Il est recommandé de confier le contrôle et la mise en conformité de tous les équipements de travail vétuste à un organisme ou une entreprise spécialisée exerçant régulièrement cette activité.\nDepuis le 1er janvier 1997, les machines et équipements de travail en service dans les collectivités avant le 1er janvier 1993 ne pourront être maintenus en service dans la même collectivité que s’ils sont conformes aux prescriptions techniques d’utilisation (art 7 du décret n°93-40). Les articles R.4324-1 à R.4324-22, R.4312-23 du CdT précisent ces prescriptions techniques d’utilisation",null),
("57","Art.R.4227-34 à R.4227-39 du CdT. et Arrêté du 04/11/93:\n• Extincteurs : vérification de conformité (visibilité, accessibilité, aptitude à remplir sa fonction) et maintien de conformité par un installateur qualifié ou organisme vérificateur (annuelle);\n• Robinets d\'incendie armés (RIA) : contrôle visuel par une personne compétente (mensuelle); vérification approfondie par un installateur qualifié ou organisme vérificateur (annuelle); révision par un installateur qualifié ou organisme vérificateur (tous les 5 ans);\n• Exutoires de fumée : essai par une personne compétente (mensuelle); vérification par une personne compétente (annuelle);\n• Système d\'alarme acoustique et lumineux : vérification par une personne compétente (annuelle);\n• Installations de détection incendie : examen, inspection et essai de fonctionnement par un installateur agréé APSAD ou organisme agréé APSAD (semestrielle);\n• Registre de sécurité pour ERP: Consignation des vérifications et de l’entretien du matériel incendie et des installations techniques, des travaux, des visites de la commission de sécurité.\n\n",null),
("58","Depuis le 1er janvier 1992, le contrôle technique périodique des véhicules automobiles légers (VL) est obligatoire en France. Cette obligation fait suite à un arrêté du 18 juin 1991 réglementé par le Code de la route. Cette obligation est destinée à renforcer et à améliorer la sécurité des automobilistes sur la route.\n• VL (y compris les véhicules utilitaires) dont le PTAC <3,5 tonnes : contrôle par un centre de contrôle technique agréé (6 mois avant la date du 4ème anniversaire de leur première mise en circulation, puis tous les 2 ans)\n• Véhicules de moins de 10 places, conducteur compris, affectés au transport public de personnes : contrôle par un centre de contrôle technique agréé (annuelle)\n\nArrêté du 24 avril 2017 modifiant l\'arrêté du 27 juillet 2004 relatif au contrôle technique des véhicules lourds: \nLe véhicule lourd doit être présenté au contrôle technique :6 mois après la mise en circulation pour les véhicules de TCP, puis 6 mois après chaque visite technique périodique ;\n1 an après l\'immatriculation pour les autres véhicules ;\n• PL de transport de marchandises dont le PTAC >3,5 tonnes : contrôle des véhicules automobiles, des remorques et semi-remorques, des matériels de travaux publics dès lors qu\'ils présentent un caractère routier prédominant, des bennes à ordures ménagères, des véhicules et appareils agricoles, des matériels de travaux publics par un centre de contrôle DREAL (annuelle).\n\n",null),
("59","Arrêté du 21/12/1993 et décret 92-233 du 31 mars 1992, Art.R.4323-12 et Art.R.4224-12 du CdT. Norme NF P25 362 remplacée par NF EN 13241-1\nL’article R.4224-12 du CdT rend l’entretien et le contrôle régulier des portes et portails obligatoires.\nL’article R.4224-13 impose, dans le cas des portes et portails auto et semi-auto,des exigences supplémentaires définies dans l’arrêté du 21 décembre 1993. \n\nL’article 9 de cet arrêté précise ainsi que : Les portes et portails auto et semi-auto doivent être entretenues semestriellement,  par des personnes compétentes dûment qualifiées appartenant à l’entreprise ou un prestataire extérieur lié par un contrat écrit.  Les éléments à vérifier lors des visites sont précisés à l’article 9.  Les interventions sont consignées dans un livret d’entretien. \nLa commande par impulsion est définie comme étant un “dispositif de commande qui nécessite une action momentanée pour initier le mouvement”. La commande par impulsion, au sens du référentiel européen, est donc équivalente à la notion de fermeture semi-automatique de la norme NF P 25-362. Ainsi, pour qu’une porte soit à commande par impulsion, son ouverture et sa fermeture doivent être initiées par une action volontaire de l’utilisateur.",null),
("60","Arrêté du 1er juillet 2004, \nArt R.4412-25 et 26 du CdT:\nSeuls les réservoirs à sécurité renforcée cités à l’article 5 du décret du 1er juillet2004 sont autorisés à être enterrés.\nDes visites périodiques destinées à s\'assurer de l\'état des cuves, bassins et réservoirs contenant des produits corrosifs ont lieu à intervalles n\'excédant pas un an. Ces visites sont réalisées par une personne qualifiée sous la responsabilité de l\'employeur.\n\nArrêté du 22/06/1998:\nCuves enterrées simple enveloppe > 10 m3\n• Contrôle d’étanchéité tous les 5 ans et au plus tard 15 ans après la mise en service par un organisme agréé\nCuves enterrées en fosse simple paroi > 10 m3\n• Contrôle d’étanchéité tous les 5 ans et au plus tard 25 ans après la mise en service par un organisme agréé\n\n",null),
("61","L’établissement doit obtenir une attestation de conformité, délivrée par le préfet du département dans lequel l’établissement est construit, assemblé ou implanté pour la première fois (CTS 3).\nPour cela, le propriétaire ou le constructeur doit faire appel à un bureau de vérification des chapiteaux, tentes et structures (agréé par le ministère de l’Intérieur, cf p.6) au\nmoins 8 jours avant la première implantation. Ce dernier rédige un rapport qui porte sur :\n• la stabilité mécanique de l’ossature\n• la réaction au feu de l’enveloppe\nUne vignette-attestation sera apposée sur les équipements et installations vérifiés. Il est ainsi possible d’utiliser des équipements techniques – chauffage, cuisson, électricité,\ntribunes, gradins – vérifiés ailleurs, dans la mesure où ils sont munis d’une vignette en cours de validité. La solidité des constructions, les installations de chauffage et d’électricité, les moyens de secours doivent être vérifiés par un organisme de contrôle agréé.\nVéritable carte d’identité du chapiteau ou du CTS, le registre de sécurité a pour objectif central d’assurer que structures, équipements et installations ont été fabriqués et entretenus conformément à la réglementation en vigueur (CTS 30).\nLe registre de sécurité doit être maintenu à jour par le propriétaire. Il doit comprendre :\n• l\'attestation de conformité\n• le plan de base et la photographie de l\'établissement (avec ses extensions possibles)\n• une partie relative à l’exploitation, tenue à jour par le propriétaire, attestant notamment des vérifications \nL\'assemblage de l’établissement, l’état apparent des toiles, des tribunes et des gradins doivent être vérifiés une fois tous les deux ans par un bureau de vérification des chapiteaux, tentes et structures.\nLes installations électriques propres à l’établissement doivent être vérifiées tous les ans.",null),
("62","Art.L.4121-1 à 3 et R.4141-3 du CdT:\nLa formation à la sécurité a pour objet d\'instruire le travailleur des précautions à prendre pour assurer sa propre sécurité et, le cas échéant, celle des autres personnes travaillant dans l\'établissement.\nElle porte sur :1° Les conditions de circulation dans l\'entreprise ; 2° Les conditions d\'exécution du travail ; 3° La conduite à tenir en cas d\'accident ou de sinistre.\nElle concerne:\n- nouveaux embauchés (titulaires, contractuels...)\n- modification de situation de travail, \n- après accident travail grave, \n- existence d\'un danger grave révélé, \n- suite à des accidents de même nature répétés.\n(Décret n° 85-603 modifié)\n",null),
("63","Art.L.4141-1 à 4, L.4142-1 à 4, L.4143-1, L.4154-2 & 4 et L.4522-2 du CdT:\nA la charge de l\'employeur, cette formation à la sécurité doit être répétée périodiquement (art L.4141-1 et 2 du CdT). Elle nécessite donc le besoin de mettre en place un plan de formation \nLa loi du 19 février 2007 relative à la Fonction Publique Territoriale réaffirme le caractère obligatoire (art-7 de la loi) du plan de formation. Elle renforce la nécessité pour une collectivité de disposer d’un plan de formation.",null),
("64","Décret 85-603 modifié et Art.R.4227-39 du CdT:\nDans un établissement où peuvent se trouver occupées ou réunies plus de 50 personnes ainsi que ceux où sont manipulées des matières inflammables, le personnel doit savoir reconnaître un signal sonore d’alarme générale, se servir des moyens de premiers secours et exécuter les diverses manœuvres nécessaires",null),
("65","Art.13 du décret n°85-603 modifié et R.4141-17, R.4224-14, R.4224-15, D.4711-1 du CdT et Arrêté du 24 juillet 2007 modifié et Arrêté du 6 novembre 2009:\n \nL\'autorité territoriale ayant une obligation de résultat en matière de santé et de sécurité au travail, l’obligation de formation des agents de la FPT au secourisme est issue du décret susvisé qui stipule que « dans chaque service où sont exécutés des travaux dangereux, un ou plusieurs agents doivent avoir reçu obligatoirement l\'instruction nécessaire pour donner les premiers secours en cas d\'urgence ».\n\nDe plus, le CdT stipule que « la formation à la sécurité sur les dispositions à prendre en cas d\'accident ou de sinistre a pour objet de préparer le travailleur à la conduite à tenir lorsqu\'une personne est victime d\'un accident ou d\'une intoxication sur les lieux du travail ».",null),
("66","Art.L.4121-1 du CdT:\nL\'employeur prend les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs.\nCes mesures comprennent :\n1° Des actions de prévention des risques professionnels ;\n2° Des actions d\'information et de formation ;\n3° La mise en place d\'une organisation et de moyens adaptés.\nL\'employeur veille à l\'adaptation de ces mesures pour tenir compte du changement des circonstances et tendre à l\'amélioration des situations existantes.\n\nArticle 6 du Décret 85-603 modifié:\nEn application du 2° de l\'article 1er de la loi du 12 juillet 1984 une formation pratique et appropriée en matière d\'hygiène et de sécurité est organisée :\nLors de l\'entrée en fonctions des agents;\nLorsque par suite d\'un changement de fonctions, de techniques, de matériel ou d\'une transformation des locaux, les agents se trouvent exposés à des risques nouveaux ;\n\nArt.R.4541-8 du CdT : Manutentions manuelles (Gestes et Postures, PRAP) \nArt.R.4542-16 du CdT : Ecrans de visualisation \nArt.R.4436-1 du CdT : Bruit (si > à 80 dbA sur 8h) \nArt.R.4447-1 du CdT : Vibrations \nArt.R.4323-69 du CdT : Échafaudage\nArt.R.4323-104 et 106 du CdT : EPI\nArt.R.4323-1 à 3 du CdT : Maintenance et mise en œuvre des équipements de travail \nArt 13 du décret n°85-603 modifié : Premiers secours (PSC1 ou Sauveteur Secouriste du Travail) \nArt.R.4227-28 et 39 du CdT : Maniement des extincteurs et exercices d’évacuation\nArrêté du 02 décembre 1998 : Equipements de travail mobiles automoteurs ou servant au levage de charges\nArt.R.4544-9 et 10 du CdT : Habilitation électrique :H0BO, BS/BE, B1, B2, BR, BC\nInstruction interministérielle sur la signalisation routière, Livre I, Partie 8 : Signalisation temporaire de chantier \nArt.R.4412-38 du CdT et Art.R.4412-87 et 88 du CdT : Agents Chimiques Dangereux (ACD) et Cancérogènes, Mutagènes, Reprotoxiques (CMR) \nArt.R.4412-117 et 141 du CdT : Amiante\nArt.R.4425-6 et 7 du CdT : Risques Biologiques\nArrêté du 22 décembre 2015 : Intervention à proximité des réseaux (AIPR)\nArt.R.4462-27 et 28 du CdT : Opérations pyrotechniques et maniement d’explosifs \nRèglement CE 852/2004 - Annexe II Chapitre XII : Hygiène et sécurité alimentaire (HACCP)\nArt.R.2223-40 à 55 du code général des Collectivités Territoriales : Prestations funéraires \nArt.R.4141-13 du CdT : Collecte des déchets ménagers et assimilés\nArrêté du 26 mars 2012 - Art. 26 Arrêté du 27 mars 2012 - Annexe 1 : Formation des agents des déchetteries \n...",null),
("67","Art.R.4323-55 à 57 du CdT et arrêté du 2/12/98:\nRecenser les équipements concernés par une formation de conduite en sécurité: Engins de chantier, grues à tour, grues mobiles, Plates-formes Elévatrices Mobiles de Personnes (PEMP), grues auxiliaires de chargement de véhicules.\nCette formation rentre en compte dans l\'autorisation de conduite que doit délivrer l\'autorité territoriale à chaque conducteur.  Le certificat délivré par le formateur ou l\'organisme de formation spécialisé (certificat d’aptitude à la conduite d’engins en sécurité ou CACES) atteste d’un contrôle des connaissances et savoir-faire en matière de conduite en toute sécurité.\nCACES 1: Tracteur <50CV\nCACES 4: Chargeuse-Pelleteuse\nCACES 8: Tracteur >50CV\nCACES PEMP: Plate-forme élévatrice mobile de personne",null),
("68","Applicable depuis le 1er janvier 2016, il porte l’obligation de la délivrance de l’AIPR au 1er janvier 2018. Celle-ci concerne les maîtres d’ouvrage, maîtres d’œuvre et géomètres pour la partie conception, les encadrants de chantiers ou techniques et enfin certains profils opérateurs.\nL’obligation s’applique à toutes les entreprises concernées par les travaux à proximité des réseaux aériens, enterrés ou subaquatiques (Bâtiment, Travaux Publics, …) dans les différentes catégories (Electricité, gaz, eau potable, assainissement, réseaux de télécommunication, …). \nLa collectivité peut dès le 18 Janvier 2016 y préparer son personnel et anticiper cette nouvelle obligation. Elle a le choix entre tester directement ses collaborateurs, ou leur proposer une formation préalable. ",null),
("69","Arrêté du 7 février 2012 JORF n°0046 du 23 février 2012 , article1 :\n\"Il est créé un certificat individuel pour l’activité “utilisation à titre professionnel des produits phytopharmaceutiques” dans les catégories “applicateur” en collectivités territoriales et “applicateur opérationnel” en collectivités territoriales.\"\n\nDepuis le 9 octobre 2013, un \"certificat à l\'utilisation professionnel et la distribution de certains types de produits biocides destinés exclusivement aux professionnels\", ou certibiode, a été créé afin de permettre une utilisation plus sûre et plus efficace des produits biocides et de responsabiliser les entreprises concernées.\nL\'obtention du certificat pour exercer ces activités est obligatoire au 1e juillet 2015.\n\n La durée de validité des certificats individuels est de 5 ans.",null),
("70","Art.R.4323-1 à 3 du CdT:\nL\'employeur informe de manière appropriée les travailleurs chargés de l\'utilisation ou de la maintenance des équipements de travail : \n1° De leurs conditions d\'utilisation ou de maintenance ; \n2° Des instructions ou consignes les concernant notamment celles contenues dans la notice d\'instructions du fabricant ; \n3° De la conduite à tenir face aux situations anormales prévisibles ; \n4° Des conclusions tirées de l\'expérience acquise permettant de supprimer certains risques.\n\nL\'employeur informe de manière appropriée tous les travailleurs de l\'établissement des risques les concernant dus :\n1° Aux équipements de travail situés dans leur environnement immédiat de travail, même s\'ils ne les utilisent pas personnellement ;\n2° Aux modifications affectant ces équipements.\n\nLa formation à la sécurité dont bénéficient les travailleurs chargés de l\'utilisation ou de la maintenance des équipements de travail est renouvelée et complétée aussi souvent que nécessaire pour prendre en compte les évolutions de ces équipements.",null),
("71","Un décret prévoit, depuis 1997, l\'interdiction de l\'amiante (quelle que soit la variété de fibres considérée) et des produits en contenant.\nAfin de protéger les travailleurs contre les risques liés à l\'inhalation de poussières d\'amiante dans le cadre de leur activité professionnelle, outre l\'application des dispositions du CdT relatives à la prévention du risque d’exposition à des agents chimiques cancérogènes, mutagènes ou toxiques pour la reproduction (CMR), des dispositions particulières du CdT visent :\nles travaux de retrait et d’encapsulage de l\'amiante, dits de « Sous-section 3 »,\nles interventions sur des matériaux ou appareils susceptibles de libérer des fibres d\'amiante, dites de « Sous-section 4 ».\nLes travailleurs susceptibles d’être exposés à l’amiante doivent au préalable recevoir une formation spécifique amiante adaptée à la nature de l’opération et à leur fonction (arrêté du 23 février 2012). Ils sont soumis à une surveillance médicale renforcée et peuvent demander à bénéficier d’une surveillance post-professionnelle après avoir cessé leur activité. ",null),
("72","Art.R.4224-14 et R.4224-23 du CdT:\nLes lieux de travail sont équipés d\'un matériel de premiers secours adapté à la nature des risques et facilement accessible.\nLe matériel de premiers secours fait l\'objet d\'une signalisation par panneaux.\n",null),
("73","Art.D.4711-1 du CdT:\n- des numéros d\'urgence: Les coordonnées des services de secours d’urgence (CT ) ;\nArt.R.4227-28 et suivants du CdT:\nArt.R.4227-37 du CdT :\n\" Dans les établissements mentionnés à l\'article R. 4227-34 (établist plus de 50 pers)\n - consigne en cas d\'incendie: (une consigne de  sécurité incendie est établie et affichée de manière très apparente);\n - adresse et numéro d’appel du médecin de prévention ou d’un médecin de proximité;\n - liste nominative des Sauveteurs Secouristes du Travail (SST);\nArt.R.4121-4 du CdT:\n- Le document unique : Les salariés doivent être informé des modalités d\'accès au document unique d\'évaluation des risques;\n - Coordonnées des membres du comité et comptes rendus des réunions (CT/CHSCT).",null),
("74","Art.R.4227-28, 29, 39 et 45 du CdT:\nL\'employeur prend les mesures nécessaires pour que tout commencement d\'incendie puisse être rapidement et efficacement combattu dans l\'intérêt du sauvetage des travailleurs.\nLe premier secours contre l\'incendie est assuré par des extincteurs en nombre suffisant et maintenus en bon état de fonctionnement.\nIl existe au moins un extincteur portatif à eau pulvérisée d\'une capacité minimale de 6 litres pour 200 mètres carrés de plancher.\nIl existe au moins un appareil par niveau.\nLorsque les locaux présentent des risques d\'incendie particuliers, notamment des risques électriques, ils sont dotés d\'extincteurs dont le nombre et le type sont appropriés aux risques.\n\nL’arrêté du 2 mars 1995 relatif à l\'équipement en extincteurs des véhicules de transport de marchandises définit les obligations en la matière.\nEn France, seuls les véhicules d’un PTAC supérieur à 3,5 tonnes, ainsi que l’ensemble des véhicules affectés au transport de matières dangereuses, doivent être munis d’extincteurs. Il reste pourtant le seul accessoire salvateur en cas d\'incendie. \n\nArt.R.4324-45 du CdT:\nLes équipements de travail mobiles automoteurs qui, par eux-mêmes ou du fait de leurs remorques ou de leur chargement, présentent des risques d\'incendie sont munis de dispositifs de lutte contre l\'incendie, sauf si le lieu d\'utilisation en est équipé à des endroits suffisamment rapprochés.",null),
("75","Art.R.4543-20 du CdT:\n\" Un travailleur isolé ne peut réaliser des interventions ou travaux qui : \n1° Comportent le port manuel d\'une masse supérieure à 30 kg, la pose ou la dépose manuelle d\'éléments d\'appareils d\'une masse supérieure à 50 kg, ou la pose ou la dépose des câbles de traction d\'ascenseur ;  \n2° Exigent le port d\'un équipement de protection individuelle respiratoire isolant ou filtrant à ventilation assistée\" , Art.R4543-21: \"....\" )\n\nArt.R.4543-19 du CdT:\nUn travailleur isolé doit pouvoir signaler toute situation de détresse et être secouru dans les meilleurs délais.\n\nLa notion de travailleur isolé n’est pas définie réglementairement. Nous pouvons néanmoins nous appuyer sur la définition suivante : « un agent est considéré comme travailleur isolé lorsqu’il est hors de vue ou de portée de voix des autres, dans la plupart des cas pour des durées de plus d’une heure. Cependant, pour des travaux dangereux, la notion de travailleur isolé sera prise en compte même pour quelques minutes »",null),
("76","Art.R.4543-19 du CdT:\n \" Un travailleur isolé doit pouvoir signaler toute situation de détresse et être secouru dans les meilleurs délais.\"\n",null),
("77","Décret n° 2009-1272 du 21 octobre 2009 relatif à l\'accessibilité des lieux de travail aux travailleurs handicapés:\n« Art.R. 4214-26.-Les lieux de travail, y compris les locaux annexes, aménagés dans un bâtiment neuf ou dans la partie neuve d\'un bâtiment existant sont accessibles aux personnes handicapées, quel que soit leur type de handicap. \n« Les lieux de travail sont considérés comme accessibles aux personnes handicapées lorsque celles-ci peuvent accéder à ces lieux, y circuler, les évacuer, se repérer, communiquer, avec la plus grande autonomie possible. \n« Les lieux de travail sont conçus de manière à permettre l\'adaptation des postes de travail aux personnes handicapées ou à rendre ultérieurement possible l\'adaptation des postes de travail.",null),
("78","Art.R.4321-1 à 4 du CdT:\n -  L\'employeur met à la disposition des travailleurs les équipements de travail nécessaires, appropriés au travail à réaliser ou convenablement adaptés à cet effet, en vue de préserver leur santé et leur sécurité.\n -  L\'employeur choisit les équipements de travail en fonction des conditions et des caractéristiques particulières du travail. Il tient compte des caractéristiques de l\'établissement susceptibles d\'être à l\'origine de risques lors de l\'utilisation de ces équipements.\n -  L\'employeur met à la disposition des travailleurs, en tant que de besoin, les équipements de protection individuelle appropriés et, lorsque le caractère particulièrement insalubre ou salissant des travaux l\'exige, les vêtements de travail appropriés. Il veille à leur utilisation effective.",null),
("79","Art.R.4321-4 du CdT:\nL\'employeur met à la disposition des travailleurs, en tant que de besoin, les équipements de protection individuelle appropriés et, lorsque le caractère particulièrement insalubre ou salissant des travaux l\'exige, les vêtements de travail appropriés. Il veille à leur utilisation effective.\n\nArt.L.4122-1 du CdT:\n - Conformément aux instructions qui lui sont données par l\'employeur, dans les conditions prévues au règlement intérieur pour les entreprises tenues d’en élaborer un, il incombe à chaque travailleur de prendre soin, en fonction de sa formation et selon ses possibilités, de sa santé et de sa sécurité ainsi que de celles des autres personnes concernées par ses actes ou ses omissions au travail.\nLes instructions de l’employeur précisent, en particulier lorsque la nature des risques le justifie, les conditions d\'utilisation des équipements de travail, des moyens de protection, des substances et préparations dangereuses. Elles sont adaptées à la nature des tâches à accomplir.\n - Les dispositions du premier alinéa sont sans incidence sur le principe de la responsabilité de l’employeur.",null),
("80","Art.R.4323-95 du CdT:\nLes équipements de protection individuelle et les vêtements de travail mentionnés à l\'article R.4321-4 sont fournis gratuitement par l\'employeur qui assure leur bon fonctionnement et leur maintien dans un état hygiénique satisfaisant par les entretiens, réparations et remplacements nécessaires. \nCes dispositions ne font pas obstacle aux conditions de fournitures des équipements de protection individuelle prévues par l\'article L.1251-23, pour les salariés temporaires.\nArt.R.4323-96 du CdT:\nLes équipements de protection individuelle sont réservés à un usage personnel dans le cadre des activités professionnelles de leur attributaire.\nToutefois, si la nature de l\'équipement ainsi que les circonstances exigent l\'utilisation successive de cet équipement de protection individuelle par plusieurs personnes, les mesures appropriées sont prises pour qu\'une telle utilisation ne pose aucun problème de santé ou d\'hygiène aux différents utilisateurs.\nArt.R.4323-97 du CdT:\nL\'employeur détermine, après consultation du comité d\'hygiène, de sécurité et des conditions de travail, les conditions dans lesquelles les équipements de protection individuelle sont mis à disposition et utilisés, notamment celles concernant la durée de leur port. Il prend en compte la gravité du risque, la fréquence de l\'exposition au risque, les caractéristiques du poste de travail de chaque travailleur, et les performances des équipements de protection individuelle en cause.\n\n\n\n",null),
("81","Art.R.4323-104 du CdT:\nL\'employeur informe de manière appropriée les travailleurs devant utiliser des équipements de protection individuelle :\n1° Des risques contre lesquels l\'équipement de protection individuelle les protège ;\n2° Des conditions d\'utilisation de cet équipement, notamment les usages auxquels il est réservé ;\n3° Des instructions ou consignes concernant les équipements de protection individuelle ;\n4° Des conditions de mise à disposition des équipements de protection individuelle.\n\nArt.R.4323-106 du CdT:\nL\'employeur fait bénéficier les travailleurs devant utiliser un équipement de protection individuelle d\'une formation adéquate comportant, en tant que de besoin, un entraînement au port de cet équipement.\nCette formation est renouvelée aussi souvent que nécessaire pour que l\'équipement soit utilisé conformément à la consigne d\'utilisation.\n\n",null),
("82","Art.R.4323-104 du CdT:\nL\'employeur informe de manière appropriée les travailleurs devant utiliser des équipements de protection individuelle :\n1° Des risques contre lesquels l\'équipement de protection individuelle les protège ;\n2° Des conditions d\'utilisation de cet équipement, notamment les usages auxquels il est réservé ;\n3° Des instructions ou consignes concernant les équipements de protection individuelle ;\n4° Des conditions de mise à disposition des équipements de protection individuelle.\n\nArt.R.4323-105 du CdT:\nL\'employeur élabore une consigne d\'utilisation reprenant de manière compréhensible les informations mentionnées aux 1° et 2° de l\'article R. 4323-104. \nIl tient cette consigne à la disposition des membres du comité d\'hygiène, de sécurité et des conditions de travail ou, à défaut, des délégués du personnel, ainsi qu\'une documentation relative à la réglementation applicable à la mise à disposition et à l\'utilisation des équipements de protection individuelle concernant les travailleurs de l\'établissement.","2018-01-30"),
("83","Art.D.4153-15 du CdT:\nLes dispositions de la présente section définissent les travaux interdits aux jeunes âgés d\'au moins quinze ans et de moins de dix-huit ans en application de l\'article L. 4153-8 ainsi que les travaux interdits susceptibles de dérogation en application de l\'article L.4153-9.\nTravaux portant atteinte à l\'intégrité physique ou morale\nTravaux exposant à des agents chimiques dangereux\nTravaux exposant à des agents biologiques\nTravaux exposant aux vibrations mécaniques\nTravaux exposant à des rayonnements\nTravaux en milieu hyperbare\nTravaux exposant à un risque d\'origine électrique\nTravaux comportant des risques d\'effondrement et d\'ensevelissement\nConduite d\'équipements de travail mobiles automoteurs et d\'équipements de travail servant au levage\nTravaux nécessitant l\'utilisation d\'équipements de travail\nTravaux temporaires en hauteur\nTravaux avec des appareils sous pression\nTravaux en milieu confiné\nTravaux au contact du verre ou du métal en fusion\nTravaux exposant à des températures extrêmes\nTravaux en contact d\'animaux",null),
("84","Art.L.4153-9 du CdT et les articles 5-5 à 5-12 du décret n°85-603 relatif à l\'hygiène et à la sécurité du travail dans la fonction publique territoriale\ndonnent la possibilité pour certains jeunes travailleurs, dans le cadre de leur formation professionnelle, d’être affectés à des travaux interdits susceptibles de\ndérogation pour une durée de trois ans. Pour cela, une délibération de dérogation doit être prise au préalable par l’organe délibérant de la collectivité d’accueil.",null),
("85","Article 5-5 du Décret 85-603 modifié:\nPour l\'application du présent titre, l\'autorité territoriale d\'accueil est la collectivité ou l\'établissement public qui emploie ou accueille en stage des jeunes en situation de formation professionnelle. \nL\'autorité territoriale d\'accueil peut, pour une durée de trois ans à compter de la délibération de dérogation mentionnée à l\'article 5-6, affecter des jeunes âgés d\'au moins quinze ans et de moins de dix-huit ans, se trouvant dans une des situations de formation professionnelle énumérées aux alinéas 1° à 3° de l\'article R. 4153-39 du code du travail , aux travaux interdits susceptibles de dérogation mentionnés à la section 2 du chapitre III du titre V du livre Ier de la quatrième partie réglementaire du code du travail, sous réserve de satisfaire aux conditions suivantes : \n1° Avoir procédé à l\'évaluation prévue aux articles L. 4121-3 et suivants de ce code, notamment élaboré et mis à jour le document unique d\'évaluation des risques professionnels, comprenant une évaluation des risques existants pour les jeunes et liés à leur travail ; cette évaluation est préalable à l\'affectation des jeunes à leur poste de travail ; \n2° Avoir, à la suite de cette évaluation, mis en œuvre les actions de prévention prévues au deuxième alinéa de l\'article L. 4121-3 du même code ; \n3° Avant toute affectation du jeune à ces travaux : \na) Pour l\'autorité territoriale d\'accueil, en application de l\'article 6 du présent décret, avoir informé le jeune sur les risques pour sa santé et sa sécurité et les mesures prises pour y remédier et lui avoir dispensé la formation à la sécurité en s\'assurant qu\'elle est adaptée à son âge, son niveau de formation et son expérience professionnelle ; \nb) Pour le chef d\'établissement d\'enseignement, tel que défini à l\'article R. 4153-38 du même code, lui avoir dispensé la formation à la sécurité prévue dans le cadre de sa formation professionnelle, adaptée à son âge, son niveau de formation et son expérience professionnelle et en avoir organisé l\'évaluation. \n4° Assurer l\'encadrement du jeune en formation par une personne compétente durant l\'exécution de ces travaux ; \n5° Avoir obtenu, pour chaque jeune, la délivrance d\'un avis médical relatif à la compatibilité de l\'état de santé de celui-ci avec l\'exécution des travaux susceptibles de dérogation. Cet avis médical est délivré chaque année soit par le médecin de prévention, soit par le médecin chargé du suivi médical des élèves et des étudiants ou des stagiaires de la formation professionnelle. ",null),
("86","Article 5-6 du Décret 85-603 modifié:\nPréalablement à l\'affectation des jeunes aux travaux interdits susceptibles de dérogation mentionnés à l\'article 5-5 du présent décret et sous réserve d\'avoir satisfait aux obligations prévues aux 1° et 2° de l\'article 5-5, une délibération est prise en ce sens par l\'organe délibérant de l\'autorité territoriale d\'accueil. Cette délibération précise : \n1° Le secteur d\'activité de l\'autorité territoriale d\'accueil ; \n2° Les formations professionnelles assurées ; \n3° Les différents lieux de formation connus ; \n4° Les travaux interdits susceptibles de dérogation nécessaires à la formation professionnelle et sur lesquels porte la délibération ainsi que, le cas échéant, les machines mentionnées à l\' article D. 4153-28 du code du travail dont l\'utilisation par les jeunes est requise pour effectuer ces travaux et, en cas d\'exécution de travaux de maintenance, les travaux en cause et les équipements de travail mentionnés à l\'article D. 4153-29 du même code ; \n5° La qualité ou la fonction de la ou des personnes compétentes chargées d\'encadrer les jeunes pendant l\'exécution des travaux précités. \n\nArticle 5-7 du Décret 85-603 modifié:\nLe projet de délibération prévu à l\'article 5-6 est élaboré par l\'autorité territoriale en lien avec l\'assistant ou le conseiller de prévention compétent.\nLa délibération est transmise pour information aux membres du comité d\'hygiène, de sécurité et des conditions de travail compétent et adressée, concomitamment, par tout moyen conférant date certaine, à l\'agent chargé d\'assurer les fonctions d\'inspection compétent.",null),
("87","Article 5-7 du Décret 85-603 modifié:\nLe projet de délibération prévu à l\'article 5-6 est élaboré par l\'autorité territoriale en lien avec l\'assistant ou le conseiller de prévention compétent.\nLa délibération est transmise pour information aux membres du comité d\'hygiène, de sécurité et des conditions de travail compétent et adressée, concomitamment, par tout moyen conférant date certaine, à l\'agent chargé d\'assurer les fonctions d\'inspection compétent.\n\nArticle 5-9 du Décret 85-603 modifié:\nEn cas de modification des informations mentionnées aux 1°, 2° ou 4° de l\'article 5-6, ces informations sont actualisées et communiquées à l\'agent chargé d\'assurer les fonctions d\'inspection compétent par tout moyen conférant date certaine, dans un délai de huit jours à compter des changements intervenus.\n\nArticle 5-10 du Décret 85-603 modifié:\nEn cas de modification des informations mentionnées aux 3° ou 5° de l\'article 5-6, ces informations sont tenues à la disposition de l\'agent chargé d\'assurer les fonctions d\'inspection compétent.",null),
("88","Article 5-8 du Décret 85-603 modifié:\nLa décision de dérogation est renouvelable tous les trois ans suivant la même procédure.",null),
("89","Art.R.4511-1 à R.4514-10 du CdT:\ndécret 92-158 du 20 février 1992 (circulaire DRT 93/14 du 18 mars 1993 pour application):\narrêté du 19 mars 1993 fixant liste des travaux dangereux:\nArt.R.4512-6 du CdT:\n - Dès lors que les tâches à effectuer comportent des “ travaux dangereux ” (liste définie par l’arrêté du 19 mars 1993), ou que l’opération représente un nombre total d’heures de travail prévisibles d’au moins 400 heures sur une période égale au plus à 12 mois (que les travaux soient continus ou discontinus), un plan de prévention doit obligatoirement être établi par écrit avant le début des travaux.\n - Ce plan de prévention doit comporter au moins les éléments suivants :\n. la définition des phases d’activité dangereuses et des moyens de prévention correspondants\n. l’adaptation des matériels et installations à la nature des opérations à effectuer\n. les instructions à donner au personnel\n. l’organisation mise en place pour assurer les premiers secours\n. les postes de travail qui relèvent d’une surveillance médicale spéciale\n - Pendant l’exécution des travaux, l’autorité territoriale organise avec les responsables des entreprises extérieures des  inspections et réunions périodiques afin d’assurer la coordination générale des mesures de prévention. L’autorité territoriale doit signaler aux entreprises toute situation de danger grave.",null),
("90","Art.R.4515-1 à 11 du CdT:\n(Décret n° 92-158 du 20 février 1992 et Arrêté du 26 avril 1996):\nLes opérations de chargement ou de déchargement, font l\'objet d\'un document écrit, dit « protocole de sécurité », remplaçant le plan de prévention.\nLe protocole de sécurité comprend les informations utiles à l\'évaluation des risques de toute nature générés par l\'opération ainsi que les mesures de prévention et de sécurité à observer à chacune des phases de sa réalisation.\nL’arrêté du 26 avril 1996 stipule que le protocole doit être établi :\n1) Dans le cadre d’un échange préalable à la réalisation de chaque opération\n2) Une seule fois dans le cas d’opérations répétitives.",null),
("91","Décret 92-1368 et Art.R.4532-1 à 76 du CdT:\nUne coordination en matière de sécurité et de santé des travailleurs est organisée pour tout chantier de bâtiment ou de génie civil où sont appelés à intervenir plusieurs travailleurs indépendants ou entreprises, entreprises sous-traitantes incluses, afin de prévenir les risques résultant de leurs interventions simultanées ou successives et de prévoir, lorsqu\'elle s\'impose, l\'utilisation des moyens communs tels que les infrastructures, les moyens logistiques et les protections collectives.",null),
("92","Art R.4512-7 du CdT ; Décret n° 92-158 du 20 février 1992 et Arrêté du 19 mars 1993:\n\nPrévention des risques d\'incendie lors de travaux par \"point chaud\" (soudage, découpage, meulage…) effectués en dehors des postes de travail permanents ; complément au plan de prévention lors d\'intervention d\'une entreprise extérieure. \n\n",null),
("93","Signalisation des zones de danger comportant notamment des risques de chute de personnes ou des risques de chute d’objets. Dispositifs pour éviter l’accès aux agents non autorisés (gardes corps, chaînes, signalisation par bande au sol).\nArt.R.4224-23 du CdT. \n\nSignalisations obligatoires :\nLa mise en œuvre d’une signalisation de sécurité s’impose toutes les fois que sur un lieu de travail un risque ne peut pas être évité ou prévenu par l’existence d’une protection collective ou par l’organisation du travail. D’une manière générale, signalisation à l’entrée des locaux :\n- du danger et des risques ;\n- de l’interdiction aux personnes non autorisées ;\n- des interdictions particulières ;\n- des obligations de sécurité particulières.\n- Signalisation des trafics à l’intérieur de l’établissement, des règles de circulation, des chemins d’accès, des véhicules et dégagements de secours",null),
("94","Conformément à l’article 2 du décret 85-603 du 10 juin 1985 modifié \nl’autorité territoriale doit maintenir en état les locaux, équipements et installations de travail.\nArt.R.4224-18 du CdT: \nLes locaux de travail doivent être régulièrement entretenus et nettoyés, exempts de tout encombrement. Le médecin du travail et le CTP/CHS ou, à défaut, les délégués du personnel, sont appelés à donner leur avis sur les mesures à prendre pour satisfaire aux obligations prévues (procédés de nettoyage, fréquence et périodicité, horaires, produits et matériels, etc.).",null),
("95","Art.R.4225-2 du CdT- L’employeur met à la disposition des travailleurs de l’eau potable et fraîche pour la boisson.\n\nArt.R.4225-3 du CdT- Lorsque des conditions particulières de travail conduisent les travailleurs à se désaltérer fréquemment, l’employeur met gratuitement à leur disposition au moins une boisson non alcoolisée.\nLa liste des postes de travail concernés est établie par l’employeur, après avis du médecin du travail et du comité d’hygiène, de sécurité et des conditions de travail ou, à défaut, des délégués du personnel.\nLes boissons et les aromatisants mis à disposition sont choisis en tenant compte des souhaits exprimés par les travailleurs et après avis du médecin du travail.\n\nArt.R.4225-4 du CdT- L’employeur détermine l’emplacement des postes de distribution des boissons, à proximité des postes de travail et dans un endroit remplissant toutes les conditions d’hygiène. L’employeur veille à l’entretien et au bon fonctionnement des appareils de distribution, à la bonne conservation des boissons et à éviter toute contamination.",null),
("96","Décret n°2006-1386 du 15 novembre 2006 (application de Art.L3511-7 du Code de la santé publique) poser le principe d’une interdiction totale de fumer dans les lieux à usage collectif et notamment sur le lieu de travail ;\n\nCirculaire du 29 novembre 2006 « relative à l’interdiction de fumer dans les lieux à usage collectif ». \n\nLe principe d’interdiction de fumer doit faire l’objet d’une signalisation apparente. L’arrêté du 1er décembre 2010 fixe le modèle de signalisation accompagné d’un message sanitaire de prévention.",null),
("97","Art.R.4228-1 du CdT- L’employeur met à la disposition des travailleurs les moyens d’assurer leur propreté individuelle, notamment des vestiaires, des lavabos, des cabinets d’aisance et, le cas échéant, des douches. \nArt. R. 4228-2 du CdT- Les vestiaires collectifs et les lavabos sont installés dans un local spécial de surface convenable, isolé des locaux de travail et de stockage et placé à proximité du passage des travailleurs. \nLorsque les vestiaires et les lavabos sont installés dans des locaux séparés, la communication entre ceux-ci doit pouvoir s’effectuer sans traverser les locaux de travail ou de stockage et sans passer par l’extérieur. \nArt. R. 4228-4 du CdT- Les locaux affectés aux vestiaires collectifs et lavabos sont aérés conformément aux règles d’aération et d’assainissement du chapitre II et convenablement chauffés\nArt. R. 4228-5 du CdT- Dans les établissements employant un personnel mixte, des installations séparées sont prévues pour les travailleurs masculins et féminins. \nArt. R. 4228-6 du CdT- Les vestiaires collectifs sont pourvus d’un nombre suffisant de sièges et d’armoires individuelles ininflammables. Ces armoires permettent de suspendre deux vêtements de ville. Lorsque les vêtements de travail sont susceptibles d’être souillés de matières dangereuses, salissantes ou malodorantes, les armoires comprennent un compartiment réservé à ces vêtements. Les armoires individuelles sont munies d’une serrure ou d’un cadenas. La salle de pause et restauration.\n",null),
("98","Art.R.4228-8 du CdT - Dans les établissements où sont réalisés certains travaux insalubres et salissants, des douches sont mises à la disposition des travailleurs.  La liste de ces travaux ainsi que les conditions de mises à disposition des douches sont fixées par arrêté des ministres chargés du travail ou de l’agriculture et, en tant que de besoin, par le ministre chargé de la santé. \nArt.R.4228-9  du CdT- Le sol et les parois du local affecté aux  douches sont tels qu’ils permettent un nettoyage efficace.  Le local est tenu en état constant de propreté. La température de l’eau des douches est réglable. \n",null),
("99","Art.R.4228-22 du CdT\nDans les établissements dans lesquels le nombre de travailleurs souhaitant prendre habituellement leur repas sur les lieux de travail est au moins égal à vingt-cinq, l’employeur, après avis du comité d’hygiène, de sécurité et des conditions de travail ou à défaut des délégués du personnel, met à leur disposition un local de restauration.\nCe local est pourvu de sièges et de tables en nombre suffisant et comporte un robinet d’eau potable, fraîche et chaude, pour dix usagers.\nIl est doté d’un moyen de conservation ou de réfrigération des aliments et des boissons et d’une installation permettant de réchauffer les plats.\nArt.R.4228-23 du CdT\nDans les établissements dans lesquels le nombre de travailleurs souhaitant prendre habituellement leur repas sur les lieux de travail est inférieur à vingt-cinq, l’employeur met à leur disposition un emplacement leur permettant de se restaurer dans de bonnes conditions de santé et de sécurité.",null),
("100","Art.R.4228-10 du CdT:\nUn cabinet d’aisance et un urinoir pour vingt hommes et deux cabinets pour vingt femmes. (Prise en compte effectif maximal  présent simultanément dans l’établissement. Un cabinet au moins comporte un poste d’eau. Si personnel mixte, les cabinets d’aisance sont séparés pour le personnel féminin et masculin. Les cabinets d’aisance réservés aux femmes comportent un récipient pour garnitures périodiques.\nArt.R.4228-11 du CdT: \nAménagés de manière à ne dégager aucune odeur, équipés de chasse d’eau et pourvus de papier hygiénique.\nArt.R.4228-12 du CdT:\nSont aérés conformément aux règles d’aération et d’assainissement du chapitre II et convenablement chauffés.\nArt.R.4228-13 du CdT: \nLe sol et les parois des cabinets d’aisance sont en matériaux imperméables permettant un nettoyage efficace. L’employeur fait procéder au nettoyage et à la désinfection des cabinets d’aisance et des urinoirs au moins une fois par jour.",null);
INSERT INTO resume_article VALUES
("101","Art.R.4225-2 du CdT:\nL’employeur met à la disposition des travailleurs de l’eau potable et fraîche pour la boisson.",null),
("102","Art.R.4228-23 du CdT:\nDans les établissements dans lesquels le nombre de travailleurs souhaitant prendre habituellement leur repas sur les lieux de travail est inférieur à vingt-cinq, l\'employeur met à leur disposition un emplacement leur permettant de se restaurer dans de bonnes conditions de santé et de sécurité.\nArt.R.4228-25 du CdT:\nA défaut de local de repos, lorsque la nature des activités l’exige et après avis du comité d’hygiène, de sécurité et des conditions de travail ou, à défaut, des délégués du personnel, le local de restauration ou l’emplacement permettant de se restaurer doit pouvoir être utilisé, en dehors des heures de repas, comme local ou emplacement de repos.\nLes sièges mis à la disposition des travailleurs pour cet usage comportent des dossiers.",null),
("103","Art.R.4223-13 à 15 et art.R.4225-1 du CdT \nLes locaux affectés au  travail doivent être chauffés pendant la saison froide (t° convenable).\nT° adaptée l’été. Ventilation des locaux pour éviter les élévations exagérées de température en saison chaude (ventilateur, climatisation)\nLes postes de travail extérieurs doivent être aménagés autant que possible pour protéger les travailleurs contre les conditions atmosphériques.\n\nLe CdT ne prévoit pas de valeur seuil de température pour le travail en extérieur. Il faut toutefois garder à l’esprit l’obligation par l’employeur de mettre en œuvre les mesures nécessaires pour assurer la sécurité et protéger la santé des travailleurs (article L.4121-1 du CdT), en application des principes généraux de prévention du CdT. De ce fait, l’autorité territoriale doit mettre en place les mesures adaptées contre le froid lorsque celui-ci peut nuire à la santé ou à la sécurité des agents.",null),
("104","Art.R.4223-1 à 12 du CdT:\nL’éclairage est assuré de manière à :\n1° Éviter la fatigue visuelle et les affections de la vue qui en résultent ;\n2° Permettre de déceler les risques perceptibles par la vue.\nDans les zones de travail, le niveau d’éclairement est adapté à la nature et à la précision des travaux à exécuter.\n\nArt.R.4223-7 du CdT:\n - Les postes de travail situés à l’intérieur des locaux de travail sont protégés du rayonnement solaire gênant soit par la conception des ouvertures, soit par des protections fixes ou mobiles appropriées.",null),
("105","Art.R.4222-4 du CdT:\nDans les locaux à pollution non spécifique, l’aération est assurée soit par ventilation mécanique, soit par ventilation naturelle permanente.\nDans ce dernier cas, les locaux comportent des ouvrants donnant directement sur l’extérieur et leurs dispositifs de commande sont accessibles aux occupants.\n\nL’aération par ventilation naturelle, assurée exclusivement par ouverture de fenêtres ou autres ouvrants donnant directement sur l’extérieur, est autorisée lorsque le volume par occupant est égal ou supérieur à :\n1° 15 mètres cubes pour les bureaux et les locaux où est accompli un travail physique léger ;\n2° 24 mètres cubes pour les autres locaux.",null),
("106","Art.R.4224-14 du CdT:\n Les lieux de travail sont équipés d’un matériel de premier secours adapté à la nature des risques et facilement accessible.(présence dans les locaux, dans les véhicules et engins)\nArt.R.4224-23 du CdT: \nCe matériel fait l’objet d’une signalisation par panneaux.\nArr. 12 janv. 1984 : JO, 21 janv.: La liste du matériel nécessaire ainsi que les consignes sont établies par l’employeur après avis du médecin du travail, en fonction des risques spécifiques à l’entreprise, et portées dans le document prévu à l’article R.4224-16 du CdT.\n(remarque:  aucun texte ne précise le contenu de la  trousse de secours.)\nUne procédure de contrôle est à définir afin de remplacer les produits périmés.",null),
("107","Art.R.4224-16 du CdT: \n L’organisation des secours dans l’entreprise suppose également la rédaction de consignes destinées à rappeler la conduite à tenir en cas d’urgence.Le contenu de ce document doit être porté à la connaissance du personnel et facilement accessible. Il détaille de façon générale la procédure à suivre en cas d’accident ou de sinistre :\n— appel éventuel du service médical ;\n— noms, fonctions et lieux de travail des secouristes ;\n— numéros des services extérieurs de protection civile à contacter ;\n— localisation des trousses ou du local de premiers secours ;\n— politique de transport et d’évacuation des blessés. \nLes consignes à suivre en cas d’accident doivent être affichées sur les postes de travail ou bien être présentes dans les véhicules.\n- 112 : numéro d’appel unique des secours sur tout le territoire européen\n- 15 : SAMU\n- 17 : police ou gendarmerie\n- 18 : pompiers\n-  discrimination : 08 1000 5000\n- centre anti-poison de votre région.",null),
("108","Art.R.4543-20 du CdT- (Décr. no 2008-1325 du 15 déc. 2008 ) Un  travailleur isolé ne peut réaliser des interventions ou travaux qui: \n- Exigent le port d’un équipement de protection individuelle respiratoire isolant ou filtrant à ventilation assistée.\nEviter autant que possible, les travailleurs isolés. Toujours favoriser le travail en équipe\nArt.R252 du 13 juin 1984: Tout salarié doit faire l’objet d’une surveillance directe ou indirecte de jour et de nuit.\n\nLe CdT étant peu explicite quant à la définition du travail isolé (CdT, articles R.4543 - 19, 20 et 21), on considérera qu\'un travailleur est « isolé » lorsque il effectue une tâche seul, sans interaction directe avec un autre travailleur, pendant un temps significativement important au regard de l\'activité considérée. En pratique, un agent sera donc « isolé » lorsqu\'il travaillera sans pouvoir être directement vu ou entendu par un tiers durant tout ou partie de son activité.\n\nLe législateur liste en effet certaines activités devant obligatoirement faire l\'objet d\'une surveillance par une personne qualifiée, instruite sur les mesures à prendre en cas d\'accident et ayant à sa disposition les moyens nécessaires pour intervenir, donner l\'alerte et apporter les premiers secours.\nOn retiendra parmi celles-ci :\n- Le travail en hauteur (CdT, article R.4323-61)\n- Les manœuvres de camions et engins (décret du 8 janvier 1965)\n- La mise en œuvre de certains équipements de levage (CdT, article R.4323-41).\n- Les travaux en puits ou galerie (décret du 8 janvier 1965)\n- Certains travaux électriques effectués sous tension ou au voisinage de pièces sous tension (décret du 14 novembre 1988 modifié, articles 50 et 51, décret du 06 mai 1995, article 30)\n- Les travaux exposant à un risque de chute dans l\'eau (arrêté du 25 juillet 1974)\n- Les travaux effectués sur les ascenseurs, ascenseurs de charges, escaliers mécaniques, trottoirs roulants et installations de parcage automatique de véhicule (Décret du 15 décembre 2008)",null),
("109","Art.R.4543-19 du CdT- (Décr. no 2008-1325 du 15 déc. 2008 ) Un travailleur isolé doit pouvoir signaler toute situation de détresse et être secouru dans les meilleurs délais.\nAfin de s’assurer que les agents travaillant seuls soient à même de pouvoir alerter leur responsable hiérarchique et les secours dans tous les cas. :\nEtablir une liste des agents travaillant seuls et sans moyens d’alerte (même temporairement)\nPlanifier par la suite les actions à mener pour remédier à cette situation critique en cas d’accident.",null),
("110","Art.R.4224-16 du CdT:\nEn l’absence d’infirmiers, ou lorsque leur nombre ne permet pas d’assurer une présence permanente, l’employeur prend, après avis du médecin du travail, les mesures nécessaires pour assurer les premiers secours aux accidentés et aux malades. Ces mesures qui sont prises en liaison notamment avec les services de secours d’urgence extérieurs à l’entreprise sont adaptées à la nature des risques.\nCes mesures sont consignées dans un document tenu à la disposition de l’inspecteur du travail.",null),
("111","Art.R.4227-3 à 6 du CdT:\nL’effectif théorique des personnes susceptibles d’être présentes à prendre en compte pour l’application du présent chapitre comprend l’effectif des travailleurs, majoré, le cas échéant, de l’effectif du public susceptible d’être admis et calculé suivant les règles relatives à la protection du public contre les risques d’incendie et de panique pour les établissements recevant du public.\n\nLes établissements comportent des dégagements tels que portes, couloirs, circulations, escaliers, rampes, répartis de manière à permettre une évacuation rapide de tous les occupants dans des conditions de sécurité maximale. \nCes dégagements sont toujours libres. Aucun objet, marchandise ou matériel ne doit faire obstacle à la circulation des personnes ou réduire la largeur des dégagements au-dessous des minima fixés à l\'article R.4227-5. \nCes dégagements sont disposés de manière à éviter les culs-de-sac.\nEFFECTIF                          NOMBRE de dégagements	      LARGUEUR totale cumulée\nMoins de 20 personnes	                 1	                                             0,80 m\nDe 20 à 100 personnes	                         1	                                             1,50 m\n",null),
("112","En fonction des activités qui s’y déroulent et du nombre de personnes susceptibles d’être présentes dans l’établissement, l’ERP est soumis à des contraintes réglementaires plus ou moins importantes.\nCette réglementation s’articule autour de deux textes centraux :\n- Le code de la construction et de l’habitat\n- Le règlement de sécurité du 25 juin 1980, constitué de Livres, eux-mêmes divisés en chapitres :\nDans tous les cas d’ERP, il s’agira de se référer aux dispositions du Livre I du Règlement de sécurité\nSelon la catégorie de l’ERP, il faudra se référer aux dispositions du Livre II (ERP premier groupe) ou du Livre III (ERP de 5è catégorie)\nPour les établissements spéciaux, il faudra se reporter au Livre IV. \n\nLa commission de sécurité:\nVérifie le respect des dispositions réglementaires dans les établissements.\nÉvalue le niveau de sécurité.\nAnalyse les risques liés à l’exploitation de l’établissement. En fonction de cette analyse, des prescriptions spécifiques peuvent être émises, afin de proposer une mise en sécurité\nde l’établissement visité.\nDonne un avis consultatif au maire.",null),
("113","Art.R.4227-28 du CdT:\nL’employeur doit prendre les mesures nécessaires pour que tout commencement d’incendie puisse être rapidement et efficacement combattu dans l’intérêt du sauvetage des travailleurs\nArt.R.4227-29 du CdT: Le premier secours contre l’incendie est assuré par des extincteurs en nombre suffisant et maintenus en bon état de fonctionnement. Il existe au moins un extincteur portatif à eau pulvérisée d’une capacité minimale de 6 litres pour 200 mètres carrés de plancher. Il existe au moins un appareil par niveau. Lorsque les locaux présentent des risques d’incendie particuliers, notamment des risques électriques, ils sont dotés d’extincteurs dont le nombre et le type sont appropriés aux risques. \nArt.R.4227-30 du CdT: Si nécessaire, l’établissement est équipé de robinets d’incendie armés, de colonnes sèches, de colonnes humides, d’installations fixes d’extinction automatique d’incendie ou d’installations de détection automatique d’incendie. \n\n- Dans les locaux: Veiller à ce que chaque extincteur soit accroché au mur (règle R4 de l’APSAD), correctement signalé et facilement accessible. Hauteur:\n- dans les ERP : arrêté du 26 juin 2008 art 2 §2 \"...Ils doivent être accrochés à un élément fixe, avec une signalisation durable, sans placer\nla poignée de portage à plus de 1,20m du sol.\"\n- dans locaux relevant du CdT: recommandation que la poignée ne soit pas à plus de 1m50 du sol:\n- Dans les véhicules: Obligatoire dans les véhicules qui, par eux-mêmes ou du fait de leur remorque ou de leur chargement, présentent des risques d’incendie (sauf si le lieu d’utilisation en est équipé à des endroits suffisamment rapprochés).",null),
("114","R.4227-39 du CdT:\nLa consigne de sécurité incendie prévoit des essais et visites périodiques du matériel et des exercices au cours desquels les travailleurs apprennent à reconnaître les caractéristiques du signal sonore d’alarme générale, à se servir des moyens de premier secours et à exécuter les diverses manœuvres nécessaires\nCes exercices et essais périodiques ont lieu au moins tous les six mois. Leur date et les observations auxquelles ils peuvent avoir donné lieu sont consignées sur un registre tenu à la disposition de l’inspection du travail",null),
("115","Art.R.4227-22 du CdT:- Les locaux ou les emplacements dans lesquels sont entreposées ou manipulées des substances ou préparations classées explosives, comburantes ou extrêmement inflammables, ainsi que des matières dans un état physique susceptible d’engendrer des risques d’explosion ou d’inflammation instantanée, ne contiennent aucune source d’ignition telle que foyer, flamme, appareil pouvant donner lieu à production extérieure d’étincelles ni aucune surface susceptible de provoquer par sa température une auto-inflammation des substances, préparations ou matières précitées. \nCes locaux disposent d’une ventilation permanente appropriée.\n\nArt.R.4227-24 du CdT:- Les locaux mentionnés à l’article  R.4227-22 ainsi que ceux dans lesquels sont entreposées ou manipulées des substances ou préparations classées facilement inflammables ou des matières dans un état physique tel qu’elles sont susceptibles de prendre feu instantanément au contact d’une flamme ou d’une étincelle et de propager rapidement l’incendie, sont utilisés de telle sorte que:\n1- Aucun poste habituel de travail ne se trouve à plus de 10 mètres d’une issue donnant sur l’extérieur ou sur un local donnant lui-même sur l’extérieur;\n2- Les portes de ces locaux s’ouvrent vers l’extérieur;\n3- Si les fenêtres de ces locaux sont munies de grilles ou grillages, ceux-ci s’ouvrent très facilement de l’intérieur.",null),
("116","Art.R.4216-13 du CdT:\nLes locaux de plus de 300 mètres carrés situés en rez-de-chaussée et en étage, les locaux de plus de 100 mètres carrés aveugles et ceux situés en sous-sol ainsi que tous les escaliers comportent un dispositif de désenfumage naturel ou mécanique\nArt.R.4216-14 du CdT:\nLes dispositifs de désenfumage naturel sont constitués en partie haute et en partie basse d’une ou plusieurs ouvertures communiquant avec l’extérieur, en vue de l’évacuation des fumées et l’amenée d’air.\nLa surface totale des sections d’évacuation des fumées est supérieure au centième de la superficie du local desservi avec un minimum de un mètre carré. Il en est de même pour celle des amenées d’air.\nChaque dispositif d’ouverture du dispositif de désenfumage est aisément manoeuvrable à partir du plancher.\nArt.R.4216-15 du CdT:\nEn cas de désenfumage mécanique, le débit d’extraction est calculé sur la base d’un mètre cube par seconde par 100 mètres carrés.",null),
("117","Art.R.4227-37 du CdT:\nDans les établissements mentionnés à l’article R. 4227-34, une consigne de sécurité incendie est établie et affichée de manière très apparente : \n1° Dans chaque local pour les locaux dont l’effectif est supérieur à cinq personnes et pour les locaux mentionnés à l’article R. 4227-24 ; \n2° Dans chaque local ou dans chaque dégagement desservant un groupe de locaux dans les autres cas.\nArt.R.4227-34 du CdT:\nLes établissements dans lesquels peuvent se trouver occupées ou réunies habituellement plus de cinquante personnes, ainsi que ceux, quelle que soit leur importance, où sont manipulées et mises en œuvre des matières inflammables mentionnées à l’article R. 4227-22 sont équipés d’un système d’alarme sonore.\n\nArt.R.4227-38 du CdT:\nLa consigne de sécurité incendie indique :\n1° Le matériel d’extinction et de secours qui se trouve dans le local ou à ses abords ;\n2° Les personnes chargées de mettre ce matériel en action ;\n3° Pour chaque local, les personnes chargées de diriger l’évacuation des travailleurs et éventuellement du public ;\n4° Les mesures spécifiques liées à la présence de personnes handicapées, et notamment le nombre et la localisation des espaces d’attentes sécurisés ou des espaces équivalents ;\n5° Les moyens d’alerte ;\n6° Les personnes chargées d’aviser les sapeurs-pompiers dès le début d’un incendie ;\n7° L’adresse et le numéro d’appel téléphonique du service de secours de premier appel, en caractères apparents ;\n8° Le devoir, pour toute personne apercevant un début d’incendie, de donner l’alarme et de mettre en œuvre les moyens de premier secours, sans attendre l’arrivée des travailleurs spécialement désignés.\n\nDispositions applicable aux établissements de la 5° catégorie\n\nPE 27 alerte, alarme et consignes (extraits)\nDes consignes précises, affichées bien en vue, doivent indiquer :\n* le numéro d\'appel des sapeurs-pompiers\n* l\'adresse du centre de secours de premier appel\n* les dispositions immédiates à prendre à cas de sinistre\n\nLe personnel doit être instruit sur la conduite à tenir en cas d\'incendie et être entraîné à la manœuvre des moyens de secours.\nDans les établissements implantés en étage ou en sous-sol, un plan schématique, conforme aux normes, sous forme d\'une pancarte indestructible, doit être apposé à l\'entrée, pour faciliter l\'intervention des sapeurs-pompiers. Ce plan comporte l\'emplacement des locaux techniques, des stockages dangereux, des dispositifs de coupure des fluides et des commandes des équipements de sécurité.\n",null),
("118","Règlement de sécurité relatif aux établissements recevant du public (1° et 4° catégorie)\n\nMS 41 \nUn plan schématique, sous forme de pancarte inaltérable, doit être apposé à chaque entrée de bâtiment de l\'établissement pour faciliter l\'intervention des sapeurs-pompiers.\nLe plan doit avoir les caractéristiques des plans d\'intervention définies à la norme NF X08-070 de juin 2013 relative aux plans et consignes de protection contre l\'incendie.\nIl doit représenter au minimum le sous-sol, le rez-de-chaussée, chaque étage ou l\'étage courant de l\'établissement.\nDoivent y figurer, outre les dégagements, les espaces d\'attente sécurisés et les cloisonnements principaux, l\'emplacement :\n* Des divers locaux techniques et autres locaux à risques particuliers\n* des dispositifs et commandes de sécurité\n* des organes de coupure des fluides\n* des organes de coupure des sources d\'énergie\n* des moyens d\'extinction fixes et d\'alarme.\n\nMS 47\nDes consignes précises, conformes à la norme NF X08-070 de juin 2013 relative aux plans et consignes de protection contre l\'incendie, destinées aux personnels de l\'établissement, constamment mises à jour, et affichées sur supports fixes et inaltérables doivent indiquer :\n* les modalités d\'alerte des sapeurs-pompiers\n* les dispositions à prendre pour assurer la sécurité du public et du personnel\n* la mise en œuvre des moyens de secours de l\'établissement\n* l\'accueil et le guidage des sapeurs-pompiers\n\nDispositions applicable aux établissements de la 5° catégorie\n\nPE 27 alerte, alarme et consignes (extraits)\nDes consignes précises, affichées bien en vue, doivent indiquer :\n* le numéro d\'appel des sapeurs-pompiers\n* l\'adresse du centre de secours de premier appel\n* les dispositions immédiates à prendre en cas de sinistre\n\nLe personnel doit être instruit sur la conduite à tenir en cas d\'incendie et être entraîné à la manœuvre des moyens de secours.\nDans les établissements implantés en étage ou en sous-sol, un plan schématique, conforme aux normes, sous forme d\'une pancarte indestructible, doit être apposé à l\'entrée, pour faciliter l\'intervention des sapeurs-pompiers. Ce plan comporte l\'emplacement des locaux techniques, des stockages dangereux, des dispositifs de coupure des fluides et des commandes des équipements de sécurité.",null),
("119","Art.R.4227-4 du CdT:\nLes établissements comportent des dégagements tels que portes, couloirs, circulations, escaliers, rampes, répartis de manière à permettre une évacuation rapide de tous les occupants dans des conditions de sécurité maximale. Ces dégagements sont toujours libres. Aucun objet, marchandise ou matériel ne doit faire obstacle à la circulation des personnes ou réduire la largeur des dégagements au-dessous des minima fixés à l’article  \nArt.R 4227-5 du CdT: \nCes dégagements sont disposés de manière à éviter les culs-de-sac.\n",null),
("120","Art.R.4227-6 à 7 du CdT:\nLes locaux auxquels les travailleurs ont normalement accès sont desservis par des dégagements dont le nombre et la largeur exigibles s’établissent comme indiqué dans le tableau ci-dessous\nC’est l’article R. 4227-5 qui fixe le nombre et la largeur des dégagements exigibles :\nMoins de 20 personnes: 1 dégagement de 0,80 m\nDe 20 à 100 personnes  1 dégagement de 1,50 m\n....\nLes portes obéissent aux caractéristiques suivantes :\n1° Les portes susceptibles d’être utilisées pour l’évacuation de plus de cinquante personnes s’ouvrent dans le sens de la sortie ;\n2° Les portes faisant partie des dégagements réglementaires s’ouvrent par une manœuvre simple ;\n3° Toute porte verrouillée est manœuvrable de l’intérieur dans les mêmes conditions qu’au 2° et sans clé.\nLes portes coulissantes, à tambour ou s’ouvrant vers le haut ne peuvent constituer des portes de secours. Elles ne sont pas considérées comme des dégagements réglementaires.\nToutefois les portes coulissantes motorisées qui, en cas de défaillance du dispositif de commande ou du dispositif d’alimentation, libèrent la largeur totale de la baie par effacement latéral ou par débattement sur l’extérieur par simple poussée peuvent constituer des dégagements réglementaires.",null),
("121","Art.R.4227-10 du CdT:- Les escaliers sont munis de rampe ou de main-courante. Ceux d’une largeur au moins égale à 1,5 mètre en sont munis de chaque côté. \nEnvisager plutôt de mettre en place un escalier d’accès doté d’une rambarde. \n\nPour information, la mise en place d’une échelle comme moyen d’accès est déconseillé. En effet, dans ce cadre, le port de charge doit rester exceptionnel et limité à des charges légères et peu encombrantes (il ne doit pas empêcher le maintien d’une prise sûre, art R4323-88 du CdT).\n",null),
("122","Art.R.4227-34 du CdT:\n- Les établissements dans lesquels peuvent se trouver occupées ou réunies habituellement plus de cinquante personnes, ainsi que ceux, quelle que soit leur importance, où sont manipulées et mises en œuvre des matières inflammables mentionnées à l’article  R. 4227-22 sont équipés d’un système d’alarme sonore. \nArt.R.4227-35 du CdT:\n- L’alarme sonore générale est donnée par bâtiment si l’établissement comporte plusieurs bâtiments isolés entre eux. \nArt.R.4227-36 du CdT:\n- Le signal sonore d’alarme générale est tel qu’il ne permet pas la confusion avec d’autres signalisations utilisées dans l’établissement. Il est audible de tout point du bâtiment pendant le temps nécessaire à l’évacuation, avec une autonomie minimale de cinq minutes.",null),
("123","Art.R.4227-13 du CdT:\nUne signalisation indique le chemin vers la sortie la plus proche ainsi que le chemin vers l’espace d’attente sécurisé ou l’espace équivalent le plus proche. Une autre signalisation identifie ces espaces.\nArt.R.4227-14 du CdT:\nLes établissements disposent d’un éclairage de sécurité permettant d’assurer l’évacuation des personnes en cas d’interruption accidentelle de l’éclairage normal.\nLa conception, la mise en œuvre et les conditions d’exploitation et de maintenance de cet éclairage ainsi que les locaux qui peuvent en être dispensés en raison de leur faible superficie ou de leur faible fréquentation sont définis par un arrêté des ministres chargés du travail et de l’agriculture.",null),
("124","Art.R.4224-18 du CdT. \nLes agents qui interviennent sur des sols glissants ou humides disposent de chaussures antidérapantes.\nLes obstacles au sol ou des trous  susceptibles d’entraîner une chute sont signalés et protégés.\nLes fosses sont recouvertes ou interdites d’accès en dehors des interventions sur les véhicules.\nLes marchepieds des camions ou des engins sont en bon état.\nLes passages des piétons sont libérés de tout encombrement:\n - fils électriques;\n - cartons et matériels en vrac.\nEviter d’une manière générale tout encombrement dans les locaux de travail et leurs annexes, en veillant à ce qu’ils soient entretenus et nettoyés.",null),
("125","Il n’y a pas de réglementation spécifique à ce type d’installation mais 2 recommandations (R468 et R469) de la CNAMTS (Caisse Nationale d’Assurance Maladie des Travailleurs Salariés) apportent des précisions sur les mesures qu’il est vivement conseillé d’adopter, afin d’assurer une prévention des risques efficace en application des textes en vigueur (en particulier certains articles du CT et des textes spécifiques sur la conception des lieux de travail et la prévention des risques en atmosphère explosible). \n\n- Elle doit être construite dans l’axe d’accès des véhicules et hors des voies de circulation du personnel.\n- La profondeur de la fosse doit être comprise entre 1,40 m et 1,60 m.\n- L’accès à la fosse doit pouvoir s’effectuer par les deux extrémités grâce à des escaliers anti-dérapants.\n- Le sol et les parois de la fosse doivent être constitués de matériaux imperméables, claires et facilement lavables. Le sol doit être antidérapant. Il doit être légèrement en pente avec un regard d’évacuation afin de faciliter le recueil des effluents.\n- L’éclairage sera installé sous verre dormant. Il sera de préférence encastré et devra fournir un éclairement moyen de 250 lux.\n- Pour les fosses utilisées pour l’entretien des véhicules à essence, un système de ventilation (500 m3 /h) devra être installé.\n- Des dispositifs de captage et d’évacuation des gaz d’échappement doivent également être prévus pour les travaux de réglage de moteur.\n- Un balisage au sol doit permettre une délimitation visuelle du pourtour de la fosse.\n- Un extincteur à poudre devra être installé à proximité de la fosse.\n\nLorsque la fosse est inutilisée, celle-ci doit être recouverte par la mise en place de bastaings, ou bien des gardes corps seront mis en place.\n- Nettoyer la fosse et les moyens d’accès aussi souvent que nécessaire pour éviter l’accumulation de graisses.\n- N’utiliser des lampes baladeuses que de type étanche.\n- Les vidanges de réservoirs d’essence au dessus de la fosse sont interdites.\n- Les travaux de soudage à moins de 3 m de la fosse sont à proscrire.\n- Il est interdit de fumer à l’intérieur de la fosse ainsi que d’introduire des flammes nues.\n- S’assurer que la position du véhicule n’obstrue pas les dispositifs d’accès.\n- En cas de fonctionnement du moteur, raccorder le tuyau d’échappement au flexible du système d’évacuation des gaz.\n",null),
("126","Art.R.4224-3 du CdT:\nLes lieux de travail intérieurs et extérieurs sont aménagés de telle façon que la circulation des piétons et des véhicules puisse se faire de manière sûre.\n",null),
("127","Conformément à l’article 2 du décret 85-603 du 10 juin 1985 modifié; l’autorité territoriale doit maintenir en état les locaux, équipements et installations de travail.\nArt.R.4224-18 du CdT: \nLes locaux de travail doivent être régulièrement entretenus et nettoyés, exempts de tout encombrement. Le médecin du travail et le CT/CHSCT ou, à défaut, les délégués du personnel, sont appelés à donner leur avis sur les mesures à prendre pour satisfaire aux obligations prévues (procédés de nettoyage, fréquence et périodicité, horaires, produits et matériels, etc.).",null),
("128","Art.R.4323-58 à 60  du CDT \nPREVENTION TECHNIQUE COLLECTIVE\nL’employeur doit évaluer les risques et privilégier la prévention technique collective, chaque fois qu’elle est possible.\n-Prévention des chutes de hauteur par des garde-corps, placés à une hauteur comprise entre un mètre et 1,10 m et comportant au moins une plinthe de butée de 10 à 15 cm, en fonction de la hauteur retenue pour les garde-corps, une main courante et une lisse intermédiaire à mi-hauteur ou par tout autre moyen assurant une sécurité équivalent\n-Montage et démontage des échafaudages sous la direction d’une personne compétente et par un travailleur formé\n-Echafaudages munis de dispositifs de protection\nFORMATION - INFORMATION - SENSIBILISATION\n-Formation à la conduite d’engins de chantier et de plates-formes élévatrices mobiles de personnes (CACES)\n-Formation au montage et démontage des échafaudages\n-Formation au travail avec des cordes\n-Formation aux règles de sécurité\nPREVENTION INDIVIDUELLE\n-Système d’arrêt de chute ne permettant pas une chute libre de plus d’un mètre\n-Présence d’une tierce personne lorsqu’il est fait usage d’un tel équipement de protection individuelle\n-Harnais anti-chute, baudriers, longes, cordes\n-Equipements de protection conformes aux normes (casque...).",null),
("129","Art.R.4227-10 du CdT:\nLes escaliers sont munis de rampe ou de main-courante. Ceux d’une largeur au moins égale à 1,5 mètre en sont munis de chaque côté. \nArt.R.4224-5 du CdT:\nLes passerelles, planchers en encorbellement, plates-formes en surélévation, ainsi que leurs moyens d\'accès, sont construits, installés ou protégés de telle sorte que les travailleurs appelés à les utiliser ne soient pas exposés à des chutes.\n",null),
("130","Art.R.4323-59  du CDT :\n La prévention des chutes de hauteur à partir d’un plan de travail est assurée :\n1° Soit par des garde-corps intégrés ou fixés de manière sûre, rigides et d’une résistance  appropriée, placés à une hauteur comprise entre un mètre et 1,10 m et comportant au moins :\n    a) Une plinthe de butée de 10 à 15 cm, en fonction de la hauteur retenue pour les garde-corps ;\n    b) Une main courante ;\n    c) Une lisse intermédiaire à mi-hauteur ;\n2° Soit par tout autre moyen assurant une sécurité équivalente.Lorsque les dispositions précédentes ne peuvent être mises en oeuvre, des dispositifs de recueil souples doivent être installés et positionnés de manière à permettre d’éviter une chute de plus de trois mètres.\n\nNote : les garde-corps peuvent être amovibles par endroit pour faciliter les (dé)chargements de matériels. Ils peuvent être en écluse, afin que l’agent qui manipule le matériel, soit en permanence en sécurité.",null),
("131","Art.R.4323-89 et 90 du CdT:\nVeiller au respect de certaines règles de sécurité lors de l’utilisation de la PEMP. Notamment en ce qui concerne :\n- l’agent supplémentaire au sol pour la surveillance de la PEMP\n- l’arrimage des outils et accessoires au panier de la PEMP par un moyen approprié\n- le placement correct des vérins de stabilisation de la PEMP\n- l’annulation des travaux par intempéries\n- le port du casque pour l’agent se trouvant au sol\n- les consignes au personnel spécifiant de ne pas monter sur les plinthes du panier de la nacelle\nVeiller à respecter les conditions d’utilisation de la nacelle prévues par la notice délivrée par le fabricant\n\nS’assurer également que le loueur de la nacelle la fasse vérifier tous les 6 mois et que le conducteur ait une autorisation de conduite en cours de validité.\n\nFavoriser le port du harnais antichute pour la personne se trouvant dans le panier de la nacelle (risque de « catapultage » ou de renversement du panier), sauf pour les travaux à effectuer pour lesquels le port du harnais occasionnerait une gêne ou si aucun point d’ancrage n’est disponible dans le panier de la nacelle.\nLe port devient obligatoire en fonction de la configuration du garde-corps du panier de la nacelle (si ce dernier ne respecte pas les dimensions requises de 1m, 50 cm et 10 cm).",null),
("132","Art.R.4323-61 du CdT:\nLorsque des dispositifs de protection collective ne peuvent être mis en œuvre à partir d\'un plan de travail, la protection individuelle des travailleurs est assurée au moyen d\'un système d\'arrêt de chute approprié ne permettant pas une chute libre de plus d\'un mètre ou limitant dans les mêmes conditions les effets d\'une chute de plus grande hauteur.\nLorsqu\'il est fait usage d\'un tel équipement de protection individuelle, un travailleur ne doit jamais rester seul, afin de pouvoir être secouru dans un délai compatible avec la préservation de sa santé.\nL\'employeur précise dans une notice les points d\'ancrage, les dispositifs d\'amarrage et les modalités d\'utilisation de l\'équipement de protection individuelle.\n\nArt.R.4323-106 du CdT:\nL’employeur fait bénéficier les travailleurs devant utiliser un équipement de protection individuelle d’une formation adéquate comportant, en tant que de besoin, un entraînement au port de cet équipement.\nCette formation est renouvelée aussi souvent que nécessaire pour que l’équipement soit utilisé conformément à la consigne d’utilisation.\n\nSelon l’arrêté du 19 mars 1993, les équipements de protection individuelle contre les chutes de hauteur tels que les harnais de sécurité, doivent, au moment de leur utilisation, avoir été vérifiés dans les 12 mois précédent.\nCette vérification doit être réalisée par une personne compétente et comprends un examen visuel de l’équipement et des dispositifs qui y sont associés.",null),
("133","Art.R.4323-69 à 80 du CdT:\nNe confier le montage et le démontage du matériel qu’au personnel dûment formé (art R 4323-69) et respecter la notice d’instruction du fabricant (R4323-70) . Les échafaudages ne peuvent être montés, démontés ou sensiblement modifiés que sous la direction d’une personne compétente et par des travailleurs qui ont reçu une formation adéquate et spécifique aux opérations envisagées.\nLe contenu de cette formation est précisé aux articles R. 4141-13 et R. 4141-17. Il comporte, notamment : \n1° La compréhension du plan de montage, de démontage ou de transformation de l\'échafaudage ; \n2° La sécurité lors du montage, du démontage ou de la transformation de l\'échafaudage ; \n3° Les mesures de prévention des risques de chute de personnes ou d\'objets ; \n4° Les mesures de sécurité en cas de changement des conditions météorologiques qui pourrait être préjudiciable aux personnes en affectant la sécurité de l\'échafaudage ; \n5° Les conditions en matière d\'efforts de structure admissibles ; \n6° Tout autre risque que les opérations de montage, de démontage et de transformation précitées peuvent comporter. \nCette formation est renouvelée dans les conditions prévues à l\'article R. 4323-3.\nArt.R.4323-76 du CdT:\n- La charge admissible d’un échafaudage est indiquée de manière visible sur l’échafaudage ainsi que sur chacun de ses planchers.\n\n\n",null),
("134","Art.R.4323-81 à 88 du CdT:\nLes échelles, les escabeaux et les marchepieds ne doivent pas être utilisés comme des postes de travail (c’est-à-dire comme lieu de réalisation d’une tâche). Toutefois, ces équipements peuvent être utilisés en cas d’impossibilité technique de recourir à un équipement assurant une protection collective ou lorsque l’évaluation du risque a établi que ce risque est faible et qu’il s’agit de travaux de courte durée ne présentant pas un caractère répétitif.\nVeiller au bon état de ces équipements (patins et barreaux notamment). Investir, peu à peu, dans du matériel marqué « Conforme aux exigences de sécurité ».\nLes échelles portables sont appuyées et reposent sur des supports stables, résistants et de dimensions adéquates notamment afin de demeurer immobiles.\nAfin qu\'elles ne puissent ni glisser ni basculer pendant leur utilisation, les échelles portables sont soit fixées dans la partie supérieure ou inférieure de leurs montants, soit maintenues en place au moyen de tout dispositif antidérapant ou par toute autre solution d\'efficacité équivalente.\n\nLes échelles d\'accès sont d\'une longueur telle qu\'elles dépassent d\'au moins un mètre le niveau d\'accès, à moins que d\'autres mesures aient été prises pour garantir une prise sûre.\n\nLes échelles sont utilisées de façon à permettre aux travailleurs de disposer à tout moment d\'une prise et d\'un appui sûrs.\nLe port de charges reste exceptionnel et limité à des charges légères et peu encombrantes. Il ne doit pas empêcher le maintien d\'une prise sûre.\n\n",null),
("135","Art.R.4541-2 du CdT:\n- On entend par manutention manuelle, toute opération de transport ou de soutien d’une charge, dont le levage, la pose, la poussée, la traction, le port ou le déplacement, qui exige l’effort physique d’un ou de plusieurs travailleurs. \nRéaliser un inventaire de l’ensemble des manutentions manuelles (document unique d’évaluation des risques professionnels) afin de rédiger un plan d’action pour diminuer les gestes répétitifs et les postures contraignantes.",null),
("136","Art.R.4541-3 du CdT: \n- L’employeur prend les mesures d’organisation appropriées ou utilise les moyens appropriés, et notamment les équipements mécaniques, afin d’éviter le recours à la manutention manuelle de charges par les travailleurs.\nArt.R.4541-4-du CdT:\n- Lorsque la nécessité d’une manutention manuelle de charges ne peut être évitée, notamment en raison de la configuration des lieux où cette manutention est réalisée, l’employeur prend les mesures d’organisation appropriées ou met à la disposition des travailleurs les moyens adaptés, si nécessaire en combinant leurs effets, de façon à limiter l’effort physique et à réduire le risque encouru lors de cette opération.\n\n",null),
("137","Art.R.4541-8 du CdT:\nL’employeur fait bénéficier les travailleurs dont l’activité comporte des manutentions manuelles : \n1° D’une information sur les risques qu’ils encourent lorsque les activités ne sont pas exécutées d’une manière techniquement correcte, en tenant compte des facteurs individuels de risque définis par l’arrêté prévu à l’article R. 4541-6 ; \n2° D’une formation adéquate à la sécurité relative à l’exécution de ces opérations. Au cours de cette formation, essentiellement à caractère pratique, les travailleurs sont informés sur les gestes et postures à adopter pour accomplir en sécurité les manutentions manuelles.",null),
("138","Art.R.4541-9 du CdT:\n- Lorsque le recours à la manutention manuelle est inévitable et que les aides mécaniques prévues au 2o de l’article  R. 4541-5 ne peuvent pas être mises en œuvre, un travailleur ne peut être admis à porter d’une façon habituelle des charges supérieures à 55 kilogrammes qu’à condition d’y avoir été reconnu apte par le médecin du travail, sans que ces charges puissent être supérieures à 105 kilogrammes. Toutefois, les femmes ne sont pas autorisées à porter des charges supérieures à 25 kilogrammes ou à transporter des charges à l’aide d’une brouette supérieures à 40 kilogrammes, brouette comprise. \nArt.D.4153-39 et 40 du CdT\nArt.D.4152-12 du CdT \n\nLes normes et recommandations sont plus restrictives que la réglementation du CdT. Elles préconisent une limitation de port de charge de 25 Kg pour les hommes et de 12,5 Kg pour les femmes. Respecter ces règles permet une meilleure prévention des risques liés aux manutentions manuelles.\n\n",null),
("139","Décret n° 2011-1475 du 9 novembre 2011\nart.R.221-1, 4, 10 et 11 du Code de la Route\nArt. R. 221-1.- (Décr. no 2005-320 du 30 mars 2005, art. 2 ) I. — Nul ne peut conduire un véhicule ou un ensemble de véhicules, pour la conduite duquel le permis de conduire est exigé par le présent code, s’il n’est titulaire de la catégorie correspondante du permis de conduire en état de validité....\n\nEntrée en vigueur : le 19 janvier 2013. (D. no 2011-1475, 9 nov. 2011, art. 4 et 18, I): La durée de validité des titres attestant de la qualité de titulaire du permis de conduire est limitée ainsi qu’il suit :\n1- Les permis de conduire comportant les catégories A1, A2, A, B, B1 et BE du permis de conduire ont une durée de validité de quinze ans à compter de leur délivrance, sous réserve des dispositions de l’article R. 221-10 ;\n2- Sous la même réserve, les permis de conduire comportant les catégories C, CE, C1, C1E, D, DE, D1 et D1E ont une durée de validité de cinq ans.",null),
("140","Décret n°2007/1340 du 11 septembre 2007 modifié par décret n°2013-386 du 6 mai 2013 :\nTout conducteurs de certains véhicules de: - Marchandises de PTAC > 3,5 t réalisant des transports Routiers publics et privés  - Voyageurs > 8 places (+ conducteur) réalisant des transports urbains et interurbains de voyageurs doit avoir suivi une formation initiale et continue à l’exception de (principalement pour la FPT):\n - Des véhicules dont la vitesse maximale autorisée ne dépasse pas 45 kilomètres/heure \n - Des véhicules transportant du matériel ou de l’équipement, à utiliser dans l’exercice du métier de leur conducteur, à condition que la conduite du véhicule ne représente pas l’activité principale* du conducteur (* L’activité principale doit représenter plus de 50% du temps, lissé sur une année.).\n\nFIMO: (art 5 du décret 2007-1340 modifié) 140H:\nAge de conduite :\n - 18ans transport marchandises (PTAC? 7,5t, permis requis : C1, C1E), 21ans transport voyageurs (?16 places et 8m, permis requis : D1, D1E)\n - 21 ans transport marchandises (PTAC>3,5t, permis requis : C, CE), 23 ans transport voyageurs (> 9 places, permis requis : D, DE) (21 ans pour trajets réguliers nationaux de moins de 50km)\n\nFCO: (art 8 décret 2007-1340 modifié) 35H : \n - 5 ans après avoir obtenu la formation initiale minimale obligatoire (FIMO)\n ou la précédente formation continue (FCO).",null),
("141","Arrêté du 4 novembre 1993 relatif à la signalisation de sécurité et de santé au travail :\nAu sens du présent arrêté, une signalisation de sécurité ou de santé est une signalisation qui, rapportée à un objet, à une activité ou à une situation déterminée, fournit une indication relative à la sécurité ou la santé. Elle prend la forme, selon le cas, d’un panneau, d’une couleur, d’un signal lumineux ou acoustique.\nSans préjudice de l’obligation de signalisation pour ce qui concerne notamment l’évacuation, le sauvetage et les secours, le matériel et l’équipement de lutte contre l’incendie, les substances ou mélanges dangereux ainsi que certains équipements et matériels spécifiques, la mise en oeuvre d’une signalisation de sécurité s’impose toutes les fois que sur un lieu de travail un risque ne peut pas être évité ou prévenu par l’existence d’une protection collective ou par l’organisation du travail.\nLa signalisation applicable aux trafics, notamment routier, ferroviaire et fluvial, doit, sans préjudice de l’article 9 ci-après, être utilisée, s’il y a lieu, pour ces trafics à l’intérieur des lieux de travail.\nLe nombre et l’emplacement des moyens ou des dispositifs de signalisation à mettre en place sont fonction de l’importance des risques ou dangers ou de la zone à couvrir.",null),
("142","Instruction interministérielle sur la signalisation routière, 8ème partie, Livre I (dernier arrêté intégré 31 juillet 2002):\nArrêté du 5 et 6 novembre 1992 Parution au J.O du 30/01/93:\nDécret 92-768 du 29/07/92 Paragraphe 2-13:\nInstruction interministérielle sur la signalisation routière:\nToute personne intervenant à pied sur le domaine routier à l’occasion d’un chantier ou d’un danger temporaire doit revêtir un vêtement de signalisation à haute visibilité conformémùent à la norme NF EN 471 de classe 2 ou 3.\nSignalisation temporaire:\nLes agents intervenant à pied sur le domaine routier doivent être constamment visibles tant par les usagers que les conducteurs d’engins. Le port d’un vêtement de signalisation à haute visibilité conforme à la norme EN 471 de classe 2 ou 3 est obligatoire.",null),
("143","Arrêté du 4 juillet 1972 relatif aux feux spéciaux des véhicules à progression lente:\nArrêté du 20 janvier 1987 relatif à la signalisation complémentaire des véhicules:\nArrêté du 6 novembre 1992:\nArt. R 313-28 et Art. R. 313-31 du Code de la Route:\n\nSignalisation:\n- gyrophare (sur les véhicules à progression lente) + bandes rouges et blanches rétro réfléchissantes (sur véhicules d’intervention et de travaux , à l’arrêt ou en progression lente)\n- panneau AK5 tri-flash (pour les véhicules pouvant signaler un chantier mobile ou temporaire, autre que ceux possédant déjà  un gyrophare: sigfnalisation de position).\n\nL’arrêté du 4/05/2006 relatif à la circulation des véhicules et matériels agricoles ou forestiers et de leurs ensembles fixe les obligations concernant la signalisation des outils attelés aux tracteurs. \nDépassement de l’outil entre 1 et 4 mètres inclus vers l’arrière:\n-1 panneau rouge et blanc rétroréfléchissant à l’arrière de l’outil\n-1 panneau rouge et blanc rétroréfléchissant de chaque côté de l’outil ",null),
("144","Arrêté du 6 NOVEMBRE 1992 modifié par l’arrêté du 6 décembre 2011 (J.O. du 22 décembre 2011):\nSignalisation des chantiers mobiles ou temporaires:\nPour les chantiers, les agents ont à leur disposition des panneaux de signalisation et des cônes pour le balisage.\nVeiller à l’utilisation du matériel de signalisation lors de tout travail sur ou à proximité de la voirie.",null),
("145","Art.L.4141-1 du CdT :\n« L’employeur organise et dispense une information des travailleurs sur les risques pour la santé et la sécurité et les mesures prises pour y remédier. »\n\nArt.L.4141-2 du CdT :\n« L’employeur organise une formation pratique et appropriée à la sécurité au bénéfice :\ndes travailleurs qu’il embauche,\ndes travailleurs qui changent de poste ou de technique,\ndes salariés temporaires […],\ndes travailleurs qui reprennent leur activité après un arrêt de travail d’une durée d’au moins vingt et un jours, à la demande du médecin du travail.\nCette formation est répétée périodiquement dans des conditions déterminées par voie réglementaire ou par convention ou accord collectif de travail. »\n",null),
("146","Art.L.4321-1 du CdT:\nLes équipements de travail et les moyens de protection mis en service ou utilisés dans les établissements destinés à recevoir des travailleurs sont équipés, installés, utilisés, réglés et maintenus de manière à préserver la santé et la sécurité des travailleurs, y compris en cas de modification de ces équipements de travail et de ces moyens de protection.",null),
("147","Art.R.312-19 du code de la route:\nToutes précautions utiles doivent être prises pour que le chargement d’un véhicule ne puisse être une cause de dommage ou de danger.",null),
("148","Art.L.4321-1 du CdT:\nLes équipements de travail et les moyens de protection mis en service ou utilisés dans les établissements destinés à recevoir des travailleurs sont équipés, installés, utilisés, réglés et maintenus de manière à préserver la santé et la sécurité des travailleurs, y compris en cas de modification de ces équipements de travail et de ces moyens de protection.",null),
("150","Art.R.4313-5 à 26 et 49 du CdT:\n - Les machines, listées dans l’article R4313-49 du CdT, neuves ou considérées comme neuves, sont soumises à la procédure d’examen CE de type définie par les articles R. 4313-5 à R. 4313-26 .\nLes machines sont équipées de leur protection d’origine (capot...etc) et sont utilisées avec les EPIs adaptés.",null),
("151","Art.R.4323-22 et 28 du CdT (Vérification initiale avant mise en service ou à la remise en service),\nArt.R.4323-23 du CdT (Vérifications périodiques selon la notice d’instruction avec: à défaut annuelle ou tous les 6 mois, au moins une fois par an pour les arbres à transmission de puissance, selon les appareils et accessoires de levages, tous les 2 ans pour les dispositifs concourant à la sécurité et à la protection des la santé des utilisateurs.),\nArt R.4323-25 à 27 du CdT (Consignation des résultats dans le registre sécurité),\nArt.R.4323-24 du CdT (Compétence contrôleur), et arrêté du 9 juin 1993 modifié le 31 mars 2005.",null),
("152","Art.R.4322-1 du CdT:\nLes équipements de travail et moyens de protection, quel que soit leur utilisateur, sont maintenus en état de conformité avec les règles techniques de conception et de construction applicables lors de leur mise en service dans l’établissement, y compris au regard de la notice d’instructions.\nArt.R.4313-3 du CdT:\nUn marquage de conformité, constitué par le sigle CE, est apposé de manière visible, lisible et indélébile sur chaque exemplaire de machine ainsi que sur chaque exemplaire d’équipement de protection individuelle.\nLa procédure dite \" examen CE de type \" est la procédure par laquelle un organisme notifié constate et atteste qu’un modèle de machine ou d’équipement de protection individuelle est conforme aux règles techniques le concernant.",null),
("153","Art.R.4322-3 du CdT:\nLa notice d’instructions des équipements de travail et moyens de protection est tenue à la disposition de l’inspection du travail, du service de prévention des organismes de sécurité sociale et de l’organisme agréé saisi conformément à l’article R. 4722-26.",null),
("154","Art.R.4323-1 du CdT:\n- L’employeur informe de manière appropriée les travailleurs chargés de l’utilisation ou de la maintenance des équipements de travail :\n1° De leurs conditions d’utilisation ou de maintenance ;\n2° Des instructions ou consignes les concernant ;\n3° De la conduite à tenir face aux situations anormales prévisibles ;\n4° Des conclusions tirées de l’expérience acquise permettant de supprimer certains risques.\nArt.R.4323-5 du CdT:\n- L’employeur tient à la disposition des membres du comité d’hygiène, de sécurité et des conditions de travail ou, à défaut, des délégués du personnel, une documentation sur la réglementation applicable aux équipements de travail utilisés.",null),
("155","Art.R.4322-2 du CdT:\nLes moyens de protection détériorés pour quelque motif que ce soit, y compris du seul fait de la survenance du risque contre lequel ils sont prévus et dont la réparation n’est pas susceptible de garantir le niveau de protection antérieur à la détérioration, sont immédiatement remplacés et mis au rebut.",null),
("156","Art.R.4322-1 et 2, art.R.4324-30 à 35 du CdT:\n(Structure de protection en cas de retournement), art.R.4324-13 et 14(Dispositif arrêt général ) et art R.4324-39 (blocage mise en route-clé de contact), art.R.4324-6(Protection des systèmes d’échappement contre les risques de brûlure et gaz non dirigé vers l’opérateur ou les zones d’aspiration de ventilation de la cabine), art R.4324-5, art.R.4324-4, art.R.4324-1 et 2(Protection de la prise de force par un bouclier fixe), art.R.4313-24(Présence d’une notice d’instruction), art.R.4324-37 et 41, art.R.4324-9 à 12( Accès au poste de conduite), décret n°80-1091 modifié et décret n°2001-110 du 30 janvier 2001 (Niveau sonore <90 dB(A) en charge et <86 dB(A) à vide).\n\navec:\n - Siège en bon état\n - Dispositifs interdisant la mise en route du moteur lorsque la transmission est engagée,\n - Flexibles hydrauliques protégés en cabine\n - Protecteurs de courroies, poulies et ventilateurs en bon état\n - Systèmes d’attelage en bon état,\n - Garde boue suffisamment enveloppants\n - Commandes visibles, facilement identifiables actionnables,\n - Signal de recul,",null),
("157","Directive 2009/61/CE\ntitre III du Code de la Route avec les articles suivants: art.R.317-8, art.R.313-13, art.R.313-33, art.R316-4, art.316-6, art.R.313- 5, 12, 14 et 18, art.R.313-3, 4 et 14, art.R.313-21.\n- Plaque immatriculation à l’arrière, ( obligatoire cf R317-8 code de la route)\n- gyrophare ( obligatoire si larg>2,55m ou progression lente cf R313-13 code de la route),\n- Avertisseur sonore ( obligatoire cf R313-13 code de la route)\n- Essuie glace et lave glace\n- Au moins un rétroviseur extérieur gauche si cabine fermée\n- Arrière: 2 feux Rouges de position, 2 catadioptres rouges, 2 feux clignotants et éclairage de la plaque d’immatriculation\n- Avant: 2 feux de croisement, 2 feux de position, 2 feux clignotants\n- Latéral: 1 ou 2 feux catadioptres latéraux rectangle/rond oranges si longueur >6m et 1 feu réfléchissant blanc vers l’avant et 1 rouge vers l’arrières.\n\nArrêtés du 20 janvier 1987 et du 4 juillet 1972\nLes engins de chantier considérés comme des véhicules à progression lente doivent être équipés à la base de bandes rouges et blanches rétro réfléchissantes et d’au moins un gyrophare.\nArt.131 C de l’instruction interministérielle sur la signalisation routière \nS’ils sont utilisés sur des chantiers mobiles, ces engins doivent être équipés en plus d’un panneau AK5 (« travaux ») avec tri-flash.\n",null),
("158","Art.R.4323-23 du CdT:\nDes arrêtés du ministre chargé du travail ou du ministre chargé de l’agriculture déterminent les équipements de travail ou les catégories d’équipement de travail pour lesquels l’employeur procède ou fait procéder à des vérifications générales périodiques afin que soit décelée en temps utile toute détérioration susceptible de créer des dangers.\nCes arrêtés précisent la périodicité des vérifications, leur nature et leur contenu.\nArt.R.4323-26 du CdT:\nLorsque les vérifications périodiques sont réalisées par des personnes n’appartenant pas à l’établissement, les rapports établis à la suite de ces vérifications sont annexés au registre de sécurité.\nA défaut, les indications précises relatives à la date des vérifications, à la date de remise des rapports correspondants et à leur archivage dans l’établissement sont portées sur le registre de sécurité.\nLes engins concernés sont:\nChariot élévateur, engins TP, engins TP levage, hayon élévateur, poly benne, pont, tracteur agricole, grue auxiliaire de chargement, nacelle, plate-forme élévatrice (Pemp), compacteur, chargeuse, pelle hydraulique",null),
("159","Vu le décret n° 2008-1254 du 1er décembre 2008 relatif au contrôle des matériels destinés à l’application de produits phytopharmaceutiques ; \nArrêté du 6 juin 2016 modifiant l’arrêté du 18 décembre 2008 relatif aux modalités de contrôle des pulvérisateurs à rampe et pour arbres et arbustes pris en application de l’article D. 256-28 du code rural et de la pêche maritime \nLorsqu’un pulvérisateur est présenté à un contrôle, l’inspecteur s’assure de la présence d’un identifiant sur ce pulvérisateur. Cet identifiant est constitué d’une plaque ou d’un autocollant qui porte, de manière lisible et indélébile, les mentions relatives au numéro national d’agrément de l’organisme d’inspection et à un numéro d’ordre. \nLe contrôle est effectué à l’initiative du propriétaire. Sa validité est de 5 ans",null),
("160","regle_util_tondeuse.png\n\nLa conduite des tondeuses autoportées est réservée aux agents ayant reçu une formation adéquate (formation dispensée au sein de la collectivité ou assurée par un organisme de formation spécialisé – Arrêté du 2 Décembre 1998 – article 1),\nCNAMTS\nLes tondeuses à gazon autoportées sont des équipements mobiles automoteurs soumis aux obligations de formation (cf. question F) mais elles ne sont pas considérées comme des engins de chantier. Il n’y a donc pas de CACES® qui corresponde à ces machines.\nToutefois, le chef d’établissement peut délivrer - sous sa propre responsabilité - une autorisation de conduite pour ces machines à un conducteur titulaire d’un CACES® R372m de catégorie 1, complété par une formation et une évaluation spécifiques pour les risques particuliers présentés par ces machines (projections, coupures, instabilité, bruit, vibrations, etc…). ",null),
("161","eclai_signal_tondeuse.png\nObligatoires :\n2 feux de position – art. R. 313-5 du code de la route:\nEclairage plaque d’immatriculation –art. R. 313-12 art. R. 313-5 du code de la route:\n2 feux indicateurs de changement de direction –art. R. 313-14 art. R. 313-5 du code de la route:\n1 dispositif émettant vers l’arrière une lumière rouge si le chargement dépasse de plus d’1m l’extrémité arrière du véhicule – art 40 de l’arrêté du 16/07/54 \nArrêté du 4 juillet 1972 relatif aux feux spéciaux des véhicules à progression lente ;Version consolidée au 27 juillet 2017 \nArt.1\nLes véhicules à progression lente définis et énumérés dans la liste figurant en annexe au présent arrêté pourront, en sus de l\'éclairage et de la signalisation prévus par le code de la route, être équipés de feux spéciaux afin de signaler leur présence aux usagers de la route.\nArt.2\nLes feux spéciaux seront soit des feux tournants, soit des feux à tube à décharge, soit des feux clignotants émettant de la lumière jaune orangée.\n\n",null),
("162","Art.R.4324-30 du CdT:\n- Les équipements de travail mobiles avec travailleurs portés sont choisis, compte tenu des travaux à accomplir et des conditions effectives d’utilisation, de manière à prévenir les risques de retournement ou de renversement de l’équipement et de chute d’objets.\nArt.R.4324-31 du CdT:\n- Lorsque le risque de retournement ou de renversement d’un équipement de travail mobile ne peut pas être complètement évité, cet équipement est muni soit d’une structure l’empêchant de se renverser de plus d’un quart de tour, soit d’une structure ou de tout autre dispositif d’effet équivalent garantissant un espace suffisant autour des travailleurs portés si le mouvement peut continuer au-delà de cette limite.\nDe telles structures de protection ne sont pas requises lorsque l’équipement est stabilisé pendant l’emploi ou lorsque le retournement ou le renversement en est rendu impossible du fait de la conception de l’équipement.",null),
("163","Art.R317-8 code de la route:\nTout véhicule à moteur, à l’exception des matériels de travaux publics doit être muni de deux plaques d’immatriculation, portant le numéro assigné au véhicule et fixées en évidence d’une manière inamovible à l’avant et à l’arrière du véhicule.\nSi la tondeuse autoportée est autorisée à circuler sur la voie publique (PV de réception, homologation), cet équipement est assimilé aux machines agricoles automotrices (article R311-1). Elle fait dès lors partie des « véhicules et matériels agricoles » (ministère des transports).\n",null),
("164","Art.R.311-1 et suivants du Code de la Route, art. R312-4  du Code de la Route,\ndécret 96-1001 du 18 novembre 1996 relatif aux ESH:\n\nCette réception ou contrôle, nommé Réception à Titre Isolé, a pour but de vérifier la conformité (par le service des mines de la DREAL) aux règles de sécurité des véhicules et des personnes dès lors que leurs dimensions et poids dépassent la normale (art. R312-4 et suivants du Code de la Route) . Elle donne double mention ESH sur la carte grise ainsi que des dérogations:\n- relatives au poids (tonnage maximum pour les camions uniquement),\n- relatives à l’encombrement en fonction de l’outil utilisé,\n- relatives aux règles de circulation.\n\nA la suite de cette Réception à titre isolé, la carte grise du véhicule aura une double mention (double genre), indiquant son classement en tant qu’ESH. Ce classement permet de bénéficier des dérogations.",null),
("165","(Arrêté du 30/10/87, du 20/01/87 et 18/11/96) \nArrêté du 18 novembre 1996 modifié relatif aux poids, dimensions et signalisation des engins de service hivernal\n(arrêté modifié par les arrêtés du 30 décembre 1996, du 28 octobre 1997 et du 28 novembre 2000).\n\n - Feux bleu à éclats (fortement recommandés pour les ESH, il signale aux usagers qu’ils doivent faciliter la progression du véhicule),\n- Gyrophares oranges,\n- feux sur les outils de raclage et épandage pour éclairer la zone de travail,\n- éclairage complémentaire lorsque les outils occultent tout ou partie des dispositifs d’éclairage du véhicule,\n- bande continue de signalisation (L:0,28m;:0,14m) sur les extrémités supérieures.\n\nLimitation de vitesse : Pour les ESH : vitesse limitée à 50km/h, sauf pour : - tracteurs agricoles (30km/h) - les saleuses tractées à essieu rigide (25 km/h). Une indication de cette limitation doit être apposée à l’arrière de l’engin.",null),
("166","Art R.4323-55 du CdT:\nLes conducteurs d’engin doivent être titulaires du permis de conduire adapté pour circuler sur la voie publique. Le permis est fonction du PTAC du véhicule : les engins dont le PTAC est supérieur à 3.5 tonnes ne peuvent être conduits que par des agents titulaires du permis C. \nDe plus, en application de l’article R. 4323-55 du CdT, la conduite des ESH est réservé aux agents ayant reçu une formation adaptée. Cette formation devra être réactualisée dès que nécessaire. L’objectif est de donner au conducteur les connaissances et le savoir faire essentiels à la conduite en toute sécurité. La délivrance de l’autorisation de conduite est alors conseillée",null),
("167","L’article 10 de la Loi n°99-574 du 9 juillet 1999 d’orientation agricole permet aux collectivités de faire appel à des exploitants agricoles pour assurer le déneigement des routes. La loi du 27 juillet 2010 de modernisation de l’agriculture et de la pêche a modifié et complété ces dispositions :\n- La lame peut être celle de l’exploitant agricole, ou fournie par la collectivité. Dans ce cas, la collectivité engage sa responsabilité quant à sa conformité et à l’utilisation qui en est faite ;\n- L’exploitant agricole ne doit pas exercer cette activité dans une ampleur démesurée qui le mettrait en concurrence avec les entreprises ;\n- Le permis poids lourds n’est pas requis lorsque le véhicule concerné est attaché à une exploitation agricole (article R221-20 du code de la route). \n- Les tracteurs des agriculteurs utilisés pour les opérations de déneigement n’ont plus à se soumettre à une nouvelle réception par le service des mines.",null),
("168","Art R.4412-5 à 10 du CdT:\nL’employeur évalue les risques encourus pour la santé et la sécurité des travailleurs pour toute activité susceptible de présenter un risque d’exposition à des agents chimiques dangereux.   Cette évaluation est renouvelée périodiquement, notamment à l’occasion de toute modification importante des conditions pouvant affecter la santé ou la sécurité des travailleurs. \n  Pour l’évaluation des risques, l’employeur prend en compte, notamment :\n  1º Les propriétés dangereuses des agents chimiques présents sur les lieux de travail ;\n  2º Les informations relatives à la santé et à la sécurité communiquées par le fournisseur de produits chimiques en application des articles R. 4411-2, R. 4411-73 et R. 4411-84 \n  3º Les renseignements complémentaires qui lui sont nécessaires obtenus auprès du fournisseur ou d’autres sources aisément accessibles ;\n  4º La nature, le degré et la durée de l’exposition ;\n  5º Les conditions dans lesquelles se déroulent les activités impliquant des agents chimiques, y compris le nombre et le volume de chacun d’eux;\n  6º Les valeurs limites d’exposition professionnelle et les valeurs limites biologiques fixées par décret;\n  7º L’effet des mesures de prévention prises ou à prendre sur le risque chimique ;\n  8º Les conclusions fournies par le médecin du travail concernant la surveillance médicale des travailleurs;\n  9º Les travaux conduits et propositions émises par les intervenants en prévention des risques professionnels mentionnés à l’article R. 4623-26.",null),
("169","Art.R.4412-38 du CdT:\nArt.R.4141-19 du CdT. (Lors d’un changement de poste de travail ou de technique, le travailleur exposé à des risques nouveaux .... bénéficie d’une formation à la sécurité relative à la conduite à tenir en cas d’accident ou de sinistre).\n\nConsignes d’utilisation des substances et produits dangereux. \nArt.L.4121-1 à 52 et Art.R.4412-39 du CdT. \n\nConsigne d’interdiction de manger, boire, fumer sur la zone de travail concernée. \nArt.R.4412-20 du CdT (L’employeur, pour toutes les activités comportant un risque d’exposition à des agents chimiques dangereux, prévoit des mesures d’hygiène appropriées afin que les travailleurs ne mangent pas, ne boivent pas et ne fument pas dans les zones de travail concernées).",null),
("170","Inventaire détaillé de l’ensemble des produits présents dans la collectivité. Présence des fiches de données de sécurité mises à jour. \nArt.R.4411-73 du CdT. \nLe fournisseur d\'une substance ou mélange dangereux fournit au destinataire de cette substance ou mélange une fiche de données de sécurité conforme aux exigences prévues au titre IV et à l\'annexe II du règlement (CE) n° 1907/2006 du Parlement et du Conseil du 18 décembre 2006 concernant l\'enregistrement, l\'évaluation et l\'autorisation des substances chimiques, ainsi que les restrictions applicables à ces substances (REACH), instituant une agence européenne des produits chimiques, modifiant la directive 1999/45/CE et abrogeant le règlement (CEE) n° 793/93 du Conseil et le règlement (CE) n° 1488/94 de la Commission ainsi que la directive 76/769/CEE du Conseil et les directives 91/155/CEE, 93/67/CEE, 93/105/CE et 2000/21/CE de la Commission.\n\nPrésence des FDS (Fiches de Données de Sécurité) relatives aux produits chimiques sur les lieux de travail et possibilité d’y avoir accès pour les travailleurs \nA collecter auprès des fournisseurs pour l’ensemble des produits utilisés. Elles permettent de connaître les risques et les consignes de sécurité au poste et elles sont utiles en cas d’accident et lors de l’appel des secours ou du centre anti-poison. Veiller à leur mise à jour régulière, tous les 3 ans environ et lors de l’achat de nouveaux produits.",null),
("171","Art.R.4412-40 à 43 du CdT. \nEtablissement d’une liste des travailleurs exposés aux ACD (très toxiques, toxiques, nocifs, corrosifs, irritants, sensibilisants) et aux CMR (cancérogènes, mutagènes et toxiques pour la reproduction) + une fiche d’exposition pour chacun (un double est transmis au médecin du travail.",null),
("172","Art.R.4412-15 du CdT:\nLe risque que présente un agent chimique dangereux pour la santé et la sécurité des travailleurs doit être supprimé.\nLorsque la suppression de ce risque est impossible, ce dernier est réduit au minimum par la substitution d’un agent chimique dangereux par un autre agent chimique ou par un procédé non dangereux ou moins dangereux.",null),
("173","Art.R.4411 du CdT et suivants et l’arrêté du 10 juin 1985 modifié donne de manière générale les obligations incombant aux fabricants de produits, à l’employeur, aux utilisateurs et à la médecine du travail dans le cadre de la prévention du risque chimique. \n\nArt.R.4412-39 du CdT:\nL\'employeur établit une notice, dénommée notice de poste, pour chaque poste de travail ou situation de travail exposant les travailleurs à des agents chimiques dangereux. Cette notice, actualisée en tant que de besoin, est destinée à informer les travailleurs des risques auxquels leur travail peut les exposer et des dispositions prises pour les éviter.\nLa notice rappelle les règles d\'hygiène applicables ainsi que, le cas échéant, les consignes relatives à l\'emploi des équipements de protection collective ou individuelle.",null),
("174","Art.R.4412-23 du CdT.\nL’employeur assure régulièrement la vérification et le maintien en parfait état de fonctionnement des installations et appareils de protection collective.",null),
("175","Art.R.4323-95 et 97 du CdT:\nLes équipements de protection individuelle et les vêtements de travail mentionnés à l\'article R. 4321-4 sont fournis gratuitement par l\'employeur qui assure leur bon fonctionnement et leur maintien dans un état hygiénique satisfaisant par les entretiens, réparations et remplacements nécessaires.\nL\'employeur détermine, après consultation du comité d\'hygiène, de sécurité et des conditions de travail, les conditions dans lesquelles les équipements de protection individuelle sont mis à disposition et utilisés, notamment celles concernant la durée de leur port. Il prend en compte la gravité du risque, la fréquence de l\'exposition au risque, les caractéristiques du poste de travail de chaque travailleur, et les performances des équipements de protection individuelle en cause.\n",null),
("176","Art.R.4412-11 et 21 du CdT.\nMoyen efficace assurant l’évacuation des vapeurs, gaz, aérosols ou poussières au niveau des postes de travail.\nArt.R.4412-16 , 17 et suivants du CdT.\nLorsque la substitution d\'un agent chimique dangereux n\'est pas possible au regard de la nature de l\'activité et de l\'évaluation des risques, le risque est réduit au minimum par la mise en œuvre, par ordre de priorité, des mesures suivantes :\n1° Conception des procédés de travail et contrôles techniques appropriés ;\n2° Utilisation des équipements et des matériels adéquats de manière à éviter ou à réduire le plus possible la libération d\'agents chimiques dangereux sur le lieu de travail ;\n3° Application, à la source du risque, des mesures efficaces de protection collective, telles qu\'une bonne ventilation et des mesures appropriées d\'organisation du travail ;\n4° Utilisation, si l\'exposition ne peut être réduite par d\'autres moyens, de moyens de protection individuelle, y compris d\'équipements de protection individuelle.\nL\'employeur prend les mesures techniques et définit les mesures d\'organisation du travail appropriées pour assurer la protection des travailleurs contre les dangers découlant des propriétés chimiques et physico-chimiques des agents chimiques.\nCes mesures portent, notamment, sur le stockage, la manutention et l\'isolement des agents chimiques incompatibles.\nA cet effet, l\'employeur prend les mesures appropriées pour empêcher :\n1° La présence sur le lieu de travail de concentrations dangereuses de substances inflammables ou de quantités dangereuses de substances chimiques instables ;\n2° Les risques de débordement ou d\'éclaboussures, ainsi que de déversement par rupture des parois des cuves, bassins, réservoirs et récipients de toute nature contenant des produits susceptibles de provoquer des brûlures d\'origine thermique ou chimique.\nLorsque les mesures techniques et d\'organisation prévues à l\'article R. 4412-17 ne sont pas réalisables au regard de la nature de l\'activité, l\'employeur prend, par ordre de priorité, les dispositions nécessaires pour : \n1° Eviter la présence sur le lieu de travail de sources d\'ignition susceptibles de provoquer des incendies ou des explosions, ou l\'existence de conditions défavorables pouvant aboutir à ce que des substances ou des mélanges de substances chimiques instables aient des effets physiques dangereux ; \n2° Atténuer les effets nuisibles pour la santé et la sécurité des travailleurs en cas d\'incendie ou d\'explosion résultant de l\'inflammation de substances inflammables, ou les effets dangereux dus aux substances ou aux mélanges de substances chimiques instables.",null),
("177","Art.R.4624-18 du Cdt:\nLes travaux pour lesquels une formation particulière est prévue par la réglementation (C.A.CE.S., habilitation électrique,…), et les postes de travail ayant été à l’origine d’un accident du travail ou d’une maladie professionnelle bénéficient d’une surveillance médicale renforcée.\n\n\n\n",null),
("178","Décret 2010-1016 fixant les obligations des employeurs (art R.4226-1 à 21 du CdT)\nDécret 2010-1018 relatif à la prévention des risques électriques (art R.4324-21 / R.4535-11 et 12 / R.4722-26 à 30 /R.4724-19 du CdT)\nDécret 2010-1118 relatif aux opérations effectuées sur les installations électriques ou dans leur voisinage (art R.4544-1 à 11 du CdT)\nDéfinition de l’habilitation par la norme NF C 18-510: Reconnaissance par l’employeur de la capacité d’une personne placée sous son autorité à accomplir les tâches qui lui sont confiées en sécurité vis à vis du risque électrique\nArt.R.4141-15 à 20 (17 abrogé) du CdT. \n\nL’autorité territoriale fait établir une habilitation,  signée par elle-même et la personne habilitée. Cette habilitation mentionne le type de travaux en électricité que l’agent peut effectuer (en correspondance avec la (les) formation(s) préalablement suivie(s)). \nImportant : avant d’être habilité le salarié doit avoir été déclaré apte . Pour habiliter une personne, le chef d’établissement doit tenir compte de l’avis du médecin de prévention.",null),
("179","Norme NF C 18-510\nDécret 2010-1118 relatif aux opérations effectuées sur les installations électriques ou dans leur voisinage (art R.4544-1 à 11 du CdT)\nL\'employeur maintient l\'ensemble des installations électriques permanentes en conformité avec les dispositions relatives à la conception des installations électriques applicables à la date de leur mise en service.\nArt.R.4226-17 à 19 du CdT:\nLes vérifications périodiques sont réalisées soit par un organisme accrédité, soit par une personne qualifiée appartenant à l\'entreprise et dont la compétence est appréciée par l\'employeur au regard de critères énoncés dans un arrêté du ministre chargé du travail et du ministre chargé de l\'agriculture.\nLes modalités et, le cas échéant, la périodicité des vérifications prévues aux articles R.4226-14, R.4226-16, R.4226-21 ainsi que le contenu des rapports de vérification correspondants sont fixés par arrêté des ministres chargés du travail et de l\'agriculture.\nLes résultats des vérifications prévues aux articles R.4226-14 et R.4226-16 ainsi que les justifications des travaux et modifications effectués pour porter remède aux défectuosités constatées sont consignés sur un registre. \n\nLorsque les vérifications sont effectuées par un organisme accrédité, les rapports établis à la suite de ces vérifications sont annexés à ce registre.",null),
("180","Norme NF C 18-510\nDécret 2010-1118 relatif aux opérations effectuées sur les installations électriques ou dans leur voisinage (art R.4544-1 à 11 du CdT)\n\nVeiller à ce que les armoires et les tableaux électriques soient correctement signalés avec un pictogramme de danger « Risque électrique »",null),
("181","Art.R.4433-1 à 7 du CdT. \nL’employeur évalue et, si nécessaire, mesure les niveaux de bruit auxquels les travailleurs sont exposés. Cette évaluation et ce mesurage ont pour but :\n1° De déterminer les paramètres physiques définis à l’article R. 4431-1 ;\n2° De constater si, dans une situation donnée, les valeurs d’exposition fixées à l’article R. 4431-2 sont dépassées.\nRappel : la réglementation définit 3 seuils :\n - à partir d’un niveau d’exposition quotidienne de 80 dB(A) ou d’un « pic » de 135 dB(A), les EPI antibruit doivent être mis à disposition\n - si ces niveaux dépassent 85 dB(A) ou atteignent un « pic » de 137 dB(A), le port des EPI devient obligatoire\n - les seuils de 87 dB(A) pour une exposition quotidienne et de 140 dB(A) en « pic » ne doivent en aucun cas être dépassés ; En cas contraire, des mesures de réduction de l’exposition au bruit doivent être prises immédiatement.",null),
("182","Les articles R. 4311-12 à R. 4311-15 du CdT définissant les équipements de protection individuelle.\nLes articles R. 4312-23 à R. 4314-5 du CdT fixant les règles techniques de conception et de fabrication et les procédures de certification de conformité applicables aux équipements de protection individuelle.\nLes articles R. 4321-4 à R. 4321-5 et R. 4323-91 à R. 4323-106 du CdT relatif à la mise à disposition et à l’utilisation des équipements de protection individuelle.\nL’arrêté du 19/03/1993 fixant la liste des équipements de protection individuelle qui doivent faire l’objet de vérifications générales périodiques\n\nCasques de protection : A utiliser dès qu’il existe un risque de chute de matériel d’un niveau supérieur, principalement sur les chantiers. Les casques doivent avoir un rôle d’anti-pénétration et d’amortisseur et être remplacés après un choc. La durée de vie du casque est variable selon son matériau de fabrication. Ces indications sont visibles sous la visière du casque.\n( La Norme NF EN 397 définit les exigences générales pour les casques de protection)\n",null),
("183","Art.R.4436-1 du CdT.\n  Lorsque l\'évaluation des risques fait apparaître que des travailleurs sont exposés sur leur lieu de travail à un niveau sonore égal ou supérieur aux valeurs d\'exposition inférieures, définies au 3° de l\'article R. 4431-2, l\'employeur veille à ce que ces travailleurs reçoivent des informations et une formation en rapport avec les résultats de l\'évaluation des risques et avec le concours du service de santé au travail. \n  Ces informations et cette formation portent, notamment, sur :\n  1° La nature de ce type de risque ;\n  2° Les mesures prises en application des chapitres IV et V, et, en cas de dépassement des valeurs limites d\'exposition, de l\'article R. 4434-6 en vue de supprimer ou de réduire au minimum les risques résultant de l\'exposition au bruit, y compris les circonstances dans lesquelles les mesures s\'appliquent ;\n  3° Les valeurs limites d\'exposition et les valeurs d\'exposition déclenchant l\'action de prévention fixées au chapitre premier ;\n  4° Les résultats des évaluations et des mesurages du bruit réalisés en application du chapitre III, accompagnés d\'une explication relative à leur signification et aux risques potentiels ;\n  5° L\'utilisation correcte des protecteurs auditifs individuels ;\n  6° L\'utilité et la façon de dépister et de signaler des symptômes d\'altération de l\'ouïe ;\n  7° Les conditions dans lesquelles les travailleurs ont droit à une surveillance médicale renforcée ;\n  8° Les pratiques professionnelles sûres, afin de réduire au minimum l\'exposition au bruit.\n",null),
("184","Art.R.4435-2 à 5 du CdT:\nUn travailleur dont l’exposition au bruit dépasse les valeurs d’exposition inférieures définies au 3º de l’article R. 4431-2 bénéficie, à sa demande ou à celle du médecin du travail, d’un examen audiométrique préventif. Cet examen a pour objectif le diagnostic précoce de toute perte auditive due au bruit et la préservation de la fonction auditive, lorsque l’évaluation et les mesurages prévus à l’article R. 4433-1 révèlent un risque pour la santé du travailleur.\n\nArt. R.4431-2 du CdT:\n  Les valeurs limites d\'exposition et les valeurs d\'exposition déclenchant une action de prévention sont fixées dans le tableau suivant :\n  VALEURS D\'EXPOSITION\n  NIVEAU D\'EXPOSITION\n  1° Valeurs limites d\'exposition   Niveau d\'exposition quotidienne au bruit de 87 dB (A) ou niveau de pression acoustique de crête de 140 dB (C)\n  2° Valeurs d\'exposition supérieures déclenchant l\'action de prévention prévue à l\'article R. 4434-3, au 2° de l\'article R. 4434-7, et à l\'article R. 4435-1\n  Niveau d\'exposition quotidienne au bruit de 85 dB (A) ou niveau de pression acoustique de crête de 137 dB (C)\n  3° Valeurs d\'exposition inférieures déclenchant l\'action de prévention prévue au 1° de l\'article R. 4434-7 et aux articles R. 4435-2 et R. 4436-1\n  Niveau d\'exposition quotidienne au bruit de 80 dB (A) ou niveau de pression acoustique de crête de 135 dB (C)",null),
("185","Valeurs de l’Exposition sonore quotidienne  ou  de pression acoustique de crête\nArt.R.4431-2  et Art.R.4434-1 à 10 du CdT:\nArt.R.4434-1 du CdT: \nLa réduction des risques d\'exposition au bruit se fonde sur, notamment :\n  1º La mise en oeuvre d\'autres procédés de travail ne nécessitant pas d\'exposition au bruit ou nécessitant une exposition moindre ;\n  2º Le choix d\'équipements de travail appropriés émettant, compte tenu du travail à accomplir, le moins de bruit possible ;\n  3º Dans le cas d\'équipements de travail utilisés à l\'extérieur des bâtiments, la possibilité de mettre à la disposition des travailleurs des matériels conformes\naux dispositions prises en application du décret nº 95-79 du 23 janvier 1995 concernant la lutte contre le bruit et relatif aux objets bruyants et aux dispositifs d\'insonorisation;\n  4º La modification de la conception et de l\'agencement des lieux et postes de travail ;\n  5º L\'information et la formation adéquates des travailleurs afin qu\'ils utilisent correctement les équipements de travail en vue de réduire au minimum leur exposition au bruit ;\n  6º Des moyens techniques pour réduire le bruit aérien en agissant sur son émission, sa propagation, sa réflexion, tels que réduction à la source, écrans, capotages, correction acoustique du local ;\n  7º Des moyens techniques pour réduire le bruit de structure, par exemple par l\'amortissement ou par l\'isolation ;\n  8º Des programmes appropriés de maintenance des équipements de travail et du lieu de travail ;\n  9º La réduction de l\'exposition au bruit par une meilleure organisation du travail, en limitant la durée et l\'intensité de l\'exposition et en organisant convenablement les horaires de travail, en prévoyant notamment des périodes de repos.",null),
("186","Art.R.4421-1 à 4 , Art.R.4422-1  et Art.R.4423-1 à 4 du CdT. le Décret n° 94-352 du 4 mai 1994 relatif à la protection des travailleurs contre les risques résultant de leur exposition à des agents biologiques et l\'Arrêté du 30 juin 1998 qui fixe la liste des agents biologiques pathogènes\nArt.R.4421-3 du CdT: \"  Les agents biologiques sont classés en quatre groupes en fonction de l\'importance du risque d\'infection qu\'ils présentent :\n  1° Le groupe 1 comprend les agents biologiques non susceptibles de provoquer une maladie chez l\'homme ;\n  2° Le groupe 2 comprend les agents biologiques pouvant provoquer une maladie chez l\'homme et constituer un danger pour les travailleurs. Leur propagation dans la collectivité est peu probable et il existe généralement une prophylaxie ou un traitement efficaces ;\n  3° Le groupe 3 comprend les agents biologiques pouvant provoquer une maladie grave chez l\'homme et constituer un danger sérieux pour les travailleurs.Leur propagation dans la collectivité est possible, mais il existe généralement une prophylaxie ou un traitement efficaces ;\n  4° Le groupe 4 comprend les agents biologiques qui provoquent des maladies graves chez l\'homme et constituent un danger sérieux pour les travailleurs. Le risque de leur propagation dans la collectivité est élevé. Il n\'existe généralement ni prophylaxie ni traitement efficace.\nArt.R.4423-1 du CdT: \" Pour toute activité susceptible de présenter un risque d’exposition à des agents biologiques, l’employeur détermine la nature, la durée et les conditions de l’exposition des travailleurs.\nPour les activités impliquant une exposition à des agents biologiques appartenant à plusieurs groupes, les risques sont évalués en tenant compte du danger présenté par tous les agents biologiques présents ou susceptibles de l’être du fait de cette activité.\"\nArt.R.4423-2 du CdT: \"L\'évaluation des risques est réalisée sur le fondement du classement prévu à l\'article R. 4421-3 et des maladies professionnelles dues à l\'exposition aux agents biologiques.\n  Cette évaluation tient compte de toutes les informations disponibles, notamment de celles relatives aux infections susceptibles d\'être contractées par les travailleurs du fait de leur activité professionnelle et de celles concernant les effets allergisants et toxiques pouvant résulter de l\'exposition aux agents biologiques.\nPour les agents biologiques pathogènes (grippe aviaire notamment) : info des agents sur les procédés de décontamination et de désinfection + mise en place des procédés de manipulation et d’élimination sans risque des déchets contaminés.\"\nArt.R.4423-3 du CdT:  \"Lors de l\'évaluation des risques, l\'employeur porte une attention particulière sur les dangers des agents biologiques susceptibles d\'être présents dans l\'organisme des patients ou de personnes décédées et chez les animaux vivants ou morts, dans les échantillons, les prélèvements et les déchets qui en proviennent.\"\nArt.R.4423-4 du CdT: \"  L\'employeur tient à la disposition de l\'inspection du travail et des agents du service de prévention des organismes de sécurité sociale les éléments ayant servi à l\'évaluation des risques.\null,null),
("187","Art.R.4422-1 du CdT: \" L\'employeur prend des mesures de prévention visant à supprimer ou à réduire au minimum les risques résultant de l\'exposition aux agents biologiques, conformément aux principes de prévention énoncés à l\'article L 4121-2 du CdT » \nArt.R.4424-1 du CdT: \"  Lorsque la nature de l\'activité le permet, l\'employeur évite l\'utilisation d\'un agent biologique dangereux pour la santé des travailleurs, en le remplaçant par un agent biologique qui, compte tenu des conditions d\'emploi et de l\'état des connaissances, n\'est pas ou est moins dangereux\"\nArt.R.4424-2 du CdT: \"Lorsque les résultats de l’évaluation des risques révèlent l’existence d’un risque pour la santé ou la sécurité des travailleurs, toute exposition à un agent biologique dangereux est évitée.\"\nArt.R.4424-3 du CdT: \" Lorsque l’exposition des travailleurs à un agent biologique dangereux ne peut être évitée, elle est réduite en prenant les mesures suivantes :\n1°) Limitation au niveau le plus bas possible du nombre de travailleurs exposés ou susceptibles de l’être ;\n2°) Définition des processus de travail et des mesures de contrôle technique ou de confinement visant à éviter ou à minimiser le risque de dissémination d’agents biologiques sur le lieu de travail ;\n3°) Signalisation dont les caractéristiques et les modalités sont fixées par un arrêté conjoint des ministres chargés du travail, de l’agriculture et de la santé ;\n4°) Mise en oeuvre de mesures de protection collective ou, lorsque l’exposition ne peut être évitée par d’autres moyens, de mesures de protection individuelle ;\n5°) Mise en oeuvre de mesures d’hygiène appropriées permettant de réduire ou, si possible, d’éviter le risque de dissémination d’un agent biologique hors du lieu de travail ;\n6°) Etablissement de plans à mettre en oeuvre en cas d’accidents impliquant des agents biologiques pathogènes ;\n7°) Détection, si elle est techniquement possible, de la présence, en dehors de l’enceinte de confinement, d’agents biologiques pathogènes utilisés au travail ou, à défaut, de toute rupture de confinement ;\n8°) Mise en oeuvre de procédures et moyens permettant en toute sécurité, le cas échéant, après un traitement approprié, d’effectuer le tri, la collecte, le stockage, le transport et l’élimination des déchets par les travailleurs. Ces moyens comprennent, notamment, l’utilisation de récipients sûrs et identifiables ;\n9°) Mise en oeuvre de mesures permettant, au cours du travail, de manipuler et de transporter sans risque des agents biologiques pathogènes.\"\n",null),
("188","Art.R.4426-1 à 13 du CdT: \" L’employeur établit, après avis du médecin du travail, une liste des travailleurs exposés à des agents biologiques des groupes 3 ou 4.   Il indique le type de travail réalisé, et, lorsque c’est possible, l’agent biologique auquel les travailleurs sont exposés ainsi que les données relatives aux expositions, aux accidents et aux incidents. \nLa liste est communiquée au médecin du travail et  est conservée au moins dix ans après la fin de l’exposition. Toutefois, lorsque les agents biologiques sont susceptibles de provoquer des maladies présentant une longue période d’incubation, elle est conservée aussi longtemps que des manifestations pathologiques sont possibles.\n(vaccination contre la leptospirose)\nArt.D.4152-3 du CdT: \"  Lorsque les résultats de l\'évaluation des risques à des agents biologiques pathogènes révèlent l\'existence d\'un risque d\'exposition au virus de la rubéole ou au toxoplasme, il est interdit d\'exposer une femme enceinte, sauf si la preuve existe que cette dernière est suffisamment protégée contre ces agents par son état d\'immunité.\n  L\'employeur prend, après avis du médecin du travail, les mesures nécessaires au respect de cette interdiction.\"\n\nCorps de métiers concernés\n1)Travail au contact d’humains ou de produits d’origine humaine (ATSEM, personnel d’accueil, services à la personne, métiers de la petite enfance, personnel soignant, aide à domicile, soins funéraires (thanatopraxie), pompes funèbres, personnel technique de laboratoire, agents de nettoyage…)\n2)Travail en restauration (Transport, stockage et transformation de produits animaux ou végétaux (viande, poisson, œufs, lait, céréales, fruits…))\n3)Traitement et élimination des déchets (Rippeurs (ou éboueurs), collecteurs des déchets de laboratoires et d’établissement de soins, personnel des centres de tri de déchets ménagers, salariés des centres de compostage, égoutiers, travailleurs des stations d’épuration ou des entreprises d’assainissement, plombiers, entretien des rivières …)\n4)Entretien et maintenance (Personnel de nettoyage dans tous les secteurs d’activité, employés de maintenance (maintenance d’automates de laboratoires, entretien de gaines de ventilation, électriciens ou plombiers intervenant dans un centre d’équarrissage…))\n5)Ordre public (Police municipale)",null),
("189","Art.R.4425-1 du CdT:  \"L’employeur fournit sur le lieu de travail des instructions écrites et, le cas échéant, des affiches portant sur la procédure à suivre :\n1° En cas d’accident ou d’incident grave mettant en cause un agent biologique pathogène ;\n2° Lors de la manipulation de tout agent biologique du groupe 4, notamment lors de son élimination.\null,null),
("190","Évaluation:\nArt.R.4444-1 à 5 du CdT:\nL\'employeur évalue et, si nécessaire, mesure les niveaux de vibrations mécaniques auxquels les travailleurs sont exposés. \nCette évaluation et ce mesurage ont pour but de déterminer les paramètres physiques définis à l\'article R. 4441-2 et d\'apprécier si, dans une situation donnée, les valeurs d\'exposition fixées au chapitre III sont dépassées.\n\nL\'évaluation des niveaux de vibrations mécaniques et, si nécessaire, le mesurage sont planifiés et réalisés par des personnes compétentes à des intervalles appropriés avec le concours, le cas échéant, du service de santé au travail.\n\nLes résultats de l\'évaluation des niveaux de vibrations mécaniques ou du mesurage sont conservés sous une forme susceptible d\'en permettre la consultation pendant une durée de dix ans.\nLes résultats de l\'évaluation des niveaux de vibrations mécaniques ou du mesurage sont tenus à la disposition des membres du comité d\'hygiène, de sécurité et des conditions de travail, des délégués du personnel ainsi que du médecin du travail. \nIls sont également tenus, sur leur demande, à la disposition de l\'inspection du travail, des agents des services de prévention des organismes de sécurité sociale et des agents des organismes de santé, de sécurité et des conditions de travail mentionnés l\'article L. 4643-1 du CdT.\n\nLorsqu\'il procède à l\'évaluation des risques, l\'employeur prend en considération : \n1° Le niveau, le type et la durée d\'exposition, y compris l\'exposition à des vibrations intermittentes ou à des chocs répétés ; \n2° Les valeurs limites d\'exposition ou les valeurs d\'exposition déclenchant l\'action de prévention fixées à l\'article R. 4443-2 ; \n3° Toute incidence sur la santé et la sécurité des travailleurs particulièrement sensibles à ce risque, notamment les femmes enceintes et les jeunes travailleurs de moins de 18 ans ; \n4° Toute incidence indirecte sur la sécurité des travailleurs résultant d\'interactions entre les vibrations mécaniques et le lieu de travail ou d\'autres équipements, notamment lorsque les vibrations mécaniques gênent la manipulation correcte des commandes ou la bonne lecture des appareils indicateurs, ou nuisent à la stabilité des structures ; \n5° Les renseignements sur les émissions vibratoires, fournis par les fabricants des équipements de travail, en application des règles techniques de conception auxquels ils sont soumis ; \n6° L\'existence d\'équipements de travail permettant de réduire les niveaux d\'exposition aux vibrations mécaniques et susceptibles d\'être utilisés en remplacement ; \n7° La prolongation de l\'exposition à des vibrations transmises à l\'ensemble du corps au-delà des heures de travail, par exemple lorsque la nature de l\'activité amène un travailleur à utiliser des locaux de repos exposés aux vibrations, sous la responsabilité de l\'employeur ; \n8° Des conditions de travail particulières, comme les basses températures ; \n9° Les conclusions tirées par le médecin du travail de la surveillance de la santé des travailleurs.\nLorsque les résultats de l\'évaluation des risques mettent en évidence des risques pour la santé ou la sécurité des travailleurs dus aux vibrations mécaniques, l\'employeur met en œuvre les mesures prévues aux chapitres II, III et VII ainsi que, sous réserve des prérogatives du médecin du travail, au chapitre VI.",null),
("191","Art.R.4442-1 et 2 du CdT:\nArt.R.4445-1 à 6 du CdT:\nPrévention:\n1)Pour protéger les travailleurs contre les effets des vibrations transmises au corps entier\n-Choisir des machines traitées contre les vibrations et correctement entretenues\n-Minimiser le couplage entre la machine et l’opérateur par une bonne opération de la machine et des postures confortables\n-Maintenir une température suffisante, en particulier pour les mains\n2)Pour protéger les travailleurs contre les effets des vibrations transmises aux membres supérieurs,\n-Choisir des machines traitées contre les vibrations et correctement entretenues\n-Minimiser le couplage entre la machine et l’opérateur par une bonne opération de la machine et des postures confortables\n-Maintenir une température suffisante, en particulier pour les mains.",null),
("192","Art.R.4446-2 à 4 du CdT:\nLorsqu\'un travailleur est atteint d\'une maladie ou d\'une affection identifiable, considérée par le médecin du travail comme résultant d\'une exposition à des vibrations mécaniques sur le lieu de travail, ce travailleur est informé par le médecin des résultats et de l\'interprétation des examens médicaux dont il a bénéficié.\n\nL\'employeur est informé par le médecin du travail de toute conclusion significative provenant notamment du suivi de l\'état de santé du salarié exercé par le professionnel de santé mentionné au premier alinéa de l\'article L. 4624-1, dans le respect du secret médical.\nL\'employeur en tire toutes les conséquences utiles, et notamment :\n1° Revoit l\'évaluation des risques conformément au chapitre IV ;\n2° Revoit les mesures prévues pour supprimer ou réduire les risques conformément au chapitre V ;\n3° Tient compte de l\'avis du médecin du travail pour la mise en œuvre de toute mesure jugée nécessaire pour supprimer ou réduire les risques conformément au chapitre V, y compris l\'éventuelle affectation du travailleur à un autre poste ne comportant plus de risque d\'exposition.\nLe médecin du travail détermine la pertinence et la nature des examens éventuellement nécessaires pour les travailleurs ayant subi une exposition semblable à celle d\'un travailleur atteint d\'une maladie ou affection susceptible de résulter d\'une exposition à des vibrations.\n",null),
("193","Décret 91-451 du 14/05/1991 relatif aux risques liés au travail sur écrans de visualisation et Circulaire d’application DRT n°91-18 du 4 novembre 1991\nArt.R.4542-1 à 19 du CdT:\nArt.R.4542-3 du CdT:\nAprès analyse des conditions de travail et évaluation des risques, de tous les postes comportant un écran de visualisation, l\'employeur prend les mesures appropriées pour remédier aux risques constatés.\n\nArt.R.4542-4 du CdT:\nL\'employeur organise l\'activité du travailleur de telle sorte que son temps quotidien de travail sur écran soit périodiquement interrompu par des pauses ou par des changements d\'activité réduisant la charge de travail sur écran.\n\nArt.R.4542-16 du CdT:\nL\'employeur assure l\'information et la formation des travailleurs sur les modalités d\'utilisation de l\'écran et de l\'équipement de travail dans lequel cet écran est intégré. Chaque travailleur en bénéficie avant sa première affectation à un travail sur écran et chaque fois que l\'organisation du poste de travail est modifiée de manière substantielle.\n\nUne norme internationale intitulée \"Exigences ergonomiques pour travail de bureau avec terminaux à écrans de visualisation\" (ISO 9241) est publiée par l\'Association française de normalisation (AFNOR) sous l\'indice de classement X35-122. Elle concerne l\'affichage, l\'environnement et l\'aménagement du poste, les dispositifs d\'entrée et l\'ergonomie du logiciel. \n\nUne norme française NF X 35-102 est dédiée à la conception ergonomique des espaces de travail en bureaux. Elle fixe les surfaces minimales pour les salariés dans ces espaces.\n",null),
("194","« L\'éclairage doit être conçu et réalisé de manière à éviter la fatigue visuelle, ainsi que les affections de la vue qui en résultent, et permettre de déceler les risques perceptibles à la vue. Les locaux de travail doivent autant que possible disposer d\'une lumière naturelle suffisante »\n\nLe décret n° 83-721 fixe des valeurs minimales à respecter pour l\'éclairement général dans quatre situations intérieures et deux situations extérieures. Ces niveaux d\'éclairement doivent être assurés pendant la présence du personnel, sur le plan de travail ou sur le sol.\nCes valeurs sont minimales dans l\'espace et dans le temps. C\'est à dire :\n•	que l\'éclairement en tout point du local doit leur être au moins égal.\n•	et que ces minima doivent être respectées en cours d\'exploitation en tout moment, quelques soient les contraintes liées à l\'activité (poussières, fumées) ou au vieillissement des installations (usure des lampes, empoussièrement des luminaires ou des parois du local)\n\nDans le décret, plusieurs dispositions sont énoncées pour éviter l\'éblouissement: \n- d\'abord, la protection contre le rayonnement solaire est obligatoire \n- ensuite le décret rend obligatoire « des dispositions appropriées pour la protection contre l\'éblouissement et la fatigue visuelle provoqués par des surfaces à forte luminance ou des rapports de luminance excessifs entre surfaces voisines »\n\nL’article R.232-7 du code du Travail précise :\n- Pour les Voies de circulation intérieure : Éclairement minimal 40 Lux\n- Pour les Vestiaires et Sanitaires : Éclairement minimal 120 Lux\n- Pour les Locaux aveugles affectés à un travail permanent 200 Lux\nPour les Espaces extérieurs\n- Pour les Voies de circulation : Éclairement minimal 10 Lux\n- Pour les Espaces extérieurs où est effectué un travail permanent : Éclairement minimal 40 Lux\nPour l’Éclairage de locaux particuliers / Zones de travail\n- Pour la Mécanique moyenne, Dactylographie, Travaux de bureaux : Éclairement minimal 200 Lux\n- Pour le Travail de petites pièces, Bureau de dessin, mécanographie : Éclairement minimal 300 Lux\n- Pour la Mécanique fine, gravure, comparaison de couleur, Dessin difficile … : Éclairement minimal 400 Lux\n- Pour la Mécanique de précision, Électronique fine, Contrôles divers : Éclairement minimal 600 Lux\n",null),
("195","Art.R.4542-3 du CdT:\nAprès analyse des conditions de travail et évaluation des risques de tous les postes comportant un écran de visualisation, l\'employeur prend les mesures appropriées pour remédier aux risques constatés.\n\nArt.R.4542-8 du CdT:\nL\'espace de travail obéit aux caractéristiques suivantes :\n1° Le plateau de la table ou de la surface de travail a une surface peu réfléchissante et de dimensions suffisantes pour permettre de modifier l\'emplacement respectif de l\'écran, du clavier, des documents et du matériel accessoire ;\n2° Le support de documents est stable et réglable. Il se situe de telle façon que les mouvements inconfortables de la tête, du dos et des yeux soient évités au maximum ;\n3° L\'espace de travail est suffisant pour permettre une position confortable pour les travailleurs.\n\nArt.R.4542-9 du CdT:\nLe siège est, s\'il y a lieu, adaptable en hauteur et en inclinaison.\nUn repose-pieds est mis à la disposition des travailleurs qui en font la demande.\n\n\nConcernant l’aménagement intérieur des bureaux, le CT exige d’avoir un mobilier de bureau adapté. \nL’INRS (l’Institut National de Recherche et de Sécurité) dans un document synthétique, communique ses préconisations en matière de mobilier bureaux afin que celui-ci réponde au mieux aux exigences du CdT. \n",null),
("196","Art.R.4542-4 du CdT:\nL\'employeur organise l\'activité du travailleur de telle sorte que son temps quotidien de travail sur écran soit périodiquement interrompu par des pauses ou par des changements d\'activité réduisant la charge de travail sur écran.\n\nArt.R.4542-5 du CdT:\nPour l\'élaboration, le choix, l\'achat et la modification de logiciels ainsi que pour la définition des tâches impliquant l\'utilisation d\'écrans de visualisation, l\'employeur prend en compte les facteurs suivants, dans la mesure où les exigences ou les caractéristiques intrinsèques de la tâche ne s\'y opposent pas :\n1° Le logiciel est adapté à la tâche à exécuter ;\n2° Le logiciel est d\'un usage facile et est adapté au niveau de connaissance et d\'expérience de l\'utilisateur ;\n3° Les systèmes fournissent aux travailleurs des indications sur leur déroulement ;\n4° Les systèmes affichent l\'information dans un format et à un rythme adaptés aux opérateurs ;\n5° Les principes d\'ergonomie sont appliqués en particulier au traitement de l\'information par l\'homme.\n\n",null),
("197","Le Code du Travail n’impose pas de surface minimale ni d’aménagements obligatoires par poste de travail, mais le respect de règles de sécurité, de santé et de bien-être. Des normes prévoient cependant de telles dispositions, notamment pour les salariés travaillant devant des écrans.\nSelon la norme NF 35-102, les surfaces minimales par poste de travail sont les suivantes : \n- 10 m2 pour 1 personne ; \n- 12 m2 pour 2 personnes ; \n- 21 m2 pour 3 personnes ; \n- 32 m2 pour 4 personnes ; \n- 45 m2 pour 5 personnes ; \n- 10 m2 supplémentaires par personne au-delà de 6. \nCette surface comprend le débattement du poste, c’est-à-dire l’espace permettant au salarié d’exécuter les mouvements induits par son travail. \nDans cet espace de débattement, le plan de travail lui-même doit mesurer 1,20 m de long sur 80 cm de profondeur. Elle comprend également l’emplacement des meubles et équipements permanents et occasionnels. Naturellement, lorsque le travail concerné nécessite l’ajout d’équipements, la surface doit être augmentée. \n\nEn outre, pour accéder à son poste, le salarié doit disposer d’une largeur de passage suffisante de 80 cm à 1,20 m.\n",null),
("198","Protocole de sécurité\nArt.R.4515-1 à 11 du CdT\n(Décret n° 92-158 du 20 février 1992 et Arrêté du 26 avril 1996)\nLes opérations de chargement ou de déchargement, font l\'objet d\'un document écrit, dit « protocole de sécurité », remplaçant le plan de prévention.\nLe protocole de sécurité comprend les informations utiles à l\'évaluation des risques de toute nature générés par l\'opération ainsi que les mesures de prévention et de sécurité à observer à chacune des phases de sa réalisation.\nL’arrêté du 26 avril 1996 stipule que le protocole doit être établi :\n1) Dans le cadre d’un échange préalable à la réalisation de chaque opération\n2) Une seule fois dans le cas d’opérations répétitives.",null),
("199","Art.R.4511-1 à R.4514-10 du CdT:\ndécret 92-158 du 20 février 1992 (circulaire DRT 93/14 du 18 mars 1993 pour application)\narrêté du 19 mars 1993 fixant liste des travaux dangereux\nArt.R.4512-6 du CdT:\n - Dès lors que les tâches à effectuer comportent des “ travaux dangereux ” (liste définie par l’arrêté du 19 mars 1993), ou que l’opération représente un nombre total d’heures de travail prévisibles d’au moins 400 heures sur une période égale au plus à 12 mois (que les travaux soient continus ou discontinus), un plan de prévention doit obligatoirement être établi par écrit avant le début des travaux.\n - Ce plan de prévention doit comporter au moins les éléments suivants :\n. la définition des phases d’activité dangereuses et des moyens de prévention correspondants\n. l’adaptation des matériels et installations à la nature des opérations à effectuer\n. les instructions à donner au personnel\n. l’organisation mise en place pour assurer les premiers secours\n. les postes de travail qui relèvent d’une surveillance médicale spéciale\n - Pendant l’exécution des travaux, l’autorité territoriale organise avec les responsables des entreprises extérieures des  inspections et réunions périodiques afin d’assurer la coordination générale des mesures de prévention. L’autorité territoriale doit signaler aux entreprises toute situation de danger grave.",null),
("200","Effondrement - Blindage des fouilles: \nArt R 4534-24 du CdT (anciennement Décret du 8 janvier 1965 -Art.66 modifié)\nLes fouilles en tranchée de plus de 1,30 mètre de profondeur et d’une largeur égale ou inférieure aux deux tiers de la profondeur sont, lorsque leurs parois sont verticales ou sensiblement verticales, blindées, étrésillonnées ou étayées. \nRisques bactériologique: Vaccination (leptospirose) pour les agents particulièrement exposés sur conseil du médecin de prévention\nRisques biologiques: Surinfection de plaies,  Tétanos,  Morsures par des rongeurs ou des serpents, Piqûres d’insectes",null),
("201","Art.R.4321-4 du CdT:\nL’employeur met à la disposition des travailleurs, en tant que de besoin, les équipements de protection individuelle appropriés et, lorsque le caractère particulièrement insalubre ou salissant des travaux l’exige, les vêtements de travail appropriés. Il veille à leur utilisation effective.",null);
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