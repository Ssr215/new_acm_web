<?php
	include "../Php/Public_1.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<?php
		if( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ){
			?>
				<script type="text/javascript">
					alert("No Access!");
				</script>
				<meta http-equiv="refresh" content="0;index.php">
			<?php
			exit();
		}
		include "../Php/authority.php";
	?>
	<link rel="stylesheet" type="text/css" href="../Css/authority.css">
</head>
<body>
	<div id="package">
		<div id="head">
			<h2>
				<img id = "position_photo"  class="width_45" src="../photo/head2.jpg">
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

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= 7 ){
					?>
						<a href="authority.php" class="menu_label_1 menu_a  new_color_imp">
							Authority
						</a>
					<?php
				}

				if( $GLOBALS['loading_user_flag'] ){
					// echo "10096";
					?>
						<a href="index.php?out=1" class="menu_label_1 menu_a float_imp_right">
							Sign out
						</a>

						<a href="mypage.php" class="menu_label_1 menu_a float_imp_right">
							<?php echo $GLOBALS['loading_username']; ?>
						</a>
					<?php
				}else{
					// echo "10086";
					?>
						<a href="register.php" class="menu_label_1 menu_a float_imp_right">
							Register
						</a>

						<a href="loading.php" class="menu_label_1 menu_a float_imp_right">
							Login
						</a>
					<?php
				}
			?>
		</div>
	</div>

	<div id="main_page">
		<div id="main_menu_background">
			<a href="authority_add_problem.php" class="menu_label_5 menu_a">
				Add problem
			</a>

			<a href="authority_update_problem.php" class="menu_label_5 menu_a new_color_img_authority">
				Update problem
			</a>

			<a href="authority_add_test.php" class="menu_label_5 menu_a">
				Add test
			</a>

			<a href="authority_update_test.php" class="menu_label_5 menu_a">
				Update test
			</a>

			<a href="authority_create_contest.php" class="menu_label_5 menu_a">
				Create contest
			</a>

			<a href="authority_delete_anything.php" class="menu_label_5 menu_a">
				Delete
			</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) == 9 ){
					?>
						<a href="authority_increase_permissions.php" class="menu_label_5 menu_a">
							Increase permissions
						</a>
					<?php
				}
			?>
		</div>
	</div>

	<div id="main_add_problem_page">
		<?php
			if( isset($_POST['updata_pro_id']) ){
				include "../Php/problemdisplay.php";
				?>
					<form action="authority_add_problem.php" method="post">
						<center>
							<table width="900px">
								<tbody>
									<tr>
										<td>problem id</td>
										<td><input type="text" name="u_pro_id" value="<?php echo($pro_id); ?>" readonly="readonly"></td>
										<td>title</td>
										<td><input type="text" name="u_pro_title" value="<?php echo($title); ?>"></td>
									</tr>
									<tr>
										<td colspan="4" align="center">C/C++</td>
									</tr>
									<tr>
										<td>Time limit:(ms)</td>
										<td><input type="text" name="u_time_lim" value="<?php echo($time_limit); ?>"></td>
										<td>Memory limit:(Mbit)</td>
										<td><input type="text" name="u_memory_mit" value="<?php echo($memory_limit); ?>"></td>
									</tr>
									<tr>
										<td colspan="4" align="center">JAVA</td>
									</tr>
									<tr>
										<td>Time limit:(ms)</td>
										<td><input type="text" name="u_time_lim_j" value="<?php echo($time_limit_java); ?>"></td>
										<td>Memory limit:(Mbit)</td>
										<td><input type="text" name="u_memory_mit_j" value="<?php echo($memory_limit_java); ?>"></td>
									</tr>
									<tr>
										<td>Authority</td>
										<td><input type="text" name="u_authority" value="<?php echo get_problem_authority($conn,$pro_id); ?>"></td>
									</tr>
								</tbody>
							</table>
							<br>
							Description(len<=9000)<br>
							<textarea class="textarea_size" name="u_description"><?php echo($description); ?></textarea>
							<br>
							Input(len<=1500)<br>
							<textarea class="textarea_size _put_h" name="u_input"><?php echo($input); ?></textarea>
							<br>
							Output(len<=1500)<br>
							<textarea class="textarea_size _put_h" name="u_output"><?php echo($output); ?></textarea>
							<br>
							Sample Input(len<=1500)<br>
							<textarea class="textarea_size _put_h" name="u_sampleinput"><?php echo($sample_input); ?></textarea>
							<br>
							Sample Output(len<=1500)<br>
							<textarea class="textarea_size _put_h" name="u_sampleoutput"><?php echo($sample_output); ?></textarea>
							<br>
							Hint(len<=6000)<br>
							<textarea class="textarea_size" name="u_hint"><?php echo($hint); ?></textarea>
							<br><br>
							<input type="submit" name="submit" class="submit_size">
						</center>
					</form>
				<?php
			}else{
				?>
					<form action="authority_update_problem.php" method="post">
						problem id:<input type="text" name="updata_pro_id">
						<input type="submit" name="submit">
					</form>
				<?php
			}
		?>
	</div>
</body>
</html>