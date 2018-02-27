<?php
	include "../../Php/Public_1.php";
	if ( !$GLOBALS['loading_user_flag'] ) {
		?>
			<script type="text/javascript">
					alert("please log in first!");
			</script>
			<meta http-equiv="refresh" content="0;../loading.php">
		<?php
		exit();
	}
	include "../../Php/contest.php";
	if ( !isset($_GET['sid']) || !is_numeric($_GET['sid']) || !isset($_GET['pid']) || !is_numeric($_GET['pid']) ) {
		?>
			<script type="text/javascript">
					alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php">
		<?php
		exit();
	}
	$sid = $_GET['sid'];
	$pid = $_GET['pid'];
	$uid = get_user_id($conn,$GLOBALS['loading_username']);
	if ( !ck_contest_status_id_and_user_id($conn,$uid,$sid) && !ck_lock_problem($conn,$cid,$pid,$uid) && ( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 || 1 == get_is_it_a_competitor($conn,$GLOBALS['loading_username'],$cid) ) ) {
		?>
			<script type="text/javascript">
					alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php">
		<?php
		exit();
	}
	$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	$s_uid = -1;
	$s_code = "";
	$s_compile = "";
	$s_language = 1;
	$pro_name = substr($str, $pid-1,1).". ".get_contest_id_order_id_pro_id_name($conn,$pid,$cid);
	$s_result = 0;
	$sql = "SELECT user_id,language,result,code,compile FROM contest_pro_submit WHERE id = '$sid'";
	$result = mysqli_query($conn,$sql);
	while ( $row = mysqli_fetch_array($result) ) {
		$s_uid = $row['user_id'];
		$s_language = $row['language'];
		$s_result = $row['result'];
		$s_code = $row['code'];
		$s_compile = $row['compile'];
	}
	$s_language = get_languages($s_language);
	$s_uid = get_id_name($conn,$s_uid);
	$s_code = str_replace("<", "&lt;", $s_code);
	$s_code = str_replace(">", "&gt;", $s_code);
	// $compile = str_replace("\n", "<br>", $compile);
?>

<!DOCTYPE html>
<html>
<head>
	<title>contest display page</title>
	<link rel="stylesheet" type="text/css" href="../../Css/contestHome.css">
	<link rel="stylesheet" type="text/css" href="../../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../../Css/problem.css">
	<link rel="stylesheet" type="text/css" href="../../Css/prism.css">
	<link rel="stylesheet" type="text/css" href="../../Css/display_code.css">
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

			<a href="submit_display_myself.php?<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

			<a href="huck.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Hucks</a>

			<a href="ranking.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Rank</a>

			<a href="status.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">Status</a>

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
						<th width="270px"><a href="contestdisplay.php?cid=<?php echo($cid) ?>"><?php echo $name." (".display_level($level).")"; ?></a></th>
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
												<td><?php echo substr($str, $i-1 , 1); ?></td>
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
							<a href="article.php?cidx=<?php echo($cid); ?>">Announcement</a>
							<br>
							<a href="article.php?cida=<?php echo($cid); ?>">Tutorial</a>
						</td>
					</tr>
				</tbody>
			</table>


		</div>
		<!-- <div id="contest_left_page"> -->
			<div id = "contest_display_main">
				<script src="../../Js/prism.js"></script>
				<?php echo "By ".$s_uid.",   problem id: ".$pro_name.",   ".get_verdict($s_result); ?>
				<hr>
				<pre>
					<code class="language-<?php echo($s_language) ?>" text-align= "left">
<?php echo $s_code; ?>
						<!-- <p class="prism"></p> -->
					</code>
				</pre>
				<?php
					if ($s_result == "Complie error") {
						?>
						<hr>
						<p class="CE_css"><?php echo $s_compile;?></p>
						
						<?php
					}
				?>
			</div>
		<!-- </div> -->
	</div>
</body>
</html>