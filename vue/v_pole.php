<?php
include("include/entete.php");
    $i = 0;
?>
<table>
    <tr>
<?php
    foreach ($lesPoles as $untole){
        $numPole = $untole['CODE_POLE'];
        $nomPole = $untole['LIBELLE_POLE'];
		if($untole['PICTOS'] != NULL){
				$pictos = 'fa '.$untole['PICTOS'];
			}else{
				$pictos = '';
			}
        if($i == 3){
            ?>
            </tr>
            <tr>
            <?php
            $i = 0;
        }
?>
        <td class="esrest">
            <form method='POST' action='index.php?uc=sursite&action=batiment&nt=oui&entpied=batiment'>
                <input type='hidden' name='nompole' value='<?php echo $nomPole; ?>'/>
                <button type="submit" class="btn btn-lg btn-success <?php echo $pictos; ?>" name="numpole" value="<?php echo $numPole; ?>"> <?php echo $nomPole; ?></button>
            </form>
        </td>
<?php
        $i = $i +1;
    }
?>
    </tr>
</table>