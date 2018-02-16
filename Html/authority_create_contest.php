<?php
	include "../Php/Public_1.php";
	if( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ){
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;url=index.php">
		<?php
		exit();
	}
	include "../Php/authority.php";
	// get_begin_time(0);
	function get_begin_time($flag){
		date_default_timezone_set('Asia/Shanghai');
		$ans = '20'.date('y-m-d',time()).'T';
		$h = date('H',time());
		$m = date('i',time());
		while ( $m % 5 > 0 ) {
			$m++;
			if( $m == 60 ){
				$h++;
				$m = 0;
				if( $h == 24 ){
					$h = 0;
				}
			}
		}
		// if( $m < 10 ){
		// 	$m = '0'.$m;
		// }
		if ( $flag == 1 ) {
			 $h = ($h + 2) % 24;
			 if ( $h < 10 ) {
			 	$h = '0'.$h;
			 }
		}
		// if ($h < 10) {
		// 	$h = '0'.$h;
		// }
		echo $ans.$h.":".$m;
	}

	$create_success_flag = 0;
	$have_value = 0;
	$number = 3;
	if ( isset($_POST['c_number']) ) {
		$number = $_POST['c_number'];
		$have_value = 1;
		if ( isset($_POST['pro_'.$number]) && !isset($_POST['pro_'.($number+1)]) ) {
			echo "try to insret but now need ck";
			$create_success_flag = 2;
			if ( $_POST['c_name'] == "" ) {
				echo "contest name must have!";
			}else{
				$ck_flag = 0;
				$up = get_of_web_number_information($conn,3);
				for ($i=1; $i <= $number; $i++) { 
					if ( $_POST['pro_'.$i] < 1000 || $_POST['pro_'.$i] >= $up || $_POST['pro_'.$i.'_score'] < 500 || $_POST['pro_'.$i.'_score'] > 3500 ) {
						$ck_flag = 1;
						break;
					}
				}
				if ( $ck_flag == 0 ) {
					echo "pass ck , now will insert content now!";
					$c_id = $_POST['c_id'];
					$begin_time = $_POST['c_begin_time'];
					$duration = $_POST['c_duration'];
					$name = $_POST['c_name'];
					$id = get_user_id($conn,$GLOBALS['loading_username']);
					$level = $_POST['c_level'];
					$type = $_POST['c_type'];
					$limit_par = $_POST['c_limit_par'];
					$sql = "INSERT INTO contest_information_1 (contest_id,level,type,begin_time,duration,limit_par,name,creator_id,problem_number,submit_number) VALUES ('$c_id','$level','$type','$begin_time','$duration','$limit_par','$name','$id','$number','0')";
					if ( !mysqli_query($conn,$sql) ) {
						echo "Error: " . $sql . "<br>" . $conn->error;
						$create_success_flag = 3;
					}else{
						get_and_update_of_web_number_information($conn,7);
						for ($i=1; $i <= $number ; $i++) { 
							$id = get_and_update_of_web_number_information($conn,8);
							$pro_id = $_POST['pro_'.$i];
							$change_name = $_POST['pro_'.$i."_name"];
							$c_score = $_POST['pro_'.$i."_score"];
							$sql = "INSERT INTO contest_information_2 (id,contest_id,problem_id,order_number,change_problem_name,score,pass_number,test_number) VALUES ('$id','$c_id','$pro_id','$i','$change_name','$c_score','0','0')";
							if ( !mysqli_query($conn,$sql) ) {
								echo "Error: " . $sql . "<br>" . $conn->error;
								$create_success_flag = 4*100 + $i;
								break;
							}
						}
						if ( $create_success_flag == 2 ) {
							$create_success_flag = 1;
						}
					}
				}
			}
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<?php
		if ( $create_success_flag == 1 ) {
			?>
				<script type="text/javascript">
					alert("Create is success!");
				</script>
				<meta http-equiv="refresh" content="0;url=index.php">
			<?php
			exit();
		}
	?>
	<link rel="stylesheet" type="text/css" href="../Css/authority.css">
	<script type="text/javascript" src="../Js/authority.js"></script>
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
						<a href="authority.php" class="menu_label_1 menu_a  new_color_imp">
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

	<div id="main_page">
		<div id="main_menu_background">
			<a href="authority_add_problem.php" class="menu_label_5 menu_a">
				Add problem
			</a>

			<a href="authority_update_problem.php" class="menu_label_5 menu_a">
				Update problem
			</a>

			<a href="authority_add_test.php" class="menu_label_5 menu_a">
				Add test
			</a>

			<a href="authority_update_test.php" class="menu_label_5 menu_a">
				Update test
			</a>

			<a href="authority_create_contest.php" class="menu_label_5 menu_a new_color_img_authority">
				Create contest
			</a>

			<a href="authority_delete_anything.php" class="menu_label_5 menu_a">
				Delete
			</a>

			<a href="authority_allow_huck.php" class="menu_label_5 menu_a">
				Open huck
			</a>

			<?php
				if( get_uesr_authority($conn,$GLOBALS['loading_username']) == 9 ){
					?>
						<a href="authority_increase_permissions.php" class="menu_label_5 menu_a">
							Increase permissions
						</a>
					<?php
				}
			?>
		</div>
	</div>

	<div  id="main_add_problem_page">
		<form action="authority_create_contest.php" method="post">
			<center>
				<table width="900px">
					<tbody>
						<tr>
							<td width="200px">contest id</td>
							<td><input type="text" name="c_id" value="<?php echo(get_of_web_number_information($conn,7)) ?>" readonly="readonly"></td>
							<td width="200px">contest name</td>
							<td><input type="text" name="c_name"></td>
						</tr>
						<tr>
							<td>problem number</td>
							<td><input type="text" name="c_number" value="<?php if(isset($_POST['c_number'])){echo($number);}else{echo(3);} ?>" id="c_number"></td>
							<td>duration(minute)</td>
							<td><input type="text" name="c_duration" onchange="change_end_time()" value="<?php if(isset($_POST['c_duration'])){echo($_POST['c_duration']);}else{echo(120);} ?>" id="c_duration"></td>
						</tr>
						<tr>
							<td>begin time</td>
							<td><input type="datetime-local" name="c_begin_time" value="<?php if(isset($_POST['c_begin_time'])){echo($_POST['c_begin_time']);}else{get_begin_time(0);} ?>" id="c_begin_time" onchange="change_end_time()"></td>
							<td>end time</td>
							<td><input type="datetime-local" name="c_end_time" value="<?php if(isset($_POST['c_end_time'])){echo($_POST['c_end_time']);}else{get_begin_time(1);} ?>" readonly="readonly" id="c_end_time"></td>
						</tr>
						<tr>
							<td>level</td>
							<td>
								<select name="c_level">
									<option value="0">div 3(Rating on (-inf,1200) )</option>
									<option value="1">div 2(Rating on [1200,1900) )</option>
									<option value="2">div 1'2(Rating on (-inf,inf) )</option>
									<option value="3">div 1(Rating on [1900,inf) )</option>
									<option value="4">education (using CCPC/ICPC)</option>
								</select>
							</td>
							<td>type</td>
							<td>
								<select name="c_type">
									<option value="1">CF rating div</option>
									<option value="2">ICPC/CCPC</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Specific account</td>
							<td>
								<select name="c_limit_par">
									<option value="1">Yes</option>
									<option value="0">No</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table width="900px" border="1" id="mytable">
						<thead>
							<tr>
								<td>order flag</td>
								<td>problem id</td>
								<td>change problem title</td>
								<td>Score</td>
							</tr>
						</thead>
						<tbody>
							<?php
								$temp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
								for ($i = 1; $i <= $number; $i++) {
									?>
										<tr id="<?php echo('num_'.$i) ?>">
											<td><?php echo substr($temp, $i-1,1); ?></td>
											<td><input type="text" name="pro_<?php echo($i) ?>" value="<?php if(isset($_POST['pro_'.$i])){echo($_POST['pro_'.$i]);}else{echo('');} ?>"></td>
											<td><input type="text" name="pro_<?php echo($i) ?>_name" value="<?php if(isset($_POST['pro_'.$i.'_name'])){echo($_POST['pro_'.$i.'_name']);}else{echo('');} ?>"></td>
											<td><input type="text" name="pro_<?php echo($i) ?>_score" value="<?php if(isset($_POST['pro_'.$i.'_score'])){echo($_POST['pro_'.$i.'_score']);}else{echo(500);} ?>"></td>
										</tr>
									<?php
								}
							?>
						</tbody>
				</table>
				<br>
				<br>
				<input type="submit" name="submit" class="submit_size">
			</center>
		</form>
	</div>
</body>
</html>