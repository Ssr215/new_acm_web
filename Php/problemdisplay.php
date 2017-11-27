<?php
	$pro_id = 1000;
	if (isset($_GET['pid'])) {
		$pro_id = $_GET['pid'];
	}
	$title = "connection fail!";
	$description = "nothing";
	$time_limit = 0;
	$memory_limit = 0;
	$time_limit_java = 0;
	$memory_limit_java = 0;
	$input = "no input";
	$output = "no output";
	$sample_input = "nothing";
	$sample_output = "nothing";
	$hint = "";
	$can_display = false;
	if( get_uesr_authority($conn,$GLOBALS['loading_username']) >= get_problem_authority($conn,$pro_id) ){
		$sql = "SELECT * FROM problem_information_1 WHERE pro_id = '$pro_id'";
		$result = mysqli_query($conn,$sql);
		if( !$result ){
			echo "Error: " . $sql . "<br>" . $conn->error;
		}else{
			while ($row = mysqli_fetch_array($result)) {
				$title = $row['title'];
				$time_limit = $row['time_limit'];
				$memory_limit = $row['memory_limit'];
				$time_limit_java = $row['time_limit_java'];
				$memory_limit_java = $row['memory_limit_java'];
				$input = $row['input'];
				$output = $row['output'];
			}
			$sql = "SELECT * FROM problem_information_2 WHERE pro_id='$pro_id'";
			$result = mysqli_query($conn,$sql);
			if( !$result ){
				echo "Error: " . $sql . "<br>" . $conn->error;
			}else{
				while ($row = mysqli_fetch_array($result)) {
					$description = $row['description'];
					$sample_input = $row['sample_input'];
					$sample_output = $row['sample_output'];
				}
				$sql = "SELECT * FROM problem_information_3 WHERE pro_id='$pro_id'";
				$result = mysqli_query($conn,$sql);
				if ( !$result ) {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}else{
					while ($row = mysqli_fetch_array($result)) {
						$hint = $row['hint'];
					}
				}
			}
		}
	}else{
		$can_display = true;
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