<?php
	include "../../Php/Public_1.php";

	if ( $GLOBALS['loading_user_flag'] == false ) {
		?>
			<script type="text/javascript">
				alert("please log in first");
			</script>
			<meta http-equiv="refresh" content="0;url=../loading.php">
		<?php
		exit();
	}

	if ( !isset($_GET['cid']) || !isset($_GET['sid']) || !is_numeric($_GET['sid']) ) {
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;url=index.php">
		<?php
		exit();
	}

	include "../../Php/contest.php";
	$sid = $_GET['sid'];
	if ( isset($_POST['c_huck_data']) ) {
		$chid = get_and_update_of_web_number_information($conn,12);
		$uid = get_user_id($conn,$GLOBALS['loading_username']);
		$huid = get_sid_user_id($conn,$sid);
		$p_oid = get_sid_oid($conn,$sid);
		date_default_timezone_set("Asia/Shanghai");
		$time_now = date("Y-m-d H:i:s");
		$sql = "INSERT INTO contest_huck_submit (id,contest_id,problem_id,status_id,submit_user,huck_user,huck_time,result) VALUES ('$chid','$cid','$p_oid','$sid','$uid','$huid','$time_now','0')";
		$file_path = "D:/contest_huck_data/".$chid;
		$success_create_or_move_file_flag = false;
		if (!file_exists($file_path)) {
			mkdir($file_path);
			echo "create folder success";
			if ( $_POST['c_huck_data'] == "" ) {
				if ( $_FILES['c_huck_data_file']['error'] > 0 ) {
					echo $_FILES['c_huck_data_file']['error'];
				}else{
					if (move_uploaded_file($_FILES["c_huck_data_file"]["tmp_name"],$file_path."\\huck.in")) {
						echo "add hukc file success!<br>";
						$success_create_or_move_file_flag = true;
					}else{
						echo "can't add huck file success!<br>";
					}
				}
			}else{
				$myfile = fopen($file_path."\\huck.in", "w") or die("Unable to open file!");
				fwrite($myfile, $_POST['c_huck_data']);
				fclose($myfile);
				echo "add huck file success!<br>";
				$success_create_or_move_file_flag = true;
			}
		}
		if ( $success_create_or_move_file_flag ) {
			if ( !mysqli_query($conn,$sql) ) {
				?>
					<script type="text/javascript">
						alert("submit fail!");
					</script>
					<meta http-equiv="refresh" content="0;url=Status.php">
				<?php
			}else{
				?>
					<meta http-equiv="refresh" content="0;url=huck.php">
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
	$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
?>

<!DOCTYPE html>
<html>
<head>
	<title>contest display page</title>
	<link rel="stylesheet" type="text/css" href="../../Css/contestHome.css">
	<link rel="stylesheet" type="text/css" href="../../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../../Css/problem.css">
	<script type="text/javascript" src="../../Js/contest.js"></script>
</head>
<body>
	<div id="package">
		<div id="head">
			<h2>
				<span class="_blue_1"><?php echo $name; ?></span>
			</h2>
		</div>

		<div id="menu_backgound_3">
			<a href="../index.php" class="menu_label_1 menu_a">Home</a>

			<a href="index.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Problem</a>

			<a href="submit.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Submit</a>

			<a href="submit_display_myself.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

			<a href="huck.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">Hucks</a>

			<a href="ranking.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Rank</a>

			<a href="status.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Status</a>

			<a href="forum.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Forum</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= 7 ){
					?>
						<a href="authority/index.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">
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

	<div id="contest_main_backgound">
		<div id="contest_right_page">
			<table class="right_table_first" border="1">
				<tbody>
					<tr>
						<th width="270px"><a href="index.php?cid=<?php echo($cid) ?>"><?php echo $name." (".display_level($level).")"; ?></a></th>
					</tr>
					<tr>
						<td>
							<?php
								$begin_flag = 0;
								if ( strtotime($begin_time) > time()  ) {
									$lease_time = strtotime($begin_time) - time();
									// $second = (int)($lease_time/1000);
									$second = $lease_time;
									$minute = (int)($second/60);
									$second = $second%60;
									$hour = (int)($minute/60);
									$minute = $minute%60;
									echo "Begin after ";
									?>
										<span id="t_h" value="<?php echo($hour) ?>"><?php display_2d_number($hour); ?></span>
										:
										<span id="t_m"><?php display_2d_number($minute); ?></span>
										:
										<span id="t_s"><?php display_2d_number($second); ?></span>
										<script type="text/javascript">
											setInterval(set_time_befor,1000);
										</script>
									<?php
								}else if ( strtotime($begin_time." +".$duration." minute") > time() ) {
									$begin_flag = 1;
									$lease_time = strtotime($begin_time." +".$duration." minute") - time();
									// echo $lease_time;
									// $second = (int)($lease_time/1000);
									$second = $lease_time;
									$minute = (int)($second/60);
									$second = $second%60;
									$hour = (int)($minute/60);
									$minute = $minute%60;
									// echo "End in ";
									?>
										<span id="t_h" value="<?php echo($hour) ?>"><?php display_2d_number($hour); ?></span>
										:
										<span id="t_m"><?php display_2d_number($minute); ?></span>
										:
										<span id="t_s"><?php display_2d_number($second); ?></span>
										<script type="text/javascript">
											setInterval(set_time,1000);
										</script>
									<?php
								}else{
									echo "Finish";
								}
							?>
						</td>
					</tr>
				</tbody>
			</table>

			<?php
				if ( $begin_flag == 1 ) {		
					?>
						<table class="right_table" border="1">
							<tbody>
								<tr>
									<th colspan="2" class="green_color">
										If Accepted in <?php pass_time_now($hour,$minute,$duration); ?>
									</th>
								</tr>
								<tr>
									<th width="70px">#</th>
									<th width="200px">score</th>
								</tr>
								<?php
									for ($i=1; $i <= $problem_number; $i++) { 
										?>
											<tr>
												<td><a href="display.php?cid=<?php echo $cid ?>&pid=<?php echo $i ?>"><?php echo substr($str, $i-1 , 1); ?></a></td>
												<td><?php get_pass_problem_now_score($conn,$i,$cid,$duration-($minute+$hour*60)); ?></td>
											</tr>
										<?php
									}
								?>
							</tbody>
						</table>

						<table class="right_table" border="1">
							<tbody>
								<tr>
									<th width="250px">Vedits</th>
									<th width="120px">Score</th>
								</tr>
								<tr class="red_color">
									<td>Wrong Answer</td>
									<td>-50</td>
								</tr>
								<tr class="yellow_color">
									<td>Presentation Error</td>
									<td>-50</td>
								</tr>
								<tr class="red_color">
									<td>Time Limit Exceeded</td>
									<td>-50</td>
								</tr>
								<tr class="red_color">
									<td>Memory Limit Exceeded</td>
									<td>-50</td>
								</tr>
								<tr class="red_color">
									<td>Runtime Error</td>
									<td>-50</td>
								</tr>
								<tr class="red_color">
									<td>Output Limit</td>
									<td>-50</td>
								</tr>
								<tr class="red_color">
									<td>Compile Error</td>
									<td>-0</td>
								</tr>
								<tr class="green_color">
									<td>Successful hacking attempt</td>
									<td>+100</td>
								</tr>
								<tr class="red_color">
									<td>Unsuccessful hacking attempt</td>
									<td>-50</td>
								</tr>
							</tbody>
						</table>
					<?php
				}
			?>

			
			<table class="right_table" border="1">
				<tbody>
					<tr>
						<th width="270px">Contest materrials</th>
					</tr>

					<tr>
						<td class="right_td">
							<a href="../article.php?cidx=<?php echo($cid); ?>">Announcement</a>
							<br>
							<a href="../article.php?cida=<?php echo($cid); ?>">Tutorial</a>
						</td>
					</tr>
				</tbody>
			</table>


		</div>
		<div id="contest_left_page">
			<?php
				// echo strtotime($begin_time." +".$duration." minute")." vs ".time();
				if ( strtotime($begin_time." +".$duration." minute") > time() ) {
					if ( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ) {
						if ( strtotime($begin_time) > time() ) {
							echo "The contest has not started yet";
							exit();
						}else if ( ck_is_allow_participate() ) {
							echo "You can not participate in this competition";
							exit();
						}
					}
				}
				?>
					<form action="huck_submit.php?cid=<?php echo($cid) ?>&sid=<?php echo $sid ?>" method="post" enctype="multipart/form-data">
						<h2>Submit huck</h2>
						<!-- <br> -->
						<p><?php echo $name; ?></p>
						<br>
						<p>please input huck data</p>
						<br>
						<textarea name="c_huck_data" class="textarea_huck_size"></textarea>
						<br>
						Or<br>
						<input type="file" name="c_huck_data_file">
						<br><br>
						<input type="submit" name="submit" value="Submit"  class="submit_size">
					</form>			
				<?php
			?>
		</div>
	</div>
</body>
</html>