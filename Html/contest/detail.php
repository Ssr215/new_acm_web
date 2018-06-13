<?php
	include "../../Php/Public_1.php";
	include "../../Php/contest.php";
	$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	if( !isset($_GET['pid']) || !is_numeric($_GET['pid']) ){
		?>
			<script type="text/javascript">
					alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;indexs.php?cid=<?php echo $cid ?>">
		<?php
		exit();
	}
	$pid = $_GET['pid'];
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

			<a href="indexs.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Problem</a>

			<a href="submits.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Submit</a>

			<!-- <a href="submit_display_myself.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

			<a href="huck.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Hucks</a>

			<a href="ranking.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Rank</a>

			<a href="status.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Status</a>

			<a href="forum.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Forum</a> -->

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
						<th width="270px"><a href="indexs.php?cid=<?php echo($cid) ?>"><?php echo $name." (".display_level($level).")"; ?></a></th>
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

						<!-- <table class="right_table" border="1">
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
						</table> -->
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

				$sql = "SELECT language,code FROM contest_pro_submit WHERE contest_id = '$cid' AND problem_id = '$pid'";
				$result = mysqli_query($conn,$sql);
				$language = 1;
				$code = "";
				while ( $row = mysqli_fetch_array($result) ) {
					$language = $row['language'];
					$code = $row['code'];
				}
			?>

			<!-- <form action="submits.php?cid=<?php echo($cid) ?>"  method="post"> -->
				<h2>Submit solution</h2>
				<!-- <br> -->
				<p><?php echo $name; ?></p>
				<br>
				<table width="900px">
					<tbody>
						<tr>
							<td width="300px"><p>Problem: </p></td>
							<td align="left">
								<?php echo $pid."-".get_problem_name($conn,$row["problem_id"]); ?>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>you must be choose a problem</td>
						</tr>
						<tr>
							<td><p>Language:</p></td>
							<td align="left">
								<select class="select_1" name="c_language">
									<option <?php if ($language == 1) { echo "selected=\"selected\""; } ?>>C</option>
									<option <?php if ($language == 2) { echo "selected=\"selected\""; } ?>>C++</option>
									<option <?php if ($language == 3) { echo "selected=\"selected\""; } ?>>C++11</option>
									<option <?php if ($language == 4) { echo "selected=\"selected\""; } ?>>C++14</option>
									<option <?php if ($language == 5) { echo "selected=\"selected\""; } ?>>JAVA</option>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>If it isn't need submit code, please ignore language.</td>
						</tr>
						<tr>
							<td><p>Source code:</p></td>
							<td align="left">
								<textarea class="c_submitc_texttarea" name="c_code" readonly="readonly"><?php echo $code; ?></textarea>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>If it isn't code,just input text, don't need using code to printf, otherwise your answer will be no consider true!</td>
						</tr>
						<tr>
							<td></td>
							<td><a href="submits.php?cid=<?php echo $cid ?>&pid=<?php echo $pid ?>">change</a></td>
						</tr>
					</tbody>
				</table>
			<!-- </form> -->
		</div>
	</div>
</body>
</html>