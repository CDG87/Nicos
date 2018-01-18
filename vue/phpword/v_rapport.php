<?php 

require_once dirname(__FILE__).'/PHPWord-master/src/PhpWord/Autoloader.php';
\PhpOffice\PhpWord\Autoloader::register();
require_once ('jpgraph-4.1.1/jpgraph-4.1.1/src/jpgraph.php');
require_once ('jpgraph-4.1.1/jpgraph-4.1.1/src/jpgraph_radar.php');

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\Style\Font;

$document = new PhpWord();

if(isset($_SESSION['choix_creation'])) {
	
	/*************************** STYLES ***************************/

	//Style titre page de garde
	$document->addFontStyle('title_p_garde', array('bold' => true, 'size' => 30, 'allCaps' => true, 'color' => '#1034A6', 'align'=>'center'));
	$document->addParagraphStyle('center', array('size' => 12, 'align'=>'center', 'spaceAfter'=>100));
	$document->addFontStyle('title_partie', array('bold' => true, 'size' => 25, 'allCaps' => true, 'color' => '#107fb7'));
	$document->addFontStyle('subtitle_p_garde', array('bold' => true, 'size' => 20, 'color' => '#0F9DE8'));
	$document->addFontStyle('coord_contr', array('italic' => true, 'size' => 8));
	$document->addFontStyle('conclu', array('italic' => true, 'size' => 11));
	$document->addFontStyle('coord_audit', array('size' => 12));

	
	$document->addFontStyle('introFstyle', array('bold'=>true, 'italic'=>false, 'size'=>12));
	$document->addParagraphStyle('introPstyle', array('align'=>'center', 'spaceAfter'=>100));
	
	$document->addFontStyle('tabFont', array('bold'=>true, 'italic'=>false, 'size'=>12));
	$document->addParagraphStyle('tabPar', array('align'=>'left', 'spaceAfter'=>10));
	
	//Style infos cdg87
	$document->addFontStyle('foot_cdg', array('size' => 10, 'color' => '#000000'));

	//style couleur observations
	$document->addFontStyle('obs_color_v', array('color' => 'green'));
	$document->addFontStyle('obs_color_r', array('color' => 'red'));
	//style petits titres (theme, sous-theme, critere)
	$document->addFontStyle('titre_infos_partie', array('size' => 16, 'color' => '666666'));

	// Define the TOC font style
	$fontStyle = array('spaceAfter' => 60, 'size' => 12);

	// Add title styles
	$document->setDefaultParagraphStyle(array('align'=>'left','spaceAfter'=>1));
	$document->addParagraphStyle('st1',array('spaceBefore'=>170,'spaceAfter'=>100));
	$document->addTitleStyle(1, array('bold' => true, 'size' => 25, 'allCaps' => true, 'color' => '#107fb7')); 		//titres
	$document->addTitleStyle(3, array('underline' => 'single', 'align'=>'center', 'size' => 20, 'color' => '333333', 'bold' => true));
	 //titres
	$document->addTitleStyle(2, array('size' => 16, 'color' => '666666'));
	//sous-titres


	// Define table style arrays
	$styleTable = array('borderSize'=>6, 'borderColor'=>'107fb7', 'cellMargin'=>80);
	$styleFirstRow = array('borderBottomSize'=>18, 'borderBottomColor'=>'1034A6', 'bgColor'=>'0F9DE8');
	// Define cell style arrays
	$styleCell = array('valign'=>'center');
	// Add table style
	$document->addTableStyle('myOwnTableStyle', $styleTable, $styleFirstRow);
	
	
	/*************************** SECTION ***************************/

	//Section
	$section = $document->addSection();


	/*************************** HEADER ***************************/


	// Add first page header
	$header = $section->addHeader();
	$header->firstPage();
	$table = $header->addTable();
	$table->addRow();
	$cell = $table->addCell(4500);
	$textrun = $cell->addTextRun();
	$textrun->addText("Pôle Santé et Sécurité au Travail", 'pole');
	$textrun->addTextBreak(1);
	$textrun->addText("Service Prévention des Risques Professionnels");
	$table->addCell(4500)->addImage(
		'images/'.$infoCentre['LOGO'],
		array('height' => 100, 'align' => 'right')
	);

		$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
	
	$section->addTextBreak(5);
	if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
	$section->addText("Rapport", 'title_p_garde', 'center'); //titre page de garde
	}else{
		$section->addText("Rapport", 'title_p_garde', 'center'); //titre page de garde
		$section->addText("De visite", 'title_p_garde', 'center'); //titre page de garde
	}
	$section->addTextBreak(1);
	//Nature de la mission
	if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
	$section->addText("De contrôle des conditions d'application des règles définies en matière d'hygiène et de sécurité du travail dans la fonction publique territoriale.",  'introFstyle', 'introPstyle');
	$section->addTextBreak(1);
	
	//Référentiel
	$section->addText("Décret n° 85-603 du 10 juin 1985 modifié, partie IV du Code du Travail et les décrets pris pour application.",  'introFstyle', 'introPstyle');
	}
	$section->addImage('images/page_garde.jpg', array('width' => 300, 'align' => 'center'));
	$section->addTextBreak(3);
	foreach($lesInfosStructure as $uneInfoStructure) {
		$section->addText(htmlspecialchars($uneInfoStructure['NOM_STRUCTURE']), 'title_partie', 'center');
	}
	$section->addTextBreak(10);
	$section->addText(htmlspecialchars($infoCentre['NOM']), 'coord_contr', 'center');
		$section->addText(htmlspecialchars($infoCentre['ADRESSE']." - ".$infoCentre['CP']." ".$infoCentre['VILLE']." Cedex"), 'coord_contr','center');
		$section->addText(htmlspecialchars("Tel : ".$infoCentre['TEL']." - Fax : ".$infoCentre['FAX']." - Site internet : ".$infoCentre['SITE']),'coord_contr','center');
		
	$section->addPageBreak(); //saut de page

	
	if($_SESSION['choix_creation'] == "choix") {
		
		foreach($lesInfosStructure as $uneInfoStructure) {
			
			
			
			/*************************** IDENTIFICATION AUDIT ***************************/
			if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
			$section->addTitle(htmlspecialchars('Informations contrôleur'), 3);
			}else{
				$section->addTitle(htmlspecialchars('conseiller en prevention'), 3);
			}
			foreach($lesInfosControleur as $uneInfoControleur) {
				$section->addText(htmlspecialchars($uneInfoControleur['PRENOM_CONTROLEUR'] . ' ' . $uneInfoControleur['NOM_CONTROLEUR']),'coord_audit');
				if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
				$section->addText(htmlspecialchars($uneInfoControleur['FONCTION_CONTROLEUR']),'coord_audit');
				}
				$section->addText(htmlspecialchars($uneInfoControleur['AFFECTATION_CONTROLEUR']),'coord_audit');
				$section->addText(htmlspecialchars("Tél fixe : " . $uneInfoControleur['TEL_FIXE_CONTROLEUR']),'coord_audit');
				$section->addText(htmlspecialchars("Tél mobile : " . $uneInfoControleur['TEL_MOBILE_CONTROLEUR']),'coord_audit');
				$section->addText(htmlspecialchars("Email : " . $uneInfoControleur['EMAIL_CONTROLEUR']),'coord_audit');
			}
			$section->addTextBreak(1);
			
			//Adresse structure
			$section->addTitle(htmlspecialchars('Coordonnées de la structure'), 3);
			$section->addText(htmlspecialchars($uneInfoStructure['NOM_STRUCTURE']), 'coord_audit');
			$section->addText(htmlspecialchars($uneInfoStructure['ADRESSE_STRUCTURE']), 'coord_audit');
			$section->addText(htmlspecialchars($uneInfoStructure['CP_STRUCTURE']), 'coord_audit');
			$section->addText(htmlspecialchars($uneInfoStructure['VILLE_STRUCTURE']), 'coord_audit');
			
			$section->addTextBreak(1);
		}
		
		
		//Date du controle
		if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
		$section->addTitle(htmlspecialchars('Date du contrôle'), 3);
		
		}else{
			$section->addTitle(htmlspecialchars('Date de la visite'), 3);
		}
		foreach($datesAudit as $uneDate) {
			
			$section->addText(htmlspecialchars(dateAnglaisVersFrancais($uneDate['DATE_AUDIT'])), 'coord_audit');
			
			for($i = 2; $i < 5; $i++) {
				
				if($uneDate["DATE_AUDIT_$i"] != null) {
					$section->addText(htmlspecialchars(dateAnglaisVersFrancais($uneDate["DATE_AUDIT_$i"])), 'coord_audit');
				}	
			}			
		}
		
		$section->addTextBreak(1);
		
		//Participants
		if($nbParticipant['NB']!=0){
			$section->addTitle(htmlspecialchars('Participants'), 3);
			foreach($lesParticipants as $unParticipant) {
				
				if($unParticipant['CODE_CIVILITE_PARTICIPANT'] == 0) {
					$civilite = 'M.';
				}else {
					$civilite = 'Mme';
				}
			$section->addText(htmlspecialchars($civilite . ' ' . $unParticipant['NOM_PARTICIPANT'] . ' ' . $unParticipant['PRENOM_PARTICIPANT'].' : '.$unParticipant['NOM_FONCTION_PARTICIPANT']), 'coord_audit');
			$section->addTextBreak(1);	
				
			}
		}
		

		
		//Batiments controlés
		if($lesBatimentsControles != array()){
			if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
			$section->addTitle(htmlspecialchars('Bâtiments contrôlés'), 3);
			
			}else{
				$section->addTitle(htmlspecialchars('Bâtiments visités'), 3);
			}
			foreach($lesBatimentsControles as $unBatimentControle) {
				$section->addText(htmlspecialchars($unBatimentControle['NOM_BATIMENT']), 'coord_audit');
			}
			$section->addTextBreak(1);
		}
		
		
		//Diffusion du rapport
		$section->addTitle(htmlspecialchars('Diffusion du rapport'), 3);

		foreach($lesPersonnesDiff as $unePersonneDiff) {
			$section->addText(htmlspecialchars($unePersonneDiff['LIBELLE_PERSONNE']), 'coord_audit');
		}

		$section->addPageBreak(); //saut de page
		
		if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
			//Base réglementaire 
			$section->addTitle(htmlspecialchars('Base réglementaire '), 3);
			$section->addText(htmlspecialchars("La mission d’inspection est encadrée par le décret n° 85-603 du 10 juin 1985 modifié à l’article 5"));
			$section->addText(htmlspecialchars("« Art. 5 - L'autorité territoriale désigne également, après avis du comité mentionné à l'article 39, le ou les agents qui sont chargés d'assurer une fonction d'inspection dans le domaine de l'hygiène et de la sécurité ou peut passer convention à cet effet avec le centre de gestion."));
			$section->addText(htmlspecialchars("Ces agents contrôlent les conditions d'application des règles d’hygiène et de sécurité et proposent à l'autorité territoriale compétente toute mesure qui leur paraît de nature à améliorer l'hygiène et la sécurité du travail et la prévention des risques professionnels. En cas d'urgence ils proposent à l'autorité territoriale les mesures immédiates qu'ils jugent nécessaires. L'autorité territoriale les informe des suites données à leurs propositions... »"));
			
			$section->addTextBreak(9);
		}
		
		//Objectifs visés par le CDG87
		$section->addTitle(htmlspecialchars('Objectifs visés par le CDG87'), 3);
		$section->addText(htmlspecialchars("Il s'agit d'un diagnostic permettant d'apporter une appréciation extérieure et objective des difficultés rencontrées. Il n'a cependant pas pour objectif de recenser tous les risques de façon exhaustive, l'ensemble des activités ne pouvant être observé."));
		$section->addText(htmlspecialchars("Ce rapport vise à constituer un véritable outil d'aide à la décision permettant de planifier les investissements matériels et les ajustements organisationnels à réaliser."));
		$section->addText(htmlspecialchars("En effet, au-delà de l’aspect de conformité réglementaire ou de non-conformité, l’ensemble des points analysés est complété de diverses recommandations et de pistes de réflexion destinées aux acteurs de la prévention au sein de la structure."));
		$section->addText(htmlspecialchars("La mission d’inspection n’est pas une mission de conseil stricto sensu. Cependant, elle vise à aller au-delà d’un simple audit réglementaire afin de proposer à la collectivité un véritable outil d’aide à la décision grâce au rapport."));
		
		$section->addTextBreak(9);
		//Composition du rapport 
		$section->addTitle(htmlspecialchars('Composition du rapport '), 3);
		$section->addText(htmlspecialchars("Ce rapport est un instantané des conditions de santé et de sécurité dans lesquelles travaillent les agents de la structure. Basé sur une analyse organisationnelle et une visite des locaux, il permet d’avoir une vue d’ensemble des conditions d’application des règles d’hygiène et de sécurité dans la structure. Ce rapport ne prétend pas être exhaustif, toutes les situations de travail ne pouvant être abordées."));
		
		$section->addPageBreak(); //saut de page
		
	}else if($_SESSION['choix_creation'] == "creer") {
		
		foreach($lesInfosStructure as $uneInfoStructure) {};
		if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
		$section->addText(htmlspecialchars($_SESSION['libelle_audit']), 'title_partie', 'center'); //titre du rapport
		}
		$section->addTextBreak(3);
		
		/*************************** IDENTIFICATION AUDIT ***************************/
		if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
		$section->addTitle(htmlspecialchars('Infos contrôleur'), 3);
		}else{
			$section->addTitle(htmlspecialchars('conseiller en prévention'), 3);
		}
		foreach($lesInfosControleur as $uneInfoControleur) {
			$section->addText(htmlspecialchars($uneInfoControleur['PRENOM_CONTROLEUR'] . ' ' . $uneInfoControleur['NOM_CONTROLEUR']),'coord_audit');
			if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
			$section->addText(htmlspecialchars($uneInfoControleur['FONCTION_CONTROLEUR']),'coord_audit');
			}
			$section->addText(htmlspecialchars($uneInfoControleur['AFFECTATION_CONTROLEUR']),'coord_audit');
			$section->addText(htmlspecialchars("Tél fixe : " . $uneInfoControleur['TEL_FIXE_CONTROLEUR']),'coord_audit');
			$section->addText(htmlspecialchars("Tél mobile : " . $uneInfoControleur['TEL_MOBILE_CONTROLEUR']),'coord_audit');
			$section->addText(htmlspecialchars("Email : " . $uneInfoControleur['EMAIL_CONTROLEUR']),'coord_audit');
		}
		$section->addTextBreak(2);
		
		//Adresse structure
		$section->addTitle(htmlspecialchars('Coordonnées de la structure'), 3);
		$section->addText(htmlspecialchars("Nom : " . $_SESSION['nom_structure']));
		$section->addText(htmlspecialchars($adresseStructure['ADRESSE_STRUCTURE']));
		$section->addText(htmlspecialchars($adresseStructure['CP_STRUCTURE']));
		$section->addText(htmlspecialchars($adresseStructure['VILLE_STRUCTURE']));
		// if($adresseStructure['TELEPHONE_STRUCTURE'] == "" || $adresseStructure['EMAIL_STRUCTURE']) {
			// $section->addText(htmlspecialchars("Tél : "));
			// $section->addText(htmlspecialchars("Email : "));
		// }else {
			// $section->addText(htmlspecialchars("Tél : " . $adresseStructure['TELEPHONE_STRUCTURE']));
			// $section->addText(htmlspecialchars("Email : " . $adresseStructure['EMAIL_STRUCTURE']));
		// }

		$section->addTextBreak(2);

		//Date du controle
		if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
		$section->addTitle(htmlspecialchars('Date du contrôle'), 3);
		}else{
			$section->addTitle(htmlspecialchars('Date de la visite'), 3);
		}
		
		foreach($datesAudit as $uneDate) {
			
			$section->addText(htmlspecialchars(dateAnglaisVersFrancais($uneDate['DATE_AUDIT'])));
			
			for($i = 2; $i < 5; $i++) {
				
				if($uneDate["DATE_AUDIT_$i"] != null) {
					$section->addText(htmlspecialchars(dateAnglaisVersFrancais($uneDate["DATE_AUDIT_$i"])));
				}	
			}			
		}
		$section->addTextBreak(2);
		
		//Participants
		if($nbParticipant['NB']!=0){
			$section->addTitle(htmlspecialchars('Participants'), 3);

			foreach($lesParticipants as $unParticipant) {
				
				if($unParticipant['CODE_CIVILITE_PARTICIPANT'] == 0) {
					$civilite = 'M.';
				}else {
					$civilite = 'Mme';
				}
			
				$section->addText(htmlspecialchars($civilite . ' ' . $unParticipant['NOM_PARTICIPANT'] . ' ' . $unParticipant['PRENOM_PARTICIPANT'].' : '.$unParticipant['NOM_FONCTION_PARTICIPANT']));
				
			}
		}
		$section->addTextBreak(2);
		//Batiments controlés
		if($lesBatimentsControles != array()){
			if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
			$section->addTitle(htmlspecialchars('Bâtiments contrôlés'), 3);
			}else{
				$section->addTitle(htmlspecialchars('Bâtiments visités'), 3);
			}
			foreach($lesBatimentsControles as $unBatimentControle) {
				$section->addText(htmlspecialchars($unBatimentControle['NOM_BATIMENT']));
			}
			$section->addTextBreak(2);
		}
			
		//Diffusion du rapport
		$section->addTitle(htmlspecialchars('Diffusion du rapport'), 3);

		foreach($lesPersonnesDiff as $unePersonneDiff) {
			$section->addText(htmlspecialchars($unePersonneDiff['LIBELLE_PERSONNE']));
		}

		$section->addPageBreak(); //saut de page
			
	}

	/*************************** TABLE DES MATIERES ***************************/

	// Add text elements
	// $section->addTitle(htmlspecialchars('Table des matières'), 1);
	// $section->addTextBreak(2);

	// Add TOC #1
	// $toc = $section->addTOC($fontStyle);
	// $section->addTextBreak(2);

	// $section->addPageBreak(); //saut de page

	/*************************** EXPLICATIONS  *************************************/
	if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
		//Titre partie
		$section->addText("Lecture du rapport", 'title_partie', 'center');
		$section->addTextBreak(1);
		$section->addTitle(htmlspecialchars('La grille de contrôle'), 3);
		$section->addText(htmlspecialchars("Les observations faites lors du contrôle sont retranscrites dans deux parties distinctes : "));
		$section->addText(htmlspecialchars("Organisationnelle : Analyse de l’organisation et de la mise en œuvre d’une politique de prévention pouvant s’appuyer sur des déclarations sur l’honneur."));
		$section->addText(htmlspecialchars("Sur site : Analyse des risques spécifiques et des activités s’appuyant sur des observations terrain."));
		$section->addTextBreak(1);
		$section->addTitle(htmlspecialchars('La conformité des contrôles'), 3);
		$section->addText(htmlspecialchars("L’évaluation est réalisée suivant 4 niveaux de conformité :"));
		$section->addText(htmlspecialchars("La vérification peut concerner un seul service, un seul lieu, un seul matériel ou une activité spécifique ; elle ne préjuge pas des autres secteurs ou autres matériels non contrôlés."));
		$section->addTextBreak(1);
		
		if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
			$table1 = $section->addTable();
			$table1->addRow();
			$cell = $table1->addCell(1000);
			$cell->addImage('images/conforme.png', array('width' => 50));
			$cell = $table1->addCell(10000);
			$cell->addText(htmlspecialchars("Le critère contrôlé est « conforme » à la règlementation et/ou aux recommandations"));
			$section->addTextBreak(1);
			$table2 = $section->addTable();
			$table2->addRow();
			$cell = $table2->addCell(1000);
			$cell->addImage('images/plutotConforme.png', array('width' => 50));
			$cell = $table2->addCell(10000);
			$cell->addText(htmlspecialchars("Le critère contrôlé est en partie « conforme » à la règlementation et/ou aux recommandations "));
			$section->addTextBreak(1);
			$table3 = $section->addTable();
			$table3->addRow();
			$cell = $table3->addCell(1000);
			$cell->addImage('images/plutotNonConforme.png', array('width' => 50));
			$cell = $table3->addCell(10000);
			$cell->addText(htmlspecialchars("Le critère contrôlé est en partie « non conforme » à la règlementation et/ou aux recommandations"));
			$section->addTextBreak(1);
			$table4 = $section->addTable();
			$table4->addRow();
			$cell = $table4->addCell(1000);
			$cell->addImage('images/nonConforme.png', array('width' => 50));
			$cell = $table4->addCell(10000);
			$cell->addText(htmlspecialchars("Le critère contrôlé est « non conforme » à la règlementation et/ou aux recommandations"));
		}
		
		$section->addTextBreak(1);
		$section->addText(htmlspecialchars("La règlementation et/ou les recommandations relatives à chaque critère sont à prendre en compte au jour de la visite, les dernières versions règlementaires en vigueur sont disponibles sur le site www.legifrance.gouv.fr ou auprès du service de prévention des risques professionnels du Centre Départemental de Gestion de la Haute-Vienne."));
		$section->addTextBreak(1);
		
		if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
			$section->addTitle(htmlspecialchars('Principales remarques et propositions'), 3);
			$section->addText(htmlspecialchars("Rétrospective des remarques les plus marquantes sur lesquelles des actions doivent être mises en œuvre et pour lesquelles le Comité doit être informé et un retour à l’ACFI doit être effectué."));
			$section->addTextBreak(1);
			$section->addTitle(htmlspecialchars('Le bilan des non-conformités'), 3);
			$section->addText(htmlspecialchars("L'objectif étant de répertorier les non-conformités les plus fréquentes dans la partie organisationnelle, en fonction des bâtiments contrôlés et selon les familles de risques."));
			$section->addPageBreak(); //saut de page
		}
	}

	/*************************** PARTIE ORGANISATIONNEL ***************************/

	
		if(sizeof($lesInfosCriteresCoOrg)>0){
		
			//Titre partie
			$section->addText('Organisationnel', 'title_partie', 'center');
			
			foreach($lesInfosCriteresCoOrg as $uneInfoCritereCoOrg) {
				$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
				$sstheme='';
				foreach($lesSTCr as $unSTCr) {
					if($unSTCr['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
						//Theme-Sous-thème
							$sstheme=$unSTCr['LIBELLE_SOUS_THEME'];
					}
				}
				if($sstheme!=''){
					$section->addText(htmlspecialchars($uneInfoCritereCoOrg['NOM_THEME']." - ".$sstheme), $menu2, 'st1');
					$section->addText(htmlspecialchars("► ".$uneInfoCritereCoOrg['LIBELLE_CRITERE']), $menu2, 'st1');
				}else{
					$section->addText(htmlspecialchars($uneInfoCritereCoOrg['NOM_THEME']), $menu2, 'st1');
					$section->addText(htmlspecialchars("► ".$uneInfoCritereCoOrg['LIBELLE_CRITERE']), $menu2, 'st1');
				}
				
				if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
					//Valeur critère
					if($uneInfoCritereCoOrg['VALEUR_CRITERE'] == "NC") {
						$valeur_cr = "Non conforme";
					}else if($uneInfoCritereCoOrg['VALEUR_CRITERE'] == "<C") {
						$valeur_cr = "Plutôt non conforme";
					}else if($uneInfoCritereCoOrg['VALEUR_CRITERE'] == ">C") {
						$valeur_cr = "Plutôt conforme";
					}else if($uneInfoCritereCoOrg['VALEUR_CRITERE'] == "C") {
						$valeur_cr = "Conforme";
					}else if($uneInfoCritereCoOrg['VALEUR_CRITERE'] == "SA") {
						$valeur_cr = "Sans avis";
					}
					
					if($valeur_cr != "Sans avis" and $uneInfoStructure['LIBELLE_AUDIT']!="Visite de locaux"){
						$table = $section->addTable();
						$table->addRow();
						$cell = $table->addCell(100);
						if($valeur_cr=='Conforme' || $valeur_cr=='Plutôt conforme'){
							if($valeur_cr=='Conforme'){
								$cell->addImage('images/conforme.png', array('width' => 20));
							}else{
								$cell->addImage('images/plutotConforme.png', array('width' => 20));
							}
							$cell = $table->addCell(8000);
							$cell->addText(htmlspecialchars($valeur_cr), $conformite1);
						}else{
							if($valeur_cr=="Non conforme"){
								$cell->addImage('images/nonConforme.png', array('width' => 20));
							}else{
								$cell->addImage('images/plutotNonConforme.png', array('width' => 20));
							}
							$cell = $table->addCell(8000);
							$cell->addText(htmlspecialchars($valeur_cr), $conformite2);
						}
					}
				}
				
				//Article
				$section->addText(htmlspecialchars("Réglementation applicable : "), $menu, 'st1');
				foreach($lesArticlesCrCoOrg as $unArticleCrCoOrg) {
					if($unArticleCrCoOrg['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
						$unArticleCrCoOrgDescriptionResume = str_replace("\n", "<w:br/>", $unArticleCrCoOrg['DESCRIPTION_RESUME_ARTICLE']);
						$section->addText($unArticleCrCoOrgDescriptionResume, $textBase);
					}
				}				
				
				
				
				//Observations
				$nb=0;
				$section->addText(htmlspecialchars("Observations : "), $menu, 'st1');
				$textrun = $section->addTextRun('center');
				if($uneInfoCritereCoOrg['PHOTO_CRITERE'] == NULL){
					//Illustration critere
					foreach($lesImgCrCo as $uneImgCrCo) {
						if($uneImgCrCo['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
							$textrun->addImage('images/' . $uneImgCrCo['LIBELLE_IMAGE_CRITERE'], array('height' => 100,'align' => 'center', 'wrappingStyle' => 'infront'));
							
						}
					}
				}else{
					//Illustration critere
					foreach($lesImgCrCo as $uneImgCrCo) {
						if($uneImgCrCo['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
							$textrun->addImage('images/' . $uneImgCrCo['LIBELLE_IMAGE_CRITERE'], array('height' => 100,'align' => 'center',  'wrappingStyle' => 'infront'));
							
						}
					}
					//Image téléchargée		
					$textrun->addImage('photos/' . $uneInfoCritereCoOrg['PHOTO_CRITERE'], array('height' => 100,'align' => 'center', 'wrappingStyle' => 'infront'));
				}
				foreach($lesObservationsOrg as $uneObservationOrg) {
					
					if($uneObservationOrg['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
						if($uneObservationOrg['CODE_COULEUR_OBSERVATION'] == 1) { //vert
							$section->addText(htmlspecialchars($uneObservationOrg['LIBELLE_OBSERVATION']), 'obs_color_v');
						}else { //rouge
							$nb=$nb+1;
							$section->addText(htmlspecialchars($uneObservationOrg['LIBELLE_OBSERVATION']), 'obs_color_r');
						}
					}
				}
				
				//Préconisations
				if($nb!=0){
					$section->addText(htmlspecialchars("Propositions : "), $menu, 'st1');
					foreach($lesPreconisationsOrg as $unePreconisationOrg) {
						if($unePreconisationOrg['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
							$unePreconisationOrgLibellePreconisation = str_replace("\n", "<w:br/>", $unePreconisationOrg['LIBELLE_PRECONISATION']);
							$section->addText($unePreconisationOrgLibellePreconisation, $textBase);
							
						}
					}
				}
				$section->addText(htmlspecialchars($uneInfoCritereCoOrg['PRECONISATION_CRITERE']), $textBase);	
				
				$section->addTextBreak(2);	
			}
			$section->addPageBreak(); //saut de page	
			
		}
			/*************************** PARTIE SUR SITE ***************************/
			
			if(sizeof($lesInfosCriteresCoSite)>0){
			//Titre partie
			$section->addText('Sur site', 'title_partie', 'center');

			foreach($lesInfosCriteresCoSite as $uneInfoCritereCoSite) {
				$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
				//batiment - lieu
				$sstheme='';
				foreach($lesSTCr as $unSTCr) {
					if($unSTCr['NUM_CRITERE'] == $uneInfoCritereCoSite['NUM_CRITERE']) {
						$sstheme=$unSTCr['LIBELLE_SOUS_THEME'];
					}
				}
				if($sstheme!=''){
					$section->addText(htmlspecialchars($uneInfoCritereCoSite['NOM_BATIMENT']." - ".$uneInfoCritereCoSite['NOM_LIEU']),$menu1,'st1');
					$section-> addText(htmlspecialchars($uneInfoCritereCoSite['NOM_THEME']." - ".$sstheme), $menu2, 'st1');
					$section-> addText(htmlspecialchars("► ".$uneInfoCritereCoSite['LIBELLE_CRITERE']), $menu2, 'st1');
				}else{
					$section->addText(htmlspecialchars($uneInfoCritereCoSite['NOM_BATIMENT']." - ".$uneInfoCritereCoSite['NOM_LIEU']),$menu1,'st1');
					$section-> addText(htmlspecialchars($uneInfoCritereCoSite['NOM_THEME']), $menu2, 'st1');
					$section-> addText(htmlspecialchars("► ".$uneInfoCritereCoSite['LIBELLE_CRITERE']), $menu2, 'st1');					
				}
				
				if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
					//Valeur critère
					if($uneInfoCritereCoSite['VALEUR_CRITERE'] == "NC") {
						$valeur_cr = "Non conforme";
					}else if($uneInfoCritereCoSite['VALEUR_CRITERE'] == "<C") {
						$valeur_cr = "Plutôt non conforme";
					}else if($uneInfoCritereCoSite['VALEUR_CRITERE'] == ">C") {
						$valeur_cr = "Plutôt conforme";
					}else if($uneInfoCritereCoSite['VALEUR_CRITERE'] == "C") {
						$valeur_cr = "Conforme";
					}else if($uneInfoCritereCoSite['VALEUR_CRITERE'] == "SA") {
						$valeur_cr = "Sans avis";
					}
					
					if($valeur_cr != "Sans avis" and $uneInfoStructure['LIBELLE_AUDIT']!="Visite de locaux"){
						$table = $section->addTable();
						$table->addRow();
						$cell = $table->addCell(100);
						if($valeur_cr=='Conforme' || $valeur_cr=='Plutôt conforme'){
							if($valeur_cr=='Conforme'){
								$cell->addImage('images/conforme.png', array('width' => 20));
							}else{
								$cell->addImage('images/plutotConforme.png', array('width' => 20));
							}
							$cell = $table->addCell(8000);
							$cell->addText(htmlspecialchars($valeur_cr), $conformite1);
						}else{
							if($valeur_cr=="Non conforme"){
								$cell->addImage('images/nonConforme.png', array('width' => 20));
							}else{
								$cell->addImage('images/plutotNonConforme.png', array('width' => 20));
							}
							$cell = $table->addCell(8000);
							$cell->addText(htmlspecialchars($valeur_cr), $conformite2);
						}
					}
				}
				
				
				//Article
				
				$section->addText(htmlspecialchars("Réglementation applicable : "), $menu, 'st1');
				foreach($lesArticlesCrCoSite as $unArticleCrCoSite) {
					if($unArticleCrCoSite['NUM_BATIMENT_C'] == $uneInfoCritereCoSite['NUM_BATIMENT_C'] and $unArticleCrCoSite['NUM_LIEU'] == $uneInfoCritereCoSite['NUM_LIEU'] and $unArticleCrCoSite['NUM_CRITERE'] == $uneInfoCritereCoSite['NUM_CRITERE']) {
						$unArticleCrCoSiteDescriptionResume = str_replace("\n", "<w:br/>", $unArticleCrCoSite['DESCRIPTION_RESUME_ARTICLE']);
						$section->addText($unArticleCrCoSiteDescriptionResume, $textBase);
					}
				}	
				
				
				//Observations
				$nb=0;
				$section->addText(htmlspecialchars("Observations : "), $menu, 'st1');
				$textrun = $section->addTextRun('center');
				if($uneInfoCritereCoSite['PHOTO_CRITERE'] == NULL){
					//Illustration critere
					foreach($lesImgCr as $uneImgCr) {
						if($uneImgCr['NUM_BATIMENT_C'] == $uneInfoCritereCoSite['NUM_BATIMENT_C'] and $uneImgCr['NUM_LIEU'] == $uneInfoCritereCoSite['NUM_LIEU'] and $uneImgCr['NUM_CRITERE'] == $uneInfoCritereCoSite['NUM_CRITERE']) {
							$textrun->addImage('images/' . $uneImgCr['LIBELLE_IMAGE_CRITERE'], array('height' => 100,'align' => 'center', 'wrappingStyle' => 'infront'));
						}
					}
				}else{
					//Illustration critere
					foreach($lesImgCr as $uneImgCr) {
						if($uneImgCr['NUM_BATIMENT_C'] == $uneInfoCritereCoSite['NUM_BATIMENT_C'] and $uneImgCr['NUM_LIEU'] == $uneInfoCritereCoSite['NUM_LIEU'] and $uneImgCr['NUM_CRITERE'] == $uneInfoCritereCoSite['NUM_CRITERE']) {
							$textrun->addImage('images/' . $uneImgCr['LIBELLE_IMAGE_CRITERE'], array('height' => 100,'align' => 'center', 'wrappingStyle' => 'infront'));
						}
					}
					//Image téléchargée		
					$textrun->addImage('photos/' . $uneInfoCritereCoSite['PHOTO_CRITERE'], array('height' => 100,'align' => 'center', 'wrappingStyle' => 'infront'));
				}
				
				foreach($lesObservationsSite as $uneObservationSite) {
					
					if($uneObservationSite['NUM_BATIMENT_C'] == $uneInfoCritereCoSite['NUM_BATIMENT_C'] and $uneObservationSite['NUM_CRITERE_C'] == $uneInfoCritereCoSite['NUM_CRITERE'] and $uneObservationSite['NUM_LIEU'] == $uneInfoCritereCoSite['NUM_LIEU']) {
						if($uneObservationSite['CODE_COULEUR_OBSERVATION'] == 1) { //vert
							$section->addText(htmlspecialchars($uneObservationSite['LIBELLE_OBSERVATION']), 'obs_color_v');
						}else { //rouge
							$nb=$nb+1;
							$section->addText(htmlspecialchars($uneObservationSite['LIBELLE_OBSERVATION']), 'obs_color_r');
						}
					}
				}
				
				//Préconisations
				if($nb!=0){
					$section->addText(htmlspecialchars("Propositions : "), $menu, 'st1');
					foreach($lesPreconisationsSite as $unePreconisationSite) {
						if($unePreconisationSite['NUM_BATIMENT_C'] == $uneInfoCritereCoSite['NUM_BATIMENT_C'] && $unePreconisationSite['NUM_CRITERE_C'] == $uneInfoCritereCoSite['NUM_CRITERE']) {
							$unePreconisationSiteLibellePreconisation = str_replace("\n", "<w:br/>", $unePreconisationSite['LIBELLE_PRECONISATION']);
							$section->addText($unePreconisationSiteLibellePreconisation, $textBase);
						}
						
					}
				}
				$section->addText(htmlspecialchars($uneInfoCritereCoSite['PRECONISATION_CRITERE']), $textBase);
				
				$section->addTextBreak(2);
				
			}
			$section->addPageBreak();
			}
		/*************************** CONCLUSION ***************************/
			if(sizeof($statsORG)>0 || sizeof($statsSITE)>0 || sizeof($statsFamille)>0){
			$section->addText(htmlspecialchars("Bilan des non-conformités :"),'subtitle_p_garde');
			$section->addTextBreak(1);
			$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
			$section->addTextBreak(1);
			}
			if($infosaudit['LIBELLE_AUDIT']=="Inspection"){
				//statistique organisation
				if(sizeof($statsORG)>0){
				$section->addText(htmlspecialchars("Nombre de non-conformités organisationnel "), $menu1,'st1');
				
				$titles=array(); //legende des sommets
				$data=array(); //valeur du graph
				$nbTheme =0;
				
				// Add table
				$tablette1 = $section->addTable('myOwnTableStyle');
				$tablette1->addRow();
					$cell = $tablette1->addCell(10000);
					$cell->addText(htmlspecialchars('Thème'),  'tabFont', 'tabPar');
					$cell = $tablette1->addCell(100);
					$cell->addText(htmlspecialchars('non-conformités'),  'tabFont', 'tabPar');
				foreach($statsORG as $stat){
					$tablette1->addRow();
					$cell = $tablette1->addCell(10000);
					$cell->addText(htmlspecialchars($stat['NOM_THEME']), 'st1');
					$cell = $tablette1->addCell(100);
					$cell->addText(htmlspecialchars($stat['NBROUGE']), 'st1');
					
					array_push($titles, $stat['NOM_THEME']); //ajout d'un nouveau sommets legende
					array_push($data, $stat['NBROUGE']); //ajout d'une nouvelle valeur dans le graph
					$nbTheme = $nbTheme+1;
				}
				if($nbTheme>=3){
					$graph = new RadarGraph (1000,500); //taille du graph
					
					$max = max($data);
					$graph->SetScale('lin',0,$max); // min et max sur l'echelle
	 
					$graph->SetTitles($titles);
					$graph->SetCenter(0.5,0.55);
					$graph->HideTickMarks();
					$graph->SetColor('white'); // couleur de fond
					$graph->axis->SetColor('darkgray'); // couleur des lignes
					$graph->grid->SetColor('darkgray');
					$graph->grid->Show();
					 
					$graph->axis->title->SetFont(FF_ARIAL,FS_NORMAL,12);
					$graph->axis->title->SetMargin(5);
					$graph->SetGridDepth(DEPTH_BACK);
					$graph->SetSize(0.6);
					 
					$plot = new RadarPlot($data);
					$plot->SetColor('red@0.2');
					$plot->SetLineWeight(1);
					$plot->SetFillColor('red@0.7');
					 
					$plot->mark->SetType(MARK_IMG_SBALL,'red');
					 
					$graph->Add($plot);
					$today = date("d.m.y - H i"); 
					
					$graphX = $graph->Stroke('graph/graph1'.$today.'.png');
					$section->addTextBreak(1);
					$section->addImage('graph/graph1'.$today.'.png', array('height' => 300,'align' => 'center'));
				}


				$section->addTextBreak(1);
				$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
				$section->addTextBreak(1);
				}
				//------------------------------------------------------------------
				if(sizeof($statsSITE)>0){
				//statistique site
				$section->addText(htmlspecialchars("Nombre de non-conformités par bâtiment "), $menu1,'st1');
				
				$titles=array(); //legende des sommets
				$data=array(); //valeur du graph
				$nbBatiment = 0;
				
				// Add table
				$tablette2 = $section->addTable('myOwnTableStyle');
				$tablette2->addRow();
					$cell = $tablette2->addCell(10000);
					$cell->addText(htmlspecialchars('Bâtiment'),  'tabFont', 'tabPar');
					$cell = $tablette2->addCell(100);
					$cell->addText(htmlspecialchars('non-conformités'),  'tabFont', 'tabPar');
				foreach($statsSITE as $stat){
					$tablette2->addRow();
					$cell = $tablette2->addCell(10000);
					$cell->addText(htmlspecialchars($stat['NOM_BATIMENT']), 'st1');
					$cell = $tablette2->addCell(100);
					$cell->addText(htmlspecialchars($stat['NBROUGE']), 'st1');
					
					array_push($titles, $stat['NOM_BATIMENT']); //ajout d'un nouveau sommets legende
					array_push($data, $stat['NBROUGE']); //ajout d'une nouvelle valeur dans le graph
					$nbBatiment = $nbBatiment +1;
				}
				if($nbBatiment >= 3){
					$graph = new RadarGraph (1000,500); //taille du graph
					$max = max($data);
					$graph->SetScale('lin',0,$max); // min et max sur l'echelle
	 
					$graph->SetTitles($titles);
					$graph->SetCenter(0.5,0.55);
					$graph->HideTickMarks();
					$graph->SetColor('white'); // couleur de fond
					$graph->axis->SetColor('darkgray'); // couleur des lignes
					$graph->grid->SetColor('darkgray');
					$graph->grid->Show();
					 
					$graph->axis->title->SetFont(FF_ARIAL,FS_NORMAL,12);
					$graph->axis->title->SetMargin(5);
					$graph->SetGridDepth(DEPTH_BACK);
					$graph->SetSize(0.6);
					 
					$plot = new RadarPlot($data);
					$plot->SetColor('red@0.2');
					$plot->SetLineWeight(1);
					$plot->SetFillColor('red@0.7');
					 
					$plot->mark->SetType(MARK_IMG_SBALL,'red');
					 
					$graph->Add($plot);
					$today = date("d.m.y - H i"); 
					
					$graphX = $graph->Stroke('graph/graph2'.$today.'.png');
					$section->addTextBreak(1);
					$section->addImage('graph/graph2'.$today.'.png', array('height' => 300,'align' => 'center'));
				}
					
				
				
				$section->addTextBreak(1);
				$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
				$section->addTextBreak(1);
				}
				//------------------------------------------------------------------
				if(sizeof($statsFamille)>0){
				//stats par theme
				$section->addText(htmlspecialchars("Nombre de non-conformités par famille de risques "), $menu1,'st1');
				
				$titles=array(); //legende des sommets
				$data=array(); //valeur du graph
				$nbFamille = 0;
				
				// Add table
				$tablette3 = $section->addTable('myOwnTableStyle');
				$tablette3->addRow();
					$cell = $tablette3->addCell(10000);
					$cell->addText(htmlspecialchars('Famille de risques'),  'tabFont', 'tabPar');
					$cell = $tablette3->addCell(100);
					$cell->addText(htmlspecialchars('non-conformités'),  'tabFont', 'tabPar');
				foreach($statsFamille as $stat){
					$tablette3->addRow();
					$cell = $tablette3->addCell(10000);
					$cell->addText(htmlspecialchars($stat['NOM_THEME']), 'st1');
					$cell = $tablette3->addCell(100);
					$cell->addText(htmlspecialchars($stat['NBROUGE']), 'st1');
					
				
					array_push($titles, $stat['NOM_THEME']); //ajout d'un nouveau sommets legende
					array_push($data, $stat['NBROUGE']); //ajout d'une nouvelle valeur dans le graph
					$nbFamille = $nbFamille + 1 ;
				}
				if($nbFamille >=3 ){
					$graph = new RadarGraph (1000,500); //taille du graph
					$max = max($data);
					$graph->SetScale('lin',0,$max); // min et max sur l'echelle
	 
					$graph->SetTitles($titles);
					$graph->SetCenter(0.5,0.55);
					$graph->HideTickMarks();
					$graph->SetColor('white'); // couleur de fond
					$graph->axis->SetColor('darkgray'); // couleur des lignes
					$graph->grid->SetColor('darkgray');
					$graph->grid->Show();
					 
					$graph->axis->title->SetFont(FF_ARIAL,FS_NORMAL,12);
					$graph->axis->title->SetMargin(5);
					$graph->SetGridDepth(DEPTH_BACK);
					$graph->SetSize(0.6);
					 
					$plot = new RadarPlot($data);
					$plot->SetColor('red@0.2');
					$plot->SetLineWeight(1);
					$plot->SetFillColor('red@0.7');
					 
					$plot->mark->SetType(MARK_IMG_SBALL,'red');
					 
					$graph->Add($plot);
					$today = date("d.m.y - H i"); 
					
					$graphX = $graph->Stroke('graph/graph3'.$today.'.png');
					$section->addTextBreak(1);
					$section->addImage('graph/graph3'.$today.'.png', array('height' => 300,'align' => 'center'));
				}
				
				
				}
				$section->addTextBreak(5); //saut de page
			}
		
		$section->addText(htmlspecialchars("Pour tout renseignement complémentaire, vous pouvez contacter le Service Prévention des Risques Professionnels du Pôle Santé et Sécurité au Travail du Centre Départemental de Gestion de la Haute-Vienne au :"),'conclu');
		$section->addText(htmlspecialchars("	- 05.55.30.08.54"),'conclu');
		$section->addText(htmlspecialchars("	- 05.55.30.08.69"),'conclu');
		$section->addText(htmlspecialchars("	- 05.55.30.08.63 "),'conclu');
		$section->addText(htmlspecialchars("Et accéder au R.U.S.S.T (Registre Unique Santé et Sécurité au Travail) en ligne : "),'conclu');
		$section->addText(htmlspecialchars("	- https://www.cdc.retraites.fr/outils/RUSST/"),'conclu');
		$section->addText(htmlspecialchars("	- http://www.cdg87.com/"),'conclu');

		if($NBcritereRougeOrg['NBCRITEREROUGEORG']>0 || $NBcritereRougeSite['NBCRITEREROUGESITE']>0){
			$section->addPageBreak();
			
			$section->addText("Suites donnees aux propositions", 'title_partie', 'center');
			$section->addText("Art-5: L'ACFI est informé par l'Autorité Territoriale des suites données à ses propositions.",  'introFstyle', 'introPstyle');
			
			if($NBcritereRougeOrg['NBCRITEREROUGEORG']>0){
				$section->addTitle(htmlspecialchars('Organisation'), 3);
			
				// Add table
				$tabletteSuiteOrg = $section->addTable('myOwnTableStyle');
				$tabletteSuiteOrg->addRow();
					$cell = $tabletteSuiteOrg->addCell(2500);
					$cell->addText(htmlspecialchars('Thème/Critère'),  'tabFont', 'tabPar');
					$cell = $tabletteSuiteOrg->addCell(5500);
					$cell->addText(htmlspecialchars('Suites données aux propositions'),  'tabFont', 'tabPar');
					$cell = $tabletteSuiteOrg->addCell(1500);
					$cell->addText(htmlspecialchars('Délai'),  'tabFont', 'tabPar');
				foreach($criteresRougesOrg as $critereRougeOrg){
					$tabletteSuiteOrg->addRow();
					$cell = $tabletteSuiteOrg->addCell(2500);
					$cell->addText(htmlspecialchars($critereRougeOrg['NOM_THEME']), 'st1');
					$cell->addTextBreak(0);
					$cell->addText(htmlspecialchars(' ► '.$critereRougeOrg['LIBELLE_CRITERE']), 'st1');
					$cell = $tabletteSuiteOrg->addCell(5500);
					$cell = $tabletteSuiteOrg->addCell(1500);
				}$section->addPageBreak();
			}
			

			if($NBcritereRougeSite['NBCRITEREROUGESITE']>0){
				
				$section->addTitle(htmlspecialchars('Sur site'), 3);

				// Add table
				$tabletteSuiteSite = $section->addTable('myOwnTableStyle');
				$tabletteSuiteSite->addRow();
					$cell = $tabletteSuiteSite->addCell(2500);
					$cell->addText(htmlspecialchars('Thème/Critère'),  'tabFont', 'tabPar');
					$cell = $tabletteSuiteSite->addCell(5500);
					$cell->addText(htmlspecialchars('Suites données aux propositions'),  'tabFont', 'tabPar');
					$cell = $tabletteSuiteSite->addCell(1500);
					$cell->addText(htmlspecialchars('Délai'),  'tabFont', 'tabPar');
				foreach($criteresRougesSite as $critereRougeSite){
					$tabletteSuiteSite->addRow();
					$cell = $tabletteSuiteSite->addCell(2500);
					$cell->addText(htmlspecialchars($critereRougeSite['NOM_THEME']), 'st1');
					$cell->addTextBreak(0);
					$cell->addText(htmlspecialchars(' ► '.$critereRougeSite['LIBELLE_CRITERE']), 'st1');
					$cell = $tabletteSuiteSite->addCell(5500);
					$cell = $tabletteSuiteSite->addCell(1500);
				}
			}
		}

	/*************************** FOOTER ***************************/


	// Add footer
	$footer = $section->addFooter();

	$footer->addPreserveText(htmlspecialchars('Page {PAGE}/{NUMPAGES}'), array('align' => 'right'));



	$today = date("d.m.y"); //date et heure du jour

	//Guardando document
	
	
	$h2d_file_uri = tempnam('', 'htd');
    //exit($h2d_file_uri);
    $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($document, 'Word2007');
    $objWriter->save($h2d_file_uri);
	
	$objWriter->save('Rapport '.htmlspecialchars($uneInfoStructure['NOM_STRUCTURE']).' - '.$today.'.docx');
	header("Content-Disposition: attachment; filename='Rapport ".htmlspecialchars($uneInfoStructure['NOM_STRUCTURE']).' - '.$today.".docx'");
	echo file_get_contents('Rapport '.htmlspecialchars($uneInfoStructure['NOM_STRUCTURE']).' - '.$today.'.docx');
	ob_clean();
    flush();
    $status = readfile($h2d_file_uri);
    unlink($h2d_file_uri);
    exit;
	// $objWriter->save('Rapport '.htmlspecialchars($uneInfoStructure['NOM_STRUCTURE'])." le ".$today.'.docx');

	// header("Content-Disposition: attachment; filename='Rapport ".htmlspecialchars($uneInfoStructure['NOM_STRUCTURE'])." le ".$today.".docx'");
	// echo file_get_contents('Rapport '.htmlspecialchars($uneInfoStructure['NOM_STRUCTURE'])." le ".$today.'.docx');
}

?>
