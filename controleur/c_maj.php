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
		$_SESSION['entpied']="majVersion";
		include("vue/v_maj_version.php");
		
		
		break;
		
	case 'version' :
		if(isset($_POST['modifier'])){
			$pdo->update_version($_POST['version']);
		}
		$_SESSION['entpied'] = 'maj';
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
				$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				$_SESSION['listearticle'] = $pdo->get_ResArticle_Critere($_SESSION['majcritere']);
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
				$_SESSION['textObs']="";
				$_SESSION['numObs']="";
				$_SESSION['entpied']='modifOservation';
				$listeObservation=$pdo->get_Observation_CritereModif($_SESSION['majcritere']);
				include("vue/v_modifObservation.php");
			}else{
				if(isset($_POST['proposition'])){
					$_SESSION['textPropo']="";
					$_SESSION['entpied']='modifProposition';
					$_SESSION['numPropo']="";
				$listeProposition=$pdo->get_Preconisation_CritereMaj($_SESSION['majcritere']);
					include("vue/v_modifProposition.php");
				}else{
					if(isset($_POST['image'])){
						$nbImage=$pdo->get_NbImage_Critere($_SESSION['majcritere']);
						if($nbImage['NB']!=0){
							$image=$pdo->get_Liste_IMGCR($_SESSION['majcritere']);	
							//$image=$image['LIBELLE_IMAGE_CRITERE'];
						}else{
							$image=-1;
						}
						$_SESSION['entpied']='modifImage';
						include("vue/v_modifImage.php");
					}else{
						if(isset($_POST['retour'])){
							$_SESSION['entpied']="maj";
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
			$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
			if(isset($_POST['retour'])){
				
			}else{
				if(isset($_POST['modifier'])){
					$nbImage=$pdo->get_NbImage_Critere($_SESSION['majcritere']);
					if($nbImage['NB']==0){
						$pdo->add_Image_Critere($_SESSION['majcritere'],$_POST['image']);
						$pdo->update_Date_Image($_SESSION['majcritere']);
						$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
					}else{
						$pdo->update_Image_Critere($_SESSION['majcritere'],$_POST['image']);
						$pdo->update_Date_Image($_SESSION['majcritere']);
						$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
					}
				}else{
					if(isset($_POST['supprimer'])){
						$pdo->suppr_Image_Critere($_SESSION['majcritere']);
						$pdo->update_Date_Image($_SESSION['majcritere']);
						$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
					}
				}
			}
			
				$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				$_SESSION['entpied']="majCritere2";
				include("vue/v_menu_crit_modif.php");
		break;
		
		case 'modifAdminObservation':
		$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
		$listeObservation=$pdo->get_Observation_CritereModif($_SESSION['majcritere']);
		if(isset($_POST['retour'])){
			$_SESSION['entpied']="majCritere2";
			include("vue/v_menu_crit_modif.php");
		}
			if(isset($_POST['ajouter'])){
				$pdo->add_Observation($_POST['newnomobservation'], $_SESSION['majcritere'], $_POST['cdobs']);
				$pdo->update_Date_Observation($_SESSION['majcritere']);
				$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				$_SESSION['entpied'] = 'majCritere2';
				include("vue/v_menu_crit_modif.php");
			}
			
			if(isset($_POST['modifier'])){
				 $pdo->update_Observation($_POST['idobservation'], $_POST['nomobs']);
				 $pdo->update_Date_Observation($_SESSION['majcritere']);
				 $_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				 $_SESSION['entpied'] = 'majCritere2';
				 include("vue/v_menu_crit_modif.php");
			}
			
			if(isset($_POST['supprimer'])){
				$pdo->delete_Observation($_POST['idobservation']);
				$pdo->update_Date_Observation($_SESSION['majcritere']);
				$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				$_SESSION['entpied'] = 'majCritere2';
				include("vue/v_menu_crit_modif.php");
			}
			if(isset($_POST['idobservation'])){
				$libelle=$pdo->get_Observ_par_num($_POST['idobservation']);
				$_SESSION['textObs']=$libelle['LIBELLE_OBSERVATION'];
				$_SESSION['numObs']=$libelle['NUM_OBSERVATION'];
				if(!isset($_POST['modifier']) && !isset($_POST['supprimer']) && !isset($_POST['ajouter']) && !isset($_POST['retour'])){
					include("vue/v_modifObservation.php");
				}
			}
			
			
			
		break;
		
		case 'modifAdminProposition':
			$listeProposition=$pdo->get_Preconisation_CritereMaj($_SESSION['majcritere']);
			if(isset($_POST['retour'])){
				$_SESSION['entpied']="majCritere2";
				include("vue/v_menu_crit_modif.php");
			}
			if(isset($_POST['ajouter'])){
				$pdo->add_Preconisation($_POST['newnomproposition'], $_SESSION['majcritere']);
				$pdo->update_Date_Proposition($_SESSION['majcritere']);
				$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				$_SESSION['entpied']="majCritere2";
				include("vue/v_menu_crit_modif.php");
			}
			
			if(isset($_POST['modifier'])){
				$pdo->update_Preconisation($_POST['idproposition'], $_POST['nomprop']);
				$pdo->update_Date_Proposition($_SESSION['majcritere']);
				$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				$_SESSION['entpied']="majCritere2";
				include("vue/v_menu_crit_modif.php");
			}
			
			if(isset($_POST['supprimer'])){
				$pdo->delete_Preconisation($_POST['idproposition']);
				$pdo->update_Date_Proposition($_SESSION['majcritere']);
				$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
				$_SESSION['entpied']="majCritere2";
				include("vue/v_menu_crit_modif.php");
			}
			if(isset($_POST['idproposition'])){
				$libelle=$pdo->get_Preco_par_num($_POST['idproposition']);
				$_SESSION['textPropo']=$libelle['LIBELLE_PRECONISATION'];
				$_SESSION['numPropo']=$libelle['NUM_PRECONISATION'];
				if(!isset($_POST['modifier']) && !isset($_POST['supprimer']) && !isset($_POST['ajouter']) && !isset($_POST['retour'])){
					include("vue/v_modifProposition.php");
				}
			}
			$_SESSION['dateMaj']=$pdo->get_Date_Maj($_SESSION['majcritere']);
			
		break;
		
		case 'modifAdminCrit':
		$_SESSION['entpied']="majCritere2";
		if(isset($_POST['retour'])){
			$_SESSION['listearticle'] = $pdo->get_ResArticle_Critere($_SESSION['majcritere']);
			include("vue/v_menu_crit_modif.php");
		}else{
			$pdo->update_Article($_SESSION['listearticle']['NUM_RESUME_ARTICLE'],$_POST['newnomarticle']);
			$_SESSION['listearticle'] = $pdo->get_ResArticle_Critere($_SESSION['majcritere']);
			include("vue/v_menu_crit_modif.php");
		}
			
		break;
		
	case 'coordonees_inspecteur' :
	$_SESSION['entpied']="majCoordInspec";
	if(isset($_POST['creer_inspect'])){
		$_SESSION['entpied'] = "coordonees_inspecteur";
		include("vue/v_creer_coordonees_inspecteur.php");
		
	}else{
		if(isset($_POST['modif_suppr_inspec'])){
			$lesControleurs = $pdo->get_Controleur();
			$_SESSION['modifInspect']="";
			$dispo="disabled";
			$_SESSION['entpied'] = "coordonees_inspecteur";
			include("vue/v_modif_coordonees_inspecteur.php");
			
		}else{
			if(isset($_POST['retour'])){
				$_SESSION['entpied'] = "maj";
				include('vue/v_maj.php');
				
			}else{
				$_SESSION['entpied'] = "coordonees_inspecteur";
				include("vue/v_coordonees_inspecteur.php");
				
			}
		}
	}
		
		break;
		
		case 'creer_coordonees_inspecteur':
			if(isset($_POST['enregistrer_inspecteur'])){
			$pdo->enregistrer_Controleur($_POST['nom_inspecteur'], $_POST['prenom_inspecteur'], $_POST['fonction_inspecteur'], $_POST['affectation_inspecteur'], $_POST['centre_inspecteur'], $_POST['adresse_inspecteur'], $_POST['tel_fixe_inspecteur'], $_POST['tel_portable_inspecteur'], $_POST['fax_inspecteur'], $_POST['email_inspecteur'] );
			header('Location:index.php?uc=maj&action=coordonees_inspecteur');
		}
		break;
		
		case 'modif_coordonees_inspecteur':
			$_SESSION['entpied']="majCoordInspec";
			if(isset($_POST['supprimer_inspecteur'])){
				$pdo->delete_Controleur($_SESSION['modifInspect']);
				$_SESSION['modifInspect']="";
				include("vue/v_coordonees_inspecteur.php");
			}else{
				$_SESSION['modifInspect']=$_POST['lst_controleur'];
			}
			if(isset($_POST['modifier_inspecteur'])){
				$pdo->update_ModifControleur($_POST['nom_inspecteur'], $_POST['prenom_inspecteur'], $_POST['fonction_inspecteur'], $_POST['affectation_inspecteur'], $_POST['centre_inspecteur'], $_POST['adresse_inspecteur'], $_POST['tel_fixe_inspecteur'], $_POST['tel_portable_inspecteur'], $_POST['fax_inspecteur'], $_POST['email_inspecteur'],$_SESSION['modifInspect']);
				include("vue/v_coordonees_inspecteur.php");
			}
			
			$lesControleurs = $pdo->get_Controleur();
			
			if(isset($_POST['lst_controleur'])){
				$dispo="";
				$controleur=$pdo->get_Controleur_by_NumControleur($_SESSION['modifInspect']);
				if(!isset($_POST['modifier_inspecteur']) && !isset($_POST['supprimer_inspecteur'])){
					include("vue/v_modif_coordonees_inspecteur.php");
				}
				
			}
			
			
			
		break;

	case 'logoAdresse' : 
	$_SESSION['entpied']="majLogo";
	$infoCentre = $pdo->get_Info_Centre();
	include("vue/v_logo.php");
		break;
	
	case 'modif_logo':
		if(isset($_POST["modifier"])){
			$pdo->update_Centre($_POST['logo'], $_POST['entete'], $_POST['nom'],$_POST['adresse'],$_POST['cp'],$_POST['ville'],$_POST['tel'],$_POST['fax'],$_POST['site']);
		}
		$_SESSION['entpied']="maj";
		include('vue/v_maj.php');
	break;
	
	
	
	case 'coordonees_structures' :
		include("vue/v_coordonees_structure.php");
		break;
	
	case 'coord_struct':
		if(isset($_POST['creer_struct'])){
			$lesStructures = $pdo->get_Type_Structure();
			$_SESSION['entpied']="majCoordStruc";
		include("vue/v_creer_coordonees_structure.php");
		
	}else{
		if(isset($_POST['modif_suppr_struct'])){
			$lesTypesStructures = $pdo->get_Type_Structure();
			$_SESSION['modifStructure']="";
			$dispo="disabled";
			$_SESSION['entpied']="majCoordStruc";
			include("vue/v_modif_coordonees_structure.php");
		}else{
			if(isset($_POST['retour'])){
				$_SESSION['entpied']="maj";
				include('vue/v_maj.php');
			}else{
				
				$_SESSION['entpied']="majCoordStruc";
				include("vue/v_coordonees_structure.php");
			}
			
		}
	}

		
		
	break;
	
	case 'creer_coordonees_structure':
	if(isset($_POST['enregistrer_structure'])){
		$maxi=$pdo->get_Max_Num_Structure();
		$maxi=$maxi['maxi']+1;
		$pdo->add_structure($maxi,$_POST['lst_structure'],$_POST['nom'],$_POST['adresse'],$_POST['ville'],$_POST['cp'],$_POST['tel'],$_POST['mail']);
		include("vue/v_coordonees_structure.php");
	}
	break;
	
	case 'modif_coordonees_structure':
	$lesTypesStructures = $pdo->get_Type_Structure();
	if(isset($_POST['choix']) && !isset($_POST['retour'])){
		$num=$pdo->get_Adresse_StructureParNom($_POST['nom_structure']);
		$_SESSION['nomStructure']=$_POST['nom_structure'];
		$_SESSION['modifStructure']=$num['NUM_STRUCTURE'];
		$maStructure=$pdo->get_Adresse_Structure($_SESSION['modifStructure']);
		include("vue/v_modif_coordonees_structure.php");
	}
	if(isset($_POST['supprimer_structure'])){
		$pdo->delete_Structure($_SESSION['modifStructure']);
		include("vue/v_coordonees_structure.php");
	}
	
	if(isset($_POST['modifier_structure'])){
		$pdo->update_Structure($_POST['lst_structure'],$_POST['nomStructure'],$_POST['adresseStructure'],$_POST['villeStructure'],$_POST['cpStructure'],$_POST['telStructure'],$_POST['mailStructure'],$_SESSION['modifStructure']);
		include("vue/v_coordonees_structure.php");
	}
	if(isset($_POST['retour'])){
		include("vue/v_coordonees_structure.php");
	}
	break;
	
}
?>