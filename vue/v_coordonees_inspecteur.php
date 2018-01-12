<?php
	include("include/entete.php");
	$choix=1;
?>

<?php if(isset($_POST['creer_inspect'])){ 
	$choix=0; ?>
	<form method="post" name="ajouter_inspecteur" action="index.php?uc=maj&action=coordonees_inspecteur">

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
						<input class="form-control" name="centre_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="adresse_inspecteur">Adresse du centre : </label>
					<div class="col-sm-4">
						<input class="form-control" name="adresse_inspecteur" />
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
<?php } ?>


<?php if(isset($_POST['modif_suppr_inspec'])){ 
	$choix=0; 
	$dispo = "disabled"; ?>
	<form method="post" name="choix_modif_suppr_inspecteur" action="index.php?uc=maj&action=coordonees_inspecteur">
		
		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
		<div class="form-group">
			<label class="col-sm-3" for="lst_controleur">Contrôleur : </label>
			<div class="col-sm-4">
				<select class="form-control" name="lst_controleur"  onchange="submit()" autofocus>
					<?php 
					foreach($lesControleurs as $unControleur) {
						if($infoscontrolnum['NUM_CONTROLEUR']==$unControleur['NUM_CONTROLEUR']){ ?>
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
						<input disabled=$dispo class="form-control" name="nom_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="prenom_inspecteur">Prénom : * </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="prenom_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fonction_inspecteur">Fonction : * </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="fonction_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="affectation_inspecteur">Affectation : </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="affectation_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="centre_inspecteur">Centre : * </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="centre_inspecteur"required />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="adresse_inspecteur">Adresse du centre : </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="adresse_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_fixe_inspecteur">Téléphone fixe : </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="tel_fixe_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="tel_portable_inspecteur">Téléphone portable : </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="tel_portable_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fax_inspecteur">Fax : </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="fax_inspecteur" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="email_inspecteur">E-mail : </label>
					<div class="col-sm-4">
						<input disabled=$dispo class="form-control" name="email_inspecteur" />
					</div>

					<br/><br/> <br/><br/>
					<table><tr><td>
					<input disabled=$dispo class="btn btn-default" type="submit" name="modifier_inspecteur" value="Modifier" /></td>
					<td><input class="btn btn-default" type="submit" name="supprimer_inspecteur" value="Supprimer" /></td>
				</div>
			</div>
		</div>
	</form>
	<td>
	<form method="POST" action="index.php?uc=maj&action=coordonees_inspecteur">
		<button type="submit" class="btn btn-default" autofocus>Retour</button>
	</form>
	</td></tr></table>
<?php } ?>


<?php if($choix==1){ ?>
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
	</table>
<?php } ?>