<?php

/** 
 * Classe d'accès aux données. 
 
 * Utilise les services de la classe PDO
 * pour l'application INSPECTION
 * Les attributs sont tous statiques,
 * les 4 premiers pour la connexion
 * $monPdo de type PDO 
 * $monPdoInspection qui contiendra l'unique instance de la classe
 
 * @package default
 * @author Nicolas Preveraud - Nicolas Braud
 * @version    1.0
 */
 
class Pdo_Inspection {
	
	private $serveur = 'mysql:host=localhost';
	private $bdd = 'dbname=base_inspection_cdg';
	private $user = 'root';
	private $mdp = '';
	private $monPdoInspection = null;
	
	function __construct() {
		$this->monPdoInspection = new PDO($this->serveur.";".$this->bdd,$this->user,$this->mdp);
		$this->monPdoInspection->query("SET CHARACTER SET utf8");
	}
	
	public function __destruct() {
		$this->monPdoInspection = null;
	}
	
	
	/***********************************/
	/************ GET ******************/
	/***********************************/
	
	public function get_version(){
		$req = "SELECT VALEUR_VERSION FROM VERSION WHERE NUM_VERSION = 1";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
	/**
	* Récupère le numéro, le login et le mot de passe du controleur
	* pour s'authentifier à l'application
	**/
	public function get_Auth($login, $mdp) {
		
		$req = "SELECT * FROM IDENTIFIANT WHERE LOGIN = :login AND MDP = :mdp";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'login' => $login,
			'mdp' => $mdp
		));
		
		$ligne = $rs->fetch();
		return $ligne;
	}
    
    /**
	* Regarde qu'il existe au moins un audit
	**/
	public function get_NumAudit() {
		
		$req = "SELECT NUM_AUDIT, LIBELLE_AUDIT FROM AUDIT";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
    
    /**
	* Récupère la liste des types de structures
	**/
	public function get_Type_Structure() {
		
		$req = "SELECT * FROM TYPE_STRUCTURE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère la liste des structures pour un type de structure
	**/
	public function get_Structures($numTypeStructure) {
		
		$req = "SELECT * FROM TYPE_STRUCTURE WHERE NUM_TYPE_STRUCTURE = :num_type_structure";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'num_type_structure' => $numTypeStructure
		));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère toute les structures
	**/
	public function get_Structures_total() {
		
		$req = "SELECT NUM_STRUCTURE, NOM_STRUCTURE FROM STRUCTURE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		
		while($row = $rs->fetch(PDO::FETCH_OBJ)) {
			$num = $row->NUM_STRUCTURE;
			$nom = $row->NOM_STRUCTURE;
			$liste[] = $nom;
			
		}
		
		return $liste;
	}
	
	/**
	* Autocomplétion nom structure
	* @param : $input = le champ de saisie
	* 		   $numTypeStructure = numero type structure
	**/
	public function autocompletion_Nom_Structure($input, $numTypeStructure){
	
		$req = "SELECT NUM_STRUCTURE, NOM_STRUCTURE FROM STRUCTURE WHERE NUM_TYPE_STRUCTURE = :num_type_structure";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'num_type_structure' => $numTypeStructure
		));
		
		while($row = $rs->fetch(PDO::FETCH_OBJ)) {
			$num = $row->NUM_STRUCTURE;
			$nom = $row->NOM_STRUCTURE;
			$liste[] = $nom;
			
		}
		if(isset($liste)){
			return $liste;
		}else{
			return "";
		}
		
	
	}

	
	/**
	* Récupère le numéro de structure grâce à son nom
	* @param : $nomStructure = nom de la structure
	**/
	public function get_Numero_Structure($nomStructure) {
		$req = "SELECT NUM_STRUCTURE FROM STRUCTURE WHERE NOM_STRUCTURE LIKE :nom_structure";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'nom_structure' => $nomStructure
		));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Compare la structure saisie aux structures existantes
	**/
	public function get_Nom_Structure($nomStructure) {
		$req = "SELECT NOM_STRUCTURE FROM STRUCTURE WHERE NOM_STRUCTURE LIKE :nom_structure";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'nom_structure' => $nomStructure
		));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	
	/**
	* Récupère l'adresse de la structure à partir du numéro
	**/
	public function get_Adresse_Structure($numStructure) {
		$req = "SELECT * FROM STRUCTURE WHERE NUM_STRUCTURE = :num_structure";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'num_structure' => $numStructure
		));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère l'adresse de la structure à partir du numéro
	**/
	public function get_Adresse_StructureParNom($nomStructure) {
		$req = "SELECT * FROM STRUCTURE WHERE NOM_STRUCTURE = :nom_structure";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'nom_structure' => $nomStructure
		));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère les infos du controleur
	**/
	public function get_Controleur() {
		
		$req = "SELECT * FROM CONTROLEUR";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	public function get_Controleur_by_NumControleur($numControleur){
		$req = "SELECT * FROM CONTROLEUR WHERE NUM_CONTROLEUR=:numControleur";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numControleur' => $numControleur
		));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	public function enregistrer_Controleur($nom, $prenom, $fonction, $affectation, $centre, $adresse, $telFixe, $telPortable, $fax, $email){
		$req = "INSERT INTO CONTROLEUR (NOM_CONTROLEUR, PRENOM_CONTROLEUR, FONCTION_CONTROLEUR, AFFECTATION_CONTROLEUR, CENTRE_CONTROLEUR, ADRESSE_CONTROLEUR, TEL_FIXE_CONTROLEUR, TEL_MOBILE_CONTROLEUR, FAX_CONTROLEUR, EMAIL_CONTROLEUR) VALUES (?,?,?,?,?,?,?,?,?,?) ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($nom, $prenom, $fonction, $affectation, $centre, $adresse, $telFixe, $telPortable, $fax, $email));
	}
	
    
    /************************************** ORGANISATIONNEL *******************************/
    
    /**
	* Récupère le numéro d'audit à une date donnée
	**/
	public function get_Num_Audit() {
		$req = "SELECT MAX(NUM_AUDIT) FROM AUDIT";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère les numéros des n derniers enregistrements insérés dans la table participants
	**/
	public function get_Last_Enreg_Participants($nbEnregistrements) {
		$req = "SELECT NUM_PARTICIPANT FROM participant ORDER BY NUM_PARTICIPANT DESC LIMIT " . $nbEnregistrements;
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère le dernier numero de structure
	**/
	public function get_Max_Num_Structure() {
		$req = "SELECT MAX(NUM_STRUCTURE) AS maxi FROM structure";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
    
	/**
	* Récupère tous les thèmes à partir du numéro de partie
	**/
	public function get_Theme_Partie($codepartie) {
		
		$req = "SELECT NUM_THEME, NOM_THEME, PICTOS FROM THEME WHERE CODE_PARTIE = :codepartie";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'codepartie' => $codepartie
		));
		$ligne = $rs->fetchAll();
		return $ligne;
    
	}
	
    /**
	* Récupère tous les sous-thèmes à partir du numéro de thème
	**/
	public function get_Sous_Theme_Num($numtheme) {
		
		$req = "SELECT DISTINCT ST.NUM_SOUS_THEME, LIBELLE_SOUS_THEME, ST.PICTOS FROM SOUS_THEME ST INNER JOIN CRITERE C ON ST.NUM_SOUS_THEME = C.NUM_SOUS_THEME WHERE NUM_THEME = :numtheme";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numtheme' => $numtheme
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère tous les critères à partir du numéro de thème et du sous-thème
	**/
	public function get_Critere_Theme($numtheme, $numsoustheme) {
		
		$req = "SELECT NUM_CRITERE, LIBELLE_CRITERE, PICTOS FROM CRITERE WHERE NUM_THEME = :numtheme AND NUM_SOUS_THEME = :numsoustheme";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numtheme' => $numtheme,
            'numsoustheme' => $numsoustheme
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère tous les critères à partir du numéro de thème
	**/
	public function get_Critere_NTheme($numtheme) {
		
		$req = "SELECT NUM_CRITERE, LIBELLE_CRITERE, PICTOS FROM CRITERE WHERE NUM_THEME = :numtheme ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numtheme' => $numtheme
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    
    /**
	* Récupère le numéro du dernier thème créé
	**/
	public function get_Theme_cree() {
		
		$req = "SELECT MAX(NUM_THEME) FROM THEME";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
		
	}
    
    /**
	* Récupère le numéro du dernier sous-thème créé
	**/
	public function get_Sous_Theme_cree() {
		
		$req = "SELECT MAX(NUM_SOUS_THEME) FROM SOUS_THEME";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
		
	}
    
    /**
	* Récupère le numéro du dernier critère créé
	**/
	public function get_Critere_cree() {
		
		$req = "SELECT MAX(NUM_CRITERE) FROM CRITERE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
		
	}
    
    /**
	* Récupère le numéro du dernier résumé d'article créé
	**/
	public function get_Article_cree() {
		
		$req = "SELECT MAX(NUM_RESUME_ARTICLE) FROM RESUME_ARTICLE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
		
	}
    
    /**
	* Récupère les numéros des sous-thèmes d'un theme
	**/
	public function get_Sous_Theme_T($numtheme) {
		
		$req = "SELECT DISTINCT NUM_SOUS_THEME FROM CRITERE WHERE NUM_THEME = :numtheme";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numtheme' => $numtheme
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère les numéros des critères d'un theme
	**/
	public function get_Critere_T($numtheme) {
		
		$req = "SELECT NUM_CRITERE FROM CRITERE WHERE NUM_THEME = :numtheme";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numtheme' => $numtheme
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère les numéros de résumé d'article d'une liste de critère
	**/
	public function get_ResArticle_LCR($listeCR) {
		
        $tabRAR = array();
        foreach ($listeCR as $lc){
            $numcritere = $lc['NUM_CRITERE'];
            $req = "SELECT NUM_RESUME_ARTICLE FROM CRITERE WHERE NUM_CRITERE = :numcritere";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numcritere' => $numcritere
            ));
            $ligne = $rs->fetchAll();
            for($i = 0;$i < count($ligne);$i++){
                array_push($tabRAR, $ligne[$i]);
            }
        }
		return $tabRAR;
		
	}
    
    /**
	* Récupère les numéros d'observation d'une liste de critère
	**/
	public function get_Observation_LCR($listeCR) {
		
        $tabOBS = array();
        foreach ($listeCR as $lc){
            $numcritere = $lc['NUM_CRITERE'];
            $req = "SELECT NUM_OBSERVATION FROM OBSERVATION WHERE NUM_CRITERE = :numcritere";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numcritere' => $numcritere
            ));
            $ligne = $rs->fetchAll();
            for($i = 0;$i < count($ligne);$i++){
                array_push($tabOBS, $ligne[$i]);
            }
        }
		return $tabOBS;
		
	}
    
    /**
	* Récupère les numéros d'observation d'une liste de critère
	**/
	public function get_Preconisation_LCR($listeCR) {
		
        $tabPRE = array();
        foreach ($listeCR as $lc){
            $numcritere = $lc['NUM_CRITERE'];
            $req = "SELECT NUM_PRECONISATION FROM PRECONISATION WHERE NUM_CRITERE = :numcritere";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numcritere' => $numcritere
            ));
            $ligne = $rs->fetchAll();
            for($i = 0;$i < count($ligne);$i++){
                array_push($tabPRE, $ligne[$i]);
            }
        }
		return $tabPRE;
		
	}
    
    /**
	* Récupère les numéros des images d'une liste de critère
	**/
	public function get_Image_LCR($listeCR) {
		
        $tabIMG = array();
        foreach ($listeCR as $lc){
            $numcritere = $lc['NUM_CRITERE'];
            $req = "SELECT NUM_IMAGE_CRITERE FROM IMAGE_CRITERE WHERE NUM_CRITERE = :numcritere";
            $rs = $this->monPdoInspection->prepare($req);
            $rs->execute(array(
                'numcritere' => $numcritere
            ));
            $ligne = $rs->fetchAll();
            for($i = 0;$i < count($ligne);$i++){
                array_push($tabIMG, $ligne[$i]);
            }
        }
		
		return $tabIMG;
		
	}
	
	/**
	* Récupère le numéro de résumé d'article d'un critère
	**/
	public function get_ResArticle_OCR($numcritere) {
		
		$req = "SELECT NUM_RESUME_ARTICLE FROM CRITERE WHERE NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
		$rs -> execute(array(
			'numcritere' => $numcritere
		));
		$ligne = $rs->fetch();
		return $ligne;
		
	}
    
    /**
	* Récupère les numéros d'observation d'une liste de critère
	**/
	public function get_Observation_OCR($numcritere) {
		
		$req = "SELECT NUM_OBSERVATION FROM OBSERVATION WHERE NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
		$rs -> execute(array(
			'numcritere' => $numcritere
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère les numéros d'observation d'une liste de critère
	**/
	public function get_Preconisation_OCR($numcritere) {

		$req = "SELECT NUM_PRECONISATION FROM PRECONISATION WHERE NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
		$rs -> execute(array(
			'numcritere' => $numcritere
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère les numéros des images d'une liste de critère
	**/
	public function get_Image_OCR($numcritere) {
		
		$req = "SELECT NUM_IMAGE_CRITERE FROM IMAGE_CRITERE WHERE NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcritere' => $numcritere
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère les numéros des critères d'un sous-theme
	**/
	public function get_Critere_ST($numsoustheme) {
		
		$req = "SELECT NUM_CRITERE FROM CRITERE WHERE NUM_SOUS_THEME = :numsoustheme";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numsoustheme' => $numsoustheme
		));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
    
    /**
	* Récupère toutes les observations à partir du numéro de critère et de l'audit
	**/
	public function get_Observation_Critere($numcritere,$num) {
		
		$req = "SELECT NUM_OBSERVATION, LIBELLE_OBSERVATION, CODE_COULEUR_OBSERVATION FROM OBSERVATION WHERE NUM_CRITERE = :numcritere AND (code_obs= :numAudit OR code_obs=0 OR code_obs IS NULL) ORDER BY CODE_COULEUR_OBSERVATION";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcritere' => $numcritere,
			'numAudit' => $num
		));
		$ligne = $rs->fetchAll();
		return $ligne;
    
	}
	
	/**
	* Récupère toutes les observations à partir du numéro de critère
	**/
	public function get_Observation_CritereModif($numcritere) {
		
		$req = "SELECT NUM_OBSERVATION, LIBELLE_OBSERVATION, CODE_COULEUR_OBSERVATION FROM OBSERVATION WHERE NUM_CRITERE = :numcritere ORDER BY CODE_COULEUR_OBSERVATION";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcritere' => $numcritere
		));
		$ligne = $rs->fetchAll();
		return $ligne;
    
	}
    
    /**
	* Récupère le numéro du resumé d'article à partir du numéro de critère
	**/
	public function get_ResArticle_Critere($numcritere) {
		
		$req = "SELECT R.NUM_RESUME_ARTICLE, DESCRIPTION_RESUME_ARTICLE, LIBELLE_CRITERE, YEAR(DATE_ARTICLE) AS Annee, MONTH(DATE_ARTICLE) AS Mois, DAY(DATE_ARTICLE) AS Jour FROM RESUME_ARTICLE R INNER JOIN CRITERE C ON R.NUM_RESUME_ARTICLE = C.NUM_RESUME_ARTICLE WHERE C.NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcritere' => $numcritere
		));
		$ligne = $rs->fetch();
		return $ligne;
    
	}
    
    /**
	* Récupère les codes couleurs des observations
	**/
	public function get_Observation_CDC($numobs) {
		
		$req = "SELECT LIBELLE_OBSERVATION, CODE_COULEUR_OBSERVATION FROM OBSERVATION WHERE NUM_OBSERVATION = :numobs";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numobs' => $numobs
		));
		$ligne = $rs->fetch();
		return $ligne;
		
	}
    
    /**
	* Récupère toutes les Préconisations à partir du numéro de critère et d'audit
	**/
	public function get_Preconisation_Critere($numcritere,$num) {
		
		$req = "SELECT NUM_PRECONISATION, LIBELLE_PRECONISATION, code_Preco FROM PRECONISATION WHERE NUM_CRITERE = :numcritere AND (code_Preco=:numAudit OR code_Preco=0 OR code_Preco IS NULL)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcritere' => $numcritere,
			'numAudit' =>$num
		));
		$ligne = $rs->fetchAll();
		return $ligne;
    
	}
	
	/**
	* Récupère toutes les Préconisations à partir du numéro de critère
	**/
	public function get_Preconisation_CritereMaj($numcritere) {
		
		$req = "SELECT NUM_PRECONISATION, LIBELLE_PRECONISATION FROM PRECONISATION WHERE NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcritere' => $numcritere
		));
		$ligne = $rs->fetchAll();
		return $ligne;
    
	}
    
    /**
	* Récupère tous les numéros de critère à partir du numéro de l'audit
	**/
	public function get_Critere_Audit($numaudit) {
		
		$req = "SELECT NUM_CRITERE FROM CONTROLE_CRITERE WHERE NUM_AUDIT = :numaudit";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numaudit' => $numaudit
		));
		$ligne = $rs->fetchAll();
		return $ligne;
    
	}
    
    /**
	* Récupère les critères à partir d'une liste de critère effectué
	**/
	public function get_Critere_LCRE($ListeCRE) {
		
        $tabCRE = array();
        foreach ($ListeCRE as $lcre){
            $numcritere = $lcre['NUM_CRITERE'];
            $req = "SELECT NUM_CRITERE, NUM_SOUS_THEME FROM CRITERE WHERE NUM_CRITERE = :numcritere";
            $rs = $this->monPdoInspection->prepare($req);
            $rs->execute(array(
                'numcritere' => $numcritere
            ));
            $ligne = $rs->fetch();
            array_push($tabCRE, $ligne);
        }
		return $tabCRE;
		
	}
    
    /**
	* Récupère les critères à partir d'une liste de critère et de sous-thème
	**/
	public function get_Critere_LEFF($ListeEFF, $ListeST) {
		
        $tabEFF = array();
        for($i = 0;$i < count($ListeST);$i++){
            $numsoustheme = $ListeST[$i]['NUM_SOUS_THEME'];
            $tab = array();
            for($j = 0;$j < count($ListeEFF);$j++){
                if($numsoustheme == $ListeEFF[$j]['NUM_SOUS_THEME']){
                    $numst = $numsoustheme;
                    $numcr = $ListeEFF[$j]['NUM_CRITERE'];
                    $req = "SELECT NUM_CRITERE, NUM_SOUS_THEME FROM CRITERE WHERE NUM_SOUS_THEME = :numst AND NUM_CRITERE = :numcr";
                    $rs = $this->monPdoInspection->prepare($req);
                    $rs->execute(array(
                        'numst' => $numst,
                        'numcr' => $numcr
                    ));
                    $ligne = $rs->fetch();
                    array_push($tab, $ligne);  
                }  
            }
            array_push($tabEFF, $tab);
        }
		return $tabEFF;
	}
    
    /**
	* Récupère les critères à partir d'une liste de sous-thème
	**/
	public function get_Critere_LST($ListeST) {
		
        $tabCRST = array();
        foreach ($ListeST as $lst){
            $numst = $lst['NUM_SOUS_THEME'];
            $req = "SELECT NUM_CRITERE, NUM_SOUS_THEME FROM CRITERE WHERE NUM_SOUS_THEME = :numst ORDER BY NUM_SOUS_THEME";
            $rs = $this->monPdoInspection->prepare($req);
            $rs->execute(array(
                'numst' => $numst
            ));
            $ligne = $rs->fetchAll();
            $tab = array();
            for($i = 0;$i < count($ligne);$i++){
                array_push($tab, $ligne[$i]);
            }
            array_push($tabCRST, $tab);
        }
		return $tabCRST;
		
	}
    
    /**
	* Récupère les critères à partir d'une liste de critère effectué
	**/
	public function get_Critere_LCRET($ListeCRE) {
		
        $tabCRE = array();
        foreach ($ListeCRE as $lcre){
            $numcritere = $lcre['NUM_CRITERE'];
            $req = "SELECT NUM_CRITERE, NUM_THEME FROM CRITERE WHERE NUM_CRITERE = :numcritere";
            $rs = $this->monPdoInspection->prepare($req);
            $rs->execute(array(
                'numcritere' => $numcritere
            ));
            $ligne = $rs->fetch();
            array_push($tabCRE, $ligne);
        }
		return $tabCRE;
		
    }
    
    /**
	* Récupère les critères à partir d'une liste de critère et de thème
	**/
	public function get_Critere_LTF($ListeLTF, $ListeT) {
		
        $tabLTF = array();
        for($i = 0;$i < count($ListeT);$i++){
            $numtheme = $ListeT[$i]['NUM_THEME'];
            $tab = array();
            for($j = 0;$j < count($ListeLTF);$j++){
                if($numtheme == $ListeLTF[$j]['NUM_THEME']){
                    $numt = $numtheme;
                    $numcr = $ListeLTF[$j]['NUM_CRITERE'];
                    $req = "SELECT NUM_CRITERE, NUM_THEME FROM CRITERE WHERE NUM_THEME = :numt AND NUM_CRITERE = :numcr";
                    $rs = $this->monPdoInspection->prepare($req);
                    $rs->execute(array(
                        'numt' => $numt,
                        'numcr' => $numcr
                    ));
                    $ligne = $rs->fetch();
                    array_push($tab, $ligne);  
                }  
            }
            array_push($tabLTF, $tab);
        }
		return $tabLTF;
	}
    
    /**
	* Récupère les critères à partir d'une liste de thème
	**/
	public function get_Critere_LT($ListeT) {
		
        $tabCRT = array();
        foreach ($ListeT as $lt){
            $numt = $lt['NUM_THEME'];
            $req = "SELECT NUM_CRITERE, NUM_THEME FROM CRITERE WHERE NUM_THEME = :numt ORDER BY NUM_CRITERE";
            $rs = $this->monPdoInspection->prepare($req);
            $rs->execute(array(
                'numt' => $numt
            ));
            $ligne = $rs->fetchAll();
            $tab = array();
            for($i = 0;$i < count($ligne);$i++){
                array_push($tab, $ligne[$i]);
            }
            array_push($tabCRT, $tab);
        }
		return $tabCRT;
		
	}
    
    /**
	* Récupère les numéros, noms et dates des audits
	**/
	public function get_Audit() {
		$req = "SELECT NUM_AUDIT, NUM_STRUCTURE ,DATE_AUDIT, LIBELLE_AUDIT FROM AUDIT";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère toutes les dates pour un audit donné 
	**/
	public function get_Dates_Audit($numAudit) {
		$req = "SELECT DATE_AUDIT, DATE_AUDIT_2, DATE_AUDIT_3, DATE_AUDIT_4, DATE_AUDIT_5 FROM AUDIT WHERE NUM_AUDIT = :num_audit";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'num_audit' =>$numAudit
		));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère le nombre de critères contrôlés dans controle critere 
	* par rapport au numéro du sous_theme
	**/
	public function get_Nb_Criteres_Controle_Sous_Theme($numSousTheme) {
		$req = "SELECT COUNT(co.NUM_CRITERE) AS nb_critere FROM CRITERE c INNER JOIN CONTROLE_CRITERE co ON c.NUM_CRITERE = co.NUM_CRITERE WHERE NUM_SOUS_THEME = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numSousTheme));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	
	/** recupere le nombre de critere par theme
	
	**/
	public function get_Nb_Critere_Theme($numTheme){
		$req = "SELECT COUNT(NUM_CRITERE) AS NBCRITERE FROM CRITERE WHERE NUM_THEME=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numTheme));
		$ligne = $rs->fetch();
		return $ligne;
	}
    
    /*************************************** SUR SITE ***********************************/
    
    /**
	* Récupère tous les poles
	**/
	public function get_Poles() {
		$req = "SELECT CODE_POLE, LIBELLE_POLE,PICTOS FROM POLE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère tous les batiments d'un pole
	**/
	public function get_Batiments_Pole($numPole, $num) {
		$req = "SELECT NUM_BATIMENT, CODE_POLE, NOM_BATIMENT, PICTOS FROM BATIMENT WHERE CODE_POLE = ? and (CODE_BATIMENT=? OR CODE_BATIMENT=0 OR CODE_BATIMENT IS NULL)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numPole, $num));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère tous les groupes lieu
	**/
	public function get_Groupe_Lieu() {
		$req = "SELECT NUM_GROUPE_LIEU, LIBELLE_GROUPE_LIEU, PICTOS FROM GROUPE_LIEU";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère tous les lieux pour un groupe lieu 
	**/
	public function get_Lieux($numGroupeLieu, $num) {
		$req = "SELECT NUM_LIEU, NOM_LIEU, PICTOS FROM LIEU WHERE NUM_GROUPE_LIEU = ? AND (code_lieu=? OR code_Lieu=0 OR code_Lieu IS NULL)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numGroupeLieu, $num));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère tous les numéros de batiments pour un pole
	**/
	public function get_Num_Bat_Pole($numPole) {
		$req = "SELECT DISTINCT NUM_BATIMENT FROM BATIMENT WHERE CODE_POLE = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numPole));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère le dernier numéro de pole inséré
	**/
	public function get_Last_Num_Pole() {
		$req = "SELECT MAX(CODE_POLE) FROM POLE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	
	/**
	* Récupère le dernier numéro de groupe de lieu inséré
	**/
	public function get_Last_Num_GL() {
		$req = "SELECT MAX(NUM_GROUPE_LIEU) FROM GROUPE_LIEU";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère les numéros de tous les lieux pour un groupe de lieux
	**/
	public function get_Num_Lieu_GL($numGroupeLieu) {
		$req = "SELECT DISTINCT NUM_LIEU FROM LIEU WHERE NUM_GROUPE_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numGroupeLieu));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère tous les numéros de critère à partir du numéro de l'audit
	**/
	public function get_Critere_Audit_SS($numaudit) {
		
		$req = "SELECT * FROM INSCRIRE WHERE NUM_AUDIT = :numaudit";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numaudit' => $numaudit
		));
		$ligne = $rs->fetchAll();
		return $ligne;
    
	}
	
	/********************* RAPPORT ********************/
	
	/**
	* Récupère le type de structure grâce au numéro 
	**/
	public function get_Type_Structure_Nom($numTypeStructure) {
		$req = "SELECT NOM_TYPE_STRUCTURE FROM TYPE_STRUCTURE WHERE NUM_TYPE_STRUCTURE = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numTypeStructure));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	
	/**
	* Récupère les infos d'un controleur à partir du numéro de session du controleur
	**/
	public function get_Infos_Controleur_Num($idControleur) {
		$req = "SELECT NOM_CONTROLEUR, PRENOM_CONTROLEUR, FONCTION_CONTROLEUR, AFFECTATION_CONTROLEUR, CENTRE_CONTROLEUR, ADRESSE_CONTROLEUR, TEL_FIXE_CONTROLEUR, TEL_MOBILE_CONTROLEUR, FAX_CONTROLEUR, EMAIL_CONTROLEUR FROM CONTROLEUR WHERE NUM_CONTROLEUR = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($idControleur));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère les infos des participants à partir du numéro audit
	**/
	public function get_Infos_Participants($numAudit) {
		$req = "SELECT p.NUM_PARTICIPANT, NOM_PARTICIPANT, PRENOM_PARTICIPANT, CODE_CIVILITE_PARTICIPANT, NOM_FONCTION_PARTICIPANT FROM PARTICIPANT p INNER JOIN PARTICIPER pa ON p.NUM_PARTICIPANT = pa.NUM_PARTICIPANT WHERE pa.NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère le nom du thème à partir de son numéro
	**/
	public function get_Nom_Theme($numTheme) {
		$req = "SELECT NOM_THEME FROM THEME WHERE NUM_THEME = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute($numTheme);
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère les numéros de thème et les infos des critère pour un audit dans 
	* CONTROLE CRITERE : organisationnel
	**/
	public function get_Infos_Cr_Th_Co_Org($numAudit) {
		$req = "SELECT c.NUM_CRITERE, LIBELLE_CRITERE, c.NUM_THEME, NOM_THEME, VALEUR_CRITERE, VALEUR_IMPORTANT, PRECONISATION_CRITERE, PHOTO_CRITERE FROM CRITERE c INNER JOIN controle_critere co ON c.NUM_CRITERE = co.NUM_CRITERE INNER JOIN THEME t ON t.NUM_THEME = c.NUM_THEME WHERE NUM_AUDIT = ? ORDER BY NOM_THEME, NUM_SOUS_THEME , LIBELLE_CRITERE ASC";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	
	/**
	* compte le nombre de valeur_important dans inscrire
	* 
	**/
	public function get_nb_valeur_critere_inscrire($numAudit) {
		$req = "SELECT COUNT(i.VALEUR_IMPORTANT) AS nb_valeur FROM INSCRIRE i WHERE i.NUM_AUDIT = ? AND VALEUR_IMPORTANT=1";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* compte le nombre de valeur_important dans controle_critere
	* 
	**/
	public function get_nb_valeur_critere_controle_critere($numAudit) {
		$req = "SELECT COUNT(VALEUR_IMPORTANT) AS nb_valeur FROM CONTROLE_CRITERE WHERE NUM_AUDIT = ? AND VALEUR_IMPORTANT=1";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}

	/**
	* Récupère les numéros de thème et les infos des critère pour un audit dans 
	* INSCRIRE : organisationnel
	**/
	public function get_Infos_Cr_Th_Co_Site($numAudit) {
		$req = "SELECT c.NUM_CRITERE, LIBELLE_CRITERE, c.NUM_THEME, NOM_THEME, VALEUR_CRITERE, VALEUR_IMPORTANT, PRECONISATION_CRITERE, PHOTO_CRITERE, i.NUM_LIEU, NOM_LIEU, NUM_BATIMENT_C, NOM_BATIMENT
		FROM CRITERE c 
		INNER JOIN INSCRIRE i ON c.NUM_CRITERE = i.NUM_CRITERE 
		INNER JOIN THEME t ON t.NUM_THEME = c.NUM_THEME 
		INNER JOIN LIEU l ON l.NUM_LIEU = i.NUM_LIEU
		INNER JOIN BATIMENT b ON i.NUM_BATIMENT_C=b.NUM_BATIMENT 
		WHERE NUM_AUDIT = ? ORDER BY NOM_BATIMENT, NOM_LIEU, NOM_THEME ASC";
		//INNER JOIN SOUS_THEME st ON st.NUM_SOUS_THEME = c.NUM_SOUS_THEME 
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}

	/**
	* Récupère les observations pour un audit COMPRENDRE
	**/
	public function get_Obs_Audit($numAudit) {
		$req = "SELECT c.NUM_OBSERVATION, LIBELLE_OBSERVATION, o.NUM_CRITERE FROM COMPRENDRE c INNER JOIN OBSERVATION o 
		ON o.NUM_OBSERVATION = c.NUM_OBSERVATION WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère les préconisations pour un audit DISPOSER
	**/
	public function get_Preco_Audit($numAudit) {
		$req = "SELECT d.NUM_PRECONISATION, LIBELLE_PRECONISATION, p.NUM_CRITERE FROM DISPOSER d INNER JOIN PRECONISATION p ON p.NUM_PRECONISATION = d.NUM_PRECONISATION WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère la préconisation par son num
	**/
	public function get_Preco_par_num($numpreco) {
		$req = "SELECT NUM_PRECONISATION, LIBELLE_PRECONISATION FROM PRECONISATION WHERE NUM_PRECONISATION = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numpreco));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère l'observation par son num
	**/
	public function get_Observ_par_num($numobserv) {
		$req = "SELECT NUM_OBSERVATION, LIBELLE_OBSERVATION FROM OBSERVATION WHERE NUM_OBSERVATION = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numobserv));
		$ligne = $rs->fetch();
		return $ligne;
	}
    
	
	/**
	* Récupère les images d'un critère à partir d'un critere
	**/
	public function get_Liste_IMGCR($numcr) {
		$req = "SELECT NUM_IMAGE_CRITERE, LIBELLE_IMAGE_CRITERE FROM IMAGE_CRITERE WHERE NUM_CRITERE = :numcr";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcr' => $numcr
		));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère les images d'un critère à partir d'un critere
	**/
	public function get_Liste_IMGCR2($numcr) {
		$req = "SELECT NUM_IMAGE_CRITERE, LIBELLE_IMAGE_CRITERE FROM IMAGE_CRITERE WHERE NUM_CRITERE = :numcr";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numcr' => $numcr
		));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
    
    /**
	* Récupère les observations à partir d'un tableau de numéros
	**/
	public function get_Liste_Obs_Org($numAudit) {
		$req = "SELECT DISTINCT co.NUM_OBSERVATION, LIBELLE_OBSERVATION, CODE_COULEUR_OBSERVATION, cc.NUM_CRITERE, LIBELLE_CRITERE FROM COMPRENDRE co
		INNER JOIN OBSERVATION o ON o.NUM_OBSERVATION = co.NUM_OBSERVATION
		INNER JOIN CRITERE c ON c.NUM_CRITERE = o.NUM_CRITERE
		INNER JOIN CONTROLE_CRITERE cc ON cc.NUM_CRITERE = c.NUM_CRITERE
		WHERE co.NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère les préconisations à partir d'un tableau de numéros
	**/
	public function get_Liste_Preco_Org($numAudit) {
		$req = "SELECT DISTINCT d.NUM_PRECONISATION, LIBELLE_PRECONISATION, c.NUM_CRITERE, LIBELLE_CRITERE FROM DISPOSER d
		INNER JOIN PRECONISATION p ON p.NUM_PRECONISATION = d.NUM_PRECONISATION
		INNER JOIN CRITERE c ON c.NUM_CRITERE = p.NUM_CRITERE
		WHERE d.NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
		//INNER JOIN CONTROLE_CRITERE cc ON cc.NUM_CRITERE = c.NUM_CRITERE
	}
	
	/**
	* Récupère les observations à partir d'un tableau de numéros : site
	**/
	public function get_Liste_Obs_Site($numAudit) {
		$req = "SELECT DISTINCT p.NUM_OBSERVATION, LIBELLE_OBSERVATION, CODE_COULEUR_OBSERVATION, p.NUM_LIEU, p.NUM_CRITERE_C, LIBELLE_CRITERE, p.NUM_BATIMENT_C
		FROM POSSEDER p
		INNER JOIN OBSERVATION o ON o.NUM_OBSERVATION = p.NUM_OBSERVATION
		INNER JOIN CRITERE c ON c.NUM_CRITERE = o.NUM_CRITERE
		WHERE p.NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère les préconisations à partir d'un tableau de numéros : site
	**/
	public function get_Liste_Preco_Site($numAudit) {
		$req = "SELECT DISTINCT co.NUM_PRECONISATION, LIBELLE_PRECONISATION, co.NUM_CRITERE_C, co.NUM_BATIMENT_C
		FROM CONTENIR co
		INNER JOIN PRECONISATION p ON p.NUM_PRECONISATION = co.NUM_PRECONISATION
		WHERE co.NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
		
	}
	
    
	/***** CHOIX AUDIT *****/
	
	/**
	* Récupère le numéro et nom de la structure + numéro/nom type structure pour un audit 
	**/
	public function get_Infos_Structure_Choix_Audit($numAudit) {
		$req = "SELECT s.NUM_STRUCTURE, NOM_STRUCTURE, ADRESSE_STRUCTURE, VILLE_STRUCTURE, CP_STRUCTURE, TELEPHONE_STRUCTURE, EMAIL_STRUCTURE, ts.NUM_TYPE_STRUCTURE, NOM_TYPE_STRUCTURE, a.LIBELLE_AUDIT FROM STRUCTURE s INNER JOIN TYPE_STRUCTURE ts ON ts.NUM_TYPE_STRUCTURE = s.NUM_TYPE_STRUCTURE INNER JOIN AUDIT a ON a.NUM_STRUCTURE = s.NUM_STRUCTURE WHERE a.NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	
	/** 
	* Récupère les infos du controleur pour un audit
	**/
    public function get_Infos_Controleur_Audit($numAudit) {
		$req = "SELECT NOM_CONTROLEUR, PRENOM_CONTROLEUR, FONCTION_CONTROLEUR, AFFECTATION_CONTROLEUR, CENTRE_CONTROLEUR, ADRESSE_CONTROLEUR, TEL_FIXE_CONTROLEUR, TEL_MOBILE_CONTROLEUR, FAX_CONTROLEUR, EMAIL_CONTROLEUR FROM CONTROLEUR c INNER JOIN AUDIT a ON c.NUM_CONTROLEUR = a.NUM_CONTROLEUR WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	
	/**
	* Récupère l'article du critere controlé pour un audit : organisationnel
	**/
	public function get_Art_Cr_Co_Org($numAudit) {
		$req = "SELECT cc.NUM_CRITERE, ra.NUM_RESUME_ARTICLE, DESCRIPTION_RESUME_ARTICLE FROM CONTROLE_CRITERE cc INNER JOIN CRITERE c ON c.NUM_CRITERE = cc.NUM_CRITERE INNER JOIN RESUME_ARTICLE ra ON ra.NUM_RESUME_ARTICLE = c.NUM_RESUME_ARTICLE WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère l'article du critere controlé pour un audit : site
	**/
	public function get_Art_Cr_Co_Site($numAudit) {
		$req = "SELECT i.NUM_CRITERE, ra.NUM_RESUME_ARTICLE, DESCRIPTION_RESUME_ARTICLE, NUM_BATIMENT_C, i.NUM_LIEU
		FROM INSCRIRE i 
		INNER JOIN CRITERE c ON c.NUM_CRITERE = i.NUM_CRITERE 
		INNER JOIN RESUME_ARTICLE ra ON ra.NUM_RESUME_ARTICLE = c.NUM_RESUME_ARTICLE 
		WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	
	
	/**
	* Rrécupère les images critère des critères pour un audit
	**/
	public function get_Img_Cr_Co($numAudit) {
		$req = "SELECT cc.NUM_CRITERE, NUM_IMAGE_CRITERE, LIBELLE_IMAGE_CRITERE FROM CONTROLE_CRITERE cc
		INNER JOIN IMAGE_CRITERE ic ON ic.NUM_CRITERE = cc.NUM_CRITERE
		WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Rrécupère les images critère des critères pour un audit
	**/
	public function get_Img_Cr($numAudit) {
		$req = "SELECT i.NUM_CRITERE, NUM_IMAGE_CRITERE, LIBELLE_IMAGE_CRITERE, i.NUM_BATIMENT_C, i.NUM_LIEU, i.NUM_CRITERE
		FROM INSCRIRE i
		INNER JOIN IMAGE_CRITERE ic ON ic.NUM_CRITERE = i.NUM_CRITERE
		WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Récupère les sous-themes de chaque critere
	**/
	public function get_ST_Cr() {
		$req = "SELECT NUM_CRITERE, c.NUM_THEME, c.NUM_SOUS_THEME, LIBELLE_SOUS_THEME
		FROM CRITERE c INNER JOIN THEME t ON t.NUM_THEME = c.NUM_THEME
		INNER JOIN SOUS_THEME st ON st.NUM_SOUS_THEME = c.NUM_SOUS_THEME";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	
	/**
	* Récupère les batiments controlés site
	**/
	public function get_Batiments_Controles($numAudit) {
		$req = "SELECT c.NUM_BATIMENT, NOM_BATIMENT FROM CONTROLER c 
		INNER JOIN BATIMENT b ON b.NUM_BATIMENT = c.NUM_BATIMENT
		WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
    
	
	
    
    
	/***********************************/
	/************ INSERT ***************/
	/***********************************/
	
    
    /**
	* Insertion des participants à un audit
	* @param $data : tableau des participants
	**/
	public function insert_Participants($data) {
		 
		$req="INSERT INTO PARTICIPANT (NUM_STRUCTURE, NOM_PARTICIPANT, PRENOM_PARTICIPANT, CODE_CIVILITE_PARTICIPANT, NOM_FONCTION_PARTICIPANT) VALUES (?,?,?,?,?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute($data);
	}
	
	
	/**
	* Insertion des données d'un audit
	**/
	public function insert_Audit($numControleur, $numStructure, $dateAudit, $libelleAudit, $dateControleAudit) {
		$req = "INSERT INTO AUDIT (NUM_CONTROLEUR, NUM_STRUCTURE, DATE_AUDIT, LIBELLE_AUDIT, DATE_CONTROLE_AUDIT) VALUES (?,?,?,?,?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numControleur, $numStructure, $dateAudit, $libelleAudit, $dateControleAudit));
	}
	
	/**
	* Insertion dans la table participer
	* @param : numéro audit et numéro(s) participant(s)
	**/
	public function insert_Participer($numParticipant, $numAudit) {
		$req = "INSERT INTO PARTICIPER (NUM_PARTICIPANT, NUM_AUDIT) VALUES (:numParticipant, :numAudit)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numParticipant' => $numParticipant,
			'numAudit' => $numAudit
		));
	}
    
    /**
	* Ajout d'un nouveau thème
	**/
	public function add_Theme($nomtheme, $codepartie) {
		
		$req = "INSERT INTO THEME (NOM_THEME, CODE_PARTIE) VALUES(:nomtheme, :codepartie)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'nomtheme' => $nomtheme,
            'codepartie' => $codepartie
        ));
		
	}
	
	 /**
	* Ajout d'une structure
	**/
	public function add_structure($num,$numtype, $nom_Structure, $adresse,$ville,$cp,$tel,$email) {
		
		$req = "INSERT INTO `structure` (`NUM_STRUCTURE`, `NUM_TYPE_STRUCTURE`, `NOM_STRUCTURE`, `ADRESSE_STRUCTURE`, `VILLE_STRUCTURE`, `CP_STRUCTURE`, `TELEPHONE_STRUCTURE`, `EMAIL_STRUCTURE`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num,$numtype, $nom_Structure, $adresse,$ville,$cp,$tel,$email
        ));
		
	}
    
    /**
	* Ajout d'un nouveau sous-thème defaut à partir d'un thème créé
	**/
	public function add_Sous_Theme_Defaut() {
		
		$req = "INSERT INTO SOUS_THEME (LIBELLE_SOUS_THEME) VALUES(:libsoustheme)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libsoustheme' => 'defaut'
        ));
		
	}
    
    /**
	* Ajout d'un critère defaut par rapport au theme et sous-theme créés
	**/
	public function add_Critere_Defaut($numtheme, $numsoustheme) {
		
		$req = "INSERT INTO CRITERE (NUM_THEME, NUM_SOUS_THEME, LIBELLE_CRITERE) VALUES(:numtheme, :numsoustheme, :libcritere)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numtheme' => $numtheme,
            'numsoustheme' => $numsoustheme,
            'libcritere' => 'defaut'
        ));
		
	}
    
    /**
	* Ajout d'un critère defaut par rapport au theme créé
	**/
	public function add_Critere_DefautN($numtheme) {
		
		$req = "INSERT INTO CRITERE (NUM_THEME, NUM_SOUS_THEME, LIBELLE_CRITERE) VALUES(:numtheme, :numsoustheme, :libcritere)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numtheme' => $numtheme,
            'numsoustheme' => null,
            'libcritere' => 'defaut'
        ));
		
	}
    
    /**
	* Ajout d'une observation defaut par rapport au critère créé
	**/
	public function add_Observation_Defaut($numcritere) {
		
		$req = "INSERT INTO OBSERVATION (NUM_CRITERE, LIBELLE_OBSERVATION, CODE_COULEUR_OBSERVATION) VALUES(:numcritere, :libobs, :cdcobs)";
		$rs = $this->monPdoInspection->prepare($req);
        $rs2 = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numcritere' => $numcritere,
            'libobs' => 'defautV',
            'cdcobs' => 1
        ));   
        $rs2->execute(array(
            'numcritere' => $numcritere,
            'libobs' => 'defautR',
            'cdcobs' => 2
            
        ));
		
	}
    
    /**
	* Ajout d'une préconisation defaut par rapport au critère créé
	**/
	public function add_Preconisation_Defaut($numcritere) {
		
		$req = "INSERT INTO PRECONISATION (NUM_CRITERE, LIBELLE_PRECONISATION) VALUES(:numcritere, :libpreco)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numcritere' => $numcritere,
            'libpreco' => 'defaut',
        ));  
		
	}
    
    /**
	* Ajout d'un résumé d'article defaut 
	**/
	public function add_ResumeArticle_Defaut() {
		
		$req = "INSERT INTO RESUME_ARTICLE (DESCRIPTION_RESUME_ARTICLE) VALUES(:libart)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libart' => 'defaut'
        ));
		
	}
    
    /**
	* Ajout d'un nouveau sous-thème
	**/
	public function add_Sous_Theme($nomsoustheme) {
		
		$req = "INSERT INTO SOUS_THEME (LIBELLE_SOUS_THEME) VALUES(:libsoustheme)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libsoustheme' => $nomsoustheme
        ));
		
	}
    
    /**
	* Ajout d'un nouveau critère
	**/
	public function add_Critere($nomcritere, $numtheme, $numsoustheme) {
		
		$req = "INSERT INTO CRITERE (LIBELLE_CRITERE, NUM_THEME, NUM_SOUS_THEME) VALUES(:libcritere, :numtheme, :numsoustheme)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libcritere' => $nomcritere,
            'numtheme' => $numtheme,
            'numsoustheme' => $numsoustheme
        ));
		
	}
    
    /**
	* Ajout d'une nouvelle observation
	**/
	public function add_Observation($nomobs, $numcritere, $codeobs) {
		
		$req = "INSERT INTO OBSERVATION (LIBELLE_OBSERVATION, NUM_CRITERE, CODE_COULEUR_OBSERVATION) VALUES(:libobs, :numcritere, :codeobs)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libobs' => $nomobs,
            'numcritere' => $numcritere,
            'codeobs' => $codeobs
        ));
		
	}
	
	/**
	* Ajout d'une nouvelle observation manuel
	**/
	public function add_Observation_manu($nomobs, $numcritere, $codeobs, $num) {
		
		$req = "INSERT INTO OBSERVATION (LIBELLE_OBSERVATION, NUM_CRITERE, CODE_COULEUR_OBSERVATION, code_obs) VALUES(:libobs, :numcritere, :codeobs, :codeaudit)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libobs' => $nomobs,
            'numcritere' => $numcritere,
            'codeobs' => $codeobs,
			'codeaudit' => $num
        ));
		
	}
    
    /**
	* Ajout d'une nouvelle preconisation
	**/
	public function add_Preconisation($nompreco, $numcritere) {
		
		$req = "INSERT INTO PRECONISATION (LIBELLE_PRECONISATION, NUM_CRITERE) VALUES(:libpreco, :numcritere)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libpreco' => $nompreco,
            'numcritere' => $numcritere
        ));
		
	}
	
	/**
	* Ajout d'une nouvelle preconisation manuel
	**/
	public function add_Preconisation_manuel($nompreco, $numcritere,$numAudit) {
		
		$req = "INSERT INTO PRECONISATION (LIBELLE_PRECONISATION, NUM_CRITERE, code_Preco) VALUES(:libpreco, :numcritere, :numAudit)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libpreco' => $nompreco,
            'numcritere' => $numcritere,
			'numAudit'=>$numAudit
        ));
		
	}
    
    /**
	* Ajout d'un nouveau controle_critere
	**/
	public function add_Controle_Critere($numcritere, $numaudit, $valeurCR, $valeurIM, $precoCR, $phoCR) {
		$req1 = "DELETE FROM CONTROLE_CRITERE WHERE NUM_CRITERE = :numcritere AND NUM_AUDIT = :numaudit";
		$rs1 = $this->monPdoInspection->prepare($req1);
		$rs1->execute(array(
            'numcritere' => $numcritere,
			'numaudit' => $numaudit
        ));
		$req = "INSERT INTO CONTROLE_CRITERE (NUM_CRITERE, NUM_AUDIT, VALEUR_CRITERE, VALEUR_IMPORTANT, PRECONISATION_CRITERE, PHOTO_CRITERE) VALUES(:numcritere, :numaudit, :valeurCR, :valeurIM, :precoCR, :phoCR)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numcritere' => $numcritere,
            'numaudit' => $numaudit,
            'valeurCR' => $valeurCR,
            'valeurIM' => $valeurIM,
            'precoCR' => $precoCR,
            'phoCR' => $phoCR
        ));
		
	}
    
	
	/**
	*Supression d'un lien entre audit et observation (si on modif un critere existant)
	**/
	public function suppr_Comprendre_Obs($numaudit, $numobs, $numcritere) {
		$req1 = "DELETE FROM COMPRENDRE WHERE NUM_OBSERVATION IN(SELECT NUM_OBSERVATION FROM OBSERVATION WHERE NUM_CRITERE=:numcritere)";
		$rs1 = $this->monPdoInspection->prepare($req1);
		$rs1->execute(array(
            'numcritere' => $numcritere
        ));
	}
	
    /**
	* Ajout d'un lien entre audit et observation
	**/
	public function add_Comprendre_Obs($numaudit, $numobs, $numcritere) {
		$req = "INSERT INTO COMPRENDRE (NUM_AUDIT, NUM_OBSERVATION) VALUES(:numaudit, :numobs)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numaudit' => $numaudit,
            'numobs' => $numobs
        ));
		
	}
    
	/**
	* Suppression d'un lien entre audit et preconisation (dans le cas d'une modif de critere)
	**/
	public function suppr_Disposer_Preco($numaudit, $numpreco, $numcritere) {
		$req1 = "DELETE FROM DISPOSER WHERE NUM_PRECONISATION IN(SELECT NUM_PRECONISATION FROM PRECONISATION WHERE NUM_CRITERE=:numcritere)";
		$rs1 = $this->monPdoInspection->prepare($req1);
		$rs1->execute(array(
            'numcritere' => $numcritere
        ));
	}
	
    /**
	* Ajout d'un lien entre audit et preconisation
	**/
	public function add_Disposer_Preco($numaudit, $numpreco, $numcritere) {
		$req = "INSERT INTO DISPOSER (NUM_AUDIT, NUM_PRECONISATION) VALUES(:numaudit, :numpreco)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numaudit' => $numaudit,
            'numpreco' => $numpreco
        ));
		
	}
	
	/**
	* Ajout d'un nouveau controle critere sur inscrire pour sursite
	**/
	public function add_ControleCR_Inscrire($numaudit, $numpole, $numBatiment, $numgrplieu, $numlieu, $numtheme, $numcritere, $valeurCR, $valeurIM, $precoCR, $phoCR) {
		$req1 = "DELETE FROM INSCRIRE WHERE NUM_AUDIT=:numaudit AND NUM_BATIMENT_C=:numBatiment AND NUM_CRITERE=:numcritere";
		$rs1 = $this->monPdoInspection->prepare($req1);
		$rs1->execute(array(
            'numaudit' => $numaudit,
			'numBatiment'=>$numBatiment,
			'numcritere' => $numcritere
		));
		$req = "INSERT INTO INSCRIRE (NUM_AUDIT, NUM_POLE_C, NUM_BATIMENT_C, NUM_GROUPE_LIEU_C, NUM_LIEU, NUM_THEME_C, NUM_CRITERE, VALEUR_CRITERE, VALEUR_IMPORTANT, PRECONISATION_CRITERE, PHOTO_CRITERE) VALUES(:numaudit, :numpole, :numBatiment, :numgrplieu, :numlieu, :numtheme,  :numcritere, :valeurCR, :valeurIM, :precoCR, :phoCR)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numaudit' => $numaudit,
			'numpole' => $numpole,
			'numBatiment' => $numBatiment,
			'numgrplieu' => $numgrplieu,
			'numlieu' => $numlieu,
			'numtheme' => $numtheme,
            'numcritere' => $numcritere,
            'valeurCR' => $valeurCR,
            'valeurIM' => $valeurIM,
            'precoCR' => $precoCR,
            'phoCR' => $phoCR
        ));
		
	}
    
	/**
	* Supression d'un lien entre audit, lieu et observation (dans le cas de la modif d'un critere)
	**/
	public function suppr_Posseder_Obs($numaudit, $numPole, $numBatiment, $numGrpLieu, $numlieu, $numTheme, $numCritere, $numobs) {
		$req1 = "DELETE FROM POSSEDER WHERE NUM_AUDIT=:numaudit AND NUM_CRITERE_C=:numcritere";
		$rs1 = $this->monPdoInspection->prepare($req1);
		$rs1->execute(array(
            'numaudit' => $numaudit,
			'numcritere' => $numCritere
		));
		$req2 = "DELETE FROM CONTROLE_CRITERE WHERE NUM_CRITERE=:numcritere AND NUM_AUDIT=:numaudit";
		$rs2 = $this->monPdoInspection->prepare($req2);
		$rs2->execute(array(
            'numaudit' => $numaudit,
			'numcritere' => $numCritere
		));
	}
	
    /**
	* Ajout d'un lien entre audit, lieu et observation
	**/
	public function add_Posseder_Obs($numaudit, $numPole, $numBatiment, $numGrpLieu, $numlieu, $numTheme, $numCritere, $numobs) {
		$req = "INSERT INTO POSSEDER (NUM_AUDIT, NUM_POLE_C, NUM_BATIMENT_C, NUM_GROUPE_LIEU_C, NUM_LIEU, NUM_THEME_C, NUM_CRITERE_C, NUM_OBSERVATION) VALUES(:numaudit, :numPole, :numBatiment, :numGrpLieu, :numlieu, :numTheme, :numCritere, :numobs)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numaudit' => $numaudit,
			'numPole' => $numPole,
			'numBatiment' => $numBatiment,
			'numGrpLieu' => $numGrpLieu,
			'numlieu' => $numlieu,
			'numTheme' => $numTheme,
			'numCritere' => $numCritere,
            'numobs' => $numobs
        ));
		
	}
    
	
	/**
	* Suppression d'un lien entre audit, lieu et preconisation (dans le cas de la modif d'un critere)
	**/
	public function suppr_Contenir_Preco($numaudit, $numBatiment, $numlieu, $numcritere, $numpreco) {
		$req1 = "DELETE FROM CONTENIR WHERE NUM_AUDIT=:numaudit AND NUM_CRITERE_C=:numcritere";
		$rs1 = $this->monPdoInspection->prepare($req1);
		$rs1->execute(array(
            'numaudit' => $numaudit,
			'numcritere' => $numcritere
		));
	}
	
    /**
	* Ajout d'un lien entre audit, lieu et preconisation
	**/
	public function add_Contenir_Preco($numaudit, $numBatiment, $numlieu, $numcritere, $numpreco) {
		$req = "INSERT INTO CONTENIR (NUM_AUDIT, NUM_BATIMENT_C, NUM_LIEU, NUM_CRITERE_C, NUM_PRECONISATION) VALUES(:numaudit, :numbatiment, :numlieu, :numcritere, :numpreco)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numaudit' => $numaudit,
			'numbatiment' => $numBatiment,
			'numlieu' => $numlieu,
			'numcritere' => $numcritere,
            'numpreco' => $numpreco
        ));
		
	}
	
	/**
	* Ajout d'un lien entre audit et bâtiment
	**/
	public function add_Controler_Batiment($numbat, $numaudit) {
		
		$req = "INSERT INTO CONTROLER (NUM_BATIMENT, NUM_AUDIT) VALUES(:numbat, :numaudit)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'numbat' => $numbat,
			'numaudit' => $numaudit,
        ));
		
	}
	
	/**
	* Ajout d'une image pour un critere
	**/
	public function add_Image_Critere($critere, $libelle) {
		
		$req = "INSERT INTO IMAGE_CRITERE (NUM_CRITERE, LIBELLE_IMAGE_CRITERE) VALUES(?, ?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($critere,$libelle,
        ));
		
	}
	

    
    /****************** SUR SITE **************************/
    
    /**
	* Ajout d'un pole
	**/
	public function add_Pole($nomPole) {
		$req = "INSERT INTO POLE (LIBELLE_POLE) VALUES(:libpole)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
            'libpole' => $nomPole
        ));
	}
	
	/**
	* Ajout d'un bâtiment par defaut lors de la création d'un pole
	**/
	public function add_Batiment_Defaut($numPole) {
		$req = "INSERT INTO BATIMENT (CODE_POLE, NOM_BATIMENT) VALUES (?,?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numPole, "defaut"));
	}
	
	/**
	* Ajout d'un batiment
	**/
	public function add_Batiment($numPole, $nomBatiment) {
		$req = "INSERT INTO BATIMENT (CODE_POLE, NOM_BATIMENT) VALUES (:numpole,:nombatiment)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numpole' => $numPole,
			'nombatiment' => $nomBatiment
		));
	}
	
	/**
	* Ajout d'un groupe de lieux
	**/
	public function add_GroupeLieu($nomGroupeLieu) {
		$req = "INSERT INTO GROUPE_LIEU (LIBELLE_GROUPE_LIEU) VALUES (?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($nomGroupeLieu));
	}
	
	/**
	* Ajout d'un lieu par défaut au groupe lieu
	**/
	public function add_Lieu_Defaut($numGroupeLieu) {
		$req = "INSERT INTO LIEU (NUM_GROUPE_LIEU, NOM_LIEU) VALUES (?,?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numGroupeLieu, "defaut"));
	}
	
	/**
	* Ajout d'un lieu
	**/
	public function add_Lieu($numGroupeLieu, $nomLieu) {
		$req = "INSERT INTO LIEU (NUM_GROUPE_LIEU, NOM_LIEU) VALUES (?,?)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numGroupeLieu, $nomLieu));
	}
    
    
    
	
	/***********************************/
	/************ UPDATE ***************/
	/***********************************/
	
    
    /**
	* Modifie l'adresse de la structure 
	**/
	
	public function update_Adresse_Structure($numStructure, $adresseStructure, $villeStructure, $cpStructure) {
		
		$req = "UPDATE STRUCTURE SET ADRESSE_STRUCTURE = :adresse, VILLE_STRUCTURE = :ville, CP_STRUCTURE = :code_postal WHERE NUM_STRUCTURE = :numero";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numero' => $numStructure,
			'adresse' => $adresseStructure,
			'ville' => $villeStructure,
			'code_postal' => $cpStructure
		));
	}
	
	public function update_version($version){
		$req = "UPDATE VERSION SET VALEUR_VERSION = :version";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array('version' => $version));
	}
	
	/**
	* Modif de l'image pour un critere
	**/
	public function update_Image_Critere($critere, $libelle) {
		
		$req = "UPDATE IMAGE_CRITERE SET LIBELLE_IMAGE_CRITERE =? WHERE NUM_CRITERE=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($libelle,$critere
        ));
	}
	
	/**
	* supprime l'image pour un critere
	**/
	public function suppr_Image_Critere($critere) {
		
		$req = "DELETE FROM IMAGE_CRITERE WHERE NUM_CRITERE=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($critere
        ));
	}
	
	/**
	* Mise à jour dans la table audit, de la nouvelle date de l'audit
	* @param : numero de l'audit 
	* 		 : numero de la date
	*		 : la date à modifier 
	**/
	public function update_Date_Audit($numAudit, $date, $numDate) {
		$req = "UPDATE AUDIT SET DATE_AUDIT_$numDate = :date WHERE NUM_AUDIT = :num_audit";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'date' => $date,
			'num_audit' => $numAudit
		));
	}
    
    /**
	* Modifier le nom d'un thème
	**/
    public function update_Theme($numtheme, $nomtheme){
		$req = "UPDATE THEME SET NOM_THEME = :nomtheme
        WHERE NUM_THEME = :numtheme";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numtheme'=>$numtheme,
            'nomtheme'=>$nomtheme
        ));
        
	}
    
    /**
	* Modifier le nom d'un sous-thème
	**/
    public function update_Sous_Theme($numsoustheme, $nomsoustheme){
		$req = "UPDATE SOUS_THEME SET LIBELLE_SOUS_THEME = :libsoustheme
        WHERE NUM_SOUS_THEME = :numsoustheme";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numsoustheme'=>$numsoustheme,
            'libsoustheme'=>$nomsoustheme
        ));
        
	}
    
    /**
	* Modifier le nom d'un critère
	**/
    public function update_Critere($numcritere, $nomcritere){
		$req = "UPDATE CRITERE SET LIBELLE_CRITERE = :nomcritere
        WHERE NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numcritere'=>$numcritere,
            'nomcritere'=>$nomcritere
        ));
        
	}
    
    /**
	* Modifier le nom d'une observaton
	**/
    public function update_Observation($numobs, $nomobs){
		$req = "UPDATE OBSERVATION SET LIBELLE_OBSERVATION = :nomobs
        WHERE NUM_OBSERVATION = :numobs";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numobs'=>$numobs,
            'nomobs'=>$nomobs
        ));
        
	}
    
    /**
	* Modifier le contenu d'un résumé d'article
	**/
    public function update_Article($numart, $libart){
		$req = "UPDATE RESUME_ARTICLE SET DESCRIPTION_RESUME_ARTICLE = :libart, DATE_ARTICLE = DATE( NOW() ) 
        WHERE NUM_RESUME_ARTICLE = :numart";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numart'=>$numart,
            'libart'=>$libart
        ));
        
	}

    
    /**
	* Modifier le nom d'une préconisaton
	**/
    public function update_Preconisation($numpreco, $nompreco){
		$req = "UPDATE PRECONISATION SET LIBELLE_PRECONISATION = :nompreco
        WHERE NUM_PRECONISATION = :numpreco";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numpreco'=>$numpreco,
            'nompreco'=>$nompreco
        ));
        
	}
    
    /****************** SUR SITE ***************************/
    
    /**
	* Modification d'un pole
	**/
	public function update_Pole($numPole, $nomPole) {
		$req = "UPDATE POLE SET LIBELLE_POLE = :libpole
        WHERE CODE_POLE = :numpole";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array(
            'numpole'=>$numPole,
            'libpole'=>$nomPole
        ));
	}
	
	/**
	* Modification d'un bâtiment
	**/
	public function update_Batiment($numBatiment, $nomBatiment) {
		$req = "UPDATE BATIMENT SET NOM_BATIMENT = ?
        WHERE NUM_BATIMENT = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($nomBatiment, $numBatiment));
	}
	
	/**
	* Modification d'un groupe de lieu
	**/
	public function update_GroupeLieu($numGroupeLieu, $nomGroupeLieu) {
		$req = "UPDATE GROUPE_LIEU SET LIBELLE_GROUPE_LIEU = ?
        WHERE NUM_GROUPE_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($nomGroupeLieu, $numGroupeLieu));
	}
	
	/**
	* Modification d'un lieu
	**/
	public function update_Lieu($numLieu, $nomLieu) {
		$req = "UPDATE LIEU SET NOM_LIEU = ?
        WHERE NUM_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($nomLieu, $numLieu));
	}
    
    
    
    
	/***********************************/
	/************ DELETE ***************/
	/***********************************/
	
    
	/**
	* Supprimer tous les critères à partir d'un numéro de thème
	**/
	public function delete_Critere_Theme($numtheme){
        $req = "DELETE FROM CRITERE WHERE NUM_THEME = :numtheme";
        $rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numtheme' => $numtheme
        ));
    }
	
	/**
	* Supprimer une structure
	**/
	public function delete_Structure($num){
        $req = "DELETE FROM Structure WHERE NUM_STRUCTURE = :num";
        $rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'num' => $num
        ));
    }
    
    /**
	* Supprimer un thème
	**/
    public function delete_Theme($numtheme){
		$req = "DELETE FROM THEME WHERE NUM_THEME = :numtheme";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numtheme' => $numtheme
        ));
        
	}
    
    /**
	* Supprimer tous les sous-thèmes à partir d'une liste de numéro de sous-thème
	**/
	public function delete_Sous_Theme_Liste($listeST){
        foreach ($listeST as $ln){
            $numsoustheme = $ln['NUM_SOUS_THEME'];
            $req = "DELETE FROM SOUS_THEME WHERE NUM_SOUS_THEME = :numsoustheme";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numsoustheme' => $numsoustheme
            ));
        }
	}
    
    /**
	* Supprimer tous les résumés d'articles à partir d'une liste de numéro de résumé d'article
	**/
	public function delete_ResArticle_Liste($listeAR){
        foreach ($listeAR as $la){
            $numart = $la['NUM_RESUME_ARTICLE'];
            $req = "DELETE FROM RESUME_ARTICLE WHERE NUM_RESUME_ARTICLE = :numart";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numart' => $numart
            ));
        }
	}
	
	/**
	* Supprimer le résumé d'articles à partir d'un numéro de résumé d'article
	**/
	public function delete_ResArticle_NUM($numart){
    
            $req = "DELETE FROM RESUME_ARTICLE WHERE NUM_RESUME_ARTICLE = :numart";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numart' => $numart
            ));
 
	}
    
    /**
	* Supprimer toutes les observations à partir d'une liste de numéro d'observation
	**/
	public function delete_Observation_Liste($listeOBS){
        foreach ($listeOBS as $lo){
            $numobs = $lo['NUM_OBSERVATION'];
            $req = "DELETE FROM OBSERVATION WHERE NUM_OBSERVATION = :numobs";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numobs' => $numobs
            ));
        }
	}
    
    /**
	* Supprimer toutes les préconisations à partir d'une liste de numéro de préconisation"
	**/
	public function delete_Preconisation_Liste($listePR){
        foreach ($listePR as $lp){
            $numpreco = $lp['NUM_PRECONISATION'];
            $req = "DELETE FROM PRECONISATION WHERE NUM_PRECONISATION = :numpreco";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numpreco' => $numpreco
            ));
        }
	}
    
    /**
	* Supprimer tous les images d'un critère à partir d'une liste de numéro d'image'
	**/
	public function delete_ImageCR_Liste($listeIM){
        foreach ($listeIM as $li){
            $numimg = $li['NUM_IMAGE_CRITERE'];
            $req = "DELETE FROM IMAGE_CRITERE WHERE NUM_IMAGE_CRITERE = :numimg";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numimg' => $numimg
            ));
        }
	}  
    
    /**
	* Supprimer tous les critères à partir d'un numéro de sous-thème
	**/
	public function delete_Critere_SousTheme($numsoustheme){
        $req = "DELETE FROM CRITERE WHERE NUM_SOUS_THEME = :numsoustheme";
        $rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numsoustheme' => $numsoustheme
        ));
    }
    
    
    /**
	* Supprimer un sous-thème
	**/
    public function delete_Sous_Theme($numsoustheme){
		$req = "DELETE FROM SOUS_THEME WHERE NUM_SOUS_THEME = :numsoustheme";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numsoustheme' => $numsoustheme
        ));
        
	}
    
    /**
	* Supprimer un critère
	**/
    public function delete_Critere($numcritere){
		$req = "DELETE FROM CRITERE WHERE NUM_CRITERE = :numcritere";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numcritere' => $numcritere
        ));
        
	}
    
    /**
	* Supprimer une observation
	**/
    public function delete_Observation($numobs){
		$req = "DELETE FROM OBSERVATION WHERE NUM_OBSERVATION = :numobs";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numobs' => $numobs
        ));
        
	}
    
    /**
	* Supprimer une preconisation
	**/
    public function delete_Preconisation($numpreco){
		$req = "DELETE FROM PRECONISATION WHERE NUM_PRECONISATION = :numpreco";
		$rs = $this->monPdoInspection->prepare($req);
        $rs -> execute(array(
            'numpreco' => $numpreco
        ));
        
	}
	
	
	/**
	* Supprimer toutes les observations dans la table comprendre à partir d'une liste de numéro d'observation
	**/
	public function delete_ComprendreObs_Liste($listeOBS){
        foreach ($listeOBS as $lo){
            $numobs = $lo['NUM_OBSERVATION'];
            $req = "DELETE FROM COMPRENDRE WHERE NUM_OBSERVATION = :numobs";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numobs' => $numobs
            ));
        }
	}
	
	/**
	* Supprimer toutes les observations dans la table posseder à partir d'une liste de numéro d'observation
	**/
	public function delete_PossederObs_Liste($listeOBS){
        foreach ($listeOBS as $lo){
            $numobs = $lo['NUM_OBSERVATION'];
            $req = "DELETE FROM POSSEDER WHERE NUM_OBSERVATION = :numobs";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numobs' => $numobs
            ));
        }
	}
	
	/**
	* Supprimer toutes les preconisation dans la table disposer à partir d'une liste de numéro de preconisation
	**/
	public function delete_DisposerPre_Liste($listePR){
        foreach ($listePR as $lp){
            $numpreco = $lp['NUM_PRECONISATION'];
            $req = "DELETE FROM DISPOSER WHERE NUM_PRECONISATION = :numpreco";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numpreco' => $numpreco
            ));
        }
	}
	
	/**
	* Supprimer toutes les preconisation dans la table contenir à partir d'une liste de numéro de preconisation
	**/
	public function delete_ContenirPre_Liste($listePR){
        foreach ($listePR as $lp){
            $numpreco = $lp['NUM_PRECONISATION'];
            $req = "DELETE FROM CONTENIR WHERE NUM_PRECONISATION = :numpreco";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numpreco' => $numpreco
            ));
        }
	}
	
	/**
	* Supprimer toutes les critères controlés dans la table controle_critere à partir d'une liste de numéro de critère
	**/
	public function delete_ControleCR_Liste($num){
            $req = "DELETE FROM CONTROLE_CRITERE WHERE NUM_CRITERE = :numcr";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numcr' => $num
            ));
	}
	
	/**
	* Supprimer un controleur
	**/
	public function delete_Controleur($num){
            $req = "DELETE FROM CONTROLEUR WHERE NUM_CONTROLEUR = :numcr";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numcr' => $num
            ));
	}
	
	/**
	* Supprimer toutes les critères controlés sur site dans la table inscrire à partir d'une liste de numéro de critère
	**/
	public function delete_InscrireCR_Liste($num){
            $req = "DELETE FROM INSCRIRE WHERE NUM_CRITERE = :numcr";
            $rs = $this->monPdoInspection->prepare($req);
            $rs -> execute(array(
                'numcr' => $num
            ));
    }
	
	
	
	
	
	
	
	

/************************** SUR SITE ************************************/
	
	/**
	* Supprimer tous les batiments à partir d'une liste de numéro de batiments
	**/
	public function delete_Batiments_Liste($listeBat){
        foreach ($listeBat as $laListe){
            $numbatiment = $laListe['NUM_BATIMENT'];
            $req = "DELETE FROM BATIMENT WHERE NUM_BATIMENT = ?";
            $rs = $this->monPdoInspection->prepare($req);
            $rs->execute(array($numbatiment));
        }
	}
	
	/**
	* Supprimer tous les batiments dans la table conroler à partir d'une liste de numéro de batiments
	**/
	public function delete_BatimentsContr_Liste($listeBat){
        foreach ($listeBat as $laListe){
            $numbatiment = $laListe['NUM_BATIMENT'];
            $req = "DELETE FROM CONTROLER WHERE NUM_BATIMENT = ?";
            $rs = $this->monPdoInspection->prepare($req);
            $rs->execute(array($numbatiment));
        }
	}
	
	/**
	* Supprime un pole
	**/
	public function delete_Pole($numPole) {
		$req = "DELETE FROM POLE WHERE CODE_POLE = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numPole));
	}
	
	/**
	* Supprime un bâtiment dans controler
	**/
	public function delete_BatimentContr($numBatiment) {
		$req = "DELETE FROM CONTROLER WHERE NUM_BATIMENT = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numBatiment));
	}
	
	/**
	* Supprime un bâtiment
	**/
	public function delete_Batiment($numBatiment) {
		$req = "DELETE FROM BATIMENT WHERE NUM_BATIMENT = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numBatiment));
	}
	
	/**
	* Supprime un groupe de lieux
	**/
	public function delete_GroupeLieu($numGroupeLieu) {
		$req = "DELETE FROM GROUPE_LIEU WHERE NUM_GROUPE_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numGroupeLieu));
	}
	
	/**
	* Supprime des lieux dans inscrire à partir d'une liste de lieu
	**/
	public function delete_LieuINS_Liste($listeLieux) {
		foreach($listeLieux as $laListe) {
			$numLieu = $laListe['NUM_LIEU'];
			$req = "DELETE FROM INSCRIRE WHERE NUM_LIEU = ?";
			$rs = $this->monPdoInspection->prepare($req);
			$rs->execute(array($numLieu));
		}
	}
	
	/**
	* Supprime des lieux dans disposer à partir d'une liste de lieu
	**/
	public function delete_LieuCON_Liste($listeLieux) {
		foreach($listeLieux as $laListe) {
			$numLieu = $laListe['NUM_LIEU'];
			$req = "DELETE FROM CONTENIR WHERE NUM_LIEU = ?";
			$rs = $this->monPdoInspection->prepare($req);
			$rs->execute(array($numLieu));
		}
	}
	
	/**
	* Supprime des lieux dans disposer à partir d'une liste de lieu
	**/
	public function delete_LieuPOS_Liste($listeLieux) {
		foreach($listeLieux as $laListe) {
			$numLieu = $laListe['NUM_LIEU'];
			$req = "DELETE FROM POSSEDER WHERE NUM_LIEU = ?";
			$rs = $this->monPdoInspection->prepare($req);
			$rs->execute(array($numLieu));
		}
	}
	
	/**
	* Supprime des lieux correspondant à un groupe de lieux
	**/
	public function delete_Lieu_GL_Liste($listeLieux) {
		foreach($listeLieux as $laListe) {
			$numLieu = $laListe['NUM_LIEU'];
			$req = "DELETE FROM LIEU WHERE NUM_LIEU = ?";
			$rs = $this->monPdoInspection->prepare($req);
			$rs->execute(array($numLieu));
		}
	}
	
	/**
	* Supprimer un lieu
	**/
	public function delete_LieuINS($numLieu) {
		$req = "DELETE FROM INSCRIRE WHERE NUM_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numLieu));
	}
	
	/**
	* Supprimer un lieu
	**/
	public function delete_LieuCON($numLieu) {
		$req = "DELETE FROM CONTENIR WHERE NUM_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numLieu));
	}
	
	/**
	* Supprimer un lieu
	**/
	public function delete_LieuPOS($numLieu) {
		$req = "DELETE FROM POSSEDER WHERE NUM_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numLieu));
	}
	
	/**
	* Supprimer un lieu
	**/
	public function delete_Lieu($numLieu) {
		$req = "DELETE FROM LIEU WHERE NUM_LIEU = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numLieu));
	}
	
	
	///////////////////////////////////////////////////////
	/* Supprimer l'ancien audit avec toutes ses données */
	//////////////////////////////////////////////////////
	
	/**
	* Supprimer tout dans participer
	**/
	public function delete_ALL_PARTICIPER() {
		$req = "DELETE FROM PARTICIPER";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans participant
	**/
	public function delete_ALL_PARTICIPANT() {
		$req = "DELETE FROM PARTICIPANT";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans inscrire
	**/
	public function delete_ALL_INSCRIRE() {
		$req = "DELETE FROM INSCRIRE";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans posseder
	**/
	public function delete_ALL_POSSEDER() {
		$req = "DELETE FROM POSSEDER";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans contenir
	**/
	public function delete_ALL_CONTENIR() {
		$req = "DELETE FROM CONTENIR";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans disposer
	**/
	public function delete_ALL_DISPOSER() {
		$req = "DELETE FROM DISPOSER";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans comprendre
	**/
	public function delete_ALL_COMPRENDRE() {
		$req = "DELETE FROM COMPRENDRE";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans controle_critere
	**/
	public function delete_ALL_CONTROLE_CRITERE() {
		$req = "DELETE FROM CONTROLE_CRITERE";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans controler
	**/
	public function delete_ALL_CONTROLER() {
		$req = "DELETE FROM CONTROLER";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
	/**
	* Supprimer tout dans audit
	**/
	public function delete_ALL_AUDIT() {
		$req = "DELETE FROM AUDIT";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array());
	}
	
			///////////////////////////////////////////////////////
	/* Supprimer le 1er audit */
	//////////////////////////////////////////////////////
	
	/**
	* Supprimer tout dans participer quand on a un audit
	**/
	public function delete_PRE_PARTICIPER($num) {
		$req = "DELETE FROM PARTICIPER WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans participant quand on a un audit
	**/
	public function delete_PRE_PARTICIPANT($num) {
		$req = "DELETE FROM participant WHERE num_participant = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans inscrire quand on a un audit
	**/
	public function delete_PRE_INSCRIRE($num) {
		$req = "DELETE FROM INSCRIRE WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans posseder quand on a un audit
	**/
	public function delete_PRE_POSSEDER($num) {
		$req = "DELETE FROM POSSEDER WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans contenir quand on a un audit
	**/
	public function delete_PRE_CONTENIR($num) {
		$req = "DELETE FROM CONTENIR WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans disposer quand on a un audit
	**/
	public function delete_PRE_DISPOSER($num) {
		$req = "DELETE FROM DISPOSER WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans comprendre quand on a un audit
	**/
	public function delete_PRE_COMPRENDRE($num) {
		$req = "DELETE FROM COMPRENDRE WHERE NUM_AUDIT=?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans controle_critere quand on a un audit
	**/
	public function delete_PRE_CONTROLE_CRITERE($num) {
		$req = "DELETE FROM CONTROLE_CRITERE WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer tout dans controler quand on a un audit
	**/
	public function delete_PRE_CONTROLER($num) {
		$req = "DELETE FROM CONTROLER WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Supprimer un audit
	**/
	public function delete_PRE_AUDIT($num) {
		$req = "DELETE FROM AUDIT WHERE NUM_AUDIT =?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* supprimer preco manuel
	**/
	public function delete_preco_manu($num){
		$req="DELETE FROM PRECONISATION WHERE code_Preco=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
	}
	
	/**
	* supprimer preco manuel
	**/
	public function delete_obs_manu($num){
		$req="DELETE FROM OBSERVATION WHERE code_obs=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
	}
	
	/***************************************************************/
	
	/**
	* Récupère le libelle de l'audit
	**/
	public function get_Audit_En_Cours($numAudit) {
		$req = "SELECT LIBELLE_AUDIT FROM AUDIT WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère l'adresse de structure
	**/
	public function get_AdresseStructure_En_Cours($numAudit) {
		$req = "SELECT ADRESSE_STRUCTURE
		FROM STRUCTURE s
		INNER JOIN AUDIT a ON a.NUM_STRUCTURE=s.NUM_STRUCTURE
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère la ville de la structure
	**/
	public function get_VilleStructure_En_Cours($numAudit) {
		$req = "SELECT VILLE_STRUCTURE
		FROM STRUCTURE s
		INNER JOIN AUDIT a ON a.NUM_STRUCTURE=s.NUM_STRUCTURE
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le code postal de la structure
	**/
	public function get_CpStructure_En_Cours($numAudit) {
		$req = "SELECT CP_STRUCTURE
		FROM STRUCTURE s
		INNER JOIN AUDIT a ON a.NUM_STRUCTURE=s.NUM_STRUCTURE
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le numero de type structure
	**/
	public function get_NumTypeStructure_En_Cours($numAudit) {
		$req = "SELECT NUM_TYPE_STRUCTURE
		FROM STRUCTURE s
		INNER JOIN AUDIT a ON a.NUM_STRUCTURE=s.NUM_STRUCTURE
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le nom de type structure
	**/
	public function get_NomTypeStructure_En_Cours($numAudit) {
		$req = "SELECT NOM_TYPE_STRUCTURE
		FROM STRUCTURE s
		INNER JOIN AUDIT a ON a.NUM_STRUCTURE=s.NUM_STRUCTURE
		INNER JOIN TYPE_STRUCTURE ts ON ts.NUM_TYPE_STRUCTURE=s.NUM_TYPE_STRUCTURE
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le nom de la structure
	**/
	public function get_NomStructure_En_Cours($numAudit) {
		$req = "SELECT NOM_STRUCTURE
		FROM STRUCTURE s
		INNER JOIN AUDIT a ON a.NUM_STRUCTURE=s.NUM_STRUCTURE
		INNER JOIN TYPE_STRUCTURE ts ON ts.NUM_TYPE_STRUCTURE=s.NUM_TYPE_STRUCTURE
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le num de la structure
	**/
	public function get_NumStructure_En_Cours($numAudit) {
		$req = "SELECT NUM_STRUCTURE
		FROM AUDIT
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le nom du controlleur
	**/
	public function get_NomControlleur_En_Cours($numAudit) {
		$req = "SELECT NOM_CONTROLEUR
		FROM CONTROLEUR c
		INNER JOIN AUDIT a ON a.NUM_CONTROLEUR=c.NUM_CONTROLEUR
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le nom du controlleur
	**/
	public function get_PrenomControlleur_En_Cours($numAudit) {
		$req = "SELECT PRENOM_CONTROLEUR
		FROM CONTROLEUR c
		INNER JOIN AUDIT a ON a.NUM_CONTROLEUR=c.NUM_CONTROLEUR
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le num du controlleur
	**/
	public function get_NumControlleur_En_Cours($numAudit) {
		$req = "SELECT NUM_CONTROLEUR FROM AUDIT
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le nombre de sous theme
	**/
	public function get_NbSous_Theme($theme) {
		$req = "SELECT DISTINCT count(NUM_SOUS_THEME) AS NB
		FROM CRITERE
		WHERE NUM_THEME = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($theme));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Verifie si l'image du critere existe
	**/
	public function get_NbImage_Critere($critere) {
		$req = "SELECT DISTINCT count(NUM_CRITERE) AS NB
		FROM IMAGE_CRITERE
		WHERE NUM_CRITERE = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($critere));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère les info centre
	**/
	public function get_Info_Centre() {
		$req = "SELECT *
		FROM CENTRE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère le nombre de participant
	**/
	public function get_NbParticipant_En_Cours($numAudit) {
		$req = "SELECT count(NUM_PARTICIPANT)
		FROM PARTICIPER
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Récupère les participants
	**/
	public function get_Participant_En_Cours($numAudit) {
		$req = "SELECT *
		FROM PARTICIPANT p 
		INNER JOIN PARTICIPER pa ON p.NUM_PARTICIPANT=pa.NUM_PARTICIPANT
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($numAudit));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	
	
	/******************************************Mise a jours des infos audit *****************************************************/
	
	/**
	* change le nom de l'audit
	**/
	public function update_LibelAudit($libelAudit, $numAudit) {
		$req = "UPDATE audit SET LIBELLE_AUDIT = ?
        WHERE NUM_AUDIT = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($libelAudit, $numAudit));
	}
	
	/**
	* change une structure
	**/
	public function update_Structure($numtype, $nom_Structure, $adresse,$ville,$cp,$tel,$email,$num) {
		$req = "UPDATE structure SET NUM_TYPE_STRUCTURE=?,NOM_STRUCTURE=?, ADRESSE_STRUCTURE=?, VILLE_STRUCTURE=?, CP_STRUCTURE=?, TELEPHONE_STRUCTURE=?, EMAIL_STRUCTURE=?
        WHERE NUM_STRUCTURE = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numtype, $nom_Structure, $adresse,$ville,$cp,$tel,$email, $num));
	}

	
	/**
	* change les infos du centre
	**/
	public function update_Centre($logo, $entete, $nom, $adresse, $cp, $ville,$tel, $fax,$site) {
		$req = "UPDATE centre SET LOGO = ?, ENTETE=?, NOM= ?, ADRESSE =?, CP=?, VILLE =?, TEL =?, FAX =?,SITE=?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($logo, $entete, $nom, $adresse, $cp, $ville,$tel, $fax,$site));
	}
	
	/**
	* change les infos controleur
	**/
	public function update_ModifControleur($nom, $prenom,$fonction,$affectation,$centre,$adresse,$fixe,$mobile,$fax,$email,$num) {
		$req = "UPDATE controleur SET NOM_CONTROLEUR = ?,PRENOM_CONTROLEUR=?, FONCTION_CONTROLEUR=?,AFFECTATION_CONTROLEUR=?,CENTRE_CONTROLEUR=?,ADRESSE_CONTROLEUR=?,TEL_FIXE_CONTROLEUR=?,TEL_MOBILE_CONTROLEUR=?,FAX_CONTROLEUR=?,EMAIL_CONTROLEUR=? 
        WHERE NUM_CONTROLEUR = ?";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($nom, $prenom,$fonction,$affectation,$centre,$adresse,$fixe,$mobile,$fax,$email,$num));
	}
	
	
	
	/**
	* Changer l'adresse de la structure
	**/
	public function update_addStruct($add,$numStruct){
		$req="UPDATE STRUCTURE SET ADRESSE_STRUCTURE=?
		WHERE NUM_STRUCTURE = ? ";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($add, $numStruct));
	}
	
	/**
	* Changer la ville de la structure
	**/
	public function update_villeStruct($ville,$numStruct){
		$req="UPDATE STRUCTURE SET VILLE_STRUCTURE=?
		WHERE NUM_STRUCTURE = ? ";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($ville, $numStruct));
	}
	
	/**
	* Changer le code postal de la structure
	**/
	public function update_cpStruct($cp,$numStruct){
		$req="UPDATE STRUCTURE SET CP_STRUCTURE=?
		WHERE NUM_STRUCTURE = ? ";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($cp, $numStruct));
	}
	
	/**
	* Changer le controleur
	**/
	public function update_controleur($numContr,$numAudit){
		$req="UPDATE AUDIT SET NUM_CONTROLEUR=?
		WHERE NUM_AUDIT = ? ";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($numContr, $numAudit));
	}
	
	/**
	* Permet de rajouter un participant
	**/
	public function insert_Participants_modif($numStruct,$nomParticip,$prenomParticip,$code,$nomFonction){
		$req="INSERT INTO PARTICIPANT (NUM_STRUCTURE, NOM_PARTICIPANT, PRENOM_PARTICIPANT, CODE_CIVILITE_PARTICIPANT, NOM_FONCTION_PARTICIPANT) VALUES (?,?,?,?,?)";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array($numStruct,$nomParticip,$prenomParticip,$code,$nomFonction));
	}
	
	/**
	* Insert un participant pour l'audit
	**/
	public function insert_Participe_modif($numParticipant,$numAudit){
		$req="INSERT INTO PARTICIPER (NUM_PARTICIPANT, NUM_AUDIT) VALUES (?,?)";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array($numParticipant,$numAudit));
	}
	
	/**
	* recupere le dernier participant
	**/
	public function dernier_participant(){
		$req="SELECT NUM_PARTICIPANT FROM PARTICIPANT ORDER BY NUM_PARTICIPANT DESC LIMIT 1";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array());
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Supprime un participant de participer
	**/
	
	public function delete_participe_modif($num){
		$req="DELETE FROM PARTICIPER WHERE NUM_PARTICIPANT=?";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
	}
	
	/**
	* Supprime un participant de la table participant
	**/
	public function delete_participant_modif($num){
		$req="DELETE FROM PARTICIPANT WHERE NUM_PARTICIPANT=?";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
	}
	
	/**
	* met a jour les infos d'un participant
	**/
	public function update_participant_amodif($nom,$prenom,$civil,$fonction,$num){
		$req="UPDATE PARTICIPANT SET NOM_PARTICIPANT=?, PRENOM_PARTICIPANT=?, CODE_CIVILITE_PARTICIPANT=?, NOM_FONCTION_PARTICIPANT=? WHERE NUM_PARTICIPANT=?";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array($nom,$prenom,$civil,$fonction,$num));
	}
	
	/**
	* recupere les infos d'un participant
	**/
	public function select_participant_amodif($num){
		$req="SELECT * FROM PARTICIPANT WHERE NUM_PARTICIPANT=?";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	
	/**
	* Compte le nombre de participant
	**/
	public function count_participant($num){
		$req="SELECT COUNT(NUM_PARTICIPANT) AS NB FROM PARTICIPER WHERE NUM_AUDIT=?";
		$rs=$this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* recupere le nombre de rouge dans organisation
	**/
	public function get_nbRougeORG($num) {
		$req = "SELECT DISTINCT th.NOM_THEME, COUNT(coc.VALEUR_CRITERE) AS NBROUGE FROM THEME th
		INNER JOIN CRITERE cr ON cr.NUM_THEME=th.NUM_THEME
		INNER JOIN controle_critere coc ON cr.NUM_CRITERE=coc.NUM_CRITERE
		WHERE coc.NUM_AUDIT=? AND (VALEUR_CRITERE='NC' OR VALEUR_CRITERE='<C')
		GROUP BY NOM_THEME
		ORDER BY NBROUGE DESC";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* recupere le nombre de rouge dans site par batiment
	**/
	public function get_nbRougeSITE($num) {
		$req = "SELECT DISTINCT NOM_BATIMENT, COUNT(VALEUR_CRITERE) AS NBROUGE FROM THEME th
		INNER JOIN INSCRIRE i ON i.NUM_THEME_C=th.NUM_THEME
		INNER JOIN BATIMENT b ON b.NUM_BATIMENT=i.NUM_BATIMENT_C
		WHERE i.NUM_AUDIT=? AND (VALEUR_CRITERE='NC' OR VALEUR_CRITERE='<C')
		GROUP BY NOM_BATIMENT
		ORDER BY NBROUGE DESC";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* recupere le nombre de rouge dans site par theme
	**/
	public function get_nbRougeSITE_theme($num) {
		$req = "SELECT DISTINCT NOM_THEME, COUNT(VALEUR_CRITERE) AS NBROUGE FROM THEME th
		INNER JOIN INSCRIRE i ON i.NUM_THEME_C=th.NUM_THEME
		WHERE i.NUM_AUDIT=? AND (VALEUR_CRITERE='NC' OR VALEUR_CRITERE='<C')
		GROUP BY NOM_THEME
		ORDER BY NBROUGE DESC";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Recupere les criteres (et theme) controler rouges en fonction d'un theme ORGANISATIONNEL
	*/
	public function get_critereRouge_theme_Org(){
		$req = "SELECT c.NUM_CRITERE, c.LIBELLE_CRITERE, t.NOM_THEME, t.NUM_THEME, cc.NUM_AUDIT FROM CONTROLE_CRITERE cc 
		INNER JOIN CRITERE c ON cc.NUM_CRITERE=c.NUM_CRITERE
		INNER JOIN THEME t ON t.NUM_THEME=c.NUM_THEME
		WHERE VALEUR_CRITERE='NC' OR VALEUR_CRITERE='<C'
		ORDER BY NOM_THEME";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Recupere les criteres (et theme) controler rouges en fonction d'un theme SUR SITE
	*/
	public function get_critereRouge_theme_Site(){
		$req = "SELECT i.NUM_CRITERE, c.LIBELLE_CRITERE, t.NOM_THEME, t.NUM_THEME, b.NOM_BATIMENT, l.NOM_LIEU, i.NUM_AUDIT FROM INSCRIRE i 
		INNER JOIN CRITERE c ON i.NUM_CRITERE=c.NUM_CRITERE
		INNER JOIN BATIMENT b ON b.NUM_BATIMENT=i.NUM_BATIMENT_C
		INNER JOIN LIEU l ON l.NUM_LIEU=i.NUM_LIEU
		INNER JOIN THEME t ON t.NUM_THEME=i.NUM_THEME_C
		WHERE VALEUR_CRITERE='NC' OR VALEUR_CRITERE='<C'
		ORDER BY NOM_THEME";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetchAll();
		return $ligne;
	}
	
	/**
	* Recupere les criteres (et theme) controler rouges en fonction d'un theme ORGANISATIONNEL
	*/
	public function get_NBcritereRouge_theme_Org($num){
		$req = "SELECT COUNT(NUM_CRITERE) AS NBCRITEREROUGEORG, cc.NUM_AUDIT FROM CONTROLE_CRITERE cc 
		WHERE (VALEUR_CRITERE='NC' OR VALEUR_CRITERE='<C') AND cc.NUM_AUDIT=?
        GROUP BY cc.NUM_AUDIT";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Recupere les criteres (et theme) controler rouges en fonction d'un theme SUR SITE
	*/
	public function get_NBcritereRouge_theme_Site($num){
		$req = "SELECT COUNT(i.NUM_CRITERE) AS NBCRITEREROUGESITE, i.NUM_AUDIT FROM INSCRIRE i 
		INNER JOIN CRITERE c ON i.NUM_CRITERE=c.NUM_CRITERE
		INNER JOIN THEME t ON t.NUM_THEME=c.NUM_THEME
		WHERE VALEUR_CRITERE='NC' OR VALEUR_CRITERE='<C' AND NUM_AUDIT=?
		GROUP BY i.NUM_AUDIT
		ORDER BY i.NUM_AUDIT";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Vérifie la présence d'inspecteur
	**/
	public function nb_inspecteur(){
		$req = "SELECT COUNT(NUM_CONTROLEUR) AS NbControlleur FROM CONTROLEUR";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Vérifie la présence de structure
	**/
	public function nb_structure(){
		$req = "SELECT COUNT(NUM_STRUCTURE) AS NbStructure FROM STRUCTURE";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	/**
	* Ajout d'un batiment manuel
	**/
	public function add_Batiment_manu($numPole, $nomBatiment, $num) {
		$req = "INSERT INTO BATIMENT (CODE_POLE, NOM_BATIMENT, CODE_BATIMENT) VALUES (:numpole,:nombatiment, :numaudit)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numpole' => $numPole,
			'nombatiment' => $nomBatiment,
			'numaudit' => $num
		));
	}
	
	/**
	* Delete batiment manuel
	**/
	public function delete_Batiment_manu($num){
		$req="DELETE FROM BATIMENT WHERE CODE_BATIMENT=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
	}
	
	/**
	* Ajout d'un lieu manuel
	**/
	public function add_Lieu_manu($numgrpLieu, $nomLieu, $num) {
		$req = "INSERT INTO LIEU (NUM_GROUPE_LIEU, NOM_LIEU, CODE_LIEU) VALUES (:numgrpLieu,:nomLieu, :numaudit)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			'numgrpLieu' => $numgrpLieu,
			'nomLieu' => $nomLieu,
			'numaudit' => $num
		));
	}
	/**
	* supprimer les lieux manuel
	**/
	public function delete_Lieu_manu($num){
		$req="DELETE FROM LIEU WHERE CODE_LIEU=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
	}
	
	
	/*************************************************************/
	
	/**
	* Ajout d'une date de critere
	**/
	public function add_Date_Maj($num) {
		$req = "INSERT INTO DATE_MAJ (NUM_CRITERE, DATE_OBSERVATION,DATE_PROPOSITION_DATE_IMAGE) VALUES (?,null,null,null)";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array(
			$num
		));
	}
	
	/**
	* Changer la date de l'observation
	**/
	public function update_Date_Observation($num){
		$req="UPDATE DATE_MAJ SET DATE_OBSERVATION= DATE(NOW())
		WHERE NUM_CRITERE = ? ";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Changer la date de la proposition
	**/
	public function update_Date_Proposition($num){
		$req="UPDATE DATE_MAJ SET DATE_PROPOSITION= DATE(NOW())
		WHERE NUM_CRITERE = ? ";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* Changer la date de l'image
	**/
	public function update_Date_Image($num){
		$req="UPDATE DATE_MAJ SET DATE_IMAGE= DATE(NOW())
		WHERE NUM_CRITERE = ? ";
		$rs = $this->monPdoInspection->prepare($req);
        $rs->execute(array($num));
	}
	
	/**
	* supprimer les lieux manuel
	**/
	public function delete_Date_Maj($num){
		$req="DELETE FROM DATE_MAJ WHERE NUM_CRITERE=?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num));
	}
	
	/**
	* Récupère l'adresse de la structure à partir du numéro
	**/
	public function get_Date_Maj($num) {
		$req = "SELECT NUM_CRITERE, YEAR(DATE_OBSERVATION) AS AnneeObs, MONTH(DATE_OBSERVATION) AS MoisObs, DAY(DATE_OBSERVATION) AS JourObs, YEAR(DATE_PROPOSITION) AS AnneeProp, MONTH(DATE_PROPOSITION) AS MoisProp, DAY(DATE_PROPOSITION) AS JourProp, YEAR(DATE_IMAGE) AS AnneeImg, MONTH(DATE_IMAGE) AS MoisImg, DAY(DATE_IMAGE) AS JourImg FROM DATE_MAJ WHERE NUM_CRITERE = ?";
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute(array($num
		));
		$ligne = $rs->fetch();
		return $ligne;
	}
	
	
	
	
	
/*----EXPORT------------------------------------------------------------------------------------------------------*/	
	/*
	*Exporte toute la BD pour en faire une sauvegarde au format SQL
		$host="localhost";
		$user="root";
		$pass="";
		$name="base_inspection_cdg";
		$tables=array("theme");
		$pdo->EXPORT_TABLES($host,$user,$pass,$name,       $tables=false, $backup_name=false);
		
		//optional: 5th parameter - backup specific tables only: array("mytable1","mytable2",...)   
                //optional: 6th parameter - backup filename
                // NOTE! to adequatelly replace strings in DB, MUST READ:   goo.gl/nCwWsS
	*/
	function EXPORT_TABLES($host,$user,$pass,$name,       $tables=false, $backup_name=false){ 
		set_time_limit(3000); $mysqli = new mysqli($host,$user,$pass,$name); $mysqli->select_db($name); $mysqli->query("SET NAMES 'utf8'");
		$queryTables = $mysqli->query('SHOW TABLES'); while($row = $queryTables->fetch_row()) { $target_tables[] = $row[0]; }   if($tables !== false) { $target_tables = array_intersect( $target_tables, $tables); } 
		$content = "SET SQL_MODE = \"NO_AUTO_VALUE_ON_ZERO\";\r\nSET time_zone = \"+00:00\";\r\n\r\n\r\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\r\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\r\n/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\r\n/*!40101 SET NAMES utf8 */;\r\n--\r\n-- Database: `".$name."`\r\n--\r\n\r\n\r\n";
		foreach($target_tables as $table){
			if (empty($table)){ continue; } 
			$result = $mysqli->query('SELECT * FROM `'.$table.'`');     $fields_amount=$result->field_count;  $rows_num=$mysqli->affected_rows;     $res = $mysqli->query('SHOW CREATE TABLE '.$table); $TableMLine=$res->fetch_row(); 
			$content .= "\n\n".$TableMLine[1].";\n\n";
			for ($i = 0, $st_counter = 0; $i < $fields_amount;   $i++, $st_counter=0) {
				while($row = $result->fetch_row())  { //when started (and every after 100 command cycle):
					if ($st_counter%100 == 0 || $st_counter == 0 )  {$content .= "\nINSERT INTO ".$table." VALUES";}
						$content .= "\n(";    for($j=0; $j<$fields_amount; $j++){ $row[$j] = str_replace("\n","\\n", addslashes($row[$j]) ); if (isset($row[$j])){$content .= '"'.$row[$j].'"' ;}  else{$content .= '""';}     if ($j<($fields_amount-1)){$content.= ',';}   }        $content .=")";
					//every after 100 command cycle [or at last line] ....p.s. but should be inserted 1 cycle eariler
					if ( (($st_counter+1)%100==0 && $st_counter!=0) || $st_counter+1==$rows_num) {$content .= ";";} else {$content .= ",";} $st_counter=$st_counter+1;
				}
			} $content .="\n\n\n";
		}
		$content .= "\r\n\r\n/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\r\n/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\r\n/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;";
		$bon=str_replace(',""',",null",$content);
		$backup_name = $backup_name ? $backup_name : $name."___(".date('H-i-s')."_".date('d-m-Y').")__rand".rand(1,11111111).".sql";
		ob_get_clean(); header('Content-Type: application/octet-stream');   header("Content-Transfer-Encoding: Binary"); header("Content-disposition: attachment; filename=\"".$backup_name."\"");
		echo $bon; exit;
	} 
	

	public function IMPORT_TABLES($filename, $mysql_host, $mysql_username, $mysql_password, $mysql_database){
		/*
			// Name of the file
			$filename = 'nom_save.sql';
			// MySQL host
			$mysql_host = 'localhost';
			// MySQL username
			$mysql_username = 'root';
			// MySQL password
			$mysql_password = '';
			// Database name
			$mysql_database = 'base_inspection_cdg';
			$pdo->IMPORT_TABLES($filename, $mysql_host, $mysql_username, $mysql_password, $mysql_database);
		*/

		// Connect to MySQL server
		@mysql_connect($mysql_host, $mysql_username, $mysql_password) or die('Error connecting to MySQL server: ' . mysql_error());
		// Select database
		mysql_select_db($mysql_database) or die('Error selecting MySQL database: ' . mysql_error());

		// Temporary variable, used to store current query
		$templine = '';
		// Read in entire file
		$lines = file($filename);
		// Loop through each line
		foreach ($lines as $line)
		{
		// Skip it if it's a comment
		if (substr($line, 0, 2) == '--' || $line == '')
			continue;

		// Add this line to the current segment
		$templine .= $line;
		// If it has a semicolon at the end, it's the end of the query
		if (substr(trim($line), -1, 1) == ';')
		{
			// Perform the query
			@mysql_query($templine) /*or print('Error performing query \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br />')*/;
			// Reset temp variable to empty
			$templine = '';
		}
		}
	}
    
	/*Supprime la table passé en paramètre*/
	public function DROP_TABLE($table){
		$req = "DROP TABLE ".$table;
		$rs = $this->monPdoInspection->prepare($req);
		$rs->execute();
	}
	
	
	/*Créer base de donnée "base_inspection_cdg"*/
	public function CREATE_DATABASE(){
		$servername = "localhost";
		$username = "root";
		$password = "";

		// Create connection
		$conn = new mysqli($servername, $username, $password);
		// Check connection
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		} 
		// Create database
		$sql = "CREATE DATABASE IF NOT EXISTS base_inspection_cdg";
		if ($conn->query($sql) == TRUE) {
			echo "Database created successfully";	


						
					$filename = 'base_inspection_cdg.sql';
					$mysql_host = 'localhost';
					$mysql_username = 'root';
					$mysql_password = '';
					$mysql_database = 'base_inspection_cdg';
					IMPORT_TABLES($filename, $mysql_host, $mysql_username, $mysql_password, $mysql_database);
					@mysql_connect($mysql_host, $mysql_username, $mysql_password) or die('Error connecting to MySQL server: ' . mysql_error());
					mysql_select_db($mysql_database) or die('Error selecting MySQL database: ' . mysql_error());
					$templine = '';
					$lines = file($filename);
					foreach ($lines as $line)
					{
					if (substr($line, 0, 2) == '--' || $line == '')
						continue;
					$templine .= $line;
					if (substr(trim($line), -1, 1) == ';')
					{
						mysql_query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br />');
						$templine = '';
					}
					}
					// $filename = 'base_inspection_cdg.sql';
					// $mysql_host = 'localhost';
					// $mysql_username = 'root';
					// $mysql_password = '';
					// $mysql_database = 'base_inspection_cdg';
					// IMPORT_TABLES($filename, $mysql_host, $mysql_username, $mysql_password, $mysql_database);
					// @mysql_connect($mysql_host, $mysql_username, $mysql_password) or die('Error connecting to MySQL server: ' . mysql_error());
					// mysql_select_db($mysql_database) or die('Error selecting MySQL database: ' . mysql_error());
					// $templine = '';
					// $lines = file($filename);
					// foreach ($lines as $line)
					// {
					// if (substr($line, 0, 2) == '--' || $line == '')
						// continue;
					// $templine .= $line;
					// if (substr(trim($line), -1, 1) == ';')
					// {
						// mysql_query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br />');
						// $templine = '';
					// }
					// }


				
		} else {
			echo "Error creating database: " . $conn->error;
		}

		$conn->close();
	}
	
	
	
	public function formatString($lines){
		$espace=0;
		$maChaine = "Début";
		for($i=0;$i<strlen($lines);$i++){
		if ($lines{$i}==" "){
				$maChaine = "Espace";
				// $espace=$espace+1;
				// if($espace=3){
					// $part1=substr($lines, 0, $i);
					// $part2=substr($lines, $i+1, $lines.strlen());
					// $maChaine=$part1."\r\n".$part2;
				// }
				// if($espace<3){
					// $maChaine=$lines;
				// }
			}else{
				$maChaine = "Pas d'espace";
			}
		}
		
		// $maChaine = $lines."\r\n".$lines;
		// $maChaine = substr($lines, 0, 3)."\r\n".substr($lines, 5, 20);
		
		
		// $maChaine=$lines;
		// $NB_MAX=20; $i=0; $index =-1;
	 
		// while($i+$NB_MAX < $lines.strlen()-1){
			// $index = $maChaine.substr($i, $i+$NB_MAX).lastIndexOf(' ');
	 
			// if($index != -1)
				// $maChaine = $maChaine.substr(0, ($index+$i)+1) + '\n' + $maChaine.substr(($index+$i)+1);
	 
			// else
				// $maChaine = $maChaine.substr(0, $i+1) + '\n' + $maChaine.substr($i+1);
	 
	 
			// $i+= $index+1;
		// }
	 
	 
		return $maChaine;
	  }
}
?>