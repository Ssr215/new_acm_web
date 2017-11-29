<?php
	include "../Php/Public_1.php";
	$update_test_id = -1;
	$update_test_pro_id = -1;
	if( isset($_POST['update_test_pro_id']) ){
		$update_test_pro_id = $_POST['update_test_pro_id'];
		$update_test_id = $_POST['update_test_id'];
		if (isset($_POST['update_test_input'])) {
			$up_input = $_POST['update_test_input'];
			$up_output = $_POST['update_test_output'];
			date_default_timezone_set("Asia/Shanghai");
			$time_now = date("Y-m-d H:i:s");
			$sql = "UPDATE problem_test SET input='$up_input',output='$up_output',_date='$time_now' WHERE pro_id='$update_test_pro_id' AND test_number='$update_test_id'";
			if( !mysqli_query($conn,$sql) ){
				echo "Error: " . $sql . "<br>" . $conn->error;
			}
		}
	}
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

			<a href="authority_update_problem.php" class="menu_label_5 menu_a">
				Update problem
			</a>

			<a href="authority_add_test.php" class="menu_label_5 menu_a">
				Add test
			</a>

			<a href="authority_update_test.php" class="menu_label_5 menu_a new_color_img_authority">
				Update test
			</a>

			<a href="authority_create_contest.php" class="menu_label_5 menu_a">
				Create contest
			</a>

			<a href="authority_update_contest.php" class="menu_label_5 menu_a">
				Update contest
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
		<form action="authority_update_test.php" method="post">
			problem id: <input type="text" name="update_test_pro_id" value=" <?php echo $update_test_pro_id ?> ">
			test id: <input type="text" name="update_test_id" value="<?php echo $update_test_id ?>" >
			<?php
				if( $update_test_id != -1 ){
					$pre_input = "nothing";
					$pre_output = "nothing";
					$sql = "SELECT * FROM problem_test WHERE pro_id='$update_test_pro_id' AND test_number='$update_test_id'";
					$result = mysqli_query($conn,$sql);
					if( !$result ){
						echo "Error: " . $sql . "<br>" . $conn->error;
					}else{
						while ($row = mysqli_fetch_array($result)) {
							$pre_input = $row['input'];
							$pre_output = $row['output'];
							// echo $pre_input."\n".$pre_output;
						}
						?>
							<br>
							INPUT
							<br>
							<textarea class="textarea_size _put_h" name="update_test_input"><?php echo $pre_input; ?></textarea>
							<br>
							OUTPUT
							<br>
							<textarea class="textarea_size _put_h" name="update_test_output"><?php echo $pre_output; ?></textarea>
						<?php
					}

				}
			?>
			<br>
			<input type="submit" name="submit" class="submit_size">
		</form>
	</div>
</body>
</html>