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
		$_SESSION['entpied']="majCritere";
		if(isset($_POST['article'])){
			$_SESSION['entpied']='modifArticle';
			$_SESSION['listearticle'] = $pdo->get_ResArticle_Critere($_SESSION['majcritere']);
			include("vue/v_modifArticle.php");
		}else{
			if(isset($_POST['observation'])){
				$_SESSION['entpied']='modifOservation';
				$listeObservation=$pdo->get_Observation_CritereModif($_SESSION['majcritere']);
				include("vue/v_modifObservation.php");
			}else{
				if(isset($_POST['proposition'])){
					$_SESSION['entpied']='modifProposition';
				$listeProposition=$pdo->get_Preconisation_CritereMaj($_SESSION['majcritere']);
					include("vue/v_modifProposition.php");
				}else{
					if(isset($_POST['image'])){
						$_SESSION['entpied']='modifImage';
						include("vue/v_modifImage.php");
					}else{
						include("vue/v_menu_crit_modif.php");
					}
				}
			}
		}
		break;
		
		case 'modifImage':
			$nbImage=$pdo->get_NbImage_Critere($_SESSION['majcritere']);
			if($nbImage['NB']==0){
                    $pdo->add_Image_Critere($_SESSION['majcritere'],$_POST['image']);
                }else{
					$pdo->update_Image_Critere($_SESSION['majcritere'],$_POST['image']);
				}
				include("vue/v_menu_crit_modif.php");
		break;
		
		case 'modifAdminObservation':
			if(isset($_POST['ajouter'])){
				$pdo->add_Observation($_POST['newnomobservation'], $_SESSION['majcritere'], $_POST['cdobs']);
			}
			
			if(isset($_POST['modifier'])){
				 $pdo->update_Observation($_POST['idobservation'], $_POST['nomobs']);
			}
			
			if(isset($_POST['supprimer'])){
				$pdo->delete_Observation($_POST['idobservation']);
			}
			include("vue/v_menu_crit_modif.php");
		break;
		
		case 'modifAdminProposition':
			if(isset($_POST['ajouter'])){
				$pdo->add_Preconisation($_POST['newnomproposition'], $_SESSION['majcritere']);
			}
			
			if(isset($_POST['modifier'])){
				$pdo->update_Preconisation($_POST['idproposition'], $_POST['nomprop']);
			}
			
			if(isset($_POST['supprimer'])){
				$pdo->delete_Preconisation($_POST['idproposition']);
			}
			include("vue/v_menu_crit_modif.php");
		break;
		
		case 'modifAdminCrit':
			$pdo->update_Article($_SESSION['listearticle']['NUM_RESUME_ARTICLE'],$_POST['newnomarticle']);
			include("vue/v_menu_crit_modif.php");
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