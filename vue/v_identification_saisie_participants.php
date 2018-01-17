		<form method="post" action="index.php?uc=identification&action=enregistrer_participants">	
			<br />
			<br />
			<div class="col-sm-12">
			<table class="table table-bordered">
					
				<thead>
					<tr>
						<th colspan="2">Civilité</th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Fonction</th>
					</tr>
				</thead>
				
				<tbody>
					<?php
						for($i = 0; $i < $_SESSION['nbParticipants']; $i++) { ?>
						<tr>
							
							<?php
							
								if(!isset($_POST['enregistrer'])) { 
								
									if(isset($_POST['civilite'][$i])) { 
										
										if($_POST['civilite'][$i] == 0) { ?>
										
											<td>H <input type="radio" name="civilite[<?php echo $i ?>]" value="0" autofocus checked/></td>
											<td>F <input type="radio" name="civilite[<?php echo $i ?>]" value="1" /></td>
										
										<?php
										}else { ?>
										
											<td>H <input type="radio" name="civilite[<?php echo $i ?>]" value="0" /></td>
											<td>F <input type="radio" name="civilite[<?php echo $i ?>]" value="1" checked /></td>
											
										<?php
										}
									
									}else { ?>
										<td>H <input type="radio" name="civilite[<?php echo $i ?>]" value="0" checked/></td>
										<td>F <input type="radio" name="civilite[<?php echo $i ?>]" value="1" /></td>
									
										<?php
									}
								
								?>
								
									
								
								<?php	
								}
								
							?>
							<td><input required class="form-control" type="text" name="nom[<?php echo $i ?>]" value="<?php echo isset($_POST['btn_enregistrer']) ? $_POST['nom'][$i] : ''?>" autofocus/></td>
							<td><input required class="form-control"type="text" name="prenom[<?php echo $i ?>]" value="<?php echo isset($_POST['btn_enregistrer']) ? $_POST['prenom'][$i] : ''?>" /></td>
							<td>
								<input class="form-control" list="fonctions" name="fonction[<?php echo $i ?>]" value="<?php echo isset($_POST['btn_enregistrer']) ? $_POST['fonction'][$i] : ''?>" />
								<datalist id="fonctions">
									<option value="Assistant de prévention">Assistant de prévention</option>
									<option value="Conseiller de prévention">Conseiller de prévention</option>
									<option value="Maire">Maire</option>
									<option value="Président">Président</option>
									<option value="Premier adjoint">Premier adjoint</option>
								</datalist>
							</td>
						</tr>
				  <?php } ?>
				</tbody>
				
			</table>
			<input class="btn btn-default" type="submit" name="btn_enregistrer" value="Enregistrer" autofocus/>
			</div>
		</form>	
		

	
</div>