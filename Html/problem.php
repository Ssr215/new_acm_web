<?php
	include "../Php/Public_1.php";
	include "../Php/problem.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<link rel="stylesheet" type="text/css" href="../Css/problem.css">
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

			<a href="problem.php" class="menu_label_1 menu_a new_color_imp">
				Problem
			</a>

			<a href="Status.php" class="menu_label_1 menu_a">
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
			$have_page = get_problem_number($conn);
			$page_numbers_have = (int)(($have_page + 99) / 100);
			for ($i=1; $i <= $page_numbers_have; $i++) {
				?>
					<a href="problem.php?page=<?php echo($i); ?>" class = "page_a">
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
						<td width="10%">problem id</td>
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
					<td width="4%"></td>
					<td width="12%">problem id</td>
					<td>title</td>
					<!-- <td width="8%">exp</td> -->
					<td width="8%">AC</td>
					<td width="8%">submit</td>
				</tr>
				<?php
					$begin_id = ($page_numbers_have-1)*100;
					$end_id = $page_numbers_have*100;
					if( $end_id > $have_page ){
						$end_id = $have_page;
					}
					// $end_id--;
					$here_row = 0;
					$sql = "SELECT pro_id,title,AC,submit FROM problem_information_1 LIMIT $begin_id,$end_id";
					$result = mysqli_query($conn,$sql);
					if( !$result ){
						echo "Error: " . $sql . "<br>" . $conn->error;
					}else{
						while ($row = mysqli_fetch_array($result)) {
							if( get_problem_authority($conn,$row['pro_id']) > get_uesr_authority($conn,$GLOBALS['loading_username']) ){
								continue;
							}
							$here_row++;
							?>
								<tr class="<?php if($here_row%2==0){echo('odd_table');}else{echo('even_table');} ?>">
									<td> </td>
									<td> <?php echo $row['pro_id']; ?> </td>
									<td> <a href="problemdisplay.php?pid=<?php echo($row['pro_id']); ?>" class="table_font menu_a"><?php echo $row['title']; ?></a></td>
									<td> <?php echo $row['AC']; ?></td>
									<td> <?php echo $row['submit']; ?></td>
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