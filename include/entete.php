<!DOCTYPE html>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8" />
	<title>INspect</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="./css/style_titre.css"/>
    <link rel="stylesheet" href="./css/style_bouton.css"/>
    <link rel="stylesheet" href="./css/style_tab.css"/>
    <link rel="stylesheet" href="./css/style_conforme.css"/>
    <link rel="stylesheet" href="./css/style_obsimp.css"/>

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>

<body>
<div class="container">
<header>
	<?php if($uc !='connexion'){ ?>
	<div id="btn btnMenu btnRetourMenu">
		<form method="POST" action="index.php?uc=connexion&action=retour_menu">
			<button type="submit" class="btn btn-default btnMenu glyphicon glyphicon-home"> HOME</button>
		</form>
		<?php if($uc!='creation' && $uc!='identification' && $uc!='maj'){ ?>
		<form method="POST" action="index.php?uc=identification&action=modif_audit&nt=non&aj=non&aft=non&mo=non&sup=non">
			<button type="submit" class="btn btn-default btnMenu glyphicon glyphicon-pencil"> MODIF</button>
		</form>
		<br/>
		<?php } ?>
		<?php if($action=='modif_audit'){ ?>
		<form method="POST" action="index.php?uc=identification&action=participant">
			<button class="btn btn-default btnMenu glyphicon glyphicon-log-out" type="submit" name="retour"> RETOUR PARTIE </button>
		</form>
		<?php } ?>
	</div>
	<br>
	<?php } ?>
    <?php
		$infoCentre=$pdo->get_Info_Centre();
		 if($uc !='connexion' && $uc!='creation' && $uc!='identification' && $uc!='maj'){ 
			$infosaudit = $pdo->get_Audit_En_Cours($_SESSION['audit']);
		}
        if($_SESSION['codepartie'] == 1){
            $uc_choix = 'organisationnel';
        }
        else{
            $uc_choix = 'sursite';
        }
        $path="./";
		$pathancien="./images/";
        if($_SESSION['entpied'] == 'accueil'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>"  />
			</div>
			<?php
            echo "<h1>Bienvenue sur l'application INspect</h1>";
            echo "<h2>Application pour le référentiel d'inspection</h2>";
        }
		if($_SESSION['entpied'] == 'connexion'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>"  />
			</div>
			<?php
            echo "<h1>Connexion</h1>";
        }
		if($_SESSION['entpied']=="majVersion"){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Version</h1>";
        }
		if($_SESSION['entpied']=="majBD"){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Mise à jour de la base de données</h1>";
        }
		
		if($_SESSION['entpied'] == 'identification'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>"  />
			</div>
			<?php
            echo "<h1>Identification</h1>";
        }
		if($_SESSION['entpied'] == 'majCoordInspec'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>"  sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Modification des coordonnées des inspecteurs</h1>";
        }
		if($_SESSION['entpied'] == 'majLogo'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Modification des infos du Centre</h1>";
        }
        if($_SESSION['entpied'] == 'majCoordStruc'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Modification des Coordonnées des structures</h1>";
        }
		
		 if($_SESSION['entpied'] == 'majCritere'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Selection critere</h1>";
        }
		
		if($_SESSION['entpied'] == 'majCritere2'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
			$libelleCrit=$pdo->get_ResArticle_Critere($_SESSION['majcritere']);
            echo "<h1>".$libelleCrit['LIBELLE_CRITERE']."</h1>";
        }
		if($_SESSION['entpied'] == 'creation'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>"  />
			</div>
			<?php
            echo "<h1>Création</h1>";
        }
		if($_SESSION['entpied'] == 'choix_audit'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Choix d'une inspection</h1>";
        }
		
		if($_SESSION['entpied']=='modifArticle'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>"  />
			</div>
			<?php
            echo "<h1>Réglementation</h1>";
        }
		
		if($_SESSION['entpied']=='modifOservation'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Modification des observations</h1>";
        }
		
		if($_SESSION['entpied']=='modifProposition'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Modification des Propositions</h1>";
        }
		
		if($_SESSION['entpied']=='modifImage'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Modification de l'image</h1>";
        }
		
		if($_SESSION['entpied'] == 'suppr_audit'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Suppression d'une inspection</h1>";
        }
		if($_SESSION['entpied'] == "coordonees_inspecteur"){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Inspecteur</h1>";
		}
        if($_SESSION['entpied'] == 'partie'){
			?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Choisir une partie</h1>";
        }
		if($_SESSION['entpied'] == 'modif'){ ?>
			<div class="logoCdg">
			<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<?php
            echo "<h1>Modification d'une inspection</h1>";
		}
        if($_SESSION['entpied'] == 'pole') {
			?>
            </br></br>
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
			</form>
			</br></br></br></br></br></br><h1>Choisir un pôle</h1>
            <?php
		}

        if($_SESSION['entpied'] == 'batiment') {
			?>
            </br></br>
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
            </form>
			<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
			</form></br></br></br></br></br></br>
			<h1>Choisir un bâtiment</h1>
            <?php
		}
        if($_SESSION['entpied'] == 'groupelieu') {
			?>
			</br></br>
			
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport " type="submit"><b><u>BATIMENT</u></br><?php echo $_SESSION['batiment']; ?></b></button>
			</form>
			</br></br></br></br></br></br><h1>Choisir un groupe de lieux</h1>
			<?php
		}
        if($_SESSION['entpied'] == 'lieu') {
			?>
			</br></br>
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport " type="submit"><b><u>BATIMENT</u></br><?php echo $_SESSION['batiment']; ?></b></button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>GROUPE DE LIEUX</u></br><?php echo $_SESSION['groupelieu']; ?></b></button>
			</form>
			</br></br></br></br></br></br>
			<h1>Choisir un lieu</h1>
			<?php
		}
		if($_SESSION['entpied'] == 'maj'){
		?>
			<div class="logoCdg">
				<img class="logo" src="<?php echo $path.$infoCentre['LOGO'];?>" sizes="(max-height: 100px)"/>
			</div>
			<h1>Mise à jour</h1>
		<?php
		}
        if($_SESSION['entpied'] == 'theme'){
            ?>
            </br></br>
            <?php
            if($_SESSION['codepartie'] == 1) { 
            ?>	
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u> </br><?php echo $_SESSION['partie']; ?></b></button>
				</form></br>
            <?php
			}
            else { 
            ?>	
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>BATIMENT</u></br><?php echo $_SESSION['batiment']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>GROUPE DE LIEUX</u></br><?php echo $_SESSION['groupelieu']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>LIEU</u></br><?php echo $_SESSION['lieu']; ?></b></button>
				</form>
            <?php
			}
            ?>
			</br></br></br></br></br></br><h1>Choisir un thème</h1>
            <?php
        }
        if($_SESSION['entpied'] == 'soustheme'){
            ?>
			</br></br>
            
            <?php
            if($_SESSION['codepartie'] == 1) { ?>
					<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
						<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?> </b></button>
					</form>
					<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "> <b><u>THEME</u></br><?php echo $_SESSION['theme']; ?> </b></button>
					</form>
				<?php	
				}else { ?>
					<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
						<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>BATIMENT</u></br><?php echo $_SESSION['batiment']; ?></b></button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>GROUPE DE LIEUX</u></br><?php echo $_SESSION['groupelieu']; ?></b></button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>LIEU</u></br><?php echo $_SESSION['lieu']; ?></b></button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi "><b><u>THEME</u></br><?php echo $_SESSION['theme']; ?></b></button>
					</form>
					</br></br></br></br>
				<?php
				}?>
				</br></br></br></br></br></br></br></br><h1>Choisir un sous-thème</h1>
            <?php
        }
        if($_SESSION['entpied'] == 'critere'){
            ?>
			</br></br>
            
            <?php
			if($_SESSION['st'] != null){
				$ct = "<form method='POST' action='index.php?uc=".$uc_choix."&action=soustheme&nt=non&aj=non&aft=non&mo=non&sup=non'><button type='submit' class='btn btnMenu btn-primary btnPartie btn-lg-arrondi '><b><u>SOUS THEME</u></br>".$_SESSION['st']."</b></button></form>";
			}
			else{
				$ct = '';
			}
			if($_SESSION['codepartie'] == 1) {?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?> </b></button>
				</form>
				<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>THEME</u></br> <?php echo $_SESSION['theme']; ?> </b></button>
				</form>
				<?php
				echo $ct;
			}else { ?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button class="btn btnMenu btn-primary btnPartie btn-lg-arrondi " type="submit"><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>BATIMENT</u></br><?php echo $_SESSION['batiment']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>GROUPE DE LIEUX</u></br><?php echo $_SESSION['groupelieu']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>LIEU</u></br><?php echo $_SESSION['lieu']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi "><b><u>THEME</u></br><?php echo $_SESSION['theme']; ?></b></button>
					</form>
				<?php echo $ct;
				echo "</br></br></br></br></br>";
			}
			echo "</br></br></br></br></br></br></br><h1>Choisir un critère</h1>";
        }
        if($_SESSION['entpied'] == 'observation'){
            ?>
			</br></br>
            
            <?php
			if($_SESSION['st'] != null){
				$ct = "<form method='POST' action='index.php?uc=".$uc_choix."&action=soustheme&nt=non&aj=non&aft=non&mo=non&sup=non'><button type='submit' class='btn btnMenu btn-primary btnPartie btn-lg-arrondi '><b><u>SOUS THEME</u></br>".$_SESSION['st']."</b></button></form>";
			}
			else{
				$ct = '';
			}
			if($_SESSION['codepartie'] == 1) {?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?> </b></button>
				</form>
				<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>THEME</u></br> <?php echo $_SESSION['theme']; ?> </b></button>
				</form>
				<?php
				echo $ct;
				?>
				<form method="POST" action="index.php?uc=organisationnel&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>CRITERE</u></br> <?php echo $_SESSION['critere']; ?> </b></button>
				</form>
				<?php
			}else { ?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>BATIMENT</u></br><?php echo $_SESSION['batiment']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>GROUPE DE LIEUX</u></br><?php echo $_SESSION['groupelieu']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>LIEU</u></br><?php echo $_SESSION['lieu']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi "><b><u>THEME</u></br><?php echo $_SESSION['theme']; ?></b></button>
				</form>
				<?php echo $ct;
				?>
				<form method="POST" action="index.php?uc=sursite&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi "><b><u>CRITERE</u></br><?php echo $_SESSION['critere']; ?></b></button>
				</form>
				</br></br></br></br></br>
				<?php
			}
			
			echo "</br></br></br></br></br></br></br><h1>Observations</h1>";
        }
        if($_SESSION['entpied'] == 'article'){
            ?>
            <h1>Résumé de la réglementation du critère : <br/>"<?php echo $_SESSION['libcritere']; ?>"</h1>
            <?php
        }
        if($_SESSION['entpied'] == 'preconisation'){
            ?>
            </br></br>
            <?php
            if($_SESSION['st'] != null){
				$ct = "<form method='POST' action='index.php?uc=".$uc_choix."&action=soustheme&nt=non&aj=non&aft=non&mo=non&sup=non'><button type='submit' class='btn btnMenu btn-primary btnPartie btn-lg-arrondi '><b><u>SOUS THEME</u></br>".$_SESSION['st']."</b></button></form>";
			}
			else{
				$ct = '';
			}
			if($_SESSION['codepartie'] == 1) {?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?> </b></button>
				</form>
				<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "> <b><u>THEME</u></br><?php echo $_SESSION['theme']; ?> </b></button>
				</form>
				<?php
				echo $ct;
				?>
				<form method="POST" action="index.php?uc=organisationnel&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>CRITERE</u></br> <?php echo $_SESSION['critere']; ?> </b></button>
				</form>
				<?php
			}else { ?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>PARTIE</u></br><?php echo $_SESSION['partie']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>POLE</u></br><?php echo $_SESSION['pole']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>BATIMENT</u></br><?php echo $_SESSION['batiment']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-primary btnPartie btn-lg-arrondi "><b><u>GROUPE DE LIEUX</u></br><?php echo $_SESSION['groupelieu']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi btn-rapport "><b><u>LIEU</u></br><?php echo $_SESSION['lieu']; ?></b></button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi "><b><u>THEME</u></br><?php echo $_SESSION['theme']; ?></b></button>
				</form>
				<?php echo $ct;
				?>
				<form method="POST" action="index.php?uc=sursite&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button type="submit" class="btn btnMenu btn-danger btnPartie btn-lg-arrondi "> <b><u>CRITERE</u></br><?php echo $_SESSION['critere']; ?></b> </button>
				</form>
				</br></br></br></br></br>
            <?php
            }
			echo "</br></br></br></br></br></br></br><h1>Proposition</h1>";
        }
    ?>
</header>
<hr>