<?php
	include "../../Php/Public_1.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../../Css/public_1.css">
	<?php
		if( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ){
			?>
				<script type="text/javascript">
					alert("No Access!");
				</script>
				<meta http-equiv="refresh" content="0;../index.php">
			<?php
			exit();
		}
		include "../../Php/authority.php";
	?>
	<link rel="stylesheet" type="text/css" href="../../Css/authority.css">
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
			<a href="../index.php" class="menu_label_1 menu_a">
				<img id = "position_photo" src="../../photo/display1.png">
				Home
			</a>

			<a href="../problem.php" class="menu_label_1 menu_a">
				Problem
			</a>

			<a href="../Status.php" class="menu_label_1 menu_a">
				Status
			</a>

			<a href="../huck_display.php" class="menu_label_1 menu_a">
				Huck
			</a>

			<a href="../Contest.php" class="menu_label_1 menu_a">
				contest
			</a>

			<a href="../user.php" class="menu_label_1 menu_a">
				User
				<!-- 排名记录 -->
			</a>

			<a href="../forum.php" class="menu_label_1 menu_a">
				Forum
				<!-- 交流区，主要讨论题目错误或者疑问的地方 -->
			</a>

			<a href="../article.php" class="menu_label_1 menu_a">
				Article
				<!-- 发表文章、竞赛题解、话题的地方 -->
			</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= 7 ){
					?>
						<a href="index.php" class="menu_label_1 menu_a  new_color_imp">
							Authority
						</a>
					<?php
				}

				if( $GLOBALS['loading_user_flag'] ){
					// echo "10096";
					?>
						<a href="../index.php?out=1" class="menu_label_1 menu_a float_imp_right">
							Sign out
						</a>

						<a href="../mypage.php" class="menu_label_1 menu_a float_imp_right">
							<?php echo $GLOBALS['loading_username']; ?>
						</a>
					<?php
				}else{
					// echo "10086";
					?>
						<a href="../register.php" class="menu_label_1 menu_a float_imp_right">
							Register
						</a>

						<a href="../loading.php" class="menu_label_1 menu_a float_imp_right">
							Login
						</a>
					<?php
				}
			?>
		</div>
	</div>

	<div id="main_page">
		<div id="main_menu_background">
			<a href="add_problem.php" class="menu_label_5 menu_a new_color_img_authority">
				Add problem
			</a>

			<a href="update_problem.php" class="menu_label_5 menu_a">
				Update problem
			</a>

			<a href="add_test.php" class="menu_label_5 menu_a">
				Add test
			</a>

			<a href="update_test.php" class="menu_label_5 menu_a">
				Update test
			</a>

			<a href="create_contest.php" class="menu_label_5 menu_a">
				Create contest
			</a>

			<a href="delete_anything.php" class="menu_label_5 menu_a">
				Delete
			</a>

			<a href="allow_huck.php" class="menu_label_5 menu_a">
				Open huck
			</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) == 9 ){
					?>
						<a href="increase_permissions.php" class="menu_label_5 menu_a">
							Increase permissions
						</a>
					<?php
				}
			?>
		</div>
	</div>

	<div id="main_add_problem_page">
		<form action="add_problem.php" method="post">
			<center>
				<table width="900px">
					<tbody>
						<tr>
							<td>problem id</td>
							<td><input type="text" name="pro_id" value="<?php echo get_next_new_pro_id($conn); ?>" readonly="readonly"></td>
							<td>title</td>
							<td><input type="text" name="pro_title"></td>
						</tr>
						<tr>
							<td colspan="4" align="center">C/C++</td>
						</tr>
						<tr>
							<td>Time limit:(ms)</td>
							<td><input type="text" name="time_lim"></td>
							<td>Memory limit:(Mbit)</td>
							<td><input type="text" name="memory_mit"></td>
						</tr>
						<tr>
							<td colspan="4" align="center">JAVA</td>
						</tr>
						<tr>
							<td>Time limit:(ms)</td>
							<td><input type="text" name="time_lim_j"></td>
							<td>Memory limit:(Mbit)</td>
							<td><input type="text" name="memory_mit_j"></td>
						</tr>
						<tr>
							<td>Authority</td>
							<td><input type="text" name="authority" value="0"></td>
							<td>Special judgment</td>
							<td>
								<select name="S_judgment">
									<option value="0">No</option>
									<option value="1">Yes</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				Node:If the answer is not unique , please using Special judgment , and the codes printf "yes" on the first line if result is Accepted
				<br>
				Description(len<=9000)<br>
				<textarea class="textarea_size" name="description"></textarea>
				<br>
				Input(len<=1500)<br>
				<textarea class="textarea_size _put_h" name="_input"></textarea>
				<br>
				Output(len<=1500)<br>
				<textarea class="textarea_size _put_h" name="_output"></textarea>
				<br>
				Sample Input(len<=1500)<br>
				<textarea class="textarea_size _put_h" name="sampleinput"></textarea>
				<br>
				Sample Output(len<=1500)<br>
				<textarea class="textarea_size _put_h" name="sampleoutput"></textarea>
				<br>
				Hint(len<=6000)<br>
				<textarea class="textarea_size" name="hint"></textarea>
				<br>
				Special judgment code<br>
				<textarea class="textarea_size" name="S_judgment_code"></textarea>
				<br><br>
				<input type="submit" name="submit" class="submit_size">
			</center>
		</form>
	</div>
</body>
</html>