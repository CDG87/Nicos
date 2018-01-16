<?php
include("include/entete.php");
?>
<div class="gauchetab">
<form method="POST" action="index.php?uc=maj&action=modifAdminProposition">
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
            <div class="gauchetab">
                <table>
                    <tr>
                       
						</br></br></br></br>
                        <th>Modifier une Proposition :</th>
                        <td><select name = "idproposition" size = "1" class="form-control">
                                <option selected disabled>Choisir</option>
                                <?php
                                    foreach ($listeProposition as $prop){
                                        $numprop = $prop['NUM_PRECONISATION'];
                                        $libprop = $prop['LIBELLE_PRECONISATION'];
                                        $selected = '';
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numprop; ?>"><?php echo $libprop; ?></option>
                                <?php
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
                                        <textarea class="form-control" rows="5" name='nomprop' cols='150' maxlength='500' autofocus></textarea>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
									<td><button type="submit" class="btn btn-primary" name="retour">Retour</button></td>
                                </form>
                    </tr>
                </table>
            </div>
			