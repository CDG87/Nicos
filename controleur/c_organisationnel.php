<?php
$action = $_REQUEST['action'];


switch($action){
        
        case 'theme' :
            
            $_SESSION['cachemo'] = true;
            $_SESSION['idtheme'] = '';
            $_SESSION['chem'] = "Organisationnel";
            if($_REQUEST['nt'] == 'oui'){
                $_SESSION['codepartie'] = $_POST['codepartie'];
                $_SESSION['entpied'] = $_REQUEST['entpied'];
            }
            else{
                $_SESSION['entpied'] = 'theme';
            }
            //Ajout d'un thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aj'] == 'oui'){
                $pdo->add_Theme($_POST['newnomtheme'], $_SESSION['codepartie']);
                if($_POST['avoirst'] == 'oui'){
                    $numtheme = $pdo->get_Theme_cree();
                    $pdo->add_Sous_Theme_Defaut();
                    $numsoustheme = $pdo->get_Sous_Theme_cree();
                    $pdo->add_Critere_Defaut($numtheme['MAX(NUM_THEME)'], $numsoustheme['MAX(NUM_SOUS_THEME)']);
                }
                else{
                    $numtheme = $pdo->get_Theme_cree();
                    $pdo->add_Critere_DefautN($numtheme['MAX(NUM_THEME)']);
                }
                $numcritere = $pdo->get_Critere_cree();
                $pdo->add_Observation_Defaut($numcritere['MAX(NUM_CRITERE)']);
                $pdo->add_ResumeArticle_Defaut($numcritere['MAX(NUM_CRITERE)']);
                $pdo->add_Preconisation_Defaut($numcritere['MAX(NUM_CRITERE)']);
            }
            //Choix d'un thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aft'] == 'oui'){
                $_SESSION['idtheme'] = $_POST['idtheme'];
                $_SESSION['cachemo'] = false;
            }
            //Modification d'un thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['mo'] == 'oui'){
                $pdo->update_Theme($_POST['numtheme'], $_POST['nomtheme']);
            }
            //Suppression d'un thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['sup'] == 'oui'){
				$nbCrit = $pdo->get_Nb_Critere_Theme($_POST['numtheme']);
				$listenumcr = $pdo->get_Critere_T($_POST['numtheme']);
				$listenumst = $pdo->get_Sous_Theme_T($_POST['numtheme']);
				$listenumob = $pdo->get_Observation_LCR($listenumcr);
				$listenumpr = $pdo->get_Preconisation_LCR($listenumcr);
				$listenumar = $pdo->get_ResArticle_LCR($listenumcr);
				$listenumim = $pdo->get_Image_LCR($listenumcr);
                $pdo->delete_ComprendreObs_Liste($listenumob);
                $pdo->delete_PossederObs_Liste($listenumob);
				$pdo->delete_Observation_Liste($listenumob);
                $pdo->delete_DisposerPre_Liste($listenumpr);
                $pdo->delete_ContenirPre_Liste($listenumpr);
				$pdo->delete_Preconisation_Liste($listenumpr);
				$pdo->delete_ImageCR_Liste($listenumim);
				if($nbCrit['NBCRITERE'] != 1){
                $pdo->delete_ControleCR_Liste($listenumcr);
                $pdo->delete_InscrireCR_Liste($listenumcr);
				}
				
				
				$pdo->delete_Critere_Theme($_POST['numtheme']);
				$pdo->delete_Theme($_POST['numtheme']);
                if($listenumst != null){
                    $pdo->delete_Sous_Theme_Liste($listenumst);
                }
				$pdo->delete_ResArticle_Liste($listenumar);
            }
            $listeThemePartie = $pdo->get_Theme_Partie($_SESSION['codepartie']);
			$listecritereeff = $pdo->get_Critere_Audit($_SESSION['audit']);
			$listecreff = $pdo->get_Critere_LCRET($listecritereeff);
			$listecrasc = $pdo->get_Critere_LTF($listecreff, $listeThemePartie);
			$listecr = $pdo->get_Critere_LT($listeThemePartie);
            include("vue/v_theme.php");
            break;
        
        case 'soustheme' :
            $_SESSION['st'] = '';
            $_SESSION['idsoustheme'] = '';
            $_SESSION['cachemo'] = true;
            if($_REQUEST['nt'] == 'oui'){
                $_SESSION['numtheme'] = $_POST['numtheme'];
                $_SESSION['chem'] = $_SESSION['chem'].' > '.$_POST['nomtheme'];
                $_SESSION['chemA'] = $_SESSION['chem'];
            }
            else{
                $_SESSION['chem'] = $_SESSION['chemA'];
                $_SESSION['entpied'] = 'soustheme';
            }
			//Ajout d'un sous-thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aj'] == 'oui'){
                $pdo->add_Sous_Theme($_POST['newnomsoustheme']);
                $numsoustheme = $pdo->get_Sous_Theme_cree();
                $pdo->add_Critere_Defaut($_SESSION['numtheme'], $numsoustheme['MAX(NUM_SOUS_THEME)']);
				$numcritere = $pdo->get_Critere_cree();
                $pdo->add_Observation_Defaut($numcritere['MAX(NUM_CRITERE)']);
                $pdo->add_ResumeArticle_Defaut($numcritere['MAX(NUM_CRITERE)']);
                $pdo->add_Preconisation_Defaut($numcritere['MAX(NUM_CRITERE)']);
            }
			//Choix d'un sous-thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aft'] == 'oui'){
                $_SESSION['idsoustheme'] = $_POST['idsoustheme'];
                $_SESSION['cachemo'] = false;
            }
			//Modification d'un sous-thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['mo'] == 'oui'){
                $pdo->update_Sous_Theme($_POST['numsoustheme'], $_POST['nomsoustheme']);
            }
			//Suppression d'un sous-thème
            if($_REQUEST['nt'] == 'non' && $_REQUEST['sup'] == 'oui'){
				$listenumst = $pdo->get_Sous_Theme_T($_SESSION['numtheme']);
				if(count($listenumst) == 1){
					echo "<script>alert('Vous ne pouvez pas supprimer ce sous-thème car il n’en reste qu’un ! Si vous voulez le supprimer, il faut supprimer le thème entier !!!');</script>";
				}
				else{
					$nbCrit = $pdo -> get_Nb_Criteres_Controle_Sous_Theme($_POST['numsoustheme']);
					$listenumcr = $pdo->get_Critere_ST($_POST['numsoustheme']);
					$listenumob = $pdo->get_Observation_LCR($listenumcr);
					$listenumpr = $pdo->get_Preconisation_LCR($listenumcr);
					$listenumar = $pdo->get_ResArticle_LCR($listenumcr);
					$listenumim = $pdo->get_Image_LCR($listenumcr);
					$pdo->delete_ComprendreObs_Liste($listenumob);
					$pdo->delete_PossederObs_Liste($listenumob);
					$pdo->delete_Observation_Liste($listenumob);
					$pdo->delete_DisposerPre_Liste($listenumpr);
					$pdo->delete_ContenirPre_Liste($listenumpr);
					$pdo->delete_Preconisation_Liste($listenumpr);
					$pdo->delete_ImageCR_Liste($listenumim);
					if($nbCrit['nb_critere'] != 0){
					$pdo->delete_ControleCR_Liste($listenumcr);
					$pdo->delete_InscrireCR_Liste($listenumcr);
					}
					$pdo->delete_Critere_SousTheme($_POST['numsoustheme']);
					$pdo->delete_Sous_Theme($_POST['numsoustheme']);
					$pdo->delete_ResArticle_Liste($listenumar);
				}
            }
            $listeSousThemeNum = $pdo->get_Sous_Theme_Num($_SESSION['numtheme']);
            if($listeSousThemeNum == null){
                $_SESSION['entpied'] = 'critere';
                $_SESSION['idcritere'] = '';
				$_SESSION['numsoustheme'] = null;
                $listeCritereTheme = $pdo->get_Critere_NTheme($_SESSION['numtheme']);
				$listecritereeff = $pdo->get_Critere_Audit($_SESSION['audit']);
                include("vue/v_critere.php");
            }
            else{
                $_SESSION['entpied'] = 'soustheme';
				$listecritereeff = $pdo->get_Critere_Audit($_SESSION['audit']);
				$listecreff = $pdo->get_Critere_LCRE($listecritereeff);
				$listecrasc = $pdo->get_Critere_LEFF($listecreff, $listeSousThemeNum);
				$listecr = $pdo->get_Critere_LST($listeSousThemeNum);
                include("vue/v_soustheme.php");
            }
            break;
        
        case 'critere' :
			$infosaudit = $pdo->get_Audit_En_Cours($_SESSION['audit']);
            $_SESSION['idcritere'] = '';
            $_SESSION['cachemo'] = true;
			$_SESSION['cacheva'] = true;
            if($_REQUEST['nt'] == 'oui'){
                $_SESSION['numsoustheme'] = $_POST['numsoustheme'];
                $_SESSION['st'] = ' > '.$_POST['libsoustheme'];
                $_SESSION['chem'] = $_SESSION['chem'].$_SESSION['st'];
                $_SESSION['chemB'] = $_SESSION['chem'];
                $_SESSION['entpied'] = $_REQUEST['entpied'];
            }
            else{
				if($_SESSION['numsoustheme'] == null){
					$_SESSION['chem'] = $_SESSION['chemA'];
				}
				else{
					$_SESSION['chem'] = $_SESSION['chemB'];
				}
                $_SESSION['entpied'] = 'critere';
                if(isset($_REQUEST['finicritere'])){
                    if($_SESSION['precomanu'] == false){
						if($infosaudit['LIBELLE_AUDIT']!="Inspection"){
							$_SESSION['conformite'] = 'SA';
						}else{
							$_SESSION['conformite'] = $_POST['conf'];
						}
                        if(isset($_POST['vaimpo'])){
                            $_SESSION['obsimp'] = 1;
                        }
                        else{
                            $_SESSION['obsimp'] = 0;
                        }
                        if($_FILES['photoprise']['name'] != ""){
                            $_SESSION['photoCR'] = $_FILES['photoprise']['name'];
                            $destination = 'photos/';
                            $photo = basename($_FILES['photoprise']['name']);
                            $dossier_temporaire = $_FILES['photoprise']['tmp_name'];
                            move_uploaded_file($dossier_temporaire,$destination . $photo);
                        }
                        else{
                            $_SESSION['photoCR'] = null;
                        }
                    }
                    else{
                        for($j = 0;$j < count($_SESSION['tabpreco']);$j++){
                            $pdo->add_Disposer_Preco($_SESSION['audit'], $_SESSION['tabpreco'][$j]);
                        }
                    }
                    for($i = 0;$i < count($_SESSION['tabobs']);$i++){
                        $pdo->add_Comprendre_Obs($_SESSION['audit'], $_SESSION['tabobs'][$i]);
                    }
                    $pdo->add_Controle_Critere($_SESSION['numcritere'], $_SESSION['audit'], $_SESSION['conformite'], $_SESSION['obsimp'], $_SESSION['precoCR'], $_SESSION['photoCR']);
                }
            }
            //Ajout d'un critere
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aj'] == 'oui'){
                $pdo->add_Critere($_POST['newnomcritere'], $_SESSION['numtheme'], $_SESSION['numsoustheme']);
				$numcritere = $pdo->get_Critere_cree();
                $pdo->add_Observation_Defaut($numcritere['MAX(NUM_CRITERE)']);
                $pdo->add_ResumeArticle_Defaut($numcritere['MAX(NUM_CRITERE)']);
                $pdo->add_Preconisation_Defaut($numcritere['MAX(NUM_CRITERE)']);
            }
			//Choix d'un critère
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aft'] == 'oui'){
                $_SESSION['idcritere'] = $_POST['idcritere'];
                $_SESSION['cachemo'] = false;
            }
			//Modification d'un critère
            if($_REQUEST['nt'] == 'non' && $_REQUEST['mo'] == 'oui'){
                $pdo->update_Critere($_POST['numcritere'], $_POST['nomcritere']);
            }
			//Suppression d'un critère
            if($_REQUEST['nt'] == 'non' && $_REQUEST['sup'] == 'oui'){
				if($_SESSION['numsoustheme'] == null){
					$listenumcr = $pdo->get_Critere_T($_SESSION['numtheme']);
				}
				else{
					$listenumcr = $pdo->get_Critere_ST($_SESSION['numsoustheme']);
				}
				if(count($listenumcr) == 1){
					echo "<script>alert('Vous ne pouvez pas supprimer ce critere car il n’en reste qu’un ! Si vous voulez le supprimer, il faut supprimer le thème entier !!!');</script>";
				}
				else{
					$listenumob = $pdo->get_Observation_OCR($_POST['numcritere']);
					$listenumpr = $pdo->get_Preconisation_OCR($_POST['numcritere']);
					$numart = $pdo->get_ResArticle_OCR($_POST['numcritere']);
					$listenumim = $pdo->get_Image_OCR($_POST['numcritere']);
					$pdo->delete_ComprendreObs_Liste($listenumob);
					$pdo->delete_PossederObs_Liste($listenumob);
					$pdo->delete_Observation_Liste($listenumob);
					$pdo->delete_DisposerPre_Liste($listenumpr);
					$pdo->delete_ContenirPre_Liste($listenumpr);
					$pdo->delete_Preconisation_Liste($listenumpr);
					$pdo->delete_ImageCR_Liste($listenumim);
					$pdo->delete_ControleCR_Liste($_POST['numcritere']);
					$pdo->delete_InscrireCR_Liste($_POST['numcritere']);
					$pdo->delete_Critere($_POST['numcritere']);
					$pdo->delete_ResArticle_NUM($numart['NUM_RESUME_ARTICLE']);
				}
            }
            $listeSousThemeNum = $pdo->get_Sous_Theme_Num($_SESSION['numtheme']);
            if($listeSousThemeNum == null){
                $listeCritereTheme = $pdo->get_Critere_NTheme($_SESSION['numtheme']);
            }
            else{
                $listeCritereTheme = $pdo->get_Critere_Theme($_SESSION['numtheme'], $_SESSION['numsoustheme']);
            }
			$listecritereeff = $pdo->get_Critere_Audit($_SESSION['audit']);
            include("vue/v_critere.php");
            break;
        
        case 'observation' :
			$infosaudit = $pdo->get_Audit_En_Cours($_SESSION['audit']);
			$couleur=false;
            $_SESSION['idobservation'] = '';
            $_SESSION['cachemo'] = true;
			$_SESSION['cacheva'] = true;
            $_SESSION['obsR'] = false;
            if($_REQUEST['nt'] == 'oui'){
                $_SESSION['numcritere'] = $_POST['numcritere'];
                $_SESSION['libcritere'] = $_POST['libcritere'];
                $_SESSION['entpied'] = $_REQUEST['entpied'];
                $_SESSION['chem'] = $_SESSION['chem'].' > '.$_POST['libcritere'];
				$_SESSION['chemC'] = $_SESSION['chem'];
                $_SESSION['tabobs'] = array();
                $_SESSION['tabobsR'] = array();
            }
			else{
                $_SESSION['chem'] = $_SESSION['chemC'];
                $_SESSION['entpied'] = 'observation';
            }
			//Ajout d'une observation
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aj'] == 'oui'){
                $pdo->add_Observation($_POST['newnomobservation'], $_SESSION['numcritere'], $_POST['cdobs']);
            }
			
			
			if(isset($_POST['ajouterO'])){
				$pdo->add_Observation_manu($_POST['obsmanu'], $_SESSION['numcritere'], $_POST['cdobsmanu'], $_SESSION['audit']);
			}
			
			
			
			
			//Choix d'une observation
			if($_REQUEST['nt'] == 'non' && $_REQUEST['cho'] == 'oui'){
                if(isset($_POST['valider'])){
                    $_SESSION['cacheva'] = false;
                    $_SESSION['precoCR'] = null;
					$_SESSION['precomanu'] = false;
                    for($i = 0;$i < count($_SESSION['tabobs']);$i++){
                        $cdcobs = $pdo->get_Observation_CDC($_SESSION['tabobs'][$i]);
                        if($cdcobs['CODE_COULEUR_OBSERVATION'] == 2){
							$couleur=true;
                            $_SESSION['obsR'] = true;
                            array_push($_SESSION['tabobsR'],$cdcobs['LIBELLE_OBSERVATION']);
                            $_SESSION['precomanu'] = true;
                        }
                    }
                }
                else{
					if(!isset($_POST['ajouterO'])){
						$j=-1;
						for($i = 0;$i < count($_SESSION['tabobs']);$i++){
							if($_SESSION['tabobs'][$i] == $_POST['btnobs']){
								$j=$i;
							}
						}
						if($j==-1){
							array_push($_SESSION['tabobs'],$_POST['btnobs']);
						}else{
							//unset($_SESSION['tabobs'][$j]);
							$_SESSION['tabobs'][$j]=null;
						}
					}
                }
            }
			//Choix d'une observation pour modification
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aft'] == 'oui'){
                $_SESSION['idobservation'] = $_POST['idobservation'];
                $_SESSION['cachemo'] = false;
            }
			//Modification d'une observation
            if($_REQUEST['nt'] == 'non' && $_REQUEST['mo'] == 'oui'){
                $pdo->update_Observation($_POST['numobs'], $_POST['nomobs']);
            }
			//Suppression d'une observation
            if($_REQUEST['nt'] == 'non' && $_REQUEST['sup'] == 'oui'){
				//$pdo->delete_ComprendreObs_Liste($listenumob);
				//$pdo->delete_PossederObs_Liste($listenumob);
                $pdo->delete_Observation($_POST['numobs']);
            }
            $listeObservation = $pdo->get_Observation_Critere($_SESSION['numcritere'],$_SESSION['audit']);
            include("vue/v_observation.php");
            break;
        
        case 'article' :
            $_SESSION['cachemo'] = true;
            if($_REQUEST['nt'] == 'oui'){
                $_SESSION['entpied'] = $_REQUEST['entpied'];
            }
			//Modification d'un article
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aft'] == 'oui'){
                $_SESSION['cachemo'] = false;
            }
			//Valisation de la modification d'un article
            if($_REQUEST['mo'] == 'oui'){
                $pdo->update_Article($_SESSION['numarticle'], $_POST['newnomarticle']);
            }
			$listearticle = $pdo->get_ResArticle_Critere($_SESSION['numcritere']);
			$_SESSION['numarticle'] = $listearticle['NUM_RESUME_ARTICLE'];
			$_SESSION['articlecritere'] = $listearticle['DESCRIPTION_RESUME_ARTICLE'];
            $listeimgcr = $pdo->get_Liste_IMGCR($_SESSION['numcritere']);
            include("vue/v_article.php");
            break;
			
		case 'preconisation' :
		$infosaudit = $pdo->get_Audit_En_Cours($_SESSION['audit']);
			$_SESSION['idpreconisation'] = '';
            $_SESSION['cachemo'] = true;
            $_SESSION['cachevaP'] = 'oui';
            if($_REQUEST['nt'] == 'oui'){
                $_SESSION['entpied'] = $_REQUEST['entpied'];
               if($infosaudit['LIBELLE_AUDIT']!="Inspection"){
							$_SESSION['conformite'] = 'SA';
						}else{
							$_SESSION['conformite'] = $_POST['conf'];
						}
                if(isset($_POST['vaimpo'])){
                    $_SESSION['obsimp'] = 1;
                }
                else{
                    $_SESSION['obsimp'] = 0;
                }
                if($_FILES['photoprise']['name'] != ""){
                    $_SESSION['photoCR'] = $_FILES['photoprise']['name'];
                }
                else{
                    $_SESSION['photoCR'] = null;
                }
                $_SESSION['tabpreco'] = array();
            }
            //Ajout d'une préconisation
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aj'] == 'oui'){
                $pdo->add_Preconisation($_POST['newnompreco'], $_SESSION['numcritere']);
            }
			
			//ajout preco_manuel
			if(isset($_POST['ajouterP'])){
				$pdo->add_Preconisation_manuel($_POST['precomanu'], $_SESSION['numcritere'],$_SESSION['audit']);
			}
			
            //Choix d'une préconisation
			if($_REQUEST['nt'] == 'non' && $_REQUEST['cho'] == 'oui'){
                if(isset($_POST['btnpreco'])){
					$j=-1;
					for($i = 0;$i < count($_SESSION['tabpreco']);$i++){
						if($_SESSION['tabpreco'][$i] == $_POST['btnpreco']){
							$j=$i;
						}
					}
					if($j==-1){
						array_push($_SESSION['tabpreco'],$_POST['btnpreco']);
					}else{
						//unset($_SESSION['tabobs'][$j]);
						$_SESSION['tabpreco'][$j]=null;
					}
                }
                if(isset($_POST['ajouterP'])){
                    $_SESSION['precoCR'] = null;
                    $_SESSION['cachevaP'] = 'non';
                }
				else if(isset($_POST['nonajouter'])){
					$_SESSION['precoCR'] = null;
                    $_SESSION['cachevaP'] = 'non';
				}
            }
			//Choix d'une préconisation pour modification
            if($_REQUEST['nt'] == 'non' && $_REQUEST['aft'] == 'oui'){
                $_SESSION['idpreconisation'] = $_POST['idpreconisation'];
                $_SESSION['cachemo'] = false;
            }
			//Modification d'une préconisation
            if($_REQUEST['nt'] == 'non' && $_REQUEST['mo'] == 'oui'){
                $pdo->update_Preconisation($_POST['numpreco'], $_POST['nompreco']);
            }
			//Suppression d'une préconisation
            if($_REQUEST['nt'] == 'non' && $_REQUEST['sup'] == 'oui'){
                $pdo->delete_Preconisation($_POST['numpreco']);
            }
            $listepreconisation = $pdo->get_Preconisation_Critere($_SESSION['numcritere'],$_SESSION['audit']);
            include("vue/v_preconisation.php");
            break;
    }
?>