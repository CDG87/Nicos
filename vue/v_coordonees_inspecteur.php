<?php
	include("include/entete.php");
?>
	<table>
		<tr>
			<td class="espart">
				<form method="post" action="index.php?uc=maj&action=coordonees_inspecteur">
					<button type="submit" class="btn btn-warning btn-partie" name="creer_inspect">Créer</button>
				</form>
			</td>
			<td class="espart">
			
			<form method="post" action="index.php?uc=maj&action=coordonees_inspecteur">
				<button type="submit" class="btn btn-warning btn-partie" name="modif_suppr_inspec">Modifier/Supprimer</button>
			</form>
			</td>
		</tr>
		<tr>
			<form method="POST" action="index.php?uc=maj&action=coordonees_inspecteur">
				<button type="submit" class="btn btn-art btn-primary" name="retour">Retour</button>
			</form>
		</tr>
	</table>