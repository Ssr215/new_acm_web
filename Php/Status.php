<?php
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
	function get_language($id){
		if ( $id == 1 ){
			return "GCC";
		}	
		if ( $id == 2 ) {
			return "G++";
		}
		if ( $id == 3 ){
			return "G++11";
		}
		if ( $id == 4 ){
			return "java";
		}
		return "connect error";
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
	function get_id_name($conn,$u_id){
		$sql = "SELECT * FROM user_information WHERE id = '$u_id'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			return $row['user_name'];
		}
		return "connect error";
	}
	function get_status_number($conn){
		$sql = "SELECT * FROM web_number_information WHERE id = '5'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			return $row['next_numbers'];
		}
		return 1;
	}
?>