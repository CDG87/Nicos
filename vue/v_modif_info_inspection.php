<!--Modifier action pour aller dans un nouveau controlleur-->
	<?php
	include("include/entete.php");
	$selected='';
	?>
	<form method="post" action="index.php?uc=identification&action=changer_info">
	<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
			
			<!-- Libellé de l'audit -->
			<div class="form-group">
				<h3>Modification de la structure</h3><br/>
				<label class="col-sm-3" for="libelle_audit">Libellé audit :</label>
				<div class="col-sm-4">
					<input class="form-control" list="libelle_audit" name="libelle_audit" value="<?php echo $infosaudit['LIBELLE_AUDIT']; ?>" required />
					<datalist id="libelle_audit">
						<option value="Inspection">Inspection</option>
						<option value="Visite de locaux">Visite de locaux</option>
					</datalist>
				</div>
			</div><br/><br/>
			
			<!-- Type structure -->
			<div class="form-group">
				<label class="col-sm-3" for="type">Type :</label>
				<div class="col-sm-4">
					<select class="form-control" name="lst_type" disabled>
						<?php 
						foreach($lesTypesStructure as $unTypeStructure) {
								if($infostypetructnum['NUM_TYPE_STRUCTURE']==$unTypeStructure['NUM_TYPE_STRUCTURE']){ ?>
									<option value="<?php echo $unTypeStructure['NUM_TYPE_STRUCTURE']; ?>" selected="selected"><?php echo $unTypeStructure['NOM_TYPE_STRUCTURE']; ?></option> <?php
								}else {
							?>
								<option value="<?php echo $unTypeStructure['NUM_TYPE_STRUCTURE']; ?>"><?php echo $unTypeStructure['NOM_TYPE_STRUCTURE']; ?></option>
							<?php
								}
						}
						?>
					</select>
				</div>
			</div><br/><br/>
				<div class="form-group">
					<!-- Nom structure -->			
					<label class="col-sm-3">Nom :</label>
					<div class="col-sm-4">
                        <input class="form-control" required="required" type="text" id="nom_structure" name="nom_structure" value="<?php echo $infosstructnom['NOM_STRUCTURE']; ?>" disabled /> 
					</div>
				</div><br/><br/>

	<div class="form-group">
		<!-- ADRESSE_STRUCTURE -->
		<label class="col-sm-3" for="adresse_structure">Adresse structure :</label>
		<div class="col-sm-4">
			<input class="form-control" required="required" type="text" name="adresse_structure" id="adresse_structure" value="<?php echo $infosstructadresse['ADRESSE_STRUCTURE'];?>" />
		</div>
	</div><br/><br/>


	<div class="form-group">
		<!-- VILLE_STRUCTURE -->
		<label class="col-sm-3" for="ville_structure">Ville structure :</label>
		<div class="col-sm-4">
			<input class="form-control" required="required" type="text" name="ville_structure" id="ville_structure" value="<?php echo $infosstructville['VILLE_STRUCTURE'];?>" />
		</div>
	</div><br/><br/>

	<div class="form-group">
		<!-- CP_STRUCTURE -->
		<label class="col-sm-3" for="cp_structure">Code postal structure:</label>
		<div class="col-sm-4">
			<input class="form-control" required="required" type="text" name="cp_structure" id="cp_structure" value="<?php echo $infosstructcp['CP_STRUCTURE'];?>" />
			
		</div>
	</div><br/><br/>
	
	<div class="form-group">
		<!-- CONTROLEUR -->
		<label class="col-sm-3" for="lst_controleur">Contrôleur : </label>
		<div class="col-sm-4">
			<select class="form-control" name="lst_controleur">
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
	</div><br/><br/>

<div class="form-group">
	<div class="col-sm-10">
		<input class="btn btn-default" type="submit" name="valider_audit" value="Modifier l'audit" />
	</div>
</div>

</form>
<br/>







<div class="form-group">
		
		<br/><br/><br/>
		<h3>Ajout d'un participant</h3><br/>
		<form method="POST" action="index.php?uc=identification&action=participant">
		<table>
		<thead>
			<tr>
				<th colspan="2">Civilité</th>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Fonction</th>
			</tr>
		</thead>
			<tr>
				<td>H <input type="radio" name="newcivilite" value="0" checked /></td>
				<td>F <input type="radio" name="newcivilite" value="1" /></td>
				
				<td><input class="form-control" type="text" name="newnom" required /></td>
				
				
				<td><input class="form-control"type="text" name="newprenom" required /></td>
				
				
				
				<td>
					<input class="form-control" list="fonctions" name="newfonction" required />
					
					<datalist id="fonctions">
						<option value="Assistant de prévention">Assistant de prévention</option>
						<option value="Conseiller de prévention">Conseiller de prévention</option>
						<option value="Maire">Maire</option>
						<option value="Président">Président</option>
						<option value="Premier adjoint">Premier adjoint</option>
					</datalist>
				</td>
				<td>
					<input class="btn btn-default" type="submit" name="ajouter_participant" value="ajouter" />
				</td>
			</tr>
		</table><br/>
		</form>
		<br/><br/><br/>
		
		
		
		
		
		
		<form method="POST" action="index.php?uc=identification&action=participant">
		<h3>Modification d'un participant</h3><br/>
		<label class="col-sm-3" for="participants">Participants :</label>
			<select class="form-control" name="choix_participants_modif">
				<option selected disabled>choisir ...</option>
				<?php foreach($infosparticipant as $unParticipant){ ?>
					<option value="<?php echo $unParticipant['NUM_PARTICIPANT'] ?>"> <?php echo $unParticipant['NOM_FONCTION_PARTICIPANT']." ".$unParticipant['NOM_PARTICIPANT']." ".$unParticipant['PRENOM_PARTICIPANT'] ?></option>
				<?php } ?>
			</select>
		<br/>
		<table>
		<thead>
			<tr>
				<th colspan="2">Civilité</th>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Fonction</th>
			</tr>
		</thead>
			<tr>
			
				<td>H <input type="radio" name="civilite" value="0" checked /></td>
				<td>F <input type="radio" name="civilite" value="1" /></td>
				
				<td><input class="form-control" type="text" name="nom" required /></td>
				
				
				<td><input class="form-control"type="text" name="prenom"required /></td>
				
				
				
				<td>
					<input class="form-control" list="fonctions" name="fonction" required />
					
					<datalist id="fonctions">
						<option value="Assistant de prévention">Assistant de prévention</option>
						<option value="Conseiller de prévention">Conseiller de prévention</option>
						<option value="Maire">Maire</option>
						<option value="Président">Président</option>
						<option value="Premier adjoint">Premier adjoint</option>
					</datalist>
				</td>
				<td>
					<input class="btn btn-default" type="submit" name="modifier_participant" value="Modifier" />
				</td>
			</tr>
		</table>
		
		</form>
		<br/><br/><br/><br/>
		
		
		
		
		
		
		
		
		<h3>Supression d'un participant</h3><br/>
		
		<form method="POST" action="index.php?uc=identification&action=participant">
		<table>
		<tr>
		<td>
			<select class="form-control" name="lst_participant">
				<option disabled selected>choisir ....</option>
				<?php
					foreach($infosparticipant as $unParticipant){
						?>
						<option value="<?php echo $unParticipant['NUM_PARTICIPANT'] ?>"><?php echo $unParticipant['NOM_FONCTION_PARTICIPANT']." ".$unParticipant['NOM_PARTICIPANT']." ".$unParticipant['PRENOM_PARTICIPANT'] ?></option>
					<?php
					}
				?>
			</select>
		</td>
		<td>
			<input class="btn btn-default" type="submit" name="supprimer_participant" value="Supprimer" />
		</td>
		</tr>
		</table>
		</form>
</div>