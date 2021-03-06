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

	if ( !isset($_GET['cid']) ) {
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<!-- <meta http-equiv="refresh" content="0;url=index.php?cid=<?php echo $cid ?>"> -->
		<?php
		exit();
	}

	include "../../Php/contest.php";

	if ( isset($_POST['c_language']) ) {
		if ( strtotime($begin_time." +".$duration." minute") > time() ) {
			if ( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ) {
				if ( strtotime($begin_time) > time() ) {
					echo "The contest has not started yet";
					exit();
				}else if ( ck_is_allow_participate($conn,$GLOBALS['loading_username'],$cid) ) {
					echo "You can not participate in this competition";
					exit();
				}
			}
		}
		if ( !isset($_GET['pid']) || !is_numeric($_GET['pid']) ) {
			if ( !isset($_POST['pid']) || !is_numeric($_POST['pid']) || $_POST['pid'] > $problem_number || $_POST['pid'] < 1 ) {
				?>
					<script type="text/javascript">
						alert("Pleas select the true problem!");
					</script>
					<meta http-equiv="refresh" content="0;url=submit.php?cid=<?php echo $cid ?>">
				<?php
				exit();
			}else{
				$pid = $_POST['pid'];
			}
		}else{
			$pid = $_GET['pid'];
		}
		$c_language = get_language_number($_POST['c_language']);
		$c_code = "";
		if ( isset( $_POST['c_code'] ) && $_POST['c_code'] != "" ) {
			$c_code = $_POST['c_code'];
		}else{
			if ( isset($_POST['contest_code_file'] )) {
				echo "here";
				echo $_POST['contest_code_file'];
			}

			if ($_FILES["contest_code_file"]["error"] > 0) {
				echo $_FILES["contest_code_file"]["error"];
			}else{
				$contest_code = $_FILES["contest_code_file"]["tmp_name"];
				$c_code = fread(fopen($contest_code, "r"),filesize($contest_code));
			}
		}
		$u_id = get_user_id($conn,$GLOBALS['loading_username']);
		$cid = $_GET['cid'];
		// $pid = $_GET['pid'];
		$id = get_and_update_of_web_number_information($conn,9);
		$now_time = date("Y-m-d H:i:s");
		$c_flag = get_is_it_a_competitor($conn,$GLOBALS['loading_username'],$cid);
		$sql = "INSERT INTO contest_pro_submit (id,contest_id,problem_id,user_id,competitor,language,submit_time,result,u_time,u_memory,code,compile) VALUES ('$id','$cid','$pid','$u_id','$c_flag','$c_language','$now_time','0','0','0',?,'')";
		$sth = $conn->prepare($sql);
		$sth->bind_param('s',$c_code);
		if ($sth->execute()) {
			// echo $sth->insert_id;
			// $submit_success_flag = 1;
			?>
				<meta http-equiv="refresh" content="0;url=submit_display_myself.php?cid=<?php echo $cid ?>">
			<?php
			exit();
		}else{
			?>
				<script type="text/javascript">
					alert(<?php echo $sth->error; ?>);
				</script>
			<?php
			// $submit_success_flag = 2;
			exit();
		}
	}
	$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
?>

<!DOCTYPE html>
<html>
<head>
	<title>contest display page</title>
	<link rel="stylesheet" type="text/css" href="../../Css/contestHome.css">
	<link rel="stylesheet" type="text/css" href="../../Css/public_1.css">
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

			<a href="submit.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">Submit</a>

			<a href="submit_display_myself.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

			<a href="huck.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Hucks</a>

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
						}else if ( ck_is_allow_participate($conn,$GLOBALS['loading_username'],$cid) ) {
							echo "You can not participate in this competition";
							exit();
						}
					}
				}
			?>
			<form action="submit.php?cid=<?php echo($cid) ?>"  enctype="multipart/form-data"  method="post">
				<h2>Submit solution</h2>
				<!-- <br> -->
				<p><?php echo $name; ?></p>
				<br>
				<table width="900px">
					<tbody>
						<tr>
							<td width="300px"><p>Problem: </p></td>
							<td align="left">
								<select class="select_1" name="pid">
									<option value="-1">Choose problem</option>
									<?php
										$sql = "SELECT problem_id,change_problem_name FROM contest_information_2 WHERE contest_id='$cid'";
										$result = mysqli_query($conn,$sql);
										$now_row = 0;
										while ( $row = mysqli_fetch_array($result) ) {
											?>
												<option value="<?php echo($now_row) ?>">
													<?php
														echo substr($str, $now_row , 1);
														echo " - ";
														if ( $row['change_problem_name'] == "" ) {
															echo get_problem_name($conn,$row["problem_id"]);
														}else{
															echo $row['change_problem_name'];
														}
													?>
												</option>
											<?php
											$now_row++;
										}
									?>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><p>Language:</p></td>
							<td align="left">
								<select class="select_1" name="c_language">
									<option>C</option>
									<option>C++</option>
									<option>C++11</option>
									<option>C++14</option>
									<option>JAVA</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><p>Source code:</p></td>
							<td align="left">
								<textarea class="c_submitc_texttarea" name="c_code"></textarea>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Or choose file</td>
							<td align="left"><input type="file" name="contest_code_file"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td align="left">
								Be careful: there is 50 points penalty for submission which fails the pretests or resubmission (except failure on the first test, denial of judgement or similar verdicts). "Passed pretests" submission verdict doesn't guarantee that the solution is absolutely correct and it will pass system tests.
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" name="submit" value="submit" class="contest_submit"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>