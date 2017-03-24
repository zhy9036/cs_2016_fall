<!DOCTYPE html>
	<!-- 
	CSE 154 HW4
	YANG ZHANG 1030416
	This is the php file for matches-submit page
	-->
	<html>
		<?php 
		include("common.php");
		head();
		$user_name=$_GET["name"];
		$singles = file("singles.txt");
		$user_age;
		$user_sex;
		$user_age;
		$user_type;
		$user_os;
		$user_min;
		$user_max;
		foreach($singles as $single){
			$temp = explode(",", $single);
			if($temp[0]== $user_name){
				list($user_name,$user_sex,$user_age,$user_type,$user_os,$user_min,$user_max) = $temp;	
			}
		}
		
		?>

		<body>
			<?=logo() ?>
			<h1>Matches for <?=$user_name?></h1>
			
			<?php #find all the matches for passed name
				foreach($singles as $single){
					$temp = explode(",", $single);
					if($temp[0]!=$user_name){
						list($name,$sex,$age,$type,$os,$min,$max) = $temp;	
						if($sex!=$user_sex && 
						   $age>=$user_min && $age<=$user_max &&
						   $user_age>=$min && $user_age <= $max &&
						   $os == $user_os){
						   $count = 0;
						   $i=0;
						   while($count == 0){
						   		if($user_type{$i} == $type{$i}){
						   			info($name,$sex,$age, $type, $os);
						   			$count++;
						   		}
						   		$i++;
						   }
						}			
					}
				}
	
			bottom(); 
			?>
		</body>
		
		<?php # this function is for producing matching result
			function info($name,$sex,$age, $type, $os){ ?>
			<div class="match">
				<p> 
					<img src="https://webster.cs.washington.edu/images/nerdluv/user.jpg" alt="user_icon">
					<?=$name?>  
				</p>
				<ul>
					<li><strong>gender:</strong> <?=$sex?> </li>
					<li><strong>age:</strong> <?=$age?> </li>
					<li><strong>type:</strong> <?=$type?> </li>
					<li><strong>OS:</strong> <?=$os?> </li>
				</ul>
			
			</div>
			<?php } ?>
	</html>