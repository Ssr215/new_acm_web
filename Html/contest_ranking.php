<?php
	include "../Php/Public_1.php";
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

			<a href="contest_ranking.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">Rank</a>

			<a href="contest_status.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Status</a>

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
		<hr>
		<table width="1200px" border="1" style="font-size:0.9rem">
			<thead>
				<tr>
					<td width="54px">#</td>
					<td>Who</td>
					<td width="60px">=</td>
					<td width="90px">*</td>
					<?php
						$sql = "SELECT score FROM contest_information_2 WHERE contest_id = '$cid'";
						$result = mysqli_query($conn,$sql);
						$ik = 0;
						while ( $row = mysqli_fetch_array($result) ) {
							$ik++;
							?>
								<td width="75">
									<a href="contest_display.php?cid=<?php echo $cid ?>&pid=<?php echo $ik ?>"><?php echo substr($str, $ik-1 , 1); ?></a>
									<br>
									<?php echo $row['score']; ?>
								</td>
							<?php
						}
					?>
				</tr>
			</thead>
			<tbody>
				<?php
					$sql = "SELECT user_id,total_score FROM contest_ranks_information_2 WHERE contest_id = '$cid' order by total_score desc";
					$result = mysqli_query($conn,$sql);
					$rk = 0;
					while ( $row = mysqli_fetch_array($result) ) {
						$rk++;
						?>
							<tr>
									<td><?php echo $rk; ?></td>
									<td><?php echo get_id_name($conn,$row['user_id']); ?></td>
									<td><?php echo $row['total_score']; ?></td>
									<td></td>
								<?php
									$uid = $row['user_id'];
									for ($i=1; $i <= $ik; $i++) { 
										$sql = "SELECT pass_time,add_score FROM contest_ranks_information_1 WHERE user_id = '$uid' AND contest_id = '$cid' AND pass_problem_id = '$i'";
										$result1 = mysqli_query($conn,$sql);
										$f = true;
										while ( $row1 = mysqli_fetch_array($result1) ) {
											$f = false;
											?>
												<td>
													<span class="result_ACcolor c_font">
														<?php echo $row1['add_score']; ?>
													</span>
													<br>
													<?php
													$date=date_create_from_format("G:i:s",$row1['pass_time']);
													echo date_format($date,"H:i"); ?>
												</td>
											<?php
										}
										if ( $f ) {
											?>
												<td></td>
											<?php
										}
									}
								?>
							</tr>
						<?php
					}
				?>
			</tbody>
		</table>
	</div>
</body>
</html>