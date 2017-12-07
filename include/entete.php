<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8" />
	<title>Inspection</title>
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
		<?php if($uc!='creation' && $uc!='identification'){ ?>
		<form method="POST" action="index.php?uc=identification&action=modif_audit&nt=non&aj=non&aft=non&mo=non&sup=non">
			<button type="submit" class="btn btn-default btnMenu glyphicon glyphicon-pencil"> MODIF</button>
		</form>
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
        if($_SESSION['codepartie'] == 1){
            $uc_choix = 'organisationnel';
        }
        else{
            $uc_choix = 'sursite';
        }
        $path="./images/";
        if($_SESSION['entpied'] == 'accueil'){
			?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Bienvenue sur l'application Nicos</h1>";
            echo "<h2>Application pour le référentiel d'inspection</h2>";
        }
		if($_SESSION['entpied'] == 'connexion'){
			?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Connexion</h1>";
        }
        if($_SESSION['entpied'] == 'identification'){
			?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Identification</h1>";
        }
		if($_SESSION['entpied'] == 'creation'){
			?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Création</h1>";
        }
		if($_SESSION['entpied'] == 'choix_audit'){
			?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Choix d'un audit</h1>";
        }
		if($_SESSION['entpied'] == 'suppr_audit'){
			?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Suppression d'un audit</h1>";
        }
        if($_SESSION['entpied'] == 'partie'){
			?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Choisir une partie</h1>";
        }
		if($_SESSION['entpied'] == 'modif'){ ?>
			<div class="logoCdg">
			<img src="<?php echo $path."logo_cdg.jpg"?>" />
			</div>
			<?php
            echo "<h1>Modification de l'audit</h1>";
		}
        if($_SESSION['entpied'] == 'pole') {
			?>
            <h1>Choisir un pôle</h1>
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-info " type="submit">PARTIE</button>
			</form>
            <br/><br/></br><br/><p><?php echo $_SESSION['chem']; ?></p>
            <?php
		}
        if($_SESSION['entpied'] == 'batiment') {
			?>
            <h1>Choisir un bâtiment</h1>
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-info " type="submit">PARTIE</button>
            </form>
			<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-info " type="submit">POLE</button>
			</form>
            <br/><br/></br><br/><p><?php echo $_SESSION['chem']; ?></p>
            <?php
		}
        if($_SESSION['entpied'] == 'groupelieu') {
			?>
			<h1>Choisir un groupe de lieux</h1>
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-info " type="submit">PARTIE</button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-info " type="submit">POLE</button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-info " type="submit">BATIMENT</button>
			</form>
			<br/><br/></br><br/><p><?php echo $_SESSION['chem']; ?></p>
			<?php
		}
        if($_SESSION['entpied'] == 'lieu') {
			?>
			<h1>Choisir un lieu</h1>
			<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button class="btn btnMenu btn-info " type="submit">PARTIE</button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-info " type="submit">POLE</button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-info " type="submit">BATIMENT</button>
			</form>
			<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button class="btn btnMenu btn-info " type="submit">GROUPE DE LIEUX</button>
			</form>
			<br/><br/></br><br/><p><?php echo $_SESSION['chem']; ?></p>
			<?php
		}
        if($_SESSION['entpied'] == 'theme'){
            ?>
            <h1>Choisir un thème</h1>
            <?php
            if($_SESSION['codepartie'] == 1) { 
            ?>	
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-info ">PARTIE</button>
				</form>
            <?php
			}
            else { 
            ?>	
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button class="btn btnMenu btn-info " type="submit">PARTIE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button class="btn btnMenu btn-info " type="submit">POLE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">BATIMENT</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">GROUPE DE LIEUX</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">LIEUX</button>
				</form>
            <?php
			}
            ?>
            <br/><br/></br><br/><p><?php echo $_SESSION['chem']; ?></p>
            <?php
        }
        if($_SESSION['entpied'] == 'soustheme'){
            ?>
            <h1>Choisir un sous-thème</h1>
            <?php
            if($_SESSION['codepartie'] == 1) { ?>
					<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
						<button type="submit" class="btn btnMenu btn-info ">PARTIE </button>
					</form>
					<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-info "> THEME </button>
					</form>
				<?php	
				}else { ?>
					<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
						<button class="btn btnMenu btn-info " type="submit">PARTIE</button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-info ">POLE</button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-info ">BATIMENT</button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-info ">GROUPE DE LIEUX</button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-info ">LIEUX</button>
					</form>
					<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
						<button type="submit" class="btn btnMenu btn-info ">THEME</button>
					</form>
				<?php
				}?>
            <br/><br/></br><br/><p><?php echo $_SESSION['chem']; ?></p>
            <?php
        }
        if($_SESSION['entpied'] == 'critere'){
            ?>
            <h1>Choisir un critère</h1>
            <?php
			if($_SESSION['st'] != null){
				$ct = "<form method='POST' action='index.php?uc=".$uc_choix."&action=soustheme&nt=non&aj=non&aft=non&mo=non&sup=non'><button type='submit' class='btn btnMenu btn-info '> SOUS-THEME </button></form>";
			}
			else{
				$ct = '';
			}
			if($_SESSION['codepartie'] == 1) {?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-info ">PARTIE </button>
				</form>
				<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info "> THEME </button>
				</form>
				<?php
				echo $ct;
			}else { ?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-info ">PARTIE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button class="btn btnMenu btn-info " type="submit">POLE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">BATIMENT</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">GROUPE DE LIEUX</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">LIEUX</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">THEME</button>
					</form>
				<?php echo $ct;
			}		
			echo '<br/><br/></br><br/><p>'.$_SESSION['chem'].'</p>';
        }
        if($_SESSION['entpied'] == 'observation'){
            ?>
            <h1>Observations</h1>
            <?php
			if($_SESSION['st'] != null){
				$ct = "<form method='POST' action='index.php?uc=".$uc_choix."&action=soustheme&nt=non&aj=non&aft=non&mo=non&sup=non'><button type='submit' class='btn btnMenu btn-info '> SOUS-THEME </button></form>";
			}
			else{
				$ct = '';
			}
			if($_SESSION['codepartie'] == 1) {?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-info ">PARTIE </button>
				</form>
				<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info "> THEME </button>
				</form>
				<?php
				echo $ct;
				?>
				<form method="POST" action="index.php?uc=organisationnel&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info "> CRITERE </button>
				</form>
				<?php
			}else { ?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-info ">PARTIE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">POLE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">BATIMENT</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">GROUPE DE LIEUX</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">LIEUX</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">THEME</button>
				</form>
				<?php echo $ct;
				?>
				<form method="POST" action="index.php?uc=sursite&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info "> CRITERE </button>
				</form>
				<?php
			}		
            echo '<br/><br/></br><br/><p>'.$_SESSION['chem'].'</p>';
        }
        if($_SESSION['entpied'] == 'article'){
            ?>
            <h1>Résumé d'articles du critère : <br/>"<?php echo $_SESSION['libcritere']; ?>"</h1>
            <?php
        }
        if($_SESSION['entpied'] == 'preconisation'){
            ?>
            <h1>Préconisation</h1>
            <?php
            if($_SESSION['st'] != null){
				$ct = "<form method='POST' action='index.php?uc=".$uc_choix."&action=soustheme&nt=non&aj=non&aft=non&mo=non&sup=non'><button type='submit' class='btn btnMenu btn-info '> SOUS-THEME </button></form>";
			}
			else{
				$ct = '';
			}
			if($_SESSION['codepartie'] == 1) {?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
				<button type="submit" class="btn btnMenu btn-info ">PARTIE </button>
				</form>
				<form method="POST" action="index.php?uc=organisationnel&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info "> THEME </button>
				</form>
				<?php
				echo $ct;
				?>
				<form method="POST" action="index.php?uc=organisationnel&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info "> CRITERE </button>
				</form>
				<?php
			}else { ?>
				<form method="POST" action="index.php?uc=audit&action=partie&nt=non">
					<button type="submit" class="btn btnMenu btn-info ">PARTIE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">POLE</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">BATIMENT</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">GROUPE DE LIEUX</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">LIEUX</button>
				</form>
				<form method="POST" action="index.php?uc=sursite&action=theme&nt=non&aj=non&aft=non&mo=non&sup=non">
					<button type="submit" class="btn btnMenu btn-info ">THEME</button>
				</form>
				<?php echo $ct;
				?>
				<form method="POST" action="index.php?uc=sursite&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non">
				<button type="submit" class="btn btnMenu btn-info "> CRITERE </button>
				</form>
            <?php
            }
            echo "<div class='chemin'><br/><br/></br><br/><p>".$_SESSION['chem']."</p></div>";
        }
    ?>
    <hr/>
</header>