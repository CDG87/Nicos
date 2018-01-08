<footer>
    <hr/>
    <?php
        if($_SESSION['entpied'] == 'accueil') {
            echo "<h3>© Copyright 2017 - BTS SIO Lycée Valadon</h3>";
        }
        if($_SESSION['entpied'] == 'pole') { ?>
		
			<form method='POST' action='index.php?uc=sursite&action=pole&nt=non&aj=oui&aft=non&mo=non&sup=non'>
                <div class="gauchetab">
                    <table>
                        <tr>
                            <th>Ajouter un pôle :</th>
                        </tr>
                        <tr>
                            <td>
								<input type="text" name="newnompole" size="45" maxlength="100" required="required" class="form-control" placeholder="Nom du pôle" />
							</td>
                            <td>
								<input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/>
							</td>
                        </tr>
                    </table>
                </div>
            </form>
			
			
			<div class="droitetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=sursite&action=pole&nt=non&aj=non&aft=oui&mo=non&sup=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idpole'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier un pôle :</th>
                        <td><select name="idpole" size="1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($lesPoles as $untole){
                                        $numPole = $untole['CODE_POLE'];
										$nomPole = $untole['LIBELLE_POLE'];
                                        $selected = '';
                                        if($numPole == $_SESSION['idpole']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['libpole'] = $nomPole;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numPole; ?>"><?php echo $nomPole; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=non&sup=oui'>
                                    <td>
                                        <input type="hidden" name="numpole" value="<?php echo $_SESSION['idpole']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick="return(confirm('Voulez-vous vraiment supprimer ce pôle ?'));"/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=sursite&action=pole&nt=non&aj=non&aft=non&mo=oui&sup=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numpole" value="<?php echo $_SESSION['idpole']; ?>"/>
                                        <input type='text' name='nompole' size='45' maxlength='60' required="required" class="form-control" value="<?php echo $_SESSION['libpole']; ?>" autofocus/>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>
                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
		
		<?php
		}
		if($_SESSION['entpied'] == 'batiment') { ?>
		
			<form method='POST' action='index.php?uc=sursite&action=batiment&nt=non&aj=oui&aft=non&mo=non&sup=non'>
                <div class="gauchetab">
                    <table>
                        <tr>
                            <th>Ajouter un bâtiment :</th>
                        </tr>
                        <tr>
                            <td><input type='text' name='newnombatiment' size='45' maxlength='60' required="required" class="form-control" placeholder="Nom du bâtiment" /></td>
                            <td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
                        </tr>
                    </table>
                </div>
            </form>
			
			
			<div class="droitetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=oui&mo=non&sup=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idbatiment'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier un bâtiment :</th>
                        <td><select name="idbatiment" size="1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($lesBatiments as $unBatiment){
                                        $numBatiment = $unBatiment['NUM_BATIMENT'];
										$nomBatiment = $unBatiment['NOM_BATIMENT'];
                                        $selected = '';
                                        if($numBatiment == $_SESSION['idbatiment']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['nombatiment'] = $nomBatiment;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numBatiment; ?>"><?php echo $nomBatiment; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=non&sup=oui'>
                                    <td>
                                        <input type="hidden" name="numbatiment" value="<?php echo $_SESSION['idbatiment']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick="return(confirm('Voulez-vous vraiment supprimer ce bâtiment ?'));"/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=sursite&action=batiment&nt=non&aj=non&aft=non&mo=oui&sup=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numbatiment" value="<?php echo $_SESSION['idbatiment']; ?>"/>
                                        <input type='text' name='nombatiment' size='45' maxlength='100' required="required" class="form-control" value="<?php echo $_SESSION['nombatiment']; ?>" autofocus/>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>
                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
		
		<?php
		}	
		if($_SESSION['entpied'] == 'groupelieu') { ?>
		
			<form method='POST' action='index.php?uc=sursite&action=groupelieu&nt=non&aj=oui&aft=non&mo=non&sup=non'>
                <div class="gauchetab">
                    <table>
                        <tr>
                            <th>Ajouter un groupe de lieux :</th>
                        </tr>
                        <tr>
                            <td><input type='text' name='newgroupelieu' size='45' maxlength='100' required="required" class="form-control" placeholder="Nom du groupe de lieu" /></td>
                            <td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
                        </tr>
                    </table>
                </div>
            </form>
			
			
			<div class="droitetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=oui&mo=non&sup=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idgroupelieu'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier un groupe de lieux :</th>
                        <td><select name="idgroupelieu" size="1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($lesGroupesLieux as $unGroupeLieu){
										$numGL = $unGroupeLieu['NUM_GROUPE_LIEU'];
										$nomGL = $unGroupeLieu['LIBELLE_GROUPE_LIEU'];
                                        $selected = '';
                                        if($numGL == $_SESSION['idgroupelieu']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['groupelieu'] = $nomGL;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numGL; ?>"><?php echo $nomGL; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=non&sup=oui'>
                                    <td>
                                        <input type="hidden" name="numgroupelieu" value="<?php echo $_SESSION['idgroupelieu']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick="return(confirm('Voulez-vous vraiment supprimer ce groupe de lieux ?'));"/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=sursite&action=groupelieu&nt=non&aj=non&aft=non&mo=oui&sup=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numgroupelieu" value="<?php echo $_SESSION['idgroupelieu']; ?>"/>
                                        <input type='text' name='groupelieu' size='45' maxlength='100' required="required" class="form-control" value="<?php echo $_SESSION['groupelieu']; ?>" autofocus/>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>
                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
		
		<?php
		}
		if($_SESSION['entpied'] == 'lieu') { ?>
		
			<form method='POST' action='index.php?uc=sursite&action=lieu&nt=non&aj=oui&aft=non&mo=non&sup=non'>
                <div class="gauchetab">
                    <table>
                        <tr>
                            <th>Ajouter un lieu :</th>
                        </tr>
                        <tr>
                            <td><input type='text' name='newlieu' size='45' maxlength='100' required="required" class="form-control" placeholder="Nom du lieu" /></td>
                            <td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
                        </tr>
                    </table>
                </div>
            </form>
			
			
			<div class="droitetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=oui&mo=non&sup=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idlieu'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier un lieu :</th>
                        <td><select name="idlieu" size="1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($lesLieux as $unLieu){
										$numLieu = $unLieu['NUM_LIEU'];
										$nomLieu = $unLieu['NOM_LIEU'];
                                        $selected = '';
                                        if($numLieu == $_SESSION['idlieu']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['nomlieu'] = $nomLieu;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numLieu; ?>"><?php echo $nomLieu; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=non&sup=oui'>
                                    <td>
                                        <input type="hidden" name="numlieu" value="<?php echo $_SESSION['idlieu']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick="return(confirm('Voulez-vous vraiment supprimer ce groupe de lieux ?'));"/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=sursite&action=lieu&nt=non&aj=non&aft=non&mo=oui&sup=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numlieu" value="<?php echo $_SESSION['idlieu']; ?>"/>
                                        <input type='text' name='nomlieu' size='45' maxlength='100' required="required" class="form-control" value="<?php echo $_SESSION['nomlieu']; ?>" autofocus/>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>
                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
		
		<?php
		}
        if($_SESSION['entpied'] == 'theme'){
    ?>
            <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=theme&nt=non&aj=oui&aft=non&mo=non&sup=non'>
                <div class="gauchetab">
                    <table>
                        <tr>
                            <th>Ajouter un thème :</th>
                        </tr>
                        <tr>
                            <td><input  type='text' name='newnomtheme' size='45' maxlength='100' required="required" class="form-control" placeholder="Nom du thème" /></td>
                            <td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
                        </tr>
                        <tr>
                            <th>Le thème aura-t-il un sous-thème ?</th>
                            <td>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="avoirst" id="avoirst1" value="oui">
                                        Oui
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="avoirst" id="avoirst2" value="non" checked>
                                        Non
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            <div class="droitetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=theme&nt=non&aj=non&aft=oui&mo=non&sup=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idtheme'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier un thème :</th>
                        <td><select name = "idtheme" size = "1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($listeThemePartie as $ltp){
                                        $numtheme = $ltp['NUM_THEME'];
                                        $nomtheme = $ltp['NOM_THEME'];
                                        $selected = '';
                                        if($numtheme == $_SESSION['idtheme']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['libtheme'] = $nomtheme;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numtheme; ?>"><?php echo $nomtheme; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=theme&nt=non&aj=non&aft=non&mo=non&sup=oui'>
                                    <td>
                                        <input type="hidden" name="numtheme" value="<?php echo $_SESSION['idtheme']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment supprimer ce thème avec tout ce qu’il contient ?"));' />
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=theme&nt=non&aj=non&aft=non&mo=oui&sup=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numtheme" value="<?php echo $_SESSION['idtheme']; ?>"/>
                                        <input  type='text' name='nomtheme' size='45' maxlength='100' required="required" class="form-control" value="<?php echo $_SESSION['libtheme']; ?>" autofocus/>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>
                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
    <?php
        }
        if($_SESSION['entpied'] == 'soustheme'){
    ?>
            <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=soustheme&nt=non&aj=oui&aft=non&mo=non&sup=non'>
                <div class="gauchetab">
                    <table>
                        <tr>
                            <th>Ajouter un sous-thème :</th>
                        </tr>
                        <tr>
                            <td><input  type='text' name='newnomsoustheme' size='45' maxlength='100' required="required" class="form-control" placeholder="Nom du sous-thème"/></td>
                            <td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
                        </tr>
                    </table>
                </div>
            </form>
            <div class="droitetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=soustheme&nt=non&aj=non&aft=oui&mo=non&sup=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idsoustheme'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier un sous-thème :</th>
                        <td><select name = "idsoustheme" size = "1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($listeSousThemeNum as $lstn){
                                        $numsoustheme = $lstn['NUM_SOUS_THEME'];
                                        $libsoustheme = $lstn['LIBELLE_SOUS_THEME'];
                                        $selected = '';
                                        if($numsoustheme == $_SESSION['idsoustheme']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['libsoustheme'] = $libsoustheme;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numsoustheme; ?>"><?php echo $libsoustheme; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=soustheme&nt=non&aj=non&aft=non&mo=non&sup=oui'>
                                    <td>
                                        <input type="hidden" name="numsoustheme" value="<?php echo $_SESSION['idsoustheme']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment supprimer ce sous-thème avec tout ce qu’il contient ?"));'/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=soustheme&nt=non&aj=non&aft=non&mo=oui&sup=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numsoustheme" value="<?php echo $_SESSION['idsoustheme']; ?>"/>
                                         <input  type='text' name='nomsoustheme' size='45' maxlength='100' required="required" class="form-control" value="<?php echo $_SESSION['libsoustheme']; ?>" autofocus/>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>

                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
    <?php
        }
        if($_SESSION['entpied'] == 'critere'){
    ?>
            <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=non&aj=oui&aft=non&mo=non&sup=non'>
                <div class="gauchetab">
                    <table>
                        <tr>
                            <th>Ajouter un critère :</th>
                        </tr>
                        <tr>
                            <td><input  type='text' name='newnomcritere' size='45' maxlength='100' required="required" class="form-control" placeholder="Nom du critère"/></td>
                            <td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
                        </tr>
                    </table>
                </div>
            </form>
            <div class="droitetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=non&aj=non&aft=oui&mo=non&sup=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idcritere'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier un critère :</th>
                        <td><select name = "idcritere" size = "1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($listeCritereTheme as $lct){
                                        $numcritere = $lct['NUM_CRITERE'];
                                        $libcritere = $lct['LIBELLE_CRITERE'];
                                        $selected = '';
                                        if($numcritere == $_SESSION['idcritere']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['libcritere'] = $libcritere;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numcritere; ?>"><?php echo $libcritere; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=non&aj=non&aft=non&mo=non&sup=oui'>
                                    <td>
                                        <input type="hidden" name="numcritere" value="<?php echo $_SESSION['idcritere']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment supprimer ce critère avec tout ce qu’il contient ?"));'/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=critere&nt=non&aj=non&aft=non&mo=oui&sup=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numcritere" value="<?php echo $_SESSION['idcritere']; ?>"/>
                                         <input  type='text' name='nomcritere' size='45' maxlength='100' required="required" class="form-control" value="<?php echo $_SESSION['libcritere']; ?>" autofocus/>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>

                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
    <?php
        }
        if($_SESSION['entpied'] == 'observation'){
			if($_SESSION['isAdmin']==1){ 
    ?>
            <div class="gauchetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=observation&nt=non&aj=oui&aft=non&mo=non&sup=non&cho=non'>
                        <th>Ajouter une observation :</th>
                    </tr>
                    <tr>
                        <td><textarea class="form-control" rows="7" name='newnomobservation' cols='150' maxlength='370' required="required" placeholder="Nom de l'observation"></textarea></td>
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
                        </form>
                    </tr>
                </table>
            </div>
            <div class="gauchetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=observation&nt=non&aj=non&aft=oui&mo=non&sup=non&cho=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idobservation'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier une observation :</th>
                        <td><select name = "idobservation" size = "1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($listeObservation as $loc){
                                        $numobs = $loc['NUM_OBSERVATION'];
                                        $libobs = $loc['LIBELLE_OBSERVATION'];
                                        $selected = '';
                                        if($numobs == $_SESSION['idobservation']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['libobd'] = $libobs;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numobs; ?>"><?php echo $libobs; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=observation&nt=non&aj=non&aft=non&mo=non&sup=oui&cho=non'>
                                    <td>
                                        <input type="hidden" name="numobs" value="<?php echo $_SESSION['idobservation']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment supprimer cette observation ?"));'/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=observation&nt=non&aj=non&aft=non&mo=oui&sup=non&cho=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numobs" value="<?php echo $_SESSION['idobservation']; ?>"/>
                                        <textarea class="form-control" rows="5" name='nomobs' cols='150' maxlength='500' required="required" autofocus><?php echo $_SESSION['libobd']; ?></textarea>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>

                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
    <?php
			}
		}
        if($_SESSION['entpied'] == 'article'){
            ?>
            <table>
                <tr>
                    <td>
                        <a class="btn btn-default btn-ret" href="index.php?uc=<?php echo $uc_choix; ?>&action=observation&nt=non&aj=non&aft=non&mo=non&sup=non&cho=non" role="button">Retour</a>
                    </td>
                </tr>
            </table>
            <?php
        }
        if($_SESSION['entpied'] == 'preconisation'){
			if($_SESSION['isAdmin']==1){ 
    ?>
            <div class="gauchetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=preconisation&nt=non&aj=oui&aft=non&mo=non&sup=non&cho=non'>
                        <th>Ajouter une proposition :</th>
                    </tr>
                    <tr>
                        <td><textarea class="form-control" rows="10" name='newnompreco' cols='150' maxlength='750' required="required" placeholder="Nom de la préconisation"></textarea></td>
                        <td><input type='submit' value='Ajouter' name='ajouter' class="btn btn-default"/></td>
                        </form>
                    </tr>
                </table>
            </div>
            <div class="gauchetab">
                <table>
                    <tr>
                        <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=preconisation&nt=non&aj=non&aft=oui&mo=non&sup=non&cho=non'>
                        <?php 
                            $dis = '';
                            if($_SESSION['idpreconisation'] != null){
                                $dis = 'disabled="disabled"';
                            } 
                        ?>
                        <th>Modifier une proposition :</th>
                        <td><select name = "idpreconisation" size = "1" onchange="submit()" class="form-control">
                                <option <?php echo $dis; ?>>Choisir</option>
                                <?php
                                    foreach ($listepreconisation as $lp){
                                        $numpreco = $lp['NUM_PRECONISATION'];
                                        $libpreco = $lp['LIBELLE_PRECONISATION'];
                                        $selected = '';
                                        if($numpreco == $_SESSION['idpreconisation']){
                                            $selected = 'selected="selected"';
                                            $_SESSION['libpreco'] = $libpreco;
                                        }
                                ?>
                                <option <?php echo $selected; ?> value="<?php echo $numpreco; ?>"><?php echo $libpreco; ?></option>
                                <?php
                                    }
                                ?>
                            </select></td>
                        </form>
                        <?php
                            if($_SESSION['cachemo'] == false){
                        ?>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=preconisation&nt=non&aj=non&aft=non&mo=non&sup=oui&cho=non'>
                                    <td>
                                        <input type="hidden" name="numpreco" value="<?php echo $_SESSION['idpreconisation']; ?>"/>
                                        <input type='submit' value='Supprimer' name='supprimer' class="btn btn-default" onclick='return(confirm("Voulez-vous vraiment supprimer cette préconisation ?"));'/>
                                    </td>
                                </form> 
                    </tr>
                    <tr>
                                <form method='POST' action='index.php?uc=<?php echo $uc_choix; ?>&action=preconisation&nt=non&aj=non&aft=non&mo=oui&sup=non&cho=non'>
                                    <th>Nouveau nom :</th>
                                    <td>
                                        <input type="hidden" name="numpreco" value="<?php echo $_SESSION['idpreconisation']; ?>"/>
                                        <textarea class="form-control" rows="10" name='nompreco' cols='150' maxlength='1000' required="required" autofocus><?php echo $_SESSION['libpreco']; ?></textarea>
                                    </td>
                                    <td><input type='submit' value='Modifier' name='modifier' class="btn btn-default"/></td>
                                </form>

                        <?php
                            }
                        ?>
                    </tr>
                </table>
            </div>
    <?php
			}
        }
    ?>
</footer>
</div>
</body>
</html>