<?php
	include("include/entete.php")
?>

	<form method="post" name="choix_modif_suppr_inspecteur" action="index.php?uc=maj&action=modif_logo">
		<label class="col-sm-3" for="nom_inspecteur">Logo : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="logo" value="<?php  echo $infoCentre['LOGO']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Nom : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="nom" value="<?php  echo $infoCentre['NOM']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Adresse : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="adresse" value="<?php  echo $infoCentre['ADRESSE']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">CP : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="cp" value="<?php  echo $infoCentre['CP']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Ville : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="ville" value="<?php  echo $infoCentre['VILLE']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Tel : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="tel" value="<?php  echo $infoCentre['TEL']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Fax : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="fax" value="<?php  echo $infoCentre['FAX']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Site : * </label>
					<div class="col-sm-4">
						<input  class="form-control" name="site" value="<?php  echo $infoCentre['SITE']; ?>"  />
					</div>
					<br/><br/>
					<input class="btn btn-default" type="submit" name="modifier" value="Modifier" /></td>
					<button type="submit" class="btn btn-default" >Retour</button>
	</form>