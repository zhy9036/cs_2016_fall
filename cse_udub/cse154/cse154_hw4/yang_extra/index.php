<!DOCTYPE html>
<html>
	<!--
	CSE 154, Homework 4 (NerdLuv)
	This provided file is the front page that links to two of the files
	you are going to write, signup.php and matches.php.
	You can modify this file as necessary to move redundant code out to common.php.
	-->
	<?php include("common.php");
		head();
	?>

	<body>
	<?=logo() ?>
	
	<div>
			<h1>Welcome!</h1>

			<ul>
				<li>
					<a href="signup.php">
						<img src="https://webster.cs.washington.edu/images/nerdluv/signup.gif" alt="icon" />
						Sign up for a new account
					</a>
				</li>

				<li>
					<a href="matches.php">
						<img src="https://webster.cs.washington.edu/images/nerdluv/heartbig.gif" alt="icon" />
						Check your matches
					</a>
				</li>
			</ul>
		</div>
		
		<?=bottom() ?>
		
		
	</body>
</html>