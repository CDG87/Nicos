
<hr />
	<table>
			<tr>
				<form method="post" action="index.php?uc=rapport&action=generer">
					<td><input class="btn btn-art btn-primary" type="submit" value="Générer rapport" /></td>
				</form>
				<?php if($infosaudit['LIBELLE_AUDIT']=="Inspection"){ ?>
				<form method="post" action="index.php?uc=rapport&action=genererMesure">
					<td><input class="btn btn-art btn-primary" id="mesureUrg" type="submit" value="Mesures Urgentes" /></td>
				</form>
				<?php } ?>
			</tr>
		
	</table>
