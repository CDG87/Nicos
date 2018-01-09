<?php

$action = $_REQUEST['action'];
$_SESSION['entpied'] = "";


switch($action) {	
	case 'selectionner_critere' :
		// $lstTheme=get_Theme_Partie($_POST['partie']);
		// $lstSt=get_Sous_Theme_Num($_POST['theme']);
		// $lstCrit=get_Critere_Theme($_POST['theme'],$_POST['st']);
		include("vue/v_selection_critere.php");
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