<?php
	include "../Php/Public_1.php";
	include "../Php/problemdisplay.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../Css/problem.css">
	<?php
		if( $can_display ){
			?>
				<script type="text/javascript">
					alert("No Access!");
				</script>
				<meta http-equiv="refresh" content="0;url=problem.php">
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

			<a href="problem.php" class="menu_label_1 menu_a new_color_imp">
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
		<div id="problem_title">
			<?php
				echo $pro_id ." : " . $title;
			?>
		</div>
		<div id="problem_limit">
			<?php
				echo "Time Limit:" . $time_limit . " MS  Memory Limit: " . $memory_limit . " MB<br>";
				echo "JAVA Time Limit:" . $time_limit_java . " MS  JAVA Memory Limit: " . $memory_limit_java . " MB";
			?>
		</div>
		<div id="problem_submit">
			[<a href="problemsubmit.php?pid=<?php echo($pro_id) ?>">Submit</a>]
			[<a href="problemstatus.php?pid=<?php echo($pro_id) ?>">Status</a>]
			[<a href="problemForum.php?pid=<?php echo($pro_id) ?>">Forum</a>]
		</div>

		<div id="pro_display_description">
			Description
		</div>
		<div id="pro_display_detile">
			<?php
				$description = str_replace("\n", "<br>", $description);
				echo $description;
			?>
		</div>

		<div id="pro_display_description">
			Input
		</div>
		<div id="pro_display_detile">
			<?php
				$input = str_replace("\n", "<br>", $input);
				echo $input;
			?>
		</div>

		<div id="pro_display_description">
			Output
		</div>
		<div id="pro_display_detile">
			<?php
				$output = str_replace("\n", "<br>", $output);
				echo $output;
			?>
		</div>

		<div id="pro_display_description">
			Sample Input
		</div>
		<div id="pro_display_detile">
			<?php
				$sample_input = str_replace("\n", "<br>", $sample_input);
				echo $sample_input;
			?>
		</div>

		<div id="pro_display_description">
			Sample Output
		</div>
		<div id="pro_display_detile">
			<?php
				$sample_output = str_replace("\n", "<br>", $sample_output);
				echo $sample_output;
			?>
		</div>

		<div id="pro_display_description">
			Hint
		</div>
		<div id="pro_display_detile">
			<?php
				$hint = str_replace("\n", "<br>", $hint);
				echo $hint;
			?>
		</div>
	</div>
</body>
</html>