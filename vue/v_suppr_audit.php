<?php
	include("include/entete.php");
	
?>

<div class="row">

	<form class="form-horizontal" method="post" action="index.php?uc=creation&action=donnees_suppr_audit">
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
							<button type="submit" class="btn btn-primary" name="suppr_audit" onclick="if(!confirm('Voulez-vous vraiment le supprimer ? ')) return false;">Supprimer l'audit</button>
						</td>
					</tr>
				</table>
			<?php
			}
	
			
	?>
	</form>
</div>	
	
