<?php
	// 查询problem id 是否允许huck
	function allow_huck_problem_id($conn,$pid){
		$sql = "SELECT allow_huck FROM problem_information_4 WHERE pro_id='$pid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			if ( $row['allow_huck'] == 1 ) {
				return true;
			}
		}
		return false;
	}
	// 查询status id与problem id是否对应并且检查其提交结果是否为ac
	function allow_huck_status_id($conn,$sid,$pid){
		$sql = "SELECT result FROM pro_submit WHERE id='$sid' AND pro_id='$pid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			if ( $row['result'] == 1 ) {
				// echo "find it";
				return true;
			}
		}
		echo $row;
		echo $sid." and ". $pid;
		return false;
	}
	// 获取当前用户的id
	function get_user_id($conn,$u_name){
		$u_id = -1;
		$sql = "SELECT id FROM user_information WHERE user_name = '$u_name'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$u_id = $row['id'];
		}
		return $u_id;
	}
	// 获取huck用户的用户名
	function get_hucker_id($conn,$sid){
		$sql = "SELECT user_id FROM pro_submit WHERE id='$sid'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			return $row['user_id'];
		}
		return -1;
	}
	// 获取id对应用户名
	function get_id_name($conn,$u_id){
		$sql = "SELECT * FROM user_information WHERE id = '$u_id'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			return $row['user_name'];
		}
		return "connect error";
	}
	function get_huck_number($conn){
		$sql = "SELECT COUNT(1) FROM huck_submit";
		$result = mysqli_query($conn,$sql);
		// echo $result;
		list($ans) = $result->fetch_row();
		return $ans;
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
	function get_color_of_result($r){
		if ($r == 1) {
			echo "result_ACcolor";
		}else if ($r == 0) {
			echo "result_RUNcolor";
		}else{
			echo "result_ERcolor";
		}
	}
?>