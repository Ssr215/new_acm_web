<?php
	// 获取当前题库题目数目
	function get_problem_number($conn){
		$sql = "SELECT COUNT(1) FROM problem_information_3";
		$result = mysqli_query($conn,$sql);
		// echo $result;
		list($ans) = $result->fetch_row();
		return $ans;
	}

	// 获取题目权限
	function get_problem_authority($conn,$pid){
		$sql = "SELECT pro_id,authority FROM problem_information_3 WHERE pro_id='$pid'";
		$pau = 9;
		$result = mysqli_query($conn,$sql);
		if ( !$result ) {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}else{
			while ($row = mysqli_fetch_array($result)) {
				$pau = $row['authority'];
			}
		}
		return $pau;
	}
?>