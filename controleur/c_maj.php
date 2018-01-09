<?php

$action = $_REQUEST['action'];
$_SESSION['entpied'] = "";


switch($action) {	
	case 'selectionner_critere' : 
		break;
	case 'coordonees_structures' :
		break;
	case 'coordonees_inspecteur' : 
		$_SESSION['entpied'] = "coordonees_inspecteur";
		include("vue/v_coordonees_inspecteur.php");
		break;
	case 'logo_adresse' : 
		break;
}
?>