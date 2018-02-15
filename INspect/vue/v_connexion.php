<div id="connexion">
<?php 
include("include/entete.php");
?>
	<form class="form-horizontal" action="index.php?uc=connexion&action=valideConnexion" method="post">

		<div class="form-group">
			<label for="login" class="col-sm-3" >Login :</label>
				<div class="col-sm-5">
					<input type="text" name="login" id="login" class="form-control" />
				</div>
		</div>
		
		<div class="form-group">
			<label for="mdp" class="col-sm-3" >Mot de passe :</label>
				<div class="col-sm-5">
					<input type="password" name="mdp" id="mdp" class="form-control" />
				</div>
		</div>

		
		<input type="submit" value="Se connecter" name="connecter" class="btn btn-default" />
	</form>
</div>