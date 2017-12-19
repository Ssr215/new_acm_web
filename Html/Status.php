<?php
	include "../Php/Public_1.php";
	include '../Php/Status.php';
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../Css/problem.css">
	<?php
		if( $refresh_flag ){
			?>
				<meta http-equiv="refresh" content="0;url=index.php">
			<?php
		}
	?>
</head>
<body>
	<div id="package">
		<div id="head">
			<h2>
				<img id = "position_photo"  class="width_45" src="../photo/head2.jpg">
				<span class="_blue_1">Online Judge in private</span>
			</h2>
		</div>
		<div id="menu_backgound">
			<a href="index.php" class="menu_label_1 menu_a">
				<img id = "position_photo" src="../photo/display1.png">
				Home
			</a>

			<a href="problem.php" class="menu_label_1 menu_a">
				Problem
			</a>

			<a href="Status.php" class="menu_label_1 menu_a new_color_imp">
				Status
			</a>

			<a href="Contest.php" class="menu_label_1 menu_a">
				contest
			</a>

			<a href="user.php" class="menu_label_1 menu_a">
				User
				<!-- 排名记录 -->
			</a>

			<a href="forum.php" class="menu_label_1 menu_a">
				Forum
				<!-- 交流区，主要讨论题目错误或者疑问的地方 -->
			</a>

			<a href="article.php" class="menu_label_1 menu_a">
				Article
				<!-- 发表文章、竞赛题解、话题的地方 -->
			</a>

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

	<div id="problem_main_backgound">
		<?php 
			$page_number = get_status_number($conn);
			$page_number_have = (int)(($page_number+99)/100);
			for ($i=1; $i <=$page_number_have ; $i++) { 
				?>
					<a href="Status.php?page=<?php echo($i) ?>" class="page_a">
						<?php echo $i; ?>
					</a>
				<?php
			}
		?>
		<table width="1200px" align="center">
			<tbody>
				<tr>
					<td width="10%"> </td>
					<form>
						<td width="10%">status id</td>
						<td colspan="2" width="15%"><input type="text" name="ser_pro_id"></td>
						<td width="10%" align="left"><input type="submit" name="submit" value="Go"></td>
					</form>
					<td colspan="3" width="40%"> </td>
					<form>
						<td><input type="text" name="ser_pro_title"></td>
						<td><input type="submit" name="submit" value="Search"></td>
					</form>
				</tr>
			</tbody>
		</table>
		<!-- <br> -->
		<table width="1200px" align="center">
			<tbody>
				<tr class="first_table">
					<!-- <td width="4%"></td> -->
					<td width="10%">status id</td>
					<td width="20%">When</td>
					<td width="12%">Who</td>
					<td width="12%">Problem id</td>
					<td width="8%">language</td>
					<td>Verdict</td>
					<!-- <td>title</td> -->
					<!-- <td width="8%">exp</td> -->
					<td width="8%">Time</td>
					<td width="10%">Memory</td>
				</tr>
				<?php
					$page_now = 1;
					if (isset($_GET['page'])) {
						$page_now = $_GET['page'];
					}
					if( $page_now < 1 || $page_now > $page_number_have ){
						$page_now = 1;
					}
					$begin_id = $page_number - 100 * ($page_now - 1);
					if ($begin_id <= 0) {
						$begin_id = $begin_id + 100;
					}
					$end_id = $begin_id - 101;
					if( $end_id < 0 ){
						$end_id = 0;
					}
					$sql = "SELECT * FROM pro_submit WHERE id <= '$begin_id' AND id >= '$end_id' order by id desc";
					$result = mysqli_query($conn,$sql);
					$here_row = 0;
					while ($row = mysqli_fetch_array($result)) {
						$here_row++;
						?>
							<tr class="<?php if($here_row%2==0){echo('odd_table');}else{echo('even_table');} ?>">
								<td><?php echo $row['id']; ?></td>
								<td><?php echo $row['_date']; ?></td>
								<td><?php echo get_id_name($conn,$row['user_id']); ?></td>
								<td><?php echo $row['pro_id']; ?></td>
								<td><a href="Status_display.php?pid=<?php echo($row['id']) ?>"><?php echo get_language($row['language']); ?></a></td>
								<td><?php echo get_verdict($row['result']); ?></td>
								<td><?php echo $row['u_time'] . "ms"; ?></td>
								<td><?php echo $row['u_memory'] . "Kb"; ?></td>
							</tr>
						<?php
					}
				?>
			</tbody>
		</table>
	</div>
</body>
</html>