<?php
include("include/entete.php");
?>
<form method="POST" action="index.php?uc=maj&action=pageMenuCrit">
	<table>
		<tr>
			<td>
				<button type="submit" name="article" class="btn btn-primary btn-lg">Article</button>
			</td>
			<td>
				<button type="submit" name="observation" class="btn btn-primary btn-lg">Observations</button>
			</td>
			<td>
				<button type="submit" name="proposition" class="btn btn-primary btn-lg">Propositions</button>
			</td>
			<td>
				<button type="submit" name="image" class="btn btn-primary btn-lg">Image</button>
			</td>
		</tr>
	</table>
</form>