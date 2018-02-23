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
?>