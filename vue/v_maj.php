<?php
	include("include/entete.php");
?>


<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
		
		<table>
			<?php if($_SESSION['isAdmin']==1){ ?>
				<tr>
					<td class="espar btnsurr" colspan="3">
						<form method="post" action="index.php?uc=c_maj&action=selectionner_critere">
							<button type="submit" class="btn btn-warning btn-lg" name="select_critere">Sélection du critère</button>
						</form>
					</td>
				</tr>
			<?php } ?>
			
			<tr>
				<td class="espart">
					<form method="post" action="">
						<button type="submit" class="btn btn-warning btn-lg" name="coord_struct">Coordonnées structures</button>
					</form>
				</td>
				<td class="espart">
					<form method="post" action="">
						<button type="submit" class="btn btn-warning btn-lg" name="coord_inspect">Coordonnées inspecteur</button>
					</form>
				</td>
				<td class="espart">
					<form method="post" action="">
						<button type="submit" class="btn btn-warning btn-lg" name="logo_adr">Logo et adresse</button>
					</form>
				</td>
			</tr>

		</table>	

	</div>
</div>
