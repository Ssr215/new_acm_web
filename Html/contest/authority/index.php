<?php
	include "../../../Php/Public_1.php";
	include "../../../Php/contest.php";
	if ( get_administrator_is_it_a_competitor($conn,$GLOBALS['loading_username'],$cid) ) {
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;../index.php">
		<?php
		exit();
	}
	$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
?>

<!DOCTYPE html>
<html>
<head>
	<title>contest display page</title>
	<link rel="stylesheet" type="text/css" href="../../../Css/contestHome.css">
	<link rel="stylesheet" type="text/css" href="../../../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../../../Css/authority.css">
	<script type="text/javascript" src="../../../Js/contest.js"></script>
</head>
<body>
	<div id="package">
		<div id="head">
			<h2>
				<span class="_blue_1"><?php echo $name; ?></span>
			</h2>
		</div>

		<div id="menu_backgound_3">
			<a href="../../index.php" class="menu_label_1 menu_a">Home</a>

			<a href="../index.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Problem</a>

			<a href="../submit.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Submit</a>

			<a href="../submit_display_myself.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

			<a href="../huck.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Hucks</a>

			<a href="../ranking.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Rank</a>

			<a href="../status.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Status</a>

			<a href="../forum.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Forum</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= 7 ){
					?>
						<a href="index.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">
							Authority
						</a>
					<?php
				}

				if( $GLOBALS['loading_user_flag'] ){
					// echo "10096";
					?>
						<a href="../../index.php?out=1" class="menu_label_1 menu_a float_imp_right">
							Sign out
						</a>

						<a href="../../mypage.php" class="menu_label_1 menu_a float_imp_right">
							<?php echo $GLOBALS['loading_username']; ?>
						</a>
					<?php
				}else{
					// echo "10086";
					?>
						<a href="../../register.php" class="menu_label_1 menu_a float_imp_right">
							Register
						</a>

						<a href="../../loading.php" class="menu_label_1 menu_a float_imp_right">
							Login
						</a>
					<?php
				}
			?>
		</div>
	</div>

	<div id="contest_main_backgound">
		<div id="main_menu_background">
			<a href="update.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a">
				Update contest
			</a>
			<!-- 更新题目信息等 -->

			<a href="Create_accounts.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a">
				Create accounts
			</a>
			<!-- 批量创建专用的比赛账号 -->

			<a href="Add_test.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a">
				Add test
			</a>
			<!-- 添加contest的线上测试用例 -->

			<a href="Update_test.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a">
				Update test
			</a>
			<!-- 更新contest的线上测试用例 -->

			<a href="Rejudge.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a">
				Rejudge
			</a>
			<!-- 管理员进行全员Rejudge或者部分Rejudge -->

			<a href="Cheat_handling.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a">
				Cheat handling
			</a>
			<!-- 管理员对作弊情况或者其他情况进行特殊处理 -->

			<a href="Broadcast.php?cid=<?php echo $cid ?>" class="menu_label_5 menu_a">
				Broadcast
			</a>
			<!-- 管理员进行全员广播 -->
		</div>
	</div>
</body>
</html>