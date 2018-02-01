<?php
include("include/entete.php");
if($listeThemePartie == null){
    echo '<h1>Aucun Thème !!!</h1>';
}
else{
    $tab_t_eff = array();
    for($j = 0;$j < count($listecr);$j++){
        if($listecr[$j] == $listecrasc[$j]){
                array_push($tab_t_eff, $listecr[$j][1]);
        }
    }
    $i = 0;
    ?>
    <table>
        <tr>
    <?php
        foreach ($listeThemePartie as $ltp){
            $choef = '';
            $cou = 'btn-success';
            $numtheme = $ltp['NUM_THEME'];
            $nomtheme = $ltp['NOM_THEME'];
			if($ltp['PICTOS'] != NULL){
				$pictos = 'fa '.$ltp['PICTOS'];
			}else{
				$pictos = '';
			}
			
            if($_SESSION['codepartie'] == 1){
                foreach ($tab_t_eff as $te){
                    if($te['NUM_THEME'] == $numtheme){
                        //$choef = 'disabled="disabled"';
                        $cou = 'btn-default';
                    }
                }
            }
            else{
                foreach ($listecritereeff as $lcf){
                    if($lcf['NUM_LIEU'] == $_SESSION['idlieu']){
                        foreach ($tab_t_eff as $te){
                            if($te['NUM_THEME'] == $numtheme){
                                //$choef = 'disabled="disabled"';
                                $cou = 'purple';
                            }
                        }
                    }
                }
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
                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=soustheme&nt=oui'>
                    <input type='hidden' name='nomtheme' value='<?php echo $nomtheme; ?>'/>
                    <button type="submit" class="btn <?php echo $cou; ?> btn-lg <?php echo $pictos; ?>" name="numtheme" value="<?php echo $numtheme; ?>" <?php echo $choef; ?>> <?php echo $nomtheme; ?></button>
                </form>
            </td>
    <?php
            $i = $i +1;
        }
    ?>
        </tr>
    </table>
<?php
}
?>