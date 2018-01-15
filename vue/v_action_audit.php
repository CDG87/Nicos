<?php
	include("include/entete.php");
    if($listeAudit == null){
        $cachechoi = 'disabled="disabled"';
    }
    else{
        $cachechoi = '';
    }
?>

<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">


<table>
    <tr>
        <td class="espart">
            <form method="post" action="index.php?uc=creation&action=new_audit&act_creation=creer">
                <button type="submit" class="btn btn-warning btn-partie" name="new_audit">Créer inspection</button>
            </form>
        </td>
        <td class="espart">
		
		<form method="post" action="index.php?uc=creation&action=donnees_ancien_audit&act_creation=choix">
			<button type="submit" class="btn btn-warning btn-partie" name="choix_audit" <?php echo $cachechoi; ?> >Choisir inspection</button>
		</form>
        </td>
    </tr>
	<tr>
		<td class="espart">
			<form method="post" action="index.php?uc=creation&action=suppr_audit&act_creation=suppr">
				<button type="submit" class="btn btn-info btn-partie" name="suppr_audit" <?php echo $cachechoi; ?> >Supprimer inspection</button>
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

		