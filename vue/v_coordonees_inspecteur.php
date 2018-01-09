<?php
	include("include/entete.php");
?>

<form method="post" action="">

	<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
	<div class="form-group">
				<h3>Modification de la structure</h3><br/>
				<label class="col-sm-3" for="libelle_audit">Libellé audit :</label>
				<div class="col-sm-4">
					<input class="form-control" list="libelle_audit" name="libelle_audit" value="<?php echo $infosaudit['LIBELLE_AUDIT']; ?>" required />
				</div>
	</div>
	</div>
	</div>
</form>