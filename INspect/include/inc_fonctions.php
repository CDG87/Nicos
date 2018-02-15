<?php


/**
* Teste l'existence d'une connexion 
* @return true ou false
**/
function estConnecte() {
	return isset($_SESSION['idControleur']);
}

/**
* Stocke dans des variables de session les données du controleur
* rajouter adresse, cp ????
**/
function connecter($idControleur, $nom, $prenom, $isAdmin) {
	$_SESSION['idControleur'] = $idControleur;
	$_SESSION['nom'] = $nom;
	$_SESSION['prenom'] = $prenom;
	$_SESSION['isAdmin'] = $isAdmin;
}

/**
 * Détruit la session active
 */
function deconnecter(){
	session_destroy();
}

/**
 * Transforme une date au format format anglais aaaa-mm-jj vers le format français jj/mm/aaaa 
 
 * @param $madate au format  aaaa-mm-jj
 * @return la date au format format français jj/mm/aaaa
*/
function dateAnglaisVersFrancais($maDate){
   @list($annee,$mois,$jour)=explode('-',$maDate);
   $date="$jour"."/".$mois."/".$annee;
   return $date;
}

/**
 * Ajoute le libellé d'une erreur au tableau des erreurs 
 
 * @param $msg : le libellé de l'erreur 
 */
function ajouterErreur($msg){
	if (!isset($_REQUEST['erreurs'])){
		$_REQUEST['erreurs']=array();
	} 
	$_REQUEST['erreurs'][]=$msg;
}


?>