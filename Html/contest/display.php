<?php
	include "../../Php/Public_1.php";
	include "../../Php/contest.php";
	$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	$po_id = 1;
	if ( isset($_GET['pid']) ) {
		$po_id = $_GET['pid'];
	}
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

			<a href="index.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">Problem</a>

			<a href="submit.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Submit</a>

			<a href="submit_display_myself.php?<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

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

			<table class="right_table" border="1">
				<tbody>
					<tr>
						<th colspan="2" class="green_color">
							<?php 
								if ( $begin_flag ) {
									?>
										If Accepted in <?php pass_time_now($hour,$minute,$duration);
								}else{
									?>
										If Accepted in Finsh 
									<?php
								}
							?>
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
									<td><?php 
										if ( $begin_flag == 1 ) {
											get_pass_problem_now_score($conn,$i,$cid,$duration-($minute+$hour*60)); 
										}else{
											get_pass_problem_now_score($conn,$i,$cid,-1);
										}
									?></td>
								</tr>
							<?php
						}
					?>
				</tbody>
			</table>
			<?php
				if ( $begin_flag == 1 || strtotime($begin_time." +".$duration." minute") < time()   ) {		
					?>
					<form action="submit.php?cid=<?php echo($cid) ?>&pid=<?php echo($po_id); ?>" method="post" enctype="multipart/form-data">
						<table  class="right_table" border="1">
							<tbody>
								<tr>
									<th width="270px">Submit?</th>
								</tr>
								<tr>
									<td align="left">
										<table>
											<tr>
												<td width="40px">Language:</td>
												<td width="200px"><select name="c_language">
													<option>C</option>
													<option>C++</option>
													<option>C++11</option>
													<option>C++14</option>
													<option>JAVA</option>
												</select></td>
											</tr>
											<tr>
												<td>code:</td>
												<td> </td>
											</tr>
											<tr>
												<td colspan="2">
												<input type="file" name="contest_code_file" id="file">
												</td>
											</tr>
											<?php
												if ( $begin_flag == 1 ) {
													?>
													<tr>
														<td colspan="2"><p>Be careful: there is 50 points penalty for submission which fails the pretests or resubmission (except failure on the first test, denial of judgement or similar verdicts). "Passed pretests" submission verdict doesn't guarantee that the solution is absolutely correct and it will pass system tests.</p></td>
													</tr>
													<?php
												}
											?>
											<tr>
												<td colspan="2" align="center">
													<input style="width: 10em;height: 2em" type="submit" name="submit" value="Submit">
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
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
				$pro_id = get_contest_id_order_id_pro_id($conn,$po_id,$cid);
				$sql = "SELECT title,time_limit,memory_limit,time_limit_java,memory_limit_java,input,output FROM problem_information_1 WHERE pro_id='$pro_id'";
				$title = "1000";
				$time_limit = 0;
				$memory_limit = 0;
				$time_limit_java = 0;
				$memory_limit_java = 0;
				$input = "nothing";
				$output = "nothing";
				$result = mysqli_query($conn,$sql);
				while ( $row = mysqli_fetch_array($result) ) {
					$title = $row['title'];
					$time_limit = $row['time_limit'];
					$time_limit_java = $row['time_limit_java'];
					$memory_limit = $row['memory_limit'];
					$memory_limit_java = $row['memory_limit_java'];
					$input = $row['input'];
					$output = $row['output'];
				}
				$sql = "SELECT change_problem_name FROM contest_information_2 WHERE contest_id='$cid' AND order_number='$po_id'";
				$result = mysqli_query($conn,$sql);
				while ( $row = mysqli_fetch_array($result) ) {
					if ( $row['change_problem_name'] != "" ) {
						$title = $row['change_problem_name'];
					}
				}
				$sql = "SELECT description,sample_input,sample_output FROM problem_information_2 WHERE pro_id = '$pro_id'";
				$description = "nothing";
				$sample_output = "nothing";
				$sample_input = "nothing";
				$result = mysqli_query($conn,$sql);
				while ( $row = mysqli_fetch_array($result) ) {
					$description = $row['description'];
					$sample_input = $row['sample_input'];
					$sample_output = $row['sample_output'];
				}
				$sql = "SELECT hint FROM problem_information_3 WHERE pro_id='$pro_id'";
				$hint = "nothing";
				$result = mysqli_query($conn,$sql);
				while ( $row = mysqli_fetch_array($result) ) {
					$hint = $row['hint'];
				}
				?>
				<div id="problem_title"><?php echo substr($str, $po_id-1 , 1). ". ". $title; ?></div>
				<div id="problem_submit">
					Time Limit: <?php echo $time_limit; ?> ms  Memory Limit: <?php echo $memory_limit; ?> M
					<br>
					JAVA Time Limit: <?php echo $time_limit_java; ?> ms JAVA Memory Limit:<?php echo $memory_limit_java; ?> M
				</div>
				<div id="cpro_display_description">
					Description
				</div>
				<div id="cpro_display_detile">
					<?php 
						$description = str_replace("\n", "<br>", $description);
						echo $description; 
					?>
				</div>
				<div id="cpro_display_description">
					Input
				</div>
				<div id="cpro_display_detile">
					<?php
						$input = str_replace("\n", "<br>", $input);
						echo $input;
					?>
				</div>
				<div id="cpro_display_description">
					Output
				</div>
				<div id="cpro_display_detile">
					<?php
						$output = str_replace("\n", "<br>", $output);
						echo $output;
					?>
				</div>
				<div id="cpro_display_description">
					Sample Input
				</div>
				<div id="cpro_display_detile">
					<?php
						$sample_input = str_replace("\n", "<br>", $sample_input);
						echo $sample_input;
					?>
				</div>
				<div id="cpro_display_description">
					Sample Output
				</div>
				<div id="cpro_display_detile">
					<?php
						$sample_output = str_replace("\n", "<br>", $sample_output);
						echo $sample_output;
					?>
				</div>
				<div id="cpro_display_description">
					Hint
				</div>
				<div id="cpro_display_detile">
					<?php
						$hint = str_replace("\n", "<br>", $hint);
						echo $hint;
					?>
				</div>
				<?php
			?>
		</div>
	</div>
</body>
</html>