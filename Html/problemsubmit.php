<?php
	include "../Php/Public_1.php";
	$pro_id = 1000;
	if( isset($_GET['pid']) ){
		$pro_id = $_GET['pid'];
	}

	// 提交成功标志
	$submit_success_flag = 0;

	// 将提交插入数据库
	if( isset($_POST['submit_pro_id']) ){
		$pid = $_POST['submit_pro_id'];
		$language = $_POST['submit_language'];
		$submit_code = $_POST['submit_code'];
		$submit_code = str_replace("'", "\'", $submit_code);
		date_default_timezone_set("Asia/Shanghai");
		$time_now = date("Y-m-d H:i:s");
		$submit_user_id = get_user_id($conn,$GLOBALS['loading_username']);
		$sid = get_and_update_of_web_number_information($conn,5);
		$language = get_language_number($language);
		$sql = "INSERT INTO pro_submit (id,pro_id,language,result,u_time,u_memory,user_id,_date,huck,code,compile) VALUES ('$sid','$pid','$language','0','0','0','$submit_user_id','$time_now','0','$submit_code',',')";
		if ( !mysqli_query($conn,$sql) ) {
			echo "Error: " . $sql . "<br>" . $conn->error;
			$submit_success_flag = 2;
		}else{
			$submit_success_flag = 1;
		}
	}

	// 获取语言返回值
	function get_language_number($lan){
		if( $lan == "C" ){
			return 1;
		}else if ( $lan == "C++" ) {
			return 2;
		}else if ( $lan == "JAVA" ) {
			return 3;
		}
		return 0;
	}

	// 获取当前用户的id
	function get_user_id($conn,$u_name){
		$u_id = -1;
		$sql = "SELECT * FROM user_information WHERE user_name = '$u_name'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$u_id = $row['id'];
		}
		return $u_id;
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
				<meta http-equiv="refresh" content="0">
			<?php
		}
		if ( $submit_success_flag == 1 ) {
			?>
				<meta http-equiv="refresh" content="0;url=Status.php">
			<?php
		}
	?>
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
						<a href="authority.php" class="menu_label_1 menu_a">
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
		<br>
		<form action="problemsubmit.php" method="post">
			<table width="1050px">
				<tbody>
					<tr>
						<td width="15%"></td>
						<td width="10%">problem id: </td>
						<td><input type="text" name="submit_pro_id" value="<?php echo $pro_id ?>"></td>
						<td width="30%"></td>
						<td>language</td>
						<td><select name="submit_language">
							<option>C</option>
							<option>C++</option>
							<option>C++11</option>
							<option>C++14</option>
							<option>JAVA</option>
						</select></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			Code
			<br>
			<textarea class="textarea_size" name="submit_code"></textarea>
			<br>
			<input type="submit" name="submit" class="submit_size">
		</form>
	</div>
</body>
</html>