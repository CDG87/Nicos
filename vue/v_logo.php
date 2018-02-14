<?php
	include("include/entete.php")
?>

	<form method="post" name="choix_modif_suppr_inspecteur" action="index.php?uc=maj&action=modif_logo">
		<label class="col-sm-3" for="nom_inspecteur">Logo : * </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" name="logo" placeholder="exemple.jpg" value="<?php  echo $infoCentre['LOGO']; ?>" required />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Entete du rapport (pour un retour à la ligne insérer un #) : * </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" placeholder="Ex : Pôle Santé # Service Prévention" name="entete" value="<?php  echo $infoCentre['ENTETE']; ?>" required />
					</div>
					<br/><br/></br>
					<label class="col-sm-3" for="nom_inspecteur">Nom : * </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" placeholder="Ex : Centre de Gestion de la Fonction Publique Territoriale" name="nom" value="<?php  echo $infoCentre['NOM']; ?>" required />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Adresse : * </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" placeholder="Ex : 39 Rue François Perrin" name="adresse" value="<?php  echo $infoCentre['ADRESSE']; ?>" required />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">CP : * </label>
					<div class="col-sm-4">
						<input type="number"  class="form-control form-control2" placeholder="Ex : 87000" name="cp" value="<?php  echo $infoCentre['CP']; ?>" required />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Ville : * </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" name="ville" placeholder="Ex : Limoges" value="<?php  echo $infoCentre['VILLE']; ?>"  required />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Tel : * </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" name="tel" placeholder="Ex : 0612345678" value="<?php  echo $infoCentre['TEL']; ?>" required />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Fax :  </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" name="fax" placeholder="Ex : 0512345678" value="<?php  echo $infoCentre['FAX']; ?>"  />
					</div>
					<br/><br/>
					<label class="col-sm-3" for="nom_inspecteur">Site :  </label>
					<div class="col-sm-4">
						<input  class="form-control form-control2" name="site" placeholder="Ex : http://www.exemple.com" value="<?php  echo $infoCentre['SITE']; ?>"  />
					</div>
					<br/><br/>
					<input class="btn btn-default" type="submit" name="modifier" value="Modifier" onclick='return(confirm("Voulez-vous vraiment modifier les informations du centre ?"));' /></td>
					<button type="submit" class="btn btn-default" >Retour</button>
	</form>