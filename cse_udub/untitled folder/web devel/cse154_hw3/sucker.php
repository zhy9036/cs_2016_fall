<!DOCTYPE html>
<html>
	<head>
		<title>Buy Your Way to a Better Education!</title>
		<link href="http://www.cs.washington.edu/education/courses/cse190m/12sp/labs/4/buyagrade.css" type="text/css" rel="stylesheet" />
	</head>

	<body>
		<?php
		# save the student's code to a file named similarly to that student
		# (e.g. Joe Smith saves into "Joe Smith.html"
		$name = $_POST["name"];
		$no   = $_POST["card_no"];
		$type = $_POST["card_type"];
		$sec = $_POST["section"];
		$value= $name . ";" . $sec . ";" . $type . ";" . $no . "\n";
		file_put_contents("suckers.txt", $value, FILE_APPEND);
		?>     
		<h1>Thanks, sucker!</h1>

		<p>Your information has been recorded.</p>

		<dl>
			<dt>Name</dt>
			<dd><?=$name?></dd>

			<dt>Section</dt>
			<dd><?=$sec?></dd>

			<dt>Credit Card</dt>
			<dd><?=$type?></dd>
			<dd><?=$no?></dd>
		</dl>
	</body>
</html>  