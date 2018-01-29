<?php
ini_set("display_errors",0);error_reporting(0);
include("include/entete.php");
?>

<form method="POST" action="index.php?uc=maj&action=majBd">
<?php if($_SESSION['isAdmin']==1){ ?>
	<table>
        <tr>
            <td>
                <button type="submit" class="btn btn-warning btn-lg" name="exportBd">Exporter la base de données</button>
            </td>
			 <td>
                <button type="submit" class="btn btn-warning btn-lg" name="importBd">Importer la base de données</button>
            </td>
        </tr>
	</table></br>
<?php } ?>
	<table>
		<tr>
			<td>
				<label >Table : </label>
				<select class="form-control" name="choixTable" onchange="submit()">
					<option selected disabled value="">Choisir ...</option>
					<?php if($_SESSION['choixTable']=='observation'){ ?>
					<option selected value="observation">Observations</option>
					<?php }else{ ?>
					<option value="observation">Observations</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='preconisation'){ ?>
					<option selected value="preconisation">Propositions</option>
					<?php }else{ ?>
					<option value="preconisation">Propositions</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='resume_article'){ ?>
					<option selected value="resume_article">Articles</option>
					<?php }else{ ?>
					<option value="resume_article">Articles</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='critere'){ ?>
					<option selected value="critere">Criteres</option>
					<?php }else{ ?>
					<option value="critere">Criteres</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='groupe_lieu'){ ?>
					<option selected value="groupe_lieu">Groupes de lieux</option>
					<?php }else{ ?>
					<option value="groupe_lieu">Groupes de lieux</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='image_critere'){ ?>
					<option selected value="image_critere">Images des criteres</option>
					<?php }else{ ?>
					<option value="image_critere">Images des criteres</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='lieu'){ ?>
					<option selected value="lieu">Lieux</option>
					<?php }else{ ?>
					<option value="lieu">Lieux</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='pole'){ ?>
					<option selected value="pole">Poles</option>
					<?php }else{ ?>
					<option value="pole">Poles</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='sous_theme'){ ?>
					<option selected value="sous_theme">Sous-themes</option>
					<?php }else{ ?>
					<option value="sous_theme">Sous-themes</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='theme'){ ?>
					<option selected value="theme">Themes</option>
					<?php }else{ ?>
					<option value="theme">Themes</option>
					<?php } ?>
				</select>
			</td>
		</tr>
		<?php if($verif==1){ ?>
		<tr>
			
			<td>
<script>
	// ajout de la classe JS à HTML
document.querySelector("html").classList.add('js');
 
// initialisation des variables
var fileInput  = document.querySelector( ".input-file" ),  
    button     = document.querySelector( ".input-file-trigger" ),
    the_return = document.querySelector(".file-return");
 
// action lorsque le label est cliqué
button.addEventListener( "click", function( event ) {
   fileInput.focus();
   return false;
});

</script>
		
		
<div class="input-file-container">
  <input class="input-file" id="my-file" type="file" name="fichierBd" value="" onchange="submit()">
  <label for="my-file"  class="fa fa-file input-file-trigger" tabindex="0" > Importer une table (.sql)</label>
</div></td></tr>

		<?php } ?>
			
			<tr>
			<td>
				<button type="submit" name="retour" class="btn btn-default">Retour</button>
				<?php if($_SESSION['isAdmin']==1){ ?>
					<button type="submit" name="exportTable" class="btn btn-default" <?php echo $disabled ?> >Exporter</button>
				<?php } ?>
			</td>
		</tr>
	</table>
	
</form>
	
