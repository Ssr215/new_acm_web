<?php
	include "../Php/Public_1.php";
	include '../Php/Register.php';
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../Css/loading.css">
	<?php
		if( $register_success_flag == 1 ){
			?>
				<script type="text/javascript">
					alert("register is successed! Please loaing it!");
				</script>
				<meta http-equiv="refresh" content="0;url=loading.php">
			<?php
		}else if( $register_success_flag == 2 ){
			?>
				<script type="text/javascript">
					alert("register is failure! user_name has use in other user!");
				</script>
			<?php
		}else if( $register_success_flag == 3 ){
			?>
				<script type="text/javascript">
					alert("register is failure! This is the problem in sever! Please call the admit!")；
				</script>
			<?php
		}
	?>
</head>
<body>
	<div id="package">
		<div id="head">
			<h2>
				<!-- <img id = "position_photo"  class="width_45" src="../photo/head2.jpg"> -->
				<span class="_blue_1">Online Judge in private</span>
			</h2>
		</div>
		<div id="menu_backgound">
			<a href="index.php" class="menu_label_1 menu_a">
				<img id = "position_photo" src="../photo/display1.png">
				Home
			</a>

			<a href="problem.php" class="menu_label_1 menu_a">
				Problem
			</a>

			<a href="Status.php" class="menu_label_1 menu_a">
				Status
			</a>

			<a href="Contest.php" class="menu_label_1 menu_a">
				contest
			</a>

			<a href="user.php" class="menu_label_1 menu_a">
				User
				<!-- 排名记录 -->
			</a>

			<a href="forum.php" class="menu_label_1 menu_a">
				Forum
				<!-- 交流区，主要讨论题目错误或者疑问的地方 -->
			</a>

			<a href="article.php" class="menu_label_1 menu_a">
				Article
				<!-- 发表文章、竞赛题解、话题的地方 -->
			</a>

			<a href="register.php" class="menu_label_1 menu_a float_imp_right new_color_imp">
				Register
			</a>

			<a href="loading.php" class="menu_label_1 menu_a float_imp_right">
				Login
			</a>
		</div>

		<div id="loading_pages_in_outdoor">
			<form action="register.php" method="post">
				<center>
					<table width="450px" height="160px">
						<tbody>
							<tr>
								<td>Username:</td>
								<td><input type="text" name="user_name2"></td>
							</tr>
							<tr>
								<td>Nikename</td>
								<td><input type="text" name="nike_name2"></td>
							</tr>
							<tr>
								<td>Password:</td>
								<td><input type="password" name="pass_word2"></td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="submit" name="submit">
									<!-- <a href="lostpassword.php">Lostpassword</a> -->
								</td>
							</tr>
						</tbody>
					</table>
				</center>
			</form>

		</div>

	</div>
</body>
</html>