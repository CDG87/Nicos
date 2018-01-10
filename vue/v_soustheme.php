<?php
include("include/entete.php");
$tab_st_eff = array();
for($j = 0;$j < count($listecr);$j++){
    if($listecr[$j] == $listecrasc[$j]){
            array_push($tab_st_eff, $listecr[$j][1]);
    }
}
$i = 0;
?>
<table>
    <tr>
<?php
    foreach ($listeSousThemeNum as $lstn){
        $choef = '';
        $cou = 'btn-success';
        $numsoustheme = $lstn['NUM_SOUS_THEME'];
        $libsoustheme = $lstn['LIBELLE_SOUS_THEME'];
        if($_SESSION['codepartie'] == 1){
            foreach ($tab_st_eff as $tse){
                if($tse['NUM_SOUS_THEME'] == $numsoustheme){
                    //$choef = 'disabled="disabled"';
                    $cou = 'btn-default';
                }
            }
        }
        else{
            foreach ($listecritereeff as $lcf){
                if($lcf['NUM_LIEU'] == $_SESSION['idlieu']){
                    foreach ($tab_st_eff as $tse){
                        if($tse['NUM_SOUS_THEME'] == $numsoustheme){
                            $choef = 'disabled="disabled"';
                            $cou = 'btn-default';
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
            <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=oui&entpied=critere'>
                <input type='hidden' name='libsoustheme' value='<?php echo $libsoustheme; ?>'/>
                <button type="submit" class="btn <?php echo $cou; ?> btn-lg" name="numsoustheme" value="<?php echo $numsoustheme; ?>" <?php echo $choef; ?>><?php echo $libsoustheme; ?></button>
            </form>
        </td>
<?php
        $i = $i +1;
    }
?>
    </tr>
</table>
<?php
include("vue/v_generer.php");
?>