<?php
include("include/entete.php");
    $i = 0;
?>
<table>
    <tr>
<?php
    foreach ($lesGroupesLieux as $unGroupeLieu){
        $numGL = $unGroupeLieu['NUM_GROUPE_LIEU'];
        $nomGL = $unGroupeLieu['LIBELLE_GROUPE_LIEU'];
        if($i == 3){
            ?>
            </tr>
            <tr>
            <?php
            $i = 0;
        }
?>
        <td class="esrest">
            <form method='POST' action='index.php?uc=sursite&action=lieu&nt=oui&entpied=lieu'>
                <input type='hidden' name='nomgroupelieu' value='<?php echo $nomGL; ?>'/>
                <button type="submit" class="btn btn-info btn-lg" name="numgroupelieu" value="<?php echo $numGL; ?>"><?php echo $nomGL; ?></button>
            </form>
        </td>
<?php
        $i = $i +1;
    }
?>
    </tr>
</table>