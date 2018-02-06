<?php
include("include/entete.php");
?>
</br></br></br>
<?php
if($listepreconisation == null){
    echo '<h1>Aucune Proposition !!!</h1>';
}
else{
    for($i = 0;$i < count($_SESSION['tabobsR']);$i++){
        ?>
            <button type="button" class="btn btn-danger btn-obs" disabled="disabled"><?php echo $_SESSION['tabobsR'][$i]; ?></button>
			</br></br>
        <?php
    }
    ?>
    <hr/>
    <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=preconisation&nt=non&aj=non&aft=non&mo=non&sup=non&cho=oui'>
        <table>
        <?php
            $tai_tab = (count($_SESSION['tabpreco']) - 1);
			$nb=0;
            foreach ($listepreconisation as $lp){
                $choef = '';
                $choaut = '';
				$codePreco ='';
                $numpreco = $lp['NUM_PRECONISATION'];
                $libpreco = nl2br($lp['LIBELLE_PRECONISATION']);
                for($i = 0;$i < count($_SESSION['tabpreco']);$i++){
                    if($_SESSION['tabpreco'][$i] == $numpreco){
                        if($choef=='outline'){		
							$choef = '';
							$nb=$nb-1;
						}else{
							$choef = 'outline';
							$nb=$nb+1;
						}  
                    }
                    if($_SESSION['tabpreco'][$tai_tab] == $numpreco){
                        $choaut = '';
                    }
                }
                if($_SESSION['cachevaP'] != 'oui'){
                    $choaut = '';
                }
				if($lp['code_Preco']==1){
					$codePreco='autofocus';
				}
				if(isset($_POST['btnpreco'])){
					$codePreco='';
				}
        ?>
            <tr>
                <td>
                    <button name="btnpreco" type="submit" class="btn btn-default <?php echo $choef; ?> btn-preco" value="<?php echo $numpreco; ?>" <?php echo $choaut.' '.$codePreco; ?>><?php echo $libpreco; ?></button>
                </td>
            </tr>

        <?php
            }
        ?>
        </table>
        <?php
        if($_SESSION['cachevaP'] != 'non'){
        ?>
            <hr/>
            <h1>Proposition temporaire</h1>
            <table>
                <tr>
                    <td>
                        <textarea rows="5" name='precomanu' cols='50' maxlength='10000'></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="droitetab">
                            <button type="submit" class="btn btn-default btn-art" name="ajouterP">Ajouter</button>
                        </div>
                    </td>
                </tr>
            </table>
		</form>
        <?php
        }
        ?>
    
        <?php
        if($_SESSION['cachevaP'] == 'oui' && $_SESSION['tabpreco'] != null && $nb > 0){
        ?>
            <hr/>
			<form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non&finicritere=vrai'>
            <table>
                <tr>
                    <td>
                        <button type="submit" class="btn btn-default btn-art btn-primary btn-generer-rond" name="valider" onclick="if(!confirm('Voulez-vous vraiment sauvegarder ? ')) return false;" autofocus>Valider</button>
                    </td>
                </tr>
            </table>
		</form>
        <?php
        }
        ?>
    <?php
    if($_SESSION['cachevaP'] == 'non'){
    ?>
        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non&finicritere=vrai'>
    <?php
    }
    if($_SESSION['cachevaP'] == 'non'){
    ?>
            <hr/>
            <?php
            if($_SESSION['precoCR'] != null){
            ?>
            <table>
                <tr>
                    <td>
                        <textarea class="form-control" rows="10" name='precomanu' cols='150' maxlength='1000' required="required" disabled><?php echo $_SESSION['precoCR']; ?></textarea>
                    </td>
                </tr>
            </table>
            <?php
            }
            ?>
        </form>
<?php
    }
}
?>