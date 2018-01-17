<?php
	include("include/entete.php");
?>
	<form method="post" name="choix_modif_suppr_inspecteur" action="index.php?uc=maj&action=modif_coordonees_inspecteur">
		
		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
		<div class="form-group">
			<label class="col-sm-3" for="lst_controleur">Contrôleur : </label>
			<div class="col-sm-4">
				<select class="form-control" name="lst_controleur" autofocus onchange="submit()">
					<option value="" disabled selected>Choisir...</option>
					<?php 
					foreach($lesControleurs as $unControleur) {
						if($_SESSION['modifInspect']==$unControleur['NUM_CONTROLEUR']){ ?>
							<option value="<?php echo $unControleur['NUM_CONTROLEUR'];?>" selected="selected"><?php echo $unControleur['PRENOM_CONTROLEUR'] . ' ' . $unControleur['NOM_CONTROLEUR']; ?></option>
							<?php
						}else { ?>
							<option value="<?php echo $unControleur['NUM_CONTROLEUR'];?>"><?php echo $unControleur['PRENOM_CONTROLEUR'] . ' ' . $unControleur['NOM_CONTROLEUR']; ?></option>
						<?php
						}
					}
				?>
				
				</select>
			</div> 
			<br/><br/><br/><br/>

					<h3>Coordonnées inspecteur</h3><br/>
					<label class="col-sm-3" for="nom_inspecteur">Nom : * </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="nom_inspecteur" value="<?php  if(isset($_POST['lst_controleur'])){echo $controleur['NOM_CONTROLEUR'];} ?>" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="prenom_inspecteur">Prénom : * </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="prenom_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['PRENOM_CONTROLEUR'];} ?>"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fonction_inspecteur">Fonction : * </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="fonction_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['FONCTION_CONTROLEUR'];} ?>"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="affectation_inspecteur">Affectation : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="affectation_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['AFFECTATION_CONTROLEUR'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="centre_inspecteur">Centre : * </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="centre_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['CENTRE_CONTROLEUR'];} ?>" required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="adresse_inspecteur">Adresse du centre : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="adresse_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['ADRESSE_CONTROLEUR'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_fixe_inspecteur">Téléphone fixe : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="tel_fixe_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['TEL_FIXE_CONTROLEUR'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_portable_inspecteur">Téléphone portable : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="tel_portable_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['TEL_MOBILE_CONTROLEUR'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fax_inspecteur">Fax : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="fax_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['FAX_CONTROLEUR'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="email_inspecteur">E-mail : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="email_inspecteur" value="<?php if(isset($_POST['lst_controleur'])){echo $controleur['EMAIL_CONTROLEUR'];} ?>" />
					</div>

					<br/><br/> <br/><br/>
					<table><tr><td>
					<input <?php echo $dispo; ?> class="btn btn-default" type="submit" name="modifier_inspecteur" value="Modifier" onclick='return(confirm("Voulez-vous vraiment modifier cet inspecteur ?"));' /></td>
					<td><input <?php echo $dispo; ?> class="btn btn-default" type="submit" name="supprimer_inspecteur" value="Supprimer" onclick='return(confirm("Voulez-vous vraiment supprimer cet inspecteur ?"));' /></td>
				</div>
			</div>
		</div>
	</form>
	<td>
	<form method="POST" action="index.php?uc=maj&action=coordonees_inspecteur">
		<button type="submit" class="btn btn-default" autofocus>Retour</button>
	</form>
	</td></tr></table>