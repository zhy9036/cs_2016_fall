<!DOCTYPE html>
	<!-- 
	CSE 154 HW4
	YANG ZHANG 1030416
	This is the php file for signup page
	-->
	<html>
		<?php 
		include 'common.php';
		head()
		?>
		
		<body>
			
			<?=logo() ?>
			<form action="signup-submit.php" method="POST">
				<fieldset>
					<legend>New User Signup:</legend>
					
					<div>
						<strong>Name:</strong>
						<input type="text" name="name" size="16" />
					</div>
					
					<div>
						<strong>Gender:</strong>
						<label><input type="radio" name="gender" value="M" />Male</label>
						<label><input type="radio" name="gender" value="F" checked/>Female</label>
					</div>
					
					<div>
						<strong>Age:</strong>
						<input type="text" name="age" maxlength="2" size="6" />
					</div>
					
					<div>
						<strong>Personality type:</strong>
						<input type="text" name="p-type" maxlength="4" size="6" />
						(<a href="http://www.humanmetrics.com/cgi-win/JTypes2.asp">Don't you know your type</a>)
					</div>	
					
					<div>
						<strong>Favorite OS:</strong>
						<select name="os">
							<option value="Windows">Windows</option>
							<option value="Mac OS X">Mac OS X</option>
							<option value="Linux">Linux</option>
						</select>
					</div>
					
					<div>
						<strong>Seeking age:</strong>
						<input type="text" name="min" size="6" maxlength="2" placeholder="min" />
						to
						<input type="text" name="max" size="6" maxlength="2" placeholder="max" />
					</div>
					
					
					<div>
						<input type="submit" value="Sign Up" />
					</div>
				</fieldset>
			</form>
			
			<?=bottom()?>
		
		
		</body>
	</html>	