<?php
ini_set("display_errors",0);error_reporting(0);
include("include/entete.php");
?>

<form method="POST" action="index.php?uc=maj&action=majBd">
<?php if($_SESSION['isAdmin']==1){ ?>
	<table>
        <tr>
            <td>
                <button type="submit" class="btn btn-warning btn-lg" name="exportBd">Exporter la BD</button>
            </td>
			 <td>
                <button type="submit" class="btn btn-warning btn-lg" name="importBd">Importer la BD</button>
            </td>
        </tr>
	</table></br>
<?php } ?>
	<table>
		<tr>
			<td>
				<label >Table : </label>
				<select class="form-control" name="choixTable" onchange="submit()">
					<option selected disabled value="">choisir ...</option>
					<?php if($_SESSION['choixTable']=='observation'){ ?>
					<option selected value="observation">observations</option>
					<?php }else{ ?>
					<option value="observation">observations</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='preconisation'){ ?>
					<option selected value="preconisation">propositions</option>
					<?php }else{ ?>
					<option value="preconisation">propositions</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='resume_article'){ ?>
					<option selected value="resume_article">articles</option>
					<?php }else{ ?>
					<option value="resume_article">articles</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='critere'){ ?>
					<option selected value="critere">criteres</option>
					<?php }else{ ?>
					<option value="critere">criteres</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='groupe_lieu'){ ?>
					<option selected value="groupe_lieu">groupes de lieux</option>
					<?php }else{ ?>
					<option value="groupe_lieu">groupes de lieux</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='image_critere'){ ?>
					<option selected value="image_critere">images des criteres</option>
					<?php }else{ ?>
					<option value="image_critere">images des criteres</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='lieu'){ ?>
					<option selected value="lieu">lieux</option>
					<?php }else{ ?>
					<option value="lieu">lieux</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='pole'){ ?>
					<option selected value="pole">poles</option>
					<?php }else{ ?>
					<option value="pole">poles</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='sous_theme'){ ?>
					<option selected value="sous_theme">sous-themes</option>
					<?php }else{ ?>
					<option value="sous_theme">sous-themes</option>
					<?php } ?>
					<?php if($_SESSION['choixTable']=='theme'){ ?>
					<option selected value="theme">themes</option>
					<?php }else{ ?>
					<option value="theme">themes</option>
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
  <label for="my-file"  class="fa fa-file input-file-trigger" tabindex="0" > importer une table (.sql)</label>
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
	
