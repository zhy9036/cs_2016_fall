<!DOCTYPE html>
	<!-- 
	CSE 154 HW4
	YANG ZHANG 1030416
	This is the php file for matches page
	-->
	<html>
		<?php 
		include("common.php");
		head();
		?>

		<body>
			<?=logo() ?>
			<form action="matches-submit.php" method="GET">
				<fieldset>
					<legend>Returning User:</legend>
					<div>
						<strong>Name:</strong>
						<input type="text" name= "name" size="16"/>
					</div>
					
					<div>
						<input type="submit" value="View My Matches" />
					</div>
									
				</fieldset>
			</form>
			<?=bottom()?>
		</body>
	</html>