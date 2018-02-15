<?php
	include("include/entete.php");
?>
	<form method="post" action="index.php?uc=maj&action=modif_coordonees_structure">
		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
		<div class="form-group">
			<label class="col-sm-3" >Structure : </label>
			<div class="col-sm-4">
				
                        <input required class="form-control form-control2" placeholder="Rechercher..." type="text" id="nom_structure" name="nom_structure" value="<?php if($_SESSION['modifStructure']!=""){ echo $_SESSION['nomStructure'];} ?>" /> 
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
			
			
			<input type="submit" class="btn btn-default" name="choix" value="Choisir"> </input>
			
			
			<?php if($_SESSION['modifStructure']!=""){ ?>
					<h3>Coordonnées Structure</h3><br/>
					
					
					<label class="col-sm-3" >Type : * </label>
					<div class="col-sm-4">
						<select class="form-control form-control2" name="lst_structure" autofocus required>
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
					
					
					
					
					
					<label class="col-sm-3" >Nom : *</label>
					<div class="col-sm-4">
						<input required class="form-control form-control2" placeholder="Ex : Mairie" name="nomStructure" value="<?php  if($_SESSION['modifStructure']!=""){echo $maStructure['NOM_STRUCTURE'];} ?>"/>
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >Adresse : * </label>
					<div class="col-sm-4">
						<input required class="form-control form-control2" placeholder="Ex : 39 Rue François Perrin" name="adresseStructure" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['ADRESSE_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >Ville : * </label>
					<div class="col-sm-4">
						<input required class="form-control form-control2"  name="villeStructure" placeholder="Ex : Limoges" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['VILLE_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >CP : * </label>
					<div class="col-sm-4">
						<input required type="number" placeholder="Ex : 87000" class="form-control form-control2" name="cpStructure" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['CP_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
					
					<label class="col-sm-3">Tel : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Ex : 0512345678" name="telStructure" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['TELEPHONE_STRUCTURE'];} ?>"  />
					</div>
					<br/><br/>
					
					<label class="col-sm-3" >Email : </label>
					<div class="col-sm-4">
						<input class="form-control form-control2" placeholder="Ex : personne@exemple.com" name="mailStructure" value="<?php if($_SESSION['modifStructure']!=""){echo $maStructure['EMAIL_STRUCTURE'];} ?>" />
					</div>
					<br/><br/>
		

					<br/><br/> <br/><br/>
					<table><tr><td>
					<input class="btn btn-default" type="submit" name="modifier_structure" value="Modifier" onclick='return(confirm("Voulez-vous vraiment modifier cette structure ?"));' /></td>
					<td><input class="btn btn-default" type="submit" name="supprimer_structure" value="Supprimer" onclick='return(confirm("Voulez-vous vraiment supprimer cette structure ?"));' /></td>
				</div>
			</div>
		</div>
	<?php } ?>
	<td>
			
			</form>
			<form method="post" action="index.php?uc=maj&action=modif_coordonees_structure">
				<button type="submit" name="retour" class="btn btn-default" >Retour</button>
			</form>
	</td></tr></table>