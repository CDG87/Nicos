<?php
include("include/entete.php");
?>
<form method="POST" action="index.php?uc=maj&action=pageMenuCrit">
	<table>
		<tr>
			<td>
				<button type="submit" name="article" class="btn btn-primary btn-lg">Article </br> 
					<div class="btn_date"><?php 
						if($_SESSION['listearticle']['Jour']<10 && $_SESSION['listearticle']['Jour']>0){echo '0';} 
						echo $_SESSION['listearticle']['Jour']; 
						if($_SESSION['listearticle']['Jour']>0){echo '.';} 
						if($_SESSION['listearticle']['Mois']<10 && $_SESSION['listearticle']['Mois']>0){echo '0';} 
						echo $_SESSION['listearticle']['Mois']; 
						if($_SESSION['listearticle']['Jour']>0){echo '.';} 
						echo $_SESSION['listearticle']['Annee']; 
					?></div>
				</button>
			</td>
			<td>
				<button type="submit" name="observation" class="btn btn-primary btn-lg">Observations </br> 
					<div class="btn_date"><?php 
						if($_SESSION['dateMaj']['JourObs']<10 && $_SESSION['dateMaj']['JourObs']>0){echo '0';} 
						echo $_SESSION['dateMaj']['JourObs'];
						if($_SESSION['dateMaj']['JourObs']>0){echo '.';}
						if($_SESSION['dateMaj']['MoisObs']<10 && $_SESSION['dateMaj']['MoisObs']>0){echo '0';} 
						echo $_SESSION['dateMaj']['MoisObs'];
						if($_SESSION['dateMaj']['JourObs']>0){echo '.';}
						echo $_SESSION['dateMaj']['AnneeObs'];
					?></div>
				</button>
			</td>
			<td>
				<button type="submit" name="proposition" class="btn btn-primary btn-lg">Propositions </br> 
					<div class="btn_date"><?php 
						if($_SESSION['dateMaj']['JourProp']<10 && $_SESSION['dateMaj']['JourProp']>0){echo '0';} 
						echo $_SESSION['dateMaj']['JourProp'];
						if($_SESSION['dateMaj']['JourProp']>0){echo '.';}
						if($_SESSION['dateMaj']['MoisProp']<10 && $_SESSION['dateMaj']['MoisProp']>0){echo '0';} 
						echo $_SESSION['dateMaj']['MoisProp'];
						if($_SESSION['dateMaj']['JourProp']>0){echo '.';}
						echo $_SESSION['dateMaj']['AnneeProp'];
					?></div>
				</button>
			</td>
			<td>
				<button type="submit" name="image" class="btn btn-primary btn-lg">Image </br> 
					<div class="btn_date"><?php 
						if($_SESSION['dateMaj']['JourImg']<10 && $_SESSION['dateMaj']['JourImg']>0){echo '0';} 
						echo $_SESSION['dateMaj']['JourImg'];
						if($_SESSION['dateMaj']['JourImg']>0){echo '.';}
						if($_SESSION['dateMaj']['MoisImg']<10 && $_SESSION['dateMaj']['MoisImg']>0){echo '0';} 
						echo $_SESSION['dateMaj']['MoisImg'];
						if($_SESSION['dateMaj']['JourImg']>0){echo '.';}
						echo $_SESSION['dateMaj']['AnneeImg'];
					?></div>
				</button>
			</td>
		</tr>
	</table>
</form>