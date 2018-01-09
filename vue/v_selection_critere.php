<?php
include("include/entete.php");
?>
<form method="post" action="">
	<label>Partie :</label>
	<select name="partie">
		<option value="1">Organisationnel</option>
		<option value="2">Sur site</option>
	</select>
	
	<label>Theme :</label>
	<select name="theme">
	<?php
	foreach($lstTheme as $theme){ ?>
		<option value="<?php echo $theme['NUM_THEME']; ?>"><?php echo $theme['NOM_THEME'] ?></option>
	<?php
	}
	?>
	</select>
	
	<label>Sous theme :</label>
	<select name="st">
	<option value="0">aucun sous theme</option>
	<?php
	foreach($lstSt as $st){ ?>
		<option value="<?php echo $st['NUM_SOUS_THEME']; ?>"><?php echo $st['LIBELLE_SOUS_THEME'] ?></option>
	<?php
	}
	?>
	</select>
	
	<label>critere :</label>
	<select name="critere">
	<?php
	foreach($lstCrit as $crit){ ?>
		<option value="<?php echo $crit['NUM_CRITERE']; ?>"><?php echo $crit['LIBELLE_CRITERE'] ?></option>
	<?php
	}
	?>
	</select>
	
	<button type="submit" name="selection"> Selectionner</button>
</form>