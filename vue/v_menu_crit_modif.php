<?php
include("include/entete.php");
?>
<form method="POST" action="index.php?uc=maj&action=pageMenuCrit">
	<table>
		<tr>
			<td>
				<button type="submit" name="article" class="btn btn-primary btn-lg">Article </br> <?php echo $_SESSION['listearticle']['DATE_ARTICLE']; ?></button>
			</td>
			<td>
				<button type="submit" name="observation" class="btn btn-primary btn-lg">Observations </br> <?php echo $_SESSION['dateMaj']['DATE_OBSERVATION'];?></button>
			</td>
			<td>
				<button type="submit" name="proposition" class="btn btn-primary btn-lg">Propositions </br> <?php echo $_SESSION['dateMaj']['DATE_PROPOSITION']; ?> </button>
			</td>
			<td>
				<button type="submit" name="image" class="btn btn-primary btn-lg">Image </br> <?php echo $_SESSION['dateMaj']['DATE_IMAGE']; ?> </button>
			</td>
		</tr>
	</table>
</form>