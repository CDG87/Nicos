<?php
include("include/entete.php");
if($listeObservation == null){
    echo '<h1>Aucune Observation !!!</h1>';
}
else{
?>
    <table>
        <tr>
            <td>
                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=article&nt=oui&aft=non&mo=non&entpied=article'>
                    <button type="submit" class="btn btn-primary btn-art" name="article">Articles</button>
                </form>
            </td>
        </tr>
    </table>
    <hr/>
    <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=observation&nt=non&aj=non&aft=non&mo=non&sup=non&cho=oui'>
        <table>
        <?php
            $tai_tab = (count($_SESSION['tabobs']) - 1);
            $der_btn = (count($listeObservation) - 1);
			$nb =0;
            foreach ($listeObservation as $lo){
                $choef = '';
                $choaut = '';
                $numobs = $lo['NUM_OBSERVATION'];
                $libobs = nl2br($lo['LIBELLE_OBSERVATION']);
                $codecouleur = $lo['CODE_COULEUR_OBSERVATION'];
                if($codecouleur == 1){
                    $cou = 'btn-success';
                }
                else{
                    $cou = 'btn-danger';
                }
                for($i = 0;$i < count($_SESSION['tabobs']);$i++){
                    if($_SESSION['tabobs'][$i] == $numobs){
						if($choef=='outline'){		
							$choef = '';
							$nb=$nb-1;
						}else{
							$choef = 'outline';
							$nb=$nb+1;
						}   
                    }
                    // if($_SESSION['tabobs'][$tai_tab] == $numobs){
                        // $choaut = '';
                    // }
                }
                if($_SESSION['cacheva'] == false){
                    $choaut = '';
                }
        ?>
            <tr>
                <td>
                    <button name="btnobs" type="submit" class="btn <?php echo $cou.' '.$choef; ?> btn-obs" value="<?php echo $numobs; ?>" <?php echo $choaut; ?>><?php echo $libobs; ?></button>
                </td>
            </tr>            
        <?php
            }
        ?>
        </table>
		
		<h1>Ajout d'une observation temporaire</h1>
		<table>
            <tr>
                <td>
                    <textarea class="form-control" rows="10" name='obsmanu' cols='150' maxlength='1000'></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="droitetab">
                        <button type="submit" class="btn btn-default btn-art" name="ajouterO">Ajouter</button>
                    </div>
                </td>
            </tr>
           </table>
		   <table>
                    <tr>
                        <th>La couleur de l'observation sera ?</th>
                        <td>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cdobsmanu" id="cdobs1" value="1">
                                    Verte
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cdobsmanu" id="cdobs2" value="2" checked >
                                    Rouge
                                    </label>
                                </div>
                        </td>
                        </form>
                    </tr>
                </table>
		
        <?php
        if($_SESSION['cacheva'] == true && $_SESSION['tabobs'] != null && $nb > 0){
        ?>
            <hr/>
            <table>
                <tr>
                    <td>
                        <button type="submit" class="btn btn-primary btn-art" name="valider" autofocus>Valider</button>
                    </td>
                </tr>
            </table>
        <?php
        }
        ?>
    </form>
    <?php
    if($_SESSION['cacheva'] == false){
        if($_SESSION['obsR'] == false){
    ?>
            <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=non&aj=non&aft=non&mo=non&sup=non&finicritere=vrai' enctype="multipart/form-data">
    <?php
        }
        else{
    ?>
            <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=preconisation&nt=oui&aj=non&aft=non&mo=non&sup=non&cho=non&entpied=preconisation' enctype="multipart/form-data">
    <?php
        }
    }
    ?>
    <?php
    if($_SESSION['cacheva'] == false){
    ?>
        <hr/>
        <table>
            <tr>
                <td>
                    <div class="container_obs">
                        <input type="file" name="photoprise" id="photoprise" class="btn btn-default">
                    </div>
                </td>
                <td>
                    <h1>Ajouter une photo</h1>
                </td>
            </tr>
        </table>
        <hr/>
		<?php if($infosaudit['LIBELLE_AUDIT']=="Inspection"){ ?>
        <table>
            <tr>
                <td>
                    <div class='btns'>
                        <label class='lab_con'>
                            <input class='btn_conf' name='conf' type='radio' value='NC' checked>
                            <span class='btn_sco first'>Non conforme</span>
                            </input>
                        </label>
                        <label class='lab_con'>
                            <input class='btn_conf' name='conf' type='radio' value='<C'>
                            <span class='btn_sco'>Plutôt non conforme</span>
                            </input>
                        </label>
                        <label class='lab_con'>
                            <input class='btn_conf' name='conf' type='radio' value='>C'>
                            <span class='btn_sco'>Plutôt conforme</span>
                            </input>
                        </label>
                        <label class='lab_con'>
                            <input class='btn_conf' name='conf' type='radio' value='C'>
                            <span class='btn_sco last'>Conforme</span>
                            </input>
                        </label>
						<div id='SAD'>
							<label class='lab_con'>
								<input class='btn_conf' name='conf' type='radio' value='SA'>
									<span class='btn_sco' id="SA">Sans avis</span>
								</input>
							</label>
						</div>
                    </div>
                </td>
            </tr>
        </table>
		<?php } ?>
        <hr/>
        <table>
            <tr>
                <td>
                    <div class="container_obs">
                        <input type="checkbox" id="cbtest" class="checkobs" value="1" name="vaimpo" />
                        <label for="cbtest" class="check-box"></label> 
                    </div>
                </td>
                <td>
                    <h1>Observation importante</h1>
                </td>
            </tr>
        </table>
        <hr/>
        <table>
            <tr>
                <td>
                    <button type="submit" class="btn btn-primary btn-art" name="valider" onclick="<?php if($couleur!=true){ echo "if(!confirm('Voulez-vous vraiment sauvegarder ? ')) return false;"; }?>" autofocus> Valider</button>
                </td>
            </tr>
        </table>
    </form>
<?php
        }
}
?>
            
