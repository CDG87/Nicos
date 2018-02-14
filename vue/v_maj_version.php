<?php
include("include/entete.php");
?>

<form method="POST" action="index.php?uc=maj&action=version">
	<table>
        <tr>
            <td>
                <div class="container_obs">
					<label>Version : </label>
                    <input type="text" placeholder="1.00" class="form-control" name="version" value="<?php  echo $version[0]; ?>"  />
                </div>
            </td>
        </tr>
	</table>
	<input type='submit' value='Modifier' name='modifier' class="btn btn-default"/>
	<button type="submit" class="btn btn-default" >Retour</button>
</form>
	
