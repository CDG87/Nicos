<?php

$action = $_REQUEST['action'];



switch($action) {
	
	case 'generer' :
		$infoCentre=$pdo->get_Info_Centre();
		$infosaudit = $pdo->get_Audit_En_Cours($_SESSION['audit']);
		$statsORG=$pdo->get_nbRougeORG($_SESSION['audit']);
		$statsSITE=$pdo->get_nbRougeSITE($_SESSION['audit']);
		$statsFamille=$pdo->get_nbRougeSITE_theme($_SESSION['audit']);
		$criteresRougesOrg=$pdo->get_critereRouge_theme_Org();
		$criteresRougesSite=$pdo->get_critereRouge_theme_Site();
		$NBcritereRougeOrg=$pdo->get_NBcritereRouge_theme_Org($_SESSION['audit']);
		$NBcritereRougeSite=$pdo->get_NBcritereRouge_theme_Site($_SESSION['audit']);
		$nbParticipant = $pdo->count_participant($_SESSION['audit']);
		$conformite1 = array('Color' => '469D46', '_bold' => true, 'Size'=> 13);
		$conformite2 = array('Color' => 'CF433F', '_bold' => true, 'Size'=> 13);
		$menu = array('Color' => '776e6e', 'Size'=>12, 'underline' => 'single');
		$menu1 = array('Color' => '17202a', 'Size'=>14, '_bold'=> true, 'underline' => 'single' );
		$menu2 = array('Color' => '17202a', 'Size'=>12, '_bold'=> true,'bgcolor' =>'cacfd2');
		$textBase=array('Size'=>9);
		$lesParticipants = $pdo->get_Infos_Participants($_SESSION['audit']); //infos participants
		$lesInfosCriteresCoOrg = $pdo->get_Infos_Cr_Th_Co_Org($_SESSION['audit']); //infos criteres controlés organisationnel
		$lesObservationsOrg = $pdo->get_Liste_Obs_Org($_SESSION['audit']); //les observations organisationnel
		$lesPreconisationsOrg = $pdo->get_Liste_Preco_Org($_SESSION['audit']); //les preconisations organisationnel
		
		$lesObservationsSite = $pdo->get_Liste_Obs_Site($_SESSION['audit']); //les observations site
		$lesPreconisationsSite = $pdo->get_Liste_Preco_Site($_SESSION['audit']); //les preconisations site
		
		
		$lesArticlesCrCoOrg = $pdo->get_Art_Cr_Co_Org($_SESSION['audit']); //les articles des criteres controlés organisationnel
		$lesArticlesCrCoSite = $pdo->get_Art_Cr_Co_Site($_SESSION['audit']); //les articles des criteres controlés site
		$lesImgCrCo = $pdo->get_Img_Cr_Co($_SESSION['audit']); //les images critère
		$lesImgCr = $pdo->get_Img_Cr($_SESSION['audit']); //les images critère
		
		$lesInfosCriteresCoSite = $pdo->get_Infos_Cr_Th_Co_Site($_SESSION['audit']); //infos criteres controlés site
		
		$lesInfosStructure = $pdo->get_Infos_Structure_Choix_Audit($_SESSION['audit']); //infos structure
		$lesInfosControleur = $pdo->get_Infos_Controleur_Audit($_SESSION['audit']); //infos controleur
		$datesAudit = $pdo->get_Dates_Audit($_SESSION['audit']); //dates de l'audit
		$tabDates = array();
		
		for($i = 0; $i < count($datesAudit); $i++) {
			$uneDateFr = dateAnglaisVersFrancais($datesAudit[$i]);
			array_push($tabDates, $uneDateFr);
		}
		
		
		$lesSTCr = $pdo->get_ST_Cr();
		
		$lesBatimentsControles = $pdo->get_Batiments_Controles($_SESSION['audit']);
		

		if(isset($_SESSION['choix_creation'])) {
			
			if($_SESSION['choix_creation'] == "creer") { //creer audit
			
				/*** identification ***/
				$leTypeStructure = $pdo->get_Type_Structure_Nom($_SESSION['type_structure']); //nom 
				$adresseStructure = $pdo->get_Adresse_Structure($_SESSION['num_structure']); //adresse structure
				$leControleur = $pdo->get_Infos_Controleur_Num($_SESSION['idControleur']); //infos controleur
				$dateAudit = dateAnglaisVersFrancais($_SESSION['date_audit']); //date de l'audit
				/*** partie organisationnel ***/
				$lesThemes = $pdo->get_Theme_Partie($_SESSION['codepartie']); //tous les themes d'une partie
				
			}
	
		}
		
		
		if($_REQUEST['action'] == 'theme') {
			require("vue/v_theme.php");
		}else if($_REQUEST['action'] == 'soustheme') {
			require("vue/v_soustheme.php");
		}else if($_REQUEST['action'] == 'critere') {
			require("vue/v_critere.php");
		}
		
		include("vue/phpword/v_rapport.php");
		
	break;
	
	
	case 'genererMesure':
	$infoCentre=$pdo->get_Info_Centre();
		$infosaudit = $pdo->get_Audit_En_Cours($_SESSION['audit']);
		$statsORG=$pdo->get_nbRougeORG($_SESSION['audit']);
		$statsSITE=$pdo->get_nbRougeSITE($_SESSION['audit']);
		$statsFamille=$pdo->get_nbRougeSITE_theme($_SESSION['audit']);
		$nbParticipant = $pdo->count_participant($_SESSION['audit']);
		$conformite1 = array('Color' => '469D46', '_bold' => true, 'Size'=> 13);
		$conformite2 = array('Color' => 'CF433F', '_bold' => true, 'Size'=> 13);
		$menu = array('Color' => '776e6e', 'Size'=>12, 'underline' => 'single');
		$menu1 = array('Color' => '17202a', 'Size'=>14, '_bold'=> true, 'underline' => 'single' );
		$menu2 = array('Color' => '17202a', 'Size'=>12, '_bold'=> true,'bgcolor' =>'cacfd2');
		$textBase=array('Size'=>9);
		$lesPersonnesDiff = $pdo->get_Diffusion_Rapport(); //diffusion rapport
		$lesParticipants = $pdo->get_Infos_Participants($_SESSION['audit']); //infos participants
		$lesInfosCriteresCoOrg = $pdo->get_Infos_Cr_Th_Co_Org($_SESSION['audit']); //infos criteres controlés organisationnel
		$lesObservationsOrg = $pdo->get_Liste_Obs_Org($_SESSION['audit']); //les observations organisationnel
		$lesPreconisationsOrg = $pdo->get_Liste_Preco_Org($_SESSION['audit']); //les preconisations organisationnel
		
		$lesObservationsSite = $pdo->get_Liste_Obs_Site($_SESSION['audit']); //les observations site
		$lesPreconisationsSite = $pdo->get_Liste_Preco_Site($_SESSION['audit']); //les preconisations site
		
		
		$lesArticlesCrCoOrg = $pdo->get_Art_Cr_Co_Org($_SESSION['audit']); //les articles des criteres controlés organisationnel
		$lesArticlesCrCoSite = $pdo->get_Art_Cr_Co_Site($_SESSION['audit']); //les articles des criteres controlés site
		$lesImgCrCo = $pdo->get_Img_Cr_Co($_SESSION['audit']); //les images critère
		$lesImgCr = $pdo->get_Img_Cr($_SESSION['audit']); //les images critère
		
		$lesInfosCriteresCoSite = $pdo->get_Infos_Cr_Th_Co_Site($_SESSION['audit']); //infos criteres controlés site
		
		$lesInfosStructure = $pdo->get_Infos_Structure_Choix_Audit($_SESSION['audit']); //infos structure
		$lesInfosControleur = $pdo->get_Infos_Controleur_Audit($_SESSION['audit']); //infos controleur
		$datesAudit = $pdo->get_Dates_Audit($_SESSION['audit']); //dates de l'audit
		$tabDates = array();
		
		for($i = 0; $i < count($datesAudit); $i++) {
			$uneDateFr = dateAnglaisVersFrancais($datesAudit[$i]);
			array_push($tabDates, $uneDateFr);
		}
		
		
		$lesSTCr = $pdo->get_ST_Cr();
		
		$lesBatimentsControles = $pdo->get_Batiments_Controles($_SESSION['audit']);
		

		if(isset($_SESSION['choix_creation'])) {
			
			if($_SESSION['choix_creation'] == "creer") { //creer audit
			
				/*** identification ***/
				$leTypeStructure = $pdo->get_Type_Structure_Nom($_SESSION['type_structure']); //nom 
				$adresseStructure = $pdo->get_Adresse_Structure($_SESSION['num_structure']); //adresse structure
				$leControleur = $pdo->get_Infos_Controleur_Num($_SESSION['idControleur']); //infos controleur
				$dateAudit = dateAnglaisVersFrancais($_SESSION['date_audit']); //date de l'audit
				/*** partie organisationnel ***/
				$lesThemes = $pdo->get_Theme_Partie($_SESSION['codepartie']); //tous les themes d'une partie
				
			}
	
		}
		
		
		if($_REQUEST['action'] == 'theme') {
			require("vue/v_theme.php");
		}else if($_REQUEST['action'] == 'soustheme') {
			require("vue/v_soustheme.php");
		}else if($_REQUEST['action'] == 'critere') {
			require("vue/v_critere.php");
		}
		
		include("vue/phpword/v_rapport_urgent.php");
	break;
}

?>