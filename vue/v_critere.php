<?php
include("include/entete.php");
$i = 0;
?>
<table>
    <tr>
<?php
    
    foreach ($listeCritereTheme as $lc){
        $choef = '';
        $cou = 'btn-warning';
        $numcritere = $lc['NUM_CRITERE'];
        $libcritere = $lc['LIBELLE_CRITERE'];
        if($_SESSION['codepartie'] == 1){
            foreach ($listecritereeff as $lcf){
                if($lcf['NUM_CRITERE'] == $numcritere){
                    $choef = 'disabled="disabled"';
                    $cou = 'btn-default';
                }
            }
        }
        else{
            foreach ($listecritereeff as $lcf){
                if($lcf['NUM_BATIMENT_C'] == $_SESSION['idbatiment'] && $lcf['NUM_GROUPE_LIEU_C'] == $_SESSION['idgroupelieu'] && $lcf['NUM_THEME_C'] == $_SESSION['numtheme'] && $lcf['NUM_LIEU'] == $_SESSION['idlieu'] && $lcf['NUM_CRITERE'] == $numcritere ){
                    $choef = 'disabled="disabled"';
                    $cou = 'btn-default';
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
            <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=observation&nt=oui&entpied=observation'>
                <input type='hidden' name='libcritere' value='<?php echo $libcritere; ?>'/>
                <button type="submit" class="btn <?php echo $cou; ?> btn-lg" name="numcritere" value="<?php echo $numcritere; ?>" <?php echo $choef; ?>><?php echo $libcritere; ?></button>
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