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
                <h1><i class="fa fa-camera fa-4x" aria-hidden="true"></i></h1>
            </td>
        </tr>
	</table>
	<input type='submit' value='Modifier' name='modifier' class="btn btn-default"/>
</form>