<?php
	include("include/entete.php");
?>
	<form method="post" name="ajouter_inspecteur" action="index.php?uc=maj&action=creer_coordonees_structure">

		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
		<div class="form-group">
					<h3>Coordonnées Structure</h3><br/>
					<label class="col-sm-3" for="nom_inspecteur">Type : * </label>
					<div class="col-sm-4">
						<select class="form-control" name="lst_structure" autofocus required>
							<option value="" disabled selected>Choisir...</option>
							<?php 
							foreach($lesStructures as $uneStructure) {
								?>
									<option value="<?php echo $uneStructure['NUM_TYPE_STRUCTURE'];?>"><?php echo $uneStructure['NOM_TYPE_STRUCTURE']; ?></option>
								<?php
							}
				?>
				
					</select>
					</div> 
					<br/><br/>
					
					<label class="col-sm-3" for="prenom_inspecteur">Nom : </label>
					<div class="col-sm-4">
						<input class="form-control" name="nom" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fonction_inspecteur">Adresse : </label>
					<div class="col-sm-4">
						<input class="form-control" name="adresse" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="affectation_inspecteur">Ville : *</label>
					<div class="col-sm-4">
						<input class="form-control" name="ville" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="centre_inspecteur">CP : * </label>
					<div class="col-sm-4">
						<input class="form-control" name="cp" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="adresse_inspecteur">Tel : </label>
					<div class="col-sm-4">
						<input class="form-control" name="tel" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_fixe_inspecteur">Email : </label>
					<div class="col-sm-4">
						<input class="form-control" name="mail" />
					</div>
					<br/><br/>
					

					<br/><br/> <br/><br/>
					<table><tr><td>
					<input class="btn btn-default" type="submit" name="enregistrer_structure" value="Valider" /></td>
				</div>
			</div>
		</div>
	</form>
	<td>
	<form method="POST" action="index.php?uc=maj&action=coord_struct">
		<button type="submit" class="btn btn-default" autofocus>Retour</button>
	</form>
	</td></tr></table>