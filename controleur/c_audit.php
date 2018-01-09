<?php
    $action = $_REQUEST['action'];
    $lesTypesStructure = $pdo->get_Type_Structure();
    $lesControleurs = $pdo->get_Controleur();

    switch($action){
            
        case 'identification' :
            $numTypeStructureSelection = "";
			$_SESSION['nom_structure'] = "";
            include("vue/v_identification_structure.php");
            break;
            
        //Choix de la structure : type et nom
        case 'choix_structure' :	
            $_SESSION['nom_structure'] = '';
            $numTypeStructureSelection = $_POST['lst_type'];
            $_SESSION['type_structure'] = $numTypeStructureSelection; //numéro type structure
			if($_SESSION['isAdmin']==1){
            $_SESSION['libelle_audit'] = $_POST['libelle_audit']; //libelle audit 
			}else{
				$_SESSION['libelle_audit'] = "Inspection";
			}
            include("vue/v_identification_structure.php");
            if(isset($_POST['generer_adr'])) {
                $_SESSION['nom_structure'] = $_POST['nom_structure'];
                $nom_structure = $pdo->get_Nom_Structure($_SESSION['nom_structure']);
                if($nom_structure == null) {
                    ajouterErreur("Mauvaise structure");
                    include("vue/v_erreurs.php");
                }  
                else {
                    $numStructure = $pdo->get_Numero_Structure($_SESSION['nom_structure']);
                    $_SESSION['num_structure'] = $numStructure['NUM_STRUCTURE'];
                    $adresseStructure = $pdo->get_Adresse_Structure($_SESSION['num_structure']);
                    $numControleurSelection = "";
                    include("vue/v_identification_donnees_audit.php");
                }
            }
            break;
        
        //Choix du ou des participants
        case 'choix_participants' :
            $pdo->update_Adresse_Structure($_SESSION['num_structure'], $_POST['adresse_structure'], $_POST['ville_structure'], $_POST['cp_structure']); //modification de l'adresse complète de la structure
		
            if(isset($_POST['modifier_adr'])) {
                $_POST['lst_controleur'] = "";
            }
            else {
                $numControleurSelection = $_POST['lst_controleur'];
                $_SESSION['controleur'] = $numControleurSelection;
            }
            $nomStructure = $_SESSION['nom_structure'];
            $adresseStructure = $pdo->get_Adresse_Structure($_SESSION['num_structure']);
            $numTypeStructureSelection = $_SESSION['type_structure'];
            $_SESSION['participant_saisi'] = false;
            include("vue/v_identification_structure.php");
            include("vue/v_identification_donnees_audit.php");
            include("vue/v_identification_participants.php");
            break;
		

        //Saisie des participants
        case 'saisie_participants' :
            $numTypeStructureSelection = $_SESSION['type_structure'];
            $adresseStructure = $pdo->get_Adresse_Structure($_SESSION['num_structure']);
            $_SESSION['nbParticipants'] = $_POST['nb_participants'];
            $_SESSION['participant_saisi'] = true;
            include("vue/v_identification_structure.php");
            include("vue/v_identification_donnees_audit.php");
            include("vue/v_identification_participants.php");
            include("vue/v_identification_saisie_participants.php");
            break;
        
        //Enregistrer participants
        case 'enregistrer_participants' :
            $numTypeStructureSelection = $_SESSION['type_structure'];
            $adresseStructure = $pdo->get_Adresse_Structure($_SESSION['num_structure']);
            $lesParticipants = array();

        if(isset($_POST['btn_enregistrer'])) {
            for($j = 0; $j < $_SESSION['nbParticipants']; $j++) {
                $_SESSION['nom_participant'][$j] = $_POST['nom'][$j];
                $_SESSION['prenom_participant'][$j] = $_POST['prenom'][$j];
                $_SESSION['civilite_participant'][$j] = $_POST['civilite'][$j];
                $_SESSION['fonction_participant'][$j] = $_POST['fonction'][$j];
                array_push($lesParticipants, $_SESSION['num_structure']);
                array_push($lesParticipants,$_SESSION['nom_participant'][$j]);
                array_push($lesParticipants,$_SESSION['prenom_participant'][$j]);
                array_push($lesParticipants,$_SESSION['civilite_participant'][$j]);
                array_push($lesParticipants,$_SESSION['fonction_participant'][$j]);
                $pdo->insert_Participants($lesParticipants);
                $lesParticipants = array();
                $_SESSION['nom_participant'][$j] = array();
                $_SESSION['prenom_participant'][$j] = array();
                $_SESSION['civilite_participant'][$j] = array();
                $_SESSION['fonction_participant'][$j] = array();
            }		
        }
        include("vue/v_identification_structure.php");
        include("vue/v_identification_donnees_audit.php");
        include("vue/v_identification_participants.php");
        include("vue/v_identification_saisie_participants.php");
        include("vue/v_identification_date_audit.php");
        break;
        
        case 'partie' :
            $_SESSION['entpied'] = 'partie';
            if($_REQUEST['nt'] == 'oui') {
                $_SESSION['date_audit'] = $_POST['date_audit'];
                $pdo->insert_Audit($_SESSION['controleur'], $_SESSION['num_structure'], $_SESSION['date_audit'], $_SESSION['libelle_audit'], $_SESSION['date_audit']); //création d'un nouvel audit
                $numAudit = $pdo->get_Num_Audit(); //récupère le dernier numéro d'audit
                $_SESSION['audit'] = $numAudit['MAX(NUM_AUDIT)'];
                $enreg = $pdo->get_Last_Enreg_Participants($_SESSION['nbParticipants']); 
                $reverse_enreg = array();
                $reverse_enreg = array_reverse($enreg);
                $numAudit = intval($_SESSION['audit']);
                foreach($reverse_enreg as $unEnreg) {
                    $numParticipant = intval($unEnreg['NUM_PARTICIPANT']);
                    $pdo->insert_Participer($numParticipant, $numAudit);
                }
            }
			$lesDatesAudit = $pdo->get_Dates_Audit($_SESSION['audit']);
			if(isset($_REQUEST['insert_date'])) { //si insertion d'une nouvelle date
				foreach($lesDatesAudit as $uneDateAudit) {
					if($uneDateAudit['DATE_AUDIT_2'] == null) {
						$numDate = 2;
					
					}else if($uneDateAudit['DATE_AUDIT_3'] == null) {
						$numDate = 3;
						
					}else if($uneDateAudit['DATE_AUDIT_4'] == null) {
						$numDate = 4;
						
					}else if($uneDateAudit['DATE_AUDIT_5'] == null) {
						$numDate = 5;
						
					}
					
					$_SESSION['new_date_audit'] = $_POST['date_audit'];
					$pdo->update_Date_Audit($_SESSION['audit'], $_SESSION['new_date_audit'], $numDate);
				}
            }
            include("vue/v_partie.php");
            break;
		case 'modif_audit' :
			$_SESSION['entpied']='modif';
			$numTypeStructureSelection = "";
			$infosaudit = $pdo->get_Audit_En_Cours($_SESSION['audit']);
			$infosstructadresse = $pdo->get_AdresseStructure_En_Cours($_SESSION['audit']);
			$infostypetructnum = $pdo->get_NumTypeStructure_En_Cours($_SESSION['audit']);
			$infostypetructnom = $pdo->get_NomTypeStructure_En_Cours($_SESSION['audit']);
			$infosstructnom = $pdo->get_NomStructure_En_Cours($_SESSION['audit']);
			$infosstructville = $pdo -> get_VilleStructure_En_Cours($_SESSION['audit']);
			$infosstructcp = $pdo -> get_CpStructure_En_Cours($_SESSION['audit']);
			$infoscontrolnom = $pdo -> get_NomControlleur_En_Cours($_SESSION['audit']);
			$infoscontrolprenom = $pdo -> get_PrenomControlleur_En_Cours($_SESSION['audit']);
			$infoscontrolnum = $pdo -> get_NumControlleur_En_Cours($_SESSION['audit']);
			$nbparticipant = $pdo -> get_NbParticipant_En_Cours($_SESSION['audit']);
			$infosparticipant = $pdo -> get_Participant_En_Cours($_SESSION['audit']);
			include("vue/v_modif_info_inspection.php");
			break;
			
		case 'changer_info':
			$_SESSION['entpied']='modif';
			$infosstructnum = $pdo->get_NumStructure_En_Cours($_SESSION['audit']);
			$pdo->update_LibelAudit($_POST['libelle_audit'],$_SESSION['audit']);
			$pdo->update_addStruct($_POST['adresse_structure'],$infosstructnum['NUM_STRUCTURE']);
			$pdo->update_villeStruct($_POST['ville_structure'],$infosstructnum['NUM_STRUCTURE']);
			$pdo->update_cpStruct($_POST['cp_structure'],$infosstructnum['NUM_STRUCTURE']);
			$pdo->update_controleur($_POST['lst_controleur'],$_SESSION['audit']);
			
			header('Location: index.php?uc=identification&action=modif_audit&nt=non&aj=non&aft=non&mo=non&sup=non');
		break;
		
		case 'participant':
			$_SESSION['entpied']='modif';
			$infosstructnum = $pdo->get_NumStructure_En_Cours($_SESSION['audit']);
			
			if(isset($_POST['ajouter_participant'])){
				$pdo->insert_Participants_modif($infosstructnum['NUM_STRUCTURE'],$_POST['newnom'],$_POST['newprenom'],$_POST['newcivilite'],$_POST['newfonction']);
				$particip=$pdo->dernier_participant();
				$pdo->insert_Participe_modif($particip['NUM_PARTICIPANT'],$_SESSION['audit']);
				header('Location: index.php?uc=identification&action=modif_audit&nt=non&aj=non&aft=non&mo=non&sup=non');
			}
			
			if(isset($_POST['supprimer_participant'])){
				$pdo->delete_participe_modif($_POST['lst_participant']);
				$pdo->delete_participant_modif($_POST['lst_participant']);
				header('Location: index.php?uc=identification&action=modif_audit&nt=non&aj=non&aft=non&mo=non&sup=non');
			}
			
			if(isset($_POST['modifier_participant'])){
				$pdo->update_participant_amodif($_POST['nom'],$_POST['prenom'],$_POST['civilite'],$_POST['fonction'],$_POST['choix_participants_modif']);
				header('Location: index.php?uc=identification&action=modif_audit&nt=non&aj=non&aft=non&mo=non&sup=non');
			}
			
			if(isset($_POST['choix_participants_modif'])){
			$participantamodif=$pdo->select_participant_amodif($_POST['choix_participants_modif']);
			}
			if(isset($_POST['retour'])){
				header('Location: index.php?uc=audit&action=partie&nt=non');
			}
			
			
		break;
    }
?>