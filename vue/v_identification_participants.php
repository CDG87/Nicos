<form class="form-horizontal" method="post" action="index.php?uc=identification&action=saisie_participants">

	<div class="form-group">
		
		<label class="col-sm-3" for="participants">Participants :</label>
		<div class="col-sm-4">
		<?php
		
			if($_SESSION['participant_saisi'] == false) { ?>
				<input required="required" class="form-control" type="text" placeholder="2" name="nb_participants" value="<?php echo ($_SESSION['participant_saisi'] == false) ? '' : $_SESSION['nbParticipants'] ?>" autofocus/>
				</div>
			</br></br>
			<input class="btn btn-default" type="submit" name="saisie_participants" id="add" value="Effectuer la saisie" />
			<?php
			}else { ?>
			
				<input type="text" class="form-control" name="nb_participants" value="<?php echo $_SESSION['nbParticipants']; ?>" readonly />
				
				<?php
			}
			
		
			
		?>
			
		
		
	</div>
	
</form>
