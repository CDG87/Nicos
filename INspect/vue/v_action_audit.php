<?php
	include("include/entete.php");
	
	
	$a=0;
	$b=0;
	foreach($listeAudit as $audit){
		if($audit['LIBELLE_AUDIT']=="Inspection"){
			$a++;
		}else{
			$b++;
		}
	}
	if($_SESSION['isAdmin']==1){
		if($listeAudit == null){
			
			$cachechoi = 'disabled="disabled"';
		}
		else{
			$cachechoi = '';
		}
	}else{
		if($listeAudit == null || ($a==0 && $b>0)){
			
			$cachechoi = 'disabled="disabled"';
		}
		else{
			$cachechoi = '';
		}
	}
	
	
	if($pdo->nb_inspecteur()["NbControlleur"]<1 || $pdo->nb_structure()["NbStructure"]<1){
		$creation = 'disabled="disabled"';;
	}else{
		$creation = '';
	}
?>

<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">


<table>
    <tr>
        <td class="espart">
            <form method="post" action="index.php?uc=creation&action=new_audit&act_creation=creer">
                <button type="submit" class="btn btn-warning btn-partie" name="new_audit" <?php echo $creation; ?>>Créer un rapport</button>
            </form>
        </td>
        <td class="espart">
		
		<form method="post" action="index.php?uc=creation&action=donnees_ancien_audit&act_creation=choix">
			<button type="submit" class="btn btn-warning btn-partie" name="choix_audit" <?php echo $cachechoi; ?> >Choisir un rapport</button>
		</form>
        </td>
    </tr>
	<tr>
		<td class="espart">
			<form method="post" action="index.php?uc=creation&action=suppr_audit&act_creation=suppr">
				<button type="submit" class="btn btn-info btn-partie" name="suppr_audit" <?php echo $cachechoi; ?> >Supprimer un rapport</button>
			</form>
		</td>

		<td class="espart">
			<form method="post" action="index.php?uc=creation&action=maj">
				<button type="submit" class="btn btn-danger btn-partie" name="maj" autofocus>Mise à jour</button>
			</form>
		</td>
	</tr>
</table>	

	</div>
</div>

		