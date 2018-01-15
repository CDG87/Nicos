<?php
include("include/entete.php");
?>
<form action="index.php?uc=maj&action=modifAdminCrit" method="POST">
	<table>
        <tr>
            <th>
                <textarea class="form-control" rows="17" name='newnomarticle' cols='150' maxlength='10000' required="required"><?php echo $listearticle['DESCRIPTION_RESUME_ARTICLE']; ?></textarea>
            </th>
        </tr>
        <tr>
            <td>
                <button type="submit" class="btn btn-default btn-ret">Modifier</button>
            </td>
        </tr>
    </table>
</form>