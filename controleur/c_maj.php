<?php

$action = $_REQUEST['action'];

switch($action) {
	case 'selectionner_critere' :
		$_SESSION['entpied']="majCritere";
		$_SESSION['majpartie']="";
		$_SESSION['majtheme']="";
		$_SESSION['majst']="";
		$_SESSION['majcritere']="";
		include("vue/v_selection_critere.php");
	break;
	
	case 'charge_version' :
		$version=$pdo->get_version();
		include("vue/v_maj_version.php");
		break;
		
	case 'version' :
		if(isset($_POST['modifier'])){
			$pdo->update_version($_POST['version']);
		}
		include("vue/v_maj.php");
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
		$_SESSION['entpied']="majCritere2";
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
						$nbImage=$pdo->get_NbImage_Critere($_SESSION['majcritere']);
						if($nbImage['NB']!=0){
							$image=$pdo->get_Liste_IMGCR($_SESSION['majcritere']);	
							$image=$image['LIBELLE_IMAGE_CRITERE'];
						}else{
							$image=-1;
						}
						$_SESSION['entpied']='modifImage';
						include("vue/v_modifImage.php");
					}else{
						if(isset($_POST['retour'])){
							include('vue/v_maj.php');
						}else{
							include("vue/v_menu_crit_modif.php");
						}
					}
				}
			}
		}
		
		break;
		
		case 'modifImage':
			if(isset($_POST['retour'])){
				$_SESSION['entpied']="majCritere2";
			}else{
				$nbImage=$pdo->get_NbImage_Critere($_SESSION['majcritere']);
			if($nbImage['NB']==0){
                    $pdo->add_Image_Critere($_SESSION['majcritere'],$_POST['image']);
                }else{
					$pdo->update_Image_Critere($_SESSION['majcritere'],$_POST['image']);
				}
			}
			
				include("vue/v_menu_crit_modif.php");
		break;
		
		case 'modifAdminObservation':
		if(isset($_POST['retour'])){
			$_SESSION['entpied']="majCritere2";
		}
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
			if(isset($_POST['retour'])){
				$_SESSION['entpied']="majCritere2";
			}
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
		$_SESSION['entpied']="majCritere2";
		if(isset($_POST['retour'])){
			include("vue/v_menu_crit_modif.php");
		}else{
			$pdo->update_Article($_SESSION['listearticle']['NUM_RESUME_ARTICLE'],$_POST['newnomarticle']);
			include("vue/v_menu_crit_modif.php");
		}
			
		break;
		
		
		
		
	case 'coordonees_structures' :
		break;
		
		
	case 'coordonees_inspecteur' :
	
	if(isset($_POST['creer_inspect'])){
		include("vue/v_creer_coordonees_inspecteur.php");
	}else{
		if(isset($_POST['modif_suppr_inspec'])){
			$lesControleurs = $pdo->get_Controleur();
			$_SESSION['modifInspect']="";
			$dispo="disabled";
			include("vue/v_modif_coordonees_inspecteur.php");
		}else{
			include("vue/v_coordonees_inspecteur.php");
		}
	}
		
		$_SESSION['entpied'] = "coordonees_inspecteur";
		
		
		break;
		
		case 'creer_coordonees_inspecteur':
			if(isset($_POST['enregistrer_inspecteur'])){
			$pdo->enregistrer_Controleur($_POST['nom_inspecteur'], $_POST['prenom_inspecteur'], $_POST['fonction_inspecteur'], $_POST['affectation_inspecteur'], $_POST['centre_inspecteur'], $_POST['adresse_inspecteur'], $_POST['tel_fixe_inspecteur'], $_POST['tel_portable_inspecteur'], $_POST['fax_inspecteur'], $_POST['email_inspecteur'] );
			header('Location:index.php?uc=maj&action=coordonees_inspecteur');
		}
		break;
		
		case 'modif_coordonees_inspecteur':
			
			if(isset($_POST['supprimer_inspecteur'])){
				$pdo->delete_Controleur($_SESSION['modifInspect']);
				$_SESSION['modifInspect']="";
			}else{
				$_SESSION['modifInspect']=$_POST['lst_controleur'];
			}
			if(isset($_POST['modifier_inspecteur'])){
				$pdo->update_ModifControleur($_POST['nom_inspecteur'], $_POST['prenom_inspecteur'], $_POST['fonction_inspecteur'], $_POST['affectation_inspecteur'], $_POST['centre_inspecteur'], $_POST['adresse_inspecteur'], $_POST['tel_fixe_inspecteur'], $_POST['tel_portable_inspecteur'], $_POST['fax_inspecteur'], $_POST['email_inspecteur'],$_SESSION['modifInspect']);
			}
			
			$lesControleurs = $pdo->get_Controleur();
			
			if(isset($_POST['lst_controleur'])){
				$dispo="";
				$controleur=$pdo->get_Controleur_by_NumControleur($_SESSION['modifInspect']);
				include("vue/v_modif_coordonees_inspecteur.php");
			}
			
			
			
		break;

	case 'logoAdresse' : 
	$infoCentre = $pdo->get_Info_Centre();
	include("vue/v_logo.php");
		break;
	
	case 'modif_logo':
		if(isset($_POST["modifier"])){
			$pdo->update_Centre($_POST['logo'],$_POST['nom'],$_POST['adresse'],$_POST['cp'],$_POST['ville'],$_POST['tel'],$_POST['fax'],$_POST['site']);
		}
		include('vue/v_maj.php');
	break;
}
?>