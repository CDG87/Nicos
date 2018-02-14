<?php
	include("include/entete.php");
?>
	<form method="post" name="ajouter_inspecteur" action="index.php?uc=maj&action=creer_coordonees_structure">

		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
		<div class="form-group">
					<h3>Coordonnées Structure</h3><br/>
					<label class="col-sm-3" >Type : * </label>
					<div class="col-sm-4">
						<select class="form-control form-control2" name="lst_structure" autofocus required>
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
					
					<label class="col-sm-3" >Nom : * </label>
					<div class="col-sm-4">
						<input required class="form-control form-control2" placeholder="Ex : Mairie" name="nom" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >Adresse : *</label>
					<div class="col-sm-4">
						<input required class="form-control form-control2" placeholder="Ex : 39 Rue François Perrin" name="adresse" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >Ville : *</label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Ex : Limoges" name="ville" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >CP : * </label>
					<div class="col-sm-4">
						<input type="number" placeholder="Ex : 87000" class="form-control form-control2" name="cp" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >Tel : </label>
					<div class="col-sm-4">
						<input placeholder="Ex : 0512345678" class="form-control form-control2" name="tel" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >Email : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Ex : personne@exemple.com" name="mail" />
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
		<button type="submit" name="retour2" class="btn btn-default" autofocus>Retour</button>
	</form>
	</td></tr></table>