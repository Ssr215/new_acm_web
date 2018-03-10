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
	if ( isset( $_POST['updates_test_pro_id'] ) ) {
		$pid = $_POST['updates_test_pro_id'];
		$oid = $_POST['updates_test_id'];
		$f = 0;
		if ( ck_ok_cid_pid_oid($conn,$cid,$pid,$oid) ) {
			$file_path_1 = "D:\\contest_data\\".$cid."\\".$pid."\\";
			if ( $_POST['update_test_input'] == "" ) {
				if ( $_FILES['update_input_file']['error'] > 0 ) {
					echo $FILES['update_input_file']['error'];
				}else{
					if (move_uploaded_file($_FILES["update_input_file"]["tmp_name"],$file_path_1.$oid.".in")) {
						echo "update input file success!<br>";
						$f++;
					}else{
						echo "can't update input file success!<br>";
					}
				}
			}else{
				$myfile = fopen($file_path_1.$oid.".in", "w") or die("Unable to open file!");
				fwrite($myfile, $_POST['update_test_input']);
				fclose($myfile);
				$f++;
			}
			if ( $_POST['update_test_output'] == "" ) {
				if ( $_FILES['update_output_file']['error'] > 0 ) {
					echo $FILES['update_output_file']['error'];
				}else{
					if (move_uploaded_file($_FILES["update_output_file"]["tmp_name"],$file_path_1.$oid.".out")) {
						echo "add input file success!<br>";
						$f++;
					}else{
						echo "can't add input file success!<br>";
					}
				}
			}else{
				$myfile = fopen($file_path_1.$oid.".out", "w") or die("Unable to open file!");
				fwrite($myfile, $_POST['update_test_output']);
				fclose($myfile);
				$f++;
			}
			if ( $f != 2 ) {
				?>
					<script type="text/javascript">
						alert("update file is false!,please check add data!")
					</script>
				<?php
			}
		}else{
			?>
				<script type="text/javascript">
					alert("There no such test");
				</script>
			<?php
		}
		?>
			<meta http-equiv="refresh" content="0;Update_test.php?cid=<?php echo $cid ?>">
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

			<a href="../submit_display_myself.php?<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

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

			<a href="Update_test.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a new_color_img_authority">
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
		<form action="Update_test.php?cid=<?php echo $cid ?>" method="post">
			<center>
				<table width="900px">
					<tbody>
						<tr>
							<td width="400px">Select problem id</td>
							<td><input type="text" name="select_pid" value="1"></td>
						</tr>
					</tbody>
				</table>
			</center>
			<br><br>
			<input type="submit" name="submit" class="submit_size">
		</form>
		<?php
			if ( isset($_POST['select_pid']) ) {
				?>
					<br>
					<center>
						<table width="900px" border="1" id="mytable">
							<thead>
								<tr>
									<td width="225px">problem id</td>
									<td width="225px">test id</td>
									<td width="225px">input</td>
									<td width="225px">output</td>
								</tr>
							</thead>
							<tbody>
								<?php
									$num = get_contest_problem_test_id_no_update($conn,$cid,$_POST['select_pid']);
									$file_path = "D:\\contest_data\\".$cid."\\".$_POST['select_pid']."\\";
									for ($i=0; $i < $num ; $i++) {
										$file_name_1 = $i.".in";
										$file_name_2 = $i.".out";
										?>
											<tr>
												<td><?php echo $cid; ?></td>
												<td><?php echo $i+1; ?></td>
												<td><a href="uploading.php?fpath=<?php echo($file_path) ?>&fname=<?php echo($file_name_1); ?>"><?php echo $file_name_1; ?></a></td>
												<td><a href="uploading.php?fpath=<?php echo($file_path) ?>&fname=<?php echo($file_name_2) ?>" target="_blank"><?php echo $file_name_2; ?></a></td>
											</tr>
										<?php
									}
									if ( $num == 0 ) {
										?>
											<tr>
												<td colspan="4">No data</td>
											</tr>
										<?php
									}
								?>		
							</tbody>
						</table>
					</center>
					<br><br>
					<form action="Update_test.php" method="post" enctype="multipart/form-data">
						problem id: 
						<input type="text" name="updates_test_pro_id" value="<?php echo($_POST['select_pid']) ?>" readonly="readonly">
						<br>
						test numbers:
						<input type="text" name="updates_test_id" value="<?php echo(-1) ?>">
						<br>
						INPUT
						<br>
						<textarea class="textarea_size _put_h" name="update_test_input"></textarea>
						<br>
						<input type="file" name="update_input_file" id="file">
						<br>
						OUTPUT
						<br>
						<textarea class="textarea_size _put_h" name="update_test_output"></textarea>
						<br>
						<input type="file" name="update_output_file">
						<br>		
						<input type="submit" name="submit" class="submit_size">
					</form>
				<?php
			}
		?>
	</div>
</body>
</html>