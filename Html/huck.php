<?php
	include "../Php/Public_1.php";
	if ($GLOBALS['loading_user_flag'] == false) {
		?>
			<script type="text/javascript">
				alert("please log in first");
			</script>
			<meta http-equiv="refresh" content="0;url=loading.php">
		<?php
		exit();
	}
	include '../Php/huck.php';
	if ( !isset($_GET['sid']) || !isset($_GET['pid']) || !is_numeric($_GET['pid']) || !is_numeric($_GET['sid']) || !allow_huck_problem_id($conn,$_GET['pid']) || !allow_huck_status_id($conn,$_GET['sid'],$_GET['pid']) ) {
		?>
			<script type="text/javascript">
				alert("It is not allow huck! If have any problem, please call admin");
			</script>
			<meta http-equiv="refresh" content="0;url=index.php">
		<?php
		exit();
	}
	if ( isset($_POST['huck_data']) ) {
		$id = get_and_update_of_web_number_information($conn,6);
		$sid = $_GET['sid'];
		$pid = $_GET['pid'];
		// 解释：
		// 1. submit_user 是提交者的用户名
		// 2. huck_user   是被huck者的用户名
		$submit_user = get_user_id($conn,$GLOBALS['loading_username']);
		$huck_user = get_hucker_id($conn,$sid);
		date_default_timezone_set("Asia/Shanghai");
		$time_now = date("Y-m-d H:i:s");
		$success_create_or_move_file_flag = false;
		$file_path = "D:/huck_data/".$id;
		if (!file_exists($file_path)) {
			mkdir($file_path);
			echo "create folder success";
			if ( $_POST['huck_data'] == "" ) {
				if ( $_FILES['huck_data_file']['error'] > 0 ) {
					echo $_FILES['huck_data_file']['error'];
				}else{
					if (move_uploaded_file($_FILES["huck_data_file"]["tmp_name"],$file_path."\\huck.in")) {
						echo "add hukc file success!<br>";
						$success_create_or_move_file_flag = true;
					}else{
						echo "can't add huck file success!<br>";
					}
				}
			}else{
				$myfile = fopen($file_path."\\huck.in", "w") or die("Unable to open file!");
				fwrite($myfile, $_POST['huck_data']);
				fclose($myfile);
				echo "add huck file success!<br>";
				$success_create_or_move_file_flag = true;
			}
		}
		if ( $success_create_or_move_file_flag ) {
			$sql = "INSERT INTO huck_submit (id,status_id,submit_user,huck_user,huck_time,result) VALUES ('$id','$sid','$submit_user','$huck_user','$time_now','0')";
			if ( !mysqli_query($conn,$sql) ) {
				?>
					<script type="text/javascript">
						alert("submit fail!");
					</script>
					<meta http-equiv="refresh" content="0;url=Status.php">
				<?php
			}else{
				?>
					<meta http-equiv="refresh" content="0;url=huck_display.php">
				<?php
			}
			exit();
		}
		?>
			<script type="text/javascript">
				alert("submit fail!");
			</script>
		<?php
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../Css/problem.css">
	<?php
		if( $refresh_flag ){
			?>
				<meta http-equiv="refresh" content="0;url=index.php">
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
			<a href="index.php" class="menu_label_1 menu_a new_color_imp">
				<img id = "position_photo" src="../photo/display1.png">
				Home
			</a>

			<a href="problem.php" class="menu_label_1 menu_a">
				Problem
			</a>

			<a href="Status.php" class="menu_label_1 menu_a">
				Status
			</a>

			<a href="huck_display.php" class="menu_label_1 menu_a">
				Huck
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
						<a href="authority/index.php" class="menu_label_1 menu_a">
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

	<div id="problem_main_backgound">
		<form action="huck.php?sid=<?php echo $_GET['sid'] ?>&pid=<?php echo $_GET['pid'] ?>" method="post" enctype="multipart/form-data">
			<p>please input hack test</p>
			<textarea name="huck_data" class="textarea_huck_size"></textarea>
			<br>
			Or<br>
			<input type="file" name="huck_data_file">
			<br><br>
			<input type="submit" name="submit" value="Submit"  class="submit_size">
		</form>
	</div>
</body>
</html>