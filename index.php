<?php
	include "./Php/Public_1.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="./Css/Home.css">
	<link rel="stylesheet" type="text/css" href="./Css/public_1.css">
	<?php
		if( $refresh_flag ){
			?>
				<meta http-equiv="refresh" content="0;url=./Html/index.php">
			<?php
		}
	?>
</head>
<body>
	<div id="package">
		<div id="head">
			<h2>
				<img id = "position_photo"  class="width_45" src="./photo/head2.jpg">
				<span class="_blue_1">Online Judge in private</span>
			</h2>
		</div>
		<div id="menu_backgound">
			<a href="./Html/index.php" class="menu_label_1 menu_a new_color_imp">
				<img id = "position_photo" src="./photo/display1.png">
				Home
			</a>

			<a href="./Html/problem.php" class="menu_label_1 menu_a">
				Problem
			</a>

			<a href="./Html/Status.php" class="menu_label_1 menu_a">
				Status
			</a>

			<a href="./Html/Contest.php" class="menu_label_1 menu_a">
				contest
			</a>

			<a href="./Html/user.php" class="menu_label_1 menu_a">
				User
				<!-- 排名记录 -->
			</a>

			<a href="./Html/forum.php" class="menu_label_1 menu_a">
				Forum
				<!-- 交流区，主要讨论题目错误或者疑问的地方 -->
			</a>

			<a href="./Html/article.php" class="menu_label_1 menu_a">
				Article
				<!-- 发表文章、竞赛题解、话题的地方 -->
			</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= 7 ){
					?>
						<a href="./Html/authority.php" class="menu_label_1 menu_a">
							Authority
						</a>
					<?php
				}

				if( $GLOBALS['loading_user_flag'] ){
					// echo "10096";
					?>
						<a href="./Html/index.php?out=1" class="menu_label_1 menu_a float_imp_right">
							Sign out
						</a>

						<a href="./Html/mypage.php" class="menu_label_1 menu_a float_imp_right">
							<?php echo $GLOBALS['loading_username']; ?>
						</a>
					<?php
				}else{
					// echo "10086";
					?>
						<a href="./Html/register.php" class="menu_label_1 menu_a float_imp_right">
							Register
						</a>

						<a href="./Html/loading.php" class="menu_label_1 menu_a float_imp_right">
							Login
						</a>
					<?php
				}
			?>
		</div>
	</div>
</body>
</html>