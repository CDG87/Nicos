<?php
include("include/entete.php");
?>
</br></br></br></br></br></br>

<form method="post" action="index.php?uc=maj&action=choixActionCritere">

	<label>Partie :</label>
	<select name="partie" onchange="submit()">
		<?php if($_SESSION['majpartie']==""){ ?>
		<option value="" disabled selected >Choisir...</option>
		<?php } ?>
		<?php if($_SESSION['majpartie']=="1"){ ?>
		<option value="1" selected>Organisationnel</option>
		<?php }else{ ?>
		<option value="1">Organisationnel</option>
		<?php } ?>
		<?php if($_SESSION['majpartie']=="2"){ ?>
		<option value="2" selected>Sur site</option>
		<?php }else{ ?>
		<option value="2">Sur site</option>
		<?php } ?>
		
	</select>
	</br></br>
	
	
	<label>Theme :</label>
	<select name="theme" onchange="submit()">
	<?php if($_SESSION['majtheme']==""){ ?>
		<option value="" disabled selected >Choisir...</option>
		<?php } ?>
	<?php foreach($lstTheme as $ltheme) { 
			if($ltheme['NUM_THEME'] == $_SESSION['majtheme']) { ?>
			<option selected="selected" value="<?php echo $ltheme['NUM_THEME']; ?>"><?php echo $ltheme['NOM_THEME']; ?></option>
	<?php }else { ?>
			<option value="<?php echo $ltheme['NUM_THEME']; ?>"><?php echo $ltheme['NOM_THEME']; ?></option>
	<?php
				}
		} ?>
	</select>
	</br></br>
	

	<label>Sous theme :</label>
	<select name="st" onchange="submit()">
	<?php if($_SESSION['majst']==""){ ?>
		<option value="" disabled selected >Choisir...</option>
		<?php } ?>
	<?php foreach($lstSt as $lst) { 
			if($lst['NUM_SOUS_THEME'] == $_SESSION['majst']) { ?>
			<option selected="selected" value="<?php echo $lst['NUM_SOUS_THEME']; ?>"><?php echo $lst['LIBELLE_SOUS_THEME']; ?></option>
	<?php }else { ?>
			<option value="<?php echo $lst['NUM_SOUS_THEME']; ?>"><?php echo $lst['LIBELLE_SOUS_THEME']; ?></option>
	<?php
				}
		} ?>
	
	</select>
	</br></br>
	

	<label>critere :</label>
	<select name="critere" onchange="submit()">
	<?php if($_SESSION['majcritere']==""){ ?>
		<option value="" selected >Choisir...</option>
		<?php } ?>
	<?php foreach($lstCrit as $lcrit) { 
			if($lcrit['NUM_CRITERE'] == $_SESSION['majcritere']) { ?>
			<option selected="selected" value="<?php echo $lcrit['NUM_CRITERE']; ?>"><?php echo $lcrit['LIBELLE_CRITERE']; ?></option>
	<?php }else { ?>
			<option value="<?php echo $lcrit['NUM_CRITERE']; ?>"><?php echo $lcrit['LIBELLE_CRITERE']; ?></option>
	<?php
				}
		} ?>
	</select>

	</br></br>
	<button type="submit" name="selection"> Selectionner</button>
	
</form>