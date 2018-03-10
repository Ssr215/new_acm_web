<?php
	// 传入cid和pid判断是否存在对应的cid->pid，存在返回true,否则返回false
	function is_ok_pid($conn,$cid,$pid){
		$sql = "SELECT problem_number FROM contest_information_1 WHERE contest_id = '$cid'";
		$result = mysqli_query($conn,$sql);
		$ans = 0;
		while ( $row = mysqli_fetch_array($result) ) {
			$ans = $row['problem_number'];
		}
		if ( $pid <= $ans && $pid > 0 ) {
			return true;
		}
		return false;
	}
	// 获取并更新cid和pid对应的线上test数目
	function get_contest_problem_test_id($conn,$cid,$pid){
		$sql = "SELECT id,test_number FROM contest_information_2 WHERE contest_id = '$cid' AND order_number = '$pid'";
		$result = mysqli_query($conn,$sql);
		$tid = 0;
		$id = 0;
		while ( $row = mysqli_fetch_array($result) ) {
			$tid = $row['test_number'];
			$id = $row['id'];
		}
		if ( $id == 0 ) {
			return 0;
		}
		$sql = "UPDATE contest_information_2 SET test_number = test_number + 1 WHERE id = '$id'";
		mysqli_query($conn,$sql);
		return $tid;
	}
	// 获取cid和pid对应的线上test数目,不更新
	function get_contest_problem_test_id_no_update($conn,$cid,$pid){
		$sql = "SELECT id,test_number FROM contest_information_2 WHERE contest_id = '$cid' AND order_number = '$pid'";
		$result = mysqli_query($conn,$sql);
		$tid = 0;
		$id = 0;
		while ( $row = mysqli_fetch_array($result) ) {
			$tid = $row['test_number'];
			$id = $row['id'];
		}
		if ( $id == 0 ) {
			return 0;
		}
		return $tid;
	}
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
	function get_time_add($begin_time,$duration){
		$catime = date('Y-m-d',strtotime($begin_time . " + " . $duration . " minute"));
		$patime = date('H:i:s',strtotime($begin_time . " + " . $duration . " minute"));
		return $catime."T".$patime;
	}
	// 检查是否存在cid,pid记录，存在返回true，否则返回false
	function ck_isset_recording_of_cid_oid($conn,$cid,$pid){
		$sql = "SELECT id FROM contest_information_2 WHERE contest_id = '$cid' AND order_number = '$pid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			return true;
		}
		return false;
	}
	// 创建绝对路径目录
	function install_file_on_path($path){
		if (!file_exists($path)) {
			mkdir($file_path);
			echo "create folder success";
		}else{
			echo "have folder on ".$path;
		}
	}
	// 获取当前竞赛已经有多少账号，返回为当前的账号数，没有为0
	function get_contest_id_have_any_accounts($conn,$cid){
		$sql = "SELECT COUNT(1) FROM contest_information_3 WHERE contest_id = '$cid'";
		$result = mysqli_query($conn,$sql);
		list($ans) = $result->fetch_row();
		return $ans;
	}
	// 生成长度为12位的随机密码(密码包含大小写字母和数字，不包含其他符号)
	function have_new_password(){
		$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		$password = "";
		for ($i=0; $i < 12; $i++) { 
			$password .= substr($str, have_rand(0,61), 1);
		}
		return $password;
	}
	// 创建比赛专用账号,创建成功返回true，否则返回false
	function create_new_accounts($conn,$u_id,$u_name,$n_name,$password,$cid){
		$now_time = date("Y-m-d H:i:s");
		$password = md5(md5(md5(get_encryption($password))));
		$sql = "INSERT INTO user_information (id,user_name,nike_name,password,authority,register_time,last_loading_time,cid_allow) VALUES ('$u_id','$u_name','$n_name','$password','1','$now_time','$now_time','$cid')";
		if ( mysqli_query($conn,$sql) ) {
			return true;
		}else{
			return false;
		}
	}
	// 获取cid下是否存在pid/oid的测试用例 , 存在返回true ,否则返回false
	function ck_ok_cid_pid_oid($conn,$cid,$pid,$oid){
		if ( is_ok_pid($conn,$cid,$pid) ) {
			$t_num = get_contest_problem_test_id_no_update($conn,$cid,$pid);
			if ( $oid <= $t_num && $oid >= 1 ) {
				return true;
			}
		}
		return false;
	}
?>