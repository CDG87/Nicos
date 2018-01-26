<?php


    require_once("include/inc_pdo_inspection.php");
    require_once("include/inc_fonctions.php");

    session_start();
    $estConnecte = estConnecte();
    $pdo = new Pdo_Inspection();
    if(!isset($_REQUEST['uc']) || !$estConnecte){
        $_REQUEST['uc'] = 'connexion';
    }
    $uc = $_REQUEST['uc'];

    switch($uc) {
        
        case 'connexion' :
            include("controleur/c_connexion.php");
            break;
            
        case 'creation' : //création ou choix d'un audit
			include("controleur/c_creation.php");
            break;
        case 'maj': //mise a jour
			include("controleur/c_maj.php");
            break;
        case 'identification' : //saisies infos audit
            include("controleur/c_audit.php");
            break;
            
        case 'audit' :
            include("controleur/c_audit.php");
            break;
            
        case 'organisationnel' :
            include("controleur/c_organisationnel.php");
            break;
            
        case 'sursite' :
            include("controleur/c_sursite.php");
            break;
            
        case 'rapport' :
			include("controleur/c_rapport.php");
			break;
    }
    include("include/pied.php");
?>