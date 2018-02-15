<?php 
$nb1= $pdo->get_nb_valeur_critere_inscrire($_SESSION['audit']);
$nb2= $pdo-> get_nb_valeur_critere_controle_critere($_SESSION['audit']);

if($nb1['nb_valeur']!=0 || $nb2['nb_valeur']!=0){
	$_SESSION['verifMesure']="";
}else{
	$_SESSION['verifMesure']="disabled";
} ?>
<hr />
	<table>
			<tr>
				<form method="post" action="index.php?uc=rapport&action=generer">
					<td><input class="btn btn-generer-rond btn-primary" type="submit" value="Générer rapport" /></td>
				</form>
				<?php if($infosaudit['LIBELLE_AUDIT']=="Inspection"){ ?>
				<form method="post" action="index.php?uc=rapport&action=genererMesure">
					<td><input class="btn btn-generer-rond btn-primary" type="submit" value="Mesures Urgentes" <?php echo $_SESSION['verifMesure']; ?> /></td>
				</form>
				<?php } ?>
			</tr>
		
	</table>
