<!-- 
CSE 154 AA
HW3
YANG ZHANG 1030416
This is the main php file for fake movie review website
-->
<!DOCTYPE html>

<html>
	<?php 
		#get movie parameters and process them 
		$movie= $_GET["film"]; 
		list($mname, $year, $rate)  = file("$movie/info.txt",FILE_IGNORE_NEW_LINES);
		$files=glob("$movie/review*.txt");
		$size = count($files);
		$nleft;
		$nright;
		if($size%2 == 0){
			$nleft=array_slice($files,0,$size/2);
			$nright=array_slice($files,$size/2);
		}else{
			$nleft=array_slice($files,0,($size+1)/2);
			$nright=array_slice($files,($size+1)/2);
		}
	?>
	<head>

		<title><?=strtolower($mname)?> - Rancid Tomatoes</title>

		<meta charset="utf-8" />

		<link href="movie.css" type="text/css" rel="stylesheet" />

	</head>

	<body>
		
		
		<?=topbar()?>
		<div>
			<h1><?=$mname?> (<?=$year?>)</h1>
		</div>
		

		<div id="whole">

			<?=rating($rate)?>
		
			<div class="wholebottom">
				<?=overview($movie)?>
				<div class="wholeleft">
					<?=reviewblock($nleft)?>
					<?=reviewblock($nright)?>
				</div>
			</div>	

			<div id="page">

				(1-<?=$size?>) of <?=$size?>

			</div>
			<?=rating($rate)?>
		</div>

		<div id="checker">

			<a href="https://webster.cs.washington.edu/validate-html.php"><img src="https://webster.cs.washington.edu/images/w3c-html.png" alt="Valid HTML5" /></a><br />

			<a href="https://webster.cs.washington.edu/validate-css.php"><img src="https://webster.cs.washington.edu/images/w3c-css.png" alt="Valid CSS" /></a>

		</div>
		<?=topbar()?>

	</body>
	
	<!-- php_Functions -->
	
	<?php 
		# function for displaying rating pic and number
		function rating($percent){ ?>
				<div class="percent">
					<?php if($percent<60){ ?>
						<img src="https://webster.cs.washington.edu/images/rottenlarge.png" alt="Rotten" />
					<?php }else{ ?>
						<img src="https://webster.cs.washington.edu/images/freshlarge.png" alt="Fresh" />
					<?php } ?>
					<span><?=$percent?>%</span>
				</div>
	<?php } ?>
	
	
	<?php 
	# this function produces infomation for a movie
	function overview($movie){
	$arrayinfos = file("$movie/overview.txt", FILE_IGNORE_NEW_LINES);
	?>
	<div id="col_l">
	<div id="overview">
		<img src="<?=$movie?>/overview.png" alt="general overview" />
	</div>
	<div id="info">
		<dl>
		<?php foreach($arrayinfos as $info){ 
			list($title, $sub) = explode(":", $info);
			?>
			<dt><?=$title?></dt>
			<?php if($title!="LINKS"){ ?>
			<dd><?=$sub?></dd>
			<?php }else{ ?>
			<dd>
				<ul>
					<li> <?php Print $sub ?></li>												
				</ul>
			</dd>
		
		<?php } ?>
	<?php } ?>
		</dl>
	</div>
	</div>	
	<?php } ?>
	
	 <?php
 	# this function produces reviews
 	function reviewblock($reviews){
 		?>
		<div class="left">
			<?php foreach($reviews as $review){
				list($comment, $ifLike, $pname, $dept)=file("$review",FILE_IGNORE_NEW_LINES);
				?>
			<div class="reviewbox">
				<p class = "review">
					<img src="https://webster.cs.washington.edu/images/<?=strtolower($ifLike)?>.gif" alt="<?=strtolower($ifLike)?>" />
					<q><?=$comment?></q>
				</p>
				<p class="person">
					<img src="https://webster.cs.washington.edu/images/critic.gif" alt="Critic" />
					<?=$pname?> <br />
					<span><?=$dept?></span>
				</p>
			</div>
			<?php } ?>
		</div>
 	<?php } ?>	
 	
 	<?php 
 	# this function produces the top bar
 	function topbar(){ ?>
		<div class="topbar">
			<div class="mainbar">
				<img src="https://webster.cs.washington.edu/images/rancidbanner.png" alt="Rancid Tomatoes" />
			</div>
		</div>
	<?php } ?>

</html>

