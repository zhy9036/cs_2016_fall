<!DOCTYPE html>
	<!-- 
	CSE 154 HW4
	YANG ZHANG 1030416
	This is the php file for signup-submit page
	-->
	<html>
		<?php 
		include("common.php");
		head();
		$name = $_POST["name"];
		$sex  = $_POST["gender"];
		$age  = $_POST["age"];
		$type = $_POST["p-type"];
		$os   = $_POST["os"];
		$min  = $_POST["min"];
		$max  = $_POST["max"];
		$info = $name . "," . $sex . "," . $age . "," . $type .
				 "," . $os . "," . $min . "," . $max . "\n";
		file_put_contents("singles.txt",$info,FILE_APPEND);
		?>

		<body>
			<?=logo() ?>
			<h1> Thank you!</h1>
			<p>Welcome to NerdLuv, <?=$name?>!</p>
			<P>Now <a href="matches.php">log in to see your matches!</a></p>
			<?=bottom()?>
		</body>
	</html>