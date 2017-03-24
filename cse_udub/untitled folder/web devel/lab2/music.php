<!DOCTYPE html>
<html>
	<!--
	Web Programming Step by Step
	Lab #3, PHP
	-->

	<head>
		<title>Music Viewer</title>
		<meta charset="utf-8" />
		<link href="http://www.cs.washington.edu/education/courses/cse190m/12sp/labs/3/viewer.css" type="text/css" rel="stylesheet" />
	</head>

	<body>
		
		<h1>My Music Page</h1>
		
		<!-- Number of Songs (Variables) -->
		<?php 
			$num = 5678;
		?>
		<p>
			I love music.
			I have <?=$num?> total songs,
			which is over <?=$num/10?> hours of music!
		</p>

		<!-- Top Music News (Loops) -->
		<div class="section">
			<h2>Yahoo! Top Music News</h2>
			<ol>
			<?php
				$list = array("1","2","3","4","5");
				foreach($list as $single){
			?>
				<li><a href="http://music.yahoo.com/news/archive/<?=$single?>.html">Page <?=$single?></a></li>
			<?php }?>
			</ol>
		</div>

		<!-- Favorite Artists (Arrays) -->
		<!-- Favorite Artists from a File (Files) -->
		<div class="section">
			<h2>My Favorite Artists</h2>
		
			<ol>
				<?php
					$hala = file("favorite.txt",FILE_IGNORE_NEW_LINES);
					foreach($hala as $each){
					$wname = explode(" ",$each)
				?>
					<li><a href="http://music.yahoo.com/videos/<?=strtolower($wname[0])?>-<?=strtolower($wname[1])?>/"><?=$each?></a></li>
				<?php }?>
			</ol>
		</div>
		
		<!-- Music (Multiple Files) -->
		<!-- MP3 Formatting -->
		<div class="section">
			<h2>My Music and Playlists</h2>

			<ul id="musiclist">
				<li class="mp3item">
					<a href="http://webster.cs.washington.edu/songs/be-more.mp3">be-more.mp3</a>
				</li>
				
				<li class="mp3item">
					<a href="http://webster.cs.washington.edu/songs/centric-flow.mp3">centric-flow.mp3</a>
				</li>

				<li class="mp3item">
					<a href="http://webster.cs.washington.edu/songs/drift-away.mp3">drift-away.mp3</a>
				</li>

				<!-- Exercise 8: Playlists (Files) -->
				<li class="playlistitem">154-mix.m3u:
					<ul>
					<?php
						foreach(glob("songs/*.mp3") as $name) {
					?>
						<li><?=basename($name)?>(<?=filesize($name)/1024?>)</li>
					<?php }?>
					</ul>
				</li>
			</ul>
		</div>

		<div>
			<a href="https://webster.cs.washington.edu/validate-html.php">
				<img src="http://webster.cs.washington.edu/w3c-html.png" alt="Valid HTML5" />
			</a>
			<a href="https://webster.cs.washington.edu/validate-css.php">
				<img src="http://webster.cs.washington.edu/w3c-css.png" alt="Valid CSS" />
			</a>
		</div>
	</body>
</html>
