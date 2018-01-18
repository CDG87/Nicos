<?php
include("include/entete.php");
?>
<form method="POST" action="index.php?uc=maj&action=modifImage">
	<table>
        <tr>
            <td>
                <div class="container_obs">
                    <input type="file" name="image" id="photoprise" class="btn btn-default" >
                </div>
            </td>
            <td>
				<?php if($image==-1){
					echo '<h1><i class="fa fa-camera fa-4x" aria-hidden="true"></i></h1>';
				}else{ ?>
					<img src="<?php echo "./images/".$image['LIBELLE_IMAGE_CRITERE']?>" />
			<?php	}
                ?>
            </td>
        </tr>
	</table>
	<input type='submit' value='Modifier' name='modifier' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment modifier cette image ?"));'/>
	<button type="submit" class="btn btn-default" name="retour">Retour</button>
</form>