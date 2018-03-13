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
	$create_success_flag = 0;
	$create_success_number = 0;
	include "../../../Php/contest_authority.php";
	if ( isset( $_POST['create_number'] ) ) {
		$y = $_POST['create_number'];
		$xy = get_contest_id_have_any_accounts($conn,$cid);
		$pr = $_POST['Prefix'];
		for ($i=1; $i <= $y ; $i++) {
			$xy++;
			$id = get_and_update_of_web_number_information($conn,13);
			$u_id = get_and_update_of_web_number_information($conn,1);
			$u_name = $pr.$xy;
			$n_name = $u_name;
			$p_word = have_new_password();
			if ( !create_new_accounts($conn,$u_id,$u_name,$n_name,$p_word,$cid) ) {
				echo "Error: " . $sql . "<br>" . $conn->error;
				?>
					<script type="text/javascript">
						alert("<?php echo('create error on create No.'.$i) ?>");
					</script>
				<?php
				break;
			}else{
				$sql = "INSERT INTO contest_information_3 (id,contest_id,user_id,nike_name,password) VALUES ('$id','$cid','$u_id','$n_name','$p_word')";
				if ( !mysqli_query($conn,$sql) ) {
					echo "Error: " . $sql . "<br>" . $conn->error;
					?>
						<script type="text/javascript">
							alert("<?php echo('create error on create 2 No.'.$i) ?>");
						</script>
					<?php
					break;
				}
			}
		}
		?>
			<meta http-equiv="refresh" content="0;Create_accounts.php?cid=<?php echo $cid ?>">
		<?php
		exit();
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>contest display page</title>
	<link rel="stylesheet" type="text/css" href="../../../Css/contestHome.css">
	<link rel="stylesheet" type="text/css" href="../../../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../../../Css/authority.css">
	<script type="text/javascript" src="../../../Js/contest.js"></script>
	<script type="text/javascript" src="../../../Js/authority.js"></script>
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

			<a href="Create_accounts.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a new_color_img_authority">
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

	<div  id="main_add_problem_page">
		<form action="Create_accounts.php?cid=<?php echo $cid ?>" method="post">
			<center>
				<table width="900px">
					<tbody>
						<tr>
							<td width="300px">Create new accounts numbers</td>
							<td><input type="text" name="create_number" value="0"></td>
							<td width="200px">Prefix</td>
							<td><input type="text" name="Prefix" value="<?php echo $cid ?>"></td>
						</tr>
					</tbody>
				</table>
			</center>
			<br><br>
			<input type="submit" name="submit" class="submit_size">
		</form>
		<br>
		<center>
			<table width="900px" border="1" id="mytable">
				<thead>
					<tr>
						<td width="60px">order</td>
						<td width="120px">user name</td>
						<td>nike name</td>
						<td width="120px">password</td>
						<td width="120px"></td>
						<!-- 打星 -->
						<td width="120px"></td>
						<!-- 封号 -->
					</tr>
				</thead>
				<tbody>
					<?php
						$sql = "SELECT user_id,nike_name,password FROM contest_information_3 WHERE contest_id = '$cid' order by id ASC";
						$result = mysqli_query($conn,$sql);
						$caid = 0;
						while ( $row = mysqli_fetch_array($result) ) {
							$caid++;
							?>
								<tr>
									<td><?php echo $caid; ?></td>
									<td><?php echo get_id_name($conn,$row['user_id']); ?></td>
									<td><?php echo $row['nike_name']; ?></td>
									<td><?php echo $row['password']; ?></td>
									<td><a href="Stars.php?cid=<?php echo $cid ?>&id=<?php echo $caid ?>">Stars</a></td>
									<td><a href="ban.php?cid=<?php echo $cid ?>&id=<?php echo $caid ?>">Ban</a></td>
								</tr>
							<?php
						}
						if( $caid == 0 ){
							?>
								<tr>
									<td colspan="6">No data</td>
								</tr>
							<?php
						}
					?>		
				</tbody>
			</table>
		</center>
	</div>
</body>
</html>