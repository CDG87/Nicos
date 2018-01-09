<?php

if(!isset($_REQUEST['action'])) {
	$_REQUEST['action'] = 'accueil';
    $_SESSION = array(); 
    $_SESSION['entpied'] = '';
    $_SESSION['codepartie'] = '';
}

$action = $_REQUEST['action'];

switch($action) {
	
    case 'accueil' :
        $_SESSION['entpied'] = "accueil";
		include("vue/v_accueil.php");
        break;
        
	case 'retour_menu' :
		$listeAudit = $pdo->get_NumAudit();
		$_SESSION['entpied'] = 'creation';
		include("vue/v_action_audit.php");
		require("controleur/c_creation.php");
		break;	
		
	case 'demandeConnexion' : 
        $_SESSION['entpied'] = "connexion";
		include("vue/v_connexion.php");
	break;
	
	case 'valideConnexion' : 
		$login = $_REQUEST['login'];
		$mdp = $_REQUEST['mdp'];
		$controleur = $pdo->get_Auth($login, $mdp);
		
		if(!is_array($controleur)) {
			ajouterErreur("Login ou mot de passe incorrect");
			include("vue/v_erreurs.php");
			include("vue/v_connexion.php");
		}else {
			$idControleur = $controleur['NUM_CONTROLEUR'];
			$nom = $controleur['NOM_CONTROLEUR'];
			$prenom = $controleur['PRENOM_CONTROLEUR'];
			$isAdmin = $controleur['ADMIN_CONTROLEUR'];
			connecter($idControleur, $nom, $prenom, $isAdmin);
			$_REQUEST['action'] = "partie_creation";
			require("controleur/c_creation.php");
		}
	break;
	
	default :
		include("vue/v_connexion.php");
	break; 
	
}

?>