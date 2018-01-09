<?php
include("include/entete.php");
    $i = 0;
?>
<table>
    <tr>
<?php
    foreach ($lesLieux as $unLieu){
        $numLieu = $unLieu['NUM_LIEU'];
        $nomLieu = $unLieu['NOM_LIEU'];
        if($i == 3){
            ?>
            </tr>
            <tr>
            <?php
            $i = 0;
        }
?>
        <td class="esrest">
            <form method='POST' action='index.php?uc=sursite&action=theme&nt=oui&entpied=theme'>
                <input type='hidden' name='nomlieu' value='<?php echo $nomLieu; ?>'/>
                <button type="submit" class="btn btn-success btn-lg" name="numlieu" value="<?php echo $numLieu; ?>"><?php echo $nomLieu; ?></button>
            </form>
        </td>
<?php
        $i = $i +1;
    }
?>
    </tr>
</table>

<h1>Ajout d'un lieu temporaire</h1>
		<form method='POST' action='index.php?uc=sursite&action=lieu&nt=oui'>
		<table>
            <tr>
                <td>
                    <textarea rows="5" name='lieumanu' cols='50' maxlength='60'></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="droitetab">
                        <button type="submit" class="btn btn-default btn-art" name="ajouterL">Ajouter</button>
                    </div>
                </td>
            </tr>
           </table>
		   </form>