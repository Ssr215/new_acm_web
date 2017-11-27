<?php
	// 获取当前题库题目数目
	function get_problem_number($conn){
		$sql = "SELECT COUNT(1) FROM problem_information_3";
		$result = mysqli_query($conn,$sql);
		// echo $result;
		list($ans) = $result->fetch_row();
		return $ans;
	}
?>