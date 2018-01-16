<?php
include("include/entete.php");
$version = $pdo -> get_version();
?>
<table>
    <tr>
        <td>
            <form method='POST' action='index.php?uc=connexion&action=demandeConnexion'>
                <button type="submit" class="btn btn-primary btn-acc">ENTRER DANS L'APPLICATION</button>
				<br/><br/>
				<label>Version <?php echo $version[0]; ?></label>
            </form>
        </td>
    </tr>
</table>