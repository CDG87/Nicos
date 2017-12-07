<div>
	<ul>
		<?php
			foreach($_REQUEST['erreurs'] as $uneErreur) { 
				echo "<li>$uneErreur</li>";
			}
		?>
	</ul>
</div>