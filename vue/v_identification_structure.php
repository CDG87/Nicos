<?php
	include("include/entete.php");
?>
	<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
			
			<form class="form-horizontal" method="post" action="index.php?uc=identification&action=choix_structure">
			<!-- Libellé de l'audit -->
			<div class="form-group">
				<?php if($_SESSION['isAdmin']==1){ ?>
					<label class="col-sm-3" for="libelle_audit">Libellé intervention :</label>
					<div class="col-sm-4">
						
					<input class="form-control" list="libelle_audit" name="libelle_audit" value="<?php echo isset($_POST['lst_type']) || isset($_SESSION['controleur']) ? $_SESSION['libelle_audit'] : ''?>" />
						<datalist id="libelle_audit">
							<option value="Inspection">Inspection</option>
							<option value="Visite de locaux">Visite de locaux</option>
						</datalist>
					</div>
				<?php }else{ ?>
					<label class="col-sm-3" for="libelle_audit">Libellé intervention :</label>
					<div class="col-sm-4">
						
					<input class="form-control" list="libelle_audit" name="libelle_audit" value="Inspection" disabled />
					</div>
				<?php } ?>
			</div>
			
			<!-- Type structure -->
			<div class="form-group">
				<label class="col-sm-3" for="type">Structure :</label>
				<div class="col-sm-4">
				<select class="form-control" name="lst_type" onchange="submit()">
					<option value="" disabled selected>Choisir...</option>
				<?php 
					foreach($lesTypesStructure as $unTypeStructure) { 
				
						if($unTypeStructure['NUM_TYPE_STRUCTURE'] == $numTypeStructureSelection) {
							
							?>
							
							<option selected="selected" value="<?php echo $unTypeStructure['NUM_TYPE_STRUCTURE']; ?>"><?php echo $unTypeStructure['NOM_TYPE_STRUCTURE']; ?></option>
							
							<?php
							
								$numTypeStructureSelection = $unTypeStructure['NUM_TYPE_STRUCTURE'];
							
						}else {
							?>
							
							<option value="<?php echo $unTypeStructure['NUM_TYPE_STRUCTURE']; ?>"><?php echo $unTypeStructure['NOM_TYPE_STRUCTURE']; ?></option>
							
							<?php
						}
						
					}
					
					?>
				</select>
				</div>
		
			</div>
			<?php
				if($numTypeStructureSelection != "") { ?>
						
					<div class="form-group">
					<!-- Nom structure -->			
					<label class="col-sm-3" for="nom_structure">Nom :</label>
					<div class="col-sm-4">
                        <input class="form-control" required="required" type="text" id="nom_structure" name="nom_structure" value="<?php if(isset($_POST['generer_adr'])){ echo $_POST['nom_structure'];}else{ echo $_SESSION['nom_structure'];} ?>" /> 
					</div>
					<?php
						$liste = $pdo->autocompletion_Nom_Structure("nom_structure", $numTypeStructureSelection);
					?>
					
					<script>
							
								var liste = <?php echo json_encode($liste); ?>;
								$("#nom_structure").autocomplete({
									source : liste,
									autoFocus:true								
								});
								
								
					</script>
						
						<input class="btn btn-default" type="submit" name="generer_adr" value="Générer adresse" />
					
					</div>
			
			</form>
		<?php 
		
		}
		?>