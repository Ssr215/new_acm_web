<!-- Status_display.php -->
<?php
	include "../Php/Public_1.php";
	include '../Php/Status.php';
	$pid = 1;
	if (isset($_GET['pid'])) {
		$pid = $_GET['pid'];
	}
	$sql = "SELECT * FROM pro_submit WHERE id = '$pid'";
	$result = mysqli_query($conn,$sql);
	$code = "nothing in here";
	$language = 0;
	$r = 0;
	$u_time = 0;
	$u_memory = 0;
	$pro_id = 1000;
	$u_id = -1;
	$compile = "nothing";
	while ($row = mysqli_fetch_array($result)) {
		$language = $row['language'];
		$code = $row['code'];
		$r = $row['result'];
		$u_time = $row['u_time'];
		$u_memory = $row['u_memory'];
		$pro_id = $row['pro_id'];
		$u_id = $row['user_id'];
		$compile = $row['compile'];
	}
	$language = get_languages($language);
	$r = get_verdict($r);
	$u_id = get_id_name($conn,$u_id);
	$code = str_replace("<", "&lt;", $code);
	$code = str_replace(">", "&gt;", $code);
	$compile = str_replace("\n", "<br>", $compile);

	function get_name_id($conn,$u_name){
		$sql = "SELECT id FROM user_information WHERE user_name='$u_name'";
		$a = -1;
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			$a = $row['id'];
		}
		return $a;
	}

	function get_ac_of_id($conn,$u_id,$pid){
		$sql = "SELECT pass_problem FROM user_information_1 WHERE id='$u_id'";
		$result = mysqli_query($conn,$sql);
		$ans = "";
		while ( $row = mysqli_fetch_array($result) ) {
			$ans = $row['pass_problem'];
		}
		if ( strstr($ans, $pid) ) {
			return false;
		}
		return true;
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>new online judge in cqupt private</title>
	<link rel="stylesheet" type="text/css" href="../Css/Home.css">
	<link rel="stylesheet" type="text/css" href="../Css/public_1.css">
	<link href="../Css/prism.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="../Css/display_code.css">
	<?php
		if( $refresh_flag ){
			?>
				<meta http-equiv="refresh" content="0;url=index.php">
			<?php
			exit();
		}
		if ( $GLOBALS['loading_user_flag'] == false || ( $u_id != $GLOBALS['loading_username']  && get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 && get_ac_of_id($conn,get_name_id($conn,$GLOBALS['loading_username']),$pro_id) ) ) {
			?>
				<script type="text/javascript">
					alert("No Access! You must Accepted this problem first!");
				</script>
				<meta http-equiv="refresh" content="0;url=Status.php">
			<?php
			exit();
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
			<a href="index.php" class="menu_label_1 menu_a new_color_imp">
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

	<div id = "display_main">
		<script src="../Js/prism.js"></script>
		<?php echo "By ".$u_id.",   problem id: ".$pro_id.",   ".$r; ?>
		<hr>
		<pre>
			<code class="language-<?php echo($language) ?>" text-align= "left">
<?php echo $code; ?>
				<!-- <p class="prism"></p> -->
			</code>
		</pre>
		<?php
			if ($r == "Complie error") {
				?>
				<hr>
				<p class="CE_css"><?php echo $compile;?></p>
				
				<?php
			}
		?>
	</div>
</body>
</html>