SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `base_inspection_cdg`
--




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




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;