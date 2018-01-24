<?php
include("include/entete.php");
?>
<form method="POST" action="index.php?uc=maj&action=modifAdminProposition">
<div class="gauchetab">
                <table>
                    
                       
						</br></br><tr>
                        <th>Modifier une Proposition :</th>
						</tr>
						<tr>
                        <td><select name = "idproposition" size = "1" class="form-control" onchange="submit()">
                                <option selected disabled>Choisir</option>
                                <?php
                                    foreach ($listeProposition as $prop){
                                        $numprop = $prop['NUM_PRECONISATION'];
                                        $libprop = $prop['LIBELLE_PRECONISATION'];
										if($numprop == $_SESSION['numPropo']){
                                ?>
								<option value="<?php echo $numprop; ?>" selected><?php echo $libprop; ?>  </option>
										<?php }else{ ?>
                                <option value="<?php echo $numprop; ?>"><?php echo $libprop; ?></option>
                                <?php
										}
                                    }
                                ?>
                            </select></td>
                                    <td>
                                        <input type='submit' value='Supprimer' name='supprimer' <?php echo $verou; ?> class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment supprimer cette proposition ?"));'/>
                                    </td>
                    </tr>
                    <tr>
                                    <th>Nouveau nom :</th>
									</tr>
									<tr>
                                    <td>
                                        <textarea class="form-control" rows="7" name='nomprop' cols='150' maxlength='500' ><?php echo $_SESSION['textPropo']; ?></textarea>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment modifier cette proposition ?"));'/></td>
									<td><button type="submit" class="btn btn-default" name="retour">Retour</button></td>
                                
                    </tr>
                </table>
            </div>
<div class="gauchetab">

    <table>
        <tr>
                <th>Ajouter une proposition :</th>
        </tr>
        <tr>
			<td><textarea class="form-control" rows="7" name='newnomproposition' cols='150' maxlength='370' placeholder="Nom de la proposition"></textarea></td>
			<td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
        </tr>
    </table>
</div>
</form>
            
			