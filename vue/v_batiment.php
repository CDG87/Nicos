<?php
include("include/entete.php");
    $i = 0;
?>
<table>
    <tr>
<?php
    foreach ($lesBatiments as $unBatiment){
        $numBatiment = $unBatiment['NUM_BATIMENT'];
        $nomBatiment = $unBatiment['NOM_BATIMENT'];
		if($unBatiment['PICTOS'] != NULL){
				$pictos = 'fa '.$unBatiment['PICTOS'];
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
            <form method='POST' action='index.php?uc=sursite&action=groupelieu&nt=oui&entpied=groupelieu'>
                <input type='hidden' name='nombatiment' value='<?php echo $nomBatiment; ?>'/>
                <button type="submit" class="btn btn-success btn-lg <?php echo $pictos; ?>" name="numbatiment" value="<?php echo $numBatiment; ?>"> <?php echo $nomBatiment; ?></button>
            </form>
        </td>
<?php
        $i = $i +1;
    }
?>
    </tr>
</table>	
		
		<h1>Ajout d'un bâtiment temporaire</h1>
		<form method='POST' action='index.php?uc=sursite&action=batiment&nt=oui'>
		<table>
            <tr>
                <td>
                    <textarea class="form-control" rows="10" name='batimentmanu' cols='150' maxlength='60'></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="droitetab">
                        <button type="submit" class="btn btn-default btn-art" name="ajouterB">Ajouter</button>
                    </div>
                </td>
            </tr>
           </table>
		   </form>