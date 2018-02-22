<?php
	include "../Php/Public_1.php";
	if ( !$GLOBALS['loading_user_flag'] ) {
		?>
			<script type="text/javascript">
					alert("please log in first!");
			</script>
			<meta http-equiv="refresh" content="0;loading.php">
		<?php
		exit();
	}
	include "../Php/contest.php";
	$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
?>

<!DOCTYPE html>
<html>
<head>
	<title>contest display page</title>
	<link rel="stylesheet" type="text/css" href="../Css/contestHome.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../Css/problem.css">
	<script type="text/javascript" src="../Js/contest.js"></script>
</head>
<body>
	<div id="package">
		<div id="head">
			<h2>
				<span class="_blue_1"><?php echo $name; ?></span>
			</h2>
		</div>

		<div id="menu_backgound_3">
			<a href="index.php" class="menu_label_1 menu_a">Home</a>

			<a href="contestdisplay.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Problem</a>

			<a href="contests_submit.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Submit</a>

			<a href="contest_submit_display_myself.php?<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

			<a href="contest_huck.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Hucks</a>

			<a href="contest_ranking.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Rank</a>

			<a href="contest_status.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">Status</a>

			<a href="contest_forum.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Forum</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= 7 ){
					?>
						<a href="contest_authority.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">
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
		<div id="contest_left_page">
			<?php
				// echo strtotime($begin_time." +".$duration." minute")." vs ".time();
				$participate_flag = false;
				if ( strtotime($begin_time." +".$duration." minute") > time() ) {
					if ( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ) {
						if ( strtotime($begin_time) > time() ) {
							echo "The contest has not started yet";
							exit();
						}else if ( ck_is_allow_participate($conn,$GLOBALS['loading_username'],$cid) ) {
							echo "You can not participate in this competition";
							exit();
						}
						$participate_flag = true;
					}
				}
				$uid = get_user_id($conn,$GLOBALS['loading_username']);
				$new_flag = 1;
				if ( !ck_is_allow_participate($conn,$GLOBALS['loading_username'],$cid) ) {
					// $sql = "SELECT id,problem_id,language,submit_time,result,u_time,u_memory FROM contest_pro_submit WHERE contest_id = '$cid' AND 	competitor = 1";
					$page_number = get_cstatus_number($conn,1,$cid);
				}else{
					// $sql = "SELECT id,problem_id,language,submit_time,result,u_time,u_memory FROM contest_pro_submit WHERE contest_id = '$cid'";
					$page_number = get_cstatus_number($conn,0,$cid);
					$new_flag = 0;
					// echo "here you are";
				}
				$each_page_number = 100;
				$page_number_have = (int)(($page_number+$each_page_number-1)/$each_page_number);
				for ($i=1; $i <=$page_number_have ; $i++) { 
					?>
						<a href="contest_status.php?cid=<?php echo($cid) ?>&page=<?php echo($i) ?>" class="page_a">
							<?php echo $i; ?>
						</a>
					<?php
				}
			?>
			<table width="900px" border="1" style="font-size:0.9rem">
				<thead>
					<th width="54px">#</th>
					<th width="150px">When</th>
					<th width="120px">Who</th>
					<th>Problem</th>
					<th width="60px">Lang</th>
					<th width="150px">Verdict</th>
					<th width="60px">Time</th>
					<th width="60px">Memory</th>
				</thead>
				<tbody>
					<?php
						$page_now = 1;
						if (isset($_GET['page'])) {
							$page_now = $_GET['page'];
						}
						if( $page_now < 1 || $page_now > $page_number_have ){
							$page_now = 1;
						}
						$begin_id = $page_number - $each_page_number * ($page_now - 1);
						if ($begin_id <= 0) {
							$begin_id = $begin_id + $each_page_number;
						}
						$end_id = $begin_id - $each_page_number;
						if( $end_id < 0 ){
							$end_id = 0;
						}
						if ( $new_flag == 0 ) {
							$sql = "SELECT id,problem_id,user_id,language,submit_time,result,u_time,u_memory FROM contest_pro_submit WHERE contest_id = '$cid' order by id desc LIMIT $end_id,$begin_id";
						}else{
							$sql = "SELECT id,problem_id,user_id,language,submit_time,result,u_time,u_memory FROM contest_pro_submit WHERE contest_id = '$cid' AND 	competitor = 1 order by id desc LIMIT $end_id,$begin_id";
						}
						$result = mysqli_query($conn,$sql);
						while ( $row = mysqli_fetch_array($result) ) {
							?>
								<tr>
									<td><?php echo $row['id']; ?></td>
									<td><?php echo $row['submit_time']; ?></td>
									<td><?php echo get_id_name($conn,$row['user_id']); ?></td>
									<td><?php echo substr($str, $row['problem_id']-1,1).". ".get_problem_name($conn,get_contest_id_order_id_pro_id($conn,$row['problem_id'],$cid)); ?></td>
									<td><?php echo get_languages($row['language']); ?></td>
									<td class="<?php get_color_of_result($row['result']) ?>">
										<?php 
											echo get_verdict($row['result']); 
											if ( !$participate_flag ) {
												?>
													<a href="contest_rejudge.php?cid=<?php echo($cid) ?>&sid=<?php echo($row['id']) ?>&result=<?php echo($row['result']) ?>&pid=<?php echo($row['problem_id']) ?>">rejudge</a>
												<?php
											}
										?>
									</td>
									<?php
										if ( $participate_flag && $row['user_id'] != $uid ) {
											?>
												<td>0 ms</td>
												<td>0 K</td>
											<?php
										}else{
											?>
												<td><?php echo $row['u_time']." ms"; ?></td>
												<td><?php echo $row['u_memory']." K"; ?></td>
											<?php
										}
									?>
									
								</tr>
							<?php
						}
					?>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>