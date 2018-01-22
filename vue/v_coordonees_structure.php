<?php
	include("include/entete.php");
?>
	<table>
		<tr>
			<td class="espart">
				<form method="post" action="index.php?uc=maj&action=coord_struct">
					<button type="submit" class="btn btn-warning btn-partie" name="creer_struct">Créer</button>
				</form>
			</td>
			<td class="espart">
			
			<form method="post" action="index.php?uc=maj&action=coord_struct">
				<button type="submit" class="btn btn-warning btn-partie" name="modif_suppr_struct">Modifier/Supprimer</button>
			</form>
			</td>
		</tr>
		<tr>
			<td>
				<form method="POST" action="index.php?uc=maj&action=coord_struct">
					<button type="submit" class="btn btn-art btn-primary" name="retour">Retour</button>
				</form>
			</td>
		</tr>
	</table>