<?php
	include "../Php/Public_1.php";
	//get_begin_time();
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
		if( $m < 10 ){
			$m = '0'.$m;
		}
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
		if ( isset($_POST['pro_'.$c_number]) && !isset($_POST['pro_'.$c_number+1]) ) {
			$create_success_flag = 2;
			$c_id = $_POST['c_id'];
			//$sql = "INSERT INTO "
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
		if( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ){
			?>
				<script type="text/javascript">
					alert("No Access!");
				</script>
				<meta http-equiv="refresh" content="0;index.php">
			<?php
			exit();
		}
		include "../Php/authority.php";
	?>
	<link rel="stylesheet" type="text/css" href="../Css/authority.css">
	<script type="text/javascript" src="../Js/authority.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.add_row').click(function(e){
				var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
				var x = document.getElementById('c_number');
				x.value = x.value + 1;
				x = x.value;
				var $html = $("<tr><td>"+str.substr(x-1,1)+"</td><td><input type=\'text\' name=\'pro_"+x+"\'></td><td><input type=\'text\' name=\'pro_"+x+"_name\'></td><td><a id=\'de_row\' onclick=\'sc()\'></a></td>");
				$('.mytable table ').append($html);
			});
		})
		function sc(){
			$('.mytable table tr').eq($(this).index()).remove();
		}
	</script>
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

			<a href="authority_update_contest.php" class="menu_label_5 menu_a">
				Update contest
			</a>

			<a href="authority_delete_anything.php" class="menu_label_5 menu_a">
				Delete
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
							<td><input type="text" name="c_id" value="1" readonly="readonly"></td>
							<td width="200px">contest name</td>
							<td><input type="text" name="c_name"></td>
						</tr>
						<tr>
							<td>problem number</td>
							<td><input type="text" name="c_number" value="<?php if(isset($_POST['c_number'])){echo($number);}else{echo(3);} ?>" id="c_number"></td>
							<td>duration(minute)</td>
							<td><input type="text" name="c_duration" onchange="change_end_time()" value="120" id="c_duration"></td>
						</tr>
						<tr>
							<td>begin time</td>
							<td><input type="datetime-local" name="c_begin_time" value="<?php get_begin_time(0) ?>" id="c_begin_time" onchange="change_end_time()"></td>
							<td>end time</td>
							<td><input type="datetime-local" name="c_end_time" value="<?php get_begin_time(1) ?>" readonly="readonly" id="c_end_time"></td>
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
								<!-- <td>operation</td> -->
							</tr>
						</thead>
						<tbody>
							<?php
								$temp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
								for ($i = 1; $i <= 3; $i++) { 
									?>
										<tr id="<?php echo('num_'.$i) ?>">
											<td><?php echo substr($temp, $i-1,1); ?></td>
											<td><input type="text" name="pro_<?php echo($i) ?>"></td>
											<td><input type="text" name="pro_<?php echo($i) ?>_name"></td>
											<!-- <td></td> -->
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