<form class="form-horizontal" method="post" action="index.php?uc=identification&action=choix_participants">

	<div class="form-group">
		<!-- ADRESSE_STRUCTURE -->
		<label class="col-sm-3" for="adresse_structure">Adresse structure :</label>
		<div class="col-sm-4">
			<input required class="form-control" required="required" type="text" name="adresse_structure" id="adresse_structure" value="<?php echo $adresseStructure['ADRESSE_STRUCTURE'];?>" />
		</div>
	</div>


	<div class="form-group">
		<!-- VILLE_STRUCTURE -->
		<label class="col-sm-3" for="ville_structure">Ville structure :</label>
		<div class="col-sm-4">
			<input required class="form-control" required="required" type="text" name="ville_structure" id="ville_structure" value="<?php echo $adresseStructure['VILLE_STRUCTURE'];?>" />
		</div>
	</div>

	<div class="form-group">
		<!-- CP_STRUCTURE -->
		<label class="col-sm-3" for="cp_structure">Code postal structure :</label>
		<div class="col-sm-4">
			<input required class="form-control" required="required" type="text" name="cp_structure" id="cp_structure" value="<?php echo $adresseStructure['CP_STRUCTURE'];?>" />
			
		</div>
		
		<input type="submit" class="btn btn-default" name="modifier_adr" value="Modifier l'adresse" />
	</div>
	
	
	
	<div class="form-group">
		<!-- CONTROLEUR -->
		<label class="col-sm-3" for="lst_controleur">Contrôleur : </label>
		<div class="col-sm-4">
			<select class="form-control" name="lst_controleur" onchange="submit()" autofocus>
				<option value="" disabled selected>Choisir...</option>
				<?php 
			
				foreach($lesControleurs as $unControleur) {
					var_dump($_SESSION);
					if($unControleur['NUM_CONTROLEUR'] == $_SESSION['controleur']) { ?>
						<option selected="selected" value="<?php echo $unControleur['NUM_CONTROLEUR'];?>"><?php echo $unControleur['PRENOM_CONTROLEUR'] . ' ' . $unControleur['NOM_CONTROLEUR']; ?></option>
						<?php
					}else { ?>
						<option value="<?php echo $unControleur['NUM_CONTROLEUR'];?>"><?php echo $unControleur['PRENOM_CONTROLEUR'] . ' ' . $unControleur['NOM_CONTROLEUR']; ?></option>
					<?php
					}
				}
			?>
			
			</select>
		</div>
	</div>
</form>

	

















