<?php

$action = $_REQUEST['action'];
$_SESSION['entpied'] = "";


switch($action) {	

	case 'partie_creation' : //après la connexion
		$_SESSION['entpied'] = "creation";
        $listeAudit = $pdo->get_NumAudit();
		include("vue/v_action_audit.php");
	break;
	
	case 'new_audit' : //création d'un audit
		$_REQUEST['action'] = "identification";
		$_SESSION['entpied'] = "identification";
        if(isset($_REQUEST['act_creation'])){
            $_SESSION['choix_creation'] = $_REQUEST['act_creation'];
        }
		require("controleur/c_audit.php");
	break;
	
	case 'choix_audit' :
		$numAuditSelection = "";
		$lesAudits = $pdo->get_Audit();
		$mesStructures = array();
		foreach($lesAudits as $unAudit) {
			$structure = $pdo->get_Adresse_Structure($unAudit['NUM_STRUCTURE']);
			$maStructure = $structure[3];
			array_push($mesStructures, $maStructure);
		}
		include("vue/v_audit_ancien.php");
	break;
	
	case 'donnees_ancien_audit' :
		$_SESSION['entpied'] = "choix_audit";
        if(isset($_REQUEST['act_creation'])){
            $_SESSION['choix_creation'] = $_REQUEST['act_creation'];
        }
		$numAuditSelection = "";
		$lesAudits = $pdo->get_Audit();
		$mesStructures = array();
		foreach($lesAudits as $unAudit) {
			$structure = $pdo->get_Adresse_Structure($unAudit['NUM_STRUCTURE']);
			$maStructure = $structure[3];
			array_push($mesStructures, $maStructure);
		}
		
		if(isset($_POST['lst_audit'])) {
			$numAuditSelection = $_POST['lst_audit'];
			$_SESSION['audit'] = $numAuditSelection;
		}
        
        
		include("vue/v_audit_ancien.php");
	break;
	
		case 'suppr_audit' :
		$_SESSION['entpied'] = 'suppr_audit';
		$numAuditSelection = "";
		$lesAudits = $pdo->get_Audit();
		$mesStructures = array();
		foreach($lesAudits as $unAudit) {
			$structure = $pdo->get_Adresse_Structure($unAudit['NUM_STRUCTURE']);
			$maStructure = $structure[3];
			array_push($mesStructures, $maStructure);
		}
		include("vue/v_suppr_audit.php");
		break;
		
		
		
	case 'donnees_suppr_audit' :
		$_SESSION['entpied'] = "suppr_audit";
        if(isset($_REQUEST['act_creation'])){
            $_SESSION['choix_creation'] = $_REQUEST['act_creation'];
        }
		$numAuditSelection = "";
		$lesAudits = $pdo->get_Audit();
		$mesStructures = array();
		foreach($lesAudits as $unAudit) {
			$structure = $pdo->get_Adresse_Structure($unAudit['NUM_STRUCTURE']);
			$maStructure = $structure[3];
			array_push($mesStructures, $maStructure);
		}
		
		if(isset($_POST['lst_audit'])) {
			$numAuditSelection = $_POST['lst_audit'];
			$_SESSION['audit'] = $numAuditSelection;
		}
			if(isset($_POST['suppr_audit'])){
				$num=$_POST['lst_audit'];
				$participants=$pdo->get_Infos_Participants($num);
				$pdo->delete_PRE_PARTICIPER($num);
				$pdo->delete_PRE_INSCRIRE($num);
				$pdo->delete_PRE_POSSEDER($num);
				$pdo->delete_PRE_CONTENIR($num);
				$pdo->delete_PRE_DISPOSER($num);
				$pdo->delete_PRE_COMPRENDRE($num);
				$pdo->delete_PRE_CONTROLE_CRITERE($num);
				$pdo->delete_PRE_CONTROLER($num);
				$pdo->delete_preco_manu($num);
				$pdo->delete_obs_manu($num);
				$pdo->delete_PRE_AUDIT($num);
				foreach($participants AS $participant){
					$pdo->delete_PRE_PARTICIPANT($participant['NUM_PARTICIPANT']);
				}
				$pdo->delete_Batiment_manu($num);
				$pdo->delete_Lieu_manu($num);
				$delai=0;
				header("Refresh: $delai;");
			}
		include("vue/v_suppr_audit.php");
	break;
	
	case 'maj' :
		$_SESSION['entpied'] = "maj";
		include("vue/v_maj.php");
		require("controleur/c_maj.php");

	break;
}
?>