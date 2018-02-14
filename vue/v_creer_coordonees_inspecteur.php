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
						<input class="form-control form-control2" placeholder="Fourgeaud" name="nom_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="prenom_inspecteur">Prénom : * </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Thomas" name="prenom_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fonction_inspecteur">Fonction : * </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Preventeur" name="fonction_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="affectation_inspecteur">Affectation : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Service Prévention" name="affectation_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="centre_inspecteur">Centre : * </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Centre de Gestion" name="centre_inspecteur" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="adresse_inspecteur">Adresse du centre : * </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="39 Rue François Perrin" name="adresse_inspecteur" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_fixe_inspecteur">Téléphone fixe : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="0512345678" name="tel_fixe_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_portable_inspecteur">Téléphone portable : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="0612345678" name="tel_portable_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fax_inspecteur">Fax : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="0512345678" name="fax_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="email_inspecteur">E-mail : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="personne@exemple.fr" name="email_inspecteur" />
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
		<button type="submit" class="btn btn-default" >Retour</button>
	</form>
	</td></tr></table>