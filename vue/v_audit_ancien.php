<?php
	include("include/entete.php");
?>

<div class="row">

<?php
		
	if(isset($_POST['choix_audit']) || isset($_POST['lst_audit'])) { ?>
	<form class="form-horizontal" method="post" action="index.php?uc=creation&action=donnees_ancien_audit">
		<div class="form-group">
		
		<label class="col-sm-3" for="lst_audit">Audits : </label>
		<div class="col-sm-4">
			<select class="form-control" name="lst_audit" onchange="submit()">
				<option value="" disabled selected>Choisir...</option>
				<?php
				$i =0;
				foreach($lesAudits as $unAudit) {
					if($numAuditSelection == $unAudit['NUM_AUDIT']) { ?>
						<option selected="selected" value="<?php echo $unAudit['NUM_AUDIT'];?>"><?php echo $unAudit['LIBELLE_AUDIT'] . ' à ' . $mesStructures[$i]; ?></option>
					<?php	
					}else { ?>
						<option value="<?php echo $unAudit['NUM_AUDIT'];?>"><?php echo $unAudit['LIBELLE_AUDIT'] . ' à ' . $mesStructures[$i]; ?></option>
					<?php
					}

				$i = $i+1;
				}
				?>
			
			</select>
		</div>
		</div>


		<?php
			//Si une date a été choisie
			if(isset($_POST['lst_audit'])) { ?>					
				<table>
					<tr>
						<td class="espart">
							<button type="submit" class="btn btn-primary" name="continuer_inspecter">Continuer l'inspection</button> <!-- Cas pause déjeuner -->
						</td>
						
						<td class="espart">
							<button type="submit" class="btn btn-primary" name="add_new_date">Ajouter une date</button> <!-- Cas autre jour d'inspection -->
						</td>
					</tr>
				</table>
			<?php
			}
	}
			
	?>
	</form>


	<?php
	if(isset($_POST['add_new_date'])) { ?>
			<form class="form-horizontal" method="post" action="index.php?uc=audit&action=partie&nt=non&insert_date=true">
				<div class="form-group">
					<label for="date_audit" class="col-sm-3" >Date de l'audit :</label>
						<div class="col-sm-4">
							<input type="date" name="date_audit" id="date_audit" class="form-control" />
						</div>
					
						<div class="col-sm-4">
							<button type="submit" class="btn btn-default" name="revenir_inspecter">Revenir à l'inspection</button>
						</div>
				</div>
			</form>
	<?php
	}
	
	if(isset($_POST['continuer_inspecter'])) {
            header("Location: index.php?uc=audit&action=partie&nt=non");

		
	}
	
	

	?>
				

</div>	
	
