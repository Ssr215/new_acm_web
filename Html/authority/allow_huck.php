<?php
	include "../../Php/Public_1.php";
	if( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ){
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;../url=index.php">
		<?php
		exit();
	}
	if ( isset($_POST['open_huck_pro_id']) ) {
		$pid = $_POST['open_huck_pro_id']; 
		$in_code = $_POST['submit_ck_code'];
		if ( $in_code == "" ) {
			if ( $_FILES['add_ck_file']['error'] > 0 ) {
				echo $_FILES['add_ck_file']['error'];
				exit();
			}else{
				$file_code = $_FILES["add_ck_file"]["tmp_name"];
				$in_code = fread(fopen($file_code, "r"),filesize($file_code));
			}
		}
		$sql = "UPDATE problem_information_4 SET data_monitoring=? WHERE pro_id = '$pid'";
		$sth = $conn->prepare($sql);
		$sth->bind_param('s',$in_code);
		if ($sth->execute()) {
			$in_code = $_POST['submit_ac_code'];
			if ( $in_code == "" ) {
				if ( $_FILES['add_ac_file']['error'] ) {
					echo $_FILES['add_ac_file']['error'];
					exit();
				}else{
					$file_code = $_FILES['add_ac_file']['tmp_name'];
					$in_code = fread(fopen($file_code, "r"),filesize($file_code));
				}
			}
			$sql = "UPDATE problem_information_4 SET true_code=?,allow_huck='1' WHERE pro_id='$pid'";
			$sth = $conn->prepare($sql);
			$sth->bind_param('s',$in_code);
			if ( $sth->execute() ) {
				?>
					<meta http-equiv="refresh" content="0;url=allow_huck.php">
				<?php
			}else{
				?>
					<script type="text/javascript">
						alert(<?php echo $sth->error; ?>);
					</script>
				<?php
			}
			exit();
			
		}else{
			?>
				<script type="text/javascript">
					alert(<?php echo $sth->error; ?>);
				</script>
			<?php
			// $submit_success_flag = 2;
			exit();
		}
	}
	include "../../Php/authority.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../../Css/public_1.css">
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
			<a href="add_problem.php" class="menu_label_5 menu_a">
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

			<a href="allow_huck.php" class="menu_label_5 menu_a new_color_img_authority">
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
		<form action="allow_huck.php" method="post" enctype="multipart/form-data">
			<p>This page include add and update , each question will only keep the latest records</p>
			Open Problem id: <input type="test" name="open_huck_pro_id">
			<br>
			check huck data code:(language using C++11, Time Limit Exceeded is 10s , Memory Limit Exceeded is 512M)
			<textarea class="textarea_size" name="submit_ck_code"></textarea>
			<br>
			<input type="file" name="add_ck_file">
			<br>
			Note: If it is a true data , please printf "yes" on the first line , do not add anything , otherwise all the datas will  be considered illegally
			<br>
			<hr>
			<br>
			Accepted code:(language using C++11, Time Limit Exceeded is 10s , Memory Limit Exceeded is 512M)
			<textarea class="textarea_size" name="submit_ac_code"></textarea>
			<br>
			<input type="file" name="add_ac_file">
			<br><br><br>
			<input type="submit" name="submit" value="Submit" class="submit_size">
		</form>
	</div>
</body>
</html>