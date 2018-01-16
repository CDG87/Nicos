<?php
	include("include/entete.php");
?>
	<form method="post" name="choix_modif_suppr_inspecteur" action="index.php?uc=maj&action=modif_coordonees_structure">
		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
		<div class="form-group">
			<label class="col-sm-3" for="lst_controleur">Structure : </label>
			<div class="col-sm-4">
				
                        <input class="form-control" required="required" type="text" id="nom_structure" name="nom_structure" value="<?php if($_SESSION['modifStructure']!=""){ echo $_SESSION['nomStructure'];} ?>" /> 
					<?php
						$liste = $pdo->get_Structures_total();
					?>
					
					<script>
							
								var liste = <?php echo json_encode($liste); ?>;
								$("#nom_structure").autocomplete({
									source : liste,
									autoFocus:true								
								});
								
								
					</script>

			</div> 
			<br/><br/><br/><br/>
			
			
			<input type="submit" class="btn" name="choix" value="choisir"> </input>
			
			
			<?php if($_SESSION['modifStructure']!=""){ ?>
					<h3>Coordonnées Structure</h3><br/>
					
					
					<label class="col-sm-3" for="nom_inspecteur">Type : * </label>
					<div class="col-sm-4">
						<select class="form-control" name="lst_structure" autofocus required>
							<?php 
							foreach($lesTypesStructures as $unTypeStructure) {
								if($unTypeStructure['NUM_TYPE_STRUCTURE']==$maStructure['NUM_TYPE_STRUCTURE']){ ?>
									<option selected value="<?php echo $unTypeStructure['NUM_TYPE_STRUCTURE'];?>"><?php echo $unTypeStructure['NOM_TYPE_STRUCTURE']; ?></option>
						<?php		}else{
								?>
									<option value="<?php echo $unTypeStructure['NUM_TYPE_STRUCTURE'];?>"><?php echo $unTypeStructure['NOM_TYPE_STRUCTURE']; ?></option>
								<?php
								}
							}
				?>
				
					</select>
					</div> 
					<br/><br/>
					
					
					
					
					
					<label class="col-sm-3" for="nom_inspecteur">Nom : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="nom_inspecteur" value="<?php  if($_SESSION['modifStructure']!=""){echo $maStructure['NOM_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="prenom_inspecteur">Adresse : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="prenom_inspecteur" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['ADRESSE_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="fonction_inspecteur">Ville : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="fonction_inspecteur" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['VILLE_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="affectation_inspecteur">CP : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="affectation_inspecteur" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['CP_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="centre_inspecteur">Tel : * </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="centre_inspecteur" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['TELEPHONE_STRUCTURE'];} ?>"  />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" for="adresse_inspecteur">Email : </label>
					<div class="col-sm-4">
						<input <?php echo $dispo; ?> class="form-control" name="adresse_inspecteur" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['EMAIL_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
		

					<br/><br/> <br/><br/>
					<table><tr><td>
					<input <?php echo $dispo; ?> class="btn btn-default" type="submit" name="modifier_structure" value="Modifier" /></td>
					<td><input <?php echo $dispo; ?> class="btn btn-default" type="submit" name="supprimer_structure" value="Supprimer" /></td>
				</div>
			</div>
		</div>
	</form>
	<td>
			<?php } ?>
	<form method="POST" action="index.php?uc=maj&action=coordonees_inspecteur">
		<button type="submit" class="btn btn-default" >Retour</button>
	</form>
	</td></tr></table>