<?php
	$cid = 1;
	if ( isset($_GET['cid']) ) {
		$cid = $_GET['cid'];
	}
	$flag = 1;
	if ( is_numeric($cid) ) {
		$flag = 0;
		$cid = (int)$cid;
		if ( $cid <= 0 ) {
			$cid = 1;
		}
	}
	if ( $flag == 1 ) {
		?>
			<script type="text/javascript">
					alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php">
		<?php
		exit();
	}
	$sql = "SELECT level,type,begin_time,duration,name,problem_number FROM contest_information_1 WHERE contest_id='$cid'";
	$result = mysqli_query($conn,$sql);
	$name = "nothing";
	$level = 0;
	$type = 0;
	$begin_time = time();
	$duration = 120;
	$problem_number = 0;
	while ( $row = mysqli_fetch_array($result) ) {
		$level = $row['level'];
		$type = $row['type'];
		$begin_time = $row['begin_time'];
		$duration = $row['duration'];
		$name = $row['name'];
		$problem_number = $row['problem_number'];
	}

	function get_problem_name($conn,$pro_id){
		$sql = "SELECT title FROM problem_information_1 WHERE pro_id = '$pro_id'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			return $row['title'];
		}
		return "error in get problem name";
	}

	//检查是否可以参加contest_id的比赛，可以返回false，否则返回true
	function ck_is_allow_participate($conn,$u_name,$cid){
		$sql = "SELECT limit_par FROM contest_information_1 WHERE contest_id = '$cid'";
		$result = mysqli_query($conn,$sql);
		$a = 1;
		while ( $row = mysqli_fetch_array($result) ) {
			$a = $row['limit_par'];
		}
		if ( $a == 0 ) {
			return false;
		}
		$sql = "SELECT cid_allow FROM user_information WHERE user_name='$u_name'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			if ( $row['cid_allow'] == $cid ) {
				return false;
			}
		}
		return true;
	}

	function display_level($num){
		if ( $num == 0 ) {
			return "div 3";
		}else if ( $num == 1 ) {
			return "div 2";
		}else if ( $num == 2 ) {
			return "div 1'2";
		}else if ( $num == 3 ) {
			return "div 1";
		}else {
			return "education";
		}
	}

	function display_2d_number($num){
		if ( $num < 10 ) {
			echo "0".$num;
		}else{
			echo $num;
		}
	}

	function get_pass_problem_now_score($conn,$id,$cid,$pass_min){
		// echo "500";
		$ans = 0;
		$sql = "SELECT score FROM contest_information_2 WHERE contest_id = '$cid' AND order_number = '$id'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			$ans = $row['score'];
		}
		if ( $pass_min == -1 ) {
			echo (int)($ans*0.3);
			return;
		}
		$y = $ans / 250;
		echo $ans-$y*$pass_min;
	}

	function pass_time_now($h,$m,$d){
		$m = $m + $h * 60;
		$h = $d - $m;
		$m = $h % 60;
		$h = (int)($h / 60);
		// echo $h.":".$m;
		if ( $h < 10 ) {
			echo '0'.$h;
		}else{
			echo $h;
		}
		echo ":";
		if ( $m < 10 ) {
			echo "0".$m;
		}else{
			echo $m;
		}
	}

	function get_contest_id_order_id_pro_id($conn,$oid,$cid){
		$sql = "SELECT problem_id FROM contest_information_2 WHERE contest_id='$cid' AND order_number='$oid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			return $row['problem_id'];
		}
		return '1000';
	}

	// 获取语言返回值
	function get_language_number($lan){
		if( $lan == "C" ){
			return 1;
		}else if ( $lan == "C++" ) {
			return 2;
		}else if ( $lan == "C++11" ) {
			return 3;
		}else if ( $lan == "C++14" ) {
			return 4;
		}else if ( $lan == "JAVA" ) {
			return 5;
		}
		return 0;
	}
?>