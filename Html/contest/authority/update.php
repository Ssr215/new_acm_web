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
	$updata_success_flag = 0;
	$have_update_flag = false;
	include "../../../Php/contest_authority.php";
	if ( isset($_POST['c_id']) ) {
		$have_update_flag = true;
		$problem_number = $_POST['c_number'];
		if ( !isset($_POST['u_pro_'.$problem_number]) || isset($_POST['u_pro_'.$problem_number+1]) ) {
			
		}else{
			$begin_time = $_POST['c_begin_time'];
			$duration = $_POST['c_duration'];
			$name = $_POST['c_name'];
			$id = get_user_id($conn,$GLOBALS['loading_username']);
			$level = $_POST['c_level'];
			$type = $_POST['c_type'];
			$limit_par = $_POST['c_limit_par'];
			$sql = "UPDATE contest_information_1 SET level='$level',type='$type',begin_time='$begin_time',duration='$duration',limit_par='$limit_par',name='$name',problem_number='$problem_number' WHERE contest_id = '$cid'";
			if ( !mysqli_query($conn,$sql) ) {
				echo "Error: " . $sql . "<br>" . $conn->error;
				$updata_success_flag = 2;
			}else{
				$updata_success_flag = 1;
				$f_path = "D:/contest_data/".$cid."/";
				for ($i=1; $i <= $problem_number; $i++) {
					$u_problem_id = $_POST['u_pro_'.$i];
					$u_pro_name = $_POST['u_pro_'.$i.'_name'];
					$u_pro_score = $_POST['u_pro_'.$i.'_score'];
					if ( ck_isset_recording_of_cid_oid($conn,$cid,$i) ) {
						$sql = "UPDATE contest_information_2 SET problem_id='$u_problem_id',change_problem_name='$u_pro_name',score='$u_pro_score' WHERE contest_id = '$cid' AND order_number = '$i'";
					}else{
						$id = get_and_update_of_web_number_information($conn,8);
						$sql = "INSERT INTO contest_information_2 (id,contest_id,problem_id,order_number,change_problem_name,score,pass_number,test_number) VALUES ('$id','$cid','$u_problem_id','$i','$u_pro_name','$u_pro_score','0','0')";
					}
					if( !mysqli_query($conn,$sql) ) {
						echo "Error: " . $sql . "<br>" . $conn->error;
						$updata_success_flag = 2+$i;
						break;
					}
					install_file_on_path($f_path.$i);
				}
				$sql = "DELETE FROM contest_information_2 WHERE contest_id = '$cid' AND order_number > '$problem_number'";
				if ( !mysqli_query($conn,$sql) ) {
					echo "Error: " . $sql . "<br>" . $conn->error;
					$updata_success_flag = 10000+$problem_number;
				}
			}
			if ( $updata_success_flag == 1 ) {
				?>
					<meta http-equiv="refresh" content="0;../index.php?cid=<?php echo $cid ?>">
				<?php
			}else{
				?>
					<script type="text/javascript">
						alert(<?php echo "error flag ".$updata_success_flag; ?>);
					</script>
					<meta http-equiv="refresh" content="0;../index.php">
				<?php
			}
			exit();
		}
	}
	$level = 0;
	$type = 1;
	$begin_time = time();
	$duration = 120;
	$limit_par = 1;
	$name = "kekeke";
	$problem_number = 3;
	if ( !$have_update_flag ) {
		$sql = "SELECT level,type,begin_time,duration,limit_par,name,problem_number FROM contest_information_1 WHERE contest_id = '$cid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			$level = $row['level'];
			$type = $row['type'];
			$begin_time = $row['begin_time'];
			$duration = $row['duration'];
			$limit_par = $row['limit_par'];
			$name = $row['name'];
			$problem_number = $row['problem_number'];
		}
	}else{
		$level = $_POST['c_level'];
		$type = $_POST['c_type'];
		$begin_time = $_POST['c_begin_time'];
		$duration = $_POST['c_duration'];
		$limit_par = $_POST['c_limit_par'];
		$name = $_POST['c_name'];
		$problem_number = $_POST['c_number'];
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
			<a href="update.php?cid=<?php echo($cid) ?>" class="menu_label_5 menu_a new_color_img_authority">
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

	<div  id="main_add_problem_page">
		<form action="update.php?cid=<?php echo $cid ?>" method="post">
			<center>
				<table width="900px">
					<tbody>
						<tr>
							<td width="200px">contest id</td>
							<td><input type="text" name="c_id" value="<?php echo($cid) ?>" readonly="readonly"></td>
							<td width="200px">contest name</td>
							<td><input type="text" name="c_name" value="<?php echo $name ?>"></td>
						</tr>
						<tr>
							<td>problem number</td>
							<td><input type="text" name="c_number" value="<?php echo($problem_number) ?>" id="c_number"></td>
							<td>duration(minute)</td>
							<td><input type="text" name="c_duration" onchange="change_end_time()" value="<?php echo($duration) ?>" id="c_duration"></td>
						</tr>
						<tr>
							<td>begin time</td>
							<td><input type="datetime-local" name="c_begin_time" value="<?php echo get_time_add($begin_time,0) ?>" id="c_begin_time" onchange="change_end_time()"></td>
							<td>end time</td>
							<td><input type="datetime-local" name="c_end_time" value="<?php echo(get_time_add($begin_time,$duration)) ?>" readonly="readonly" id="c_end_time"></td>
						</tr>
						<tr>
							<td>level</td>
							<td>
								<select name="c_level">
									<option value="0" <?php if( $level == 0 ) { echo "selected"; } ?>>div 3(Rating on (-inf,1200) )</option>
									<option value="1" <?php if( $level == 1 ) { echo "selected"; } ?>>div 2(Rating on [1200,1900) )</option>
									<option value="2" <?php if( $level == 2 ) { echo "selected"; } ?>>div 1'2(Rating on (-inf,inf) )</option>
									<option value="3" <?php if( $level == 3 ) { echo "selected"; } ?>>div 1(Rating on [1900,inf) )</option>
									<option value="4" <?php if( $level == 4 ) { echo "selected"; } ?>>education (using CCPC/ICPC)</option>
								</select>
							</td>
							<td>type</td>
							<td>
								<select name="c_type">
									<option value="1" <?php if( $type == 1 ) { echo "selected"; } ?>>CF rating div</option>
									<option value="2" <?php if( $type == 2 ) { echo "selected"; } ?>>ICPC/CCPC</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Specific account</td>
							<td>
								<select name="c_limit_par">
									<option value="1" <?php if( $limit_par == 1 ) { echo "selected"; } ?>>Yes</option>
									<option value="0" <?php if( $limit_par == 0 ) { echo "selected"; } ?>>No</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table width="900px" border="1" id="mytable">
						<thead>
							<tr>
								<td>order flag</td>
								<td>problem id</td>
								<td>change problem title</td>
								<td>Score</td>
							</tr>
						</thead>
						<tbody>
							<?php
								if ( !$have_update_flag ) {
									$sql = "SELECT problem_id,change_problem_name,score FROM contest_information_2 WHERE contest_id = '$cid' order by order_number ASC";
									$result = mysqli_query($conn,$sql);
									$now_id = 1;
									while ( $row = mysqli_fetch_array($result) ) {
										?>
											<tr>
												<td><?php echo substr($str, $now_id - 1 , 1); ?></td>
												<td><input type="text" name="u_pro_<?php echo($now_id) ?>" value="<?php echo $row['problem_id']; ?>"></td>
												<td><input type="text" name="u_pro_<?php echo($now_id) ?>_name" value="<?php echo $row['change_problem_name']; ?>"></td>
												<td><input type="text" name="u_pro_<?php echo($now_id) ?>_score" value="<?php echo $row['score']; ?>"></td>
											</tr>
										<?php
										$now_id++;
									}
								}else{
									for ($i=1; $i <= $problem_number; $i++) { 
										?>
											<tr>
												<td><?php echo substr($str, $i - 1 , 1); ?></td>
												<td><input type="text" name="u_pro_<?php echo($i) ?>" value="<?php if(isset($_POST['u_pro_'.$i])){echo($_POST['u_pro_'.$i]);}else{echo('');} ?>"></td>
												<td><input type="text" name="u_pro_<?php echo($i) ?>_name" value="<?php if(isset($_POST['u_pro_'.$i.'_name'])){echo($_POST['u_pro_'.$i.'_name']);}else{echo('');}  ?>"></td>
												<td><input type="text" name="u_pro_<?php echo($i) ?>_score" value="<?php if(isset($_POST['u_pro_'.$i.'_score'])){echo($_POST['u_pro_'.$i.'_score']);}else{echo('');}  ?>"></td>
											</tr>
										<?php
									}
								}
							?>
						</tbody>
				</table>
				<br>
				<br>
				<input type="submit" name="submit" class="submit_size">
			</center>
		</form>
	</div>
</body>
</html>