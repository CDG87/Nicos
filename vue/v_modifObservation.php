<?php
include("include/entete.php");
?>
<form method="POST" action="index.php?uc=maj&action=modifAdminObservation">
<div class="gauchetab">
                <table>
                    <tr>
						</br></br></br></br>
                        <th>Modifier une observation :</th>
                        <td><select name = "idobservation" size = "1" class="form-control" onchange="submit()">
                                <option selected disabled>Choisir</option>
                                <?php
                                    foreach ($listeObservation as $loc){
                                        $numobs = $loc['NUM_OBSERVATION'];
                                        $libobs = $loc['LIBELLE_OBSERVATION'];
                                        $selected = '';
                                        if($numobs == $_SESSION['numObs']){
                                ?>
								
								 <option selected value="<?php echo $numobs; ?>"><?php echo $libobs; ?></option>
										<?php }else{ ?>
                                <option value="<?php echo $numobs; ?>"><?php echo $libobs; ?></option>
                                <?php
										}
                                    }
                                ?>
                            </select></td>
                                    <td>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment supprimer cette observation ?"));'/>
                                    </td>
                    </tr>
                    <tr>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <textarea class="form-control" rows="7" name='nomobs' cols='150' maxlength='500' autofocus><?php echo $_SESSION['textObs'] ?></textarea>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment modifier cette observation ?"));'/></td>
									<td><button type="submit" class="btn btn-default" name="retour">Retour</button></td>
                    </tr>
                </table>
            </div>
<div class="gauchetab">

    <table>
        <tr>
                <th>Ajouter une observation :</th>
        </tr>
        <tr>
			<td><textarea class="form-control" rows="7" name='newnomobservation' cols='150' maxlength='370' placeholder="Nom de l'observation"></textarea></td>
			<td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
        </tr>
    </table>
</div>
<div class="gauchetab">
    <table>
        <tr>
            <th>La couleur de l'observation sera ?</th>
            <td>
                <div class="radio">
                    <label>
                        <input type="radio" name="cdobs" id="cdobs1" value="1">
                            Vert
                    </label>
                 </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="cdobs" id="cdobs2" value="2" checked >
                            Rouge
                    </label>
                </div>
            </td>
                    </tr>
                </table>
            </div>
            </form>
			