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
	// 获取pid的问题名字
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
	// 获取当前实践AC题目的分值
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
	// 获取contest_id为cid下排序为oid的题目真实id
	function get_contest_id_order_id_pro_id($conn,$oid,$cid){
		$sql = "SELECT problem_id FROM contest_information_2 WHERE contest_id='$cid' AND order_number='$oid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			return $row['problem_id'];
		}
		return '1000';
	}
	function get_contest_id_order_id_pro_id_name($conn,$oid,$cid){
		$sql = "SELECT problem_id,change_problem_name FROM contest_information_2 WHERE contest_id='$cid' AND order_number='$oid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			if ( $row['change_problem_name'] == "" ) {
				return get_problem_name($conn,$row['problem_id']);
			}
			return $row['change_problem_name'];
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
	// 检查用户是否锁题 , 已经所以返回true , 否则返回false
	function ck_lock_problem($conn,$cid,$pid,$uid){
		$sql = "SELECT lock_problem FROM contest_ranks_information_1 WHERE user_id='$uid' AND contest_id = '$cid' AND pass_problem_id = '$pid'";
		$result = mysqli_query($conn,$sql);
		$ans = 0;
		while ( $row = mysqli_fetch_array($result) ) {
			$ans = $row['lock_problem'];
		}
		return $ans == 1;
	}
	// 检查用户登录id与要查看代码的提交id下的用户id是否一致（即sid的提交是不是uid提交的），是返回true ， 否则返回false
	function ck_contest_status_id_and_user_id($conn,$uid,$sid){
		$sql = "SELECT user_id FROM contest_pro_submit WHERE id = '$sid'";
		$result = mysqli_query($conn,$sql);
		$yid = -10086;
		while ( $row = mysqli_fetch_array($result) ) {
			$yid = $row['user_id'];
		}
		return $yid == $uid;
	}
	// 获取sid的提交用户的id
	function get_sid_user_id($conn,$sid){
		$sql = "SELECT user_id FROM contest_pro_submit WHERE id = '$sid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			return $row['user_id'];
		}
		return -1;
	}
	function get_user_id($conn,$u_name){
		$u_id = -1;
		$sql = "SELECT * FROM user_information WHERE user_name = '$u_name'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$u_id = $row['id'];
		}
		return $u_id;
	}

	// 此处获取用户是否是参赛选手的判定中，只要contest没有用户限定，任何人都可以参赛，不过后期应该会改成只有注册比赛的选手才能参加比赛,是参赛选手返回1，否则返回0
	function get_is_it_a_competitor($conn,$u_name,$cid){
		$sql = "SELECT limit_par FROM contest_information_1 WHERE contest_id='$cid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			if ( $row['limit_par'] == 0 ) {
				return 1;
			}
		}
		$sql = "SELECT cid_allow FROM user_information WHERE user_name = '$u_name'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			if ( $row['cid_allow'] == $cid ) {
				return 1;
			}
		}
		return 0;
	}
	// 此处获取登录的管理员是否是本次的参赛者，如果是参赛者，则无权限管理 (授予8级与9级超级管理员特权，可以参赛并管理)
	// 此处返回的是是否可以管理本场竞赛，如果可以返回false，否则返回true
	function get_administrator_is_it_a_competitor($conn,$u_name,$cid){
		$au =  get_uesr_authority($conn,$u_name);
		if ( $au >= 8 ) {
			return false;
		}
		if ( $au == 7 ) {
			return 1 == get_is_it_a_competitor($conn,$u_name,$cid);
		}
		return true;
	}
	// 获取参赛选手可见($flag = 1)/管理员可见($flag = 0)的提交数目
	function get_cstatus_number($conn,$flag,$cid){
		if ( $flag == 0 ) {
			$sql = "SELECT COUNT(1) FROM contest_pro_submit WHERE contest_id='$cid'";
		}else{
			$sql = "SELECT COUNT(1) FROM contest_pro_submit WHERE contest_id='$cid' AND competitor = 1";
		}
		$result = mysqli_query($conn,$sql);
		// echo $result;
		list($ans) = $result->fetch_row();
		return $ans;
	}
	// 获取用户是否锁题 , 是返回true , 否则返回false
	function get_user_locking_problem($conn,$cid,$uid,$pid){
		$sql = "SELECT lock_problem FROM contest_ranks_information_1 WHERE user_id = '$uid' AND contest_id = '$cid' AND pass_problem_id = '$pid'";
		$flag = false;
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			$flag = ($row['lock_problem'] == 1);
		}
		return $flag;
	}
	// 获取提交是否可huck , 如果可以返回true , 否则返回false
	function get_huck_allow_in_sid($conn,$cid,$pid){
		$pro_id = get_contest_id_order_id_pro_id($conn,$pid,$cid);
		$sql = "SELECT allow_huck FROM problem_information_4 WHERE pro_id='$pro_id'";
		$result = mysqli_query($conn,$sql);
		$flag = false;
		while ( $row = mysqli_fetch_array($result) ) {
			$flag = ($row['allow_huck'] == 1);
		}
		return $flag;
	}
	function get_verdict($id){
		if ($id == 0) {
			return "in queue";
		}
		if ($id == 1) {
			return "Accepted";
		}
		if ($id == 2) {
			return "Presentatior Error";
		}
		if ($id == 8) {
			return "Complie error";
		}
		if ($id == -1) {
			return "hucked";
		}
		if ($id == 11) {
			return "Passed pretests";
		}
		$t_id = 0;
		$p2 = "";
		if ($id >= 2000) {
			$t_id = $id % 1000;
			$p2 = " on test " . $t_id;
			$id = (int)($id / 1000);
		}
		$p1 = "";
		if ($id == 2) {
			$p1 = "Presentatior Error";
		}elseif ($id == 3) {
			$p1 = "Output Limit";
		}elseif ($id == 4) {
			$p1 = "Runtime Error";
		}elseif ($id == 5) {
			$p1 = "Memory Limit Exceeded";
		}elseif ($id == 6) {
			$p1 = "Time Limit Exceeded";
		}elseif ($id == 7) {
			$p1 = "Wrong Answer";
		}elseif ($id == 9) {
			$p1 = "runing";
		}
		return $p1. "" . $p2;
	}
	function get_languages($id){
		if ( $id == 1 ){
			return "C";
		}	
		if ( $id == 2 ) {
			return "C++";
		}
		if ( $id == 3 ){
			return "C++";
		}
		if ( $id == 4 ){
			return "java";
		}
		return "C++";
	}
	function get_color_of_result($number){
		if ($number == 1 OR $number == 11) {
			echo "result_ACcolor";
		}else if ( $number == 2 ) {
			echo "result_PEcolor";
		}else if ($number == 0 OR $number >= 9000) {
			echo "result_RUNcolor";
		}else{
			echo "result_ERcolor";
		}
	}
	function get_id_name($conn,$u_id){
		$sql = "SELECT * FROM user_information WHERE id = '$u_id'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			return $row['user_name'];
		}
		return "connect error";
	}
	function get_result($r){
		if ( $r == 1 ) {
			echo "Successful hacking attempt";
		}else if ( $r == 2 ) {
			echo "Unsuccessful hacking attempt";
		}else if ( $r == 3 ) {
			echo "Illegal data";
		}else{
			echo "in queue";
		}
	}
	function get_color_of_result_huck($r){
		if ($r == 1) {
			echo "result_ACcolor";
		}else if ($r == 0) {
			echo "result_RUNcolor";
		}else{
			echo "result_ERcolor";
		}
	}
?>