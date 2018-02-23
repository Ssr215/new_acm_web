<?php
	include "../Php/Public_1.php";
	function display_level($num){
		if ( $num == 0 ) {
			echo "div 3";
		}else if ( $num == 1 ) {
			echo "div 2";
		}else if ( $num == 2 ) {
			echo "div 1'2";
		}else if ( $num == 3 ) {
			echo "div 1";
		}else {
			echo "education";
		}
	}
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
				<!-- <img id = "position_photo"  class="width_45" src="../photo/head2.jpg"> -->
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

			<a href="Status.php" class="menu_label_1 menu_a">
				Status
			</a>

			<a href="huck_display.php" class="menu_label_1 menu_a">
				Huck
			</a>

			<a href="Contest.php" class="menu_label_1 menu_a new_color_imp">
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
						<a href="authority/index.php" class="menu_label_1 menu_a">
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
			$have_page = get_of_web_number_information($conn,7);
			$have_page--;
			$each_page_number = 100;
			$page_numbers_have = (int)(($have_page + $each_page_number - 1) / $each_page_number);
			for ($i=1; $i <= $page_numbers_have; $i++) {
				?>
					<a href="contest.php?page=<?php echo($i); ?>" class = "page_a">
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
						<td width="10%">contest id</td>
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

		<table width="1200px" align="center">
			<thead>
				<tr class="first_table">
					<td width="10%">contest id</td>
					<td>title</td>
					<td width="8%">level</td>
					<td width="16%">begin time</td>
					<td width="8%">duration</td>
				</tr>
			</thead>
			<tbody>
				<?php
					$page_begin_add = 0;
					if ( isset($_GET['page']) ) {
						$page_begin_add = $_GET['page'];
						// echo $page_begin_add . "<br>";
						$page_begin_add = ($page_begin_add-1)*$each_page_number;
						$begin_id = $page_begin_add;
						$end_id = $begin_id + $each_page_number;
					}else{
						$begin_id = ($page_numbers_have-1)*$each_page_number;
						$end_id = $page_numbers_have*$each_page_number;
					}
					
					if( $end_id > $have_page ){
						$end_id = $have_page;
					}
					
					$here_row = 0;
					$sql = "SELECT contest_id,level,begin_time,duration,name FROM contest_information_1 LIMIT $begin_id,$end_id";
					$result = mysqli_query($conn,$sql);
					if( !$result ){
						echo "Error: " . $sql . "<br>" . $conn->error;
					}else{
						while ($row = mysqli_fetch_array($result)) {
							$here_row++;
							$cid = $row['contest_id'];
							?>
								<tr class="<?php if($here_row%2==0){echo('odd_table');}else{echo('even_table');} ?>">
									<td><?php echo $cid; ?></td>
									<td><a href="contest/index.php?cid=<?php echo($cid) ?>"><?php echo $row['name']; ?></a></td>
									<td><?php display_level($row['level']); ?></td>
									<td><?php echo $row['begin_time']; ?></td>
									<td><?php echo $row['duration']." min"; ?></td>
								</tr>
							<?php
						}
					}
				?>
			</tbody>
		</table>
	</div>

</body>
</html>