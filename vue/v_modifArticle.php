<?php
include("include/entete.php");

?>
<form action="index.php?uc=maj&action=modifAdminCrit" method="POST">
	<table>
        <tr>
            <th>
                <textarea class="form-control" rows="17" name='newnomarticle' cols='150' maxlength='10000'><?php echo $_SESSION['listearticle']['DESCRIPTION_RESUME_ARTICLE']; ?></textarea>
            </th>
        </tr>
        <tr>
            <td>
                <button type="submit" class="btn btn-default btn-ret" onclick='return(confirm("Voulez-vous vraiment modifier cet article ?"));'>Modifier</button>
                <button type="submit" class="btn btn-default btn-ret" name="retour">Retour</button>
            </td>
        </tr>
    </table>
</form>