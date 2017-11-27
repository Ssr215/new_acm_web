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
			<a href="authority_add_problem.php" class="menu_label_1 menu_a">
				Add problem
			</a>

			<a href="authority_update_problem.php" class="menu_label_1 menu_a">
				Update problem
			</a>

			<a href="authority_delete_problem.php" class="menu_label_1 menu_a">
				Delete problem
			</a>

			<a href="authority_create_contest.php" class="menu_label_1 menu_a">
				Create contest
			</a>

			<a href="authority_delete_contest.php" class="menu_label_1 menu_a">
				Delete content
			</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) == 9 ){
					?>
						<a href="authority_increase_permissions.php" class="menu_label_1 menu_a">
							Increase permissions
						</a>
					<?php
				}
			?>
		</div>
	</div>
</body>
</html>