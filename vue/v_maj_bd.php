<?php
include("include/entete.php");
?>

<form method="POST" action="index.php?uc=maj&action=majBd">
	<table>
        <tr>
            <td>
                <button type="submit" class="btn btn-warning btn-lg" name="select_critere">Exporter la BD</button>
            </td>
			 <td>
                <button type="submit" class="btn btn-warning btn-lg" name="select_critere">Importer la BD</button>
            </td>
        </tr>
	</table>
	<button type="submit" name="retour" class="btn btn-default" >Retour</button>
</form>
	
