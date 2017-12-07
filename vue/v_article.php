<?php
include("include/entete.php");
foreach($listeimgcr as $li){
    if($_SESSION['articlecritere'] == $li['LIBELLE_IMAGE_CRITERE']){
        ?>
            <table>
                <tr>
                    <th>
                        <img src="<?php echo $path.$_SESSION['articlecritere']?>" />
                    </th>
                </tr>
            </table>
        <?php
    }
}
if($_SESSION['cachemo'] == true){
?>
    <table>
        <tr>
            <th>
                <textarea class="form-control" rows="18" name='newnomarticle' cols='150' maxlength='10000' required="required" disabled><?php echo $_SESSION['articlecritere']; ?></textarea>
            </th>
        </tr>
        <tr>
            <td>
                <a class="btn btn-default btn-ret" href="index.php?uc=<?php echo $uc_choix; ?>&action=article&nt=non&aft=oui&mo=non" role="button">Modifier</a>
            </td>
        </tr>
    </table>
<?php
}
else{
?>
    <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=article&nt=non&aft=non&mo=oui'>
        <table>
            <tr>
                <th>Modifier le résumé d'article :</th>
            </tr>
            <tr>
                <td>
                    <textarea class="form-control" rows="18" name='newnomarticle' cols='150' maxlength='10000' required="required" autofocus><?php echo $_SESSION['articlecritere']; ?></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <a class="btn btn-default btn-ret" href="index.php?uc=<?php echo $uc_choix; ?>&action=article&nt=non&aft=non&mo=non" role="button">Annuler</a>
                    <div class="droitetab">
                        <input type='submit' value='Valider' name='modifier' class="btn btn-default btn-ret"/>
                    </div>
                </td>
            </tr>
        </table>
    </form>
<?php
}
?>