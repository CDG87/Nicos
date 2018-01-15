<?php

$action = $_REQUEST['action'];
$lesControleurs = $pdo->get_Controleur();

switch($action) {
	case 'selectionner_critere' :
		$_SESSION['entpied']="majCritere";
		$_SESSION['majpartie']="";
		$_SESSION['majtheme']="";
		$_SESSION['majst']="";
		$_SESSION['majcritere']="";
		include("vue/v_selection_critere.php");
	break;
		
	case 'choixActionCritere':
		$verif=false;
		
		if(isset($_POST['partie'])){
			if($_POST['partie']!=$_SESSION['majpartie']){
				$verif=true;
				$_SESSION['majtheme']="";
				$_SESSION['majst']="";
				$_SESSION['majcritere']="";
				$_SESSION['majpartie']=$_POST['partie'];
			}
			
			$lstTheme=$pdo->get_Theme_Partie($_SESSION['majpartie']);
		}
		
		if(isset($_POST['theme'])){
			if($_POST['theme']!=$_SESSION['majtheme'] && $verif!=true){
				$verif=true;
				$_SESSION['majst']="";
				$_SESSION['majcritere']="";
				$_SESSION['majtheme']=$_POST['theme'];
			}
			
			$nbSt=$pdo->get_NbSous_Theme($_SESSION['majtheme']);
			if($nbSt['NB']!=0){
				$lstSt=$pdo->get_Sous_Theme_Num($_SESSION['majtheme']);
			}else{
				$lstCrit=$pdo->get_Critere_NTheme($_SESSION['majtheme']);
			}
		}
		
		if(isset($_POST['st'])){
			if($_POST['st']!=$_SESSION['majst'] && $verif!=true){
				$verif=true;
				$_SESSION['majcritere']="";
				$_SESSION['majst']=$_POST['st'];
			}
			if($_SESSION['majst']==""){
				$lstCrit=$pdo->get_Critere_NTheme($_SESSION['majtheme']);
			}else{
				$lstCrit=$pdo->get_Critere_Theme($_SESSION['majtheme'],$_SESSION['majst']);
			}
		}
		
		if(isset($_POST['critere'])){
			if($_POST['critere']!=$_SESSION['majcritere'] && $verif!=true){
				$_SESSION['majcritere']=$_POST['critere'];
			}
		}

		include("vue/v_selection_critere.php");
	break;
		
		case 'pageMenuCrit':
		if(isset($_POST['article'])){
			$listearticle = $pdo->get_ResArticle_Critere($_SESSION['majcritere']);
			include("vue/v_modifArticle.php");
		}else{
			if(isset($_POST['observation'])){
				include("vue/v_.php");
			}else{
				if(isset($_POST['proposition'])){
					include("vue/v_.php");
				}else{
					if(isset($_POST['image'])){
						include("vue/v_.php");
					}else{
						include("vue/v_menu_crit_modif.php");
					}
				}
			}
		}
		break;
		
		case 'modifAdminCrit':
		
		break;
		
		
	case 'coordonees_structures' :
		break;
	case 'coordonees_inspecteur' :
		$_SESSION['entpied'] = "coordonees_inspecteur";
		include("vue/v_coordonees_inspecteur.php");
		if(isset($_POST['enregistrer_inspecteur'])){
			$pdo->enregistrer_Controleur($_POST['nom_inspecteur'], $_POST['prenom_inspecteur'], $_POST['fonction_inspecteur'], $_POST['affectation_inspecteur'], $_POST['centre_inspecteur'], $_POST['adresse_inspecteur'], $_POST['tel_fixe_inspecteur'], $_POST['tel_portable_inspecteur'], $_POST['fax_inspecteur'], $_POST['email_inspecteur'] );
			header('Location:index.php?uc=maj&action=coordonees_inspecteur');
		}
		if(isset($_POST['choix_inspecteur'])){
			$dispo="";
		}
		break;
	case 'logo_adresse' : 
		break;
}
?>