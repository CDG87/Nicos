<?php
	include("include/entete.php");
?>
	<form method="post" name="ajouter_inspecteur" action="index.php?uc=maj&action=creer_coordonees_inspecteur">

		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
		<div class="form-group">
					<h3>Coordonnées inspecteur</h3><br/>
					<label class="col-sm-3" for="nom_inspecteur">Nom : * </label>
					<div class="col-sm-4">
						<input class="form-control" name="nom_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="prenom_inspecteur">Prénom : * </label>
					<div class="col-sm-4">
						<input class="form-control" name="prenom_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fonction_inspecteur">Fonction : * </label>
					<div class="col-sm-4">
						<input class="form-control" name="fonction_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="affectation_inspecteur">Affectation : </label>
					<div class="col-sm-4">
						<input class="form-control" name="affectation_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="centre_inspecteur">Centre : * </label>
					<div class="col-sm-4">
						<input class="form-control" name="centre_inspecteur" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="adresse_inspecteur">Adresse du centre : * </label>
					<div class="col-sm-4">
						<input class="form-control" name="adresse_inspecteur" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_fixe_inspecteur">Téléphone fixe : </label>
					<div class="col-sm-4">
						<input class="form-control" name="tel_fixe_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_portable_inspecteur">Téléphone portable : </label>
					<div class="col-sm-4">
						<input class="form-control" name="tel_portable_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fax_inspecteur">Fax : </label>
					<div class="col-sm-4">
						<input class="form-control" name="fax_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="email_inspecteur">E-mail : </label>
					<div class="col-sm-4">
						<input class="form-control" name="email_inspecteur" />
					</div>

					<br/><br/> <br/><br/>
					<table><tr><td>
					<input class="btn btn-default" type="submit" name="enregistrer_inspecteur" value="Valider" /></td>
				</div>
			</div>
		</div>
	</form>
	<td>
	<form method="POST" action="index.php?uc=maj&action=coordonees_inspecteur">
		<button type="submit" class="btn btn-default" autofocus>Retour</button>
	</form>
	</td></tr></table>