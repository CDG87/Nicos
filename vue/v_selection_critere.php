<?php
include("include/entete.php");
?>
</br></br></br></br></br></br>

<div class="row">
<div class="col-xs-12 col-sm-6 col-md-8">
<form method="post" action="index.php?uc=maj&action=choixActionCritere">
	<div class="form-group">
		<label class="col-sm-3">Partie :</label>
		<div class="col-sm-4">
			<select name="partie" class="form-control" onchange="submit()" required>
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
		</div>
	</div>
	</br></br></br>
	<div class="form-group">
		<label class="col-sm-3">Theme :</label>
		<div class="col-sm-4">
			<select name="theme" class="form-control" onchange="submit()" required >
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
		</div>
	</div>
	</br></br>
	<div class="form-group">
		<label class="col-sm-3">Sous theme :</label>
		<div class="col-sm-4">
			<select name="st" class="form-control" onchange="submit()">
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
		</div>
	</div>
	</br></br>
	<div class="form-group">
		<label class="col-sm-3">critere :</label>
		<div class="col-sm-4">
			<select name="critere" class="form-control" onchange="submit()" required>
			<?php if($_SESSION['majcritere']==""){ ?>
				<option value="" selected disabled >Choisir...</option>
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
		</div>
	</div>
	</br></br>
</form>
<form action="index.php?uc=maj&action=pageMenuCrit" method="POST">
	<button type="submit" class="btn btn-primary" name="selection"> Selectionner</button>
</form>

</div>
</div>
