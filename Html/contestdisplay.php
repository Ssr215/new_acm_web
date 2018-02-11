<?php
	include "../Php/Public_1.php";
	include "../Php/contest.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>contest display page</title>
	<link rel="stylesheet" type="text/css" href="../Css/contestHome.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
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

			<a href="contestidsplay.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a new_color_imp">Problem</a>

			<a href="contests_submit.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Submit</a>

			<a href="contest_submit_display_myself.php?<?php echo($cid) ?>" class="menu_label_1 menu_a">My Submit</a>

			<a href="contest_hack.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Hacks</a>

			<a href="contest_ranking.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Rank</a>

			<a href="contest_status.php?cid=<?php echo($cid) ?>" class="menu_label_1 menu_a">Status</a>

			<a href="contest_forum.php?cid=?<?php echo($cid) ?>" class="menu_label_1 menu_a">Forum</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= 7 ){
					?>
						<a href="authority.php" class="menu_label_1 menu_a">
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
		<table width="1200px" border="1">
			<thead>
				<th width="54px">#</th>
				<th>Name</th>
				<th width="90px"></th>
				<th width="90px"></th>
				<?php
					if ($type == 1) {
						?>
							<th width="150px">Score</th>
						<?php
					}
				?>
			</thead>
			<tbody>
				<?php
					$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
					$now_id = 0;
					$sql = "SELECT problem_id,change_problem_name,score,pass_number FROM contest_information_2 WHERE contest_id = '$cid' ORDER BY order_number ASC";
					$result = mysqli_query($conn,$sql);
					while ( $row = mysqli_fetch_array($result) ) {
						$pro_ids = $row['problem_id'];
						?>
							<tr>
								<td><?php echo substr($str, $now_id , 1); ?></td>
								<td><?php if ($row['change_problem_name'] == ""){echo get_problem_name($conn,$pro_ids);}else{echo $row['change_problem_name'];} ?></td>
								<td><a href="contests_submit.php?cid=<?php echo($cid); ?>&order=<?php echo($pro_ids) ?>">Submit</a></td>
								<td><?php if ($row['pass_number'] > 0) {
									echo $row['pass_number'];
								} ?></td>
							<?php
								if ( $type == 1 ) {
									?>
										<td><?php echo $row['score']; ?></td>
									<?php
								}
							?>
							</tr>
						<?php
						$now_id++;
					}
				?>
			</tbody>
		</table>
	</div>
</body>
</html>