<!DOCTYPE html>
	<!-- 
	CSE 154 HW4
	YANG ZHANG 1030416
	This is the php file for signup-submit page
	Extra:
	Robust page with form validation.
	-->
	<html>
		<?php 
		include("common.php");
		head();
		$exist=false;
		$name = $_POST["name"];
		$sex  = $_POST["gender"];
		$age  = $_POST["age"];
		$type = $_POST["p-type"];
		$os   = $_POST["os"];
		$min  = $_POST["min"];
		$max  = $_POST["max"]; 
		$reg_num="/^[0-9][0-9]*$/";
		$singles = file("singles.txt");
			
		foreach($singles as $single){
			$temp = explode(",", $single);
			if($temp[0]== $name){
				$exist=true;
			}
		}
		if(!preg_match("/.+\S/",$name)||                     #check if the name is empty
		   !preg_match("/^(male|female|m|f)$/i",$sex)||      #check if the gender is valid
		   !preg_match($reg_num,$age)||       	             #check if the age is valid   
		   !preg_match("/[I|E][N|S][F|T][J|P]/",$type)||     #check if the p-type is valid   
		   !preg_match("/^(Windows|Mac OS X|Linux)$/",$os)|| #check if the OS is valid
		   !(preg_match($reg_num,$min) && 					 #check if the range is valid
		   		preg_match($reg_num,$max)&&
		   		$min<=$max)){ 
			
			logo(); ?>
			<h1>Error! Invaild data found! Please go back and try again.</h1>
				
		<?php 
				bottom();
				exit;
		}		
		if($exist){ 
			logo(); ?>
			<h1><?=$name?>, you have signed up already!</h1>
			<?php bottom();
			exit;
		}
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